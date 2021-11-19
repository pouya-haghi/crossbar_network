library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity arbiter is
Port ( id1 : in  STD_LOGIC_VECTOR (1 downto 0);
           id2 : in  STD_LOGIC_VECTOR (1 downto 0);
           id3 : in  STD_LOGIC_VECTOR (1 downto 0);
		   rst : in  STD_LOGIC;
		   clk : in  STD_LOGIC;
           read1 : in  STD_LOGIC;
           read2 : in  STD_LOGIC;
           read3 : in  STD_LOGIC;
           req1 : in  STD_LOGIC;
           req2 : in  STD_LOGIC;
           req3 : in  STD_LOGIC;
           grant1 : out  STD_LOGIC;
           grant2 : out  STD_LOGIC;
           grant3 : out  STD_LOGIC;
           q_cross : out  STD_LOGIC_VECTOR (8 downto 0);
           q_diru : out  STD_LOGIC_VECTOR (8 downto 0);
		   q_dirl : out  STD_LOGIC_VECTOR (8 downto 0));
end arbiter;

architecture Behavioral of arbiter is
signal setCross1,rstCross1,setDiru1,rstDiru1,setDirl1,rstDirl1:std_logic_vector(2 downto 0);
signal setCross2,rstCross2,setDiru2,rstDiru2,setDirl2,rstDirl2:std_logic_vector(5 downto 0);
signal setCross,rstCross,setDiru,rstDiru,setDirl,rstDirl,setCross3,rstCross3,setDiru3,rstDiru3,setDirl3,rstDirl3:std_logic_vector(8 downto 0);
signal eq12,eq13,eq23,grt1,grt2,grt3,enf1,enf2,eqf1,eqf2:std_logic;
begin
u0:entity work.datapathArbiter port map(id1,id2,id3,setCross,rstCross,setDiru,rstDiru,setDirl,rstDirl,rst,clk,enf1,enf2,read1,read2,read3,eq12,eq13,eq23,eqf1,eqf2,q_cross,q_diru,q_dirl);
u1:entity work.controller1Arbiter port map(rst,clk,read1,eqf1,req1,id1,eq12,eq13,grt2,grt3,grt1,enf1,setCross1,rstCross1,setDiru1,rstDiru1,setDirl1,rstDirl1);
u2:entity work.controller2Arbiter port map(rst,clk,req2,read2,id2,eq12,eq23,eqf1,eqf2,grt1,grt3,grt2,enf2,setCross2,rstCross2,setDiru2,rstDiru2,setDirl2,rstDirl2);
u3:entity work.controller3Arbiter port map(rst,clk,req3,read3,id3,eq13,eq23,eqf1,eqf2,grt1,grt2,grt3,setCross3,rstCross3,setDiru3,rstDiru3,setDirl3,rstDirl3);
setCross(8 downto 6)<=setCross3(8 downto 6);
setCross(5 downto 3)<=setCross3(5 downto 3) or setCross2(5 downto 3);
setCross(2 downto 0)<=setCross3(2 downto 0) or setCross2(2 downto 0) or setCross1(2 downto 0);
rstCross(8 downto 6)<=rstCross3(8 downto 6);
rstCross(5 downto 3)<=rstCross3(5 downto 3) or rstCross2(5 downto 3);
rstCross(2 downto 0)<=rstCross3(2 downto 0) or rstCross2(2 downto 0) or rstCross1(2 downto 0);
setdiru(8 downto 6)<=setdiru3(8 downto 6);
setdiru(5 downto 3)<=setdiru3(5 downto 3) or setdiru2(5 downto 3);
setdiru(2 downto 0)<=setdiru3(2 downto 0) or setdiru2(2 downto 0) or setdiru1(2 downto 0);
rstdiru(8 downto 6)<=rstdiru3(8 downto 6);
rstdiru(5 downto 3)<=rstdiru3(5 downto 3) or rstdiru2(5 downto 3);
rstdiru(2 downto 0)<=rstdiru3(2 downto 0) or rstdiru2(2 downto 0) or rstdiru1(2 downto 0);
setdirl(8 downto 6)<=setdirl3(8 downto 6);
setdirl(5 downto 3)<=setdirl3(5 downto 3) or setdirl2(5 downto 3);
setdirl(2 downto 0)<=setdirl3(2 downto 0) or setdirl2(2 downto 0) or setdirl1(2 downto 0);
rstdirl(8 downto 6)<=rstdirl3(8 downto 6);
rstdirl(5 downto 3)<=rstdirl3(5 downto 3) or rstdirl2(5 downto 3);
rstdirl(2 downto 0)<=rstdirl3(2 downto 0) or rstdirl2(2 downto 0) or rstdirl1(2 downto 0);
grant1<=grt1;
grant2<=grt2;
grant3<=grt3;
end Behavioral;
