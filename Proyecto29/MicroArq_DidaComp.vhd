----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:13:34 12/20/2017 
-- Design Name: 
-- Module Name:    MicroArq_DidaComp - Behavioral 
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

entity MicroArq_DidaComp is
    Port ( CLK : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           CW0 : in  STD_LOGIC;
           CW1 : in  STD_LOGIC;
           CW2 : in  STD_LOGIC;
           CW3 : in  STD_LOGIC;
           CW4 : in  STD_LOGIC;
           CW5 : in  STD_LOGIC;
           CW6 : in  STD_LOGIC;
           CW7 : in  STD_LOGIC;
           Sel_ALU : in  STD_LOGIC_VECTOR (1 downto 0);
           Instruccion : out  STD_LOGIC_VECTOR (7 downto 0);
           AddressRAM : out  STD_LOGIC_VECTOR (3 downto 0);
			  AddressROM : out  STD_LOGIC_VECTOR (2 downto 0);
           SalRegA : out  STD_LOGIC_VECTOR (3 downto 0);
           SalRegB : out  STD_LOGIC_VECTOR (3 downto 0);
           COP : out  STD_LOGIC_VECTOR (1 downto 0);
           SalFZ : out  STD_LOGIC);
end MicroArq_DidaComp;

architecture Structural of MicroArq_DidaComp is
	COMPONENT ROM_RAM_DataPath_01
	PORT(
		AddressROM : IN std_logic_vector(2 downto 0);
		CW0 : IN std_logic;
		CW1 : IN std_logic;
		CW2 : IN std_logic;
		CW3 : IN std_logic;
		CW4 : IN std_logic;
		CW5 : IN std_logic;
		Reset : IN std_logic;
		CLK : IN std_logic;
		SEL_ALU : IN std_logic_vector(1 downto 0);          
		Instruccion : OUT std_logic_vector(7 downto 0);
		AddressRAM : OUT std_logic_vector(3 downto 0);
		DataBus : OUT std_logic_vector(3 downto 0);
		SalRegA : OUT std_logic_vector(3 downto 0);
		SalRegB : OUT std_logic_vector(3 downto 0);
		SalCOP : OUT std_logic_vector(1 downto 0);
		SalFZ : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT Reg_nbits
	GENERIC (width : integer);
	PORT(
		Reset : IN std_logic;
		Datain : IN std_logic_vector(width-1 downto 0);
		CLK : IN std_logic;
		Enable : IN std_logic;          
		DataOut : OUT std_logic_vector(width-1 downto 0)
		);
	END COMPONENT;
	
	signal Signal_PC_ROM : std_logic_vector(2 downto 0);
	signal Signal_MUX_PC : std_logic_vector(2 downto 0);
	signal Signal_AddressJump : std_logic_vector(2 downto 0);
	signal Signal_PCInc : std_logic_vector(2 downto 0);
	signal Signal_Instruction : std_logic_vector(7 downto 0);
begin
	Inst_ROM_RAM_DataPath_01: ROM_RAM_DataPath_01 PORT MAP(
		AddressROM => Signal_PC_ROM,
		CW0 => CW0,
		CW1 => CW1,
		CW2 => CW2,
		CW3 => CW3,
		CW4 => CW4,
		CW5 => CW5,
		Reset => Reset,
		CLK => CLK,
		SEL_ALU => Sel_ALU,
		Instruccion => Signal_Instruction,
		AddressRAM => AddressRAM,
		DataBus => open,
		SalRegA => SalRegA,
		SalRegB => SalRegB,
		SalCOP => COP,
		SalFZ => SalFZ
	);
	
	PC: Reg_nbits
	GENERIC MAP(
		width => 3
	)
	PORT MAP(
		Reset => Reset,
		Datain => Signal_MUX_PC,
		CLK => CLK,
		Enable => CW7,
		DataOut => Signal_PC_ROM
	);
	
	Signal_PCInc <= std_logic_vector(unsigned(Signal_PC_ROM)+1);
	
	AddressROM <= Signal_PC_ROM;
	Signal_AddressJump <= Signal_Instruction(2 downto 0);
	Instruccion <= Signal_Instruction;
	with CW6 select Signal_MUX_PC <= 
			Signal_AddressJump when '1',
			Signal_PCInc when others;

end Structural;

