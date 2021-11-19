library IEEE;
use IEEE.STD_LOGIC_1164.all;

package utilities is

type packet is record
		   add :   STD_LOGIC_VECTOR (7 downto 0);
           rread :  STD_LOGIC;
           wwrite :  STD_LOGIC;
           en :  STD_LOGIC;
end record packet;

end package utilities;
