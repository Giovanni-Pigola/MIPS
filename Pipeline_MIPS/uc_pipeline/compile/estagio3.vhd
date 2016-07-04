-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : uc_pipeline
-- Author      : Giovanni
-- Company     : USP
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\uc_pipeline\uc_pipeline\compile\estagio3.vhd
-- Generated   : Sun Jul  3 22:45:13 2016
-- From        : C:\My_Designs\uc_pipeline\uc_pipeline\src\estagio3.bde
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
       UCctrl : in STD_LOGIC;
       clock : in STD_LOGIC;
       ctrlMux3 : in STD_LOGIC;
       ctrlMux5 : in STD_LOGIC;
       ctrlMuxMEM : in STD_LOGIC;
       hazardctrl : in STD_LOGIC;
       m_ctrl : in STD_LOGIC;
       m_in : in STD_LOGIC;
       muxctrl : in STD_LOGIC;
       ula_ctrl : in STD_LOGIC;
       wb_ctrl : in STD_LOGIC;
       wb_in : in STD_LOGIC;
       Ulaestagio4 : in STD_LOGIC_VECTOR(31 downto 0);
       entradaepc : in STD_LOGIC_VECTOR(31 downto 0);
       forwardingCtrl1 : in STD_LOGIC_VECTOR(1 downto 0);
       forwardingCtrl2 : in STD_LOGIC_VECTOR(1 downto 0);
       gpr2016 : in STD_LOGIC_VECTOR(31 downto 0);
       gpr2521 : in STD_LOGIC_VECTOR(31 downto 0);
       i1511 : in STD_LOGIC_VECTOR(4 downto 0);
       i2016 : in STD_LOGIC_VECTOR(4 downto 0);
       muxEstagio5 : in STD_LOGIC_VECTOR(31 downto 0);
       shamt : in STD_LOGIC_VECTOR(4 downto 0);
       OVF : out STD_LOGIC;
       m_out : out STD_LOGIC;
       sctrlMux5 : out STD_LOGIC;
       sctrlMuxMEM : out STD_LOGIC;
       wb_out : out STD_LOGIC;
       saidaImediato : out STD_LOGIC_VECTOR(4 downto 0);
       saidaMux : out STD_LOGIC_VECTOR(31 downto 0);
       saidaULA : out STD_LOGIC_VECTOR(31 downto 0);
       saidaepc : out STD_LOGIC_VECTOR(31 downto 0)
  );
end estagio3;

architecture estagio3 of estagio3 is

---- Component declarations -----

