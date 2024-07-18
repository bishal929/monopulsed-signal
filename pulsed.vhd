library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pulsed is
    port(
        rst     : in  STD_LOGIC;
        clk_in  : in  STD_LOGIC;
        clk_out : out STD_LOGIC
    );
end pulsed;

architecture behavioural of pulsed is
    signal count : integer range 0 to 49999 := 0;
    signal clk_out_reg : STD_LOGIC := '0';
begin
    process(clk_in, rst)
    begin
        if rst = '1' then
            count <= 0;
            clk_out_reg <= '0';
        elsif falling_edge(clk_in) then
            if count >= 9 and count < 49999 then 
                clk_out_reg <= '0';
            elsif count = 49999 then
                clk_out_reg <= '1';
                count <= 0;
            else
                clk_out_reg <= '1';
                count <= count + 1;
            end if;
        end if;
    end process;

    clk_out <= clk_out_reg;
end behavioural;
