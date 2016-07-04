-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : uc_pipeline
-- Author      : Priscilla
-- Company     : x
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\uc_pipeline\uc_pipeline\compile\estagio2.vhd
-- Generated   : Mon Jul  4 02:38:25 2016
-- From        : C:\My_Designs\uc_pipeline\uc_pipeline\src\estagio2.bde
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


entity estagio2 is
  port(
       UCCtrl : in STD_LOGIC;
       UCCtrl2 : in STD_LOGIC;
       clock : in STD_LOGIC;
       ctrlJal : in STD_LOGIC;
       ctrlMux3 : in STD_LOGIC;
       ctrlMux32 : in STD_LOGIC;
       ctrlMux5 : in STD_LOGIC;
       ctrlMuxMEM : in STD_LOGIC;
       ctrlULA : in STD_LOGIC;
       hazardCtrl : in STD_LOGIC;
       reset : in STD_LOGIC;
       we : in STD_LOGIC;
       dadoina : in STD_LOGIC_VECTOR(4 downto 0);
       dadoinb : in STD_LOGIC_VECTOR(4 downto 0);
       entrada : in STD_LOGIC_VECTOR(31 downto 0);
       entradaPC : in STD_LOGIC_VECTOR(31 downto 0);
       exsaida : out STD_LOGIC;
       msaida : out STD_LOGIC;
       sctrlMux3 : out STD_LOGIC;
       sctrlMux32 : out STD_LOGIC;
       sctrlMux5 : out STD_LOGIC;
       sctrlMuxMEM : out STD_LOGIC;
       sctrlULA : out STD_LOGIC;
       wbsaida : out STD_LOGIC;
       saida1511 : out STD_LOGIC_VECTOR(4 downto 0);
       saida2016 : out STD_LOGIC_VECTOR(4 downto 0);
       saida2521 : out STD_LOGIC_VECTOR(4 downto 0);
       saidaEstagio2 : out STD_LOGIC_VECTOR(31 downto 0);
       saidaGPR2016 : out STD_LOGIC_VECTOR(31 downto 0);
       saidaGPR2521 : out STD_LOGIC_VECTOR(31 downto 0);
       saidaPC : out STD_LOGIC_VECTOR(31 downto 0);
       saidaShamt : out STD_LOGIC_VECTOR(4 downto 0)
  );
end estagio2;

architecture estagio2 of estagio2 is

---- Component declarations -----

