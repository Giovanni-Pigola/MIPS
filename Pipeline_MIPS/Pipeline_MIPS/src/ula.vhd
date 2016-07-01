library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ula is
	port(s_op0: in std_logic;
	e_2521, e_2016: in std_logic_vector(31 downto 0);
	saida: out std_logic_vector(31 downto 0)
	);
	
end ula;

architecture behavior of ula is
begin  
	ulas: process (s_op0)
	begin
		if(s_op0='1') then
			saida <= e_2521-e_2016;
		else
			saida<= e_2521+e_2016;
		end if;

	end process;
end behavior;