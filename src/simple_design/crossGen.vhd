
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity crossGen is
    Port ( id1 : in  STD_LOGIC_VECTOR (1 downto 0);
	id2 : in  STD_LOGIC_VECTOR (1 downto 0);
	id3 : in  STD_LOGIC_VECTOR (1 downto 0);
           y : out  STD_LOGIC_VECTOR (8 downto 0));
end crossGen;

architecture Behavioral of crossGen is

begin
process(id1,id2,id3) begin
--don't worry. Since even conflict occurs enables will not issue by the controller
case id1 is 
when "11" =>  y(2 downto 0)<="001";
when "10" => y(2 downto 0)<="010";
when "01" => y(2 downto 0)<="100";
when others  => y(2 downto 0)<=(others=>'0');
end case;

case id2 is 
when "11" => y(5 downto 3)<="001";
when "10" => y(5 downto 3)<="010";
when "01" => y(5 downto 3)<="100";
when others  => y(5 downto 3)<=(others=>'0');
end case;

case id3 is 
when "11" =>  y(8 downto 6)<="001";
when "10" => y(8 downto 6)<="010";
when "01" => y(8 downto 6)<="100";
when others  => y(8 downto 6)<=(others=>'0');
end case;
end process;

end Behavioral;

