library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity desloc_shamt is
	port(entrada: in std_logic_vector(31 downto 0);
	shamt: in std_logic_vector(4 downto 0);
	saida: out std_logic_vector(31 downto 0)
	);
end desloc_shamt;

architecture desloc_shamt of desloc_shamt is
begin  
	desloca_shamt: process(shamt)
	begin
		if(shamt="00000") then
			saida<=entrada;
		elsif(shamt="00001") then
			saida<=entrada(30 downto 0)&entrada(31);
		elsif(shamt="00010") then
			saida<=entrada(29 downto 0)&entrada(31 downto 30);
		elsif(shamt="00011") then
			saida<=entrada(28 downto 0)&entrada(31 downto 29);
		elsif(shamt="00100") then
			saida<=entrada(27 downto 0)&entrada(31 downto 28);
		elsif(shamt="00101") then
			saida<=entrada(26 downto 0)&entrada(31 downto 27);
		elsif(shamt="00110") then
			saida<=entrada(25 downto 0)&entrada(31 downto 26);
		elsif(shamt="00111") then
			saida<=entrada(24 downto 0)&entrada(31 downto 25);
		elsif(shamt="01000") then
			saida<=entrada(23 downto 0)&entrada(31 downto 24);
		elsif(shamt="01001") then
			saida<=entrada(22 downto 0)&entrada(31 downto 23);
		elsif(shamt="01010") then
			saida<=entrada(21 downto 0)&entrada(31 downto 22);
		elsif(shamt="01011") then
			saida<=entrada(20 downto 0)&entrada(31 downto 21);
		elsif(shamt="01100") then
			saida<=entrada(19 downto 0)&entrada(31 downto 20);
		elsif(shamt="01101") then
			saida<=entrada(18 downto 0)&entrada(31 downto 19);
		elsif(shamt="01110") then
			saida<=entrada(17 downto 0)&entrada(31 downto 18);
		elsif(shamt="01111") then
			saida<=entrada(16 downto 0)&entrada(31 downto 17);
		elsif(shamt="10000") then
			saida<=entrada(15 downto 0)&entrada(31 downto 16);
		elsif(shamt="10001") then
			saida<=entrada(14 downto 0)&entrada(31 downto 15);
		elsif(shamt="10010") then
			saida<=entrada(13 downto 0)&entrada(31 downto 14);
		elsif(shamt="10011") then
			saida<=entrada(12 downto 0)&entrada(31 downto 13);
		elsif(shamt="10100") then
			saida<=entrada(11 downto 0)&entrada(31 downto 12);
		elsif(shamt="10101") then
			saida<=entrada(10 downto 0)&entrada(31 downto 11);
		elsif(shamt="10110") then
			saida<=entrada(9 downto 0)&entrada(31 downto 10);
		elsif(shamt="10111") then
			saida<=entrada(8 downto 0)&entrada(31 downto 9);
		elsif(shamt="11000") then
			saida<=entrada(7 downto 0)&entrada(31 downto 8);
		elsif(shamt="11001") then
			saida<=entrada(6 downto 0)&entrada(31 downto 7);
		elsif(shamt="11010") then
			saida<=entrada(5 downto 0)&entrada(31 downto 6);
		elsif(shamt="11011") then
			saida<=entrada(4 downto 0)&entrada(31 downto 5);
		elsif(shamt="11100") then
			saida<=entrada(3 downto 0)&entrada(31 downto 4);
		elsif(shamt="11101") then
			saida<=entrada(2 downto 0)&entrada(31 downto 3);
		elsif(shamt="11110") then
			saida<=entrada(1 downto 0)&entrada(31 downto 2);
		else
			saida<=entrada(0)&entrada(31 downto 1);
		end if;
	end process;
end desloc_shamt;