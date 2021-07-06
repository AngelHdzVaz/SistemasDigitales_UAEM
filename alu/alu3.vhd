library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity alu3 is
Port(L: out std_logic_vector(7 downto 0);
	A,B: in std_logic_vector(3 downto 0);
	S: in std_logic_vector(1 downto 0));
end;

architecture arq_alu of alu3 is
signal s1,s2,s4:std_logic_vector(3 downto 0);
signal s3:std_logic_vector(7 downto 0);
begin
s1<=A+B;
s2<=A-B;
s3<=A*B;
s4<=B-A;
with S select
	L<="0000"&s1 when "00",
	   "0000"&s2 when "01",
	   s3 when "10",
	   "0000"&s4 when "11";
end arq_alu;

