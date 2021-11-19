library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dirGen is
    Port ( id1 : in  STD_LOGIC_VECTOR (1 downto 0);
           id2 : in  STD_LOGIC_VECTOR (1 downto 0);
           id3 : in  STD_LOGIC_VECTOR (1 downto 0);
           read1 : in  STD_LOGIC;
           read2 : in  STD_LOGIC;
           read3 : in  STD_LOGIC;
           y0 : out  STD_LOGIC_VECTOR (8 downto 0);
		   y1 : out  STD_LOGIC_VECTOR (8 downto 0));
end dirGen;

architecture Behavioral of dirGen is
begin
--but in this module we do worry about conflicing as it may happen conflicted part have different direction
--as an instance one says I'm in read mode while other one says I'm in write mode 
y1(0)<=read1 when id1="11" else read2 when id2="11" else read3 when id3="11" else '1';
y1(1)<=read1 when id1="10" else read2 when id2="10" else read3 when id3="10" else '1';
y1(2)<=read1 when id1="01" else read2 when id2="01" else read3 when id3="01" else '1';
y1(3)<=read2 when id2="11" else read3 when id3="11" else '1';
y1(4)<=read2 when id2="10" else read3 when id3="10" else '1';
y1(5)<=read2 when id2="01" else read3 when id3="01" else '1';
y1(6)<=read3 when id3="11" else '1';
y1(7)<=read3 when id3="10" else '1';
y1(8)<=read3 when id3="01" else '1';

process(id1,id2,id3,read1,read2,read3)
begin
case id1 is
when "11"   =>y0(2 downto 0)<=(read1&read1&read1);
when "10"   =>y0(2 downto 1)<=(read1&read1);y0(0)<='1';
when "01"   =>y0(2)<=read1;y0(1 downto 0)<="11";
when others =>y0(2 downto 0)<="111";
end case;
case id2 is
when "11"   => y0(5 downto 3)<=(read2&read2&read2);
when "10"   =>y0(5 downto 4)<=(read2&read2);y0(3)<='1';
when "01"   =>y0(5)<=read2;y0(4 downto 3)<="11";
when others =>y0(5 downto 3)<="111";
end case;
case id3 is
when "11"   => y0(8 downto 6)<=(read3&read3&read3);
when "10"   =>y0(8 downto 7)<=(read3&read3);y0(6)<='1';
when "01"   =>y0(8)<=read3;y0(7 downto 6)<="11";
when others =>y0(8 downto 6)<="111";
end case;
end process;

end Behavioral;

