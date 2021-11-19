
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity ptr8 is
    Port ( inc : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (7 downto 0));
end ptr8;

architecture Behavioral of ptr8 is
signal t_q:STD_LOGIC_VECTOR(7 downto 0);
begin
process (clk) begin
if clk='1' and clk'event then 
if rst='1' then t_q<=(others=>'0');
else if inc='1' then t_q<=t_q+ "00000001";
end if;
end if;
end if;
end process;
q<=t_q;
end Behavioral;

