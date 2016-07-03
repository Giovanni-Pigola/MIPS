-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : uc_pipeline
-- Author      : Priscilla
-- Company     : x
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\uc_pipeline\uc_pipeline\compile\estagio2.vhd
-- Generated   : Sun Jul  3 15:04:12 2016
-- From        : c:\My_Designs\uc_pipeline\uc_pipeline\src\estagio2.bde
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
       ctrlMux3 : in STD_LOGIC;
       ctrlMux32 : in STD_LOGIC;
       ctrlMux5 : in STD_LOGIC;
       ctrlULA : in STD_LOGIC;
       hazardCtrl : in STD_LOGIC;
       we : in STD_LOGIC;
       enda : in STD_LOGIC_VECTOR(4 downto 0);
       endb : in STD_LOGIC_VECTOR(4 downto 0);
       entrada : in STD_LOGIC_VECTOR(31 downto 0);
       entradaPC : in STD_LOGIC_VECTOR(31 downto 0);
       exsaida : out STD_LOGIC;
       msaida : out STD_LOGIC;
       sctrlMux3 : out STD_LOGIC;
       sctrlMux32 : out STD_LOGIC;
       sctrlMux5 : out STD_LOGIC;
       sctrlULA : out STD_LOGIC;
       wbsaida : out STD_LOGIC;
       saida2016 : out STD_LOGIC_VECTOR(4 downto 0);
       saida2521 : out STD_LOGIC_VECTOR(4 downto 0);
       saidaEstagio2 : out STD_LOGIC_VECTOR(31 downto 0);
       saidaGPR2016 : out STD_LOGIC_VECTOR(4 downto 0);
       saidaGPR2521 : out STD_LOGIC_VECTOR(4 downto 0);
       saidaPC : out STD_LOGIC_VECTOR(31 downto 0)
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
       dadoina : in STD_LOGIC_VECTOR(4 downto 0);
       dadoinb : in STD_LOGIC_VECTOR(4 downto 0);
       enda : in STD_LOGIC_VECTOR(4 downto 0);
       endb : in STD_LOGIC_VECTOR(4 downto 0);
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
component regestagio2
  port (
       clock : in STD_LOGIC;
       ctrlMux3 : in STD_LOGIC;
       ctrlMux32 : in STD_LOGIC;
       ctrlMux5 : in STD_LOGIC;
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
       saida2016 : out STD_LOGIC_VECTOR(4 downto 0);
       saida2521 : out STD_LOGIC_VECTOR(4 downto 0);
       saida32bits : out STD_LOGIC_VECTOR(31 downto 0);
       saidaGPR2016 : out STD_LOGIC_VECTOR(31 downto 0);
       saidaGPR2521 : out STD_LOGIC_VECTOR(31 downto 0);
       saidaPC : out STD_LOGIC_VECTOR(31 downto 0);
       sctrlMux3 : out STD_LOGIC;
       sctrlMux32 : out STD_LOGIC;
       sctrlMux5 : out STD_LOGIC;
       sctrlULA : out STD_LOGIC;
       wbsaida : out STD_LOGIC
  );
