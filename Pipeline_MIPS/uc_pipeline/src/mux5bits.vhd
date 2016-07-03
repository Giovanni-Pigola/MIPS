library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity mux5bits is
	port(op: in std_logic;
	e1, e2: in std_logic_vector(4 downto 0);
	saida: out std_logic_vector(4 downto 0)
	);
end mux5bits;			 

architecture bev of mux5bits is
begin	
	escolhe: process(op)
	begin
		if(op='0') then
			 saida <= e1;  
		else
			saida <= e2;
		end if;	 
	end process;
end bev;