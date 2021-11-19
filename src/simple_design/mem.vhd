library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use work.utilities.all;

entity mem is
    Port ( clk : in  STD_LOGIC;
           data : inout  STD_LOGIC_VECTOR(7 downto 0);
		   pack: in packet);
end mem;

architecture Behavioral of mem is
type memo is array(255 downto 0) of std_logic_vector(7 downto 0);
signal mymem:memo;
begin
process (clk) begin
if clk='1' and clk'event then
if pack.en='1' and pack.wwrite='1' then mymem(conv_integer(pack.add))<=data;end if;
end if;
end process;
data<=mymem(conv_integer(pack.add)) when pack.rread='1' and pack.en='1' else (others=>'Z');
end Behavioral;
