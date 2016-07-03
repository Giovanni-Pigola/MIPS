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


entity mux1bit2x1 is
  port(
       S : in std_logic;
       I0 : in std_logic;
       I1 : in std_logic;
       O : out std_logic
  );
end mux1bit2x1;

architecture mux1bit of mux1bit2x1 is

begin
	sel: process(S)
	begin
		if(S='0') then
			O<=I0;
		else
			O<=I1;
		end if;
		
	end process;
	

end mux1bit;
