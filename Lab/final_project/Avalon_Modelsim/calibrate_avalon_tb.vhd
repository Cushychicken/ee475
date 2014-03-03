----------------------------------------------------------------------------------
--
-- Company:          Montana State University
-- Author/Engineer:  Nash Reilly
--
-- Create Date:      09/19/2011
-- Design Name:      sr_design
-- Module Name:      fifo_structure 
-- Target Devices:   Altera DE2 Evaluation Board
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity calibrate_avalon_tb is 
end entity calibrate_avalon_tb;

architecture arch of calibrate_avalon_tb is

constant t_clk_per    : time := 10 ns;
constant t_reset      : time := t_clk_per * 2;

signal clk_tb                 : std_logic;
signal reset_tb               : std_logic;          

signal avs_s1_write_tb        : std_logic;
signal avs_s1_read_tb         : std_logic;
signal avs_s1_address_tb      : std_logic_vector(3 downto 0);
signal avs_s1_writedata_tb    : std_logic_vector(31 downto 0);
signal avs_s1_readdata_tb     : std_logic_vector(31 downto 0);

component calibrate_avalon is
	port (
		clk 			    	      : in std_logic;
		reset_n 		    	   : in std_logic;
		
		-- Avalon fabric I/O
		avs_s1_write 	   	: in std_logic;
		avs_s1_read 		    : in std_logic;
		avs_s1_address   	: in std_logic_vector(3 downto 0);
		avs_s1_writedata 	: in std_logic_vector(31 downto 0);
		avs_s1_readdata 	 : out std_logic_vector(31 downto 0)
	);
end component;

begin

  u0 : calibrate_avalon port map
     (
     clk              => clk_tb,
     reset_n          => reset_tb,
     avs_s1_write     => avs_s1_write_tb,
     avs_s1_read      => avs_s1_read_tb,
     avs_s1_address   => avs_s1_address_tb,
     avs_s1_writedata => avs_s1_writedata_tb,
     avs_s1_readdata  => avs_s1_readdata_tb
	   );
	
	clock_stim : process
	   begin
	     clk_tb <= '1';
       wait for t_clk_per;
	     clk_tb <= '0';
	     wait for t_clk_per;
	   end process;
	   
	write_then_read_stim : process
	   begin
	     avs_s1_write_tb      <= '1';
	     avs_s1_read_tb   <= '0';
	     avs_s1_address_tb    <= "0000";
	     avs_s1_writedata_tb  <= x"0000000A";
	     wait for (2*t_clk_per);
	     avs_s1_write_tb    <= '1';
	     avs_s1_read_tb   <= '0';
	     avs_s1_address_tb <= "0001";
	     avs_s1_writedata_tb  <= x"00000001";
	     wait for (2*t_clk_per);
	     avs_s1_write_tb    <= '1';
	     avs_s1_read_tb   <= '0';
	     avs_s1_address_tb <= "0010";
	     avs_s1_writedata_tb  <= x"00000001";
	     wait for (2*t_clk_per);
	     avs_s1_write_tb    <= '1';
	     avs_s1_read_tb   <= '0';
	     avs_s1_address_tb <= "0100";
	     avs_s1_writedata_tb  <= x"00000002";
	     wait for (2*t_clk_per);
	     avs_s1_write_tb    <= '1';
	     avs_s1_read_tb   <= '0';
	     avs_s1_address_tb <= "0101";
	     avs_s1_writedata_tb  <= x"00000001";
	     wait for (2*t_clk_per);
	     avs_s1_write_tb  <= '0';
	     avs_s1_read_tb   <= '1';
	     avs_s1_address_tb <= "0011";
	     wait for (4*t_clk_per);
	     avs_s1_write_tb  <= '0';
	     avs_s1_read_tb   <= '1';
	     avs_s1_address_tb <= "0110";
	     wait for (4*t_clk_per);
	     avs_s1_write_tb  <= '0';
	     avs_s1_read_tb   <= '1';
	     avs_s1_address_tb <= "0111";
	     wait for (4*t_clk_per);
	     avs_s1_write_tb  <= '0';
	     avs_s1_read_tb   <= '1';
	     avs_s1_address_tb <= "1000";
	     wait for (4*t_clk_per);
	   end process;
	
	
	
end architecture;
