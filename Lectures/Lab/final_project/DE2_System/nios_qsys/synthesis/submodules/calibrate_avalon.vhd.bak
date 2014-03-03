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
		avs_s1_address 	: in std_logic_vector(1 downto 0);
		avs_s1_writedata 	: in std_logic_vector(31 downto 0);
		avs_s1_readdata 	: out std_logic_vector(31 downto 0);
		
		-- Exported I/O
		x_coord 				: in std_logic_vector(8 downto 0);		--X coordinate in
		y_coord 				: in std_logic_vector(7 downto 0);		--Y coordinate in
		data			   	: in std_logic_vector(15 downto 0);		--Raw digital value in
		data_cal 			: out std_logic_vector(15 downto 0)   --Calibrated digital output
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
			x_pixel			: out std_logic_vector(8 downto 0);		--Data bus from memory
			y_pixel			: out std_logic_vector(7 downto 0);		--Address bus to memory
			data_cal			: out std_logic_vector(15 downto 0)		--Calibrated digital value out
		);
	end component;

	-- Avalon signals
	signal clk_s			: std_logic;
	signal wr_en			: std_logic;									-- Write enable from Avalon fabric
	signal re_en			: std_logic;									-- Read enable from Avalon fabric
	signal addr 			: std_logic_vector(1 downto 0);			-- Address of registers on component
	
	-- Calibrate signals
	signal data_av		    	 : STD_LOGIC_VECTOR (15 downto 0);  -- Data in signal to calibration block 
	signal x_coord_av		    : STD_LOGIC_VECTOR (8 downto 0); 	-- X_coordinate in signal
	signal y_coord_av		    : STD_LOGIC_VECTOR (7 downto 0); 	-- Y_coordinate in signal 
	signal gain_av			    : STD_LOGIC_VECTOR (15 downto 0); 	-- Gain in value
	signal offset_av		    : STD_LOGIC_VECTOR (15 downto 0); 	-- Offset in value
	signal x_pixel_av		 	 : STD_LOGIC_VECTOR (15 downto 0); 	-- Address of gain value
	signal y_pixel_av			 : STD_LOGIC_VECTOR (15 downto 0); 	-- Address of offsest value
	signal data_cal_av		 : STD_LOGIC_VECTOR (15 downto 0); 	-- Calibrated data output

begin

	-- Avalon signal assingments
	wr_en 	 	<= avs_s1_write;		-- Write enable
	re_en	  		<= avs_s1_read;			-- Read enable
	addr 			<= avs_s1_address;		-- Address input
	clk_s			<= clk;
	
	-- Exported signals
	data_cal	<= data_cal_av;
	
	---------------------------------------------------
	-- Latch out gain word (address 0)
	---------------------------------------------------
	process (clk_s)
	begin
		if clk'event and clk='0' and wr_en='1' and addr="00" then
			gain_av <= avs_s1_writedata(15 downto 0);
		end if;
	end process;
	
	---------------------------------------------------
	-- Latch in x pixel(address 1)
	---------------------------------------------------
	process (clk_s)
	begin
		if clk'event and clk='0' and re_en='1' and addr="01" then
			 avs_s1_readdata <= ("00000000000000000000000" & x_pixel_av);
		end if;
	end process;
	
	---------------------------------------------------
	-- Latch out offset word (address 2)
	---------------------------------------------------
	process (clk_s)
	begin
		if clk'event and clk='0' and wr_en='1' and addr="10" then
			offset_av <= avs_s1_writedata(15 downto 0);
		end if;
	end process;

	---------------------------------------------------
	-- Latch in y_pixel (address 3)
	---------------------------------------------------
	process (clk_s)
	begin
		if clk'event and clk='0' and re_en='1' and addr="11" then
			 avs_s1_readdata <= ("000000000000000000000000" & y_pixel_av);
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
			   x_pixel		   => x_pixel_av,
			   y_pixel		   => y_pixel_av,
			   data_cal       => data_cal_av
	);

end arch_calibrate_avalon;



