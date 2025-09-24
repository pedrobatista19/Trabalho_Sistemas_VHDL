library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_somador_2bits is
end tb_somador_2bits;

architecture behavior of tb_somador_2bits is
    signal a : STD_LOGIC_VECTOR (1 downto 0);
    signal b : STD_LOGIC_VECTOR (1 downto 0);
    signal soma : STD_LOGIC_VECTOR (2 downto 0);
begin
    uut: entity work.somador_2bits
        port map (
            a => a,
            b => b,
            soma => soma
        );
    
    process
    begin
        -- Testando todas as combinações de entrada
        a <= "00"; b <= "00"; wait for 10 ns;
        a <= "00"; b <= "01"; wait for 10 ns;
        a <= "00"; b <= "10"; wait for 10 ns;
        a <= "00"; b <= "11"; wait for 10 ns;
        a <= "01"; b <= "00"; wait for 10 ns;
        a <= "01"; b <= "01"; wait for 10 ns;
        a <= "01"; b <= "10"; wait for 10 ns;
        a <= "01"; b <= "11"; wait for 10 ns;
        a <= "10"; b <= "00"; wait for 10 ns;
        a <= "10"; b <= "01"; wait for 10 ns;
        a <= "10"; b <= "10"; wait for 10 ns;
        a <= "10"; b <= "11"; wait for 10 ns;
        a <= "11"; b <= "00"; wait for 10 ns;
        a <= "11"; b <= "01"; wait for 10 ns;
        a <= "11"; b <= "10"; wait for 10 ns;
        a <= "11"; b <= "11"; wait for 10 ns;
        wait;
    end process;
end behavior;
