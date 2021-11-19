library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use STD.TEXTIO.ALL;
use IEEE.std_logic_TEXTIO.ALL;
use IEEE.std_logic_unsigned.ALL;
USE ieee.numeric_std.ALL;
 use work.utilities.all;

entity procModel1 is
    Port ( ptr : in  STD_LOGIC_VECTOR (7 downto 0);
           data : inout  STD_LOGIC_VECTOR (7 downto 0);
           add : out  STD_LOGIC_VECTOR (7 downto 0);
		   rwb: out std_logic;
		   BL: out std_logic_vector(2 downto 0);
           id : out  STD_LOGIC_VECTOR (1 downto 0));
end procModel1;

architecture Behavioral of procModel1 is
file task1:text open read_mode is "task1.dat";
type mem is array (1023 downto 0) of std_logic_vector(21 downto 0);
signal mymem:mem;
procedure getData(signal target:out mem) is
variable lbuf:line;
variable bufs:std_logic_vector(21 downto 0);
variable i:integer:=0;
begin
while not endfile(task1) loop
readline(task1,lbuf);
read(lbuf,bufs);
target(i)<=bufs;
i:=i+1;
end loop;
file_close(task1);
end procedure getData;
begin
process (ptr) 
variable temp:std_logic_vector(21 downto 0);
begin
temp:=mymem(conv_integer(ptr));
BL<=temp(2 downto 0);
rwb<=temp(3);
id<=temp(5 downto 4);
add<=temp(13 downto 6);
if temp(3)='0' then data<=temp(21 downto 14); else data<=(others=>'Z');end if;
end process;
getData(mymem);
--BL<=mymem(conv_integer(ptr))(2 downto 0);
--rwb<=mymem(conv_integer(ptr))(3);
--id<=mymem(conv_integer(ptr))(5 downto 4);
--add<=mymem(conv_integer(ptr))(13 downto 6);
--data<=mymem(conv_integer(ptr))(21 downto 14) when mymem(conv_integer(ptr))(3)='0' else (others=>'Z');
end Behavioral;
------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use STD.TEXTIO.ALL;
use IEEE.std_logic_TEXTIO.ALL;
use IEEE.std_logic_unsigned.ALL;
USE ieee.numeric_std.ALL;
 use work.utilities.all;

entity procModel2 is
    Port ( ptr : in  STD_LOGIC_VECTOR (7 downto 0);
           data : inout  STD_LOGIC_VECTOR (7 downto 0);
           add : out  STD_LOGIC_VECTOR (7 downto 0);
		   rwb: out std_logic;
		   BL: out std_logic_vector(2 downto 0);
           id : out  STD_LOGIC_VECTOR (1 downto 0));
end procModel2;

architecture Behavioral of procModel2 is
file task1:text open read_mode is "task2.dat";
type mem is array (1023 downto 0) of std_logic_vector(21 downto 0);
signal mymem:mem;
procedure getData(signal target:out mem) is
variable lbuf:line;
variable bufs:std_logic_vector(21 downto 0);
variable i:integer:=0;
begin
while not endfile(task1) loop
readline(task1,lbuf);
read(lbuf,bufs);
target(i)<=bufs;
i:=i+1;
end loop;
file_close(task1);
end procedure getData;
begin
process (ptr) 
variable temp:std_logic_vector(21 downto 0);
begin
temp:=mymem(conv_integer(ptr));
BL<=temp(2 downto 0);
rwb<=temp(3);
id<=temp(5 downto 4);
add<=temp(13 downto 6);
if temp(3)='0' then data<=temp(21 downto 14); else data<=(others=>'Z');end if;
end process;
getData(mymem);
--BL<=mymem(conv_integer(ptr))(2 downto 0);
--rwb<=mymem(conv_integer(ptr))(3);
--id<=mymem(conv_integer(ptr))(5 downto 4);
--add<=mymem(conv_integer(ptr))(13 downto 6);
--data<=mymem(conv_integer(ptr))(21 downto 14) when mymem(conv_integer(ptr))(3)='0' else (others=>'Z');
end Behavioral;
------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use STD.TEXTIO.ALL;
use IEEE.std_logic_TEXTIO.ALL;
use IEEE.std_logic_unsigned.ALL;
USE ieee.numeric_std.ALL;
 use work.utilities.all;

