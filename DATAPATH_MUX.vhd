----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:17:18 09/20/2023 
-- Design Name: 
-- Module Name:    DATAPATH_MUX - mux_arch 
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
entity mux2 is
    Port ( S : in  STD_LOGIC;
           D0 : in  STD_LOGIC_VECTOR(7 downto 0);
           D1 : in  STD_LOGIC_VECTOR(7 downto 0);
           Y : out  STD_LOGIC_VECTOR(7 downto 0));
end mux2;
architecture mux_arch of mux2 is
begin
	process(S, D1, D0)
	begin
		if(S = '0')then
			Y <= D0;
		else
			Y <= D1;
		end if;
	end process;
end mux_arch;

