-------------------------------------------------------------------------------
--
-- Title       : HierarquiaDeMemoria
-- Design      : Hierarquia de Memoria
-- Author      : Guilherme Mierzwa
-- Company     : USP
--
-------------------------------------------------------------------------------
--
-- File        : d:\Documents\Semestre 7\Atquitetura de Computadores\ActiveHDL\Hierarquia_de_Memoria\Hierarquia de Memoria\compile\HierarquiaDeMemoria.vhd
-- Generated   : Sun Jul  3 13:12:49 2016
-- From        : d:/Documents/Semestre 7/Atquitetura de Computadores/ActiveHDL/Hierarquia_de_Memoria/Hierarquia de Memoria/src/HierarquiaDeMemoria.bde
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
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_unsigned.all;


entity HierarquiaDeMemoria is
  port(
       ReadDado : in STD_LOGIC;
       WriteDado : in STD_LOGIC;
       clock : in STD_LOGIC;
       clockmp : in STD_LOGIC;
       reset : in STD_LOGIC;
       DadoIn : in STD_LOGIC_VECTOR(31 downto 0);
       EndDado : in STD_LOGIC_VECTOR(31 downto 0);
       EndInst : in STD_LOGIC_VECTOR(31 downto 0);
       HitDado : out STD_LOGIC;
       HitInst : out STD_LOGIC;
       MissDado : out STD_LOGIC;
       MissInst : out STD_LOGIC;
       DadoOut : out STD_LOGIC_VECTOR(31 downto 0);
       Instrucao : out STD_LOGIC_VECTOR(31 downto 0)
  );
end HierarquiaDeMemoria;

architecture HierarquiaDeMemoria of HierarquiaDeMemoria is

---- Component declarations -----

component CacheDados
  port (
       CacheRead : in STD_LOGIC;
       CacheWrite : in STD_LOGIC;
       DadoInMP : in STD_LOGIC_VECTOR(127 downto 0);
       DadoInProc : in STD_LOGIC_VECTOR(31 downto 0);
       DadoSalvo : in STD_LOGIC;
       EndIn : in STD_LOGIC_VECTOR(31 downto 0);
       MemPronta : in STD_LOGIC;
       clock : in STD_LOGIC;
       reset : in STD_LOGIC;
       DadoOutMP : out STD_LOGIC_VECTOR(31 downto 0);
       DadoOutProc : out STD_LOGIC_VECTOR(31 downto 0);
       EndOut : out STD_LOGIC_VECTOR(31 downto 0);
       Hit : out STD_LOGIC;
       MemRead : out STD_LOGIC;
       MemWrite : out STD_LOGIC;
       Miss : out STD_LOGIC
  );
end component;
component CacheInstrucoes
  port (
       DadoIn : in STD_LOGIC_VECTOR(127 downto 0);
       EndIn : in STD_LOGIC_VECTOR(31 downto 0);
       MemPronta : in STD_LOGIC;
       clock : in STD_LOGIC;
       reset : in STD_LOGIC;
       DadoOut : out STD_LOGIC_VECTOR(31 downto 0);
       EndOut : out STD_LOGIC_VECTOR(31 downto 0);
       Hit : out STD_LOGIC;
       MemRead : out STD_LOGIC;
       Miss : out STD_LOGIC
  );
end component;
component MemoriaPrincipal
  port (
       DadoDadoIn : in STD_LOGIC_VECTOR(31 downto 0);
       EndDado : in STD_LOGIC_VECTOR(31 downto 0);
       EndInst : in STD_LOGIC_VECTOR(31 downto 0);
       ReadDado : in STD_LOGIC;
       ReadInst : in STD_LOGIC;
       WriteDado : in STD_LOGIC;
       clockmp : in STD_LOGIC;
       reset : in STD_LOGIC;
       DadoDadoOut : out STD_LOGIC_VECTOR(127 downto 0);
       DadoInst : out STD_LOGIC_VECTOR(127 downto 0);
       DadoPronto : out STD_LOGIC;
       DadoSalvo : out STD_LOGIC;
       InstPronta : out STD_LOGIC
  );
end component;
component WriteBufferCache
  port (
       DadoIn : in STD_LOGIC_VECTOR(31 downto 0);
       DadoSalvoIn : in STD_LOGIC;
       MemWriteIn : in STD_LOGIC;
       clock : in STD_LOGIC;
       reset : in STD_LOGIC;
       DadoOut : out STD_LOGIC_VECTOR(31 downto 0);
       DadoSalvoOut : out STD_LOGIC;
       MemWriteOut : out STD_LOGIC
  );
end component;

---- Signal declarations used on the diagram ----

signal NET163 : STD_LOGIC;
signal NET176 : STD_LOGIC;
signal NET218 : STD_LOGIC;
signal NET307 : STD_LOGIC;
signal NET465 : STD_LOGIC;
signal NET560 : STD_LOGIC;
signal NET588 : STD_LOGIC;
signal NET668 : STD_LOGIC;
signal NET726 : STD_LOGIC;
signal BUS334 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS361 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS416 : STD_LOGIC_VECTOR(127 downto 0);
signal BUS568 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS600 : STD_LOGIC_VECTOR(127 downto 0);
signal BUS684 : STD_LOGIC_VECTOR(31 downto 0);

begin

----  Component instantiations  ----

U1 : CacheInstrucoes
  port map(
       DadoIn => BUS416,
       DadoOut => Instrucao,
       EndIn => EndInst,
       EndOut => BUS568,
       Hit => HitInst,
       MemPronta => NET465,
       MemRead => NET560,
       Miss => MissInst,
       clock => clock,
       reset => reset
  );

U2 : CacheDados
  port map(
       CacheRead => ReadDado,
       CacheWrite => WriteDado,
       DadoInMP => BUS600,
       DadoInProc => DadoIn,
       DadoOutMP => BUS361,
       DadoOutProc => DadoOut,
       DadoSalvo => NET307,
       EndIn => EndDado,
       EndOut => BUS684,
       Hit => HitDado,
       MemPronta => NET588,
       MemRead => NET668,
       MemWrite => NET163,
       Miss => MissDado,
       clock => clock,
       reset => reset
  );

U3 : MemoriaPrincipal
  port map(
       DadoDadoIn => BUS334,
       DadoDadoOut => BUS600,
       DadoInst => BUS416,
       DadoPronto => NET588,
       DadoSalvo => NET218,
       EndDado => BUS684,
       EndInst => BUS568,
       InstPronta => NET465,
       ReadDado => NET668,
       ReadInst => NET560,
       WriteDado => NET176,
       clockmp => clockmp,
       reset => reset
  );

U4 : WriteBufferCache
  port map(
       DadoIn => BUS361,
       DadoOut => BUS334,
       DadoSalvoIn => NET218,
       DadoSalvoOut => NET307,
       MemWriteIn => NET163,
       MemWriteOut => NET176,
       clock => NET726,
       reset => reset
  );

NET726 <= not(clock);


end HierarquiaDeMemoria;
