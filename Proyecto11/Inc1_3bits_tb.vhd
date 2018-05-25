--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:47:18 10/25/2017
-- Design Name:   
-- Module Name:   C:/Users/TDC/Proyecto11/Inc1_3bits_tb.vhd
-- Project Name:  Proyecto11
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Inc1_3bits
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
 
ENTITY Inc1_3bits_tb IS
END Inc1_3bits_tb;
 
ARCHITECTURE behavior OF Inc1_3bits_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Inc1_3bits
    PORT(
         Value : IN  std_logic_vector(2 downto 0);
         Value_Inc : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Value : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal Value_Inc : std_logic_vector(2 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Inc1_3bits PORT MAP (
          Value => Value,
          Value_Inc => Value_Inc
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- insert stimulus here 
		
		Value <= "000";
		wait for 100 ns;
		
		Value <= "001";
		wait for 100 ns;
		
		Value <= "010";
		wait for 100 ns;
		
		Value <= "011";
		wait for 100 ns;
		
		Value <= "100";
		wait for 100 ns;
		
		Value <= "101";
		wait for 100 ns;
		
		Value <= "110";
		wait for 100 ns;
		
		Value <= "111";
		wait for 100 ns;

      wait;
   end process;

END;
