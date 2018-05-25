--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:36:07 10/25/2017
-- Design Name:   
-- Module Name:   C:/Users/TDC/Project3/mUX2_TB.vhd
-- Project Name:  Project3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux2_1bit
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY mUX2_TB IS
END mUX2_TB;
 
ARCHITECTURE behavior OF mUX2_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux2_1bit
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         Sel : IN  std_logic;
         Y : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal Sel : std_logic := '0';

 	--Outputs
   signal Y : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux2_1bit PORT MAP (
          A => A,
          B => B,
          Sel => Sel,
          Y => Y
        );

   -- Clock process definitions
   --<clock>_process :process
   --begin
	--	<clock> <= '0';
	--	wait for <clock>_period/2;
	--	<clock> <= '1';
	--	wait for <clock>_period/2;
   --end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      --wait for 100 ns;	

      --wait for <clock>_period*10;

      -- insert stimulus here 
		A <= '0';
		B <= '0';
		wait for 40 ns;
		Sel <= '0';
		wait for 60 ns;
		
		A <= '0';
		B <= '1';
		wait for 40 ns;
		Sel <= '0';
		wait for 60 ns;
		
		A <= '1';
		B <= '0';
		wait for 40 ns;
		Sel <= '0';
		wait for 60 ns;
		
		A <= '1';
		B <= '1';
		wait for 40 ns;
		Sel <= '0';
		wait for 60 ns;
		
		A <= '0';
		B <= '0';
		wait for 40 ns;
		Sel <= '1';
		wait for 60 ns;
		
		A <= '0';
		B <= '1';
		wait for 40 ns;
		Sel <= '1';
		wait for 60 ns;
		
		A <= '1';
		B <= '0';
		wait for 40 ns;
		Sel <= '1';
		wait for 60 ns;
		
		A <= '1';
		B <= '1';
		wait for 40 ns;
		Sel <= '1';
		wait for 60 ns;
		
      wait;
   end process;

END;
