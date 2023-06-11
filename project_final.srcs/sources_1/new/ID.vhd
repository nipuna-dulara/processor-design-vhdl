----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 11:14:58 AM
-- Design Name: 
-- Module Name: ID - Behavioral
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

entity ID is
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
end ID;

architecture Behavioral of ID is
signal JF_I : std_logic;


begin
JF <= I(11) AND I(10);
JF_I <= NOT(I(11) AND I(10));

M <= I(10) AND (NOT I(11));
LoadS <= I(11) AND (NOT I(10));
Ren(2) <= JF_I AND I(9);
Ren(1) <= JF_I AND I(8);
Ren(0) <= JF_I AND I(7);
RSA(2) <= I(9);
RSA(1) <= I(8);
RSA(0) <= I(7);
RSB(2) <= I(6);
RSB(1) <= I(5);
RSB(0) <= I(4);
IV(3) <= I(3);
IV(2) <= I(2);
IV(1) <= I(1);
IV(0) <= I(0);
Address(2) <= I(2);
Address(1) <= I(1);
Address(0) <= I(0);

end Behavioral;
