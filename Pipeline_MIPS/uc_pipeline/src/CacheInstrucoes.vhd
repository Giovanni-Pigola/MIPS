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
		Miss : out STD_LOGIC;
		MemRead : out STD_LOGIC;
		DadoOut : out STD_LOGIC_VECTOR(31 downto 0);
		EndOut : out STD_LOGIC_VECTOR(31 downto 0)
	);
end CacheInstrucoes;

--}} End of automatically maintained section

architecture CacheInst of CacheInstrucoes is

type cacheinst is array(255 downto 0, 16 downto 0) of std_logic_vector(31 downto 0); -- 256 blocos, cada bloco contém, em seu último elemento, o bit de validade e a tag do bloco, e os demais elementos contém as 16 palavras de 32 bits
--type cacheinst is array(4095 downto 0) of std_logic_vector(31 downto 0); -- 4096 palavras de 32 bits
signal cache : cacheinst;
--type blocos is array(255 downto 0) of std_logic_vector(20 downto 0); -- Vetor para armazenar o endereço na memória principal de cada bloco do cache e o bit de validade (mais significativo)
--signal bloc : blocos;

begin						 
	
	process (clock)
		variable EndInterno : std_logic_vector(31 downto 0); -- variable EndInterno : std_logic_vector(20 downto 0); 
		variable esperaMemoria : std_logic := '0';	
		variable x : std_logic_vector(1 downto 0);
		variable bloco : std_logic_vector(7 downto 0);
		variable z : std_logic_vector(3 downto 0);
	begin		
		
		if rising_edge(clock) then
			Hit <= '0';
			if reset = '1' then
				MemRead <= '0';					   	-- Coloca as saídas em 0
				EndOut <= (others => '0');
				DadoOut <= (others => '0');
				for i in 0 to 255 loop
					for j in 0 to 16 loop
						cache(i,j) <= (others => '0');	-- Limpa o cache
					end loop;
				end loop;
				EndInterno := (others => '0');
				Miss <= '0';
				bloco := (others => '0');
				esperaMemoria := '0';
				x := "00";
				z := "0000";
			elsif esperaMemoria = '0' then
				EndInterno := '1' & "0000000000000" & EndIn(31 downto 14); 			-- Define uma variavel que contém 1 (bit de validade do cache) concatenado por zeros e os 18 bits mais significativos do endereço de entrada (tag do bloco)
				bloco := EndIn(13 downto 6);
				if cache(to_integer(unsigned(bloco)), 16) = EndInterno then
					Miss <= '0';
					Hit <= '0', '1' after 5 ns;
					DadoOut <= cache(to_integer(unsigned(bloco)), to_integer(unsigned(EndIn(5 downto 2)))) after 5 ns;
				else
					Miss <= '0', '1' after 5 ns;
					DadoOut <= (others => '0');
					x := "00";
					cache(to_integer(unsigned(bloco)), 16) <= EndInterno;
					EndOut <= EndIn(31 downto 6) & x & "0000" after 5 ns;
					MemRead <= '0', '1' after 5 ns;
					esperaMemoria := '1';
				end if;
			elsif MemPronta = '1' then
				z := x & "00";
				cache(to_integer(unsigned(bloco)), to_integer(unsigned(z))) <= DadoIn(31 downto 0);
				z := x & "01";
				cache(to_integer(unsigned(bloco)), to_integer(unsigned(z))) <= DadoIn(63 downto 32);
				z := x & "10";
				cache(to_integer(unsigned(bloco)), to_integer(unsigned(z))) <= DadoIn(95 downto 64);
				z := x & "11";
				cache(to_integer(unsigned(bloco)), to_integer(unsigned(z))) <= DadoIn(127 downto 96);
				if x = "11" then
					esperaMemoria := '0';
					MemRead <= '0' after 5 ns;
					EndOut <= (others => '0') after 5 ns;
				else
					x := std_logic_vector(unsigned(x) + 1);
					EndOut <= EndIn(31 downto 6) & x & "0000" after 5 ns;
					MemRead <= '1' after 5 ns;
					esperaMemoria := '1';
				end if;
			end if;
		end if;
	end process;
end CacheInst;
