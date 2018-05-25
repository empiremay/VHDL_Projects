----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:15:00 10/13/2017 
-- Design Name: 
-- Module Name:    Cod4to2_Prior - Behavioral 
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

entity Cod4to2_Prior is
    Port ( I : in  STD_LOGIC_VECTOR (3 downto 0);
           Enable : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (1 downto 0));
end Cod4to2_Prior;

architecture Behavioral of Cod4to2_Prior is

begin
	process(I,Enable)
		begin
			if Enable = '1' then
				if I(3) = '1' then
					S <= "11";
				else
					if I(3) = '0' and I(2) = '1' then
						S <= "10";
					else
						if I(3) = '0' and I(2) = '0' and I(1) = '1' then
							S <= "01";
						else
							if I(3) = '0' and I(2) = '0' and I(1) = '0' and I(0) = '1' then
								S <= "00";
							else
								S <= "ZZ";
							end if;
						end if;
					end if;
				end if;
			else
				S <= "ZZ";
			end if;
	end process;

end Behavioral;

