----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/31/2023 02:03:21 PM
-- Design Name: 
-- Module Name: MP_2W3B - Behavioral
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

entity MP_2W3B is
    Port ( SEL : in STD_LOGIC;
           A0 : in STD_LOGIC_VECTOR (2 downto 0);
           A1 : in STD_LOGIC_VECTOR (2 downto 0);
           X : out STD_LOGIC_VECTOR (2 downto 0));
end MP_2W3B;

architecture Behavioral of MP_2W3B is

begin
with SEL select
    X <= A0 when '0',
         A1 when '1',
         "000" when others;

end Behavioral;
