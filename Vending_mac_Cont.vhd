----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/03/2023 12:03:06 AM
-- Design Name: 
-- Module Name: Vending_mac_Cont - Behavioral
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

entity Vending_mac_Cont is
  Port (
    Clk, reset : in std_logic;
    Product : in integer; -- 1: a cereal bar,  2: bottle of water, 3: a bag of chips, 4:a bottle of orange juice, 5: cookies 
    Money : in integer; --  2 - 1$, 3 - 5$, 4 - Credit Card
    Coin : in integer; -- 1 - 25 cents
    Credit_Card : in integer; -- 1 for credit card
    Change: out integer; -- remaining amount
    Op: out integer    -- product dispense
         );
end Vending_mac_Cont;

architecture Behavioral of Vending_mac_Cont is

    type states is (S0,S1,S2,S3);
    signal ctrl, Cur_State: states;
    signal Amount, Cal : integer:=0;
    --signal CC : integer:=0;

    begin

            process(Clk)
            begin
                if(reset = '1') then
                    Cur_State <= S0;
                elsif(rising_edge(Clk)) then
                    --OP <= '0';
                    Cur_State <= ctrl;
                end if;
            end process;
            
            process(Cur_State, Product, Money, Coin, Credit_Card)
            begin
            OP <= 0;
            case ctrl is
            when S0 => -- Product Selection and amount assignment based on product
                if Product = 1 then 
                    Amount <= 165;
                elsif Product = 2 then
                    Amount <= 180;
                elsif Product = 3 then
                    Amount <= 190;
                elsif Product = 4 then
                    Amount <= 255;
                elsif Product = 5 then
                    Amount <= 270;
                end if;
                if Amount > 0 then
                    ctrl <= S1;
                else
                    ctrl <= S0;
                end if;
                
            when S1 => -- Inserted money calculation
                if Coin = 1 then
                    Cal <= Cal+25;   
                elsif Money = 2 then
                    Cal <= Cal+100;
                elsif Money = 3 then
                    Cal <= Cal+500;
                end if;
                if Credit_Card = 1 then
                    ctrl <= S3;
                else
                    ctrl <= S2;
                end if;
                
            when S2 => -- Wait for more money if not sufficient 
                if Cal < Amount then
                    ctrl <= S1;
                elsif Cal > Amount then
                    ctrl <= S3;
                end if;
            
            when S3 => -- dispense the product and change
                OP <= Product;
                if (Credit_Card = 0) then
                    Change <= Cal - Amount;
                end if;
                ctrl <= S0;
                
            when others =>
                ctrl <= S0;
                OP <= 0;
                
            end case; 
    end process;


end Behavioral;
