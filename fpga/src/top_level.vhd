library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity top_level is
    port (
        -- inputs
        MAX10_CLK1_50 : in std_logic;
        KEY            : in std_logic_vector(1 downto 0)
    );
end entity;

architecture A of top_level is
    component hello_nios2 is
        port (
            clk_clk       : in std_logic := 'X'; -- clk
            reset_reset_n : in std_logic := 'X'  -- reset_n
        );
    end component hello_nios2;
begin
    u0 : component hello_nios2
        port map (
            clk_clk       => MAX10_CLK1_50,       --   clk.clk
            reset_reset_n => '1'  -- reset.reset_n
        );
end architecture A;