end component;
component soma32bits
  port (
       A : in STD_LOGIC_VECTOR(31 downto 0);
       B : in STD_LOGIC_VECTOR(31 downto 0);
       C : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

----     Constants     -----
constant DANGLING_INPUT_CONSTANT : STD_LOGIC := 'Z';

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

---- Declaration for Dangling input ----
signal Dangling_Input_Signal : STD_LOGIC;

---- Declarations for Dangling outputs ----
signal DANGLING_U4_saidaGPR2016_26 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2016_25 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2016_24 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2016_23 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2016_22 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2016_21 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2016_20 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2016_19 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2016_18 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2016_17 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2016_16 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2016_15 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2016_14 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2016_13 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2016_12 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2016_11 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2016_10 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2016_9 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2016_8 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2016_7 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2016_6 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2016_5 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2016_4 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2016_3 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2016_2 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2016_1 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2016_0 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2521_26 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2521_25 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2521_24 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2521_23 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2521_22 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2521_21 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2521_20 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2521_19 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2521_18 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2521_17 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2521_16 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2521_15 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2521_14 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2521_13 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2521_12 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2521_11 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2521_10 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2521_9 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2521_8 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2521_7 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2521_6 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2521_5 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2521_4 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2521_3 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2521_2 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2521_1 : STD_LOGIC;
signal DANGLING_U4_saidaGPR2521_0 : STD_LOGIC;

begin

----  Component instantiations  ----

U1 : concatena
  port map(
       entrada => entrada,
       saida => BUS439
  );

NET51 <= UCCtrl or hazardCtrl;

U3 : gpr
  port map(
       dadoina(0) => entrada(21),
       dadoina(1) => entrada(22),
       dadoina(2) => entrada(23),
       dadoina(3) => entrada(24),
       dadoina(4) => entrada(25),
       dadoinb(0) => entrada(16),
       dadoinb(1) => entrada(17),
       dadoinb(2) => entrada(18),
       dadoinb(3) => entrada(19),
       dadoinb(4) => entrada(20),
       dadoouta => BUS678,
       dadooutb => BUS715,
       enda => enda,
       endb => endb,
       reset => Dangling_Input_Signal,
       we => we
  );

U4 : regestagio2
  port map(
       saidaGPR2016(0) => DANGLING_U4_saidaGPR2016_0,
       saidaGPR2016(1) => DANGLING_U4_saidaGPR2016_1,
       saidaGPR2016(2) => DANGLING_U4_saidaGPR2016_2,
       saidaGPR2016(3) => DANGLING_U4_saidaGPR2016_3,
       saidaGPR2016(4) => DANGLING_U4_saidaGPR2016_4,
       saidaGPR2016(5) => DANGLING_U4_saidaGPR2016_5,
       saidaGPR2016(6) => DANGLING_U4_saidaGPR2016_6,
       saidaGPR2016(7) => DANGLING_U4_saidaGPR2016_7,
       saidaGPR2016(8) => DANGLING_U4_saidaGPR2016_8,
       saidaGPR2016(9) => DANGLING_U4_saidaGPR2016_9,
       saidaGPR2016(10) => DANGLING_U4_saidaGPR2016_10,
       saidaGPR2016(11) => DANGLING_U4_saidaGPR2016_11,
       saidaGPR2016(12) => DANGLING_U4_saidaGPR2016_12,
       saidaGPR2016(13) => DANGLING_U4_saidaGPR2016_13,
       saidaGPR2016(14) => DANGLING_U4_saidaGPR2016_14,
       saidaGPR2016(15) => DANGLING_U4_saidaGPR2016_15,
       saidaGPR2016(16) => DANGLING_U4_saidaGPR2016_16,
       saidaGPR2016(17) => DANGLING_U4_saidaGPR2016_17,
       saidaGPR2016(18) => DANGLING_U4_saidaGPR2016_18,
       saidaGPR2016(19) => DANGLING_U4_saidaGPR2016_19,
       saidaGPR2016(20) => DANGLING_U4_saidaGPR2016_20,
       saidaGPR2016(21) => DANGLING_U4_saidaGPR2016_21,
       saidaGPR2016(22) => DANGLING_U4_saidaGPR2016_22,
       saidaGPR2016(23) => DANGLING_U4_saidaGPR2016_23,
       saidaGPR2016(24) => DANGLING_U4_saidaGPR2016_24,
       saidaGPR2016(25) => DANGLING_U4_saidaGPR2016_25,
       saidaGPR2016(26) => DANGLING_U4_saidaGPR2016_26,
       saidaGPR2016(27) => saidaGPR2016(0),
       saidaGPR2016(28) => saidaGPR2016(1),
       saidaGPR2016(29) => saidaGPR2016(2),
       saidaGPR2016(30) => saidaGPR2016(3),
       saidaGPR2016(31) => saidaGPR2016(4),
       saidaGPR2521(0) => DANGLING_U4_saidaGPR2521_0,
       saidaGPR2521(1) => DANGLING_U4_saidaGPR2521_1,
       saidaGPR2521(2) => DANGLING_U4_saidaGPR2521_2,
       saidaGPR2521(3) => DANGLING_U4_saidaGPR2521_3,
       saidaGPR2521(4) => DANGLING_U4_saidaGPR2521_4,
       saidaGPR2521(5) => DANGLING_U4_saidaGPR2521_5,
       saidaGPR2521(6) => DANGLING_U4_saidaGPR2521_6,
       saidaGPR2521(7) => DANGLING_U4_saidaGPR2521_7,
       saidaGPR2521(8) => DANGLING_U4_saidaGPR2521_8,
       saidaGPR2521(9) => DANGLING_U4_saidaGPR2521_9,
       saidaGPR2521(10) => DANGLING_U4_saidaGPR2521_10,
       saidaGPR2521(11) => DANGLING_U4_saidaGPR2521_11,
       saidaGPR2521(12) => DANGLING_U4_saidaGPR2521_12,
       saidaGPR2521(13) => DANGLING_U4_saidaGPR2521_13,
       saidaGPR2521(14) => DANGLING_U4_saidaGPR2521_14,
       saidaGPR2521(15) => DANGLING_U4_saidaGPR2521_15,
       saidaGPR2521(16) => DANGLING_U4_saidaGPR2521_16,
       saidaGPR2521(17) => DANGLING_U4_saidaGPR2521_17,
       saidaGPR2521(18) => DANGLING_U4_saidaGPR2521_18,
       saidaGPR2521(19) => DANGLING_U4_saidaGPR2521_19,
       saidaGPR2521(20) => DANGLING_U4_saidaGPR2521_20,
       saidaGPR2521(21) => DANGLING_U4_saidaGPR2521_21,
       saidaGPR2521(22) => DANGLING_U4_saidaGPR2521_22,
       saidaGPR2521(23) => DANGLING_U4_saidaGPR2521_23,
       saidaGPR2521(24) => DANGLING_U4_saidaGPR2521_24,
       saidaGPR2521(25) => DANGLING_U4_saidaGPR2521_25,
       saidaGPR2521(26) => DANGLING_U4_saidaGPR2521_26,
       saidaGPR2521(27) => saidaGPR2521(0),
       saidaGPR2521(28) => saidaGPR2521(1),
       saidaGPR2521(29) => saidaGPR2521(2),
       saidaGPR2521(30) => saidaGPR2521(3),
       saidaGPR2521(31) => saidaGPR2521(4),
       clock => clock,
       ctrlMux3 => ctrlMux3,
       ctrlMux32 => ctrlMux32,
       ctrlMux5 => ctrlMux5,
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
       saida2016 => saida2016,
       saida2521 => saida2521,
       saidaPC => saidaPC,
       sctrlMux3 => sctrlMux3,
       sctrlMux32 => sctrlMux32,
       sctrlMux5 => sctrlMux5,
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


---- Terminal assignment ----

    -- Inputs terminals
	Input4 <= UCCtrl2;
	B <= entradaPC;

    -- Output\buffer terminals
	saidaEstagio2 <= C;


---- Dangling input signal assignment ----

Dangling_Input_Signal <= DANGLING_INPUT_CONSTANT;

end estagio2;
