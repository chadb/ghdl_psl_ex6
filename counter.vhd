--  Solution to Counter Exercise

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_std.all;

entity Counter is
  port (clk, Reset, Enable, Load, UpDn: in Std_logic;
        Data: in Std_logic_vector(7 downto 0);
        Q:   out Std_logic_vector(7 downto 0));
end;

architecture RTL of Counter is
  signal Cnt     : Unsigned(7 downto 0):= (others => '0');
  signal uData   : Unsigned(7 downto 0):= (others => '0'); 
  signal previous_udata : unsigned(data'range):= (others => '0');
  signal previous_cnt : unsigned(cnt'range):= (others => '0');
begin
  process (clk, Reset)
  begin
    if Reset = '1' then
      Cnt <= "00000000";
    elsif Rising_edge(clk) then
      previous_cnt <= cnt;
      previous_udata <= unsigned( data );
      if Enable = '0' then
        null;
      elsif Load = '1' then
        Cnt <= Unsigned(Data);
      else
        if UpDn = '1' then
          Cnt <= Cnt + 1;
        else
          Cnt <= Cnt - 1;
        end if; 
      end if;
    end if;
  end process;
  
  Q <= Std_logic_vector(Cnt);
  
  uData <= unsigned(Data);

--psl default clock is rising_edge(clk);

--psl property up   is always (UpDn and Enable and not Load     -> next Cnt = previous_cnt + 1) abort Reset;
--psl property down is always (not UpDn and Enable and not Load -> next Cnt = previous_cnt - 1) abort Reset;
--psl property ld   is always (Enable and Load                  -> next Cnt = previous_uData ) abort Reset;
--psl property nul  is always (not Enable                       -> next Cnt = previous_cnt   ) abort Reset;
--psl property rst  is always (Reset                            ->  Cnt = 0);

--psl assert up;
--psl assert down;
--psl assert ld;
--psl assert nul;
--psl assert rst;

end;
