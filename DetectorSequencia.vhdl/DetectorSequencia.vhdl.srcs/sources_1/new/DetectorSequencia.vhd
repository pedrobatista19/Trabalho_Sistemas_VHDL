library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity detector_11010 is
    Port (
        clk     : in  STD_LOGIC;
        reset   : in  STD_LOGIC;
        entrada : in  STD_LOGIC;
        detect  : out STD_LOGIC
    );
end detector_11010;

architecture Behavioral of detector_11010 is

    type state_type is (S0, S1, S2, S3, S4, S5);
    signal current_state, next_state : state_type;

begin

    -- Registro de estado
    process(clk, reset)
    begin
        if reset = '1' then
            current_state <= S0;
        elsif rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process;

    -- Lógica de transição de estado
    process(current_state, entrada)
    begin
        case current_state is
            when S0 =>
                if entrada = '1' then
                    next_state <= S1;
                else
                    next_state <= S0;
                end if;

            when S1 =>
                if entrada = '1' then
                    next_state <= S2;
                else
                    next_state <= S0;
                end if;

            when S2 =>
                if entrada = '0' then
                    next_state <= S3;
                else
                    next_state <= S2;
                end if;

            when S3 =>
                if entrada = '1' then
                    next_state <= S4;
                else
                    next_state <= S0;
                end if;

            when S4 =>
                if entrada = '0' then
                    next_state <= S5;
                else
                    next_state <= S2;
                end if;

            when S5 =>
                next_state <= S0; -- Detecção completa, reinicia
        end case;
    end process;

    -- Saída (Moore)
    process(current_state)
    begin
        case current_state is
            when S5 =>
                detect <= '1';
            when others =>
                detect <= '0';
        end case;
    end process;

end Behavioral;
