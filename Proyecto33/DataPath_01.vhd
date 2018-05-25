----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:57:37 11/22/2017 
-- Design Name: 
-- Module Name:    DataPath_01 - Behavioral 
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

entity DataPath_01 is
    Port ( DataBus : in  STD_LOGIC_VECTOR (3 downto 0);
           SEL_ALU : in  STD_LOGIC_VECTOR (1 downto 0);
           CLK : in  STD_LOGIC;
           CW0 : in  STD_LOGIC;
			  CW1 : in  STD_LOGIC;
           CW2 : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           SalALU : out  STD_LOGIC_VECTOR (3 downto 0);
           SalREGA : out  STD_LOGIC_VECTOR (3 downto 0);
           SalREGB : out  STD_LOGIC_VECTOR (3 downto 0);
           SalFZ : out  STD_LOGIC);
end DataPath_01;

architecture Structural of DataPath_01 is

COMPONENT Reg_4bits
	PORT(
		D : IN std_logic_vector(3 downto 0);
		CLK : IN std_logic;
		ENABLE : IN std_logic;
		RESET : IN std_logic;          
		Q : OUT std_logic_vector(3 downto 0)
		);
END COMPONENT;

COMPONENT ALU_4bits
	PORT(
		OPE_A : IN std_logic_vector(3 downto 0);
		OPE_B : IN std_logic_vector(3 downto 0);
		SEL_ALU : IN std_logic_vector(1 downto 0);          
		SalFZ : OUT std_logic;
		SalALU : OUT std_logic_vector(3 downto 0)
		);
END COMPONENT;

COMPONENT FFD_Basic
	PORT(
		D : IN std_logic;
		CLK : IN std_logic;
		ENABLE : IN std_logic;
		RESET : IN std_logic;          
		Q : OUT std_logic
		);
END COMPONENT;

signal signal_FlagZero : std_logic;
signal signal_REGA_ALU : std_logic_vector(3 downto 0);
signal signal_REGB_ALU : std_logic_vector(3 downto 0);

begin

Inst_Reg_4bits_A: Reg_4bits PORT MAP(
	D => DataBus,
	CLK => CLK,
	Q => signal_REGA_ALU,
	ENABLE => CW0,
	RESET => RESET
);

Inst_Reg_4bits_B: Reg_4bits PORT MAP(
	D => DataBus,
	CLK => CLK,
	Q => signal_REGB_ALU,
	ENABLE => CW1,
	RESET => RESET
);

Inst_ALU_4bits: ALU_4bits PORT MAP(
	OPE_A => signal_REGA_ALU,
	OPE_B => signal_REGB_ALU,
	SEL_ALU => SEL_ALU,
	SalFZ => signal_FlagZero,
	SalALU => SalALU
);

Inst_FFD_Basic: FFD_Basic PORT MAP(
	D => signal_FlagZero,
	CLK => CLK,
	ENABLE => CW2,
	RESET => RESET,
	Q => SalFZ
);

SalREGA <= signal_REGA_ALU;
SalREGB <= signal_REGB_ALU;

end Structural;

