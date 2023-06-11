----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/16/2023 12:10:01 PM
-- Design Name: 
-- Module Name: TB_4_RCA - Behavioral
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

entity TB_4_RCA is
--  Port ( );
end TB_4_RCA;

architecture Behavioral of TB_4_RCA is

    COMPONENT RCA_4 
    Port (  A : in  STD_LOGIC_VECTOR ( 3 downto 0);
            B : in STD_LOGIC_VECTOR ( 3 downto 0);
           C_out : out STD_LOGIC;
            S : out STD_LOGIC_VECTOR ( 3 downto 0);
           M : in STD_LOGIC;
           V : out STD_LOGIC);
    END COMPONENT;
    
 signal  A :  STD_LOGIC_VECTOR ( 3 downto 0);
   signal           B :  STD_LOGIC_VECTOR ( 3 downto 0);
    signal         C_out :  STD_LOGIC;
     signal        S :  STD_LOGIC_VECTOR ( 3 downto 0);
       signal      M :  STD_LOGIC;
      signal       V :  STD_LOGIC;

begin

    UUT: RCA_4 PORT MAP (
        M => M,
        A => A,
        B => B,
        S => S,
        C_out =>C_out,
        V => V
        
    );
    
    process
        begin
            M <= '0';
-- index No       
--            A0 <= '1';
--            A1 <= '0';
--            A2 <= '0';
--            A3 <= '1';
            
--            B0 <= '0';
--            B1 <= '0';
--            B2 <= '0';
--            B3 <= '0';
            A <= "1001";
            B <= "0000";
            
            WAIT FOR 100 ns;
             M <= '1';
--            A0 <= '0';
--            A1 <= '1';
--            A2 <= '1';
--            A3 <= '0';
            
--            B0 <= '0';
--            B1 <= '1';
--            B2 <= '0';
--            B3 <= '0';
           A <= "0110";
       B <= "0100";
            WAIT FOR 100 ns;
-- 1010 + 1101 and 1110 + 1111 
                 M <= '1';           
--            A0 <= '1';
--            A1 <= '0';
--            A2 <= '1';
--            A3 <= '0';
            
--            B0 <= '1';
--            B1 <= '1';
--            B2 <= '0';
--            B3 <= '1';
              A <= "1010";
   B <= "1101";
--              WAIT FOR 100 ns;
--     -- 1010 + 1101 and 1110 + 1111  4
--               M <= '0';
--                 A0 <= '1';
--                 A1 <= '0';
--                 A2 <= '1';
--                 A3 <= '0';
                 
--                 B0 <= '0';
--                 B1 <= '1';
--                 B2 <= '0';
--                 B3 <= '1';     
            
                                             
            
            
          
           wait;
    end process;


end Behavioral;