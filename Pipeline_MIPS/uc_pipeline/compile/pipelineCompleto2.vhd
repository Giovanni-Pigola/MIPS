-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : uc_pipeline
-- Author      : Priscilla
-- Company     : x
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\uc_pipeline\uc_pipeline\compile\pipelineCompleto2.vhd
-- Generated   : Mon Jul  4 02:42:44 2016
-- From        : C:\My_Designs\uc_pipeline\uc_pipeline\src\pipelineCompleto2.bde
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


entity pipelineCompleto2 is
  port(
       UCctrl : in STD_LOGIC;
       clock : in STD_LOGIC;
       ctrlJal : in STD_LOGIC;
       hazardctrl : in STD_LOGIC;
       reset : in STD_LOGIC;
       entradaCache : in STD_LOGIC_VECTOR(31 downto 0);
       entradaVemDocache : in STD_LOGIC_VECTOR(31 downto 0);
       exsaida : out STD_LOGIC;
       instrucaoInvalida : out STD_LOGIC;
       m_out : out STD_LOGIC;
       contBolha : out STD_LOGIC_VECTOR(7 downto 0);
       contInst : out STD_LOGIC_VECTOR(7 downto 0);
       saidaCache : out STD_LOGIC_VECTOR(31 downto 0);
       saidaParaCache : out STD_LOGIC_VECTOR(31 downto 0);
       saidaResULA : out STD_LOGIC_VECTOR(31 downto 0);
       saidaepc : out STD_LOGIC_VECTOR(31 downto 0)
  );
end pipelineCompleto2;

architecture pipelineCompleto2 of pipelineCompleto2 is

---- Component declarations -----

component estagio3
  port (
       UCctrl : in STD_LOGIC;
       Ulaestagio4 : in STD_LOGIC_VECTOR(31 downto 0);
       clock : in STD_LOGIC;
       ctrlMux3 : in STD_LOGIC;
       ctrlMux5 : in STD_LOGIC;
       ctrlMuxMEM : in STD_LOGIC;
       entradaepc : in STD_LOGIC_VECTOR(31 downto 0);
       forwardingCtrl1 : in STD_LOGIC_VECTOR(1 downto 0);
       forwardingCtrl2 : in STD_LOGIC_VECTOR(1 downto 0);
       gpr2016 : in STD_LOGIC_VECTOR(31 downto 0);
       gpr2521 : in STD_LOGIC_VECTOR(31 downto 0);
       hazardctrl : in STD_LOGIC;
       i1511 : in STD_LOGIC_VECTOR(4 downto 0);
       i2016 : in STD_LOGIC_VECTOR(4 downto 0);
       m_ctrl : in STD_LOGIC;
       m_in : in STD_LOGIC;
       muxEstagio5 : in STD_LOGIC_VECTOR(31 downto 0);
       muxctrl : in STD_LOGIC;
       shamt : in STD_LOGIC_VECTOR(4 downto 0);
       ula_ctrl : in STD_LOGIC;
       wb_ctrl : in STD_LOGIC;
       wb_in : in STD_LOGIC;
       I1511out : out STD_LOGIC_VECTOR(4 downto 0);
       OVF : out STD_LOGIC;
       m_out : out STD_LOGIC;
       saidaImediato : out STD_LOGIC_VECTOR(4 downto 0);
       saidaMux : out STD_LOGIC_VECTOR(31 downto 0);
       saidaULA : out STD_LOGIC_VECTOR(31 downto 0);
       saidaepc : out STD_LOGIC_VECTOR(31 downto 0);
       sctrlMux5 : out STD_LOGIC;
       sctrlMuxMEM : out STD_LOGIC;
       wb_out : out STD_LOGIC
  );
end component;
component Forwarding
  port (
       EX_MEM_Rd : in STD_LOGIC_VECTOR(4 downto 0);
       ID_EX_Rs : in STD_LOGIC_VECTOR(4 downto 0);
       ID_EX_Rt : in STD_LOGIC_VECTOR(4 downto 0);
       MEM_WB_Rd : in STD_LOGIC_VECTOR(4 downto 0);
       wb_ctrl_e4 : in STD_LOGIC;
       wb_ctrl_e5 : in STD_LOGIC;
       ForwardA : out STD_LOGIC_VECTOR(1 downto 0);
       ForwardB : out STD_LOGIC_VECTOR(1 downto 0)
  );
