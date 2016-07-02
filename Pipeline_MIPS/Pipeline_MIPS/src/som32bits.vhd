library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;

entity soma32bits is
  port(
  		A : in std_logic_vector(31 downto 0); 
  		B : in std_logic_vector(31 downto 0); 
       C : out std_logic_vector(31 downto 0)
  );
end soma32bits; 

architecture soma32bits of soma32bits is	   
begin
	C <=  A + B;

end soma32bits;