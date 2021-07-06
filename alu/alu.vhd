library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
entity alu is
	PORT(L: inout std_logic_vector(7 downto 0);
	     A,B:in std_logic_vector (3 downto 0);
	     S: in std_logic_vector(2 downto 0));
end;

architecture alu_a of alu is
Signal sa,sb:std_logic_vector(3 downto 0);
Signal ss:std_logic_vector(2 downto 0);
Signal sl:std_logic_vector(7 downto 0);
begin
  sa<=A;
  sb<=B;
  ss<=S;
  with  ss select
	sl<="0000"&(sa or sb) when "000",
	   "0000"&(sa and sb) when "001",
	   "0000"&(sa xor sb)when "010",
	   "0000"&(sa nand sb)when "011",
	   "0000"&(sa + sb) when "100",
	   "0000"&(sa - sb) when "101",
	   (sa * sb) when "110",
	   "0000"&(sb - sa) when "111",
	   "00000000" when others;
L<=sl;
end alu_a;

