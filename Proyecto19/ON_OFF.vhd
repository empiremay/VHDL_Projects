----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:14:54 11/08/2017 
-- Design Name: 
-- Module Name:    ON_OFF - Behavioral 
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

entity ON_OFF is
    Port ( Buttom : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Toggle_Out : out  STD_LOGIC);
end ON_OFF;

architecture Structural of ON_OFF is

COMPONENT RisingEdge
	PORT(
		CLK : IN std_logic;
		RESET : IN std_logic;
		PUSH : IN std_logic;          
		PULSE : OUT std_logic
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
	
signal sig_pulse : std_logic;

begin

Inst_RisingEdge: RisingEdge PORT MAP(
		CLK => CLK,
		RESET => Reset,
		PUSH => Buttom,
		PULSE => sig_pulse
	);
	
Inst_Toggle: Toggle PORT MAP(
		ENABLE => sig_pulse,
		RESET => Reset,
		CLK => CLK,
		Q => Toggle_Out
	);

end Structural;

