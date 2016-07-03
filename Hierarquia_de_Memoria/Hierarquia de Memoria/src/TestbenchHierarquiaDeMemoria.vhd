-------------------------------------------------------------------------------
--
-- Title       : TestbenchHierarquiaDeMemoria
-- Design      : Hierarquia de Memoria
-- Author      : Guilherme Mierzwa
-- Company     : USP
--
-------------------------------------------------------------------------------
--
-- File        : d:\Documents\Semestre 7\Atquitetura de Computadores\ActiveHDL\Hierarquia_de_Memoria\Hierarquia de Memoria\src\TestbenchHierarquiaDeMemoria.vhd
-- Generated   : Sun Jul  3 13:19:00 2016
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
--{entity {TestbenchHierarquiaDeMemoria} architecture {TestbenchHierarquiaDeMemoria}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity TestbenchHierarquiaDeMemoria is
end TestbenchHierarquiaDeMemoria;

--}} End of automatically maintained section

architecture TestbenchHierarquiaDeMemoria of TestbenchHierarquiaDeMemoria is 

component HierarquiaDeMemoria
	port(
		ReadDado : in STD_LOGIC;
       	WriteDado : in STD_LOGIC;
       	clock : in STD_LOGIC;
       	clockmp : in STD_LOGIC;
       	reset : in STD_LOGIC;
       	DadoIn : in STD_LOGIC_VECTOR(31 downto 0);
       	EndDado : in STD_LOGIC_VECTOR(31 downto 0);
       	EndInst : in STD_LOGIC_VECTOR(31 downto 0);
       	HitDado : out STD_LOGIC;
       	HitInst : out STD_LOGIC;
       	MissDado : out STD_LOGIC;
       	MissInst : out STD_LOGIC;
       	DadoOut : out STD_LOGIC_VECTOR(31 downto 0);
       	Instrucao : out STD_LOGIC_VECTOR(31 downto 0)	
	);
end component;

	-- Entradas
	signal ReadDado : STD_LOGIC := '0';
    signal WriteDado : STD_LOGIC := '0';
    signal clock : STD_LOGIC := '0';
    signal clockmp : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal DadoIn : STD_LOGIC_VECTOR(31 downto 0);
    signal EndDado : STD_LOGIC_VECTOR(31 downto 0);
    signal EndInst : STD_LOGIC_VECTOR(31 downto 0);
	
	-- Saidas
    signal HitDado : STD_LOGIC := '0';
    signal HitInst : STD_LOGIC := '0';
    signal MissDado : STD_LOGIC := '0';
    signal MissInst : STD_LOGIC := '0';
    signal DadoOut : STD_LOGIC_VECTOR(31 downto 0);
    signal Instrucao : STD_LOGIC_VECTOR(31 downto 0);
	
	-- Período de clock
	constant clk : time := 20 ns;
	constant clkmp : time := 120 ns; 

begin

	TesteHierarquiaDeMemoria: HierarquiaDeMemoria port map(
		ReadDado => ReadDado, 
       	WriteDado => WriteDado,
       	clock => clock,
       	clockmp => clockmp,
       	reset => reset,
       	DadoIn => DadoIn,
       	EndDado => EndDado,
       	EndInst => EndInst, 
       	HitDado => HitDado,
       	HitInst => HitInst,
       	MissDado => MissDado,
       	MissInst => MissInst,
       	DadoOut => DadoOut, 
       	Instrucao => Instrucao	
	);
	
	clock_process: process
	begin
    	clock <= '0';
    	wait for clk/2; 
        clock <= '1';
        wait for clk/2; 
   	end process;
	   
	clockmp_process: process
	begin
	    clockmp <= '0';
    	wait for clkmp/2; 
        clockmp <= '1';
        wait for clkmp/2; 	
	end process;
	
	estimulos: process
   	begin
		wait for 5 ns;
		reset <= '1';
		DadoIn <= (others => '0');
		EndDado <= (others => '0');
		wait for 120 ns;
		reset <= '0';
		EndInst <= x"0000002C";
		wait until HitInst = '1';
		wait for 10 ns;
		EndInst <= x"00000030";
		wait for 20 ns;
		EndInst <= x"00000034";
		wait for 20 ns;
		EndInst <= x"00000038";
		wait for 20 ns;
		EndInst <= x"0000003C";
		wait for 20 ns;
		EndInst <= x"00000040";
		wait for 20 ns;
		EndInst <= x"00000044";
		wait for 20 ns;
		EndInst <= x"00000048";
		wait for 20 ns;
		EndInst <= x"0000004C";
		wait for 20 ns;
		EndInst <= x"00000050";
		wait for 20 ns;
		wait for 1000ns;
	end process;

end TestbenchHierarquiaDeMemoria;
