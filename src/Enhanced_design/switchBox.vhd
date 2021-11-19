library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.utilities.all;

entity switchBox is
    Port ( cross : in  STD_LOGIC;
           diru : in  STD_LOGIC;
           dirl : in  STD_LOGIC;
           lef : inout  STD_LOGIC_VECTOR (7 downto 0);
           righ : inout  STD_LOGIC_VECTOR (7 downto 0);
           up : inout  STD_LOGIC_VECTOR (7 downto 0);
           down : inout  STD_LOGIC_VECTOR (7 downto 0);
		   packLeft : in packet;
		   packRight :out packet;
		   packUp :out packet;
		   packDown :in packet);
end switchBox;

architecture Behavioral of switchBox is

begin
process (diru,dirl,cross,lef,righ,up,down)
begin
if cross='0' then if dirl='1' then lef<=righ;righ<=(others=>'Z');else righ<=lef;lef<=(others=>'Z');end if;
				  if diru='1' then down<=up;up<=(others=>'Z');else up<=down;down<=(others=>'Z');end if;
else              if dirl='1' then lef<=up;down<=up;righ<=(others=>'Z');up<=(others=>'Z');else up<=lef;righ<=lef;down<=(others=>'Z');lef<=(others=>'Z');end if;
end if;
end process;
packRight<=packLeft;
packUp<=packDown when cross='0' else packLeft;
end Behavioral;

