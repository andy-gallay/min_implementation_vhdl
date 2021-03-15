-------------------------------------------------------------------------------
--
-- Title       : switch_tb
-- Design      : design
-- Author      : Andy
-- Company     : POLYMTL
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\UPIR\design\src\switch_tb.vhd
-- Generated   : Fri Oct 23 22:33:44 2020
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
--{entity {switch_tb} architecture {arch}}

library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.all;

entity switch_tb is
end switch_tb;

--}} End of automatically maintained section

architecture arch of switch_tb is
    
    signal clk : std_logic := '0';
    signal reset : std_logic := '0';
    
    signal dest_code_W : natural := 8;
    signal message_W : natural := 8;
    
    signal dest_code_W_s3_s4 : natural := (dest_code_W/2);
    
    signal input_W_s3_s4 : natural := dest_code_W_s3_s4 + message_W;
    
    signal input_W : natural := dest_code_W + message_W;
    signal D : natural := 16;
    
    -------------------------------------
    -- SWITCH 1
    -------------------------------------
    
    signal s1_message_0 : std_logic_vector(message_W - 1 downto 0) := (message_W -1 downto 0 => '0');
    signal s1_message_1 : std_logic_vector(message_W - 1 downto 0) := (message_W -1 downto 0 => '0');
    
    signal s1_dest_code_0 : std_logic_vector(dest_code_W - 1 downto 0) := (dest_code_W -1 downto 0 => '0');
    signal s1_dest_code_1 : std_logic_vector(dest_code_W - 1 downto 0) := (dest_code_W -1 downto 0 => '0');
    
    signal s1_valid_0 : std_logic := '0';
    signal s1_valid_1 : std_logic := '0';
    
    signal s1_n_full_in_upper : std_logic := '1';
    signal s1_n_full_in_lower : std_logic := '1';
    
    signal s1_message_upper_out : std_logic_vector(message_W -1 downto 0);
    signal s1_message_lower_out : std_logic_vector(message_W -1 downto 0);
    
    signal s1_dest_code_upper_out : std_logic_vector((dest_code_W/2) - 1 downto 0);
    signal s1_dest_code_lower_out : std_logic_vector((dest_code_W/2) - 1 downto 0);
    
    signal s1_valid_upper_out : std_logic;
    signal s1_valid_lower_out : std_logic;
    
    signal s1_n_full_out_upper : std_logic;
    signal s1_n_full_out_lower : std_logic;
    
    -------------------------------------
    -------------------------------------
    
    -------------------------------------
    -- SWITCH 2
    -------------------------------------
    
    signal s2_message_0 : std_logic_vector(message_W - 1 downto 0) := (message_W -1 downto 0 => '0');
    signal s2_message_1 : std_logic_vector(message_W - 1 downto 0) := (message_W -1 downto 0 => '0');
    
    signal s2_dest_code_0 : std_logic_vector(dest_code_W - 1 downto 0) := (dest_code_W -1 downto 0 => '0');
    signal s2_dest_code_1 : std_logic_vector(dest_code_W - 1 downto 0) := (dest_code_W -1 downto 0 => '0');
    
    signal s2_valid_0 : std_logic := '0';
    signal s2_valid_1 : std_logic := '0';
    
    signal s2_n_full_in_upper : std_logic := '1';
    signal s2_n_full_in_lower : std_logic := '1';
    
    signal s2_message_upper_out : std_logic_vector(message_W -1 downto 0);
    signal s2_message_lower_out : std_logic_vector(message_W -1 downto 0);
    
    signal s2_dest_code_upper_out : std_logic_vector((dest_code_W/2) - 1 downto 0);
    signal s2_dest_code_lower_out : std_logic_vector((dest_code_W/2) - 1 downto 0);
    
    signal s2_valid_upper_out : std_logic;
    signal s2_valid_lower_out : std_logic;
    
    signal s2_n_full_out_upper : std_logic;
    signal s2_n_full_out_lower : std_logic;
    
    -------------------------------------
    -------------------------------------
    
    -------------------------------------
    -- SWITCH 3
    -------------------------------------
    
    signal s3_message_upper_out : std_logic_vector(message_W -1 downto 0);
    signal s3_message_lower_out : std_logic_vector(message_W -1 downto 0);
    
    signal s3_dest_code_upper_out : std_logic_vector((dest_code_W/4) - 1 downto 0);
    signal s3_dest_code_lower_out : std_logic_vector((dest_code_W/4) - 1 downto 0);
    
    signal s3_valid_upper_out : std_logic;
    signal s3_valid_lower_out : std_logic;
    
    signal s3_n_full_out_upper : std_logic;
    signal s3_n_full_out_lower : std_logic;
    
    -------------------------------------
    -------------------------------------
    
    -------------------------------------
    -- SWITCH 4
    -------------------------------------
    
    signal s4_message_upper_out : std_logic_vector(message_W -1 downto 0);
    signal s4_message_lower_out : std_logic_vector(message_W -1 downto 0);
    
    signal s4_dest_code_upper_out : std_logic_vector((dest_code_W/4) - 1 downto 0);
    signal s4_dest_code_lower_out : std_logic_vector((dest_code_W/4) - 1 downto 0);
    
    signal s4_valid_upper_out : std_logic;
    signal s4_valid_lower_out : std_logic;
    
    signal s4_n_full_out_upper : std_logic;
    signal s4_n_full_out_lower : std_logic;
    
    -------------------------------------
    -------------------------------------
    
    constant period : time := 10 ns;
    
