----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:32:30 12/13/2017 
-- Design Name: 
-- Module Name:    TOP02 - Behavioral 
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

entity TOP02 is
    Port ( AddressRAM : in  STD_LOGIC_VECTOR (3 downto 0);
           SelALU : in  STD_LOGIC_VECTOR (1 downto 0);
           CW3 : in  STD_LOGIC;
           CW2 : in  STD_LOGIC;
           CW1 : in  STD_LOGIC;
           CW0 : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
			  Anodo : out STD_LOGIC_VECTOR (3 downto 0);
			  Catodo : out STD_LOGIC_VECTOR (6 downto 0);
           DataBus : out  STD_LOGIC_VECTOR (3 downto 0);
           SalRegA : out  STD_LOGIC_VECTOR (3 downto 0);
           SalRegB : out  STD_LOGIC_VECTOR (3 downto 0);
           SalALU : out  STD_LOGIC_VECTOR (3 downto 0);
           SalFZ : out  STD_LOGIC);
end TOP02;

architecture Structural of TOP02 is

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

signal signal_DataBus : std_logic_vector(3 downto 0);
signal signal_SalALU : std_logic_vector(3 downto 0);
signal signal_SalRegA : std_logic_vector(3 downto 0);
signal signal_SalRegB : std_logic_vector(3 downto 0);

begin

Inst_RAM_DataPath_01: RAM_DataPath_01 PORT MAP(
	AddressRam => AddressRAM,
	SelALU => SelALU,
	RESET => RESET,
	CLK => CLK,
	CW0 => CW0,
	CW1 => CW1,
	CW2 => CW2,
	CW3 => CW3,
	DataBus => signal_DataBus,
	SalALU => signal_SalALU,
	SalRegA => signal_SalRegA,
	SalRegB => signal_SalRegB,
	SalFZ => SalFZ
);

Inst_Display7Seg_4ON: Display7Seg_4ON PORT MAP(
	Dato1 => signal_SalALU,
	Dato2 => signal_SalRegB,
	Dato3 => signal_SalRegA,
	Dato4 => signal_DataBus,
	CLK => CLK,
	Reset => RESET,
	Anodo => Anodo,
	Catodo => Catodo
);

DataBus<=signal_DataBus;
SalRegA<=signal_SalRegA;
SalRegB<=signal_SalRegB;
SalALU<=signal_SalALU;

end Structural;

