----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:58:19 10/18/2017 
-- Design Name: 
-- Module Name:    Mux2_3bits - Behavioral 
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

entity Mux2_3bits is
    Port ( A : in  STD_LOGIC_VECTOR (2 downto 0);
           B : in  STD_LOGIC_VECTOR (2 downto 0);
           Sel : in  STD_LOGIC;
           Z : out  STD_LOGIC_VECTOR (2 downto 0));
end Mux2_3bits;

architecture Behavioral of Mux2_3bits is

begin

	process(Sel,A,B)
		begin
			if Sel = '1' then
				if A(0) = '1' then
					Z(0) <= '1';
				else
					Z(0) <= '0';
				end if;
				if A(1) = '1' then
					Z(1) <= '1';
				else
					Z(1) <= '0';
				end if;
				if A(2) = '1' then
					Z(2) <= '1';
				else
					Z(2) <= '0';
				end if;
			else
				if B(0) = '1' then
					Z(0) <= '1';
				else
					Z(0) <= '0';
				end if;
				if B(1) = '1' then
					Z(1) <= '1';
				else
					Z(1) <= '0';
				end if;
				if B(2) = '1' then
					Z(2) <= '1';
				else
					Z(2) <= '0';
				end if;
			end if;
	end process;

end Behavioral;

