
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity wrapper is
Port ( id : in  STD_LOGIC_VECTOR (1 downto 0);
           BL : in  STD_LOGIC_VECTOR (2 downto 0);
           rwb : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           grant : in  STD_LOGIC;
           add : in  STD_LOGIC_VECTOR (7 downto 0);
           Eadd : out  STD_LOGIC_VECTOR (7 downto 0);
           req : out  STD_LOGIC;
           en_mem : out  STD_LOGIC;
           rread : out  STD_LOGIC;
           wwrite : out  STD_LOGIC;
           q_ptr : out  STD_LOGIC_VECTOR (7 downto 0));
end wrapper;

architecture Behavioral of wrapper is
signal count,rq,inc_ptr,clr,eq:std_logic;
begin
u0:entity work.datapathWrapper port map(id,BL,count,rwb,rq,inc_ptr,rst,clk,clr,add,Eadd,eq,req,rread,wwrite,q_ptr);
u1:entity work.controllerWrapper port map(clk,rst,grant,eq,clr,en_mem,rq,count,inc_ptr);
end Behavioral;

