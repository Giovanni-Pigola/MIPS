library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;

entity contadorInstrucoes is
  port(
  		inst: in std_logic;
  		reset: in std_logic;
		cont: out integer
  );
end contadorInstrucoes;

architecture contadorInstrucoes of contadorInstrucoes is	
signal contar : integer;
begin
	contagem: process(inst, reset)
	begin
		cont<=contar;
		if(inst'event and inst='1') then
			contar<=contar+1;
		elsif(reset='1') then
			cont<=0;
		end if;
		
	end process;
	

end contadorInstrucoes;