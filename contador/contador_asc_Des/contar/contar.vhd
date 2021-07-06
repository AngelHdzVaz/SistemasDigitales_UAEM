library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
 
entity contador is
    port (
        clk: in  std_logic;
	direc: in std_logic:='0';
        cnt_out: out std_logic_vector(3 downto 0)
    );
end;
 
architecture contando of contador is

signal  cnt_tmp : integer range 0 to 15 := 1;

begin

	process(clk) begin
	if rising_edge(clk) then
	   if(direc='0') then
	   cnt_tmp <= cnt_tmp + 1;
	   else 
	   cnt_tmp <= cnt_tmp - 1;
	   end if;
        end if;
    end process;
	cnt_out <= 	"0001" when cnt_tmp=0 else
			"0001" when cnt_tmp=1 else
			"0011" when cnt_tmp=2 else
			"0011" when cnt_tmp=3 else
			"0101" when cnt_tmp=4 else
			"0101" when cnt_tmp=5 else
			"1001" when cnt_tmp=6 else
			"1001" when cnt_tmp=7 else
			"1001" when cnt_tmp=8 else
			"1001" when cnt_tmp=9 else
			"1110" when cnt_tmp=10 else
			"1110" when cnt_tmp=11 else
			"1110" when cnt_tmp=12 else
			"1110" when cnt_tmp=13 else
			"1110" when cnt_tmp=14 else
			"1111" when cnt_tmp=15;

end contando;
