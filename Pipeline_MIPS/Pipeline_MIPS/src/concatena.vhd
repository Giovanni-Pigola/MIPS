library ieee;
use ieee.std_logic_1164.all;  
use ieee.std_logic_unsigned.all;

entity concatena is
	port(entrada: in std_logic_vector(15 downto 0);
		saida: out std_logic_vector(31 downto 0));
end concatena;				

architecture behavior of concatena is
begin	
	
   saida<="0000000000000000"&entrada;

end behavior;