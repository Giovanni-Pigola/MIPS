library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ula is
	port(s_op0: in std_logic;
	e_2521, e_2016: in std_logic_vector(31 downto 0);
	OVF: out std_logic;
	saida: out std_logic_vector(31 downto 0)
	);
	
end ula;

architecture behavior of ula is
signal in1 : std_logic_vector(32 downto 0);
signal in2 : std_logic_vector(32 downto 0);
signal overflowSum : std_logic_vector(32 downto 0);
begin  
	ulas: process (s_op0)
	begin
		if(s_op0='1') then
			saida <= e_2521-e_2016;
		else
			in1<='0'&e_2521;
			in2<='0'&e_2016;
			overflowSum<= in1+in2;
			OVF<=overflowSum(32);
			saida<=overflowSum(31 downto 0);
		end if;

	end process;
end behavior;