entity procModel3 is
    Port ( ptr : in  STD_LOGIC_VECTOR (7 downto 0);
           data : inout  STD_LOGIC_VECTOR (7 downto 0);
           add : out  STD_LOGIC_VECTOR (7 downto 0);
		   rwb: out std_logic;
		   BL: out std_logic_vector(2 downto 0);
           id : out  STD_LOGIC_VECTOR (1 downto 0));
end procModel3;

architecture Behavioral of procModel3 is
file task1:text open read_mode is "task3.dat";
type mem is array (1023 downto 0) of std_logic_vector(21 downto 0);
signal mymem:mem;
procedure getData(signal target:out mem) is
variable lbuf:line;
variable bufs:std_logic_vector(21 downto 0);
variable i:integer:=0;
begin
while not endfile(task1) loop
readline(task1,lbuf);
read(lbuf,bufs);
target(i)<=bufs;
i:=i+1;
end loop;
file_close(task1);
end procedure getData;
begin
process (ptr) 
variable temp:std_logic_vector(21 downto 0);
begin
temp:=mymem(conv_integer(ptr));
BL<=temp(2 downto 0);
rwb<=temp(3);
id<=temp(5 downto 4);
add<=temp(13 downto 6);
if temp(3)='0' then data<=temp(21 downto 14); else data<=(others=>'Z');end if;
end process;
getData(mymem);
--BL<=mymem(conv_integer(ptr))(2 downto 0);
--rwb<=mymem(conv_integer(ptr))(3);
--id<=mymem(conv_integer(ptr))(5 downto 4);
--add<=mymem(conv_integer(ptr))(13 downto 6);
--data<=mymem(conv_integer(ptr))(21 downto 14) when mymem(conv_integer(ptr))(3)='0' else (others=>'Z');
end Behavioral;
------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use STD.TEXTIO.ALL;
use IEEE.std_logic_TEXTIO.ALL;
use IEEE.std_logic_unsigned.ALL;
 use work.utilities.all;
 
  ENTITY testCrossBar IS
  END testCrossBar;

  ARCHITECTURE timed OF testCrossBar IS 
          SIGNAL rwb1,rwb2,rwb3,rst,clk,grant1,grant2,grant3,req1,req2,req3 :  std_logic;
          SIGNAL id1,id2,id3 :  std_logic_vector(1 downto 0);
          SIGNAL BL1,BL2,BL3 :  std_logic_vector(2 downto 0);
          SIGNAL ptr1,ptr2,ptr3,add1,add2,add3 :  std_logic_vector(7 downto 0);      
          SIGNAL cross,diru,dirl :  std_logic_vector(8 downto 0);      
          SIGNAL packa,packb,packc,packd,packe,packf,packg,packh,packi,packj,packk,packl,packm1,packm2,packm3,packp1,packp2,packp3:packet;      
          SIGNAL dataa,datab,datac,datad,datae,dataf,datag,datah,datai,dataj,datak,datal,datam1,datam2,datam3,datap1,datap2,datap3:std_logic_vector(7 downto 0);      
  BEGIN

