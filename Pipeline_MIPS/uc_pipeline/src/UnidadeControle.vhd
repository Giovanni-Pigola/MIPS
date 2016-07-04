library IEEE;
use IEEE.std_logic_1164.all;

entity unidadecontrole is
	port(opcode: in std_logic_vector(5 downto 0);
	func: in std_logic_vector(5 downto 0);
	overflowULA: in std_logic;
	wb_m_exCtrl:	out std_logic;
	orCtrl: out std_logic;
	RegEst1: out std_logic;
	ULAEst3Ctrl: out std_logic;
	Mux1UCEst3: out std_logic;
	Mux2UCEst3:	out std_logic;
	MuxEst3Ctrl: out std_logic;
	MuxEst3ulaCtrl:	out std_logic;
	MuxEst5Ctrl: out std_logic;
	MuxInicioCtrl: out std_logic_vector(1 downto 0);
	instrucaoInvalida: out std_logic;
	MuxMEM: out std_logic);
end unidadecontrole;


architecture behavior of unidadecontrole is
begin
	ctrl: process(opcode, func)
	begin
		if(opcode="000000" and func="100000") then
			wb_m_exCtrl<='1';  
			orCtrl<='0';
			RegEst1<='1';
			ULAEst3Ctrl<='0';
			Mux1UCEst3<='0';
			Mux2UCEst3<='0';
			MuxEst3Ctrl<='0';
			MuxEst3ulaCtrl<='0';
			MuxEst5Ctrl<='0';
			MuxInicioCtrl<="00";
			instrucaoInvalida<='0';
			MuxMEM<='0';
		elsif(opcode="000000" and func="101010") then
			wb_m_exCtrl<='1';  
			orCtrl<='0';
			RegEst1<='1';
			ULAEst3Ctrl<='0';
			Mux1UCEst3<='0';
			Mux2UCEst3<='0';
			MuxEst3Ctrl<='0';
			MuxEst3ulaCtrl<='1';
			MuxEst5Ctrl<='1';
			MuxInicioCtrl<="00";
			instrucaoInvalida<='0';
			MuxMEM<='0';
		elsif(opcode="000000" and func="001000") then
			wb_m_exCtrl<='1';  
			orCtrl<='0';
			RegEst1<='1';
			ULAEst3Ctrl<='0';
			Mux1UCEst3<='0';
			Mux2UCEst3<='0';
			MuxEst3Ctrl<='0';
			MuxEst3ulaCtrl<='0';
			MuxEst5Ctrl<='0';
			MuxInicioCtrl<="11";
			instrucaoInvalida<='0';
			MuxMEM<='1';
		elsif(opcode="000000" and func="100001") then  
			wb_m_exCtrl<='1';  
			orCtrl<='0';
			RegEst1<='1';
			ULAEst3Ctrl<='0';
			Mux1UCEst3<='0';
			Mux2UCEst3<='0';
			MuxEst3Ctrl<='0';
			MuxEst3ulaCtrl<='0';
			MuxEst5Ctrl<='0';
			MuxInicioCtrl<="00";
			instrucaoInvalida<='0';
			MuxMEM<='0';
		elsif(opcode="000000" and func="000000") then 
			wb_m_exCtrl<='1';  
			orCtrl<='0';
			RegEst1<='1';
			ULAEst3Ctrl<='0';
			Mux1UCEst3<='0';
			Mux2UCEst3<='0';
			MuxEst3Ctrl<='0';
			MuxEst3ulaCtrl<='1';
			MuxEst5Ctrl<='1';
			MuxInicioCtrl<="00";
			instrucaoInvalida<='0';	
			MuxMEM<='0';
		elsif(opcode="100011") then
			wb_m_exCtrl<='1';  
			orCtrl<='0';
			RegEst1<='1';
			ULAEst3Ctrl<='0';
			Mux1UCEst3<='0';
			Mux2UCEst3<='0';
			MuxEst3Ctrl<='0';
			MuxEst3ulaCtrl<='0';
			MuxEst5Ctrl<='0';
			MuxInicioCtrl<="00";
			instrucaoInvalida<='0';
			MuxMEM<='1';
		elsif(opcode="101011") then
			wb_m_exCtrl<='1';  
			orCtrl<='0';
			RegEst1<='1';
			ULAEst3Ctrl<='0';
			Mux1UCEst3<='0';
			Mux2UCEst3<='0';
			MuxEst3Ctrl<='0';
			MuxEst3ulaCtrl<='0';
			MuxEst5Ctrl<='0';
			MuxInicioCtrl<="00";
			instrucaoInvalida<='0';
			MuxMEM<='1';
		elsif(opcode="001000") then
			wb_m_exCtrl<='1';  
			orCtrl<='0';
			RegEst1<='1';
			ULAEst3Ctrl<='0';
			Mux1UCEst3<='0';
			Mux2UCEst3<='0';
			MuxEst3Ctrl<='0';
			MuxEst3ulaCtrl<='0';
			MuxEst5Ctrl<='0';
			MuxInicioCtrl<="00";
			instrucaoInvalida<='0';
			MuxMEM<='0';
		elsif(opcode="000100") then
			wb_m_exCtrl<='0';  
			orCtrl<='0';
			RegEst1<='1';
			ULAEst3Ctrl<='0';
			Mux1UCEst3<='1';
			Mux2UCEst3<='1';
			MuxEst3Ctrl<='0';
			MuxEst3ulaCtrl<='0';
			MuxEst5Ctrl<='0';
			MuxInicioCtrl<="00";
			instrucaoInvalida<='0';
			MuxMEM<='0';
		elsif(opcode="001010") then
			wb_m_exCtrl<='0';  
			orCtrl<='0';
			RegEst1<='1';
			ULAEst3Ctrl<='0';
			Mux1UCEst3<='1';
			Mux2UCEst3<='1';
			MuxEst3Ctrl<='0';
			MuxEst3ulaCtrl<='0';
			MuxEst5Ctrl<='0';
			MuxInicioCtrl<="00";
			instrucaoInvalida<='0';
			MuxMEM<='0';
		elsif(opcode="000101") then	
			wb_m_exCtrl<='0';  
			orCtrl<='0';
			RegEst1<='1';
			ULAEst3Ctrl<='0';
			Mux1UCEst3<='1';
			Mux2UCEst3<='1';
			MuxEst3Ctrl<='0';
			MuxEst3ulaCtrl<='0';
			MuxEst5Ctrl<='0';
			MuxInicioCtrl<="00";
			instrucaoInvalida<='0';
			MuxMEM<='0';
		elsif(opcode="000010") then
			wb_m_exCtrl<='0';  
			orCtrl<='0';
			RegEst1<='1';
			ULAEst3Ctrl<='0';
			Mux1UCEst3<='0';
			Mux2UCEst3<='0';
			MuxEst3Ctrl<='0';
			MuxEst3ulaCtrl<='0';
			MuxEst5Ctrl<='0';
			MuxInicioCtrl<="01";
			instrucaoInvalida<='0';
			MuxMEM<='0';
		elsif(opcode="000011") then
			wb_m_exCtrl<='0';  
			orCtrl<='0';
			RegEst1<='1';
			ULAEst3Ctrl<='0';
			Mux1UCEst3<='0';
			Mux2UCEst3<='0';
			MuxEst3Ctrl<='0';
			MuxEst3ulaCtrl<='0';
			MuxEst5Ctrl<='0';
			MuxInicioCtrl<="01";
			instrucaoInvalida<='0';
			MuxMEM<='0';
		else
			wb_m_exCtrl<='0';  
			orCtrl<='0';
			RegEst1<='1';
			ULAEst3Ctrl<='0';
			Mux1UCEst3<='1';
			Mux2UCEst3<='1';
			MuxEst3Ctrl<='0';
			MuxEst3ulaCtrl<='0';
			MuxEst5Ctrl<='0';
			MuxInicioCtrl<="00";
			instrucaoInvalida<='0';
			MuxMEM<='0';
		end if;
		
	end process;
	
end behavior;