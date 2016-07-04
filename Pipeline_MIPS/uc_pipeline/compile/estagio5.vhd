-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : uc_pipeline
-- Author      : Priscilla
-- Company     : x
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\uc_pipeline\uc_pipeline\compile\estagio5.vhd
-- Generated   : Mon Jul  4 01:05:10 2016
-- From        : C:\My_Designs\uc_pipeline\uc_pipeline\src\estagio5.bde
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


entity estagio5 is
  port(
       ctrlMux5 : in STD_LOGIC;
       inst : in STD_LOGIC;
       reset : in STD_LOGIC;
       eCache : in STD_LOGIC_VECTOR(31 downto 0);
       eULA : in STD_LOGIC_VECTOR(31 downto 0);
       contBolha : out STD_LOGIC_VECTOR(7 downto 0);
       contInst : out STD_LOGIC_VECTOR(7 downto 0);
       saidaMux : out STD_LOGIC_VECTOR(31 downto 0)
  );
end estagio5;

architecture estagio5 of estagio5 is

---- Component declarations -----

component mux32bitsX2
  port (
       e1 : in STD_LOGIC_VECTOR(31 downto 0);
       e2 : in STD_LOGIC_VECTOR(31 downto 0);
       op : in STD_LOGIC;
       saida : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component contadorBolhas
  port (
       inst : in STD_LOGIC;
       reset : in STD_LOGIC;
       cont : out STD_LOGIC_VECTOR(7 downto 0)
  );
end component;
component contadorInstrucoes
  port (
       inst : in STD_LOGIC;
       reset : in STD_LOGIC;
       cont : out STD_LOGIC_VECTOR(7 downto 0)
  );
end component;

---- Signal declarations used on the diagram ----

signal NET77 : STD_LOGIC;
signal cont : STD_LOGIC_VECTOR(7 downto 0);
signal e1 : STD_LOGIC_VECTOR(31 downto 0);
signal e2 : STD_LOGIC_VECTOR(31 downto 0);
signal saida : STD_LOGIC_VECTOR(31 downto 0);

begin

----  Component instantiations  ----

NET77 <= not(inst);

U2 : mux32bitsX2
  port map(
       e1 => e1,
       e2 => e2,
       op => ctrlMux5,
       saida => saida
  );

U4 : contadorBolhas
  port map(
       cont => cont,
       inst => NET77,
       reset => reset
  );

U5 : contadorInstrucoes
  port map(
       cont => cont,
       inst => inst,
       reset => reset
  );


---- Terminal assignment ----

    -- Inputs terminals
	e1 <= eCache;
	e2 <= eULA;

    -- Output\buffer terminals
	contBolha <= cont;
	contInst <= cont;
	saidaMux <= saida;


end estagio5;
