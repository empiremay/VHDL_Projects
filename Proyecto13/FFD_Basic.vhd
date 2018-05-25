----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:34:36 11/08/2017 
-- Design Name: 
-- Module Name:    FFD_Basic - Behavioral 
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

entity FFD_Basic is
    Port ( D : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
			  ENABLE: in STD_LOGIC;
			  RESET: in STD_LOGIC;
           Q : out  STD_LOGIC);
end FFD_Basic;

architecture Behavioral of FFD_Basic is

begin
	process(CLK, RESET)
	begin
	if RESET='1' then
		Q<='0';
	elsif rising_edge(CLK) then
		if ENABLE='1' then
			Q<=D;
		end if;
	end if;
	end process;
end Behavioral;

