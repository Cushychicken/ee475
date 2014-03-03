----------------------------------------------------------------------------------
-- Company:          Montana State University
-- Author/Engineer:	 Ross Snider 
-- 
-- Create Date:    14:17:04 10/06/2009 
-- Design Name: 
-- Module Name:    pwm - Behavioral 
-- Project Name: 
-- Target Devices: DE2 board
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity calibrate_avalon is
	port (
		clk 			    	: in std_logic;
		reset_n 		    	: in std_logic;
		
		-- Avalon fabric I/O
		avs_s1_write 		: in std_logic;
		avs_s1_read 		: in std_logic;
		avs_s1_address 	: in std_logic_vector(3 downto 0);
		avs_s1_writedata 	: in std_logic_vector(31 downto 0);
		avs_s1_readdata 	: out std_logic_vector(31 downto 0)
	);
end calibrate_avalon;

architecture arch_calibrate_avalon of calibrate_avalon is

	component calibrate 
		port(
			data			   : in std_logic_vector(15 downto 0);		--Raw digital value in
			x_coord 			: in std_logic_vector(8 downto 0);		--X coordinate in
			y_coord 			: in std_logic_vector(7 downto 0);		--Y coordinate in
			gain			   : in std_logic_vector(15 downto 0);		--Digital Gain Correction
			offset			: in std_logic_vector(15 downto 0);		--Digital Offset Correction
			mem_offset		: out std_logic_vector(23 downto 0);	--Data bus from memory
			data_cal			: out std_logic_vector(15 downto 0);	--Calibrated digital value out
			mem_product		: out std_logic_vector(31 downto 0);	--Product of y_offset and y_coord
			gain_product	: out std_logic_vector(31 downto 0)		--Product of data and gain	
		);
	end component;

	-- Avalon signals
	signal clk_s			: std_logic;
	signal wr_en			: std_logic;									-- Write enable from Avalon fabric
	signal re_en			: std_logic;									-- Read enable from Avalon fabric
	signal addr 			: std_logic_vector(3 downto 0);			-- Address of registers on component
	
	-- Calibrate signals
	signal data_av		    	 	: STD_LOGIC_VECTOR (15 downto 0);   -- Data in signal to calibration block 
	signal x_coord_av		    	: STD_LOGIC_VECTOR (8 downto 0); 	-- X_coordinate in signal
	signal y_coord_av		    	: STD_LOGIC_VECTOR (7 downto 0); 	-- Y_coordinate in signal 
	signal gain_av			    	: STD_LOGIC_VECTOR (15 downto 0); 	-- Gain in value
	signal offset_av		    	: STD_LOGIC_VECTOR (15 downto 0); 	-- Offset in value
	signal mem_offset_av		 	: STD_LOGIC_VECTOR (23 downto 0); 	-- Memory offset from first gain/offset value
	signal data_cal_av		 	: STD_LOGIC_VECTOR (15 downto 0); 	-- Calibrated data output
	signal mem_product_av		: STD_LOGIC_VECTOR (31 downto 0);	
	signal gain_product_av		: STD_LOGIC_VECTOR (31 downto 0);

begin

	-- Avalon signal assingments
	wr_en 	 	<= avs_s1_write;		-- Write enable
	re_en	  		<= avs_s1_read;			-- Read enable
	addr 			<= avs_s1_address;		-- Address input
	clk_s			<= clk;
	
	---------------------------------------------------
	-- Writing data to addresses 0-2, 4-5
	---------------------------------------------------
	process (clk_s)
	begin
		if 	clk_s'event and clk_s='0' and wr_en='1' and addr="0000" then  -- Writing to Data register (address 0)
			data_av 		<= avs_s1_writedata(15 downto 0);
		elsif clk_s'event and clk_s='0' and wr_en='1' and addr="0001" then	-- Writing to X coord register (address 1)
			x_coord_av 	<= avs_s1_writedata(8 downto 0);
		elsif clk_s'event and clk_s='0' and wr_en='1' and addr="0010" then  -- Writing to Y coord register (address 2)
			y_coord_av 	<= avs_s1_writedata(7 downto 0);
		elsif clk_s'event and clk_s='0' and wr_en='1' and addr="0100" then  -- Writing to Gain register (address 4)
			gain_av 		<= avs_s1_writedata(15 downto 0);
		elsif clk_s'event and clk_s='0' and wr_en='1' and addr="0101" then  -- Writing to Offset register (address 5)
			offset_av 	<= avs_s1_writedata(15 downto 0);
		end if;
	end process;

	---------------------------------------------------
	-- Reading data from addresses 0-6
	---------------------------------------------------
	
