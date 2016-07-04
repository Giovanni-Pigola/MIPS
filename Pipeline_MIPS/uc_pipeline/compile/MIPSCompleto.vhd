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
-- Generated   : Mon Jul  4 02:45:07 2016
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
  port(
       ReadDado : in STD_LOGIC;
       UCctrl : in STD_LOGIC;
       WriteDado : in STD_LOGIC;
       clock : in STD_LOGIC;
       clockmp : in STD_LOGIC;
       ctrlJal : in STD_LOGIC;
       reset : in STD_LOGIC;
       HitDado : out STD_LOGIC;
       HitInst : out STD_LOGIC;
       MissDado : out STD_LOGIC;
       MissInst : out STD_LOGIC;
       exsaida : out STD_LOGIC;
       instrucaoInvalida : out STD_LOGIC;
       m_out : out STD_LOGIC;
       contBolha : out STD_LOGIC_VECTOR(7 downto 0);
       contInst : out STD_LOGIC_VECTOR(7 downto 0);
       saidaepc : out STD_LOGIC_VECTOR(31 downto 0)
  );
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
       reset : in STD_LOGIC;
       contBolha : out STD_LOGIC_VECTOR(7 downto 0);
       contInst : out STD_LOGIC_VECTOR(7 downto 0);
       exsaida : out STD_LOGIC;
       instrucaoInvalida : out STD_LOGIC;
       m_out : out STD_LOGIC;
       saidaCache : out STD_LOGIC_VECTOR(31 downto 0);
       saidaParaCache : out STD_LOGIC_VECTOR(31 downto 0);
       saidaResULA : out STD_LOGIC_VECTOR(31 downto 0);
       saidaepc : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

---- Signal declarations used on the diagram ----

signal BUS159 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS26 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS41 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS64 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS72 : STD_LOGIC_VECTOR(31 downto 0);

begin

----  Component instantiations  ----

U2 : HierarquiaDeMemoria
  port map(
       DadoIn => BUS64,
       DadoOut => BUS72,
       EndDado => BUS159,
       EndInst => BUS26,
       HitDado => HitDado,
       HitInst => HitInst,
       Instrucao => BUS41,
       MissDado => MissDado,
       MissInst => MissInst,
       ReadDado => ReadDado,
       WriteDado => WriteDado,
       clock => clock,
       clockmp => clockmp,
       reset => reset
  );

U3 : pipelineCompleto
  port map(
       UCctrl => UCctrl,
       clock => clock,
       contBolha => contBolha,
       contInst => contInst,
       ctrlJal => ctrlJal,
       entradaCache => BUS41,
       entradaVemDocache => BUS72,
       exsaida => exsaida,
       instrucaoInvalida => instrucaoInvalida,
       m_out => m_out,
       reset => reset,
       saidaCache => BUS26,
       saidaParaCache => BUS64,
       saidaResULA => BUS159,
       saidaepc => saidaepc
  );


end MIPSCompleto;
