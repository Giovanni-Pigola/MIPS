library IEEE;
use IEEE.std_logic_1164.all;

entity regestagio2 is
  port(
  		wb : in std_logic;
  		m : in std_logic;
		ex : in std_logic;
		ctrlMux3 : in std_logic;
		ctrlMux5 : in std_logic;
		ctrlULA : in std_logic;
		ctrlMux32: in std_logic;
		ctrlMuxMEM: in std_logic;
		clock: in std_logic;
       	entradaPC : in std_logic_vector(31 downto 0); 
		entradaSignExtend : in std_logic_vector(31 downto 0);  
		entradaGPR2521 : in std_logic_vector(4 downto 0);	  
		entradaGPR2016 : in std_logic_vector(4 downto 0); 
		entrada32bits : in std_logic_vector(31 downto 0);
       	saidaGPR2521 : out std_logic_vector(31 downto 0);
		saidaGPR2016 : out std_logic_vector(31 downto 0);
       	saida1511 : out std_logic_vector(4 downto 0);
		saida2016 : out std_logic_vector(4 downto 0);
		saida2521 : out std_logic_vector(4 downto 0);
		saidaPC: out std_logic_vector(31 downto 0);
		saidaShamt: out std_logic_vector(4 downto 0);
		sctrlMux3 : out std_logic;
		sctrlMux5 : out std_logic;
		sctrlULA : out std_logic;
		sctrlMux32: out std_logic;
		sctrlMuxMEM: out std_logic;
		wbsaida: out std_logic;
		msaida:	out std_logic;
		exsaida: out std_logic
  );
end regestagio2;	

architecture reg2 of regestagio2 is
begin
	 reg: process(clock)
	 begin
     	if(clock'event and clock='1') then
			wbsaida<=wb;
			msaida<=m;
			exsaida<=ex;
			saidaGPR2521<="000000000000000000000000000"&entradaGPR2521;
			saidaGPR2016<="000000000000000000000000000"&entradaGPR2016;
			saida2016<=entrada32bits(20 downto 16);
			saida1511<=entrada32bits(15 downto 11);
			saida2521<=entrada32bits(25 downto 21);
			saidaPC<=entradaPC;	
			sctrlMux3<=ctrlMux3;
			sctrlMux5<=ctrlMux5;
			sctrlULA<=ctrlULA;
			sctrlMux32<=ctrlMux32;
			sctrlMuxMEM<=ctrlMuxMEM;
			saidaShamt<=entrada32bits(10 downto 6);
		end if;
	end process;
end reg2;