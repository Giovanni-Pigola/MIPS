library IEEE;
use IEEE.std_logic_1164.all;

entity regestagio2 is
  port(
  		wb : in std_logic;
  		m : in std_logic;
		ex : in std_logic;
		clock: in std_logic;
       	entradaPC : in std_logic_vector(31 downto 0); 
		entradaSignExtend : in std_logic_vector(31 downto 0);  
		entradaGPR2521 : in std_logic_vector(4 downto 0);	  
		entradaGPR2016 : in std_logic_vector(4 downto 0); 
		entrada32bits : in std_logic_vector(31 downto 0);
       	saidaGPR2521 : out std_logic_vector(4 downto 0);
		saidaGPR2016 : out std_logic_vector(4 downto 0);
       	saida2521 : out std_logic_vector(4 downto 0);
		saida2016 : out std_logic_vector(4 downto 0);
		saidaPC: out std_logic_vector(31 downto 0);
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
			saidaGPR2521<=entradaGPR2521;
			saidaGPR2016<=entradaGPR2016;
			saida2521<=entrada32bits(25 downto 21);
			saida2016<=entrada32bits(20 downto 16);
			saidaPC<=entradaPC;
		end if;
	end process;
end reg2;