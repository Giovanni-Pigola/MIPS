-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : uc_pipeline
-- Author      : Priscilla
-- Company     : x
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\uc_pipeline\uc_pipeline\compile\MIPSCompleto.vhd
-- Generated   : Mon Jul  4 01:34:22 2016
-- From        : C:\My_Designs\uc_pipeline\uc_pipeline\src\MIPSCompleto.bde
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


entity MIPSCompleto is 
end MIPSCompleto;

architecture MIPSCompleto of MIPSCompleto is

---- Component declarations -----

component HierarquiaDeMemoria
  port (
       DadoIn : in STD_LOGIC_VECTOR(31 downto 0);
       EndDado : in STD_LOGIC_VECTOR(31 downto 0);
       EndInst : in STD_LOGIC_VECTOR(31 downto 0);
       ReadDado : in STD_LOGIC;
       WriteDado : in STD_LOGIC;
       clock : in STD_LOGIC;
       clockmp : in STD_LOGIC;
       reset : in STD_LOGIC;
       DadoOut : out STD_LOGIC_VECTOR(31 downto 0);
       HitDado : out STD_LOGIC;
       HitInst : out STD_LOGIC;
       Instrucao : out STD_LOGIC_VECTOR(31 downto 0);
       MissDado : out STD_LOGIC;
       MissInst : out STD_LOGIC
  );
end component;
component pipelineCompleto
  port (
       UCctrl : in STD_LOGIC;
       clock : in STD_LOGIC;
       ctrlJal : in STD_LOGIC;
       entradaCache : in STD_LOGIC_VECTOR(31 downto 0);
       entradaVemDocache : in STD_LOGIC_VECTOR(31 downto 0);
       forwardingCtrl1 : in STD_LOGIC_VECTOR(1 downto 0);
       forwardingCtrl2 : in STD_LOGIC_VECTOR(1 downto 0);
       hazardCtrl : in STD_LOGIC;
       hazardctrlPC : in STD_LOGIC;
       reset : in STD_LOGIC;
       contBolha : out STD_LOGIC_VECTOR(7 downto 0);
       contInst : out STD_LOGIC_VECTOR(7 downto 0);
       exsaida : out STD_LOGIC;
       instrucaoInvalida : out STD_LOGIC;
       m_out : out STD_LOGIC;
       saida2521 : out STD_LOGIC_VECTOR(4 downto 0);
       saidaCache : out STD_LOGIC_VECTOR(31 downto 0);
       saidaParaCache : out STD_LOGIC_VECTOR(31 downto 0);
       saidaepc : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

----     Constants     -----
constant DANGLING_INPUT_CONSTANT : STD_LOGIC := 'Z';

---- Signal declarations used on the diagram ----

signal BUS26 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS41 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS64 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS72 : STD_LOGIC_VECTOR(31 downto 0);

---- Declaration for Dangling input ----
signal Dangling_Input_Signal : STD_LOGIC;

begin

----  Component instantiations  ----

U1 : pipelineCompleto
  port map(
       forwardingCtrl1(0) => Dangling_Input_Signal,
       forwardingCtrl1(1) => Dangling_Input_Signal,
       forwardingCtrl2(0) => Dangling_Input_Signal,
       forwardingCtrl2(1) => Dangling_Input_Signal,
       UCctrl => Dangling_Input_Signal,
       clock => Dangling_Input_Signal,
       ctrlJal => Dangling_Input_Signal,
       entradaCache => BUS41,
       entradaVemDocache => BUS72,
       hazardCtrl => Dangling_Input_Signal,
       hazardctrlPC => Dangling_Input_Signal,
       reset => Dangling_Input_Signal,
       saidaCache => BUS26,
       saidaParaCache => BUS64
  );

U2 : HierarquiaDeMemoria
  port map(
       DadoIn => BUS64,
       DadoOut => BUS72,
       EndDado(0) => Dangling_Input_Signal,
       EndDado(1) => Dangling_Input_Signal,
       EndDado(2) => Dangling_Input_Signal,
       EndDado(3) => Dangling_Input_Signal,
       EndDado(4) => Dangling_Input_Signal,
       EndDado(5) => Dangling_Input_Signal,
       EndDado(6) => Dangling_Input_Signal,
       EndDado(7) => Dangling_Input_Signal,
       EndDado(8) => Dangling_Input_Signal,
       EndDado(9) => Dangling_Input_Signal,
       EndDado(10) => Dangling_Input_Signal,
       EndDado(11) => Dangling_Input_Signal,
       EndDado(12) => Dangling_Input_Signal,
       EndDado(13) => Dangling_Input_Signal,
       EndDado(14) => Dangling_Input_Signal,
       EndDado(15) => Dangling_Input_Signal,
       EndDado(16) => Dangling_Input_Signal,
       EndDado(17) => Dangling_Input_Signal,
       EndDado(18) => Dangling_Input_Signal,
       EndDado(19) => Dangling_Input_Signal,
       EndDado(20) => Dangling_Input_Signal,
       EndDado(21) => Dangling_Input_Signal,
       EndDado(22) => Dangling_Input_Signal,
       EndDado(23) => Dangling_Input_Signal,
       EndDado(24) => Dangling_Input_Signal,
       EndDado(25) => Dangling_Input_Signal,
       EndDado(26) => Dangling_Input_Signal,
       EndDado(27) => Dangling_Input_Signal,
       EndDado(28) => Dangling_Input_Signal,
       EndDado(29) => Dangling_Input_Signal,
       EndDado(30) => Dangling_Input_Signal,
       EndDado(31) => Dangling_Input_Signal,
       EndInst => BUS26,
       Instrucao => BUS41,
       ReadDado => Dangling_Input_Signal,
       WriteDado => Dangling_Input_Signal,
       clock => Dangling_Input_Signal,
       clockmp => Dangling_Input_Signal,
       reset => Dangling_Input_Signal
  );


---- Dangling input signal assignment ----

Dangling_Input_Signal <= DANGLING_INPUT_CONSTANT;

end MIPSCompleto;