end component;
component Hazard
  port (
       ID_EX_Rt : in STD_LOGIC_VECTOR(4 downto 0);
       IF_ID : in STD_LOGIC_VECTOR(31 downto 0);
       m_ctrl_e3 : in STD_LOGIC;
       HazardA : out STD_LOGIC;
       HazardB : out STD_LOGIC
  );
end component;
component unidadecontrole
  port (
       func : in STD_LOGIC_VECTOR(5 downto 0);
       opcode : in STD_LOGIC_VECTOR(5 downto 0);
       overflowULA : in STD_LOGIC;
       Mux1UCEst3 : out STD_LOGIC;
       Mux2UCEst3 : out STD_LOGIC;
       MuxEst3Ctrl : out STD_LOGIC;
       MuxEst3ulaCtrl : out STD_LOGIC;
       MuxEst5Ctrl : out STD_LOGIC;
       MuxInicioCtrl : out STD_LOGIC_VECTOR(1 downto 0);
       MuxMEM : out STD_LOGIC;
       RegEst1 : out STD_LOGIC;
       ULAEst3Ctrl : out STD_LOGIC;
       instrucaoInvalida : out STD_LOGIC;
       orCtrl : out STD_LOGIC;
       wb_m_exCtrl : out STD_LOGIC
  );
end component;
component est4
  port (
       I1511 : in STD_LOGIC_VECTOR(4 downto 0);
       clock : in STD_LOGIC;
       ctrlMux5 : in STD_LOGIC;
       ctrlmuxMEM : in STD_LOGIC;
       entradaImed : in STD_LOGIC_VECTOR(4 downto 0);
       entradaResULA : in STD_LOGIC_VECTOR(31 downto 0);
       entradaVemDocache : in STD_LOGIC_VECTOR(31 downto 0);
       muxest2 : in STD_LOGIC_VECTOR(31 downto 0);
       resULA : in STD_LOGIC_VECTOR(31 downto 0);
       wb : in STD_LOGIC;
       I1511out : out STD_LOGIC_VECTOR(4 downto 0);
       saidaImed : out STD_LOGIC_VECTOR(4 downto 0);
       saidaParaCache : out STD_LOGIC_VECTOR(31 downto 0);
       saidaResULA : out STD_LOGIC_VECTOR(31 downto 0);
       saidacache : out STD_LOGIC_VECTOR(31 downto 0);
       sctrlMux5 : out STD_LOGIC;
       wbsaida : out STD_LOGIC
  );
