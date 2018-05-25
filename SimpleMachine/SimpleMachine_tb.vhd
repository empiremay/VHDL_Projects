--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:14:25 01/26/2018
-- Design Name:   
-- Module Name:   D:/Universidad/Proyectos TDC/SimpleMachine/SimpleMachine_tb.vhd
-- Project Name:  SimpleMachine
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SimpleMachine
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
 
ENTITY SimpleMachine_tb IS
END SimpleMachine_tb;
 
ARCHITECTURE behavior OF SimpleMachine_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SimpleMachine
    PORT(
         Push : IN  std_logic;
         AddressRAM : OUT  std_logic_vector(2 downto 0);
         SalRegA : OUT  std_logic_vector(7 downto 0);
         SalRegB : OUT  std_logic_vector(7 downto 0);
         FZ : OUT  std_logic;
         CLK : IN  std_logic;
         RESET : IN  std_logic;
         SalRI : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Push : std_logic := '0';
   signal CLK : std_logic := '0';
   signal RESET : std_logic := '0';

 	--Outputs
   signal AddressRAM : std_logic_vector(2 downto 0);
   signal SalRegA : std_logic_vector(7 downto 0);
   signal SalRegB : std_logic_vector(7 downto 0);
   signal FZ : std_logic;
   signal SalRI : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SimpleMachine PORT MAP (
          Push => Push,
          AddressRAM => AddressRAM,
          SalRegA => SalRegA,
          SalRegB => SalRegB,
          FZ => FZ,
          CLK => CLK,
          RESET => RESET,
          SalRI => SalRI
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
		RESET <= '1';
		wait for 40 ns;
		RESET <= '0';
		wait for 40 ns;
		for I in 1 to 100 loop
			Push <= '1';
			wait for 30 ns;
			Push <= '0';
			wait for 30 ns;
		end loop;
      wait;
   end process;

END;
