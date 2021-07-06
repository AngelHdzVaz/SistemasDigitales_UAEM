library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity alu is
Port(L: out std_logic_vector(3 downto 0);
	A,B: in std_logic_vector(3 downto 0);
	S: in std_logic_vector(1 downto 0));
end;

architecture ar_alu of alu is
begin
with S select
	L<=(A or B) when "00",
	   (A and B) when "01",
	   (A xor B)when "10",
	   (A nand B)when "11";
end ar_alu;

