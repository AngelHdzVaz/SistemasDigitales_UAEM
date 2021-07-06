library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ALU3 is
port ( A,B: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		S: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		L: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));


end;

architecture A_ALU3 of ALU3 is
begin
WITH S SELECT
	L <= "0000"&B - A WHEN "01",
	     A * B WHEN "10",
	     "00000000" WHEN OTHERS;

end A_ALU3;

