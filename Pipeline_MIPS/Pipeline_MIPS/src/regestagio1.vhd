library IEEE;
use IEEE.std_logic_1164.all;

entity regestagio1 is
  port(
  		hazardctrl : in std_logic;
  		UCctrl : in std_logic;	
		clock: in std_logic;
       	D1 : in std_logic_vector(31 downto 0);
       	Q1 : out std_logic_vector(31 downto 0);
		D2 : in std_logic_vector(31 downto 0);
       	Q2 : out std_logic_vector(31 downto 0)
  );
end regestagio1;

architecture reg of regestagio1	is
begin
	 regist: process(clock, UCctrl, hazardctrl)
	 begin
		 if(clock'event and clock='1') then
			 if(hazardctrl='1' and UCctrl='0') then
				 Q1<=D1;
				 Q2<=D2;
			 end if;
		 end if;
	end process;
end reg;