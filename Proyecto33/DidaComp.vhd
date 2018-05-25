----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:15:25 01/17/2018 
-- Design Name: 
-- Module Name:    DidaComp - Behavioral 
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

entity DidaComp is
    Port ( Push : in  STD_LOGIC;
           AddressRAM : out  STD_LOGIC_VECTOR (3 downto 0);
           AddressROM : out  STD_LOGIC_VECTOR (2 downto 0);
           SalRegA : out  STD_LOGIC_VECTOR (3 downto 0);
           SalRegB : out  STD_LOGIC_VECTOR (3 downto 0);
           COP : out  STD_LOGIC_VECTOR (1 downto 0);
           Instruction : out  STD_LOGIC_VECTOR (7 downto 0);
           FZ : out  STD_LOGIC;
           CLK : in  STD_LOGIC;
           RESET : in  STD_LOGIC);
end DidaComp;

architecture Structural of DidaComp is

COMPONENT ControlUnit_DidaComp
	PORT(
		COP : IN std_logic_vector(1 downto 0);
		Push : IN std_logic;
		FZ : IN std_logic;
		CLK : IN std_logic;
		RESET : IN std_logic;          
		CW : OUT std_logic_vector(9 downto 0)
		);
END COMPONENT;

COMPONENT MircoArq_DidaComp
	PORT(
		CW0 : IN std_logic;
		CW1 : IN std_logic;
		CW2 : IN std_logic;
		CW3 : IN std_logic;
		CW4 : IN std_logic;
		CW5 : IN std_logic;
		CW6 : IN std_logic;
		CW7 : IN std_logic;
		SelALU : IN std_logic_vector(1 downto 0);
		RESET : IN std_logic;
		CLK : IN std_logic;          
		Instruction : OUT std_logic_vector(7 downto 0);
		AddressRAM : OUT std_logic_vector(3 downto 0);
		AddressROM : OUT std_logic_vector(2 downto 0);
		SalRegA : OUT std_logic_vector(3 downto 0);
		SalRegB : OUT std_logic_vector(3 downto 0);
		COP : OUT std_logic_vector(1 downto 0);
		SalFZ : OUT std_logic
		);
END COMPONENT;

signal signal_SalCOP : std_logic_vector(1 downto 0);
signal signal_SalFZ: std_logic;
signal signal_ControlWord : std_logic_vector(9 downto 0);

begin

Inst_ControlUnit_DidaComp: ControlUnit_DidaComp PORT MAP(
	COP => signal_SalCOP,
	Push => Push,
	FZ => signal_SalFZ,
	CLK => CLK,
	RESET => RESET,
	CW => signal_ControlWord
);

Inst_MircoArq_DidaComp: MircoArq_DidaComp PORT MAP(
	CW0 => signal_ControlWord(0),
	CW1 => signal_ControlWord(1),
	CW2 => signal_ControlWord(2),
	CW3 => signal_ControlWord(3),
	CW4 => signal_ControlWord(4),
	CW5 => signal_ControlWord(5),
	CW6 => signal_ControlWord(6),
	CW7 => signal_ControlWord(7),
	SelALU => signal_ControlWord(9 downto 8),
	RESET => RESET,
	CLK => CLK,
	Instruction => Instruction,
	AddressRAM => AddressRAM,
	AddressROM => AddressROM,
	SalRegA => SalRegA,
	SalRegB => SalRegB,
	COP => signal_SalCOP,
	SalFZ => signal_SalFZ
);

COP <= signal_SalCOP;
FZ <= signal_SalFZ;

end Structural;

