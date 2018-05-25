----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:19:54 01/24/2018 
-- Design Name: 
-- Module Name:    ControlUnit_MS - Behavioral 
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

entity ControlUnit_MS is
    Port ( COP : in  STD_LOGIC_VECTOR (1 downto 0);
           Push : in  STD_LOGIC;
           FZ : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           CW : out  STD_LOGIC_VECTOR (9 downto 0));
end ControlUnit_MS;

architecture Behavioral of ControlUnit_MS is

type States_FSM is (Idle,LoadInst,LoadA,LoadB,AaddB,AcompB,MovB,Deco,Beq);
signal Next_State: States_FSM;

constant Outputs_Idle:		std_logic_Vector(9 downto 0):="0000000000";
constant Outputs_LoadInst:	std_logic_Vector(9 downto 0):="0010010000";
constant Outputs_LoadA:		std_logic_Vector(9 downto 0):="0001000001";
constant Outputs_LoadB:		std_logic_Vector(9 downto 0):="0001100010";
constant Outputs_AaddB:		std_logic_Vector(9 downto 0):="1001101100";
constant Outputs_AcompB:	std_logic_Vector(9 downto 0):="1100000100";
constant Outputs_MovB:		std_logic_Vector(9 downto 0):="0001001100";
constant Outputs_Deco:		std_logic_Vector(9 downto 0):="0000000000";
constant Outputs_Beq:		std_logic_Vector(9 downto 0):="0111000000";

begin

	process(CLK, RESET, COP, FZ)
	begin
		if RESET='1' then
			Next_State<=Idle;
		elsif rising_edge(CLK) then
			case Next_State is
			--Idle--
				when Idle=>
					if(Push='1') then
						Next_State<=LoadInst;
					end if;
			--LoadInst--
				when LoadInst=>
					if(Push='1') then
						Next_State<=Deco;
					end if;
			--Deco--
				when Deco=>
					if(Push='1') then
						if(COP="11") then
							if(FZ='1') then
								Next_State<=Beq;
							else
								Next_State<=LoadInst;
							end if;
						else
							Next_State<=LoadB;
						end if;
					end if;
			--LoadB--
				when LoadB=>
					if(Push='1') then
						if(COP="01") then
							Next_State<=MovB;
						elsif(COP="00" or COP="10") then
							Next_State<=LoadA;
						end if;
					end if;
			--Beq--
				when Beq=>
					if(Push='1') then
						Next_State<=LoadInst;
					end if;
			--LoadA--
				when LoadA=>
					if(Push='1') then
						if(COP="10") then
							Next_State<=AcompB;
						elsif(COP="00") then
							Next_State<=AaddB;
						end if;
					end if;
			--MovB--
				when MovB=>
					if(Push='1') then
						Next_State<=LoadInst;
					end if;
			--AcompB--
				when AcompB=>
					if(Push='1') then
						Next_State<=LoadInst;
					end if;
			--AaddB--
				when AaddB=>
					if(Push='1') then
						Next_State<=LoadInst;
					end if;
			end case;
		end if;
	end process;
	
	with Next_State select
		CW<=Outputs_Idle when Idle,
						Outputs_LoadInst when LoadInst,
						Outputs_LoadA when LoadA,
						Outputs_LoadB when LoadB,
						Outputs_AaddB when AaddB,
						Outputs_AcompB when AcompB,
						Outputs_MovB when MovB,
						Outputs_Deco when Deco,
						Outputs_Beq when Beq,
						Outputs_Idle when others;

end Behavioral;

