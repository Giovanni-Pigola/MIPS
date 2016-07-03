-------------------------------------------------------------------------------
--
-- Title       : TestbenchCacheDados
-- Design      : Hierarquia de Memoria
-- Author      : Guilherme Mierzwa
-- Company     : USP
--
-------------------------------------------------------------------------------
--
-- File        : d:\Documents\Semestre 7\Atquitetura de Computadores\ActiveHDL\Hierarquia_de_Memoria\Hierarquia de Memoria\src\TestbenchCacheDados.vhd
-- Generated   : Sat Jul  2 20:44:57 2016
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
--{entity {TestbenchCacheDados} architecture {TestbenchCacheDados}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity TestbenchCacheDados is
end TestbenchCacheDados;

--}} End of automatically maintained section

architecture TestbenchCacheDados of TestbenchCacheDados is

	component CacheDados
		port(
			clock : in STD_LOGIC;
			reset : in STD_LOGIC;
			MemPronta : in STD_LOGIC;
			CacheRead : in STD_LOGIC;
			CacheWrite : in STD_LOGIC;
			DadoSalvo : in STD_LOGIC;
			EndIn : in STD_LOGIC_VECTOR(31 downto 0);
			DadoInMP : in STD_LOGIC_VECTOR(127 downto 0);
			DadoInProc : in STD_LOGIC_VECTOR(31 downto 0);
			Hit : out STD_LOGIC;
			Miss : out STD_LOGIC;
			MemRead : out STD_LOGIC;
			MemWrite : out STD_LOGIC;
			DadoOutMP : out STD_LOGIC_VECTOR(31 downto 0);
			DadoOutProc : out STD_LOGIC_VECTOR(31 downto 0);
			EndOut : out STD_LOGIC_VECTOR(31 downto 0)
		);
	end component;
	
	-- Entradas
	signal clock : STD_LOGIC := '0';
	signal reset : STD_LOGIC := '0';
	signal MemPronta : STD_LOGIC := '0';
	signal CacheRead : STD_LOGIC := '0';
	signal CacheWrite : STD_LOGIC := '0';
	signal DadoSalvo : STD_LOGIC := '0';
	signal EndIn : STD_LOGIC_VECTOR(31 downto 0);
	signal DadoInMP : STD_LOGIC_VECTOR(127 downto 0);
	signal DadoInProc : STD_LOGIC_VECTOR(31 downto 0);
	
	-- Saidas
	signal Hit : STD_LOGIC := '0';
	signal Miss : STD_LOGIC := '0';
	signal MemRead : STD_LOGIC := '0';
	signal MemWrite : STD_LOGIC := '0';
	signal DadoOutMP : STD_LOGIC_VECTOR(31 downto 0);
	signal DadoOutProc : STD_LOGIC_VECTOR(31 downto 0);
	signal EndOut : STD_LOGIC_VECTOR(31 downto 0); 
	
	-- Período de clock
	constant clk : time := 20 ns;

begin
	
	CacheTeste: CacheDados port map(
		clock => clock,
		reset => reset,
		MemPronta => MemPronta,
		CacheRead => CacheRead,
		CacheWrite => CacheWrite,
		DadoSalvo => DadoSalvo,
		EndIn => EndIn,
		DadoInMP => DadoInMP,
		DadoInProc => DadoInProc,
		Hit => Hit,
		Miss => Miss,
		MemRead => MemRead,
		MemWrite => MemWrite,
		DadoOutMP => DadoOutMP,
		DadoOutProc => DadoOutProc,
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
		EndIn <= x"11111104";
		CacheRead <= '1';
		wait for 20ns;
		DadoInMP <= x"33333333222222221111111100000000";
		wait for 20ns;
		MemPronta <= '1';
		wait for 20ns;
		DadoInMP <= x"77777777666666665555555544444444";
		MemPronta <= '1';
		wait for 20ns;
		DadoInMP <= x"BBBBBBBBAAAAAAAA9999999988888888";
		MemPronta <= '1';
		wait for 20ns;
		DadoInMP <= x"FFFFFFFFEEEEEEEEDDDDDDDDCCCCCCCC";
		MemPronta <= '1';
		wait for 40ns;
		EndIn <= x"1111110C";
		wait for 20ns;		
		CacheRead <= '0';		
		CacheWrite <= '1';
		DadoInProc <= x"AAAAAAAA";
		wait for 20ns;
		CacheRead <= '1';		
		CacheWrite <= '0';
		wait for 20ns;
		EndIn <= x"21111104";
		wait for 120ns;
		EndIn <= x"31111104";
		wait for 20ns;
		DadoSalvo <= '1';
		wait for 10ns;
		DadoSalvo <= '0';
		wait for 10ns;
		DadoSalvo <= '1';
		wait for 10ns;
		DadoSalvo <= '0';
		wait for 10ns;
		DadoSalvo <= '1';
		wait for 10ns;
		DadoSalvo <= '0';
		wait for 10ns;
		DadoSalvo <= '1';
		wait for 10ns;
		DadoSalvo <= '0';
		wait for 10ns;
		DadoSalvo <= '1';
		wait for 10ns;
		DadoSalvo <= '0';
		wait for 10ns;
		DadoSalvo <= '1';
		wait for 10ns;
		DadoSalvo <= '0';
		wait for 10ns;
		DadoSalvo <= '1';
		wait for 10ns;
		DadoSalvo <= '0';
		wait for 10ns;
		DadoSalvo <= '1';
		wait for 10ns;
		DadoSalvo <= '0';
		wait for 10ns;
		DadoSalvo <= '1';
		wait for 10ns;
		DadoSalvo <= '0';
		wait for 10ns;
		DadoSalvo <= '1';
		wait for 10ns;
		DadoSalvo <= '0';
		wait for 10ns;
		DadoSalvo <= '1';
		wait for 10ns;
		DadoSalvo <= '0';
		wait for 10ns;
		DadoSalvo <= '1';
		wait for 10ns;
		DadoSalvo <= '0';
		wait for 10ns;
		DadoSalvo <= '1';
		wait for 10ns;
		DadoSalvo <= '0';
		wait for 10ns;
		DadoSalvo <= '1';
		wait for 10ns;
		DadoSalvo <= '0';
		wait for 10ns;
		DadoSalvo <= '1';
		wait for 10ns;
		DadoSalvo <= '0';
		wait for 10ns;
		DadoSalvo <= '1';
		wait for 10ns;
		DadoSalvo <= '0';
		wait for 600ns;
	end process;

end TestbenchCacheDados;
