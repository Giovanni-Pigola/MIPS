-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : Biblioteca_de_Componentes
-- Author      : Wilson Ruggiero
-- Company     : LARC-EPUSP
--
-------------------------------------------------------------------------------
--
-- File        : D:\Projetos_VHDL\Projetos_Student\Biblioteca_de_Componentes\compile\multiplexador.vhd
-- Generated   : Wed Nov 21 21:15:46 2012
-- From        : D:\Projetos_VHDL\Projetos_Student\Biblioteca_de_Componentes\src\multiplexador.bde
-- By          : Bde2Vhdl ver. 2.6
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-- Design unit header --
library IEEE;
use IEEE.std_logic_1164.all;


entity mux2x1_2bitszero is
  port(
       S : in std_logic;
       In1 : in std_logic_vector(1 downto 0);
       O : out std_logic_vector(1 downto 0)
  );
end mux2x1_2bitszero;

architecture bev of mux2x1_2bitszero is

begin
	sel: process(S)
	begin
		if(S='0') then
			O<=In1;
		else
			O<="00";
		end if;
		
	end process;
	

end bev;
