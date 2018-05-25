----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:32:51 11/15/2017 
-- Design Name: 
-- Module Name:    BlinkLED - Behavioral 
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

entity BlinkLED is
    Port ( CLK : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           LED : out  STD_LOGIC);
end BlinkLED;

architecture Structural of BlinkLED is

COMPONENT CLK_1Hz
	PORT(
		CLK : IN std_logic;
		Reset : IN std_logic;          
		Out_1Hz : OUT std_logic
		);
END COMPONENT;
	
COMPONENT Toggle
	PORT(
		ENABLE : IN std_logic;
		RESET : IN std_logic;
		CLK : IN std_logic;          
		Q : OUT std_logic
		);
END COMPONENT;

signal signal_pulso : std_logic;

begin

Inst_CLK_1Hz: CLK_1Hz PORT MAP(
	CLK => CLK,
	Reset => Reset,
	Out_1Hz => signal_pulso
);

Inst_Toggle: Toggle PORT MAP(
	ENABLE => signal_pulso,
	RESET => Reset,
	CLK => CLK,
	Q => LED
);

end Structural;

