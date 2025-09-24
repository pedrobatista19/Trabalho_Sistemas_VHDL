library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity somador_2bits is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           a    : in STD_LOGIC_VECTOR(1 downto 0);
           b    : in STD_LOGIC_VECTOR(1 downto 0);
           soma : out STD_LOGIC_VECTOR(2 downto 0));
end somador_2bits;

architecture Behavioral of somador_2bits is
begin
    process(clk, reset)
    begin
        if reset = '1' then
            soma <= "000"; -- Reseta a soma
        elsif rising_edge(clk) then
            soma <= std_logic_vector(unsigned(a) + unsigned(b)); -- Realiza a soma
        end if;
    end process;
end Behavioral;
