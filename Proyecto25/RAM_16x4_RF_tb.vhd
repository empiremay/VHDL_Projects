--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:25:07 12/05/2017
-- Design Name:   
-- Module Name:   D:/Universidad/Proyectos TDC/Proyecto25/RAM_16x4_RF_tb.vhd
-- Project Name:  Proyecto25
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RAM_16x4_RF
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
 
ENTITY RAM_16x4_RF_tb IS
END RAM_16x4_RF_tb;
 
ARCHITECTURE behavior OF RAM_16x4_RF_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RAM_16x4_RF
    PORT(
         DataIn : IN  std_logic_vector(3 downto 0);
         WE : IN  std_logic;
         CLK : IN  std_logic;
         Address : IN  std_logic_vector(3 downto 0);
         DataOut : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal DataIn : std_logic_vector(3 downto 0) := (others => '0');
   signal WE : std_logic := '0';
   signal CLK : std_logic := '0';
   signal Address : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal DataOut : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RAM_16x4_RF PORT MAP (
          DataIn => DataIn,
          WE => WE,
          CLK => CLK,
          Address => Address,
          DataOut => DataOut
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
	--EScribir DATO en DIR(0)
	Address<="0000";
	DataIn<="0101";
	WE<='1’;
	wait for 20 ns;
	--EScribir DATO en DIR(1)
	Address <="0001";
	DataIn <="1111";
	WE<='1';
	--Leer DATO en DIR(0)
	Address <="0000";
	wait for 20 ns;
	WE<='0';
	wait for 40 ns;
	--Leer DATO en DIR(1)
	Address <="0001";
	wait for 20 ns;
	WE<='0';
	wait for 40 ns;
	end process;

END;
