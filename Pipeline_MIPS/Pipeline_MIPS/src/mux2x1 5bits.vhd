library IEEE;
use IEEE.std_logic_1164.all;


entity mux2x1_5bits is
  port(
       S : in std_logic;
       In1, In2 : in std_logic_vector(4 downto 0);
       O : out std_logic_vector(4 downto 0)
  );
end mux2x1_5bits;

architecture mux2x1_5bits of mux2x1_5bits is

begin
	sel: process(S)
	begin
		if(S='0') then
			O<=In1;
		else
			O<=In2;
		end if;
		
	end process;
	

end mux2x1_5bits;