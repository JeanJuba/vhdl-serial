library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ctrl_block is
    Port ( reset : in  STD_LOGIC;
           inp : in  STD_LOGIC_VECTOR (7 downto 0);
			  received : in STD_LOGIC;
           a : out  STD_LOGIC_VECTOR (7 downto 0);
           b : out  STD_LOGIC_VECTOR (7 downto 0);
			  op : out STD_LOGIC_VECTOR (1 downto 0));
end ctrl_block;

architecture Behavioral of ctrl_block is
	
	type state_type is (WAIT_FIRST, WAIT_SECOND, WAIT_OP, RESULT);
	
	signal state : state_type := WAIT_FIRST;
	signal first_val, second_val : STD_LOGIC_VECTOR(7 downto 0);
	signal op_val : STD_lOGIC_VECTOR(1 downto 0);
	
begin

	process(received, reset)
	begin
		
		if reset = '1' then
			state <= WAIT_FIRST;
		elsif rising_edge(received) then
			
			case(state) is
					
				when WAIT_FIRST =>
					state <= WAIT_SECOND;
					
				when WAIT_SECOND =>
					state <= WAIT_OP;
				
				when WAIT_OP =>
					state <= RESULT;

				when RESULT =>
					state <= WAIT_FIRST;
			
			end case;
		
		end if;
	end process;

	process(state)
	begin

		case(state) is
		
			when WAIT_FIRST =>
				first_val <= inp;
				a <= "00000000";
				b <= "00000000";
				op <= "00";
				
			when WAIT_SECOND =>
				second_val <= inp;
				a <= "00000000";
				b <= "00000000";
				op <= "00";
				
			when WAIT_OP =>
				op_val <= inp(1 downto 0);
				a <= "00000000";
				b <= "00000000";
				op <= "00";

			when RESULT =>
				a <= first_val;
				b <= second_val;
				op <= op_val;
			
		end case;

	end process;


end Behavioral;

