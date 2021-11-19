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
signal en_tab1:std_logic_vector(2 downto 0);
signal en_tab2:std_logic_vector(5 downto 0);
signal en_tab3,en_tab:std_logic_vector(8 downto 0);
signal eq12,eq13,eq23,grt1,grt2,grt3:std_logic;
begin
u0:entity work.datapathArbiter port map(id1,id2,id3,en_tab,rst,clk,read1,read2,read3,eq12,eq13,eq23,q_cross,q_diru,q_dirl);
u1:entity work.controller1Arbiter port map(rst,clk,req1,id1,eq12,eq13,grt2,grt3,grt1,en_tab1);
u2:entity work.controller2Arbiter port map(rst,clk,req2,id2,eq12,eq23,grt1,grt3,grt2,en_tab2);
u3:entity work.controller3Arbiter port map(rst,clk,req3,id3,eq13,eq23,grt1,grt2,grt3,en_tab3);
en_tab(8 downto 6)<=en_tab3(8 downto 6);
en_tab(5 downto 3)<=en_tab3(5 downto 3) or en_tab2(5 downto 3);
en_tab(2 downto 0)<=en_tab3(2 downto 0) or en_tab2(2 downto 0) or en_tab1(2 downto 0);
grant1<=grt1;
grant2<=grt2;
grant3<=grt3;
end Behavioral;
