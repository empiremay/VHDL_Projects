----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:41:26 01/21/2018 
-- Design Name: 
-- Module Name:    Microarquitectura_MS - Behavioral 
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

entity Microarquitectura_MS is
    Port ( RESET : in  STD_LOGIC;
			  CLK: in STD_LOGIC;
           CW0 : in  STD_LOGIC;
           CW1 : in  STD_LOGIC;
           CW2 : in  STD_LOGIC;
           CW3 : in  STD_LOGIC;
           CW4 : in  STD_LOGIC;
           SEL_MUX: in STD_LOGIC_VECTOR (1 downto 0);
           CW7 : in  STD_LOGIC;
           SEL_ALU: in STD_LOGIC_VECTOR (1 downto 0);
           SalRegA : out  STD_LOGIC_VECTOR (7 downto 0);
           SalRegB : out  STD_LOGIC_VECTOR (7 downto 0);
           SalFZ : out  STD_LOGIC;
			  COP: out STD_LOGIC_VECTOR (1 downto 0);
           DataBus : out  STD_LOGIC_VECTOR (7 downto 0);
           SalRI : out  STD_LOGIC_VECTOR (7 downto 0);
			  AddressRAM: out STD_LOGIC_VECTOR (2 downto 0));
end Microarquitectura_MS;

architecture Structural of Microarquitectura_MS is

COMPONENT Memo_Datapath
	PORT(
		AddressRAM : IN std_logic_vector(2 downto 0);
		SEL_ALU : IN std_logic_vector(1 downto 0);
		RESET : IN std_logic;
		CLK : IN std_logic;
		CW0 : IN std_logic;
		CW1 : IN std_logic;
		CW2 : IN std_logic;
		CW3 : IN std_logic;          
		DataBus : OUT std_logic_vector(7 downto 0);
		SalALU : OUT std_logic_vector(7 downto 0);
		SalRegA : OUT std_logic_vector(7 downto 0);
		SalRegB : OUT std_logic_vector(7 downto 0);
		SalFZ : OUT std_logic
		);
END COMPONENT;

COMPONENT Reg_Inst
	PORT(
		D : IN std_logic_vector(7 downto 0);
		CLK : IN std_logic;
		ENABLE : IN std_logic;
		RESET : IN std_logic;          
		Q : OUT std_logic_vector(7 downto 0)
		);
END COMPONENT;

COMPONENT Mux4_4bits
	PORT(
		A : IN std_logic_vector(2 downto 0);
		B : IN std_logic_vector(2 downto 0);
		C : IN std_logic_vector(2 downto 0);
		D : IN std_logic_vector(2 downto 0);
		Sel : IN std_logic_vector(1 downto 0);          
		Z : OUT std_logic_vector(2 downto 0)
		);
END COMPONENT;

COMPONENT Reg_PC
	PORT(
		D : IN std_logic_vector(2 downto 0);
		CLK : IN std_logic;
		ENABLE : IN std_logic;
		RESET : IN std_logic;          
		Q : OUT std_logic_vector(2 downto 0)
		);
END COMPONENT;

COMPONENT Inc1_3bits
	PORT(
		Value : IN std_logic_vector(2 downto 0);          
		Value_Inc : OUT std_logic_vector(2 downto 0)
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

signal signal_DataBus : std_logic_vector(7 downto 0);
signal signal_AddressRAM : std_logic_vector(2 downto 0);
signal signal_RegInst : std_logic_vector(7 downto 0);
signal signal_RegPC: std_logic_vector(2 downto 0);
signal signal_Inc: std_logic_vector(2 downto 0);
signal signal_CW7: std_logic;

begin

Inst_Memo_Datapath: Memo_Datapath PORT MAP(
	AddressRAM => signal_AddressRAM,
	SEL_ALU => SEL_ALU,
	RESET => RESET,
	CLK => CLK,
	CW0 => CW0,
	CW1 => CW1,
	CW2 => CW2,
	CW3 => CW3,
	DataBus => signal_DataBus,
	SalALU => open,
	SalRegA => SalRegA,
	SalRegB => SalRegB,
	SalFZ => SalFZ
);

Inst_Reg_Inst: Reg_Inst PORT MAP(
	D => signal_DataBus,
	CLK => CLK,
	Q => signal_RegInst,
	ENABLE => CW4,
	RESET => RESET
);

Inst_Mux4_4bits: Mux4_4bits PORT MAP(
	A => signal_RegPC,
	B => "000",
	C => signal_RegInst(5 downto 3),
	D => signal_RegInst(2 downto 0),
	Sel => SEL_MUX,
	Z => signal_AddressRAM
);

Inst_Reg_PC: Reg_PC PORT MAP(
	D => signal_Inc,
	CLK => CLK,
	Q => signal_RegPC,
	ENABLE => signal_CW7,
	RESET => RESET
);

Inst_Inc1_3bits: Inc1_3bits PORT MAP(
	Value => signal_AddressRAM,
	Value_Inc => signal_Inc
);

Inst_RisingEdge: RisingEdge PORT MAP(
	Reset => RESET,
	Push => CW7,
	Clk => CLK,
	Pulse => signal_CW7
);

DataBus <= signal_DataBus;
SalRI <= signal_DataBus;
AddressRAM <= signal_AddressRAM;
COP <= signal_RegInst(7 downto 6);

end Structural;

