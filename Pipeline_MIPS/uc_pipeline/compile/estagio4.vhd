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
-- Generated   : Sun Jul  3 20:27:53 2016
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
       wb : in STD_LOGIC;
       entradaResULA : in STD_LOGIC_VECTOR(4 downto 0);
       entradacache : in STD_LOGIC_VECTOR(4 downto 0);
       resMUX : in STD_LOGIC_VECTOR(4 downto 0);
       sctrlMux5 : out STD_LOGIC;
       wbFowarding : out STD_LOGIC;
       wbsaida : out STD_LOGIC;
       ResULACache : out STD_LOGIC_VECTOR(4 downto 0);
       ResULAEstagio3 : out STD_LOGIC_VECTOR(4 downto 0);
       muxFowarding : out STD_LOGIC_VECTOR(4 downto 0);
       saida3 : out STD_LOGIC_VECTOR(4 downto 0);
       saidaResULA : out STD_LOGIC_VECTOR(4 downto 0);
       saidacache : out STD_LOGIC_VECTOR(4 downto 0)
  );
end estagio3;

architecture estagio3 of estagio3 is

---- Component declarations -----

component regestagio4
  port (
       clock : in STD_LOGIC;
       ctrlMux5 : in STD_LOGIC;
       entrada3 : in STD_LOGIC_VECTOR(4 downto 0);
       entradaResULA : in STD_LOGIC_VECTOR(4 downto 0);
       entradacache : in STD_LOGIC_VECTOR(4 downto 0);
       wb : in STD_LOGIC;
       saida3 : out STD_LOGIC_VECTOR(4 downto 0);
       saidaResULA : out STD_LOGIC_VECTOR(4 downto 0);
       saidacache : out STD_LOGIC_VECTOR(4 downto 0);
       sctrlMux5 : out STD_LOGIC;
       wbsaida : out STD_LOGIC
  );
end component;

---- Signal declarations used on the diagram ----

signal NET269 : STD_LOGIC;
signal entrada3 : STD_LOGIC_VECTOR(4 downto 0);

begin

----  Component instantiations  ----

U1 : regestagio4
  port map(
       clock => clock,
       ctrlMux5 => ctrlMux5,
       entrada3 => entrada3,
       entradaResULA => entradaResULA,
       entradacache => entradacache,
       saida3 => saida3,
       saidaResULA => saidaResULA,
       saidacache => saidacache,
       sctrlMux5 => sctrlMux5,
       wb => NET269,
       wbsaida => wbsaida
  );


---- Terminal assignment ----

    -- Inputs terminals
	entrada3 <= resMUX;
	NET269 <= wb;

    -- Output\buffer terminals
	ResULACache <= entradaResULA;
	ResULAEstagio3 <= entradaResULA;
	muxFowarding <= entrada3;
	wbFowarding <= NET269;


end estagio3;
