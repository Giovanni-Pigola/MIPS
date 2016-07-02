library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity mux5bits is
	port(op: in std_logic_vector(1 downto 0);
	e1, e2: in std_logic_vector(31 downto 0);
	saida: out std_logic_vector(31 downto 0)
	);
end mux5bits;			 

architecture bev of mux5bits is
begin	
	escolhe: process(op)
	begin
		if(op="00") then
			 saida <= e1;
		elsif(op="01") then
			saida <= e2;  
		else
			saida <= "10000000000000000000000110000000";
		end if;	 
	end process;
end bev;