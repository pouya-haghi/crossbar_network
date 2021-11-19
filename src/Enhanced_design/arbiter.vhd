library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity datapathArbiter is
    Port ( id1 : in  STD_LOGIC_VECTOR (1 downto 0);
           id2 : in  STD_LOGIC_VECTOR (1 downto 0);
           id3 : in  STD_LOGIC_VECTOR (1 downto 0);
           setCross : in  STD_LOGIC_VECTOR (8 downto 0);
           rstCross : in  STD_LOGIC_VECTOR (8 downto 0);
           setDiru : in  STD_LOGIC_VECTOR (8 downto 0);
           rstDiru : in  STD_LOGIC_VECTOR (8 downto 0);
           setDirl : in  STD_LOGIC_VECTOR (8 downto 0);
           rstDirl : in  STD_LOGIC_VECTOR (8 downto 0);
		   rst : in  STD_LOGIC;
		   clk : in  STD_LOGIC;
		   enf1 : in  STD_LOGIC;
		   enf2 : in  STD_LOGIC;
           read1 : in  STD_LOGIC;
           read2 : in  STD_LOGIC;
           read3 : in  STD_LOGIC;
           eq12 : out  STD_LOGIC;
           eq13 : out  STD_LOGIC;
           eq23 : out  STD_LOGIC;
           eqf1 : out  STD_LOGIC;
           eqf2 : out  STD_LOGIC;
           q_cross : out  STD_LOGIC_VECTOR (8 downto 0);
           q_diru : out  STD_LOGIC_VECTOR (8 downto 0);
		   q_dirl : out  STD_LOGIC_VECTOR (8 downto 0));
end datapathArbiter;

architecture Behavioral of datapathArbiter is
component reg port(
           set : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           q : out  STD_LOGIC);
end component reg;
signal id1_q,id2_q,t1: std_logic_vector(1 downto 0);
signal mrstCross,mrstDirl,mrstDiru: std_logic_vector(8 downto 0);
signal eq23_t: std_logic;
begin
u0to8a: for i in 0 to 8 generate
ux:reg port map(setCross(i),mrstCross(i),clk,q_cross(i));
end generate u0to8a;
u0to8b: for j in 0 to 8 generate
ux:reg port map(setDiru(j),mrstDiru(j),clk,q_Diru(j));
end generate u0to8b;
u0to8c: for k in 0 to 8 generate
ux:reg port map(setDirl(k),mrstDirl(k),clk,q_Dirl(k));
end generate u0to8c;
--u0: entity work.reg3 port map(cross(0)&diru(0)&dirl(0),en_tab(0),rst,clk,q_cross(0)&q_diru(0)&q_dirl(0));
u9: entity work.comp2 port map(id1,id2,eq12);
u10: entity work.comp2 port map(id2,id3,eq23_t);
u11: entity work.comp2 port map(id1,id3,eq13);
u12: entity work.reg2 port map(id1,enf1,rst,clk,id1_q);
u13: entity work.reg2 port map(id2,enf2,rst,clk,id2_q);
u14: entity work.comp2 port map(id1,id1_q,eqf1);
u15: entity work.comp2 port map(id2_q,t1,eqf2);
u16: entity work.mux2 port map(id1,id2,eq23_t,t1);
eq23<=eq23_t;
mrstCross(8)<=rstCross(8) or rst;
mrstCross(7)<=rstCross(7) or rst;
mrstCross(6)<=rstCross(6) or rst;
mrstCross(5)<=rstCross(5) or rst;
mrstCross(4)<=rstCross(4) or rst;
mrstCross(3)<=rstCross(3) or rst;
mrstCross(2)<=rstCross(2) or rst;
mrstCross(1)<=rstCross(1) or rst;
mrstCross(0)<=rstCross(0) or rst;
mrstDirl(8)<=rstDirl(8) or rst;
mrstDirl(7)<=rstDirl(7) or rst;
mrstDirl(6)<=rstDirl(6) or rst;
mrstDirl(5)<=rstDirl(5) or rst;
mrstDirl(4)<=rstDirl(4) or rst;
mrstDirl(3)<=rstDirl(3) or rst;
mrstDirl(2)<=rstDirl(2) or rst;
mrstDirl(1)<=rstDirl(1) or rst;
mrstDirl(0)<=rstDirl(0) or rst;
mrstDiru(8)<=rstDiru(8) or rst;
mrstDiru(7)<=rstDiru(7) or rst;
mrstDiru(6)<=rstDiru(6) or rst;
mrstDiru(5)<=rstDiru(5) or rst;
mrstDiru(4)<=rstDiru(4) or rst;
mrstDiru(3)<=rstDiru(3) or rst;
mrstDiru(2)<=rstDiru(2) or rst;
mrstDiru(1)<=rstDiru(1) or rst;
mrstDiru(0)<=rstDiru(0) or rst;
end Behavioral;