----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 03:21:59 PM
-- Design Name: 
-- Module Name: processor - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity processor is
  Port ( 
  Clk_in : in std_logic;
  Res : in std_logic;
  ZF : out std_logic;
  V : out std_logic;

  segOut : out std_logic_vector(6 downto 0);
  Anode : out std_logic_vector(3 downto 0) 
  );
end processor;

architecture Behavioral of processor is
component Slow_Clk
    Port ( Clk_in : in STD_LOGIC;
       Clk_out : out STD_LOGIC);
end component;
component SevenSeg2
    Port ( address : in STD_LOGIC;
       data : out STD_LOGIC_VECTOR (6 downto 0));
end component;
component SevenSeg
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
       data : out STD_LOGIC_VECTOR (6 downto 0));
end component;
component Reg_3B
   Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
        En : in STD_LOGIC;
        Clk : in STD_LOGIC;
        Res : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR (2 downto 0));
 end component;
component ID
    Port ( RCJ : in STD_LOGIC_VECTOR (3 downto 0);
       I : in STD_LOGIC_VECTOR (11 downto 0);
       Ren : out STD_LOGIC_VECTOR (2 downto 0);
       LoadS : out STD_LOGIC;
       IV : out STD_LOGIC_VECTOR (3 downto 0);
       RSA : out STD_LOGIC_VECTOR (2 downto 0);
       RSB : out STD_LOGIC_VECTOR (2 downto 0);
       M : out STD_LOGIC;
       JF : out STD_LOGIC;
       Address : out STD_LOGIC_VECTOR (2 downto 0));
  end component;
  component Reg_Bank
      Port ( RegSel : in STD_LOGIC_VECTOR (2 downto 0);
         D : in STD_LOGIC_VECTOR (3 downto 0);
         Res : in std_logic;
         Q0 : out STD_LOGIC_VECTOR (3 downto 0);
         Q1 : out STD_LOGIC_VECTOR (3 downto 0);
         Q2 : out STD_LOGIC_VECTOR (3 downto 0);
         Q3 : out STD_LOGIC_VECTOR (3 downto 0);
         Q4 : out STD_LOGIC_VECTOR (3 downto 0);
         Q5 : out STD_LOGIC_VECTOR (3 downto 0);
         Q6 : out STD_LOGIC_VECTOR (3 downto 0);
         Q7 : out STD_LOGIC_VECTOR (3 downto 0);
         Clk : in STD_LOGIC);
    end component;
    component ROM
        Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (11 downto 0));
    end component;
    component B3_Add
        Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           C_out : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (2 downto 0)
        );
    end component;
    component RCA_4
        Port ( A : in  STD_LOGIC_VECTOR ( 3 downto 0);
            B : in STD_LOGIC_VECTOR ( 3 downto 0);
           C_out : out STD_LOGIC;
            S : out STD_LOGIC_VECTOR ( 3 downto 0);
           M : in STD_LOGIC;
           V : out STD_LOGIC;
           ZF : out STD_LOGIC);
   end component;
   component MP_2W3B
       Port ( SEL : in STD_LOGIC;
          A0 : in STD_LOGIC_VECTOR (2 downto 0);
          A1 : in STD_LOGIC_VECTOR (2 downto 0);
          X : out STD_LOGIC_VECTOR (2 downto 0));
   end component;
   component MP_2W4B
       Port ( SEL : in STD_LOGIC;
          A0 : in STD_LOGIC_VECTOR (3 downto 0);
          A1 : in STD_LOGIC_VECTOR (3 downto 0);
          X : out STD_LOGIC_VECTOR (3 downto 0));
   end component;
   component MP_8W4B
       Port ( SEL : in STD_LOGIC_VECTOR (2 downto 0);
          A0 : in STD_LOGIC_VECTOR (3 downto 0);
          A1 : in STD_LOGIC_VECTOR (3 downto 0);
          A2 : in STD_LOGIC_VECTOR (3 downto 0);
          A3 : in STD_LOGIC_VECTOR (3 downto 0);
          A4 : in STD_LOGIC_VECTOR (3 downto 0);
          A5 : in STD_LOGIC_VECTOR (3 downto 0);
          A6 : in STD_LOGIC_VECTOR (3 downto 0);
          A7 : in STD_LOGIC_VECTOR (3 downto 0);
          x  : out STD_LOGIC_VECTOR (3 downto 0));
   end component;
   signal I : std_logic_vector (11 downto 0);
   signal d,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,IV, OMA, OMB,OA : std_logic_vector (3 downto 0);
   signal Ren, RSA, RSB,JAddress,MemorySelect,B3OA  : std_logic_vector(2 downto 0);
   signal JF,ASelect, LS, ResIN,c_out_3b,En_3b,V0,ZF0,Clk : std_logic;
   signal MuxToPC : std_logic_vector(2 downto 0) := "000";
    signal    digit,sign : std_logic_vector(6 downto 0);
