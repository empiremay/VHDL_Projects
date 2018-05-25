----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:23:40 01/21/2018 
-- Design Name: 
-- Module Name:    Memo_Datapath - Behavioral 
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

entity Memo_Datapath is
    Port ( AddressRAM : in  STD_LOGIC_VECTOR (2 downto 0);
           SEL_ALU : in  STD_LOGIC_VECTOR (1 downto 0);
           RESET : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           CW0 : in  STD_LOGIC;
           CW1 : in  STD_LOGIC;
           CW2 : in  STD_LOGIC;
           CW3 : in  STD_LOGIC;
           DataBus : out  STD_LOGIC_VECTOR (7 downto 0);
           SalALU : out  STD_LOGIC_VECTOR (7 downto 0);
           SalRegA : out  STD_LOGIC_VECTOR (7 downto 0);
           SalRegB : out  STD_LOGIC_VECTOR (7 downto 0);
           SalFZ : out  STD_LOGIC);
end Memo_Datapath;

architecture Structural of Memo_Datapath is

COMPONENT Memo_8x8
	PORT(
		DataIn : IN std_logic_vector(7 downto 0);
		WE : IN std_logic;
		Address : IN std_logic_vector(2 downto 0);
		CLK : IN std_logic;          
		DataOut : OUT std_logic_vector(7 downto 0)
		);
END COMPONENT;

COMPONENT Datapath
	PORT(
		DataBus : IN std_logic_vector(7 downto 0);
		SEL_ALU : IN std_logic_vector(1 downto 0);
		CLK : IN std_logic;
		CW0 : IN std_logic;
		CW1 : IN std_logic;
		CW2 : IN std_logic;
		RESET : IN std_logic;          
		SalALU : OUT std_logic_vector(7 downto 0);
		SalREGA : OUT std_logic_vector(7 downto 0);
		SalREGB : OUT std_logic_vector(7 downto 0);
		SalFZ : OUT std_logic
		);
END COMPONENT;

signal signal_DataBus : std_logic_vector(7 downto 0);
signal signal_SalALU : std_logic_vector(7 downto 0);

begin

Inst_Memo_8x8: Memo_8x8 PORT MAP(
	DataIn => signal_SalALU,
	WE => CW3,
	Address => AddressRAM,
	DataOut => signal_DataBus,
	CLK => CLK
);

Inst_Datapath: Datapath PORT MAP(
	DataBus => signal_DataBus,
	SEL_ALU => SEL_ALU,
	CLK => CLK,
	CW0 => CW0,
	CW1 => CW1,
	CW2 => CW2,
	RESET => RESET,
	SalALU => signal_SalALU,
	SalREGA => SalREGA,
	SalREGB => SalREGB,
	SalFZ => SalFZ
);

SalALU <= signal_SalALU;
DataBus <= signal_DataBus;

end Structural;

