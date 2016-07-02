library IEEE;
use IEEE.std_logic_1164.all;

entity regpc is
  port(
       hazardctrl : in std_logic;
       D : in std_logic_vector(31 downto 0);
       Q : out std_logic_vector(31 downto 0)
  );
end regpc;			  

architecture reg of regpc is
begin
	registrar: process(hazardctrl)
	begin
		if(hazardctrl='1') then
			Q<=D;
		end if;
	end process;
end reg;