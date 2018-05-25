----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:32:31 12/05/2017 
-- Design Name: 
-- Module Name:    RAM_DataPath_01 - Structural 
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

entity RAM_DataPath_01 is
    Port ( AddressRam : in  STD_LOGIC_VECTOR (3 downto 0);
           SelALU : in  STD_LOGIC_VECTOR (1 downto 0);
           RESET : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           CW0 : in  STD_LOGIC;
           CW1 : in  STD_LOGIC;
           CW2 : in  STD_LOGIC;
           CW3 : in  STD_LOGIC;
           DataBus : out  STD_LOGIC_VECTOR (3 downto 0);
           SalALU : out  STD_LOGIC_VECTOR (3 downto 0);
           SalRegA : out  STD_LOGIC_VECTOR (3 downto 0);
           SalRegB : out  STD_LOGIC_VECTOR (3 downto 0);
           SalFZ : out  STD_LOGIC);
end RAM_DataPath_01;

architecture Structural of RAM_DataPath_01 is

COMPONENT DataPath_01
	PORT(
		DataBus : IN std_logic_vector(3 downto 0);
		SEL_ALU : IN std_logic_vector(1 downto 0);
		CLK : IN std_logic;
		CW0 : IN std_logic;
		CW1 : IN std_logic;
		CW2 : IN std_logic;
		RESET : IN std_logic;          
		SalALU : OUT std_logic_vector(3 downto 0);
		SalREGA : OUT std_logic_vector(3 downto 0);
		SalREGB : OUT std_logic_vector(3 downto 0);
		SalFZ : OUT std_logic
		);
END COMPONENT;

COMPONENT RAM_16x4
	PORT(
		DataIn : IN std_logic_vector(3 downto 0);
		WE : IN std_logic;
		Address : IN std_logic_vector(3 downto 0);
		CLK : IN std_logic;          
		DataOut : OUT std_logic_vector(3 downto 0)
		);
END COMPONENT;

signal signal_DataBus : std_logic_vector(3 downto 0);
signal signal_SalALU : std_logic_vector(3 downto 0);

begin

Inst_DataPath_01: DataPath_01 PORT MAP(
	DataBus => signal_DataBus,
	SEL_ALU => SelALU,
	CLK => CLK,
	CW0 => CW0,
	CW1 => CW1,
	CW2 => CW2,
	RESET => RESET,
	SalALU => signal_SalALU,
	SalREGA => SalRegA,
	SalREGB => SalRegB,
	SalFZ => SalFZ
);

Inst_RAM_16x4: RAM_16x4 PORT MAP(
	DataIn => signal_SalALU,
	WE => CW3,
	Address => AddressRam,
	DataOut => signal_DataBus,
	CLK => CLK
);

SalALU <= signal_SalALU;
DataBus <= signal_DataBus;

end Structural;