begin
ResIN <= Res;

En_3b <= '1';
Slow_Clk_0 : Slow_Clk
port map(
Clk_in => Clk_in,
Clk_out => Clk);

PC : Reg_3B
port map(
    D => MuxToPC,
    En => En_3b ,
    Res => ResIN ,
    Clk => Clk ,
    Q => MemorySelect 
);
PCAdder : B3_Add
port map(
    A => MemorySelect,
    C_out => c_out_3b,
    S => B3OA
);

MUX_2W3B : MP_2W3B
port map(
    SEL => JF,
    A0 => B3OA,
    A1 => JAddress,
    X => MuxToPC
);

ROM0 : ROM
port map(
    address => MemorySelect,
    data => I 
);

Instruction_Decoder : ID 
port map (
    RCJ => OMA,
    I => I,
    Ren => Ren,
    LoadS => LS,
    IV => IV,
    RSA => RSA,
    RSB => RSB,
    M => ASelect,
    JF => JF,
    Address => JAddress
);

Mux_2W4B : MP_2W4B
port map (
    SEL => LS,
    A1 => IV,
    A0 => OA,
    X => D
);

Register_Bank : Reg_Bank
port map (
    RegSel => Ren,
    D => D,
    Res => ResIN,
    Q0 => Q0,
    Q1 => Q1,
    Q2 => Q2,
    Q3 => Q3,
    Q4 => Q4,
    Q5 => Q5,
    Q6 => Q6,
    Q7 => Q7,
    Clk => Clk); 

Mux_8W4BA : MP_8W4B
port map(
    SEL => RSA,
    A0 => Q0,
    A1 => Q1,
    A2 => Q2,
    A3 => Q3,
    A4 => Q4,
    A5 => Q5,
    A6 => Q6,
    A7 => Q7,
    x => OMA
);
Mux_8W4BB : MP_8W4B
port map(
    SEL => RSB,
    A0 => Q0,
    A1 => Q1,
    A2 => Q2,
    A3 => Q3,
    A4 => Q4,
    A5 => Q5,
    A6 => Q6,
    A7 => Q7,
    x => OMB
);

Adder_substractor : RCA_4
port map(
    A => OMA,
    B => OMB,
    C_out => c_out_3b,
    S => OA,
    M => ASelect,
    V => V0,
    ZF => ZF0
);
sevenSeg_1 : SevenSeg
port map(
address => Q7(3 downto 1),
data => digit
);
sevenSeg_2 : SevenSeg2
port map(
address => ASelect,
data => sign
);
--process(ASelect,digit,sign)
-- begin
--if ( ASelect = '1') then
--    segOut <= sign;
--    Anode <= "1101";
--else 
--    segOut <= digit;
--    Anode <= "1110";
--end if;

--end process;
    segOut <= digit;
    Anode <= "1110";
ZF <= ZF0;
V <= '0';

end Behavioral;
