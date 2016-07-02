-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : Pipeline_MIPS
-- Author      : Priscilla
-- Company     : x
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\Pipeline_MIPS\Pipeline_MIPS\compile\processadorfinal.vhd
-- Generated   : Fri Jul  1 19:58:18 2016
-- From        : c:/My_Designs/Pipeline_MIPS/Pipeline_MIPS/src/processadorfinal.bde
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


entity processadorfinal is
  port(
       Ta : in STD_LOGIC;
       Tb : in STD_LOGIC;
       clk_epc : in STD_LOGIC;
       clk_gpr : in STD_LOGIC;
       clk_pc : in STD_LOGIC;
       clk_re : in STD_LOGIC;
       clk_rm : in STD_LOGIC;
       clk_rtemp : in STD_LOGIC;
       inter : in STD_LOGIC;
       pronto : in STD_LOGIC;
       reset : in STD_LOGIC;
       BUSD : in STD_LOGIC_VECTOR(31 downto 0);
       In4 : in STD_LOGIC_VECTOR(31 downto 0);
       In7 : in STD_LOGIC_VECTOR(4 downto 0);
       X : in STD_LOGIC_VECTOR(4 downto 0);
       x00000000 : in STD_LOGIC_VECTOR(31 downto 0);
       x00000001 : in STD_LOGIC_VECTOR(31 downto 0);
       x00000010 : in STD_LOGIC_VECTOR(31 downto 0);
       x000000F0 : in STD_LOGIC_VECTOR(31 downto 0);
       enable : out STD_LOGIC;
       rw : out STD_LOGIC;
       DADOSs : out STD_LOGIC_VECTOR(31 downto 0);
       Ender : out STD_LOGIC_VECTOR(31 downto 0)
  );
end processadorfinal;

architecture processadorfinal of processadorfinal is

---- Component declarations -----

