library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;

entity contadorInstrucoes is
  port(
  		inst: in std_logic;
  		reset: in std_logic;
		cont: out std_logic_vector(7 downto 0)
  );
end contadorInstrucoes;

architecture contadorInstrucoes of contadorInstrucoes is	
signal contar : std_logic_vector(7 downto 0);
begin
	contagem: process(inst, reset)
	begin
		cont<=contar;
		if(inst'event and inst='1') then
			contar<=contar+1;
		elsif(reset='1') then
			cont<="00000000";
		end if;
		
	end process;
	

end contadorInstrucoes;