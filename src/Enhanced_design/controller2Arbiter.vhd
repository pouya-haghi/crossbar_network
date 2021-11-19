library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity controller2Arbiter is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           req2 : in  STD_LOGIC;
           read2 : in  STD_LOGIC;
           id2 : in  STD_LOGIC_VECTOR (1 downto 0);
           eq12 : in  STD_LOGIC;
           eq23 : in  STD_LOGIC;
           eqf1 : in  STD_LOGIC;
           eqf2 : in  STD_LOGIC;
           grant1 : in  STD_LOGIC;
           grant3 : in  STD_LOGIC;
		   grant2 : out  STD_LOGIC;
		   enf2 : out  STD_LOGIC;
           setCross : out  STD_LOGIC_VECTOR (5 downto 0);
           rstCross : out  STD_LOGIC_VECTOR (5 downto 0);
           setDiru : out  STD_LOGIC_VECTOR (5 downto 0);
           rstDiru : out  STD_LOGIC_VECTOR (5 downto 0);
           setDirl : out  STD_LOGIC_VECTOR (5 downto 0);
           rstDirl : out  STD_LOGIC_VECTOR (5 downto 0));
end controller2Arbiter;

architecture Behavioral of controller2Arbiter is
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
process(pstate,req2,id2,eq12,eq23,grant1,grant3,eqf1,eqf2) begin
case pstate is
when initial=>if req2='1' and id2="11" and (not((eq23='1' and grant3='1')or(eq12='1' and grant1='1')))and((eq12='0' and eq23='0')or(eq12='1' and eqf1='1')or(eq23='1' and eqf2='0')) then nstate<=mem3_i;else if req2='1' and id2="10" and (not((eq12='1' and grant1='1')or(eq23='1' and grant3='1')))and((eq12='0' and eq23='0')or(eq12='1' and eqf1='1')or(eq23='1' and eqf2='0')) then nstate<=mem2_i;else if req2='1' and id2="01" and (not((eq12='1' and grant1='1')or(eq23='1' and grant3='1')))and((eq12='0' and eq23='0')or(eq12='1' and eqf1='1')or(eq23='1' and eqf2='0')) then nstate<=mem1_i;else nstate<=initial;end if;end if;end if; 
when mem1_i =>nstate<=mem1;
when mem1   =>if req2='1' then nstate<=mem1;else nstate<=initial;end if;
when mem2_i =>nstate<=mem2;
when mem2   =>if req2='1' then nstate<=mem2;else nstate<=initial;end if;
when mem3_i =>nstate<=mem3;
when mem3   =>if req2='1' then nstate<=mem3;else nstate<=initial;end if;
end case;
end process;
--output logic 
process(pstate,read2,nstate) begin
case pstate is
when initial=>grant2<='0';enf2<='0';setCross<=(others=>'0');rstCross<=(others=>'0');setDiru<=(others=>'0');rstDiru<=(others=>'0');setDirl<=(others=>'0');rstDirl<=(others=>'0');
when mem1_i =>grant2<='1';enf2<='1';setCross<="100000";rstCross<="011000";setDiru(2)<=read2;setDiru(5)<=read2;setDiru(1 downto 0)<=(others=>'0');setDiru(4 downto 3)<=(others=>'0');rstDiru(2)<=not read2;rstDiru(5)<=not read2;rstDiru(1 downto 0)<=(others=>'0');rstDiru(4 downto 3)<=(others=>'0');setDirl(5)<=read2;setDirl(4 downto 0)<=(others=>'0');rstDirl(5)<=not read2;rstDirl(4 downto 0)<=(others=>'0');
when mem1   =>grant2<='1';enf2<='0';setCross<=(others=>'0');rstCross(4 downto 0)<=(others=>'0');if(nstate=initial) then rstCross(5)<='1';else rstCross(5)<='0';end if;setDiru<=(others=>'0');rstDiru<=(others=>'0');setDirl<=(others=>'0');rstDirl<=(others=>'0');
when mem2_i =>grant2<='1';enf2<='1';setCross<="010000";rstCross<="101000";setDiru(1)<=read2;setDiru(4)<=read2;setDiru(5)<='0';setDiru(0)<='0';setDiru(3 downto 2)<="00";rstDiru(1)<=not read2;rstDiru(4)<=not read2;rstDiru(5)<='0';rstDiru(0)<='0';rstDiru(3 downto 2)<="00";setDirl(5 downto 4)<=read2&read2;setDirl(3 downto 0)<="0000";rstDirl(5 downto 4)<=(not read2)&(not read2);rstDirl(3 downto 0)<="0000";
when mem2   =>grant2<='1';enf2<='0';setCross<=(others=>'0');rstCross(3 downto 0)<=(others=>'0');rstCross(5)<='0';if(nstate=initial) then rstCross(4)<='1';else rstCross(4)<='0';end if;setDiru<=(others=>'0');rstDiru<=(others=>'0');setDirl<=(others=>'0');rstDirl<=(others=>'0');
when mem3_i =>grant2<='1';enf2<='1';setCross<="001000";rstCross<="110000";setDiru(0)<=read2;setDiru(3)<=read2;setDiru(2 downto 1)<=(others=>'0');setDiru(5 downto 4)<=(others=>'0');rstDiru(0)<=not read2;rstDiru(3)<=not read2;rstDiru(2 downto 1)<=(others=>'0');rstDiru(5 downto 4)<=(others=>'0');setDirl(5 downto 3)<=read2&read2&read2;setDirl(2 downto 0)<="000";rstDirl(5 downto 3)<=(not read2)&(not read2)&(not read2);rstDirl(2 downto 0)<="000";
when mem3   =>grant2<='1';enf2<='0';setCross<=(others=>'0');rstCross(2 downto 0)<=(others=>'0');rstCross(5 downto 4)<=(others=>'0');if(nstate=initial) then rstCross(3)<='1';else rstCross(3)<='0';end if;setDiru<=(others=>'0');rstDiru<=(others=>'0');setDirl<=(others=>'0');rstDirl<=(others=>'0');
end case;
end process;
end Behavioral;