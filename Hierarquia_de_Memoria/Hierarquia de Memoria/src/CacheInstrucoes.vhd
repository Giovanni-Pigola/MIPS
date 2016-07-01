-------------------------------------------------------------------------------
--
-- Title       : \Cache de Instrucoes\
-- Design      : Hierarquia de Memoria
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : D:\Documents\Semestre 7\Atquitetura de Computadores\ActiveHDL\Hierarquia_de_Memoria\Hierarquia de Memoria\src\Cache de Instrucoes.vhd
-- Generated   : Sun Jun 26 20:45:29 2016
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
--{entity {CacheInstrucoes} architecture {CacheInstrucoes}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity CacheInstrucoes is
	 port(
		clock : in STD_LOGIC;
		reset : in STD_LOGIC;
		MemPronta : in STD_LOGIC;
		EndIn : in STD_LOGIC_VECTOR(31 downto 0);
		DadoIn : in STD_LOGIC_VECTOR(127 downto 0);
		Hit : out STD_LOGIC;
		MemRead : out STD_LOGIC;
		DadoOut : out STD_LOGIC_VECTOR(31 downto 0);
		EndOut : out STD_LOGIC_VECTOR(31 downto 0)
	    );
end CacheInstrucoes;

--}} End of automatically maintained section

architecture CacheInst of CacheInstrucoes is

type cacheinst is array(4095 downto 0) of std_logic_vector(31 downto 0); -- 4096 palavras de 32 bits
signal cache : cacheinst;
type blocos is array(255 downto 0) of std_logic_vector(20 downto 0); -- Vetor para armazenar o endereço na memória principal de cada bloco do cache e o bit de validade (mais significativo)
signal bloc : blocos;

begin						 
	
	process (clock)
		variable EndInterno : std_logic_vector(20 downto 0);
		variable esperaMemoria : std_logic := '0';	
		variable x : std_logic_vector(1 downto 0);
		variable y : std_logic_vector(7 downto 0);
		variable z : std_logic_vector(11 downto 0);
	begin		
		
		if rising_edge(clock) then
			if reset = '1' then
				DadoOut <= (others => '0');
				Hit <= '0';
				MemRead <= '0';					   	-- Coloca as saídas em 0
				EndOut <= (others => '0');
				for i in cache'range loop
					cache(i) <= (others => '0');	-- Limpa o cache
				end loop;
				for j in bloc'range loop
					bloc(j) <= (others => '0');
				end loop;
				EndInterno := (others => '0');
				esperaMemoria := '0';
				x := "00";
			elsif esperaMemoria = '0' then
				EndInterno := '1' & EndIn(31 downto 12); 			-- Define uma variavel que contém 1 (bit de validade do cache) concatenado com os 20 bits mais significativos do endereço de entrada
				y := EndIn(11 downto 4);
				if bloc(to_integer(unsigned(y))) = EndInterno then
					Hit <= '1' after 5 ns;
					DadoOut <= cache(to_integer(unsigned(EndIn(11 downto 0)))) after 5 ns;
				else
					Hit <= '0' after 5 ns;
					DadoOut <= (others => '0') after 5 ns;
					x := "00";
					bloc(to_integer(unsigned(y))) <= EndInterno;
					EndOut <= EndIn(31 downto 4) & x & "00" after 5 ns;
					MemRead <= '1' after 5 ns;
					esperaMemoria := '1';
				end if;
			elsif MemPronta = '1' then
				z := y & x & "00";
				cache(to_integer(unsigned(z))) <= DadoIn(31 downto 0);
				z := y & x & "01";
				cache(to_integer(unsigned(z))) <= DadoIn(63 downto 32);
				z := y & x & "10";
				cache(to_integer(unsigned(z))) <= DadoIn(95 downto 64);
				z := y & x & "11";
				cache(to_integer(unsigned(z))) <= DadoIn(127 downto 96);
				if x = "11" then
					esperaMemoria := '0';
					MemRead <= '0' after 5 ns;
					EndOut <= (others => '0') after 5 ns;
				else
					x := std_logic_vector(unsigned(x) + 1);
					EndOut <= EndIn(31 downto 4) & x & "00" after 5 ns;
					MemRead <= '1' after 5 ns;
					esperaMemoria := '1';
				end if;
			end if;
		end if;
	end process;
end CacheInst;
