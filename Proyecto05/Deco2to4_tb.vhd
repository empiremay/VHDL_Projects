--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:14:36 10/25/2017
-- Design Name:   
-- Module Name:   C:/Users/TDC/Proyecto05/Deco2to4_tb.vhd
-- Project Name:  Proyecto05
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Deco2to4
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
 
ENTITY Deco2to4_tb IS
END Deco2to4_tb;
 
ARCHITECTURE behavior OF Deco2to4_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Deco2to4
    PORT(
         I : IN  std_logic_vector(1 downto 0);
         Enable : IN  std_logic;
         S : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal I : std_logic_vector(1 downto 0) := (others => '0');
   signal Enable : std_logic := '0';

 	--Outputs
   signal S : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Deco2to4 PORT MAP (
          I => I,
          Enable => Enable,
          S => S
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
		I <= "00";
		wait for 40 ns;
		Enable <= '0';
		wait for 60 ns;
		
		I <= "01";
		wait for 40 ns;
		Enable <= '0';
		wait for 60 ns;
		
		I <= "10";
		wait for 40 ns;
		Enable <= '0';
		wait for 60 ns;
		
		I <= "11";
		wait for 40 ns;
		Enable <= '0';
		wait for 60 ns;
		
		I <= "00";
		wait for 40 ns;
		Enable <= '1';
		wait for 60 ns;
		
		I <= "01";
		wait for 40 ns;
		Enable <= '1';
		wait for 60 ns;
		
		I <= "10";
		wait for 40 ns;
		Enable <= '1';
		wait for 60 ns;
		
		I <= "11";
		wait for 40 ns;
		Enable <= '1';
		wait for 60 ns;

      wait;
   end process;

END;
