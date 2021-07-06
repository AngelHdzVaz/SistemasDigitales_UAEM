library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity displays is
port(numero:in std_logic_vector(3 downto 0);
	s: out std_logic_vector(7 downto 0));
end;

architecture display1 of displays is
begin
s<="00110000" when numero="0001" else
   "01111001" when numero="0011" else
   "01011011" when numero="0101" else
   "01110011" when numero="1001" else
   "10110011" when numero="1110" else
   "11011011" when numero="1111";
end display1;

