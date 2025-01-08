----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/03/2023 09:26:32 AM
-- Design Name: 
-- Module Name: TB_ALL - Behavioral
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
use std.env.finish;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_ALL is
--  Port ( );
end TB_ALL;

architecture Behavioral of TB_ALL is
    signal Clk, reset : std_logic := '0';
    signal Product : integer := 0;
    signal Money : integer := 0;
    signal Coin : integer := 0;
    signal Credit_Card : integer := 0;
    signal Change : integer := 0;
    signal Op : integer := 0;
      
begin
    clk <= not clk after 1 ns; --toggle the clock every 1 ns
    vending_machine : entity work.Vending_mac_Cont
    port map (
    CLK => CLK, Product => Product, Money => Money, reset => reset,
    Op => Op, Change => Change, Coin => Coin, Credit_Card => Credit_Card
    );

    stim: process
    begin
    
-- TestCase - 1 - Product 1 --
    wait for 3 ns;
    Product <= 1;
    wait for 4 ns;
    Money <= 2;
    wait for 4 ns;
    Money <= 3;
    wait for 10 ns;
------------------------------
    
---- TestCase - 2 - Product 2 --
--    wait for 3 ns;
--    Product <= 2;
--    wait for 4 ns;
--    Money <= 2;
--    wait for 4 ns;
--    Money <= 2;
--    wait for 10 ns;
--------------------------------

---- TestCase - 3 - Product 3 --
--    wait for 3 ns;
--    Product <= 3;
--    wait for 4 ns;
--    Coin <= 1;
--    wait for 4 ns;
--    Coin <= 0;
--    Money <= 2;
--    wait for 4 ns;
--    Money <= 2;
--    wait for 10 ns;
--------------------------------

---- TestCase - 4 - Product 4 --
--    wait for 3 ns;
--    Product <= 4;
--    wait for 4 ns;
--    Coin <= 1;
--    wait for 4 ns;
--    Coin <= 1;
--    wait for 4 ns;
--    Coin <= 0;
--    Money <= 2;
--    wait for 4 ns;
--    Money <= 2;
--    wait for 4 ns;
--    Coin <= 1;
--    wait for 10 ns;
--------------------------------

---- TestCase - 5 - Product 5 --
--    wait for 3 ns;
--    Product <= 5;
--    wait for 4 ns;
--    Money <= 2;
--    wait for 4 ns;
--    Money <= 2;
--    wait for 4 ns;
--    Money <= 3;
--    wait for 10 ns;
--------------------------------

---- TestCase - 6 - Credit Card --
--    wait for 2 ns;
--    Product <= 5;
--    wait for 2 ns;
--    Credit_Card <= 1;
--    wait for 8 ns;
--------------------------------

    finish;
    end process;


end Behavioral;
