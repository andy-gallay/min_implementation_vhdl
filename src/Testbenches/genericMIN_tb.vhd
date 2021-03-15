-------------------------------------------------------------------------------
--
-- Title       : genereicMIN_tb
-- Design      : design
-- Author      : Andy
-- Company     : POLYMTL
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\UPIR\design\src\genereicMIN_tb.vhd
-- Generated   : Mon Feb 15 20:22:03 2021
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
--{entity {genereicMIN_tb} architecture {arch}}

library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use work.all;

entity genereicMIN_tb is
end genereicMIN_tb;

--}} End of automatically maintained section

architecture arch of genereicMIN_tb is

signal clk : std_logic := '0';
signal reset : std_logic := '0';

signal N_signal : natural := 4;
signal messageW_signal : natural := 2;
signal D_signal : natural := 2;

signal messageDin_signal : std_logic_vector(messageW_signal*N_signal - 1 downto 0);
signal destcodeDin_signal : std_logic_vector(N_signal*N_signal - 1 downto 0);

signal validDin_signal : std_logic_vector(N_signal - 1 downto 0);
signal nFullDin_signal : std_logic_vector(N_signal - 1 downto 0);

signal messageDout_signal : std_logic_vector(messageW_signal*N_signal - 1 downto 0);
signal validDout_signal : std_logic_vector(N_signal - 1 downto 0);
signal nFullDout_signal : std_logic_vector(N_signal - 1 downto 0);

constant period : time := 10 ns;

begin
    
    reset <= '1' after 0*period, '0' after 1*period;
    
    clk_process : process
    begin
        clk <= not(clk);
        wait for period/2;
    end process;
    
    validDin_signal <= (N_signal - 1 downto 0 => '1') after 0*period, (N_signal - 1 downto 0 => '0') after 5*period;
    nFullDin_signal <= (N_signal - 1 downto 0 => '1');
    nFullDin_signal <= "1111";
    destcodeDin_signal <= "1000010000100001";
    messageDin_signal <= "00011011";

    -- enter your statements here --
    min : entity genericMultistageInterconnectionNetwork(arch)
    generic map(
        N => N_signal,
        messageW => messageW_signal,
        D => D_signal
    )
    port map(
        clk => clk,
        reset => reset,
        messageDin => messageDin_signal,
        destcodeDin => destcodeDin_signal,
        validDin => validDin_signal,
        nFullDin => nFullDin_signal,
        messageDout => messageDout_signal,
        validDout => validDout_signal,
        nFullDout => nFullDout_signal
    );

end arch;
