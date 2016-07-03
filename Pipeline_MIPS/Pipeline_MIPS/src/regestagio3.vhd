library IEEE;
use IEEE.std_logic_1164.all;

entity regestagio3 is
  port(
  		hazardctrl : in std_logic;
  		UCctrl : in std_logic;	
		clock: in std_logic;
       	D1 : in std_logic;
       	Q1 : out std_logic;
		D2 : in std_logic;
       	Q2 : out std_logic;
		D3 : in std_logic_vector(31 downto 0);
		Q3 : out std_logic_vector(31 downto 0);
		D4 : in std_logic_vector(31 downto 0);
		Q4 : out std_logic_vector(31 downto 0);
		D5 : in std_logic_vector(4 downto 0);
		Q5 : out std_logic_vector(4 downto 0)
  );
end regestagio3;

architecture reg of regestagio3	is
begin
	 regist: process(clock, UCctrl, hazardctrl)
	 begin
		 if(clock'event and clock='1') then
			 if(hazardctrl='1' and UCctrl='0') then
				 Q1<=D1;
				 Q2<=D2;
				 Q3<=D3;
				 Q4<=D4;
				 Q5<=D5;
			 end if;
		 end if;
	end process;
end reg;