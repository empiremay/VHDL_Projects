----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:00:25 01/12/2018 
-- Design Name: 
-- Module Name:    ControlUnit_DidaComp - Behavioral 
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

entity ControlUnit_DidaComp is
    Port ( COP : in  STD_LOGIC_VECTOR (1 downto 0);
           Push : in  STD_LOGIC;
           FZ : in  STD_LOGIC;
			  CLK: in STD_LOGIC;
			  RESET: in STD_LOGIC;
           CW : out  STD_LOGIC_VECTOR (9 downto 0));
end ControlUnit_DidaComp;

architecture Behavioral of ControlUnit_DidaComp is

type States_FSM is (Idle,LoadInst,LoadA,LoadB,AaddB,AsubB,MovA,Deco,Beq);
signal Next_State: States_FSM;

constant Outputs_Idle:		std_logic_Vector(9 downto 0):="0000000000";
constant Outputs_LoadInst:	std_logic_Vector(9 downto 0):="0010010000";
constant Outputs_LoadA:		std_logic_Vector(9 downto 0):="0000000001";
constant Outputs_LoadB:		std_logic_Vector(9 downto 0):="0000100010";
constant Outputs_AaddB:		std_logic_Vector(9 downto 0):="1000101100";
constant Outputs_AsubB:		std_logic_Vector(9 downto 0):="1100101100";
constant Outputs_MovA:		std_logic_Vector(9 downto 0):="0000101100";
constant Outputs_Deco:		std_logic_Vector(9 downto 0):="0000000000";
constant Outputs_Beq:		std_logic_Vector(9 downto 0):="0111100000";

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
						if(COP="01") then
							if(FZ='1') then
								Next_State<=Beq;
							else
								Next_State<=LoadInst;
							end if;
						else
							Next_State<=LoadA;
						end if;
					end if;
			--LoadA--
				when LoadA=>
					if(Push='1') then
						if(COP="00") then
							Next_State<=MovA;
						elsif(COP="10" or COP="11") then
							Next_State<=LoadB;
						end if;
					end if;
			--Beq--
				when Beq=>
					if(Push='1') then
						Next_State<=LoadInst;
					end if;
			--LoadB--
				when LoadB=>
					if(Push='1') then
						if(COP="11") then
							Next_State<=AsubB;
						elsif(COP="10") then
							Next_State<=AaddB;
						end if;
					end if;
			--MovA--
				when MovA=>
					if(Push='1') then
						Next_State<=LoadInst;
					end if;
			--AsubB--
				when AsubB=>
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
						Outputs_AsubB when AsubB,
						Outputs_MovA when MovA,
						Outputs_Deco when Deco,
						Outputs_Beq when Beq,
						Outputs_Idle when others;

end Behavioral;