end component;
component estagio2
  port (
       UCCtrl : in STD_LOGIC;
       UCCtrl2 : in STD_LOGIC;
       clock : in STD_LOGIC;
       ctrlJal : in STD_LOGIC;
       ctrlMux3 : in STD_LOGIC;
       ctrlMux32 : in STD_LOGIC;
       ctrlMux5 : in STD_LOGIC;
       ctrlMuxMEM : in STD_LOGIC;
       ctrlULA : in STD_LOGIC;
       dadoina : in STD_LOGIC_VECTOR(4 downto 0);
       dadoinb : in STD_LOGIC_VECTOR(4 downto 0);
       entrada : in STD_LOGIC_VECTOR(31 downto 0);
       entradaPC : in STD_LOGIC_VECTOR(31 downto 0);
       hazardCtrl : in STD_LOGIC;
       reset : in STD_LOGIC;
       we : in STD_LOGIC;
       exsaida : out STD_LOGIC;
       msaida : out STD_LOGIC;
       saida1511 : out STD_LOGIC_VECTOR(4 downto 0);
       saida2016 : out STD_LOGIC_VECTOR(4 downto 0);
       saida2521 : out STD_LOGIC_VECTOR(4 downto 0);
       saidaEstagio2 : out STD_LOGIC_VECTOR(31 downto 0);
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
component estagio5
  port (
       ctrlMux5 : in STD_LOGIC;
       eCache : in STD_LOGIC_VECTOR(31 downto 0);
       eULA : in STD_LOGIC_VECTOR(31 downto 0);
       inst : in STD_LOGIC;
       reset : in STD_LOGIC;
       contBolha : out STD_LOGIC_VECTOR(7 downto 0);
       contInst : out STD_LOGIC_VECTOR(7 downto 0);
       saidaMux : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component testes
  port (
       UCctrl : in STD_LOGIC;
       clock : in STD_LOGIC;
       entEstagio2 : in STD_LOGIC_VECTOR(31 downto 0);
       entradaCache : in STD_LOGIC_VECTOR(31 downto 0);
       entradaJR : in STD_LOGIC_VECTOR(31 downto 0);
       hazardctrl : in STD_LOGIC;
       hazardctrlPC : in STD_LOGIC;
       op : in STD_LOGIC_VECTOR(1 downto 0);
       endereco : out STD_LOGIC_VECTOR(31 downto 0);
       instrucao : out STD_LOGIC_VECTOR(31 downto 0);
       saidaCache : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

----     Constants     -----
constant DANGLING_INPUT_CONSTANT : STD_LOGIC := 'Z';

---- Signal declarations used on the diagram ----

signal NET235 : STD_LOGIC;
signal NET270 : STD_LOGIC;
signal NET277 : STD_LOGIC;
signal NET285 : STD_LOGIC;
signal NET303 : STD_LOGIC;
signal NET311 : STD_LOGIC;
signal NET393 : STD_LOGIC;
signal NET401 : STD_LOGIC;
signal NET416 : STD_LOGIC;
signal NET431 : STD_LOGIC;
signal NET451 : STD_LOGIC;
signal NET465 : STD_LOGIC;
signal NET479 : STD_LOGIC;
signal NET487 : STD_LOGIC;
signal NET522 : STD_LOGIC;
signal NET543 : STD_LOGIC;
signal NET549 : STD_LOGIC;
signal NET564 : STD_LOGIC;
signal NET603 : STD_LOGIC;
signal NET627 : STD_LOGIC;
signal NET643 : STD_LOGIC;
signal NET663 : STD_LOGIC;
signal NET675 : STD_LOGIC;
signal NET684 : STD_LOGIC;
signal NET875 : STD_LOGIC;
signal BUS110 : STD_LOGIC_VECTOR(4 downto 0);
signal BUS1121 : STD_LOGIC_VECTOR(4 downto 0);
signal BUS117 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS126 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS1344 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS150 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS167 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS178 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS186 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS193 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS199 : STD_LOGIC_VECTOR(4 downto 0);
signal BUS207 : STD_LOGIC_VECTOR(4 downto 0);
signal BUS218 : STD_LOGIC_VECTOR(4 downto 0);
signal BUS223 : STD_LOGIC_VECTOR(1 downto 0);
signal BUS229 : STD_LOGIC_VECTOR(1 downto 0);
signal BUS317 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS319 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS354 : STD_LOGIC_VECTOR(4 downto 0);
signal BUS530 : STD_LOGIC_VECTOR(1 downto 0);
signal BUS772 : STD_LOGIC_VECTOR(4 downto 0);
signal BUS787 : STD_LOGIC_VECTOR(4 downto 0);
signal BUS789 : STD_LOGIC_VECTOR(4 downto 0);

---- Declaration for Dangling input ----
signal Dangling_Input_Signal : STD_LOGIC;

---- Declarations for Dangling outputs ----
signal DANGLING_U1_endereco_25 : STD_LOGIC;
signal DANGLING_U1_endereco_24 : STD_LOGIC;
signal DANGLING_U1_endereco_23 : STD_LOGIC;
signal DANGLING_U1_endereco_22 : STD_LOGIC;
signal DANGLING_U1_endereco_21 : STD_LOGIC;
signal DANGLING_U1_endereco_20 : STD_LOGIC;
signal DANGLING_U1_endereco_19 : STD_LOGIC;
signal DANGLING_U1_endereco_18 : STD_LOGIC;
signal DANGLING_U1_endereco_17 : STD_LOGIC;
signal DANGLING_U1_endereco_16 : STD_LOGIC;
signal DANGLING_U1_endereco_15 : STD_LOGIC;
signal DANGLING_U1_endereco_14 : STD_LOGIC;
signal DANGLING_U1_endereco_13 : STD_LOGIC;
signal DANGLING_U1_endereco_12 : STD_LOGIC;
signal DANGLING_U1_endereco_11 : STD_LOGIC;
signal DANGLING_U1_endereco_10 : STD_LOGIC;
signal DANGLING_U1_endereco_9 : STD_LOGIC;
signal DANGLING_U1_endereco_8 : STD_LOGIC;
signal DANGLING_U1_endereco_7 : STD_LOGIC;
signal DANGLING_U1_endereco_6 : STD_LOGIC;
signal DANGLING_U1_endereco_5 : STD_LOGIC;
signal DANGLING_U1_endereco_4 : STD_LOGIC;
signal DANGLING_U1_endereco_3 : STD_LOGIC;
signal DANGLING_U1_endereco_2 : STD_LOGIC;
signal DANGLING_U1_endereco_1 : STD_LOGIC;
signal DANGLING_U1_endereco_0 : STD_LOGIC;
signal DANGLING_U4_saidaMux_26 : STD_LOGIC;
signal DANGLING_U4_saidaMux_25 : STD_LOGIC;
signal DANGLING_U4_saidaMux_24 : STD_LOGIC;
signal DANGLING_U4_saidaMux_23 : STD_LOGIC;
signal DANGLING_U4_saidaMux_22 : STD_LOGIC;
signal DANGLING_U4_saidaMux_21 : STD_LOGIC;
signal DANGLING_U4_saidaMux_20 : STD_LOGIC;
signal DANGLING_U4_saidaMux_19 : STD_LOGIC;
signal DANGLING_U4_saidaMux_18 : STD_LOGIC;
signal DANGLING_U4_saidaMux_17 : STD_LOGIC;
signal DANGLING_U4_saidaMux_16 : STD_LOGIC;
signal DANGLING_U4_saidaMux_15 : STD_LOGIC;
signal DANGLING_U4_saidaMux_14 : STD_LOGIC;
signal DANGLING_U4_saidaMux_13 : STD_LOGIC;
signal DANGLING_U4_saidaMux_12 : STD_LOGIC;
signal DANGLING_U4_saidaMux_11 : STD_LOGIC;
signal DANGLING_U4_saidaMux_10 : STD_LOGIC;
signal DANGLING_U4_saidaMux_9 : STD_LOGIC;
signal DANGLING_U4_saidaMux_8 : STD_LOGIC;
signal DANGLING_U4_saidaMux_7 : STD_LOGIC;
signal DANGLING_U4_saidaMux_6 : STD_LOGIC;
signal DANGLING_U4_saidaMux_5 : STD_LOGIC;
signal DANGLING_U4_saidaMux_4 : STD_LOGIC;
signal DANGLING_U4_saidaMux_3 : STD_LOGIC;
signal DANGLING_U4_saidaMux_2 : STD_LOGIC;
signal DANGLING_U4_saidaMux_1 : STD_LOGIC;
signal DANGLING_U4_saidaMux_0 : STD_LOGIC;

begin

----  Component instantiations  ----

U1 : testes
  port map(
       endereco(0) => DANGLING_U1_endereco_0,
       endereco(1) => DANGLING_U1_endereco_1,
       endereco(2) => DANGLING_U1_endereco_2,
       endereco(3) => DANGLING_U1_endereco_3,
       endereco(4) => DANGLING_U1_endereco_4,
       endereco(5) => DANGLING_U1_endereco_5,
       endereco(6) => DANGLING_U1_endereco_6,
       endereco(7) => DANGLING_U1_endereco_7,
       endereco(8) => DANGLING_U1_endereco_8,
       endereco(9) => DANGLING_U1_endereco_9,
       endereco(10) => DANGLING_U1_endereco_10,
       endereco(11) => DANGLING_U1_endereco_11,
       endereco(12) => DANGLING_U1_endereco_12,
       endereco(13) => DANGLING_U1_endereco_13,
       endereco(14) => DANGLING_U1_endereco_14,
       endereco(15) => DANGLING_U1_endereco_15,
       endereco(16) => DANGLING_U1_endereco_16,
       endereco(17) => DANGLING_U1_endereco_17,
       endereco(18) => DANGLING_U1_endereco_18,
       endereco(19) => DANGLING_U1_endereco_19,
       endereco(20) => DANGLING_U1_endereco_20,
       endereco(21) => DANGLING_U1_endereco_21,
       endereco(22) => DANGLING_U1_endereco_22,
       endereco(23) => DANGLING_U1_endereco_23,
       endereco(24) => DANGLING_U1_endereco_24,
       endereco(25) => DANGLING_U1_endereco_25,
       endereco(26) => BUS1344(26),
       endereco(27) => BUS1344(27),
       endereco(28) => BUS1344(28),
       endereco(29) => BUS1344(29),
       endereco(30) => BUS1344(30),
       endereco(31) => BUS1344(31),
       UCctrl => NET549,
       clock => clock,
       entEstagio2 => BUS167,
       entradaCache => entradaCache,
       entradaJR => BUS317,
       hazardctrl => NET875,
       hazardctrlPC => NET543,
       instrucao => BUS150,
       op => BUS530,
       saidaCache => saidaCache
  );

U2 : estagio2
  port map(
       entradaPC(0) => Dangling_Input_Signal,
       entradaPC(1) => Dangling_Input_Signal,
       entradaPC(2) => Dangling_Input_Signal,
       entradaPC(3) => Dangling_Input_Signal,
       entradaPC(4) => Dangling_Input_Signal,
       entradaPC(5) => Dangling_Input_Signal,
       entradaPC(6) => Dangling_Input_Signal,
       entradaPC(7) => Dangling_Input_Signal,
       entradaPC(8) => Dangling_Input_Signal,
       entradaPC(9) => Dangling_Input_Signal,
       entradaPC(10) => Dangling_Input_Signal,
       entradaPC(11) => Dangling_Input_Signal,
       entradaPC(12) => Dangling_Input_Signal,
       entradaPC(13) => Dangling_Input_Signal,
       entradaPC(14) => Dangling_Input_Signal,
       entradaPC(15) => Dangling_Input_Signal,
       entradaPC(16) => Dangling_Input_Signal,
       entradaPC(17) => Dangling_Input_Signal,
       entradaPC(18) => Dangling_Input_Signal,
       entradaPC(19) => Dangling_Input_Signal,
       entradaPC(20) => Dangling_Input_Signal,
       entradaPC(21) => Dangling_Input_Signal,
       entradaPC(22) => Dangling_Input_Signal,
       entradaPC(23) => Dangling_Input_Signal,
       entradaPC(24) => Dangling_Input_Signal,
       entradaPC(25) => Dangling_Input_Signal,
       entradaPC(26) => BUS1344(26),
       entradaPC(27) => BUS1344(27),
       entradaPC(28) => BUS1344(28),
       entradaPC(29) => BUS1344(29),
       entradaPC(30) => BUS1344(30),
       entradaPC(31) => BUS1344(31),
       UCCtrl => NET479,
       UCCtrl2 => NET487,
       clock => clock,
       ctrlJal => ctrlJal,
       ctrlMux3 => NET643,
       ctrlMux32 => NET663,
       ctrlMux5 => NET603,
       ctrlMuxMEM => NET522,
       ctrlULA => NET627,
       dadoina => BUS354,
       dadoinb => BUS1121,
       entrada => BUS150,
       exsaida => exsaida,
       hazardCtrl => NET875,
       msaida => NET564,
       reset => reset,
       saida1511 => BUS207,
       saida2016 => BUS199,
       saida2521 => BUS772,
       saidaEstagio2 => BUS167,
       saidaGPR2016 => BUS178,
       saidaGPR2521 => BUS186,
       saidaPC => BUS193,
       saidaShamt => BUS218,
       sctrlMux3 => NET451,
       sctrlMux32 => NET465,
       sctrlMux5 => NET401,
       sctrlMuxMEM => NET416,
       sctrlULA => NET431,
       wbsaida => NET235,
       we => NET303
  );

U3 : est4
  port map(
       I1511 => BUS787,
       I1511out => BUS789,
       clock => clock,
       ctrlMux5 => NET277,
       ctrlmuxMEM => NET270,
       entradaImed => BUS110,
       entradaResULA => BUS117,
       entradaVemDocache => entradaVemDocache,
       muxest2 => BUS126,
       resULA => BUS117,
       saidaImed => BUS354,
       saidaParaCache => saidaParaCache,
       saidaResULA => BUS319,
       saidacache => BUS317,
       sctrlMux5 => NET311,
       wb => NET285,
       wbsaida => NET303
  );

U4 : estagio5
  port map(
       saidaMux(0) => DANGLING_U4_saidaMux_0,
       saidaMux(1) => DANGLING_U4_saidaMux_1,
       saidaMux(2) => DANGLING_U4_saidaMux_2,
       saidaMux(3) => DANGLING_U4_saidaMux_3,
       saidaMux(4) => DANGLING_U4_saidaMux_4,
       saidaMux(5) => DANGLING_U4_saidaMux_5,
       saidaMux(6) => DANGLING_U4_saidaMux_6,
       saidaMux(7) => DANGLING_U4_saidaMux_7,
       saidaMux(8) => DANGLING_U4_saidaMux_8,
       saidaMux(9) => DANGLING_U4_saidaMux_9,
       saidaMux(10) => DANGLING_U4_saidaMux_10,
       saidaMux(11) => DANGLING_U4_saidaMux_11,
       saidaMux(12) => DANGLING_U4_saidaMux_12,
       saidaMux(13) => DANGLING_U4_saidaMux_13,
       saidaMux(14) => DANGLING_U4_saidaMux_14,
       saidaMux(15) => DANGLING_U4_saidaMux_15,
       saidaMux(16) => DANGLING_U4_saidaMux_16,
       saidaMux(17) => DANGLING_U4_saidaMux_17,
       saidaMux(18) => DANGLING_U4_saidaMux_18,
       saidaMux(19) => DANGLING_U4_saidaMux_19,
       saidaMux(20) => DANGLING_U4_saidaMux_20,
       saidaMux(21) => DANGLING_U4_saidaMux_21,
       saidaMux(22) => DANGLING_U4_saidaMux_22,
       saidaMux(23) => DANGLING_U4_saidaMux_23,
       saidaMux(24) => DANGLING_U4_saidaMux_24,
       saidaMux(25) => DANGLING_U4_saidaMux_25,
       saidaMux(26) => DANGLING_U4_saidaMux_26,
       saidaMux(27) => BUS1121(0),
       saidaMux(28) => BUS1121(1),
       saidaMux(29) => BUS1121(2),
       saidaMux(30) => BUS1121(3),
       saidaMux(31) => BUS1121(4),
       contBolha => contBolha,
       contInst => contInst,
       ctrlMux5 => NET311,
       eCache => BUS317,
       eULA => BUS319,
       inst => NET303,
       reset => reset
  );

U5 : unidadecontrole
  port map(
       func(0) => BUS1344(0),
       func(1) => BUS1344(1),
       func(2) => BUS1344(2),
       func(3) => BUS1344(3),
       func(4) => BUS1344(4),
       func(5) => BUS1344(5),
       Mux1UCEst3 => NET675,
       Mux2UCEst3 => NET684,
       MuxEst3Ctrl => NET643,
       MuxEst3ulaCtrl => NET663,
       MuxEst5Ctrl => NET603,
       MuxInicioCtrl => BUS530,
       MuxMEM => NET522,
       opcode(0) => BUS1344(26),
       opcode(1) => BUS1344(27),
       opcode(2) => BUS1344(28),
       opcode(3) => BUS1344(29),
       opcode(4) => BUS1344(30),
       opcode(5) => BUS1344(31),
       RegEst1 => NET549,
       ULAEst3Ctrl => NET627,
       instrucaoInvalida => instrucaoInvalida,
       orCtrl => NET479,
       overflowULA => NET393,
       wb_m_exCtrl => NET487
  );

U6 : estagio3
  port map(
       I1511out => BUS787,
       muxEstagio5(0) => Dangling_Input_Signal,
       muxEstagio5(1) => Dangling_Input_Signal,
       muxEstagio5(2) => Dangling_Input_Signal,
       muxEstagio5(3) => Dangling_Input_Signal,
       muxEstagio5(4) => Dangling_Input_Signal,
       muxEstagio5(5) => Dangling_Input_Signal,
       muxEstagio5(6) => Dangling_Input_Signal,
       muxEstagio5(7) => Dangling_Input_Signal,
       muxEstagio5(8) => Dangling_Input_Signal,
       muxEstagio5(9) => Dangling_Input_Signal,
       muxEstagio5(10) => Dangling_Input_Signal,
       muxEstagio5(11) => Dangling_Input_Signal,
       muxEstagio5(12) => Dangling_Input_Signal,
       muxEstagio5(13) => Dangling_Input_Signal,
       muxEstagio5(14) => Dangling_Input_Signal,
       muxEstagio5(15) => Dangling_Input_Signal,
       muxEstagio5(16) => Dangling_Input_Signal,
       muxEstagio5(17) => Dangling_Input_Signal,
       muxEstagio5(18) => Dangling_Input_Signal,
       muxEstagio5(19) => Dangling_Input_Signal,
       muxEstagio5(20) => Dangling_Input_Signal,
       muxEstagio5(21) => Dangling_Input_Signal,
       muxEstagio5(22) => Dangling_Input_Signal,
       muxEstagio5(23) => Dangling_Input_Signal,
       muxEstagio5(24) => Dangling_Input_Signal,
       muxEstagio5(25) => Dangling_Input_Signal,
       muxEstagio5(26) => Dangling_Input_Signal,
       muxEstagio5(27) => BUS1121(0),
       muxEstagio5(28) => BUS1121(1),
       muxEstagio5(29) => BUS1121(2),
       muxEstagio5(30) => BUS1121(3),
       muxEstagio5(31) => BUS1121(4),
       OVF => NET393,
       UCctrl => UCctrl,
       Ulaestagio4 => BUS319,
       clock => clock,
       ctrlMux3 => NET451,
       ctrlMux5 => NET401,
       ctrlMuxMEM => NET416,
       entradaepc => BUS193,
       forwardingCtrl1 => BUS223,
       forwardingCtrl2 => BUS229,
       gpr2016 => BUS178,
       gpr2521 => BUS186,
       hazardctrl => hazardctrl,
       i1511 => BUS207,
       i2016 => BUS199,
       m_ctrl => NET684,
       m_in => NET564,
       m_out => m_out,
       muxctrl => NET465,
       saidaImediato => BUS110,
       saidaMux => BUS126,
       saidaULA => BUS117,
       saidaepc => saidaepc,
       sctrlMux5 => NET277,
       sctrlMuxMEM => NET270,
       shamt => BUS218,
       ula_ctrl => NET431,
       wb_ctrl => NET675,
       wb_in => NET235,
       wb_out => NET285
  );

U7 : Forwarding
  port map(
       EX_MEM_Rd => BUS787,
       ForwardA => BUS223,
       ForwardB => BUS229,
       ID_EX_Rs => BUS772,
       ID_EX_Rt => BUS199,
       MEM_WB_Rd => BUS789,
       wb_ctrl_e4 => NET285,
       wb_ctrl_e5 => NET303
  );

U8 : Hazard
  port map(
       HazardA => NET875,
       HazardB => NET543,
       ID_EX_Rt => BUS199,
       IF_ID(0) => Dangling_Input_Signal,
       IF_ID(1) => Dangling_Input_Signal,
       IF_ID(2) => Dangling_Input_Signal,
       IF_ID(3) => Dangling_Input_Signal,
       IF_ID(4) => Dangling_Input_Signal,
       IF_ID(5) => Dangling_Input_Signal,
       IF_ID(6) => Dangling_Input_Signal,
       IF_ID(7) => Dangling_Input_Signal,
       IF_ID(8) => Dangling_Input_Signal,
       IF_ID(9) => Dangling_Input_Signal,
       IF_ID(10) => Dangling_Input_Signal,
       IF_ID(11) => Dangling_Input_Signal,
       IF_ID(12) => Dangling_Input_Signal,
       IF_ID(13) => Dangling_Input_Signal,
       IF_ID(14) => Dangling_Input_Signal,
       IF_ID(15) => Dangling_Input_Signal,
       IF_ID(16) => Dangling_Input_Signal,
       IF_ID(17) => Dangling_Input_Signal,
       IF_ID(18) => Dangling_Input_Signal,
       IF_ID(19) => Dangling_Input_Signal,
       IF_ID(20) => Dangling_Input_Signal,
       IF_ID(21) => Dangling_Input_Signal,
       IF_ID(22) => Dangling_Input_Signal,
       IF_ID(23) => Dangling_Input_Signal,
       IF_ID(24) => Dangling_Input_Signal,
       IF_ID(25) => Dangling_Input_Signal,
       IF_ID(26) => BUS1344(26),
       IF_ID(27) => BUS1344(27),
       IF_ID(28) => BUS1344(28),
       IF_ID(29) => BUS1344(29),
       IF_ID(30) => BUS1344(30),
       IF_ID(31) => BUS1344(31),
       m_ctrl_e3 => NET684
  );


---- Dangling input signal assignment ----

Dangling_Input_Signal <= DANGLING_INPUT_CONSTANT;

end pipelineCompleto2;
