----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2023 08:27:37 AM
-- Design Name: 
-- Module Name: SevenSeg - Behavioral
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
use IEEE.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SevenSeg2 is
    Port ( address : in STD_LOGIC;
           data : out STD_LOGIC_VECTOR (6 downto 0));
end SevenSeg2;

architecture Behavioral of SevenSeg2 is
signal data0 : std_logic_vector(6 downto 0) := "1111111";

   
begin
    data0(6) <= not address; 
    data <= data0;
end Behavioral;