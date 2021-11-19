library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity controllerWrapper is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           grant : in  STD_LOGIC;
           eq : in  STD_LOGIC;
           clr : out  STD_LOGIC;
           en_mem : out  STD_LOGIC;
           rq : out  STD_LOGIC;
           count : out  STD_LOGIC;
           inc_ptr : out  STD_LOGIC);
end controllerWrapper;

architecture Behavioral of controllerWrapper is
type state is(s0,s1,s2,s3);
signal pstate,nstate:state;
begin
process(clk) begin
if clk='1' and clk'event then
if rst='1' then pstate<=s0;
else pstate<=nstate;
end if;
end if;
end process;
process(pstate,grant,eq) begin
case pstate is
when s0 =>if grant='1' then nstate<=s1;else nstate<=s0;end if;
when s1 =>nstate<=s2;
when s2 =>if eq='1' then nstate<=s3;else nstate<=s2;end if;
when s3 =>nstate<=s0;
end case;
end process;
en_mem<='1' when pstate=s1 or pstate=s2 else '0';
rq<='0' when pstate=s3 else '1';
clr<='1' when pstate=s1 else '0';
count<='1' when pstate=s2 else '0';
inc_ptr<='1' when pstate=s3 else '0';
end Behavioral;

