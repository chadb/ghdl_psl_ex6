-- Test bench for Counter Exercise
library work;
library accellera_ovl_vhdl;
use accellera_ovl_vhdl.std_ovl.all;
use accellera_ovl_vhdl.std_ovl_components.all;

entity Counter_ovl_tb is
end;

library IEEE;
use IEEE.Std_logic_1164.all;

architecture Bench_ovl of Counter_ovl_tb is

  component Counter
    port (clk, Reset, Enable, Load, UpDn: in Std_logic;
          Data: in Std_logic_vector(7 downto 0);
          Q:   out Std_logic_vector(7 downto 0));
  end component;

  signal Clock, Reset, Enable, Load, UpDn: Std_logic;
  signal Data, Q: Std_logic_vector(7 downto 0);

  signal OK: Boolean := True;

begin

  Clk: process
  begin
    while now <= 3000 NS loop
      Clock <= '0';
      wait for 5 NS;
      Clock <= '1';
      wait for 5 NS;
    end loop;
    wait;
  end process;

  Stim: process
  begin
    Enable <= '0';
    Load <= '0';
    UpDn <= '1';
    Reset <= '1';
    wait for 10 ns; -- Should be reset
    Reset <= '0';
    wait for 10 ns; -- Should do nothing - not enabled
    Enable <= '1';
    wait for 20 ns; -- Should count up to 2
    UpDn <= '0';
    wait for 40 ns; -- Should count downto 254
    UpDn <= '1';
    wait for 40 ns; -- Should count up to 2
    Reset <= '1';
    wait for 10 ns; -- Should be reset, overriding enable
    Reset <= '0';
    wait for 30 ns; -- Should count up to 3
    Enable <= '0';
    wait for 10 ns; -- Should do nothing - not enabled
    Data <= "01111111";
    Load <= '1';
    wait for 10 ns; -- Should do nothing - not enabled
    Load <= '0';
    Enable <= '1';
    wait for 10 ns; -- Should count from 3 to 4
    Load <= '1';
    wait for 10 ns; -- Should load 127
    Load <= '0';
    wait for 20 ns; -- Should count from 127 to 129
    Enable <= '0';
    wait for 10 ns; -- Should do nothing - not enabled
    UpDn <= '0';
    wait for 10 ns; -- Should do nothing - not enabled
    Enable <= '1';
    wait for 20 ns; -- Should count down from 129 to 127
    Data <= "11110000";
    Load <= '1';
    wait for 10 ns; -- Should load
    Reset <= '1';
    wait for 10 ns; -- Should be reset, overriding load
    Load <= '0';
    UpDn <= '1';
    wait for 10 ns; -- Should stay at 0 - still reset
    Reset <= '0';
    wait for 2560 ns; -- Should count from 0 round to 0
    Enable <= '0';
    wait;   
  end process;

  G1: Counter port map (Clock, Reset, Enable, Load, UpDn, Data, Q);

  Check: process
  begin
    wait for 9 ns;
    if Q /= "00000000" then
      OK <= False;
    end if;
    wait for 10 ns;
    if Q /= "00000000"  then
      OK <= False;
    end if;
    wait for 10 ns;
    if Q /= "00000001" then
      OK <= False;
    end if;
    wait for 10 ns;
    if Q /= "00000010" then
      OK <= False;
    end if;
    wait for 10 ns;
    if Q /= "00000001" then
      OK <= False;
    end if;
    wait for 10 ns;
    if Q /= "00000000" then
      OK <= False;
    end if;
    wait for 10 ns;
    if Q /= "11111111" then
      OK <= False;
    end if;
    wait for 10 ns;
    if Q /= "11111110" then
      OK <= False;
    end if;
    wait for 10 ns;
    if Q /= "11111111" then
      OK <= False;
    end if;
    wait for 10 ns;
    if Q /= "00000000" then
      OK <= False;
    end if;
    wait for 10 ns;
    if Q /= "00000001" then
      OK <= False;
    end if;
    wait for 10 ns;
    if Q /= "00000010" then
      OK <= False;
    end if;
    wait for 10 ns;
    if Q /= "00000000" then
      OK <= False;
    end if;
    wait for 10 ns;
    if Q /= "00000001" then
      OK <= False;
    end if;
    wait for 10 ns;
    if Q /= "00000010" then
      OK <= False;
    end if;
    wait for 10 ns;
    if Q /= "00000011" then
      OK <= False;
    end if;
    wait for 10 ns;
    if Q /= "00000011" then
      OK <= False;
    end if;
    wait for 10 ns;
    if Q /= "00000011" then
      OK <= False;
    end if;
    wait for 10 ns;
    if Q /= "00000100" then
      OK <= False;
    end if;
    wait for 10 ns;
    if Q /= "01111111" then
      OK <= False;
    end if;
    wait for 10 ns;
    if Q /= "10000000" then
      OK <= False;
    end if;
    wait for 10 ns;
    if Q /= "10000001" then
      OK <= False;
    end if;
    wait for 10 ns;
    if Q /= "10000001" then
      OK <= False;
    end if;
    wait for 10 ns;
    if Q /= "10000001" then
      OK <= False;
    end if;
    wait for 10 ns;
    if Q /= "10000000" then
      OK <= False;
    end if;
    wait for 10 ns;
    if Q /= "01111111" then
      OK <= False;
    end if;
    wait for 10 ns;
    if Q /= "11110000" then
      OK <= False;
    end if;
    wait for 10 ns;
    if Q /= "00000000" then
      OK <= False;
    end if;
    wait for 10 ns;
    if Q /= "00000000" then
      OK <= False;
    end if;
    wait for 10 ns;
    if Q /= "00000001" then
      OK <= False;
    end if;
    wait for 10 ns;
    if Q /= "00000010" then
      OK <= False;
    end if;
    wait for 10 ns;
    if Q /= "00000011" then
      OK <= False;
    end if;
    wait for 10 ns;
    if Q /= "00000100" then
      OK <= False;
    end if;
    wait for 2500 ns;
    if Q /= "11111110" then
      OK <= False;
    end if;
    wait for 10 ns;
    if Q /= "11111111" then
      OK <= False;
    end if;
    wait for 10 ns;
    if Q /= "00000000" then
      OK <= False;
    end if;
    wait;   
  end process;

  asserts1: if true generate
    use ieee.numeric_std.all;
    signal q_is_zero, nEnable, nReset, doload : std_logic;
    signal oldQ       : std_logic_vector(Q'RANGE);
    signal qunchanged : std_logic;
    signal q_is_not_zero : std_logic;
    signal qIsData    : std_logic;
    signal countDown, countUp, decQ, incQ : std_logic;
  begin
    qunchanged  <= '1' when oldQ = Q else '0';
    oldQ        <= Q when rising_edge(Clock);
    doload      <= enable and load;
    nReset      <= not Reset;
    nEnable     <= not Enable;
    q_is_zero   <= '1' when Q = "00000000" else '0';
    q_is_not_zero   <= '1' when Q /= "00000000" else '0';
    qIsData     <= '1' when q = data else '0';
    countDown   <= Enable and not Load and not UpDn;
    countUp     <= Enable and not Load and UpDn;
    decQ        <= '1' when (unsigned(Q)) = (unsigned(oldQ)-1) else '0';
    incQ        <= '1' when (unsigned(Q)) = (unsigned(oldQ)+1) else '0';
    
    check_reset : ovl_next generic map (msg => "reset failed")
     port map  (clock => clock, 
                reset => '1',  -- default is active low
                enable => '1', start_event => Reset, 
                test_expr => q_is_zero);
  
    check_enable : ovl_next generic map (msg => "enable failed")
     port map  (clock => clock, 
                reset => nReset,
                enable => '1', start_event => nEnable, 
                test_expr => qunchanged);

     check_load : ovl_next generic map (msg => "load failed")
     port map  (clock => clock, 
                reset => nReset,
                enable => '1', start_event => doLoad, 
                test_expr => qIsData);
     
     check_up : ovl_next generic map (msg => "up failed")
     port map  (clock => clock, 
                reset => nReset,
                enable => '1', start_event => countUp, 
                test_expr => incQ);

     check_down : ovl_next generic map (msg => "down failed")
     port map  (clock => clock, 
                reset => nReset,
                enable => '1', start_event => countDown, 
                test_expr => decQ);


  end generate;
end;