component concatena
  port (
       entrada : in STD_LOGIC_VECTOR(31 downto 0);
       saida : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component deslocador2
  port (
       entrada : in STD_LOGIC_VECTOR(31 downto 0);
       saida : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component gpr
-- synthesis translate_off
  generic(
       Tread : TIME := 5 ns;
       Twrite : TIME := 5 ns
  );
-- synthesis translate_on
  port (
       ctrlJal : in STD_LOGIC;
       dadoina : in STD_LOGIC_VECTOR(4 downto 0);
       dadoinb : in STD_LOGIC_VECTOR(4 downto 0);
       enda : in STD_LOGIC_VECTOR(4 downto 0);
       endb : in STD_LOGIC_VECTOR(4 downto 0);
       pcin : in STD_LOGIC_VECTOR(31 downto 0);
       reset : in STD_LOGIC;
       we : in STD_LOGIC;
       dadoouta : out STD_LOGIC_VECTOR(4 downto 0);
       dadooutb : out STD_LOGIC_VECTOR(4 downto 0)
  );
end component;
component mux2x1zero
  port (
       In1 : in STD_LOGIC;
       S : in STD_LOGIC;
       O : out STD_LOGIC
  );
end component;
component soma32bits
  port (
       A : in STD_LOGIC_VECTOR(31 downto 0);
       B : in STD_LOGIC_VECTOR(31 downto 0);
       C : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component regestagio2
  port (
       clock : in STD_LOGIC;
       ctrlMux3 : in STD_LOGIC;
       ctrlMux32 : in STD_LOGIC;
       ctrlMux5 : in STD_LOGIC;
       ctrlMuxMEM : in STD_LOGIC;
       ctrlULA : in STD_LOGIC;
       entrada32bits : in STD_LOGIC_VECTOR(31 downto 0);
       entradaGPR2016 : in STD_LOGIC_VECTOR(4 downto 0);
       entradaGPR2521 : in STD_LOGIC_VECTOR(4 downto 0);
       entradaPC : in STD_LOGIC_VECTOR(31 downto 0);
       entradaSignExtend : in STD_LOGIC_VECTOR(31 downto 0);
       ex : in STD_LOGIC;
       m : in STD_LOGIC;
       wb : in STD_LOGIC;
       exsaida : out STD_LOGIC;
       msaida : out STD_LOGIC;
       saida1511 : out STD_LOGIC_VECTOR(4 downto 0);
       saida2016 : out STD_LOGIC_VECTOR(4 downto 0);
       saida2521 : out STD_LOGIC_VECTOR(4 downto 0);
       saidaGPR2016 : out STD_LOGIC_VECTOR(31 downto 0);
       saidaGPR2521 : out STD_LOGIC_VECTOR(31 downto 0);
       saidaPC : out STD_LOGIC_VECTOR(31 downto 0);
       saidaShamt : out STD_LOGIC_VECTOR(4 downto 0);
       sctrlMux3 : out STD_LOGIC;
       sctrlMux32 : out STD_LOGIC;
       sctrlMux5 : out STD_LOGIC;
       sctrlMuxMEM : out STD_LOGIC;
       sctrlULA : out STD_LOGIC;
       wbsaida : out STD_LOGIC
  );
end component;

---- Signal declarations used on the diagram ----

signal Input4 : STD_LOGIC;
signal NET51 : STD_LOGIC;
signal NET71 : STD_LOGIC;
signal B : STD_LOGIC_VECTOR(31 downto 0);
signal BUS417 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS439 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS678 : STD_LOGIC_VECTOR(4 downto 0);
signal BUS715 : STD_LOGIC_VECTOR(4 downto 0);
signal C : STD_LOGIC_VECTOR(31 downto 0);

begin

----  Component instantiations  ----

U1 : concatena
  port map(
       entrada => entrada,
       saida => BUS439
  );

NET51 <= UCCtrl or hazardCtrl;

U4 : regestagio2
  port map(
       clock => clock,
       ctrlMux3 => ctrlMux3,
       ctrlMux32 => ctrlMux32,
       ctrlMux5 => ctrlMux5,
       ctrlMuxMEM => ctrlMuxMEM,
       ctrlULA => ctrlULA,
       entrada32bits => entrada,
       entradaGPR2016 => BUS715,
       entradaGPR2521 => BUS678,
       entradaPC => B,
       entradaSignExtend => BUS439,
       ex => NET71,
       exsaida => exsaida,
       m => NET71,
       msaida => msaida,
       saida1511 => saida1511,
       saida2016 => saida2016,
       saida2521 => saida2521,
       saidaGPR2016 => saidaGPR2016,
       saidaGPR2521 => saidaGPR2521,
       saidaPC => saidaPC,
       saidaShamt => saidaShamt,
       sctrlMux3 => sctrlMux3,
       sctrlMux32 => sctrlMux32,
       sctrlMux5 => sctrlMux5,
       sctrlMuxMEM => sctrlMuxMEM,
       sctrlULA => sctrlULA,
       wb => NET71,
       wbsaida => wbsaida
  );

U5 : mux2x1zero
  port map(
       In1 => Input4,
       O => NET71,
       S => NET51
  );

U6 : soma32bits
  port map(
       A => BUS417,
       B => B,
       C => C
  );

U7 : deslocador2
  port map(
       entrada => BUS439,
       saida => BUS417
  );

U8 : gpr
  port map(
       enda(0) => entrada(21),
       enda(1) => entrada(22),
       enda(2) => entrada(23),
       enda(3) => entrada(24),
       enda(4) => entrada(25),
       endb(0) => entrada(16),
       endb(1) => entrada(17),
       endb(2) => entrada(18),
       endb(3) => entrada(19),
       endb(4) => entrada(20),
       ctrlJal => ctrlJal,
       dadoina => dadoina,
       dadoinb => dadoinb,
       dadoouta => BUS678,
       dadooutb => BUS715,
       pcin => B,
       reset => reset,
       we => we
  );


---- Terminal assignment ----

    -- Inputs terminals
	Input4 <= UCCtrl2;
	B <= entradaPC;

    -- Output\buffer terminals
	saidaEstagio2 <= C;


end estagio2;