component desloc_shamt
  port (
       entrada : in STD_LOGIC_VECTOR(31 downto 0);
       shamt : in STD_LOGIC_VECTOR(4 downto 0);
       saida : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component mux2x1zero
  port (
       In1 : in STD_LOGIC;
       S : in STD_LOGIC;
       O : out STD_LOGIC
  );
end component;
component mux2x1_5bits
  port (
       In1 : in STD_LOGIC_VECTOR(4 downto 0);
       In2 : in STD_LOGIC_VECTOR(4 downto 0);
       S : in STD_LOGIC;
       O : out STD_LOGIC_VECTOR(4 downto 0)
  );
end component;
component mux32bitsX2
  port (
       e1 : in STD_LOGIC_VECTOR(31 downto 0);
       e2 : in STD_LOGIC_VECTOR(31 downto 0);
       op : in STD_LOGIC;
       saida : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component reg32bitsEPC
  port (
       entradaepc : in STD_LOGIC_VECTOR(31 downto 0);
       saidaepc : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component regestagio3
  port (
       D1 : in STD_LOGIC;
       D2 : in STD_LOGIC;
       D3 : in STD_LOGIC_VECTOR(31 downto 0);
       D4 : in STD_LOGIC_VECTOR(31 downto 0);
       D5 : in STD_LOGIC_VECTOR(4 downto 0);
       UCctrl : in STD_LOGIC;
       clock : in STD_LOGIC;
       ctrlMux5 : in STD_LOGIC;
       ctrlMuxMEM : in STD_LOGIC;
       hazardctrl : in STD_LOGIC;
       Q1 : out STD_LOGIC;
       Q2 : out STD_LOGIC;
       Q3 : out STD_LOGIC_VECTOR(31 downto 0);
       Q4 : out STD_LOGIC_VECTOR(31 downto 0);
       Q5 : out STD_LOGIC_VECTOR(4 downto 0);
       sctrlMux5 : out STD_LOGIC;
       sctrlMuxMEM : out STD_LOGIC
  );
end component;
component ula
  port (
       e_2016 : in STD_LOGIC_VECTOR(31 downto 0);
       e_2521 : in STD_LOGIC_VECTOR(31 downto 0);
       s_op0 : in STD_LOGIC;
       OVF : out STD_LOGIC;
       saida : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component mux5bits3op
  port (
       op : in STD_LOGIC_VECTOR(1 downto 0);
       p1 : in STD_LOGIC_VECTOR(31 downto 0);
       p2 : in STD_LOGIC_VECTOR(31 downto 0);
       p3 : in STD_LOGIC_VECTOR(31 downto 0);
       saida : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

---- Signal declarations used on the diagram ----

signal NET2501 : STD_LOGIC;
signal NET2509 : STD_LOGIC;
signal BUS2449 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS2457 : STD_LOGIC_VECTOR(4 downto 0);
signal BUS2843 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS2954 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS2989 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS3024 : STD_LOGIC_VECTOR(31 downto 0);
signal In1 : STD_LOGIC_VECTOR(4 downto 0);
signal In2 : STD_LOGIC_VECTOR(4 downto 0);
signal p1 : STD_LOGIC_VECTOR(31 downto 0);
signal p2 : STD_LOGIC_VECTOR(31 downto 0);
signal p3 : STD_LOGIC_VECTOR(31 downto 0);

begin

----  Component instantiations  ----

U10 : mux2x1zero
  port map(
       In1 => wb_in,
       O => NET2509,
       S => wb_ctrl
  );

U11 : mux2x1zero
  port map(
       In1 => m_in,
       O => NET2501,
       S => m_ctrl
  );

U12 : mux32bitsX2
  port map(
       e1 => BUS2449,
       e2 => BUS2954,
       op => muxctrl,
       saida => BUS2843
  );

U14 : mux5bits3op
  port map(
       op => forwardingCtrl2,
       p1 => gpr2016,
       p2 => p2,
       p3 => p3,
       saida => BUS3024
  );

U21 : desloc_shamt
  port map(
       entrada => p1,
       saida => BUS2954,
       shamt => shamt
  );

U3 : ula
  port map(
       OVF => OVF,
       e_2016 => BUS3024,
       e_2521 => BUS2989,
       s_op0 => ula_ctrl,
       saida => BUS2449
  );

U6 : mux2x1_5bits
  port map(
       In1 => In1,
       In2 => In2,
       O => BUS2457,
       S => ctrlMux3
  );

U7 : reg32bitsEPC
  port map(
       entradaepc => entradaepc,
       saidaepc => saidaepc
  );

U8 : regestagio3
  port map(
       D1 => NET2509,
       D2 => NET2501,
       D3 => BUS2843,
       D4 => BUS3024,
       D5 => BUS2457,
       Q1 => wb_out,
       Q2 => m_out,
       Q3 => saidaULA,
       Q4 => saidaMux,
       Q5 => saidaImediato,
       UCctrl => UCctrl,
       clock => clock,
       ctrlMux5 => ctrlMux5,
       ctrlMuxMEM => ctrlMuxMEM,
       hazardctrl => hazardctrl,
       sctrlMux5 => sctrlMux5,
       sctrlMuxMEM => sctrlMuxMEM
  );

U9 : mux5bits3op
  port map(
       op => forwardingCtrl1,
       p1 => p1,
       p2 => p2,
       p3 => p3,
       saida => BUS2989
  );


---- Terminal assignment ----

    -- Inputs terminals
	p2 <= Ulaestagio4;
	p1 <= gpr2521;
	In2 <= i1511;
	In1 <= i2016;
	p3 <= muxEstagio5;


end estagio3;
