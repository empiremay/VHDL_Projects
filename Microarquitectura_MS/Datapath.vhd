----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:22:54 01/21/2018 
-- Design Name: 
-- Module Name:    Datapath - Behavioral 
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

entity Datapath is
    Port ( DataBus : in  STD_LOGIC_VECTOR (7 downto 0);
           SEL_ALU : in  STD_LOGIC_VECTOR (1 downto 0);
           CLK : in  STD_LOGIC;
           CW0 : in  STD_LOGIC;
           CW1 : in  STD_LOGIC;
           CW2 : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           SalALU : out  STD_LOGIC_VECTOR (7 downto 0);
           SalREGA : out  STD_LOGIC_VECTOR (7 downto 0);
           SalREGB : out  STD_LOGIC_VECTOR (7 downto 0);
           SalFZ : out  STD_LOGIC);
end Datapath;

architecture Behavioral of Datapath is

signal signal_REGA_ALU : std_logic_vector(7 downto 0);
signal signal_REGB_ALU : std_logic_vector(7 downto 0);
signal resultado : std_logic_Vector(7 downto 0);
signal signal_SalFZ: std_logic;
constant ZERO: std_logic_vector(7 downto 0):=(others=>'0');

begin

process(CLK, RESET)	--REG A PROCESS
	begin
		if RESET='1' then
			signal_REGA_ALU <= (others=>'0');
		elsif rising_edge(CLK) then
			if CW0='1' then
				signal_REGA_ALU<=DataBus;
			end if;
		end if;
end process;			--END REG A PROCESS

process(CLK, RESET)	--REG B PROCESS
	begin
		if RESET='1' then
			signal_REGB_ALU <= (others=>'0');
		elsif rising_edge(CLK) then
			if CW1='1' then
				signal_REGB_ALU<=DataBus;
			end if;
		end if;
end process;			--END REG B PROCESS

process(SEL_ALU, signal_REGA_ALU, signal_REGB_ALU)		--ALU PROCESS 1
	begin
		resultado <= (others=>'0');
		if SEL_ALU = "00" then
			resultado <= signal_REGB_ALU;
		end if;
		if SEL_ALU = "01" then
			resultado <= (others=>'0');
		end if;
		if SEL_ALU = "10" then
			resultado <= std_logic_Vector(unsigned(signal_REGA_ALU)+unsigned(signal_REGB_ALU));
		end if;
		if SEL_ALU = "11" then
			resultado <= std_logic_Vector(unsigned(signal_REGA_ALU)-unsigned(signal_REGB_ALU));
		end if;
end process;			--END ALU PROCESS 1

process(resultado)	--ALU PROCESS 2
	begin
		if resultado = ZERO then
			signal_SalFZ <= '1';
		else
			signal_SalFZ <= '0';
		end if;
end process;			--END ALU PROCESS 2

process(CLK, RESET)	--FFD PROCESS
	begin
		if RESET='1' then
			SalFZ<='0';
		elsif rising_edge(CLK) then
			if CW2='1' then
				SalFZ<=signal_SalFZ;
			end if;
		end if;
end process;			--END FFD PROCESS

SalREGA <= signal_REGA_ALU;
SalREGB <= signal_REGB_ALU;
SalALU <= resultado;

end Behavioral;

