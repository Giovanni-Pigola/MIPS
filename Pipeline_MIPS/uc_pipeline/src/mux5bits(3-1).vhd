library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity mux5bits3x1 is
	port(op: in std_logic_vector(1 downto 0);
	p1, p2, p3: in std_logic_vector(4 downto 0);
	saida: out std_logic_vector(4 downto 0)
	);
end mux5bits3x1;			 

architecture mux3 of mux5bits3x1 is
begin	
	escolhe: process(op)
	begin
		if(op= "00") then
			 saida <= p1;
		elsif(op="01") then
			 saida <= p2;
		elsif(op="10") then
			 saida <= p3;
		end if;	 
	end process;
end mux3;