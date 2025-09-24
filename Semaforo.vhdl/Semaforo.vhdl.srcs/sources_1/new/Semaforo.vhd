library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity semaforo_com_btn is
    Port (
        clk    : in  STD_LOGIC;
        reset  : in  STD_LOGIC;
        btn    : in  STD_LOGIC;
        vermelho : out STD_LOGIC;
        amarelo : out STD_LOGIC;
        verde    : out STD_LOGIC
    );
end semaforo_com_btn;

architecture Behavioral of semaforo_com_btn is

    -- Definindo os estados da FSM
    type state_type is (S0, S1, S2, S3);
    signal current_state, next_state : state_type;

begin

    process(clk, reset)
    begin
        if reset = '1' then
            current_state <= S0;
        elsif rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process;

    process(current_state, btn)
    begin
        case current_state is
            when S0 => -- verde
                if btn = '1' then
                    next_state <= S1;  -- Vai para amarelo se btn for pressionado
                else
                    next_state <= S1;  -- Vai para amarelo depois do tempo do verde
                end if;

            when S1 => -- amarelo
                if btn = '1' then
                    next_state <= S2;  -- Vai para Vermelho se btn for pressionado
                else
                    next_state <= S2;  -- Vai para Vermelho depois do tempo do amarelo
                end if;

            when S2 => -- vermelho
                if btn = '1' then
                    next_state <= S3;  -- Vai para vermelho por 2 tempos
                else
                    next_state <= S0;  -- Volta para verde
                end if;

            when S3 => -- vermelho por 2 tempos
                next_state <= S0;  -- Volta para verde após o tempo
        end case;
    end process;

    -- Lógica de saída (Moore FSM: saída depende apenas do estado atual)
    process(current_state)
    begin
        -- Inicializa as luzes como desligadas
        verde <= '0';
        amarelo <= '0';
        vermelho <= '0';
        
        case current_state is
            when S0 =>  -- verde
                verde <= '1';
            when S1 =>  -- amarelo
                amarelo <= '1';
            when S2 =>  -- vermelho
                vermelho <= '1';
            when S3 =>  -- vermelho por 2 tempos
                vermelho <= '1';
        end case;
    end process;

end Behavioral;
