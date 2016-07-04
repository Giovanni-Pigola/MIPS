-------------------------------------------------------------------------------
--
-- Title       : CacheDados
-- Design      : Hierarquia de Memoria
-- Author      : Guilherme Mierzwa
-- Company     : USP
--
-------------------------------------------------------------------------------
--
-- File        : d:\Documents\Semestre 7\Atquitetura de Computadores\ActiveHDL\Hierarquia_de_Memoria\Hierarquia de Memoria\src\CacheDados.vhd
-- Generated   : Sat Jul  2 16:15:36 2016
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
--{entity {CacheDados} architecture {CacheDados}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity CacheDados is
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
end CacheDados;

--}} End of automatically maintained section

architecture CacheDados of CacheDados is

type cachedado is array(127 downto 0, 16 downto 0) of std_logic_vector(31 downto 0);  -- 128 blocos, cada bloco contém, em seu último elemento, o bit de utilização recente (LRU), o bit de bloco sujo, o bit de validade e a tag do bloco, e os demais elementos contém as 16 palavras de 32 bits
signal cacheA : cachedado;
signal cacheB : cachedado;

begin

	process (clock)
	
		variable esperaMemoria : std_logic := '0';
		variable EndInterno : std_logic_vector(29 downto 0);
		variable x : std_logic_vector(1 downto 0);
		variable bloco : std_logic_vector(6 downto 0);
		variable z : std_logic_vector(3 downto 0);
		variable salvaA : std_logic := '0';
		variable salvaB : std_logic := '0';
		variable sujo : std_logic := '0';
		
	begin
		if rising_edge(clock) then
			Hit <= '0';
			DadoOutProc <= (others => '0');
			
			if reset = '1' then	
				for i in 0 to 127 loop
					for j in 0 to 16 loop
						cacheA(i,j) <= (others => '0');	-- Limpa o cache
						cacheB(i,j) <= (others => '0');
					end loop;
				end loop;
				Hit <= '0';
				Miss <= '0';
				MemRead <= '0';
				MemWrite <= '0';
				DadoOutMP <= (others => '0');
				EndOut <= (others => '0');
				bloco := (others => '0');
				EndInterno := (others => '0');
				x := "00";
				z := "0000";
				sujo := '0';
				salvaA := '0';
				salvaB := '0';
				esperaMemoria := '0';
				
			elsif esperaMemoria = '0' and (CacheRead = '1' or CacheWrite = '1') then
				EndInterno := '1' & "0000000000" & EndIn(31 downto 13); 		-- Define uma variavel que contém 1 (bit de validade do cache) concatenado por zeros e os 19 bits mais significativos do endereço de entrada (tag do bloco)
				bloco := EndIn(12 downto 6);
				
				if cacheA(to_integer(unsigned(bloco)), 16)(29 downto 0) = EndInterno then
					cacheA(to_integer(unsigned(bloco)), 16)(31) <= '1';
					cacheB(to_integer(unsigned(bloco)), 16)(31) <= '0';
					Miss <= '0';
					Hit <= '0', '1' after 5 ns;
					
					if CacheRead = '1' then	
						DadoOutProc <= cacheA(to_integer(unsigned(bloco)), to_integer(unsigned(EndIn(5 downto 2)))) after 5 ns;
						
					elsif CacheWrite = '1' then
						cacheA(to_integer(unsigned(bloco)), 16)(30) <= '1';
						cacheA(to_integer(unsigned(bloco)), to_integer(unsigned(EndIn(5 downto 2)))) <= DadoInProc;
					end if;	
					
				elsif cacheB(to_integer(unsigned(bloco)), 16)(29 downto 0) = EndInterno then
					cacheA(to_integer(unsigned(bloco)), 16)(31) <= '0';
					cacheB(to_integer(unsigned(bloco)), 16)(31) <= '1';
					Miss <= '0';
					Hit <= '0', '1' after 5 ns;
					
					if CacheRead = '1' then	
						DadoOutProc <= cacheB(to_integer(unsigned(bloco)), to_integer(unsigned(EndIn(5 downto 2)))) after 5 ns;
						
					elsif CacheWrite = '1' then	
						cacheB(to_integer(unsigned(bloco)), 16)(30) <= '1';
						cacheB(to_integer(unsigned(bloco)), to_integer(unsigned(EndIn(5 downto 2)))) <= DadoInProc;
					end if;
					
				else
					Miss <= '0', '1' after 5 ns;
					x := "00";
					
					if cacheA(to_integer(unsigned(bloco)), 16)(31) = '0' then
						sujo := cacheA(to_integer(unsigned(bloco)), 16)(30);
						salvaA := '1';
						salvaB := '0';
						
						if sujo = '0' then -- Bloco não está sujo, cache pode pegar o bloco novo da MP e substituir
							cacheA(to_integer(unsigned(bloco)), 16) <= "10" & EndInterno;
							cacheB(to_integer(unsigned(bloco)), 16)(31) <= '0';
							EndOut <= EndIn(31 downto 6) & x & "0000" after 5 ns;
							MemRead <= '0', '1' after 5 ns;
							esperaMemoria := '1'; 						
																
						else -- Bloco está sujo, precisa salvar o bloco atual na MP antes de pegar um novo
							cacheA(to_integer(unsigned(bloco)), 16)(30) <= '0';
							z := "0000";
							EndOut <= cacheA(to_integer(unsigned(bloco)), 16)(18 downto 0) & bloco & z & "00" after 5 ns;
							DadoOutMP <= cacheA(to_integer(unsigned(bloco)), to_integer(unsigned(z))) after 5 ns;
							MemWrite <= '0', '1' after 5 ns;
							esperaMemoria := '1';
						end if;
						
					else
						sujo := cacheB(to_integer(unsigned(bloco)), 16)(30);
						salvaA := '0';
						salvaB := '1'; 
						
						if sujo = '0' then -- Bloco não está sujo, cache pode pegar o bloco novo da MP e substituir
							cacheB(to_integer(unsigned(bloco)), 16) <= "10" & EndInterno;
							cacheA(to_integer(unsigned(bloco)), 16)(31) <= '0';
							EndOut <= EndIn(31 downto 6) & x & "0000" after 5 ns;
							MemRead <= '0', '1' after 5 ns;
							esperaMemoria := '1';
							
						else -- Bloco está sujo, precisa salvar o bloco atual na MP antes de pegar um novo
							cacheB(to_integer(unsigned(bloco)), 16)(30) <= '0';
							z := "0000";
							EndOut <= cacheB(to_integer(unsigned(bloco)), 16)(18 downto 0) & bloco & z & "00" after 5 ns;
							DadoOutMP <= cacheB(to_integer(unsigned(bloco)), to_integer(unsigned(z))) after 5 ns;
							MemWrite <= '0', '1' after 5 ns;
							esperaMemoria := '1';							
						end if;
					end if;		
				end if;
							
			elsif sujo = '1' then

				if DadoSalvo = '1' then
					
					if z = "1111" then
						x := "00";
						sujo := '0';
						MemWrite <= '0' after 5 ns;
						DadoOutMP <= (others => '0') after 5 ns;
						esperaMemoria := '1';
						MemRead <= '0', '1' after 5 ns;
						EndOut <= EndIn(31 downto 6) & x & "0000" after 5 ns;
						if salvaA = '1' then
							cacheA(to_integer(unsigned(bloco)), 16) <= "10" & EndInterno;
							cacheB(to_integer(unsigned(bloco)), 16)(31) <= '0';
						else
							cacheB(to_integer(unsigned(bloco)), 16) <= "10" & EndInterno;
							cacheA(to_integer(unsigned(bloco)), 16)(31) <= '0';
						end if;
						
					else
						z := std_logic_vector(unsigned(z) + 1);
						MemWrite <= '1' after 5 ns;
						esperaMemoria := '1';
						
						if salvaA = '1' then 							
							EndOut <= cacheA(to_integer(unsigned(bloco)), 16)(18 downto 0) & bloco & z & "00" after 5 ns;
							DadoOutMP <= cacheA(to_integer(unsigned(bloco)), to_integer(unsigned(z))) after 5 ns;
							
						else -- se salvaB = '1'
							EndOut <= cacheB(to_integer(unsigned(bloco)), 16)(18 downto 0) & bloco & z & "00" after 5 ns;
							DadoOutMP <= cacheB(to_integer(unsigned(bloco)), to_integer(unsigned(z))) after 5 ns;
						end if;
					end if;
				end if;
				
			elsif MemPronta = '1' then 
				
				if salvaA = '1' then
					z := x & "00";
					cacheA(to_integer(unsigned(bloco)), to_integer(unsigned(z))) <= DadoInMP(31 downto 0);
					z := x & "01";
					cacheA(to_integer(unsigned(bloco)), to_integer(unsigned(z))) <= DadoInMP(63 downto 32);
					z := x & "10";
					cacheA(to_integer(unsigned(bloco)), to_integer(unsigned(z))) <= DadoInMP(95 downto 64);
					z := x & "11";
					cacheA(to_integer(unsigned(bloco)), to_integer(unsigned(z))) <= DadoInMP(127 downto 96);
					
				else -- se salvaB = '1'
					z := x & "00";
					cacheB(to_integer(unsigned(bloco)), to_integer(unsigned(z))) <= DadoInMP(31 downto 0);
					z := x & "01";
					cacheB(to_integer(unsigned(bloco)), to_integer(unsigned(z))) <= DadoInMP(63 downto 32);
					z := x & "10";
					cacheB(to_integer(unsigned(bloco)), to_integer(unsigned(z))) <= DadoInMP(95 downto 64);
					z := x & "11";
					cacheB(to_integer(unsigned(bloco)), to_integer(unsigned(z))) <= DadoInMP(127 downto 96);
				end if;
				
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

end CacheDados;
