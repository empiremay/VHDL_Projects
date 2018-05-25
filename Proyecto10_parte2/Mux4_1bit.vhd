----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:31:44 10/20/2017 
-- Design Name: 
-- Module Name:    Mux4_1bit - Behavioral 
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

entity Mux4_1bit is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           D : in  STD_LOGIC;
           Sel : in  STD_LOGIC_VECTOR (1 downto 0);
           Z : out  STD_LOGIC);
end Mux4_1bit;

architecture Behavioral of Mux4_1bit is

begin

	process(Sel,A,B,C,D)
		begin
			if Sel="00" then
				Z <= A;
			end if;
			if Sel="01" then
				Z <= B;
			end if;
			if Sel="10" then
				Z <= C;
			end if;
			if Sel="11" then
				Z <= D;
			end if;
	end process;

end Behavioral;

