----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:04:18 01/22/2018 
-- Design Name: 
-- Module Name:    TOP - Behavioral 
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

entity TOP is
    Port ( RESET : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           CW0 : in  STD_LOGIC;
           CW1 : in  STD_LOGIC;
           CW2 : in  STD_LOGIC;
           CW3 : in  STD_LOGIC;
           CW4 : in  STD_LOGIC;
           SEL_MUX : in  STD_LOGIC_VECTOR (1 downto 0);
           CW7 : in  STD_LOGIC;
           SEL_ALU : in  STD_LOGIC_VECTOR (1 downto 0);
           SalRegA : out  STD_LOGIC_VECTOR (7 downto 0);
           SalRegB : out  STD_LOGIC_VECTOR (7 downto 0);
           SalFZ : out  STD_LOGIC;
			  COP: out STD_LOGIC_VECTOR (1 downto 0);
           DataBus : out  STD_LOGIC_VECTOR (7 downto 0);
           SalRI : out  STD_LOGIC_VECTOR (7 downto 0);
			  AddressRAM: out STD_LOGIC_VECTOR (2 downto 0);
           Anodo : out  STD_LOGIC_VECTOR (3 downto 0);
           Catodo : out  STD_LOGIC_VECTOR (6 downto 0));
end TOP;

architecture Behavioral of TOP is

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

COMPONENT Display7Seg_4ON
	PORT(
		Dato1 : IN std_logic_vector(3 downto 0);
		Dato2 : IN std_logic_vector(3 downto 0);
		Dato3 : IN std_logic_vector(3 downto 0);
		Dato4 : IN std_logic_vector(3 downto 0);
		CLK : IN std_logic;
		Reset : IN std_logic;          
		Anodo : OUT std_logic_vector(3 downto 0);
		Catodo : OUT std_logic_vector(6 downto 0)
		);
END COMPONENT;

signal signal_SalRegA : std_logic_vector(7 downto 0);
signal signal_SalRegB : std_logic_vector(7 downto 0);

begin

Inst_Microarquitectura_MS: Microarquitectura_MS PORT MAP(
	RESET => RESET,
	CLK => CLK,
	CW0 => CW0,
	CW1 => CW1,
	CW2 => CW2,
	CW3 => CW3,
	CW4 => CW4,
	SEL_MUX => SEL_MUX,
	CW7 => CW7,
	SEL_ALU => SEL_ALU,
	SalRegA => signal_SalRegA,
	SalRegB => signal_SalRegB,
	SalFZ => SalFZ,
	COP => COP,
	DataBus => DataBus,
	SalRI => SalRI,
	AddressRAM => AddressRAM
);

Inst_Display7Seg_4ON: Display7Seg_4ON PORT MAP(
	Dato1 => signal_SalRegA(7 downto 4),
	Dato2 => signal_SalRegA(3 downto 0),
	Dato3 => signal_SalRegB(7 downto 4),
	Dato4 => signal_SalRegB(3 downto 0),
	CLK => CLK,
	Reset => RESET,
	Anodo => Anodo,
	Catodo => Catodo
);

SalRegA <= signal_SalRegA;
SalRegB <= signal_SalRegB;

end Behavioral;

