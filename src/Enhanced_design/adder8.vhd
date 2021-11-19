library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity adder8 is
    Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           sum : out  STD_LOGIC_VECTOR (7 downto 0));
end adder8;

architecture Behavioral of adder8 is

begin
sum<=a+b;

end Behavioral;

