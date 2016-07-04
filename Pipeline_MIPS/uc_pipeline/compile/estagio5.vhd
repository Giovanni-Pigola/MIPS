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
-- Generated   : Sun Jul  3 20:27:54 2016
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
       entradaCache : in STD_LOGIC_VECTOR(4 downto 0);
       entradaULA : in STD_LOGIC_VECTOR(4 downto 0);
       contBolha : out INTEGER;
       contInst : out INTEGER;
       saidaEstagio2e3 : out STD_LOGIC_VECTOR(4 downto 0)
  );
end estagio5;

architecture estagio5 of estagio5 is

---- Component declarations -----

component contadorBolhas
  port (
       inst : in STD_LOGIC;
       reset : in STD_LOGIC;
       cont : out INTEGER
  );
end component;
component contadorInstrucoes
  port (
       inst : in STD_LOGIC;
       reset : in STD_LOGIC;
       cont : out INTEGER
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

----     Constants     -----
constant DANGLING_INPUT_CONSTANT : STD_LOGIC := 'Z';

---- Signal declarations used on the diagram ----

signal NET77 : STD_LOGIC;
signal e1 : STD_LOGIC_VECTOR(4 downto 0);
signal e2 : STD_LOGIC_VECTOR(4 downto 0);
signal O : STD_LOGIC_VECTOR(4 downto 0);

---- Declaration for Dangling input ----
signal Dangling_Input_Signal : STD_LOGIC;

begin

----  Component instantiations  ----

NET77 <= not(inst);

U2 : mux2x1_5bits
  port map(
       In1 => e1,
       In2 => e2,
       O => O,
       S => ctrlMux5
  );

U4 : contadorBolhas
  port map(
       cont => contBolha,
       inst => Dangling_Input_Signal,
       reset => reset
  );

U5 : contadorInstrucoes
  port map(
       cont => contInst,
       inst => inst,
       reset => reset
  );


---- Terminal assignment ----

    -- Inputs terminals
	e1 <= entradaCache;
	e2 <= entradaULA;

    -- Output\buffer terminals
	saidaEstagio2e3 <= O;


---- Dangling input signal assignment ----

Dangling_Input_Signal <= DANGLING_INPUT_CONSTANT;

end estagio5;
