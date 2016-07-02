library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_signed.all;
--use IEEE.std_logic_arith.all;

entity estagio_1 is
	port(
	hazard_1 : in std_logic;
	hazard_2 : in std_logic;
	end_novo : in std_logic_vector(31 downto 0);
	controle_pipe : in std_logic;
	cache_in : in std_logic_vector(31 downto 0);
	
	cache_out : in std_logic_vector(31 downto 0);
	pc_up : in std_logic_vector(31 downto 0);
	instuction : in std_logic_vector(31 downto 0);
	)
end estagio_1;

architecture estagio1 of estagio_1 is

	blablabla	 

end estagio1;