component Processador
  port (
       BUSD : in STD_LOGIC_VECTOR(31 downto 0);
       In4 : in STD_LOGIC_VECTOR(31 downto 0);
       In7 : in STD_LOGIC_VECTOR(4 downto 0);
       Nada : in STD_LOGIC_VECTOR(4 downto 0);
       Smux : in STD_LOGIC;
       clk_epc : in STD_LOGIC;
       clk_gpr : in STD_LOGIC;
       clk_pc : in STD_LOGIC;
       clk_re : in STD_LOGIC;
       clk_rm : in STD_LOGIC;
       clk_rtemp : in STD_LOGIC;
       s_dir : in STD_LOGIC;
       s_gprmux : in STD_LOGIC_VECTOR(1 downto 0);
       s_op0 : in STD_LOGIC;
       s_we : in STD_LOGIC;
       seb1_1 : in STD_LOGIC;
       seb1_10 : in STD_LOGIC;
       seb1_11 : in STD_LOGIC;
       seb1_12 : in STD_LOGIC;
       seb1_2 : in STD_LOGIC;
       seb1_3 : in STD_LOGIC;
       seb1_4 : in STD_LOGIC;
       seb1_5 : in STD_LOGIC;
       seb1_6 : in STD_LOGIC;
       seb1_7 : in STD_LOGIC;
       seb1_9 : in STD_LOGIC;
       seb1_ender : in STD_LOGIC;
       seb2_1 : in STD_LOGIC;
       seb2_2 : in STD_LOGIC;
       seb2_3 : in STD_LOGIC;
       seb3_1 : in STD_LOGIC;
       seb3_2 : in STD_LOGIC;
       seb3_3 : in STD_LOGIC;
       seb3_4 : in STD_LOGIC;
       seb4_1 : in STD_LOGIC;
       seb4_2 : in STD_LOGIC;
       seb4_3 : in STD_LOGIC;
       seb4_4 : in STD_LOGIC;
       seb5_1 : in STD_LOGIC;
       seb5_2 : in STD_LOGIC;
       seb5_3 : in STD_LOGIC;
       seb5_4 : in STD_LOGIC;
       seb5_5 : in STD_LOGIC;
       sr_dados : in STD_LOGIC;
       srm_ender : in STD_LOGIC;
       srm_rm : in STD_LOGIC;
       srtemp : in STD_LOGIC;
       x00000000 : in STD_LOGIC_VECTOR(31 downto 0);
       x00000001 : in STD_LOGIC_VECTOR(31 downto 0);
       x00000010 : in STD_LOGIC_VECTOR(31 downto 0);
       x000000F0 : in STD_LOGIC_VECTOR(31 downto 0);
       BUSm : out STD_LOGIC_VECTOR(31 downto 0);
       BUStemp : out STD_LOGIC_VECTOR(31 downto 0);
       DADOSs : out STD_LOGIC_VECTOR(31 downto 0);
       Ender : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component uc
  port (
       Ta : in STD_LOGIC;
       Tb : in STD_LOGIC;
       inter : in STD_LOGIC;
       pronto : in STD_LOGIC;
       reset : in STD_LOGIC;
       rm3126 : in STD_LOGIC_VECTOR(5 downto 0);
       rm50 : in STD_LOGIC_VECTOR(5 downto 0);
       rtemp : in STD_LOGIC_VECTOR(31 downto 0);
       rtemp31 : in STD_LOGIC;
       enable : out STD_LOGIC;
       rw : out STD_LOGIC;
       s_dados : out STD_LOGIC;
       s_dir : out STD_LOGIC;
       s_gprmux0 : out STD_LOGIC;
       s_gprmux1 : out STD_LOGIC;
       s_op : out STD_LOGIC;
       s_we : out STD_LOGIC;
       sb1_ender : out STD_LOGIC;
       seb1_1 : out STD_LOGIC;
       seb1_10 : out STD_LOGIC;
       seb1_11 : out STD_LOGIC;
       seb1_12 : out STD_LOGIC;
       seb1_2 : out STD_LOGIC;
       seb1_3 : out STD_LOGIC;
       seb1_4 : out STD_LOGIC;
       seb1_5 : out STD_LOGIC;
       seb1_6 : out STD_LOGIC;
       seb1_7 : out STD_LOGIC;
       seb1_9 : out STD_LOGIC;
       seb2_1 : out STD_LOGIC;
       seb2_2 : out STD_LOGIC;
       seb2_3 : out STD_LOGIC;
       seb3_1 : out STD_LOGIC;
       seb3_2 : out STD_LOGIC;
       seb3_3 : out STD_LOGIC;
       seb4_1 : out STD_LOGIC;
       seb4_2 : out STD_LOGIC;
       seb4_3 : out STD_LOGIC;
       seb4_4 : out STD_LOGIC;
       seb5_1 : out STD_LOGIC;
       seb5_2 : out STD_LOGIC;
       seb5_3 : out STD_LOGIC;
       seb5_4 : out STD_LOGIC;
       seb5_5 : out STD_LOGIC;
       smux : out STD_LOGIC;
       srm_ender : out STD_LOGIC;
       srm_rm : out STD_LOGIC;
       srtemp : out STD_LOGIC
  );
end component;

----     Constants     -----
constant GND_CONSTANT   : STD_LOGIC := '0';

---- Signal declarations used on the diagram ----

signal GND : STD_LOGIC;
signal NET1033 : STD_LOGIC;
signal NET1042 : STD_LOGIC;
signal NET302 : STD_LOGIC;
signal NET305 : STD_LOGIC;
signal NET308 : STD_LOGIC;
signal NET318 : STD_LOGIC;
signal NET328 : STD_LOGIC;
signal NET340 : STD_LOGIC;
signal NET353 : STD_LOGIC;
signal NET364 : STD_LOGIC;
signal NET376 : STD_LOGIC;
signal NET391 : STD_LOGIC;
signal NET509 : STD_LOGIC;
signal NET549 : STD_LOGIC;
signal NET559 : STD_LOGIC;
signal NET571 : STD_LOGIC;
signal NET592 : STD_LOGIC;
signal NET604 : STD_LOGIC;
signal NET708 : STD_LOGIC;
signal NET731 : STD_LOGIC;
signal NET741 : STD_LOGIC;
signal NET759 : STD_LOGIC;
signal NET770 : STD_LOGIC;
signal NET780 : STD_LOGIC;
signal NET802 : STD_LOGIC;
signal NET820 : STD_LOGIC;
signal NET833 : STD_LOGIC;
signal NET844 : STD_LOGIC;
signal NET847 : STD_LOGIC;
signal NET918 : STD_LOGIC;
signal NET934 : STD_LOGIC;
signal NET944 : STD_LOGIC;
signal NET954 : STD_LOGIC;
signal NET973 : STD_LOGIC;
signal NET985 : STD_LOGIC;
signal BUSRM : STD_LOGIC_VECTOR(31 downto 0);
signal BUSRTEMP : STD_LOGIC_VECTOR(31 downto 0);
signal s_gpmux : STD_LOGIC_VECTOR(1 downto 0);

begin

----  Component instantiations  ----

U1 : Processador
  port map(
       BUSD => BUSD,
       BUSm => BUSRM,
       BUStemp => BUSRTEMP,
       DADOSs => DADOSs,
       Ender => Ender,
       In4 => In4,
       In7 => In7,
       Nada => X,
       Smux => NET1042,
       clk_epc => clk_epc,
       clk_gpr => clk_gpr,
       clk_pc => clk_pc,
       clk_re => clk_re,
       clk_rm => clk_rm,
       clk_rtemp => clk_rtemp,
       s_dir => NET759,
       s_gprmux => s_gpmux,
       s_op0 => NET731,
       s_we => NET741,
       seb1_1 => NET308,
       seb1_10 => NET305,
       seb1_11 => NET302,
       seb1_12 => NET318,
       seb1_2 => NET328,
       seb1_3 => NET340,
       seb1_4 => NET353,
       seb1_5 => NET364,
       seb1_6 => NET376,
       seb1_7 => NET391,
       seb1_9 => NET509,
       seb1_ender => NET708,
       seb2_1 => NET802,
       seb2_2 => NET820,
       seb2_3 => NET833,
       seb3_1 => NET844,
       seb3_2 => NET985,
       seb3_3 => NET973,
       seb3_4 => GND,
       seb4_1 => NET770,
       seb4_2 => NET780,
       seb4_3 => NET847,
       seb4_4 => NET954,
       seb5_1 => NET944,
       seb5_2 => NET934,
       seb5_3 => NET918,
       seb5_4 => NET604,
       seb5_5 => NET592,
       sr_dados => NET1033,
       srm_ender => NET571,
       srm_rm => NET559,
       srtemp => NET549,
       x00000000 => x00000000,
       x00000001 => x00000001,
       x00000010 => x00000010,
       x000000F0 => x000000F0
  );

U2 : uc
  port map(
       rm3126(0) => BUSRM(26),
       rm3126(1) => BUSRM(27),
       rm3126(2) => BUSRM(28),
       rm3126(3) => BUSRM(29),
       rm3126(4) => BUSRM(30),
       rm3126(5) => BUSRM(31),
       rm50(0) => BUSRM(0),
       rm50(1) => BUSRM(1),
       rm50(2) => BUSRM(2),
       rm50(3) => BUSRM(3),
       rm50(4) => BUSRM(4),
       rm50(5) => BUSRM(5),
       Ta => Ta,
       Tb => Tb,
       enable => enable,
       inter => inter,
       pronto => pronto,
       reset => reset,
       rtemp => BUSRTEMP,
       rtemp31 => BUSRTEMP(31),
       rw => rw,
       s_dados => NET1033,
       s_dir => NET759,
       s_gprmux0 => s_gpmux(0),
       s_gprmux1 => s_gpmux(1),
       s_op => NET731,
       s_we => NET741,
       sb1_ender => NET708,
       seb1_1 => NET308,
       seb1_10 => NET305,
       seb1_11 => NET302,
       seb1_12 => NET318,
       seb1_2 => NET328,
       seb1_3 => NET340,
       seb1_4 => NET353,
       seb1_5 => NET364,
       seb1_6 => NET376,
       seb1_7 => NET391,
       seb1_9 => NET509,
       seb2_1 => NET802,
       seb2_2 => NET820,
       seb2_3 => NET833,
       seb3_1 => NET844,
       seb3_2 => NET985,
       seb3_3 => NET973,
       seb4_1 => NET770,
       seb4_2 => NET780,
       seb4_3 => NET847,
       seb4_4 => NET954,
       seb5_1 => NET944,
       seb5_2 => NET934,
       seb5_3 => NET918,
       seb5_4 => NET604,
       seb5_5 => NET592,
       smux => NET1042,
       srm_ender => NET571,
       srm_rm => NET559,
       srtemp => NET549
  );


---- Power , ground assignment ----

GND <= GND_CONSTANT;

end processadorfinal;
