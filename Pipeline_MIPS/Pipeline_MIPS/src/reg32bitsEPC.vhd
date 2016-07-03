library IEEE;
use IEEE.std_logic_1164.all;

entity reg32bitsEPC is
  port(
		entradaepc : in std_logic_vector(31 downto 0);
		saidaepc : out std_logic_vector(31 downto 0)
  );
end reg32bitsEPC;

architecture bev of reg32bitsEPC is
begin  
	
	 	saidaepc<=entradaepc;

end bev;