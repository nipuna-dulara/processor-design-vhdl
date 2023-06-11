----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 04:30:17 PM
-- Design Name: 
-- Module Name: processor_sim - Behavioral
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

entity processor_sim is
--  Port ( );
end processor_sim;

architecture Behavioral of processor_sim is
component processor 
  Port ( 
  Clk_in : in std_logic;
  Res : in std_logic;
  ZF : out std_logic;
  V : out std_logic;
  SegOut : out std_logic_vector(6 downto 0);
  Anode : out std_logic_vector(3 downto 0)
);
end component;
signal Clk_in,Res,ZF,V: std_logic;

signal segOut : std_logic_vector(6 downto 0) ;
signal Anode : std_logic_vector(3 downto 0) ;

begin
UUT : processor port map(
Clk_in => Clk_in,
Res => Res,
ZF => ZF,
V => V,
segOut => segOut,
Anode => Anode
);
process begin
    Clk_in <= '0';
    wait for 2ns;
    Clk_in <= '1';
    wait for 2ns;
end process ;
process begin 
    Res <= '1';
    wait for 10ns;
    Res <= '0';
    
    wait ;
end process;
end Behavioral;

