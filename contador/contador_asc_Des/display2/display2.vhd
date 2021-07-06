library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity display is
port(numero:in std_logic;
	display: out std_logic_vector(6 downto 0));
end;

architecture displa2 of display is
signal num: std_logic;
begin
num<=numero;
display<="0000110" when num='1' else
	"0111111"; 

end displa2;

