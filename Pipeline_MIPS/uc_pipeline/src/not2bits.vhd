library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;

entity not2bits is
  port(
  		e: in std_logic_vector(1 downto 0);
  	
		s: out std_logic_vector(1 downto 0)
  );
end not2bits;	

architecture bev of not2bits is
begin
	n2b: process(e)
	begin
		if(e="00") then
			s<="11";
		elsif(e="01") then
			s<="10";
		elsif(e="10") then
			s<="01";
		else
			s<="00";
		end if;
		
	end process;
	

end bev;