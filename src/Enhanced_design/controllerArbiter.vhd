library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity controller1Arbiter is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           read1 : in  STD_LOGIC;
           eqf1 : in  STD_LOGIC;
           req1 : in  STD_LOGIC;
           id1 : in  STD_LOGIC_VECTOR (1 downto 0);
           eq12 : in  STD_LOGIC;
           eq13 : in  STD_LOGIC;
           grant2 : in  STD_LOGIC;
           grant3 : in  STD_LOGIC;
		   grant1 : out  STD_LOGIC;
		   enf1 : out  STD_LOGIC;
           setCross : out  STD_LOGIC_VECTOR (2 downto 0);
           rstCross : out  STD_LOGIC_VECTOR (2 downto 0);
           setDiru : out  STD_LOGIC_VECTOR (2 downto 0);
           rstDiru : out  STD_LOGIC_VECTOR (2 downto 0);
           setDirl : out  STD_LOGIC_VECTOR (2 downto 0);
           rstDirl : out  STD_LOGIC_VECTOR (2 downto 0));
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
--next state logic
process(pstate,req1,id1,eq12,eq13,grant2,grant3,eqf1) begin
case pstate is
when initial=>if req1='1' and id1="11" and (not((eq12='1' and grant2='1')or(eq13='1' and grant3='1'))) and ((eq12='0' and eq13='0')or(eq12='1' and eqf1='0')or(eq13='1' and eqf1='0')) then nstate<=mem3_i;else if req1='1' and id1="10" and (not((eq12='1' and grant2='1')or(eq13='1' and grant3='1'))) and ((eq12='0' and eq13='0')or(eq12='1' and eqf1='0')or(eq13='1' and eqf1='0')) then nstate<=mem2_i;else if req1='1' and id1="01" and (not((eq12='1' and grant2='1')or(eq13='1' and grant3='1'))) and ((eq12='0' and eq13='0')or(eq12='1' and eqf1='0')or(eq13='1' and eqf1='0')) then nstate<=mem1_i;else nstate<=initial;end if;end if;end if;
when mem1_i =>nstate<=mem1;
when mem1   =>if req1='1' then nstate<=mem1;else nstate<=initial;end if;
when mem2_i =>nstate<=mem2;
when mem2   =>if req1='1' then nstate<=mem2;else nstate<=initial;end if;
when mem3_i =>nstate<=mem3;
when mem3   =>if req1='1' then nstate<=mem3;else nstate<=initial;end if;
end case;
end process;
--output logic
process(pstate,read1,nstate) begin
case pstate is
when initial=>grant1<='0';enf1<='0';setCross<=(others=>'0');rstCross<=(others=>'0');setDiru<=(others=>'0');rstDiru<=(others=>'0');setDirl<=(others=>'0');rstDirl<=(others=>'0');
when mem1_i =>grant1<='1';enf1<='1';setCross<="100";rstCross<="011";setDiru(2)<=read1;setDiru(1 downto 0)<=(others=>'0');rstDiru(2)<=not read1;rstDiru(1 downto 0)<=(others=>'0');setDirl(2)<=read1;setDirl(1 downto 0)<=(others=>'0');rstDirl(2)<=not read1;rstDirl(1 downto 0)<=(others=>'0');
when mem1   =>grant1<='1';enf1<='0';setCross<=(others=>'0');rstCross(1 downto 0)<=(others=>'0');if(nstate=initial) then rstCross(2)<='1';else rstCross(2)<='0';end if;setDiru<=(others=>'0');rstDiru<=(others=>'0');setDirl<=(others=>'0');rstDirl<=(others=>'0');
when mem2_i =>grant1<='1';enf1<='1';setCross<="010";rstCross<="101";setDiru(1)<=read1;setDiru(2)<='0';setDiru(0)<='0';rstDiru(1)<=not read1;rstDiru(2)<='0';rstDiru(0)<='0';setDirl(2 downto 1)<=read1&read1;setDirl(0)<='0';rstDirl(2 downto 1)<=(not read1)&(not read1);rstDirl(0)<='0';
when mem2   =>grant1<='1';enf1<='0';setCross<=(others=>'0');rstCross(2)<='0';rstCross(0)<='0';if(nstate=initial) then rstCross(1)<='1';else rstCross(1)<='0';end if;setDiru<=(others=>'0');rstDiru<=(others=>'0');setDirl<=(others=>'0');rstDirl<=(others=>'0');
when mem3_i =>grant1<='1';enf1<='1';setCross<="001";rstCross<="110";setDiru(0)<=read1;setDiru(2 downto 1)<=(others=>'0');rstDiru(0)<=not read1;rstDiru(2 downto 1)<=(others=>'0');setDirl(2 downto 0)<=read1&read1&read1;rstDirl(2 downto 0)<=(not read1)&(not read1)&(not read1);
when mem3   =>grant1<='1';enf1<='0';setCross<=(others=>'0');rstCross(2 downto 1)<=(others=>'0');if(nstate=initial) then rstCross(0)<='1';else rstCross(0)<='0';end if;setDiru<=(others=>'0');rstDiru<=(others=>'0');setDirl<=(others=>'0');rstDirl<=(others=>'0');
end case;
end process;
end Behavioral;