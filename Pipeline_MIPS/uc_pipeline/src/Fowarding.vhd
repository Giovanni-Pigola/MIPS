 library ieee;
use ieee.std_logic_1164.all;  
use ieee.std_logic_unsigned.all;

entity Forwarding is
	port(
	EX_MEM_Rd : in std_logic_vector(4 downto 0);
	ID_EX_Rs : in std_logic_vector(4 downto 0);
	ID_EX_Rt : in std_logic_vector(4 downto 0);
	MEM_WB_Rd : in std_logic_vector(4 downto 0);
	wb_ctrl_e4 : in std_logic;
	wb_ctrl_e5 : in std_logic;
	
	ForwardA : out std_logic_vector(1 downto 0);
	ForwardB : out std_logic_vector(1 downto 0)
	);	
end Forwarding;

architecture method of Forwarding is
begin
	forward: process(wb_ctrl_e4, wb_ctrl_e5)
	begin
		if (wb_ctrl_e4='1' and EX_MEM_Rd/="00000" and EX_MEM_Rd=ID_EX_Rs) then	 
			ForwardA<="10";
		elsif (wb_ctrl_e4='1' and EX_MEM_Rd/="00000" and EX_MEM_Rd=ID_EX_Rt) then	 
			ForwardB<="10";
			
		elsif (wb_ctrl_e5='1' and MEM_WB_Rd/="00000" and not(wb_ctrl_e4='1' and EX_MEM_Rd/="00000" and EX_MEM_Rd/=ID_EX_Rs) and MEM_WB_Rd=ID_EX_Rs) then	 
			ForwardA<="01";
		elsif (wb_ctrl_e5='1' and MEM_WB_Rd/="00000" and not(wb_ctrl_e4='1' and EX_MEM_Rd/="00000" and EX_MEM_Rd/=ID_EX_Rt) and MEM_WB_Rd=ID_EX_Rt) then	 
			ForwardB<="01";
		
		else
			ForwardA<="00";
			ForwardB<="00";
		end if;
	end process;
end method;