library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity controller3Arbiter is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           req3 : in  STD_LOGIC;
           id3 : in  STD_LOGIC_VECTOR (1 downto 0);
           eq13 : in  STD_LOGIC;
           eq23 : in  STD_LOGIC;
           grant1 : in  STD_LOGIC;
           grant2 : in  STD_LOGIC;
		   grant3 : out  STD_LOGIC;
           en_tab : out  STD_LOGIC_VECTOR (8 downto 0));
end controller3Arbiter;

architecture Behavioral of controller3Arbiter is
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
process(pstate,req3,id3,eq13,eq23,grant1,grant2) begin
case pstate is
when initial=>if req3='1' and id3="11" and (not((eq23='1' and grant2='1')or(eq13='1' and grant1='1'))) and eq13='0' and eq23='0' then nstate<=mem3_i;else if req3='1' and id3="10" and (not((eq13='1' and grant1='1')or(eq23='1' and grant2='1')))and eq13='0' and eq23='0' then nstate<=mem2_i;else if req3='1' and id3="01" and (not((eq13='1' and grant1='1')or(eq23='1' and grant2='1')))and eq13='0' and eq23='0' then nstate<=mem1_i;else nstate<=initial;end if;end if;end if; 
when mem1_i =>nstate<=mem1;
when mem1   =>if req3='1' then nstate<=mem1;else nstate<=initial;end if;
when mem2_i =>nstate<=mem2;
when mem2   =>if req3='1' then nstate<=mem2;else nstate<=initial;end if;
when mem3_i =>nstate<=mem3;
when mem3   =>if req3='1' then nstate<=mem3;else nstate<=initial;end if;
end case;
end process;
en_tab(8)<='1' when pstate=mem3_i or pstate=mem2_i or pstate=mem1_i else '0';
en_tab(7)<='1' when pstate=mem3_i or pstate=mem2_i else '0';
en_tab(6)<='1' when pstate=mem3_i else '0';
en_tab(5)<='1' when pstate=mem1_i else '0';
en_tab(4)<='1' when pstate=mem2_i else '0';
en_tab(3)<='1' when pstate=mem3_i else '0';
en_tab(2)<='1' when pstate=mem1_i else '0';
en_tab(1)<='1' when pstate=mem2_i else '0';
en_tab(0)<='1' when pstate=mem3_i else '0';
grant3<='0' when pstate=initial else '1';
end Behavioral;