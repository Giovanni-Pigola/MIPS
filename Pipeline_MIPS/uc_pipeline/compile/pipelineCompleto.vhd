-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : uc_pipeline
-- Author      : Priscilla
-- Company     : x
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\uc_pipeline\uc_pipeline\compile\pipelineCompleto.vhd
-- Generated   : Mon Jul  4 02:50:38 2016
-- From        : C:\My_Designs\uc_pipeline\uc_pipeline\src\pipelineCompleto.bde
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


entity pipelineCompleto is
  port(
       UCctrl : in STD_LOGIC;
       clock : in STD_LOGIC;
       ctrlJal : in STD_LOGIC;
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
end pipelineCompleto;

architecture pipelineCompleto of pipelineCompleto is

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

---- Signal declarations used on the diagram ----

signal NET1015 : STD_LOGIC;
signal NET1037 : STD_LOGIC;
signal NET1065 : STD_LOGIC;
signal NET1075 : STD_LOGIC;
signal NET1676 : STD_LOGIC;
signal NET2151 : STD_LOGIC;
signal NET382 : STD_LOGIC;
signal NET390 : STD_LOGIC;
signal NET431 : STD_LOGIC;
signal NET565 : STD_LOGIC;
signal NET575 : STD_LOGIC;
signal NET591 : STD_LOGIC;
signal NET607 : STD_LOGIC;
signal NET627 : STD_LOGIC;
signal NET643 : STD_LOGIC;
signal NET664 : STD_LOGIC;
signal NET674 : STD_LOGIC;
signal NET753 : STD_LOGIC;
signal NET789 : STD_LOGIC;
signal NET801 : STD_LOGIC;
signal NET828 : STD_LOGIC;
signal NET863 : STD_LOGIC;
signal NET908 : STD_LOGIC;
signal NET971 : STD_LOGIC;
signal NET997 : STD_LOGIC;
signal BUS101 : STD_LOGIC_VECTOR(4 downto 0);
signal BUS109 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS1121 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS117 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS1316 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS1344 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS1780 : STD_LOGIC_VECTOR(4 downto 0);
signal BUS189 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS2035 : STD_LOGIC_VECTOR(4 downto 0);
signal BUS212 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS220 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS228 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS244 : STD_LOGIC_VECTOR(4 downto 0);
signal BUS261 : STD_LOGIC_VECTOR(4 downto 0);
signal BUS485 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS763 : STD_LOGIC_VECTOR(1 downto 0);
signal BUS934 : STD_LOGIC_VECTOR(31 downto 0);
signal forwardingCtrl1 : STD_LOGIC_VECTOR(1 downto 0);
signal forwardingCtrl2 : STD_LOGIC_VECTOR(1 downto 0);
signal I1511out : STD_LOGIC_VECTOR(4 downto 0);
signal saida2521 : STD_LOGIC_VECTOR(4 downto 0);
signal saidaImed : STD_LOGIC_VECTOR(4 downto 0);

begin

----  Component instantiations  ----

U1 : testes
  port map(
       UCctrl => NET801,
       clock => clock,
       endereco => BUS1344,
       entEstagio2 => BUS189,
       entradaCache => entradaCache,
       entradaJR => BUS1316,
       hazardctrl => NET2151,
       hazardctrlPC => NET789,
       instrucao => BUS934,
       op => BUS763,
       saidaCache => saidaCache
  );

U2 : estagio2
  port map(
       dadoinb(0) => BUS1121(0),
       dadoinb(1) => BUS1121(1),
       dadoinb(2) => BUS1121(2),
       dadoinb(3) => BUS1121(3),
       dadoinb(4) => BUS1121(4),
       UCCtrl => NET664,
       UCCtrl2 => NET674,
       clock => clock,
       ctrlJal => ctrlJal,
       ctrlMux3 => NET1015,
       ctrlMux32 => NET1037,
       ctrlMux5 => NET971,
       ctrlMuxMEM => NET753,
       ctrlULA => NET997,
       dadoina => saidaImed,
       entrada => BUS934,
       entradaPC => BUS1344,
       exsaida => exsaida,
       hazardCtrl => NET2151,
       msaida => NET863,
       reset => reset,
       saida1511 => BUS244,
       saida2016 => BUS2035,
       saida2521 => saida2521,
       saidaEstagio2 => BUS189,
       saidaGPR2016 => BUS212,
       saidaGPR2521 => BUS220,
       saidaPC => BUS228,
       saidaShamt => BUS261,
       sctrlMux3 => NET627,
       sctrlMux32 => NET643,
       sctrlMux5 => NET575,
       sctrlMuxMEM => NET591,
       sctrlULA => NET607,
       wbsaida => NET828,
       we => NET908
  );

U3 : estagio3
  port map(
       I1511out => BUS1780,
       OVF => NET565,
       UCctrl => UCctrl,
       Ulaestagio4 => BUS485,
       clock => clock,
       ctrlMux3 => NET627,
       ctrlMux5 => NET575,
       ctrlMuxMEM => NET591,
       entradaepc => BUS228,
       forwardingCtrl1 => forwardingCtrl1,
       forwardingCtrl2 => forwardingCtrl2,
       gpr2016 => BUS212,
       gpr2521 => BUS220,
       hazardctrl => NET2151,
       i1511 => BUS244,
       i2016 => BUS2035,
       m_ctrl => NET1075,
       m_in => NET863,
       m_out => m_out,
       muxEstagio5 => BUS1121,
       muxctrl => NET643,
       saidaImediato => BUS101,
       saidaMux => BUS117,
       saidaULA => BUS109,
       saidaepc => saidaepc,
       sctrlMux5 => NET390,
       sctrlMuxMEM => NET382,
       shamt => BUS261,
       ula_ctrl => NET607,
       wb_ctrl => NET1065,
       wb_in => NET828,
       wb_out => NET1676
  );

U4 : est4
  port map(
       I1511 => BUS1780,
       I1511out => I1511out,
       clock => clock,
       ctrlMux5 => NET390,
       ctrlmuxMEM => NET382,
       entradaImed => BUS101,
       entradaResULA => BUS109,
       entradaVemDocache => entradaVemDocache,
       muxest2 => BUS117,
       resULA => BUS109,
       saidaImed => saidaImed,
       saidaParaCache => saidaParaCache,
       saidaResULA => BUS485,
       saidacache => BUS1316,
       sctrlMux5 => NET431,
       wb => NET1676,
       wbsaida => NET908
  );

U5 : estagio5
  port map(
       contBolha => contBolha,
       contInst => contInst,
       ctrlMux5 => NET431,
       eCache => BUS1316,
       eULA => BUS485,
       inst => NET908,
       reset => reset,
       saidaMux => BUS1121
  );

U6 : unidadecontrole
  port map(
       func(0) => BUS1344(0),
       func(1) => BUS1344(1),
       func(2) => BUS1344(2),
       func(3) => BUS1344(3),
       func(4) => BUS1344(4),
       func(5) => BUS1344(5),
       Mux1UCEst3 => NET1065,
       Mux2UCEst3 => NET1075,
       MuxEst3Ctrl => NET1015,
       MuxEst3ulaCtrl => NET1037,
       MuxEst5Ctrl => NET971,
       MuxInicioCtrl => BUS763,
       MuxMEM => NET753,
       opcode(0) => BUS1344(26),
       opcode(1) => BUS1344(27),
       opcode(2) => BUS1344(28),
       opcode(3) => BUS1344(29),
       opcode(4) => BUS1344(30),
       opcode(5) => BUS1344(31),
       RegEst1 => NET801,
       ULAEst3Ctrl => NET997,
       instrucaoInvalida => instrucaoInvalida,
       orCtrl => NET664,
       overflowULA => NET565,
       wb_m_exCtrl => NET674
  );

U7 : Forwarding
  port map(
       EX_MEM_Rd => BUS1780,
       ForwardA => forwardingCtrl1,
       ForwardB => forwardingCtrl2,
       ID_EX_Rs => saida2521,
       ID_EX_Rt => BUS2035,
       MEM_WB_Rd => I1511out,
       wb_ctrl_e4 => NET1676,
       wb_ctrl_e5 => NET908
  );

U8 : Hazard
  port map(
       HazardA => NET2151,
       HazardB => NET789,
       ID_EX_Rt => BUS2035,
       IF_ID => BUS1344,
       m_ctrl_e3 => NET1075
  );


end pipelineCompleto;
