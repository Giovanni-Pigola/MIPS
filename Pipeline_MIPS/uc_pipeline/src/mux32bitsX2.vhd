library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity mux32bitsX2 is
	port(op: in std_logic;
	e1, e2: in std_logic_vector(31 downto 0);
	saida: out std_logic_vector(31 downto 0)
	);
end mux32bitsX2;			 

architecture bev of mux32bitsX2 is
begin	
	escolhe: process(op)
	begin
		if(op='0') then
			saida<=e1;
		else
			saida<=e2; 
		end if;	 
	end process;
end bev;