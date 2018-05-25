----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:44:42 01/21/2018 
-- Design Name: 
-- Module Name:    Memo_8x8 - Behavioral 
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

entity Memo_8x8 is
    Port ( DataIn : in  STD_LOGIC_VECTOR (7 downto 0);
           WE : in  STD_LOGIC;	--THIS WILL CATCH CW3 SIGNAL
           Address : in  STD_LOGIC_VECTOR (2 downto 0);
           DataOut : out  STD_LOGIC_VECTOR (7 downto 0);
           CLK : in  STD_LOGIC);
end Memo_8x8;

architecture Behavioral of Memo_8x8 is
	type ram_type is array(0 to 7) of std_logic_vector(7 downto 0);
	signal RAM: ram_type:=("00000001", "00000010", "00000011", "00000100", "00000101", "00000110", "00000111", "00001000");	--GUARDAR AQUI LAS INSTRUCCIONES Y EL CONTENIDO DE MEMORIA
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

