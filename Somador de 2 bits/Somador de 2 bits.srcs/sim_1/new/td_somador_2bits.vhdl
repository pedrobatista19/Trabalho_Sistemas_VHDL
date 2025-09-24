library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_somador_2bits is
end tb_somador_2bits;

architecture behavior of tb_somador_2bits is

    component somador_2bits
        Port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               a    : in STD_LOGIC_VECTOR(1 downto 0);
               b    : in STD_LOGIC_VECTOR(1 downto 0);
               soma : out STD_LOGIC_VECTOR(2 downto 0));
    end component;

    signal clk     : STD_LOGIC := '0';
    signal reset   : STD_LOGIC := '0';
    signal a       : STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal b       : STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal soma    : STD_LOGIC_VECTOR(2 downto 0);

begin

    -- Unit Under Test (UUT)
    uut: somador_2bits
        Port map ( clk => clk,
                   reset => reset,
                   a => a,
                   b => b,
                   soma => soma );

    -- Clock
    clk_process :process
    begin
        clk <= '0';
        wait for 10 ns;
        clk <= '1';
        wait for 10 ns;
    end process;

    stim_proc: process
    begin       
        -- Test 1: Somar 00 e 00
        reset <= '1'; wait for 20 ns;
        reset <= '0'; a <= "00"; b <= "00"; wait for 20 ns;
        
        -- Test 2: Somar 01 e 01
        a <= "01"; b <= "01"; wait for 20 ns;

        -- Test 3: Somar 10 e 10
        a <= "10"; b <= "10"; wait for 20 ns;

        -- Test 4: Somar 11 e 11
        a <= "11"; b <= "11"; wait for 20 ns;

        -- Finalize
        wait;
    end process;

end behavior;
