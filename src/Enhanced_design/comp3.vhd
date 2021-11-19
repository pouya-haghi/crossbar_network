library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comp3 is
    Port ( a : in  STD_LOGIC_VECTOR (2 downto 0);
           b : in  STD_LOGIC_VECTOR (2 downto 0);
           eq : out  STD_LOGIC);
end comp3;

architecture Behavioral of comp3 is

begin
eq<='1' when a=b else '0';

end Behavioral;

