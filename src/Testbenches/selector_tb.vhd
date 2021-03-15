-------------------------------------------------------------------------------
--
-- Title       : selector_tb
-- Design      : design
-- Author      : Andy
-- Company     : POLYMTL
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\UPIR\design\src\selector_tb.vhd
-- Generated   : Sun Nov  8 10:30:31 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {selector_tb} architecture {arch}}

library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.all;

entity selector_tb is
end selector_tb;

--}} End of automatically maintained section

architecture arch of selector_tb is
    
    signal clk : std_logic := '0';
    signal reset_tb : std_logic;
    
    signal n_full_tb : std_logic;
    
    signal dest_code_width_tb : natural := 4;
    signal message_width_tb : natural := 8;
    signal width_in_tb : natural := dest_code_width_tb + message_width_tb;
    
    signal upper_din_tb : std_logic_vector(width_in_tb - 1 downto 0);
    signal lower_din_tb : std_logic_vector(width_in_tb - 1 downto 0);
    signal upper_empty_tb : std_logic;
    signal lower_empty_tb : std_logic;
    signal upper_re_tb : std_logic;
    signal lower_re_tb : std_logic;
    signal valid_out_tb : std_logic;
    signal dest_code_out_tb : std_logic_vector(dest_code_width_tb - 1 downto 0);
    signal message_out_tb : std_logic_vector(message_width_tb - 1 downto 0);
    
    signal din_fifo_upper : std_logic_vector(11 downto 0);
    signal din_fifo_lower : std_logic_vector(11 downto 0);
    
    signal wr_en_fifo_upper : std_logic;
    signal wr_en_fifo_lower : std_logic;
    
    signal full_signals_fifo : std_logic_vector(1 downto 0);
    
    constant period : time := 10 ns;
    constant D : natural := 2;
    
begin
    
    clk_process : process
    begin
        clk <= not(clk);
        wait for period/2;
    end process;
    
    selector : entity selector(arch)
    generic map(
        dest_code_width => dest_code_width_tb,
        message_width => message_width_tb,
        width_in => width_in_tb
        )
    port map(
        clk => clk,
        reset => reset_tb,
        n_full => n_full_tb,
        upper_din => upper_din_tb,
        lower_din => lower_din_tb,
        upper_empty => upper_empty_tb,
        lower_empty => lower_empty_tb,
        upper_re => upper_re_tb,
        lower_re => lower_re_tb,
        valid_out => valid_out_tb,
        dest_code_out => dest_code_out_tb,
        message_out => message_out_tb
        );
    
    fifo_upper: entity fifo(arch)
    generic map(
        D => D,
        W => 12
        )
    port map(
        clk => clk,
        reset => reset_tb,
        din => din_fifo_upper,
        dout => upper_din_tb,
        wr_en => wr_en_fifo_upper,
        rd_en => upper_re_tb,
        empty => upper_empty_tb,
        full => full_signals_fifo(0)
        );
        
    fifo_lower: entity fifo(arch)
    generic map(
        D => D,
        W => 12
        )
    port map(
        clk => clk,
        reset => reset_tb,
        din => din_fifo_lower,
        dout => lower_din_tb,
        wr_en => wr_en_fifo_lower,
        rd_en => lower_re_tb,
        empty => lower_empty_tb,
        full => full_signals_fifo(1)
        );
    
    reset_tb <= '1' after 0ns, '0' after period;
    
    -- AVANT: n_full_tb <= '0' after 0ns, '1' after 3*period;
    n_full_tb <= '0' after 0ns, '1' after 3*period/2;
    
    din_fifo_upper <= "100111100001" after 0ns;
    wr_en_fifo_upper <= '1' after 0ns, '0' after 2*period;
    
    din_fifo_lower <= "011000110101" after 0ns;
    wr_en_fifo_lower <= '1' after 0ns, '0' after 2*period;
    
end arch;
