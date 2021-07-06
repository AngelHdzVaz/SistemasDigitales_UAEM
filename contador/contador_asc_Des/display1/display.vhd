library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity displays is
port(num:in std_logic_vector(3 downto 0);
	dis2:out std_logic;
    salida: out std_logic_vector(6 downto 0));
end;

architecture display1 of displays is
signal numero:std_logic_vector(3 downto 0);
begin
numero<=num;
salida<="0110000" when numero="0001" else
   "1111001" when numero="0011" else
   "1011011" when numero="0101" else
   "1110011" when numero="1001" else
   "0110011" when numero="1110" else
   "1011011" when numero="1111" else
   "0000000";
dis2<=  '1' when numero="1110" else
	'1' when numero="1111" else
	'0';
end display1;

