library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity datapathWrapper is
    Port ( id : in  STD_LOGIC_VECTOR (1 downto 0);
           BL : in  STD_LOGIC_VECTOR (2 downto 0);
           count : in  STD_LOGIC;
           rwb : in  STD_LOGIC;
           rq : in  STD_LOGIC;
           inc_ptr : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           add : in  STD_LOGIC_VECTOR (7 downto 0);
           Eadd : out  STD_LOGIC_VECTOR (7 downto 0);
           eq : out  STD_LOGIC;
           req : out  STD_LOGIC;
           rread : out  STD_LOGIC;
           wwrite : out  STD_LOGIC;
           q_ptr : out  STD_LOGIC_VECTOR (7 downto 0));
end datapathWrapper;

architecture Behavioral of datapathWrapper is
signal t1:STD_LOGIC_VECTOR(2 downto 0);
signal t2:STD_LOGIC_VECTOR(7 downto 0);
signal t3,t4:STD_LOGIC;
begin
u0:entity work.counter3 port map(clk,t3,count,t1);
u1:entity work.comp3 port map(BL,t1,eq);
u2:entity work.adder8 port map(add,t2,Eadd);
u3:entity work.ptr8 port map(t4,rst,clk,q_ptr);
u4:entity work.dec port map(rwb,rread,wwrite);
t2<="00000"&t1;
t3<=rst or clr;
t4<=(id(0) nor id(1)) or inc_ptr;
req<=rq and (id(0) or id(1));
end Behavioral;

