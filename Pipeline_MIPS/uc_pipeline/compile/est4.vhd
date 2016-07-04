-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : uc_pipeline
-- Author      : Priscilla
-- Company     : x
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\uc_pipeline\uc_pipeline\compile\est4.vhd
-- Generated   : Mon Jul  4 01:05:12 2016
-- From        : C:\My_Designs\uc_pipeline\uc_pipeline\src\est4.bde
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


entity est4 is
  port(
       clock : in STD_LOGIC;
       ctrlMux5 : in STD_LOGIC;
       ctrlmuxMEM : in STD_LOGIC;
       wb : in STD_LOGIC;
       entradaImed : in STD_LOGIC_VECTOR(4 downto 0);
       entradaResULA : in STD_LOGIC_VECTOR(31 downto 0);
       entradaVemDocache : in STD_LOGIC_VECTOR(31 downto 0);
       muxest2 : in STD_LOGIC_VECTOR(31 downto 0);
       resULA : in STD_LOGIC_VECTOR(31 downto 0);
       sctrlMux5 : out STD_LOGIC;
       wbsaida : out STD_LOGIC;
       saidaImed : out STD_LOGIC_VECTOR(4 downto 0);
       saidaParaCache : out STD_LOGIC_VECTOR(31 downto 0);
       saidaResULA : out STD_LOGIC_VECTOR(31 downto 0);
       saidacache : out STD_LOGIC_VECTOR(31 downto 0)
  );
end est4;

architecture est4 of est4 is

---- Component declarations -----

component mux32bitsX2
  port (
       e1 : in STD_LOGIC_VECTOR(31 downto 0);
       e2 : in STD_LOGIC_VECTOR(31 downto 0);
       op : in STD_LOGIC;
       saida : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component regestagio4
  port (
       clock : in STD_LOGIC;
       ctrlMux5 : in STD_LOGIC;
       entradaImed : in STD_LOGIC_VECTOR(4 downto 0);
       entradaResULA : in STD_LOGIC_VECTOR(31 downto 0);
       entradaVemDocache : in STD_LOGIC_VECTOR(31 downto 0);
       wb : in STD_LOGIC;
       saidaImed : out STD_LOGIC_VECTOR(4 downto 0);
       saidaResULA : out STD_LOGIC_VECTOR(31 downto 0);
       saidacache : out STD_LOGIC_VECTOR(31 downto 0);
       sctrlMux5 : out STD_LOGIC;
       wbsaida : out STD_LOGIC
  );
end component;

begin

----  Component instantiations  ----

U1 : regestagio4
  port map(
       clock => clock,
       ctrlMux5 => ctrlMux5,
       entradaImed => entradaImed,
       entradaResULA => entradaResULA,
       entradaVemDocache => entradaVemDocache,
       saidaImed => saidaImed,
       saidaResULA => saidaResULA,
       saidacache => saidacache,
       sctrlMux5 => sctrlMux5,
       wb => wb,
       wbsaida => wbsaida
  );

U2 : mux32bitsX2
  port map(
       e1 => resULA,
       e2 => muxest2,
       op => ctrlmuxMEM,
       saida => saidaParaCache
  );


end est4;
