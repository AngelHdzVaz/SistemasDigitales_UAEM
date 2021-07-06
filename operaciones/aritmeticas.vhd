library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ALU_2 is
	port ( A,B: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		S: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		L: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));

end;

architecture A_ALU2 of ALU_2 is
begin
WITH S SELECT
	L <= A + B WHEN "100",
	     A - B WHEN "101",
	     "0000" WHEN OTHERS;




end A_ALU2;

