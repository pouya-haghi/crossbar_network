library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity controller1Arbiter is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           req1 : in  STD_LOGIC;
           id1 : in  STD_LOGIC_VECTOR (1 downto 0);
           eq12 : in  STD_LOGIC;
           eq13 : in  STD_LOGIC;
           grant2 : in  STD_LOGIC;
           grant3 : in  STD_LOGIC;
		   grant1 : out  STD_LOGIC;
           en_tab : out  STD_LOGIC_VECTOR (2 downto 0));
end controller1Arbiter;

architecture Behavioral of controller1Arbiter is
type state is(initial,mem1_i,mem1,mem2_i,mem2,mem3_i,mem3);
signal pstate,nstate:state;
begin
process(clk) begin
if clk='1' and clk'event then
if rst='1' then pstate<=initial;
else pstate<=nstate;
end if;
end if;
end process;
process(pstate,req1,id1,eq12,eq13,grant2,grant3) begin
case pstate is
when initial=>if req1='1' and id1="11" and (not((eq12='1' and grant2='1')or(eq13='1' and grant3='1'))) then nstate<=mem3_i;else if req1='1' and id1="10" and (not((eq12='1' and grant2='1')or(eq13='1' and grant3='1'))) then nstate<=mem2_i;else if req1='1' and id1="01" and (not((eq12='1' and grant2='1')or(eq13='1' and grant3='1'))) then nstate<=mem1_i;else nstate<=initial;end if;end if;end if; 
when mem1_i =>nstate<=mem1;
when mem1   =>if req1='1' then nstate<=mem1;else nstate<=initial;end if;
when mem2_i =>nstate<=mem2;
when mem2   =>if req1='1' then nstate<=mem2;else nstate<=initial;end if;
when mem3_i =>nstate<=mem3;
when mem3   =>if req1='1' then nstate<=mem3;else nstate<=initial;end if;
end case;
end process;
en_tab(2)<='1' when pstate=mem3_i or pstate=mem2_i or pstate=mem1_i else '0';
en_tab(1)<='1' when pstate=mem3_i or pstate=mem2_i else '0';
en_tab(0)<='1' when pstate=mem3_i else '0';
grant1<='0' when pstate=initial else '1';
end Behavioral;