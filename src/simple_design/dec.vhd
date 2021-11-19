library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dec is
    Port ( rwb : in  STD_LOGIC;
           rread : out  STD_LOGIC;
           wwrite : out  STD_LOGIC);
end dec;

architecture Behavioral of dec is

begin
rread<='1' when rwb='1' else '0';
wwrite<='1' when rwb='0' else '0';
end Behavioral;

