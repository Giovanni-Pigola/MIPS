-------------------------------------------------------------------------------
--
-- Title       : \Testbench Cache de Instrucoes\
-- Design      : Hierarquia de Memoria
-- Author      : Guilherme Mierzwa
-- Company     : USP
--
-------------------------------------------------------------------------------
--
-- File        : d:\Documents\Semestre 7\Atquitetura de Computadores\ActiveHDL\Hierarquia_de_Memoria\Hierarquia de Memoria\src\Testbench Cache de Instrucoes.vhd
-- Generated   : Thu Jun 30 21:13:01 2016
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
--{entity {TestbenchCacheInstrucoes} architecture {TestbenchCacheInstrucoes}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity TestbenchCacheInstrucoes is
end TestbenchCacheInstrucoes;

--}} End of automatically maintained section

architecture TestbenchCacheInstrucoes of TestbenchCacheInstrucoes is

	component CacheInstrucoes
		port(
			clock : in STD_LOGIC;
			reset : in STD_LOGIC;
			MemPronta : in STD_LOGIC;
			EndIn : in STD_LOGIC_VECTOR(31 downto 0);
			DadoIn : in STD_LOGIC_VECTOR(127 downto 0);
			Hit : out STD_LOGIC;
			Miss : out STD_LOGIC;
			MemRead : out STD_LOGIC;
			DadoOut : out STD_LOGIC_VECTOR(31 downto 0);
			EndOut : out STD_LOGIC_VECTOR(31 downto 0)
	    );
	end component;
	
	-- Entradas
	signal clock : STD_LOGIC := '0';
	signal reset : STD_LOGIC := '0';
	signal MemPronta : STD_LOGIC := '0';
	signal EndIn : STD_LOGIC_VECTOR(31 downto 0);
	signal DadoIn : STD_LOGIC_VECTOR(127 downto 0);
	
	-- Saidas
	signal Hit : STD_LOGIC := '0';
	signal Miss : STD_LOGIC := '0';
	signal MemRead : STD_LOGIC := '0';
	signal DadoOut : STD_LOGIC_VECTOR(31 downto 0);
	signal EndOut : STD_LOGIC_VECTOR(31 downto 0);
	
	-- Período de clock
	constant clk : time := 20 ns;

begin	
	
	teste: CacheInstrucoes port map(
		clock => clock,
		reset => reset,
		MemPronta => MemPronta,
		EndIn => EndIn,
		DadoIn => DadoIn,
		Hit => Hit,
		Miss => Miss,
		MemRead => MemRead,
		DadoOut => DadoOut,
		EndOut => EndOut
	);
	
	clock_process: process
	begin
    	clock <= '0';
    	wait for clk/2;  -- Sinal fica em 0 por 25 ns.
        clock <= '1';
        wait for clk/2;  -- Sinal fica em 1 por 25 ns.
   	end process;
   
   	estimulos: process
   	begin
		wait for 5 ns;
		reset <= '1';
		wait for 10 ns;
		reset <= '0';
		wait for 10 ns;
		EndIn <= x"11111114";
		wait for 20ns;
		DadoIn <= x"33333333222222221111111100000000";
		wait for 20ns;
		MemPronta <= '1';
		wait for 20ns;
		DadoIn <= x"77777777666666665555555544444444";
		MemPronta <= '1';
		wait for 20ns;
		DadoIn <= x"BBBBBBBBAAAAAAAA9999999988888888";
		MemPronta <= '1';
		wait for 20ns;
		DadoIn <= x"FFFFFFFFEEEEEEEEDDDDDDDDCCCCCCCC";
		MemPronta <= '1';
		wait for 40ns;
		EndIn <= x"11111158";
		wait for 20ns;
		DadoIn <= x"33333333222222221111111100000000";
		wait for 20ns;
		MemPronta <= '1';
		wait for 20ns;
		DadoIn <= x"77777777666666665555555544444444";
		MemPronta <= '1';
		wait for 20ns;
		DadoIn <= x"BBBBBBBBAAAAAAAA9999999988888888";
		MemPronta <= '1';
		wait for 20ns;
		DadoIn <= x"FFFFFFFFEEEEEEEEDDDDDDDDCCCCCCCC";
		MemPronta <= '1';
		wait for 20ns;
		EndIn <= x"11111118";
		wait for 20ns;
		EndIn <= x"21111118";
		wait for 1000ns;
	end process;
	
	
end TestbenchCacheInstrucoes;
