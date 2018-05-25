----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:01:46 01/10/2018 
-- Design Name: 
-- Module Name:    Debounce - Structural 
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

entity Debounce is
    Port ( Push : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           FilteredPush : out  STD_LOGIC);
end Debounce;

architecture Structural of Debounce is

COMPONENT DebounceFSM
	PORT(
		CLK : IN std_logic;
		Flag_Timer : IN std_logic;
		Push : IN std_logic;
		RESET : IN std_logic;          
		EnableTimer : OUT std_logic;
		FilteredPush : OUT std_logic
		);
END COMPONENT;

COMPONENT Timer300ms
	PORT(
		Enable : IN std_logic;
		CLK : IN std_logic;
		RESET : IN std_logic;          
		End300ms : OUT std_logic
		);
END COMPONENT;

signal signal_End300ms : std_logic;
signal signal_EnableTimer : std_logic;

begin

Inst_DebounceFSM: DebounceFSM PORT MAP(
	CLK => CLK,
	Flag_Timer => signal_End300ms,
	Push => Push,
	RESET => RESET,
	EnableTimer => signal_EnableTimer,
	FilteredPush => FilteredPush
);

Inst_Timer300ms: Timer300ms PORT MAP(
	Enable => signal_EnableTimer,
	CLK => CLK,
	RESET => RESET,
	End300ms => signal_End300ms
);

end Structural;

