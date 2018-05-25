--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:16:05 11/15/2017
-- Design Name:   
-- Module Name:   D:/Universidad/Proyectos TDC/Proyecto19/YourTurn_tb.vhd
-- Project Name:  Proyecto19
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: YourTurn
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
 
ENTITY YourTurn_tb IS
END YourTurn_tb;
 
ARCHITECTURE behavior OF YourTurn_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT YourTurn
    PORT(
         CLK : IN  std_logic;
         Reset : IN  std_logic;
         Push_Inc : IN  std_logic;
         Count : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal Reset : std_logic := '0';
   signal Push_Inc : std_logic := '0';

 	--Outputs
   signal Count : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: YourTurn PORT MAP (
          CLK => CLK,
          Reset => Reset,
          Push_Inc => Push_Inc,
          Count => Count
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		Push_Inc <= '1';
		wait for 40 ns;
		Push_Inc <= '0';
      wait for 40 ns;	

   end process;

END;
