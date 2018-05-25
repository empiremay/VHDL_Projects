----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:39:43 01/23/2018 
-- Design Name: 
-- Module Name:    Reg_PC_simple - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Reg_PC_simple is
    Port ( D : in  STD_LOGIC_VECTOR (2 downto 0);
           CLK : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (2 downto 0);
           ENABLE : in  STD_LOGIC;
           RESET : in  STD_LOGIC);
end Reg_PC_simple;

architecture Behavioral of Reg_PC_simple is

signal signal_Q : std_logic_vector(2 downto 0);

begin

process(CLK, RESET, D)
	begin
		if RESET='1' then
			signal_Q<=(others=>'0');
		elsif rising_edge(CLK) then
			if ENABLE='1' then
				signal_Q<=D;
			end if;
		end if;
end process;

Q <= '1' & signal_Q(1 downto 0);

end Behavioral;

