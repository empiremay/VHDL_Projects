----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:37:46 11/15/2017 
-- Design Name: 
-- Module Name:    YourTurn - Behavioral 
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

entity YourTurn is
	 generic(ANCHO: natural:=2);
    Port ( CLK : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Push_Inc : in  STD_LOGIC;
           Count : out  STD_LOGIC_VECTOR(ANCHO-1 downto 0));
end YourTurn;

architecture Structural of YourTurn is

COMPONENT Counter_2bits
	generic(pred: natural);
	PORT(
		CLK : IN std_logic;
		Enable : IN std_logic;
		Reset : IN std_logic;          
		Q : OUT std_logic_vector(pred-1 downto 0)
		);
END COMPONENT;

COMPONENT RisingEdge
	PORT(
		CLK : IN std_logic;
		RESET : IN std_logic;
		PUSH : IN std_logic;          
		PULSE : OUT std_logic
		);
END COMPONENT;

signal signal_pulse : std_logic;

begin

Inst_Counter_2bits: Counter_2bits 
GENERIC MAP(pred=>2)
PORT MAP(
	CLK => CLK,
	Enable => signal_pulse,
	Reset => Reset,
	Q => Count
);

Inst_RisingEdge: RisingEdge PORT MAP(
	CLK => CLK,
	RESET => Reset,
	PUSH => Push_Inc,
	PULSE => signal_pulse
);

end Structural;

