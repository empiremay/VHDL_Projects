----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:34:24 10/18/2017 
-- Design Name: 
-- Module Name:    Disp7Seg - Behavioral 
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

entity Disp7Seg is
    Port ( Hex : in  STD_LOGIC_VECTOR (3 downto 0);
           Select_Disp : in  STD_LOGIC_VECTOR (1 downto 0);
           Seg : out  STD_LOGIC_VECTOR (6 downto 0);
           Anode : out  STD_LOGIC_VECTOR (3 downto 0));
end Disp7Seg;

architecture Behavioral of Disp7Seg is

begin

	process(Select_Disp)
		begin
			if Select_Disp = "00" then
				Anode <= "1110";
			end if;
			if Select_Disp = "01" then
				Anode <= "1101";
			end if;
			if Select_Disp = "10" then
				Anode <= "1011";
			end if;
			if Select_Disp = "11" then
				Anode <= "0111";
			end if;
	end process;
	
	process(Hex)
		begin
			if Hex = "0000" then
				Seg <= "1000000";
			end if;
			if Hex = "0001" then
				Seg <= "1111001";
			end if;
			if Hex = "0010" then
				Seg <= "0100100";
			end if;
			if Hex = "0011" then
				Seg <= "0110000";
			end if;
			if Hex = "0100" then
				Seg <= "0011001";
			end if;
			if Hex = "0101" then
				Seg <= "0010010";
			end if;
			if Hex = "0110" then
				Seg <= "0000010";
			end if;
			if Hex = "0111" then
				Seg <= "1111000";
			end if;
			if Hex = "1000" then
				Seg <= "0000000";
			end if;
			if Hex = "1001" then
				Seg <= "0010000";
			end if;
			if Hex = "1010" then
				Seg <= "0001000";
			end if;
			if Hex = "1011" then
				Seg <= "0000011";
			end if;
			if Hex = "1100" then
				Seg <= "1000110";
			end if;
			if Hex = "1101" then
				Seg <= "0100001";
			end if;
			if Hex = "1110" then
				Seg <= "0000110";
			end if;
			if Hex = "1111" then
				Seg <= "0001110";
			end if;
	end process;

end Behavioral;