--	process (clk_s)
--	begin
--		if 	clk_s'event and clk_s='0' and re_en='1' and addr="0000" then			-- Reading from Data register (address 0)
--			avs_s1_readdata	<= (x"0000" & data_av);
--		elsif clk_s'event and clk_s='0' and re_en='1' and addr="0001" then			-- Reading from X coord register (address 1)
--			avs_s1_readdata	<= ("00000000000000000000000" & x_coord_av);
--		elsif clk_s'event and clk_s='0' and re_en='1' and addr="0010" then			-- Reading from Y coord register (address 2)
--			avs_s1_readdata	<= ("000000000000000000000000" & y_coord_av);
--		elsif clk_s'event and clk_s='0' and re_en='1' and addr="0011" then			-- Reading from Mem_offset register (address 3)
--			avs_s1_readdata	<= ("00000000" & mem_offset_av);
--		elsif clk_s'event and clk_s='0' and re_en='1' and addr="0100" then			-- Reading from Gain register (address 4)
--			avs_s1_readdata	<= (x"0000" & gain_av);
--		elsif clk_s'event and clk_s='0' and re_en='1' and addr="0101" then			-- Reading from Offset register (address 5)
--			avs_s1_readdata	<= (x"0000" & offset_av);
--		elsif clk_s'event and clk_s='0' and re_en='1' and addr="0110" then			-- Reading from Data_cal register (address 6)
--			avs_s1_readdata	<= (x"0000" & data_cal_av);
--		elsif clk_s'event and clk_s='0' and re_en='1' and addr="0111" then			-- Reading from Mem_product register (address 7)
--			avs_s1_readdata	<= mem_product_av;
--		elsif clk_s'event and clk_s='0' and re_en='1' and addr="1000" then			-- Reading from Gain_product register (address 8)
--			avs_s1_readdata	<= gain_product_av;
--		end if;
--	end process;
	
	process (clk_s)
	begin
		if clk_s'event and clk_s='0' and re_en='1' then
			case addr is
				when "0000" => 
					avs_s1_readdata <= (x"0000" & data_av);
				when "0001" => 
					avs_s1_readdata	<= ("00000000000000000000000" & x_coord_av);
				when "0010" =>
					avs_s1_readdata	<= ("000000000000000000000000" & y_coord_av);
				when "0011" =>
					avs_s1_readdata	<= ("00000000" & mem_offset_av);
				when "0100" =>
					avs_s1_readdata	<= (x"0000" & gain_av);
				when "0101" =>
					avs_s1_readdata	<= (x"0000" & offset_av);
				when "0110" => 
					avs_s1_readdata	<= (x"0000" & data_cal_av);
				when "0111" =>
					avs_s1_readdata	<= mem_product_av;
				when "1000" => 
					avs_s1_readdata	<= gain_product_av;
				when others =>
					avs_s1_readdata   <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
			end case;
		end if;
	end process;
					
	---------------------------------------------------
	-- instantiate calibration block
	---------------------------------------------------
	calibrate1 : calibrate Port Map ( 
			   data           => data_av,
			   x_coord        => x_coord_av,
			   y_coord        => y_coord_av,
			   gain	         => gain_av,
			   offset	      => offset_av,
			   mem_offset		=> mem_offset_av,
			   data_cal       => data_cal_av,
				mem_product		=>	mem_product_av,
				gain_product	=> gain_product_av
	);

end architecture;



