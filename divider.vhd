library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity divider is
    Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           s : out  STD_LOGIC_VECTOR (7 downto 0));
end divider;

architecture Behavioral of divider is

begin

	s <= std_logic_vector(to_unsigned(to_integer(unsigned(a) / unsigned(b)),8));

end Behavioral;

