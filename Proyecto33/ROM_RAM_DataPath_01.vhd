----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:47:01 12/20/2017 
-- Design Name: 
-- Module Name:    ROM_RAM_DataPath_01 - Behavioral 
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

entity ROM_RAM_DataPath_01 is
	 Generic (ANCHO: integer:=10);
    Port ( AddressROM : in  STD_LOGIC_VECTOR (2 downto 0);
           CW0 : in  STD_LOGIC;
           CW1 : in  STD_LOGIC;
           CW2 : in  STD_LOGIC;
           CW3 : in  STD_LOGIC;
           CW4 : in  STD_LOGIC;
           CW5 : in  STD_LOGIC;
			  CLK: in STD_LOGIC;
			  RESET: in STD_LOGIC;
           SEL_ALU : in  STD_LOGIC_VECTOR (1 downto 0);
           Instruction : out  STD_LOGIC_VECTOR (7 downto 0);
           AddressRAM : out  STD_LOGIC_VECTOR (3 downto 0);
           SalCOP : out  STD_LOGIC_VECTOR (1 downto 0);
           SalRegA : out  STD_LOGIC_VECTOR (3 downto 0);
           SalRegB : out  STD_LOGIC_VECTOR (3 downto 0);
           SalFZ : out  STD_LOGIC;
           DataBus : out  STD_LOGIC_VECTOR (3 downto 0));
end ROM_RAM_DataPath_01;

architecture Behavioral of ROM_RAM_DataPath_01 is

COMPONENT Reg_4bits is
	 Generic ( ANCHO : integer);
    Port ( D : in  STD_LOGIC_VECTOR (ANCHO-1 downto 0);
           CLK : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (ANCHO-1 downto 0);
           ENABLE : in  STD_LOGIC;
           RESET : in  STD_LOGIC);
END COMPONENT;

COMPONENT ROM_8x10
	PORT(
		Enable : IN std_logic;
		Address : IN std_logic_vector(2 downto 0);
		CLK : IN std_logic;          
		DataOut : OUT std_logic_vector(9 downto 0)
		);
END COMPONENT;

COMPONENT Mux2_4bits
	PORT(
		A : IN std_logic_vector(3 downto 0);
		B : IN std_logic_vector(3 downto 0);
		Sel : IN std_logic;          
		Z : OUT std_logic_vector(3 downto 0)
		);
END COMPONENT;

COMPONENT RAM_DataPath_01
	PORT(
		AddressRam : IN std_logic_vector(3 downto 0);
		SelALU : IN std_logic_vector(1 downto 0);
		RESET : IN std_logic;
		CLK : IN std_logic;
		CW0 : IN std_logic;
		CW1 : IN std_logic;
		CW2 : IN std_logic;
		CW3 : IN std_logic;          
		DataBus : OUT std_logic_vector(3 downto 0);
		SalALU : OUT std_logic_vector(3 downto 0);
		SalRegA : OUT std_logic_vector(3 downto 0);
		SalRegB : OUT std_logic_vector(3 downto 0);
		SalFZ : OUT std_logic
		);
END COMPONENT;

signal ROM_RegInst : std_logic_vector(9 downto 0);
signal RegInst_MUX : std_logic_vector(9 downto 0);
signal MUX_RAM : std_logic_vector(3 downto 0);

begin

Inst_Reg_4bits: Reg_4bits GENERIC MAP (ANCHO)
PORT MAP (
    D => ROM_RegInst,
	 CLK => CLK,
    Q => RegInst_MUX,
    ENABLE => CW4,
	 RESET => RESET
);

Inst_ROM_8x10: ROM_8x10 PORT MAP(
	Enable => '1',
	Address => AddressROM,
	DataOut => ROM_RegInst,
	CLK => CLK
);

Inst_Mux2_4bits: Mux2_4bits PORT MAP(
	A => RegInst_MUX(3 downto 0),
	B => RegInst_MUX(7 downto 4),
	Sel => CW5,
	Z => MUX_RAM
);

Inst_RAM_DataPath_01: RAM_DataPath_01 PORT MAP(
	AddressRam => MUX_RAM,
	SelALU => SEL_ALU,
	RESET => RESET,
	CLK => CLK,
	CW0 => CW0,
	CW1 => CW1,
	CW2 => CW2,
	CW3 => CW3,
	DataBus => DataBus,
	SalALU => open,
	SalRegA => SalRegA,
	SalRegB => SalRegB,
	SalFZ => SalFZ
);

SalCOP <= RegInst_MUX(9 downto 8);
Instruction <= RegInst_MUX(7 downto 0);
AddressRAM <= MUX_RAM;

end Behavioral;