begin
    
    -- clk 100MHz
    clk_process : process
    begin
        clk <= not(clk);
        wait for period/2;
    end process;
    
    s1_switch : entity switch(arch)
    generic map(
        dest_code_W => dest_code_W,
        message_W => message_W,
        input_W => input_W,
        D => D
        )
    port map(
        
        -- in
        
        message_0 => s1_message_0,
        message_1 => s1_message_1,
        dest_code_0 => s1_dest_code_0,
        dest_code_1 => s1_dest_code_1,
        valid_0 => s1_valid_0,
        valid_1 => s1_valid_1,
        reset => reset,
        clk => clk,
        n_full_in_upper => s3_n_full_out_upper,
        n_full_in_lower => s4_n_full_out_upper,
        
        -- out
        
        message_upper_out => s1_message_upper_out,
        message_lower_out => s1_message_lower_out,
        dest_code_upper_out => s1_dest_code_upper_out,
        dest_code_lower_out => s1_dest_code_lower_out,
        valid_upper_out => s1_valid_upper_out,
        valid_lower_out => s1_valid_lower_out,
        n_full_out_upper => s1_n_full_out_upper,
        n_full_out_lower => s1_n_full_out_lower
        );
    
    s2_switch : entity switch(arch)
    generic map(
        dest_code_W => dest_code_W,
        message_W => message_W,
        input_W => input_W,
        D => D
        )
    port map(
        
        -- in
        
        message_0 => s2_message_0,
        message_1 => s2_message_1,
        dest_code_0 => s2_dest_code_0,
        dest_code_1 => s2_dest_code_1,
        valid_0 => s2_valid_0,
        valid_1 => s2_valid_1,
        reset => reset,
        clk => clk,
        n_full_in_upper => s3_n_full_out_lower,
        n_full_in_lower => s4_n_full_out_lower,
        
        -- out
        
        message_upper_out => s2_message_upper_out,
        message_lower_out => s2_message_lower_out,
        dest_code_upper_out => s2_dest_code_upper_out,
        dest_code_lower_out => s2_dest_code_lower_out,
        valid_upper_out => s2_valid_upper_out,
        valid_lower_out => s2_valid_lower_out,
        n_full_out_upper => s2_n_full_out_upper,
        n_full_out_lower => s2_n_full_out_lower
        );
    
    s3_switch : entity switch(arch)
    generic map(
        dest_code_W => dest_code_W_s3_s4,
        message_W => message_W,
        input_W => input_W_s3_s4,
        D => D
        )
    port map(
        
        -- in
        
        message_0 => s1_message_upper_out,
        message_1 => s2_message_upper_out,
        dest_code_0 => s1_dest_code_upper_out,
        dest_code_1 => s2_dest_code_upper_out,
        valid_0 => s1_valid_upper_out,
        valid_1 => s2_valid_upper_out,
        reset => reset,
        clk => clk,
        n_full_in_upper => '1',
        n_full_in_lower => '1',
        
        -- out
        
        message_upper_out => s3_message_upper_out,
        message_lower_out => s3_message_lower_out,
        dest_code_upper_out => s3_dest_code_upper_out,
        dest_code_lower_out => s3_dest_code_lower_out,
        valid_upper_out => s3_valid_upper_out,
        valid_lower_out => s3_valid_lower_out,
        n_full_out_upper => s3_n_full_out_upper,
        n_full_out_lower => s3_n_full_out_lower
        );
    
    s4_switch : entity switch(arch)
    generic map(
        dest_code_W => dest_code_W_s3_s4,
        message_W => message_W,
        input_W => input_W_s3_s4,
        D => D
        )
    port map(
        
        -- in
        
        message_0 => s1_message_lower_out,
        message_1 => s2_message_lower_out,
        dest_code_0 => s1_dest_code_lower_out,
        dest_code_1 => s2_dest_code_lower_out,
        valid_0 => s1_valid_lower_out,
        valid_1 => s2_valid_lower_out,
        reset => reset,
        clk => clk,
        n_full_in_upper => '1',
        n_full_in_lower => '1',
        
        -- out
        
        message_upper_out => s4_message_upper_out,
        message_lower_out => s4_message_lower_out,
        dest_code_upper_out => s4_dest_code_upper_out,
        dest_code_lower_out => s4_dest_code_lower_out,
        valid_upper_out => s4_valid_upper_out,
        valid_lower_out => s4_valid_lower_out,
        n_full_out_upper => s4_n_full_out_upper,
        n_full_out_lower => s4_n_full_out_lower
        );
    
    -- enter your statements here --
    
    -- Stimulations S1
    
    s1_message_0_process : process
    begin
        s1_message_0 <= "11110000";
        wait for period;
        s1_message_0 <= "01010000";
        wait for period;
    end process;
    
    s1_message_1_process : process
    begin
        s1_message_1 <= "00001111";
        wait for period;
        s1_message_1 <= "00001010";
        wait for period;
    end process;
    
    s1_dest_code_0 <= "11110000";
    s1_dest_code_1 <= "00001111";
    
    s1_valid_0 <= '1';
    s1_valid_1 <= '1';
    
    process
    begin
        wait for 5*period;
        report "Simulation ended." severity failure;
    end process;
    
end arch;
