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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


------------------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------------------
entity tb_d_ff_arst is
    -- Entity of testbench is always empty
end entity tb_d_ff_arst;

------------------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------------------
architecture testbench of tb_d_ff_arst is

    -- Local signals
          signal s_clk   :  STD_LOGIC;
          
          
          signal s_d     :  STD_LOGIC;
          signal s_arst  :  STD_LOGIC;
          signal s_q     :  STD_LOGIC;
          signal s_q_bar :  STD_LOGIC;

begin
    -- Connecting testbench signals with comparator_2bit entity (Unit Under Test)
    uut_d_ff_arst : entity work.d_ff_arst
        port map(
            clk    => s_clk,
           
            d      => s_d,
            arst   => s_arst,
            q      => s_q,
            q_bar  => s_q_bar
        );
        
        
    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
   p_clk_gen : process
    begin
        while now < 750 ns loop         -- 75 periods of 100MHz clock
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;
   
   p_reset_gen : process
    begin
        s_arst <= '0';
        wait for 12 ns;
        
        -- Reset activated
        s_arst <= '1';
        wait for 155 ns;
       
        -- Reset deactivated
        s_arst <= '0';
        wait for 106 ns;
        
        -- Reset activated
        s_arst <= '1';
        wait for 106 ns;
       
        s_arst <= '0';
        wait;
    end process p_reset_gen;
   
   
   
       p_stimulus : process
    begin
        report "Stimulus process started" severity note;
            s_d <= '0';
            
            wait for 14ns;
            s_d <= '1';
            wait for 10ns;
            s_d <= '0';
            
            wait for 6ns;
            s_d <= '0';
            
            assert (s_q = '0' and s_q_bar = '1')
            report "nesuhlas" severity error;
            
            wait for 5ns;
            s_d <= '1';
            wait for 30ns;
            s_d <= '0';
            wait for 30ns;
            s_d <= '1';
            wait for 30ns;
            s_d <= '0';
            wait for 30ns;
            s_d <= '1';
            wait for 30ns;
            s_d <= '0';
            wait for 30ns;
            s_d <= '1';
            wait for 30ns;
            s_d <= '0';
            wait for 30ns;
            s_d <= '1';
            wait for 30ns;
            s_d <= '0';
            wait for 30ns;
            s_d <= '1';
            wait for 30ns;
            s_d <= '0';
            wait for 30ns;
            s_d <= '1';
            wait for 30ns;
            s_d <= '0';
            wait for 30ns;
            s_d <= '1';
            wait for 30ns;
            s_d <= '0';
            wait for 30ns;
            s_d <= '1';
            wait for 30ns;
            s_d <= '0';
            wait for 30ns;
            s_d <= '1';
            wait for 30ns;
            s_d <= '0';
            wait for 30ns;
            s_d <= '1';
            wait for 30ns;
            s_d <= '0';
            wait for 30ns;
            s_d <= '1'; 
    
    report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;

end architecture testbench;        
