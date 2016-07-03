library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity mux5bits is
	port(op: in std_logic_vector(1 downto 0);
	p1, p2, p3: in std_logic_vector(4 downto 0);
	saida: out std_logic_vector(4 downto 0)
	);
end mux5bits;			 

architecture mux3 of mux5bits is
begin	
	escolhe: process(op)
	begin
		if(op= '00')then
			 saida <= p1;
		if(op='01')then
			 saida <= p2;
		if(op='10')then
			 saida <= p3;
		end if;	 
	end process;
end bev;