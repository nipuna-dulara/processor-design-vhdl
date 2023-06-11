----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/31/2023 04:05:21 PM
-- Design Name: 
-- Module Name: Reg_Bank - Behavioral
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

entity Reg_Bank is
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
end Reg_Bank;

architecture Behavioral of Reg_Bank is
component Reg
    port(
        D : in STD_LOGIC_VECTOR (3 downto 0);
        En : in STD_LOGIC;
        Clk : in STD_LOGIC;
        Res : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR (3 downto 0)
    );
end component;
signal En : std_logic_vector(7 downto 0);
begin
    with RegSel select
    En <= "00000001" when "000",
          "00000010" when "001",
          "00000100" when "010",
          "00001000" when "011",
          "00010000" when "100",
          "00100000" when "101",
          "01000000" when "110",
          "10000000" when "111",
          "00000000" when others;
    Reg_0 : Reg
        port map(
        D => "0000",
        En => '0',
        Res => Res,
        Clk => Clk,
        Q => Q0
        );
    Reg_1 : Reg
        port map(
        D => D,
        En => En(1),
        Res => Res,
        Clk => Clk,
        Q => Q1
        );
    Reg_2 : Reg
        port map(
        D => D,
        En => En(2),
        Res => Res,
        Clk => Clk,
        Q => Q2
        );
    Reg_3 : Reg
        port map(
        D => D,
        En => En(3),
        Res => Res,
        Clk => Clk,
        Q => Q3
        );
    Reg_4 : Reg
        port map(
        D => D,
        En => En(4),
        Res => Res,
        Clk => Clk,
        Q => Q4
        );     
    Reg_5 : Reg
        port map(
        D => D,
        En => En(5),
        Res => Res,
        Clk => Clk,
        Q => Q5
        );    
    Reg_6 : Reg
        port map(
        D => D,
        En => En(6),
        Res => Res,
        Clk => Clk,
        Q => Q6
        );     
    Reg_7 : Reg
        port map(
        D => D,
        En => En(7),
        Res => Res,
        Clk => Clk,
        Q => Q7
        );  
end Behavioral;
