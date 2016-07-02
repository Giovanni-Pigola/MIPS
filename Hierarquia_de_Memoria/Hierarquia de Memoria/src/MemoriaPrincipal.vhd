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
use std.textio.all;
use IEEE.NUMERIC_STD.all;
use IEEE.std_logic_textio.all;

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
		DadoDadoOut : out STD_LOGIC_VECTOR(127 downto 0);
		DadoSalvo : out STD_LOGIC;
		teste : out STD_LOGIC_VECTOR(31 downto 0)
	);
end MemoriaPrincipal;

--}} End of automatically maintained section

architecture MemoriaPrincipal of MemoriaPrincipal is

	type memoria is array (2**14 downto 0) of std_logic_vector(31 downto 0); 	-- 2^14 palavras de 32 bits
	signal mem : memoria;
	file entrada: text open read_mode is "Programa.txt";
		
begin

	process (clockmp)
		variable l : line;
		variable posicao, conteudo : std_logic_vector(31 downto 0);
		variable separador : character;
	begin
		
		if rising_edge(clockmp) then 
			InstPronta <= '0';
			DadoInst <= (others => '0');
			DadoPronto <= '0';
			DadoDadoOut <= (others => '0');
			DadoSalvo <= '0';
			if reset = '1' then
				while not endfile(entrada) loop
					readline(entrada, l);
					read(l, posicao);
					read(l, separador);
					read(l, conteudo);
					mem(to_integer(unsigned(posicao(15 downto 2)))) <= conteudo;
				end loop;
			elsif WriteDado = '1' then
				mem(to_integer(unsigned(EndDado(15 downto 2)))) <= DadoDadoIn after 100 ns;
				DadoSalvo <= '1' after 100 ns;
				InstPronta <= '0';
				DadoInst <= (others => '0');
				DadoPronto <= '0';
				DadoDadoOut <= (others => '0');
			elsif ReadDado = '1' then
				DadoDadoOut <= mem(to_integer(unsigned(EndDado(15 downto 2))) + 3) & mem(to_integer(unsigned(EndDado(15 downto 2))) + 2) & mem(to_integer(unsigned(EndDado(15 downto 2))) + 1) & mem(to_integer(unsigned(EndDado(15 downto 2)))) after 100 ns;
				DadoPronto <= '1' after 100 ns;
			elsif ReadInst = '1' then
				DadoInst <= mem(to_integer(unsigned(EndInst(15 downto 2))) + 3) & mem(to_integer(unsigned(EndInst(15 downto 2))) + 2) & mem(to_integer(unsigned(EndInst(15 downto 2))) + 1) & mem(to_integer(unsigned(EndInst(15 downto 2)))) after 100 ns;
				InstPronta <= '1' after 100 ns;
			end if;
		end if; 
		
	end process;

end MemoriaPrincipal;
