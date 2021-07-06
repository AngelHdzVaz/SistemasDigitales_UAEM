library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity comparador is
	PORT(n1,n2:in std_logic_vector(3 downto 0);
	display: out std_logic_vector(7 downto 0));
end comparador;

architecture a_comparador of comparador is
begin
	display<="01100000" when n2<n1 else
		 "11011010" when n1<n2 else
		 "00010010";

end a_comparador;

