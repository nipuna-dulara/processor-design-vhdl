----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/31/2023 02:28:59 PM
-- Design Name: 
-- Module Name: ROM - Behavioral
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
use ieee.numeric_std.all; 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROM is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (11 downto 0));
end ROM;

architecture Behavioral of ROM is
type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);

signal sevenSegment_ROM : rom_type := (
    "101110000001", 
    "100110000010", 
    "001110110000",
    "100110000011",
    "001110110000",
    "100010000011",
    "100010000011",
    "100110000000"
    -- "001110110000",
    -- "110000000000",
    -- "110000000000",
    -- "110000000000"
 );
begin
data <= sevenSegment_ROM(to_integer(unsigned(address)));

end Behavioral;





-- signal sevenSegment_ROM : rom_type := (
--"101110000001", 
--"100110000010", 
--"001110110000",
--"100110000011",
--"001110110000",
--"011110000000",
--"001110110000",
--"001110110000"
--"001110110000",
--"110000000000",
--"110000000000",
--"110000000000"
--);