library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity datapathArbiter is
    Port ( id1 : in  STD_LOGIC_VECTOR (1 downto 0);
           id2 : in  STD_LOGIC_VECTOR (1 downto 0);
           id3 : in  STD_LOGIC_VECTOR (1 downto 0);
           en_tab : in  STD_LOGIC_VECTOR (8 downto 0);
		   rst : in  STD_LOGIC;
		   clk : in  STD_LOGIC;
           read1 : in  STD_LOGIC;
           read2 : in  STD_LOGIC;
           read3 : in  STD_LOGIC;
           eq12 : out  STD_LOGIC;
           eq13 : out  STD_LOGIC;
           eq23 : out  STD_LOGIC;
           q_cross : out  STD_LOGIC_VECTOR (8 downto 0);
           q_diru : out  STD_LOGIC_VECTOR (8 downto 0);
		   q_dirl : out  STD_LOGIC_VECTOR (8 downto 0));
end datapathArbiter;

architecture Behavioral of datapathArbiter is
component reg port(d : in  STD_LOGIC;
           en : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           q : out  STD_LOGIC);
end component reg;
signal cross,dirl,diru: std_logic_vector(8 downto 0);
begin
u0to8a: for i in 0 to 8 generate
ux:reg port map(cross(i),en_tab(i),rst,clk,q_cross(i));
end generate u0to8a;
u0to8b: for j in 0 to 8 generate
ux:reg port map(diru(j),en_tab(j),rst,clk,q_diru(j));
end generate u0to8b;
u0to8c: for k in 0 to 8 generate
ux:reg port map(dirl(k),en_tab(k),rst,clk,q_dirl(k));
end generate u0to8c;
--u0: entity work.reg3 port map(cross(0)&diru(0)&dirl(0),en_tab(0),rst,clk,q_cross(0)&q_diru(0)&q_dirl(0));
u9: entity work.comp2 port map(id1,id2,eq12);
u10: entity work.comp2 port map(id2,id3,eq23);
u11: entity work.comp2 port map(id1,id3,eq13);
u12:entity work.crossGen port map(id1,id2,id3,cross);
u13:entity work.dirGen port map(id1,id2,id3,read1,read2,read3,dirl,diru);
end Behavioral;