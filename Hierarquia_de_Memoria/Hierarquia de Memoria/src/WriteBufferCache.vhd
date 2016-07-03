-------------------------------------------------------------------------------
--
-- Title       : WriteBufferCache
-- Design      : Hierarquia de Memoria
-- Author      : Guilherme Mierzwa
-- Company     : USP
--
-------------------------------------------------------------------------------
--
-- File        : d:\Documents\Semestre 7\Atquitetura de Computadores\ActiveHDL\Hierarquia_de_Memoria\Hierarquia de Memoria\src\WriteBufferCache.vhd
-- Generated   : Sat Jul  2 21:58:21 2016
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
--{entity {WriteBufferCache} architecture {WriteBufferCache}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity WriteBufferCache is
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
end WriteBufferCache;

--}} End of automatically maintained section

architecture WriteBufferCache of WriteBufferCache is

begin

	process (clock)
	
		variable temp : std_logic := '0';
	
	begin
		if rising_edge(clock) then
			DadoSalvoOut <= '0'; 
			if reset = '1' then
				MemWriteOut <= '0';
				DadoOut <= (others => '0');
				temp := '0';
			elsif temp = '0' then
				if MemWriteIn = '1' then
					DadoOut <= DadoIn;
					DadoSalvoOut <= '1';
					MemWriteOut <= '1';
					temp := '1';
				end if;
			else
				if DadoSalvoIn = '1' then
					if MemWriteIn = '1' then
						DadoOut <= DadoIn;
						MemWriteOut <= '1';
						DadoSalvoOut <= '1';
					else
						temp := '0';
						DadoOut <= (others => '0');
						MemWriteOut <= '0';
					end if;
				end if;
			end if;	
		end if;
	end process;

end WriteBufferCache;
