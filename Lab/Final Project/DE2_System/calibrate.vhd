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

entity calibrate is 
	port(
		data			   : in std_logic_vector(15 downto 0);		--Raw digital value in
		x_coord 			: in std_logic_vector(8 downto 0);		--X coordinate in
		y_coord 			: in std_logic_vector(7 downto 0);		--Y coordinate in
		gain			   : in std_logic_vector(15 downto 0);		--Digital Gain Correction
		offset			: in std_logic_vector(15 downto 0);		--Digital Offset Correction
		x_pixel			: out std_logic_vector(8 downto 0);	--Data bus from memory
		y_pixel			: out std_logic_vector(7 downto 0);	--Address bus to memory
		data_cal			: out std_logic_vector(15 downto 0)	--Calibrated digital value out
		);
end entity calibrate;

architecture arch_calibrate of calibrate is

signal temp_offset 	 		: std_logic_vector(15 downto 0);
signal temp_gain   	 		: std_logic_vector(15 downto 0);
signal temp_data	    		: std_logic_vector(15 downto 0);
signal temp_adjust	  		: std_logic_vector(31 downto 0);


begin

	temp_data  		<= data;
	temp_offset 	<= offset;
	temp_gain	  	<= gain;
	
	x_pixel	 	 	<= x_coord;
	
	y_pixel  	 	<= y_coord;
	
	temp_adjust 	<= (temp_data * temp_gain);
	
	data_cal  	 	<= temp_data - temp_adjust(15 downto 0) - temp_offset;						-- Dc = D - (D*G(T)) - N(T)
	
end arch_calibrate;

