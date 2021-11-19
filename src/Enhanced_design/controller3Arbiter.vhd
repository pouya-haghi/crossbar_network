library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity controller3Arbiter is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           req3 : in  STD_LOGIC;
           read3 : in  STD_LOGIC;
           id3 : in  STD_LOGIC_VECTOR (1 downto 0);
           eq13 : in  STD_LOGIC;
           eq23 : in  STD_LOGIC;
           eqf1 : in  STD_LOGIC;
           eqf2 : in  STD_LOGIC;
           grant1 : in  STD_LOGIC;
           grant2 : in  STD_LOGIC;
		   grant3 : out  STD_LOGIC;
           setCross : out  STD_LOGIC_VECTOR (8 downto 0);
           rstCross : out  STD_LOGIC_VECTOR (8 downto 0);
           setDiru : out  STD_LOGIC_VECTOR (8 downto 0);
           rstDiru : out  STD_LOGIC_VECTOR (8 downto 0);
           setDirl : out  STD_LOGIC_VECTOR (8 downto 0);
           rstDirl : out  STD_LOGIC_VECTOR (8 downto 0));
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
process(pstate,req3,id3,eq13,eq23,grant1,grant2,eqf1,eqf2) begin
case pstate is
when initial=>if req3='1' and id3="11" and (not((eq23='1' and grant2='1')or(eq13='1' and grant1='1')))and((eq13='0' and eq23='0')or(eq13='1' and eqf1='1')or(eq23='1' and eqf2='1')) then nstate<=mem3_i;else if req3='1' and id3="10" and (not((eq13='1' and grant1='1')or(eq23='1' and grant2='1')))and((eq13='0' and eq23='0')or(eq13='1' and eqf1='1')or(eq23='1' and eqf2='1')) then nstate<=mem2_i;else if req3='1' and id3="01" and (not((eq13='1' and grant1='1')or(eq23='1' and grant2='1')))and((eq13='0' and eq23='0')or(eq13='1' and eqf1='1')or(eq23='1' and eqf2='1')) then nstate<=mem1_i;else nstate<=initial;end if;end if;end if; 
when mem1_i =>nstate<=mem1;
when mem1   =>if req3='1' then nstate<=mem1;else nstate<=initial;end if;
when mem2_i =>nstate<=mem2;
when mem2   =>if req3='1' then nstate<=mem2;else nstate<=initial;end if;
when mem3_i =>nstate<=mem3;
when mem3   =>if req3='1' then nstate<=mem3;else nstate<=initial;end if;
end case;
end process;
--output logic
process(pstate,read3,nstate) begin
case pstate is
when initial=>grant3<='0';setCross<=(others=>'0');rstCross<=(others=>'0');setDiru<=(others=>'0');rstDiru<=(others=>'0');setDirl<=(others=>'0');rstDirl<=(others=>'0');
when mem1_i =>grant3<='1';setCross<="100000000";rstCross<="011000000";setDiru(2)<=read3;setDiru(5)<=read3;setDiru(8)<=read3;setDiru(1 downto 0)<=(others=>'0');setDiru(4 downto 3)<=(others=>'0');setDiru(7 downto 6)<=(others=>'0');rstDiru(2)<=not read3;rstDiru(5)<=not read3;rstDiru(8)<=not read3;rstDiru(1 downto 0)<=(others=>'0');rstDiru(4 downto 3)<=(others=>'0');rstDiru(7 downto 6)<=(others=>'0');setDirl(8)<=read3;setDirl(7 downto 0)<=(others=>'0');rstDirl(8)<=not read3;rstDirl(7 downto 0)<=(others=>'0');
when mem1   =>grant3<='1';setCross<=(others=>'0');rstCross(7 downto 0)<=(others=>'0');if(nstate=initial) then rstCross(8)<='1';else rstCross(8)<='0';end if;setDiru<=(others=>'0');rstDiru<=(others=>'0');setDirl<=(others=>'0');rstDirl<=(others=>'0');
when mem2_i =>grant3<='1';setCross<="010000000";rstCross<="101000000";setDiru(1)<=read3;setDiru(4)<=read3;setDiru(7)<=read3;setDiru(6 downto 5)<="00";setDiru(0)<='0';setDiru(3 downto 2)<="00";setDiru(8)<='0';rstDiru(1)<=not read3;rstDiru(4)<=not read3;rstDiru(7)<=not read3;rstDiru(6 downto 5)<="00";rstDiru(0)<='0';rstDiru(3 downto 2)<="00";rstDiru(8)<='0';setDirl(8 downto 7)<=read3&read3;setDirl(6 downto 0)<=(others=>'0');rstDirl(8 downto 7)<=(not read3)&(not read3);rstDirl(6 downto 0)<=(others=>'0');
when mem2   =>grant3<='1';setCross<=(others=>'0');rstCross(6 downto 0)<=(others=>'0');rstCross(8)<='0';if(nstate=initial) then rstCross(7)<='1';else rstCross(7)<='0';end if;setDiru<=(others=>'0');rstDiru<=(others=>'0');setDirl<=(others=>'0');rstDirl<=(others=>'0');
when mem3_i =>grant3<='1';setCross<="001000000";rstCross<="110000000";setDiru(0)<=read3;setDiru(3)<=read3;setDiru(6)<=read3;setDiru(2 downto 1)<=(others=>'0');setDiru(5 downto 4)<=(others=>'0');setDiru(8 downto 7)<=(others=>'0');rstDiru(0)<=not read3;rstDiru(3)<=not read3;rstDiru(6)<=not read3;rstDiru(2 downto 1)<=(others=>'0');rstDiru(5 downto 4)<=(others=>'0');rstDiru(8 downto 7)<=(others=>'0');setDirl(8 downto 6)<=read3&read3&read3;setDirl(5 downto 0)<="000000";rstDirl(8 downto 6)<=(not read3)&(not read3)&(not read3);rstDirl(5 downto 0)<="000000";
when mem3   =>grant3<='1';setCross<=(others=>'0');rstCross(5 downto 0)<=(others=>'0');rstCross(8 downto 7)<=(others=>'0');if(nstate=initial) then rstCross(6)<='1';else rstCross(6)<='0';end if;setDiru<=(others=>'0');rstDiru<=(others=>'0');setDirl<=(others=>'0');rstDirl<=(others=>'0');
end case;
end process;
end Behavioral;