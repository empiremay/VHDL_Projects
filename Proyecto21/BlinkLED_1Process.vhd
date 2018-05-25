----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:58:56 11/17/2017 
-- Design Name: 
-- Module Name:    BlinkLED_1Process - Behavioral 
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

entity BlinkLED_1Process is
    Port ( CLK : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           LED : out  STD_LOGIC);
end BlinkLED_1Process;

architecture Behavioral of BlinkLED_1Process is
	constant EndCount: integer :=50000000; -- Ciclos a contar.
	signal Count: integer range 0 to EndCount;
	signal CLK_1Hz: std_logic; -- Salida del FFTProcess

begin

	Blink: process(CLK, RESET)
		begin
			if RESET='1' then
				Count <= 0;
				CLK_1Hz <='0';
			elsif rising_edge(CLK) then
				if Count = EndCount-1 then -- Si ya ha contado 50.000.000 ciclos de CLK
					Count <= 0; -- Pone el contador a 0
					CLK_1Hz <= not CLK_1Hz;
				else
					Count <=Count+1; -- Si no ha llegado al final de la cuenta, incrementa la cuenta de ciclos.
				end if;
			end if;
	end process;
LED <= CLK_1Hz;
end Behavioral;

