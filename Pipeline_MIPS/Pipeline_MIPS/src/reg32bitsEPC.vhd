library IEEE;
use IEEE.std_logic_1164.all;

entity regEPC is
  port(
		entradaepc : in std_logic_vector(31 downto 0);
		saidaepc : out std_logic_vector(31 downto 0)
  );
end regEPC;

architecture bev of regEPC is
begin  
	
	 	saidaepc<=entradaepc;

end bev;