library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg is
    Port ( 
           set : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           q : out  STD_LOGIC);
end reg;

architecture Behavioral of reg is
begin
process (clk)
begin
if clk='1' and clk'event then
if rst='1' then q<='0';
else if set='1' then q<='1';
end if; 
end if;
end if;
end process;

end Behavioral;

