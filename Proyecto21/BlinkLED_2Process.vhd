----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:46:48 11/17/2017 
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

entity BlinkLED_2Process is
    Port ( CLK : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           LED : out  STD_LOGIC);
end BlinkLED_2Process;

architecture Behavioral of BlinkLED_2Process is
	constant EndCount: integer :=50000000; -- Ciclos a contar.
	signal Count: integer range 0 to EndCount;
	signal Out_1Hz: std_logic; -- Salida del Counter Process
	signal CLK_1Hz: std_logic; -- Salida del FFTProcess

begin
	Counter: process (CLK, RESET)
		begin
			if RESET='1' then
				Count <= 0;
				Out_1Hz <='0';
			elsif rising_edge(CLK) then
				if Count = EndCount-1 then -- Si ya ha contado 50.000.000 ciclos de CLK
					Count <= 0; -- Pone el contador a 0
					Out_1Hz <='1'; -- Manda un '1' durante un ciclo de CLK
				else
					Count <=Count+1; -- Si no ha llegado al final de la cuenta, incrementa la cuenta de ciclos.
					Out_1Hz <='0'; -- Mantiene la salida a '0', no hay pulso.
				end if;
			end if;
	end process;
	
	FFT: process(CLK,RESET)
		begin
			if RESET='1' then
				CLK_1Hz <='0';
			elsif rising_edge(CLK) then
				if Out_1Hz='1' then
				-- Sería como el Enable del FFT
				CLK_1Hz <= not CLK_1Hz;
			end if;
		end if;
	end process;
LED <= CLK_1Hz;
end Behavioral;

