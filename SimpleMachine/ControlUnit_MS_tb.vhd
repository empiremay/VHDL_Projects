--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:22:46 01/26/2018
-- Design Name:   
-- Module Name:   D:/Universidad/Proyectos TDC/SimpleMachine/ControlUnit_MS_tb.vhd
-- Project Name:  SimpleMachine
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ControlUnit_MS
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
 
ENTITY ControlUnit_MS_tb IS
END ControlUnit_MS_tb;
 
ARCHITECTURE behavior OF ControlUnit_MS_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ControlUnit_MS
    PORT(
         COP : IN  std_logic_vector(1 downto 0);
         Push : IN  std_logic;
         FZ : IN  std_logic;
         CLK : IN  std_logic;
         RESET : IN  std_logic;
         CW : OUT  std_logic_vector(9 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal COP : std_logic_vector(1 downto 0) := (others => '0');
   signal Push : std_logic := '0';
   signal FZ : std_logic := '0';
   signal CLK : std_logic := '0';
   signal RESET : std_logic := '0';

 	--Outputs
   signal CW : std_logic_vector(9 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ControlUnit_MS PORT MAP (
          COP => COP,
          Push => Push,
          FZ => FZ,
          CLK => CLK,
          RESET => RESET,
          CW => CW
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
		COP <= "00"; wait for 20 ns;
		for I in 1 to 5 loop
			Push <= '1'; wait for 20 ns;
			Push <= '0'; wait for 20 ns;
		end loop;
		COP <= "01"; wait for 20 ns;
		for I in 1 to 5 loop
			Push <= '1'; wait for 20 ns;
			Push <= '0'; wait for 20 ns;
		end loop;
		COP <= "10"; wait for 20 ns;
		for I in 1 to 5 loop
			Push <= '1'; wait for 20 ns;
			Push <= '0'; wait for 20 ns;
		end loop;
		COP <= "11"; wait for 20 ns;
		FZ <= '1'; wait for 20 ns;
		for I in 1 to 3 loop
			Push <= '1'; wait for 20 ns;
			Push <= '0'; wait for 20 ns;
		end loop;
		COP <= "11"; wait for 20 ns;
		FZ <= '0'; wait for 20 ns;
		Push <= '1'; wait for 20 ns;
		Push <= '0'; wait for 20 ns;
      wait;
   end process;

END;
