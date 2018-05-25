----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:02:09 10/25/2017 
-- Design Name: 
-- Module Name:    ALU_4bits - Behavioral 
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

entity ALU_4bits is
	 Generic ( ANCHO : integer :=4
	 );
    Port ( OPE_A : in  STD_LOGIC_VECTOR (ANCHO-1 downto 0);
           OPE_B : in  STD_LOGIC_VECTOR (ANCHO-1 downto 0);
           SEL_ALU : in  STD_LOGIC_VECTOR (1 downto 0);
           SalFZ : out  STD_LOGIC;
           SalALU : out  STD_LOGIC_VECTOR (ANCHO-1 downto 0));
end ALU_4bits;

architecture Behavioral of ALU_4bits is

signal resultado : std_logic_Vector(ANCHO-1 downto 0);
constant ZERO: std_logic_vector(ANCHO-1 downto 0):=(others=>'0');

begin

	process(SEL_ALU,OPE_A,OPE_B)
		begin
			resultado <= (others=>'0');
			if SEL_ALU = "00" then
				resultado <= OPE_A;
			end if;
			if SEL_ALU = "01" then
				resultado <= (others=>'0');
			end if;
			if SEL_ALU = "10" then
				resultado <= std_logic_Vector(unsigned(OPE_A)+unsigned(OPE_B));
			end if;
			if SEL_ALU = "11" then
				resultado <= std_logic_Vector(unsigned(OPE_A)-unsigned(OPE_B));
			end if;
	end process;
	
	process(resultado)
		begin
			if resultado = ZERO then
				SalFZ <= '1';
			else
				SalFZ <= '0';
			end if;
	end process;
	
	SalALU <= resultado;

end Behavioral;

