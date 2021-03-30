------------------------------------------------------------------------
--
-- Testbench for 2-bit binary comparator.
-- EDA Playground
--
-- Copyright (c) 2020-Present Tomas Fryza
-- Dept. of Radio Electronics, Brno University of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------------------
entity tb_d_latch is
    -- Entity of testbench is always empty
end entity tb_d_latch;

------------------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------------------
architecture testbench of tb_d_latch is

    -- Local signals
    signal s_en      :  std_logic;
    signal s_d       :  std_logic;
    signal s_q       :  std_logic;
    signal s_arst    :  std_logic;
    signal s_q_bar   :  std_logic;

begin
    -- Connecting testbench signals with comparator_2bit entity (Unit Under Test)
    uut_d_latch : entity work.d_latch
        port map(
            en     => s_en,
            d      => s_d,
            arst   => s_arst,
            q      => s_q,
            q_bar  => s_q_bar
        );

    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
   p_reset_gen : process
    begin
        s_arst <= '0';
        wait for 12 ns;
        
        -- Reset activated
        s_arst <= '1';
        wait for 155 ns;
       
        -- Reset deactivated
        s_arst <= '0';
        wait for 108 ns;
        
        -- Reset activated
        s_arst <= '1';
        wait for 106 ns;
       
        s_arst <= '0';
        wait;
    end process p_reset_gen;
   
   
   
    p_stimulus : process
    begin
        -- Report a note at the beginning of stimulus process
        report "Stimulus process started" severity note;

            s_d <= '0';
            s_en <= '0';
            
            assert (s_q = '0')
            report "s_d and s_en = 0" severity error;
            
            wait for 14ns;
            s_d <= '1';
            wait for 14ns;
            s_d <= '0';
            wait for 24ns;
            s_d <= '1';
            wait for 22ns;
            s_d <= '0';
            wait for 36ns;
            s_d <= '1';
            wait for 56ns;
            s_d <= '0';
            
            assert (s_q = '0' and s_q_bar = '1')
            report "s_d = s_q and s_en = s_q_bar" severity error;
            
            s_en <= '1';

             wait for 14ns;
            s_d <= '1';
            wait for 14ns;
            s_d <= '0';
            wait for 24ns;
            s_d <= '1';
            wait for 22ns;
            s_d <= '0';
            wait for 36ns;
            s_d <= '1';
            wait for 56ns;
            s_d <= '0';
            
            s_en <= '0';
                        
             wait for 14ns;
            s_d <= '1';
            wait for 14ns;
            s_d <= '0';
            wait for 24ns;
            s_d <= '1';
            wait for 22ns;
            s_d <= '0';
            wait for 36ns;
            s_d <= '1';
            wait for 56ns;
            s_d <= '0';
            
            s_en <= '1';
            
             wait for 14ns;
            s_d <= '1';
            wait for 14ns;
            s_d <= '0';
            wait for 24ns;
            s_d <= '1';
            wait for 22ns;
            s_d <= '0';
            wait for 36ns;
            s_d <= '1';
            wait for 56ns;
            s_d <= '0';
            
             wait for 14ns;
            s_d <= '1';
            wait for 14ns;
            s_d <= '0';
            wait for 24ns;
            s_d <= '1';
            wait for 22ns;
            s_d <= '0';
            wait for 36ns;
            s_d <= '1';
            wait for 56ns;
            s_d <= '0';
            s_d <= '0';
        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;

end architecture testbench;
