library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg2 is
    Port ( d : in  STD_LOGIC_vector(1 downto 0);
           en : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           q : out  STD_LOGIC_vector(1 downto 0));
end reg2;

architecture Behavioral of reg2 is
begin
process (clk)
begin
if clk='1' and clk'event then
if rst='1' then q<="00";
else if en='1' then q<=d;
end if; 
end if;
end if;
end process;

end Behavioral;

