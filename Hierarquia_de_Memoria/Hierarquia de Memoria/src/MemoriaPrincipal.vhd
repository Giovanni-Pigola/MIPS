-------------------------------------------------------------------------------
--
-- Title       : MemoriaPrincipal
-- Design      : Hierarquia de Memoria
-- Author      : Guilherme Mierzwa
-- Company     : USP
--
-------------------------------------------------------------------------------
--
-- File        : d:\Documents\Semestre 7\Atquitetura de Computadores\ActiveHDL\Hierarquia_de_Memoria\Hierarquia de Memoria\src\MemoriaPrincipal.vhd
-- Generated   : Fri Jul  1 12:19:44 2016
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {MemoriaPrincipal} architecture {MemoriaPrincipal}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MemoriaPrincipal is
	port(
		clockmp : in STD_LOGIC;
		reset : in STD_LOGIC;
		ReadInst : in STD_LOGIC;
		EndInst : in STD_LOGIC_VECTOR(31 downto 0);
		ReadDado : in STD_LOGIC;
		WriteDado :	in STD_LOGIC;
		EndDado : in STD_LOGIC_VECTOR(31 downto 0);
		DadoDadoIn : in STD_LOGIC_VECTOR(31 downto 0);
		InstPronta : out STD_LOGIC;
		DadoInst : out STD_LOGIC_VECTOR(127 downto 0);
		DadoPronto : out STD_LOGIC;
		DadoDadoOut : out STD_LOGIC_VECTOR(127 downto 0)	
	);
end MemoriaPrincipal;

--}} End of automatically maintained section

architecture MemoriaPrincipal of MemoriaPrincipal is
begin

	process (clockmp)
	begin
		
	end process;

end MemoriaPrincipal;
