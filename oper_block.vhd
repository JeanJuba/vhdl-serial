library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity oper_block is
    Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           s : out  STD_LOGIC_VECTOR (7 downto 0));
end oper_block;

architecture Behavioral of oper_block is

component adder is
    Port ( a : in  STD_LOGIC_VECTOR(7 downto 0);
           b : in  STD_LOGIC_VECTOR(7 downto 0);
           s : out  STD_LOGIC_VECTOR(7 downto 0));
end component;

component subtractor is
    Port ( a : in  STD_LOGIC_VECTOR(7 downto 0);
           b : in  STD_LOGIC_VECTOR(7 downto 0);
           s : out  STD_LOGIC_VECTOR(7 downto 0));
end component;

component multiplier is
    Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           s : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component divider is
    Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           s : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component mux_2bits is
    Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           c : in  STD_LOGIC_VECTOR (7 downto 0);
           d : in  STD_LOGIC_VECTOR (7 downto 0);
           option : in  STD_LOGIC_VECTOR(1 downto 0);
           s : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

signal adder_result, subtractor_result, multiplier_result, divider_result : STD_LOGIC_VECTOR(7 downto 0);

begin
	
	add : adder port map (a, b, adder_result);
	sub : subtractor port map (a, b, subtractor_result);
	mult : multiplier port map (a, b, multiplier_result);
	div : divider port map (a, b, divider_result);
	mux : mux_2bits port map (adder_result, subtractor_result, multiplier_result, divider_result, op, s);
	
end Behavioral;

