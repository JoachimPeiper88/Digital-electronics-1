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
entity tb_t_ff_rst is
    -- Entity of testbench is always empty
end entity tb_t_ff_rst;

------------------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------------------
architecture testbench of tb_t_ff_rst is

    -- Local signals
          signal s_clk   :  STD_LOGIC;
          
          
          signal s_t     :  STD_LOGIC;
          signal s_rst  :  STD_LOGIC;
          signal s_q     :  STD_LOGIC;
          signal s_q_bar :  STD_LOGIC;

begin
    -- Connecting testbench signals with comparator_2bit entity (Unit Under Test)
    uut_t_ff_rst : entity work.t_ff_rst
        port map(
            clk    => s_clk,
           
            t      => s_t,
            rst   => s_rst,
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
            wait for 15 ns;
        
            -- Reset activated
            s_rst <= '1';
            wait for 50 ns;
       
            s_rst <= '0';
            wait for 150 ns;
        
        -- Reset activated
            s_rst <= '1';
            wait for 50 ns;
       
            s_rst <= '0';
            wait;
    end process p_reset_gen;
        
    p_stimulus : process
        begin
            report "Stimulus process started" severity note;
                s_t <= '0';
                
                wait for 40ns;
                s_t <= '0';
                wait for 40ns;
                s_t <= '1';
                wait for 40ns;
                s_t <= '1';
                wait for 40ns;
                s_t <= '0';
                        
                wait for 60ns;
                s_t <= '0';
                wait for 60ns;
                s_t <= '1';
                wait for 60ns;
                s_t <= '1';
                wait for 60ns;
                s_t <= '0';
            
                wait for 50ns;
                s_t <= '0';
                wait for 50ns;
                s_t <= '1';
                wait for 50ns;
                s_t <= '1';
                wait for 50ns;
    
        report "Stimulus process finished" severity note;
            wait;
    end process p_stimulus;

end architecture testbench;   