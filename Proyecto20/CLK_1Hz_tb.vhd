--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:42:32 11/15/2017
-- Design Name:   
-- Module Name:   D:/Universidad/Proyectos TDC/Proyecto20/CLK_1Hz_tb.vhd
-- Project Name:  Proyecto20
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CLK_1Hz
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
 
ENTITY CLK_1Hz_tb IS
END CLK_1Hz_tb;
 
ARCHITECTURE behavior OF CLK_1Hz_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CLK_1Hz
    PORT(
         CLK : IN  std_logic;
         Reset : IN  std_logic;
         Out_1Hz : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal Reset : std_logic := '0';

 	--Outputs
   signal Out_1Hz : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CLK_1Hz PORT MAP (
          CLK => CLK,
          Reset => Reset,
          Out_1Hz => Out_1Hz
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
   end process;

END;
