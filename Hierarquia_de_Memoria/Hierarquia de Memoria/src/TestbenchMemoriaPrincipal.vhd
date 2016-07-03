-------------------------------------------------------------------------------
--
-- Title       : TestbenchMemoriaPrincipal
-- Design      : Hierarquia de Memoria
-- Author      : Guilherme Mierzwa
-- Company     : USP
--
-------------------------------------------------------------------------------
--
-- File        : d:\Documents\Semestre 7\Atquitetura de Computadores\ActiveHDL\Hierarquia_de_Memoria\Hierarquia de Memoria\src\TestbenchMemoriaPrincipal.vhd
-- Generated   : Fri Jul  1 19:59:02 2016
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
--{entity {TestbenchMemoriaPrincipal} architecture {TestbenchMemoriaPrincipal}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity TestbenchMemoriaPrincipal is
end TestbenchMemoriaPrincipal;

--}} End of automatically maintained section

architecture TestbenchMemoriaPrincipal of TestbenchMemoriaPrincipal is

	component MemoriaPrincipal
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
	end component;
	
	-- Entradas
	signal clockmp : STD_LOGIC;
	signal reset : STD_LOGIC;
	signal ReadInst : STD_LOGIC;
	signal EndInst : STD_LOGIC_VECTOR(31 downto 0);
	signal ReadDado : STD_LOGIC;
	signal WriteDado : STD_LOGIC;
	signal EndDado : STD_LOGIC_VECTOR(31 downto 0);
	signal DadoDadoIn : STD_LOGIC_VECTOR(31 downto 0);
	
	-- Saidas
	signal InstPronta : STD_LOGIC;
	signal DadoInst : STD_LOGIC_VECTOR(127 downto 0);
	signal DadoPronto : STD_LOGIC;
	signal DadoDadoOut : STD_LOGIC_VECTOR(127 downto 0);
	
	-- Período de clock
	constant clk : time := 120 ns;
	
begin

	MemoriaTeste: MemoriaPrincipal port map(
		clockmp => clockmp,
		reset => reset,
		ReadInst => ReadInst, 
		EndInst => EndInst,
		ReadDado => ReadDado,
		WriteDado => WriteDado,
		EndDado => EndDado,
		DadoDadoIn => DadoDadoIn,
		InstPronta => InstPronta,
		DadoInst => DadoInst,
		DadoPronto => DadoPronto,
		DadoDadoOut => DadoDadoOut
	);	
	
	clock_process: process
	begin
    	clockmp <= '0';
    	wait for clk/2;  -- Sinal fica em 0 por 25 ns.
        clockmp <= '1';
        wait for clk/2;  -- Sinal fica em 1 por 25 ns.
   	end process;
	   
	estimulos: process
   	begin
		wait for 20 ns;
		ReadInst <= '0';
		EndInst <= (others => '0');
		ReadDado <= '0';
		WriteDado <= '0';
		EndDado <= (others => '0');
		DadoDadoIn <= (others => '0');
		reset <= '1';
		wait for 110ns;
		reset <= '0';
		ReadInst <= '1';
		EndInst <= x"0000002C";
		wait for 120ns;
		ReadInst <= '0';
		EndDado <= x"00001000";
		DadoDadoIn <= x"AAAAAAAA";
		WriteDado <= '1';
		wait for 120ns;
		DadoDadoIn <= (others => '0');
		WriteDado <= '0';
		ReadDado <= '1';
		wait for 120ns;
		ReadDado <= '0';
		reset <= '1';
		wait for 120ns;
		reset <= '0';
		ReadInst <= '1';
		EndInst <= x"0000002C";
		wait for 120ns;
		EndInst <= (others => '0');
		ReadInst <= '0';
		EndDado <= x"00001000";
		ReadDado <= '1';
		wait for 500ns;
	end process;

end TestbenchMemoriaPrincipal;
