----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:32:12 12/01/2017 
-- Design Name: 
-- Module Name:    RAM_16x4 - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RAM_16x4 is
    Port ( DataIn : in  STD_LOGIC_VECTOR (3 downto 0);
           WE : in  STD_LOGIC;
           Address : in  STD_LOGIC_VECTOR (3 downto 0);
           DataOut : out  STD_LOGIC_VECTOR (3 downto 0);
           CLK : in  STD_LOGIC);
end RAM_16x4;

architecture Behavioral of RAM_16x4 is
	type ram_type is array(15 downto 0) of std_logic_vector(3 downto 0);
	signal RAM: ram_type;
begin

	process(CLK)
		begin
			if rising_edge(CLK) then
				if WE = '1' then
					RAM(to_integer(unsigned(Address))) <= DataIn;
					DataOut <= DataIn;
				else
					DataOut <= RAM(to_integer(unsigned(Address)));
				end if;
			end if;
	end process;

end Behavioral;

