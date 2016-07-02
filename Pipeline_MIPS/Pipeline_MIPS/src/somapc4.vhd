library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;

entity somapc4 is
  port(
       A : in std_logic_vector(31 downto 0);
       C : out std_logic_vector(31 downto 0)
  );
end somapc4; 

architecture somapc4 of somapc4 is	   
begin
	C <=  A + "0000000000000000000000000000100";

end somapc4;