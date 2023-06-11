----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/17/2023 09:53:24 AM
-- Design Name: 
-- Module Name: RCA_4 - Behavioral
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

entity RCA_4 is
    Port ( A : in  STD_LOGIC_VECTOR ( 3 downto 0);
            B : in STD_LOGIC_VECTOR ( 3 downto 0);
           C_out : out STD_LOGIC;
            S : out STD_LOGIC_VECTOR ( 3 downto 0);
           M : in STD_LOGIC;
           V: out STD_LOGIC;
           ZF: out STD_LOGIC
           );
end RCA_4;

architecture Behavioral of RCA_4 is

        COMPONENT FA
                port (
                A : in std_logic;
                B : in std_logic;
                C_in : in std_logic;
                S : out std_logic;
                C_out : out std_logic);                
        END COMPONENT;
        
        SIGNAL   FA0_S, FA0_C, FA1_S, FA1_C, FA2_S, FA2_C, FA3_S, FA3_C,C_out0 : std_logic;
        SIGNAL B0,SS : std_logic_vector (3 downto 0);
begin
        B0(0) <= A(0) xor M;
        B0(1) <= A(1) xor M;
        B0(2) <= A(2) xor M;
        B0(3) <= A(3) xor M;
        
        
        FA_0 : FA
            port map (
                A => B0(0),
                B => B(0),
                C_in => M,
                S => SS(0),
                C_out => FA0_C);
            
        FA_1 : FA
             port map (
                A => B0(1),
                B => B(1),
                C_in => FA0_C,
                S => SS(1),
                C_out => FA1_C);
       
        FA_2 : FA
             port map (
                A => B0(2),
                B => B(2),
                C_in => FA1_C,
                S => SS(2),
                C_out => FA2_C);
      
        FA_3 : FA
             port map (
                A => B0(3),
                B => B(3),
                C_in => FA2_C,
                S => SS(3),
                C_out => C_out0); 
           C_out <= C_out0;
           V <= C_out0 xor FA2_C; 
           ZF <= NOT (SS(0) or SS(1) or SS(2) or SS(3) );
           S <= SS;
                                            
end Behavioral;
