
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity counter3 is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           count : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (2 downto 0));
end counter3;

architecture Behavioral of counter3 is
signal t_q:std_logic_vector (2 downto 0);
begin
process (clk) begin
if clk='1' and clk'event then 
if rst='1' then t_q<=(others=>'0');
else if count='1' then t_q<=t_q+ "001";
end if;
end if;
end if;
end process;
q<=t_q;
end Behavioral;

