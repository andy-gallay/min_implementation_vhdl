-------------------------------------------------------------------------------
--
-- Title       : single_switch_tb
-- Design      : design
-- Author      : Andy
-- Company     : POLYMTL
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\UPIR\design\src\single_switch_tb.vhd
-- Generated   : Sun Nov  8 11:08:37 2020
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
--{entity {single_switch_tb} architecture {arch}}

library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.all;

entity single_switch_tb is
end single_switch_tb;

--}} End of automatically maintained section

architecture arch of single_switch_tb is
    
    signal clk : std_logic := '0';
    signal reset : std_logic := '0';
    
    signal dest_code_W : natural := 8;
    signal message_W : natural := 8;
    
    signal input_W : natural := dest_code_W + message_W;
    signal D : natural := 16;
    
    signal message_0 : std_logic_vector(message_W - 1 downto 0);
    signal message_1 : std_logic_vector(message_W - 1 downto 0);
    
    signal dest_code_0 : std_logic_vector(dest_code_W - 1 downto 0);
    signal dest_code_1 : std_logic_vector(dest_code_W - 1 downto 0);
    
    signal valid_0 : std_logic := '1';
    signal valid_1 : std_logic := '1';
    
    signal n_full_in_upper : std_logic := '1';
    signal n_full_in_lower : std_logic := '1';
    
    signal message_upper_out : std_logic_vector(message_W - 1 downto 0);
    signal message_lower_out : std_logic_vector(message_W - 1 downto 0);
    
    signal dest_code_upper_out : std_logic_vector((dest_code_W)/2 - 1 downto 0);
    signal dest_code_lower_out : std_logic_vector((dest_code_W)/2 - 1 downto 0);
    
    signal valid_upper_out : std_logic;
    signal valid_lower_out : std_logic;
    
    signal n_full_out_upper : std_logic;
    signal n_full_out_lower : std_logic;
    
    constant period : time := 10 ns;
    
begin
    
    -- enter your statements here --
    
    clk_process : process
    begin
        clk <= not(clk);
        wait for period/2;
    end process;
    
    
    switch : entity switch(arch)
    generic map(
        dest_code_W => dest_code_W,
        message_W => message_W,
        input_W => input_W,
        D => D
        )
    port map(
        message_0 => message_0,
        message_1 => message_1,
        dest_code_0 => dest_code_0,
        dest_code_1 => dest_code_1,
        valid_0 => valid_0,
        valid_1 => valid_1,
        reset => reset,
        clk => clk,
        n_full_in_upper => n_full_in_upper,
        n_full_in_lower => n_full_in_lower,
        message_upper_out => message_upper_out,
        message_lower_out => message_lower_out,
        dest_code_upper_out => dest_code_upper_out,
        dest_code_lower_out => dest_code_lower_out,
        valid_upper_out => valid_upper_out,
        valid_lower_out => valid_lower_out,
        n_full_out_upper => n_full_out_upper,
        n_full_out_lower => n_full_out_lower
        );
    
    
    --    message_0_process : process
    --    begin
    --        message_0 <= "11110000";
    --        wait for period;
    --        message_0 <= "01010000";
    --        wait for period;
    --    end process;
    --    
    --    message_1_process : process
    --    begin
    --        message_1 <= "00001111";
    --        wait for period;
    --        message_1 <= "00001010";
    --        wait for period;
    --    end process;
    --    
    --    dest_code_0 <= "11110000";
    --    dest_code_1 <= "00001111";
    --    
    
    
    message_0 <= "01100000" after 0*period, "00000000" after 5*period;
    message_1 <= "00001001" after 0*period, "00000000" after 5*period;
    
    dest_code_0 <= "11110000";
    dest_code_1 <= "00001111";
    
    process
    begin
        wait for 20*period;
        report "Simulation ended" severity failure;
    end process;
    
    
    
    
end arch;
