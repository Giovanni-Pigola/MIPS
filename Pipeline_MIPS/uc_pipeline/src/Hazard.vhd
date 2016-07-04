library ieee;
use ieee.std_logic_1164.all;  
use ieee.std_logic_unsigned.all;

entity Hazard is
	port(
	ID_EX_Rt : in std_logic_vector(4 downto 0);
	IF_ID : in std_logic_vector(31 downto 0);
	m_ctrl_e3 : in std_logic;
	
	HazardA : out std_logic;
	HazardB : out std_logic
	);	
end Hazard;	 

architecture method of Hazard is
begin
	forward: process(m_ctrl_e3)
	begin
		if (m_ctrl_e3='1' and (ID_EX_Rt=IF_ID(25 downto 21) or ID_EX_Rt=IF_ID(20 downto 16))) then	 
			HazardA<='0';
			HazardB<='0';
		else
			HazardA<='1';
			HazardB<='1';
		end if;
	end process;
end method;