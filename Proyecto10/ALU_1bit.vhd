----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:15:29 10/20/2017 
-- Design Name: 
-- Module Name:    ALU_1bit - Structural 
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

entity ALU_1bit is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Carry_In : in  STD_LOGIC;
           Sel_Ope : in  STD_LOGIC_VECTOR (1 downto 0);
           Carry_Out : out  STD_LOGIC;
           Result : out  STD_LOGIC);
end ALU_1bit;

architecture Structural of ALU_1bit is

COMPONENT Mux4_1bit
PORT(
	A : IN std_logic;
	B : IN std_logic;
	C : IN std_logic;
	D : IN std_logic;
	Sel : IN std_logic_vector(1 downto 0);          
	Z : OUT std_logic
	);
END COMPONENT;

COMPONENT add_1bit
PORT(
	A : IN std_logic;
	B : IN std_logic;
	Cin : IN std_logic;          
	Cout : OUT std_logic;
	Result : OUT std_logic
	);
END COMPONENT;

COMPONENT modulo1
PORT(
	a : IN std_logic;
	b : IN std_logic;          
	c : OUT std_logic
	);
END COMPONENT;

COMPONENT xnor_gate
PORT(
	A : IN std_logic;
	B : IN std_logic;          
	C : OUT std_logic
	);
END COMPONENT;

signal sig_and, sig_xnor, sig_suma, sig_a : std_logic;

begin

Inst_Mux4_1bit: Mux4_1bit PORT MAP(
	A => sig_and,
	B => sig_xnor,
	C => sig_suma,
	D => sig_a,
	Sel => Sel_Ope,
	Z => Result
);

Inst_add_1bit: add_1bit PORT MAP(
	A => A,
	B => B,
	Cin => Carry_In,
	Cout => Carry_Out,
	Result => sig_suma
);

Inst_modulo1: modulo1 PORT MAP(
	a => A,
	b => B,
	c => sig_and 
);

Inst_xnor_gate: xnor_gate PORT MAP(
	A => A,
	B => A,
	C => sig_xnor 
);

end Structural;

