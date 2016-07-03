library ieee;
use ieee.std_logic_1164.all;  
use ieee.std_logic_unsigned.all;

entity est1 is
	port(shleftestagio2: in std_logic_vector(31 downto 0);
		 hazardctrl: in std_logic;
		 hazardREGctrl: in std_logic;
		 clk: in std_logic;
		 regctrlUC: in std_logic;
		 instrucao: out std_logic_vector(31 downto 0);
		 posmem: out std_logic_vector(31 downto 0));

end estagio1;