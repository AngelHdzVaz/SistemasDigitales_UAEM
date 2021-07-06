library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

--LOGICAS OPERACIONES
entity gal1 is
	port ( A,B: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		S: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		L: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		SEL2: OUT STD_LOGIC_VECTOR(1 DOWNTO 0));


end;

architecture A_GAL1 of gal1 is
begin

WITH S SELECT
	L <= A OR B WHEN "000",
	     A AND B WHEN "001",
	     A XOR B WHEN "010",
	     A NAND B WHEN "011",
	     "0000" WHEN OTHERS;

		SEL2 <= "01" WHEN S = "110" ELSE --RESTA
		"10" WHEN S = "111" ELSE --MULTI
		"00";
end A_GAL1;

