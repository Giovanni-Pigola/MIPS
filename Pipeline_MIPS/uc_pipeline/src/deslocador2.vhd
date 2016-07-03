library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity deslocador2 is
	port(entrada: in std_logic_vector(31 downto 0);
	saida: out std_logic_vector(31 downto 0)
	);
end deslocador2;

architecture behavior of deslocador2 is
begin  


		saida<=entrada(29 downto 0)&entrada(31 downto 30);

end behavior;