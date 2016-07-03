-------------------------------------------------------------------------------
--
-- Title       : TestbenchWriteBuffer
-- Design      : Hierarquia de Memoria
-- Author      : Guilherme Mierzwa
-- Company     : USP
--
-------------------------------------------------------------------------------
--
-- File        : d:\Documents\Semestre 7\Atquitetura de Computadores\ActiveHDL\Hierarquia_de_Memoria\Hierarquia de Memoria\src\TestbenchWriteBuffer.vhd
-- Generated   : Sun Jul  3 12:10:32 2016
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
--{entity {TestbenchWriteBuffer} architecture {TestbenchWriteBuffer}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity TestbenchWriteBuffer is
end TestbenchWriteBuffer;

--}} End of automatically maintained section

architecture TestbenchWriteBuffer of TestbenchWriteBuffer is

	component WriteBufferCache
	port(
		clock : in STD_LOGIC;
		reset : in STD_LOGIC;
		MemWriteIn : in STD_LOGIC;
		DadoSalvoIn : in STD_LOGIC;
		DadoIn : in STD_LOGIC_VECTOR(31 downto 0);
		MemWriteOut : out STD_LOGIC;
		DadoSalvoOut : out STD_LOGIC;
		DadoOut : out STD_LOGIC_VECTOR(31 downto 0)
	);
	end component;
	
	-- Entradas
	signal clock : STD_LOGIC := '0';
	signal reset : STD_LOGIC := '0';
	signal MemWriteIn : STD_LOGIC := '0';
	signal DadoSalvoIn : STD_LOGIC := '0';
	signal DadoIn : STD_LOGIC_VECTOR(31 downto 0);
	
	-- Saidas
	signal MemWriteOut : STD_LOGIC := '0';
	signal DadoSalvoOut : STD_LOGIC := '0';
	signal DadoOut : STD_LOGIC_VECTOR(31 downto 0);
	
	-- Período de clock
	constant clk : time := 20 ns;


begin

	TesteWriteBuffer: WriteBufferCache port map(
		clock => clock, 
		reset => reset, 
		MemWriteIn => MemWriteIn, 
		DadoSalvoIn => DadoSalvoIn, 
		DadoIn => DadoIn,
		MemWriteOut => MemWriteOut, 
		DadoSalvoOut => DadoSalvoOut, 
		DadoOut => DadoOut
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
		DadoSalvoIn <= '0';
		wait for 10 ns;
		reset <= '0';
		MemWriteIn <= '1';
		DadoIn <= x"01234567";
		wait for 20 ns;
		DadoIn <= x"AAAAAAAA";
		wait for 20ns;
		DadoSalvoIn <= '1';
		wait for 20ns;
		MemWriteIn <= '0';
		DadoSalvoIn <= '0';
		wait for 20ns;
		DadoSalvoIn <= '1';
		wait for 20ns;
		DadoSalvoIn <= '0';
		wait for 500ns;
	end process;

end TestbenchWriteBuffer;
