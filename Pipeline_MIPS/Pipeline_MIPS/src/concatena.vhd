library ieee;
use ieee.std_logic_1164.all;  
use ieee.std_logic_unsigned.all;

entity concatena is
	port(entrada: in std_logic_vector(31 downto 0);
		saida: out std_logic_vector(31 downto 0));
end concatena;				

architecture behavior of concatena is
begin	 	
	escolhe: process(entrada(31 downto 26))
	begin
		if(entrada(31 downto 26)="000010" or entrada(31 downto 26)="000011") then
			saida<="000000"&entrada(25 downto 0);
		elsif(entrada(31 downto 26)="000100" or entrada(31 downto 26)="000101" or entrada(31 downto 26)="100011" or entrada(31 downto 26)="101011" or entrada(31 downto 26)="001000" or entrada(31 downto 26)="001010") then
			saida<="0000000000000000"&entrada(15 downto 0);		 
		else
			saida<="00000000000000000000000000000000";
		end if;	 
	end process;
end behavior;