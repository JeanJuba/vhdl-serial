library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ctrl_block is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           inp : in  STD_LOGIC_VECTOR (7 downto 0);
			  received : in STD_LOGIC;
           a : out  STD_LOGIC_VECTOR (7 downto 0);
           b : out  STD_LOGIC_VECTOR (7 downto 0);
			  op : out STD_LOGIC_VECTOR (1 downto 0));
end ctrl_block;

architecture Behavioral of ctrl_block is
	
	type state_type is (WAIT_FIRST, WAIT_SECOND, WAIT_OP, RESULT);
	
	signal state : state_type;
	signal first_val, second_val : STD_LOGIC_VECTOR(7 downto 0);
	signal op : STD_lOGIC_VECTOR(1 downto 0);
	
begin

	process(clock, reset)
	begin
		
		if reset = '1' then
			state <= IDLE;
		elsif clock'Event and clock = '1' then
			
			case(estado) is
					
				when WAIT_FIRST =>
					if (received = '1') then
							estado <= WAIT_SECOND;
					end if;
					
				when WAIT_SECOND =>
					if (received = '1') then
							estado <= WAIT_OP;
					end if;
				
				when WAIT_OP =>
					if (received = '1') then
							estado <= RESULT;
					end if;

				when RESULT =>
					estado <= WAIT_FIRST;
			
			end case;
		
		end if;
	end process;

	process(state)
	begin

		case(state) is
		
			when WAIT_FIRST =>
				first_val <= inp;
		
			when WAIT_SECOND =>
				second_val <= inp;
			
			when WAIT_OP =>
				op <= inp;
			
			when RESULT =>
			
		end case;

	end process;


end Behavioral;

