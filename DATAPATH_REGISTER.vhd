----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:27:03 09/20/2023 
-- Design Name: 
-- Module Name:    DATAPATH_REGISTER - register_arch 
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
use IEEE.STD_LOGIC_ARITH.ALL;
entity regfile is
    Port ( CLK : in  STD_LOGIC;
           WE : in  STD_LOGIC;
           WA : in  STD_LOGIC_VECTOR(1 downto 0);
           INPUT : in  STD_LOGIC_VECTOR(7 downto 0);
           RAE : in  STD_LOGIC;
           RAA : in  STD_LOGIC_VECTOR(1 downto 0);
           RBE : in  STD_LOGIC;
           RBA : in  STD_LOGIC_VECTOR(1 downto 0);
           Aout : out  STD_LOGIC_VECTOR(7 downto 0);
           Bout : out  STD_LOGIC_VECTOR(7 downto 0)
			  );
end regfile;
architecture register_arch of regfile is
	SUBTYPE reg is STD_LOGIC_VECTOR(7 downto 0);
	TYPE regArray is array(0 TO 3) OF reg;
	SIGNAL RF: regArray;
begin
	WritePort: PROCESS (CLK)
	begin
		if (CLK'EVENT AND CLK = '1') then
			if (WE = '1') then
				RF(CONV_INTEGER(WA)) <= input;
			end if;
		end if;
	end process;
	ReadPortA: PROCESS (RAE, RAA)
	BEGIN
		if (RAE = '1') then
			Aout <= RF(CONV_INTEGER(RAA)); 
		else
			Aout <= (others => 'Z');
		end if;
	end process;
	ReadPortB: PROCESS (RBE, RBA)
	BEGIN
		if (RBE = '1') then
			Aout <= RF(CONV_INTEGER(RBA)); 
		else
			Aout <= (others => 'Z');
		end if;
	end process;
end register_arch;
