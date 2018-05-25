----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:25:44 01/21/2018 
-- Design Name: 
-- Module Name:    Reg_Inst - Behavioral 
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

entity Reg_Inst is
    Port ( D : in  STD_LOGIC_VECTOR (7 downto 0);
           CLK : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (7 downto 0);
           ENABLE : in  STD_LOGIC;
           RESET : in  STD_LOGIC);
end Reg_Inst;

architecture Behavioral of Reg_Inst is

begin
	process(CLK, RESET)
		begin
		if RESET='1' then
			Q<=(others=>'0');
		elsif rising_edge(CLK) then
			if ENABLE='1' then
				Q<=D;
			end if;
		end if;
	end process;
end Behavioral;

