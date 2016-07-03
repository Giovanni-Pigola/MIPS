library IEEE;
use IEEE.std_logic_1164.all;

entity regestagio4 is
  port(
  		wb : in std_logic;
		clock: in std_logic;
		ctrlMux5: in std_logic;
		entradacache : in std_logic_vector(4 downto 0);	  
		entradaResULA : in std_logic_vector(4 downto 0); 
	    entrada3 : in std_logic_vector(4 downto 0); 
       	saidacache : out std_logic_vector(4 downto 0);
		saidaResULA : out std_logic_vector(4 downto 0);
		saida3 : out std_logic_vector(4 downto 0);
		sctrlMux5: out std_logic;
		wbsaida: out std_logic
  );
end regestagio4;	

architecture reg4 of regestagio4 is
begin
	 reg: process(clock)
	 begin
     	if(clock'event and clock='1') then
			wbsaida<=wb;
			saidacache<=entradacache;
			saidaResULA<=entradaResULA;
			saida3 <= entrada3;	 
			sctrlMux5<=ctrlMux5;
		end if;
	end process;
end reg4;