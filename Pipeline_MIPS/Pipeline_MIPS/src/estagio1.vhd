-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : uc_pipeline
-- Author      : Priscilla
-- Company     : x
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\uc_pipeline\uc_pipeline\compile\estagio1.vhd
-- Generated   : Sun Jul  3 14:58:33 2016
-- From        : c:\My_Designs\uc_pipeline\uc_pipeline\src\estagio1.bde
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


entity testes is
  port(
       UCctrl : in STD_LOGIC;
       clock : in STD_LOGIC;
       hazardctrl : in STD_LOGIC;
       hazardctrlPC : in STD_LOGIC;
       entEstagio2 : in STD_LOGIC_VECTOR(31 downto 0);
       entradaCache : in STD_LOGIC_VECTOR(31 downto 0);
       op : in STD_LOGIC_VECTOR(1 downto 0);
       endereco : out STD_LOGIC_VECTOR(31 downto 0);
       instrucao : out STD_LOGIC_VECTOR(31 downto 0);
       saidaCache : out STD_LOGIC_VECTOR(31 downto 0)
  );
end testes;

architecture testes of testes is

---- Component declarations -----

component mux32bits
  port (
       e1 : in STD_LOGIC_VECTOR(31 downto 0);
       e2 : in STD_LOGIC_VECTOR(31 downto 0);
       op : in STD_LOGIC_VECTOR(1 downto 0);
       saida : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component regestagio1
  port (
       D1 : in STD_LOGIC_VECTOR(31 downto 0);
       D2 : in STD_LOGIC_VECTOR(31 downto 0);
       UCctrl : in STD_LOGIC;
       clock : in STD_LOGIC;
       hazardctrl : in STD_LOGIC;
       Q1 : out STD_LOGIC_VECTOR(31 downto 0);
       Q2 : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component regpc
  generic(
       NumeroBits : INTEGER := 32
  );
  port (
       D : in STD_LOGIC_VECTOR(31 downto 0);
       hazardctrl : in STD_LOGIC;
       Q : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component somapc4
  port (
       A : in STD_LOGIC_VECTOR(31 downto 0);
       C : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

---- Signal declarations used on the diagram ----

signal A : STD_LOGIC_VECTOR(31 downto 0);
signal BUS269 : STD_LOGIC_VECTOR(31 downto 0);
signal BUS332 : STD_LOGIC_VECTOR(31 downto 0);
signal D2 : STD_LOGIC_VECTOR(31 downto 0);
signal e2 : STD_LOGIC_VECTOR(31 downto 0);
signal Q1 : STD_LOGIC_VECTOR(31 downto 0);
signal Q2 : STD_LOGIC_VECTOR(31 downto 0);

begin

----  Component instantiations  ----

U1 : somapc4
  port map(
       A => A,
       C => BUS332
  );

U2 : regpc
  port map(
       D => BUS269,
       Q => A,
       hazardctrl => hazardctrlPC
  );

U3 : mux32bits
  port map(
       e1 => BUS332,
       e2 => e2,
       op => op,
       saida => BUS269
  );

U4 : regestagio1
  port map(
       D1 => BUS332,
       D2 => D2,
       Q1 => Q1,
       Q2 => Q2,
       UCctrl => UCctrl,
       clock => clock,
       hazardctrl => hazardctrl
  );


---- Terminal assignment ----

    -- Inputs terminals
	e2 <= entEstagio2;
	D2 <= entradaCache;

    -- Output\buffer terminals
	endereco <= Q1;
	instrucao <= Q2;
	saidaCache <= A;


end testes;
