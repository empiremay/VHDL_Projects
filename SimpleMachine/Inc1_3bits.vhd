----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:09:47 01/21/2018 
-- Design Name: 
-- Module Name:    Inc1_3bits - Behavioral 
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

entity Inc1_3bits is
    Port ( Value : in  STD_LOGIC_VECTOR (2 downto 0);
           Value_Inc : out  STD_LOGIC_VECTOR (2 downto 0));
end Inc1_3bits;

architecture Behavioral of Inc1_3bits is

begin

	Value_Inc <= std_logic_Vector(unsigned(Value)+1);

end Behavioral;

