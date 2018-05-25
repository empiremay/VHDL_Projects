----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:51:52 01/24/2018 
-- Design Name: 
-- Module Name:    SimpleMachine - Behavioral 
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

entity SimpleMachine is
    Port ( Push : in  STD_LOGIC;
           AddressRAM : out  STD_LOGIC_VECTOR (2 downto 0);
           SalRegA : out  STD_LOGIC_VECTOR (7 downto 0);
           SalRegB : out  STD_LOGIC_VECTOR (7 downto 0);
           FZ : out  STD_LOGIC;
           CLK : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           SalRI : out  STD_LOGIC_VECTOR (7 downto 0));
end SimpleMachine;

architecture Behavioral of SimpleMachine is

COMPONENT Microarquitectura_MS
	PORT(
		RESET : IN std_logic;
		CLK : IN std_logic;
		CW0 : IN std_logic;
		CW1 : IN std_logic;
		CW2 : IN std_logic;
		CW3 : IN std_logic;
		CW4 : IN std_logic;
		SEL_MUX : IN std_logic_vector(1 downto 0);
		CW7 : IN std_logic;
		SEL_ALU : IN std_logic_vector(1 downto 0);          
		SalRegA : OUT std_logic_vector(7 downto 0);
		SalRegB : OUT std_logic_vector(7 downto 0);
		SalFZ : OUT std_logic;
		COP : OUT std_logic_vector(1 downto 0);
		DataBus : OUT std_logic_vector(7 downto 0);
		SalRI : OUT std_logic_vector(7 downto 0);
		AddressRAM : OUT std_logic_vector(2 downto 0)
		);
END COMPONENT;

COMPONENT ControlUnit_MS
	PORT(
		COP : IN std_logic_vector(1 downto 0);
		Push : IN std_logic;
		FZ : IN std_logic;
		CLK : IN std_logic;
		RESET : IN std_logic;          
		CW : OUT std_logic_vector(9 downto 0)
		);
END COMPONENT;

COMPONENT RisingEdge
	PORT(
		Reset : IN std_logic;
		Push : IN std_logic;
		Clk : IN std_logic;          
		Pulse : OUT std_logic
		);
END COMPONENT;

signal signal_ControlWord : std_logic_vector(9 downto 0);
signal signal_COP : std_logic_vector(1 downto 0);
signal signal_SalFZ: std_logic;
signal signal_Push: std_logic;
signal signal_CW0: std_logic;
signal signal_CW1: std_logic;
signal signal_CW2: std_logic;
signal signal_CW3: std_logic;
signal signal_CW4: std_logic;
signal signal_CW7: std_logic;

begin

signal_CW0 <= signal_ControlWord(0) and signal_Push;
signal_CW1 <= signal_ControlWord(1) and signal_Push;
signal_CW2 <= signal_ControlWord(2) and signal_Push;
signal_CW3 <= signal_ControlWord(3) and signal_Push;
signal_CW4 <= signal_ControlWord(4) and signal_Push;
signal_CW7 <= signal_ControlWord(7) and signal_Push;

Inst_Microarquitectura_MS: Microarquitectura_MS PORT MAP(
	RESET => RESET,
	CLK => CLK,
	CW0 => signal_CW0,
	CW1 => signal_CW1,
	CW2 => signal_CW2,
	CW3 => signal_CW3,
	CW4 => signal_CW4,
	SEL_MUX => signal_ControlWord(6 downto 5),
	CW7 => signal_CW7,
	SEL_ALU => signal_ControlWord(9 downto 8),
	SalRegA => SalRegA,
	SalRegB => SalRegB,
	SalFZ => signal_SalFZ,
	COP => signal_COP,
	DataBus => open,
	SalRI => SalRI,
	AddressRAM => AddressRAM
);

Inst_ControlUnit_MS: ControlUnit_MS PORT MAP(
	COP => signal_COP,
	Push => signal_Push,
	FZ => signal_SalFZ,
	CLK => CLK,
	RESET => RESET,
	CW => signal_ControlWord
);

Inst_RisingEdge: RisingEdge PORT MAP(
	Reset => RESET,
	Push => Push,
	Clk => CLK,
	Pulse => signal_Push
);

FZ <= signal_SalFZ;

end Behavioral;

