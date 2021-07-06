
-- VHDL Test Bench Created from source file alu3.vhd -- 05/17/19  09:22:29
--
-- Notes: 
-- 1) This testbench template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the unit under test.
-- Lattice recommends that these types always be used for the top-level
-- I/O of a design in order to guarantee that the testbench will bind
-- correctly to the timing (post-route) simulation model.
-- 2) To use this template as your testbench, change the filename to any
-- name of your choice with the extension .vhd, and use the "source->import"
-- menu in the ispLEVER Project Navigator to import the testbench.
-- Then edit the user defined section below, adding code to generate the 
-- stimulus for your design.
--
LIBRARY ieee;
LIBRARY generics;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE generics.components.ALL;

ENTITY testbench IS
END testbench;

ARCHITECTURE behavior OF testbench IS 

	COMPONENT alu3
	PORT(
		A : IN std_logic_vector(3 downto 0);
		B : IN std_logic_vector(3 downto 0);
		S : IN std_logic_vector(1 downto 0);          
		L : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	SIGNAL L :  std_logic_vector(3 downto 0);
	SIGNAL A :  std_logic_vector(3 downto 0);
	SIGNAL B :  std_logic_vector(3 downto 0);
	SIGNAL S :  std_logic_vector(1 downto 0);

BEGIN

	uut: alu3 PORT MAP(
		L => L,
		A => A,
		B => B,
		S => S
	);


-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
      wait; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
