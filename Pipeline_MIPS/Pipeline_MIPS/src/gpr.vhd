													-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : Biblioteca_de_Componentes
-- Author      : Wilson Ruggiero
-- Company     : LARC-EPUSP
--
-------------------------------------------------------------------------------
--
-- File        : D:\Projetos_VHDL\Projetos_Student\Biblioteca_de_Componentes\compile\DualRegFile.vhd
-- Generated   : Wed Nov 21 21:15:49 2012
-- From        : D:\Projetos_VHDL\Projetos_Student\Biblioteca_de_Componentes\src\DualRegFile.bde
-- By          : Bde2Vhdl ver. 2.6
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-- Design unit header --
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity DualRegFile is
  generic(
       Tread: time := 5 ns;
       Twrite: time := 5 ns
  );
  port(
       we : in std_logic;
	   dadoina : in std_logic_vector(4 downto 0);
       dadoinb : in std_logic_vector(4 downto 0);
       enda : in std_logic_vector(4 downto 0);
       endb : in std_logic_vector(4 downto 0);
       dadoouta : out std_logic_vector(4 downto 0);
       dadooutb : out std_logic_vector(4 downto 0)
  );
end DualRegFile;

architecture DualRegFile of DualRegFile is

---- Architecture declarations -----
type ram_type is array (0 to 2**5 - 1)
        of std_logic_vector (4 downto 0);
signal ram: ram_type;


---- Signal declarations used on the diagram ----

signal enda_reg : std_logic_vector (4 downto 0);
signal endb_reg : std_logic_vector (4 downto 0);

begin

---- Processes ----

RegisterMemory :
process (we)
-- Section above this comment may be overwritten according to
-- "Update sensitivity list automatically" option status
-- declarations
begin
        if (we = '1') then
           ram(to_integer(unsigned(enda))) <= dadoina after Twrite;	
		   ram(to_integer(unsigned(endb))) <= dadoinb after Twrite;
        end if;
        enda_reg <= enda;
        endb_reg <= endb;
 
end process;

---- User Signal Assignments ----
dadoouta <= ram(to_integer(unsigned
								(enda_reg))) after Tread;
dadooutb <= ram(to_integer(unsigned
								(endb_reg))) after Tread;

end DualRegFile;
