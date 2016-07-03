library IEEE;
use IEEE.std_logic_1164.all;


entity mux5bitx is
  port(
       S : in std_logic;
       In1, In2 : in std_logic_vector(4 downto 0);
       O : out std_logic_vector(4 downto 0)
  );
end mux5bitx;

architecture mux1bitx of mux5bitx is

begin
	sel: process(S)
	begin
		if(S='0') then
			O<=In1;
		else
			O<=In2;
		end if;
		
	end process;
	

end mux1bitx;