-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : uc_pipeline
-- Author      : Priscilla
-- Company     : x
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\uc_pipeline\uc_pipeline\compile\teste2.vhd
-- Generated   : Fri Jul  1 22:58:00 2016
-- From        : c:\My_Designs\uc_pipeline\uc_pipeline\src\teste2.bde
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


entity teste2 is 
end teste2;

architecture teste2 of teste2 is

---- Component declarations -----

component testes
  port (
       entrada : in STD_LOGIC_VECTOR(31 downto 0);
       saida : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

----     Constants     -----
constant DANGLING_INPUT_CONSTANT : STD_LOGIC := 'Z';

---- Declaration for Dangling input ----
signal Dangling_Input_Signal : STD_LOGIC;

begin

----  Component instantiations  ----

U1 : testes
  port map(
       entrada(0) => Dangling_Input_Signal,
       entrada(1) => Dangling_Input_Signal,
       entrada(2) => Dangling_Input_Signal,
       entrada(3) => Dangling_Input_Signal,
       entrada(4) => Dangling_Input_Signal,
       entrada(5) => Dangling_Input_Signal,
       entrada(6) => Dangling_Input_Signal,
       entrada(7) => Dangling_Input_Signal,
       entrada(8) => Dangling_Input_Signal,
       entrada(9) => Dangling_Input_Signal,
       entrada(10) => Dangling_Input_Signal,
       entrada(11) => Dangling_Input_Signal,
       entrada(12) => Dangling_Input_Signal,
       entrada(13) => Dangling_Input_Signal,
       entrada(14) => Dangling_Input_Signal,
       entrada(15) => Dangling_Input_Signal,
       entrada(16) => Dangling_Input_Signal,
       entrada(17) => Dangling_Input_Signal,
       entrada(18) => Dangling_Input_Signal,
       entrada(19) => Dangling_Input_Signal,
       entrada(20) => Dangling_Input_Signal,
       entrada(21) => Dangling_Input_Signal,
       entrada(22) => Dangling_Input_Signal,
       entrada(23) => Dangling_Input_Signal,
       entrada(24) => Dangling_Input_Signal,
       entrada(25) => Dangling_Input_Signal,
       entrada(26) => Dangling_Input_Signal,
       entrada(27) => Dangling_Input_Signal,
       entrada(28) => Dangling_Input_Signal,
       entrada(29) => Dangling_Input_Signal,
       entrada(30) => Dangling_Input_Signal,
       entrada(31) => Dangling_Input_Signal
  );


---- Dangling input signal assignment ----

Dangling_Input_Signal <= DANGLING_INPUT_CONSTANT;

end teste2;
