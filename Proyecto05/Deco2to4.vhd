----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:48:25 10/13/2017 
-- Design Name: 
-- Module Name:    Deco2to4 - Behavioral 
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

entity Deco2to4 is
    Port ( I : in  STD_LOGIC_VECTOR (1 downto 0);
           Enable : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (3 downto 0));
end Deco2to4;

architecture Behavioral of Deco2to4 is

begin

	process(Enable,I)
		begin
			if Enable='0' then
				S <= "0000";
			else
				if I="00" then
					S <= "0001";
				end if;
				if I="01" then
					S <= "0010";
				end if;
				if I="10" then
					S <= "0100";
				end if;
				if I="11" then
					S <= "1000";
				end if;
			end if;
	end process;
end Behavioral;

