library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Contador is
	port(clk, rst,en: in std_logic;
	numero: out std_logic_vector (7 downto 0));
end Contador;

architecture Behavioral of COntador is
signal ea,es,aux: std_logic_vector(7 downto 0);
begin	
	secuencial: process (clk,rst)
	begin
		if(rst='1')then
			ea<="00000000";
			end if;
		if (clk'event and clk='1' and rst='0') then
			ea<=es;
		end if;
		end process secuencial;
	combinacional: process(clk,en)
	begin  
		if(en='1') then
			if(ea="11111111") then
			  es<="00000000";
		    else
			es<=ea + 1;	   	 
				end if;
		else   
			es<=ea;
		end if;	   	 
		numero<=ea;
		end process combinacional;
		
			
end Behavioral;
