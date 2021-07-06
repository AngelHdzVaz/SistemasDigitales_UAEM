library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity decodificador is
	PORT(n: in std_logic_vector(3 downto 0);
	    display: out std_logic_vector(7 downto 0));
end decodificador;

architecture arq_decofi of decodificador is
begin
display<= "11111100" when n="0000" else
	  "01100000" when n="0001" else
	  "11011010" when n="0010" else
	  "11110010" when n="0011" else
	  "01100110" when n="0100" else
	  "10110110" when n="0101" else
	  "10111110" when n="0110" else
	  "11100000" when n="0111" else
	  "11111110" when n="1000" else
	  "11110110" when n="1001" else
	  "11101110" when n="1010" else
	  "00111110" when n="1011" else
	  "10011100" when n="1100" else
	  "01111010" when n="1101" else
	  "10011110" when n="1110" else
	  "10001110";

end arq_decofi;

