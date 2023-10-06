----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:52:03 09/20/2023 
-- Design Name: 
-- Module Name:    DATAPATH_ALU - alu_arch 
-- Project Name: 
-- Target Devices: 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity alu is
    Port ( ALUSel : in  STD_LOGIC_VECTOR(2 downto 0);
           A : in  STD_LOGIC_VECTOR(7 downto 0);
           B : in  STD_LOGIC_VECTOR(7 downto 0);
           F : out  STD_LOGIC_VECTOR(7 downto 0));
end alu;
architecture alu_arch of alu is
begin
	process(ALUSel, A, B)
	begin
		CASE ALUSel is
			WHEN "000" =>
				F <= A;
			WHEN "001" =>
				F <= A AND B;
			WHEN "010" =>
				F <= A OR B;
			WHEN "011" =>
				F <= NOT A;
			WHEN "100" =>
				F <= A + B;
			WHEN "101" =>
				F <= A - B;
			WHEN "110" =>
				F <= A + 1;
			WHEN others =>
				F <= A - 1;
		end case;
	end process;
end alu_arch;