uu0: entity work.procModel1 port map (ptr=>ptr1,data=>datap1,add=>add1,rwb=>rwb1,BL=>BL1,id=>id1);
uu1: entity work.procModel2 port map (ptr=>ptr2,data=>datap2,add=>add2,rwb=>rwb2,BL=>BL2,id=>id2);
uu2: entity work.procModel3 port map (ptr=>ptr3,data=>datap3,add=>add3,rwb=>rwb3,BL=>BL3,id=>id3);
uu3: entity work.wrapper port map (id=>id1,BL=>BL1,rwb=>rwb1,rst=>rst,clk=>clk,grant=>grant1,add=>add1,Eadd=>packp1.add,req=>req1,en_mem=>packp1.en,rread=>packp1.rread,wwrite=>packp1.wwrite,q_ptr=>ptr1);
uu4: entity work.wrapper port map (id=>id2,BL=>BL2,rwb=>rwb2,rst=>rst,clk=>clk,grant=>grant2,add=>add2,Eadd=>packp2.add,req=>req2,en_mem=>packp2.en,rread=>packp2.rread,wwrite=>packp2.wwrite,q_ptr=>ptr2);
uu5: entity work.wrapper port map (id=>id3,BL=>BL3,rwb=>rwb3,rst=>rst,clk=>clk,grant=>grant3,add=>add3,Eadd=>packp3.add,req=>req3,en_mem=>packp3.en,rread=>packp3.rread,wwrite=>packp3.wwrite,q_ptr=>ptr3);
uu6: entity work.mem port map (clk=>clk,data=>datam1,pack=>packm1);
uu7: entity work.mem port map (clk=>clk,data=>datam2,pack=>packm2);
uu8: entity work.mem port map (clk=>clk,data=>datam3,pack=>packm3);
uu9: entity work.arbiter port map (id1=>id1,id2=>id2,id3=>id3,rst=>rst,clk=>clk,read1=>packp1.rread,read2=>packp2.rread,read3=>packp3.rread,req1=>req1,req2=>req2,req3=>req3,grant1=>grant1,grant2=>grant2,grant3=>grant3,q_cross=>cross,q_diru=>diru,q_dirl=>dirl);
uu10: entity work.switchBox port map(cross=>cross(0),diru=>diru(0),dirl=>dirl(0),lef=>dataa,righ=>open,up=>datam3,down=>datag,packLeft=>packa,packRight=>open,packUp=>packm3,packDown=>packg);
uu11: entity work.switchBox port map(cross=>cross(1),diru=>diru(1),dirl=>dirl(1),lef=>datab,righ=>dataa,up=>datam2,down=>datah,packLeft=>packb,packRight=>packa,packUp=>packm2,packDown=>packh);
uu12: entity work.switchBox port map(cross=>cross(2),diru=>diru(2),dirl=>dirl(2),lef=>datap1,righ=>datab,up=>datam1,down=>datai,packLeft=>packp1,packRight=>packb,packUp=>packm1,packDown=>packi);
uu13: entity work.switchBox port map(cross=>cross(3),diru=>diru(3),dirl=>dirl(3),lef=>datac,righ=>open,up=>datag,down=>dataj,packLeft=>packc,packRight=>open,packUp=>packg,packDown=>packj);
uu14: entity work.switchBox port map(cross=>cross(4),diru=>diru(4),dirl=>dirl(4),lef=>datad,righ=>datac,up=>datah,down=>datak,packLeft=>packd,packRight=>packc,packUp=>packh,packDown=>packk);
uu15: entity work.switchBox port map(cross=>cross(5),diru=>diru(5),dirl=>dirl(5),lef=>datap2,righ=>datad,up=>datai,down=>datal,packLeft=>packp2,packRight=>packd,packUp=>packi,packDown=>packl);
uu16: entity work.switchBox port map(cross=>cross(6),diru=>diru(6),dirl=>dirl(6),lef=>datae,righ=>open,up=>dataj,down=>open,packLeft=>packe,packRight=>open,packUp=>packj,packDown.add=>(others=>'Z'),packDown.rread=>'Z',packDown.wwrite=>'Z',packDown.en=>'Z');
uu17: entity work.switchBox port map(cross=>cross(7),diru=>diru(7),dirl=>dirl(7),lef=>dataf,righ=>datae,up=>datak,down=>open,packLeft=>packf,packRight=>packe,packUp=>packk,packDown.add=>(others=>'Z'),packDown.rread=>'Z',packDown.wwrite=>'Z',packDown.en=>'Z');
uu18: entity work.switchBox port map(cross=>cross(8),diru=>diru(8),dirl=>dirl(8),lef=>datap3,righ=>dataf,up=>datal,down=>open,packLeft=>packp3,packRight=>packf,packUp=>packl,packDown.add=>(others=>'Z'),packDown.rread=>'Z',packDown.wwrite=>'Z',packDown.en=>'Z');

  --  clock generation:
  CG:process 
  begin 
  clk<='0';
  wait for 10 ns;
  clk<='1';
  wait for 10 ns;
  end process CG;
  --  Test Bench Statements
     tb : PROCESS
     BEGIN
		rst<='0','1' after 5 ns,'0' after 40 ns;
		
        wait; -- will wait forever
     END PROCESS tb;
  END architecture timed;
