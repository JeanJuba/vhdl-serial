-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY testbench IS
  END testbench;

  ARCHITECTURE behavior OF testbench IS 


    SIGNAL a :  std_logic_vector(7 downto 0);
    SIGNAL b :  std_logic_vector(7 downto 0);
	 SIGNAL op :  std_logic_vector(1 downto 0);
    SIGNAL s :  std_logic_vector(7 downto 0);  
	
	 signal clock : std_logic := '0';
	 constant clock_period : time := 10 ns;

  BEGIN

	uut: entity work.oper_block PORT MAP (
          a => a,
			 b => b,
			 op => op,
			 s => s );

   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
	
	
	a <= "00001000";
	b <= "00000010";
	op <= "00", "01" after 10 ns, "10" after 20 ns, "11" after 30 ns;

  END;
