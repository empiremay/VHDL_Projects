----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:24:32 11/22/2017 
-- Design Name: 
-- Module Name:    Top01 - Behavioral 
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

entity Top01 is
    Port ( DataBus : in  STD_LOGIC_VECTOR (3 downto 0);
           SEL_ALU : in  STD_LOGIC_VECTOR (1 downto 0);
			  CW0 : in  STD_LOGIC;
			  CW1 : in  STD_LOGIC;
           CW2 : in  STD_LOGIC;
			  CLK : in  STD_LOGIC;
			  RESET : in  STD_LOGIC;
           LED : out  STD_LOGIC;
			  Anodo : out STD_LOGIC_VECTOR(3 downto 0);
		     Catodo : out STD_LOGIC_VECTOR(6 downto 0));
end Top01;

architecture Structural of Top01 is

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

signal signal_REGA : std_logic_vector(3 downto 0);
signal signal_REGB : std_logic_vector(3 downto 0);
signal signal_SalALU : std_logic_vector(3 downto 0);

begin

Inst_DataPath_01: DataPath_01 PORT MAP(
	DataBus => DataBus,
	SEL_ALU => SEL_ALU,
	CLK => CLK,
	CW0 => CW0,
	CW1 => CW1,
	CW2 => CW2,
	RESET => RESET,
	SalALU => signal_SalALU,
	SalREGA => signal_REGA,
	SalREGB => signal_REGB,
	SalFZ => LED
);

Inst_Display7Seg_4ON: Display7Seg_4ON PORT MAP(
	Dato1 => signal_REGA,
	Dato2 => signal_REGB,
	Dato3 => signal_SalALU,
	Dato4 => "0000",
	CLK => CLK,
	Reset => RESET,
	Anodo => Anodo,
	Catodo => Catodo
);

end Structural;

