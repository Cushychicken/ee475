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
use IEEE.NUMERIC_STD.ALL;

entity calibrate is 
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
end entity calibrate;

architecture arch_calibrate of calibrate is

constant y_offset 			: integer := 324;

signal int_offset 	 		: integer range 0 to 65535;
signal int_gain   	 		: integer range 0 to 65535;
signal int_x					: integer range 0 to 511;
signal int_y					: integer range 0 to 255;				
signal int_data	    		: integer range 0 to 65535;
signal int_data_cal	    	: integer range 0 to 65535;
signal int_mem_offset	   : integer range 0 to 16777216;
signal int_mem_product		: integer range 0 to 2147483647;
signal int_gain_product		: integer range 0 to 2147483647;

begin
	int_data 			<= to_integer(unsigned(data));
	int_offset 			<= to_integer(unsigned(offset));
	int_gain	  			<= to_integer(unsigned(gain));
	int_x					<= to_integer(unsigned(x_coord));
	int_y					<= to_integer(unsigned(y_coord));
	
	int_mem_product	<= (int_y * y_offset);
	int_gain_product	<=	(int_data*int_gain);
	int_data_cal  		<= int_data + int_gain_product + int_offset;						-- Dc = D - (D*G(T)) - N(T)
	int_mem_offset		<= int_mem_product + int_x;
	
	mem_product			<= std_logic_vector(to_unsigned(int_mem_product, 32));
	gain_product		<= std_logic_vector(to_unsigned(int_gain_product, 32));
	mem_offset			<= std_logic_vector(to_unsigned(int_mem_offset, 24));
	data_cal				<= std_logic_vector(to_unsigned(int_data_cal, 16));
	
end arch_calibrate;

