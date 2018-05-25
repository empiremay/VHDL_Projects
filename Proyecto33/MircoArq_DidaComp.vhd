----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:42:34 12/29/2017 
-- Design Name: 
-- Module Name:    MircoArq_DidaComp - Behavioral 
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

entity MircoArq_DidaComp is
    Port ( CW0 : in  STD_LOGIC;
           CW1 : in  STD_LOGIC;
           CW2 : in  STD_LOGIC;
           CW3 : in  STD_LOGIC;
           CW4 : in  STD_LOGIC;
           CW5 : in  STD_LOGIC;
           CW6 : in  STD_LOGIC;
           CW7 : in  STD_LOGIC;
           SelALU : in  STD_LOGIC_VECTOR (1 downto 0);
           RESET : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Instruction : out  STD_LOGIC_VECTOR (7 downto 0);
           AddressRAM : out  STD_LOGIC_VECTOR (3 downto 0);
           AddressROM : out  STD_LOGIC_VECTOR (2 downto 0);
           SalRegA : out  STD_LOGIC_VECTOR (3 downto 0);
           SalRegB : out  STD_LOGIC_VECTOR (3 downto 0);
           COP : out  STD_LOGIC_VECTOR (1 downto 0);
           SalFZ : out  STD_LOGIC);
end MircoArq_DidaComp;

architecture Structural of MircoArq_DidaComp is

COMPONENT ROM_RAM_DataPath_01
	PORT(
		AddressROM : IN std_logic_vector(2 downto 0);
		CW0 : IN std_logic;
		CW1 : IN std_logic;
		CW2 : IN std_logic;
		CW3 : IN std_logic;
		CW4 : IN std_logic;
		CW5 : IN std_logic;
		CLK : IN std_logic;
		RESET : IN std_logic;
		SEL_ALU : IN std_logic_vector(1 downto 0);          
		Instruction : OUT std_logic_vector(7 downto 0);
		AddressRAM : OUT std_logic_vector(3 downto 0);
		SalCOP : OUT std_logic_vector(1 downto 0);
		SalRegA : OUT std_logic_vector(3 downto 0);
		SalRegB : OUT std_logic_vector(3 downto 0);
		SalFZ : OUT std_logic;
		DataBus : OUT std_logic_vector(3 downto 0)
		);
END COMPONENT;

COMPONENT Reg_4bits GENERIC (ANCHO:integer);
	PORT(
		D : IN std_logic_vector(ANCHO-1 downto 0);
		CLK : IN std_logic;
		ENABLE : IN std_logic;
		RESET : IN std_logic;          
		Q : OUT std_logic_vector(ANCHO-1 downto 0)
		);
END COMPONENT;

COMPONENT Mux2_3bits
	PORT(
		A : IN std_logic_vector(2 downto 0);
		B : IN std_logic_vector(2 downto 0);
		Sel : IN std_logic;          
		Z : OUT std_logic_vector(2 downto 0)
		);
END COMPONENT;

signal signal_PC_ROM : std_logic_vector(2 downto 0);
signal signal_MUX_PC : std_logic_vector(2 downto 0);
signal signal_AddressJump : std_logic_vector(2 downto 0);
signal signal_PCInc : std_logic_vector(2 downto 0);
signal signal_Instruction : std_logic_vector(7 downto 0);

begin

Inst_ROM_RAM_DataPath_01: ROM_RAM_DataPath_01 PORT MAP(
	AddressROM => signal_PC_ROM,
	CW0 => CW0,
	CW1 => CW1,
	CW2 => CW2,
	CW3 => CW3,
	CW4 => CW4,
	CW5 => CW5,
	CLK => CLK,
	RESET => RESET,
	SEL_ALU => SelALU,
	Instruction => signal_Instruction,
	AddressRAM => AddressRAM,
	SalCOP => COP,
	SalRegA => SalRegA,
	SalRegB => SalRegB,
	SalFZ => SalFZ,
	DataBus => open
);

Inst_Reg_4bits: Reg_4bits GENERIC MAP(ANCHO => 3) PORT MAP(
	D => signal_MUX_PC,
	CLK => CLK,
	Q => signal_PC_ROM,
	ENABLE => CW7,
	RESET => RESET
);

Inst_Mux2_3bits: Mux2_3bits PORT MAP(
	A => signal_AddressJump,
	B => signal_PCInc,
	Sel => CW6,
	Z => signal_MUX_PC
);

AddressROM <= signal_PC_ROM;
Instruction <= signal_Instruction;
signal_AddressJump <= signal_Instruction(2 downto 0);
signal_PCInc <= std_logic_vector(unsigned(signal_PC_ROM)+1);

end Structural;

