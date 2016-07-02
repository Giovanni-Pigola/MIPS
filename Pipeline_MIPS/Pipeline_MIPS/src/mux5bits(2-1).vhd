library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity mux5bits is
	port(op: in std_logic;
	p1, p2, p3: in std_logic_vector(4 downto 0);
	saida: out std_logic_vector(4 downto 0)
	);
end mux5bits;			 

architecture mux3 of mux5bits is
begin	
	escolhe: process(op)
	begin
		if(op='0') then
			 saida <= p1;
		else
			 saida <= p2;
		end if;	 
	end process;
end bev;