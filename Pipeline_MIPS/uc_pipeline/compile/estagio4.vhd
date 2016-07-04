-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : uc_pipeline
-- Author      : Priscilla
-- Company     : x
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\uc_pipeline\uc_pipeline\compile\estagio4.vhd
-- Generated   : Sun Jul  3 22:45:12 2016
-- From        : C:\My_Designs\uc_pipeline\uc_pipeline\src\estagio4.bde
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


entity estagio3 is
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
end estagio3;

architecture estagio3 of estagio3 is

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

---- Signal declarations used on the diagram ----

signal e1 : STD_LOGIC_VECTOR(31 downto 0);
signal e2 : STD_LOGIC_VECTOR(31 downto 0);
signal saida : STD_LOGIC_VECTOR(31 downto 0);

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

U4 : mux32bitsX2
  port map(
       e1 => e1,
       e2 => e2,
       op => ctrlmuxMEM,
       saida => saida
  );


---- Terminal assignment ----

    -- Inputs terminals
	e2 <= muxest2;
	e1 <= resULA;

    -- Output\buffer terminals
	saidaParaCache <= saida;


end estagio3;
