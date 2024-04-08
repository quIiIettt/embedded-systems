library IEEE;
use IEEE.std_logic_1164.all;

entity test is
end entity;

architecture testbench of test is
  component foo is
    port(
      a: in std_logic;
      b: in std_logic;
      c: out std_logic
    );
  end component;
  
  signal a, b, c: std_logic := '0'; -- вхідні сигнали / вихідний сигнал
  signal f: std_logic;
  
begin
  -- генерування вхідних сигналів
  a_gen: process
  begin
    a <= '0';
    wait for 10 ns;
    a <= '1';
    wait for 10 ns;
    a <= '0';
    wait for 10 ns;
    a <= '1';
    wait for 10 ns;
    wait;
  end process;
  
  b_gen: process
  begin
    b <= '0';
    wait for 25 ns;
    b <= '1';
    wait for 25 ns;
    b <= '0';
    wait for 25 ns;
    b <= '1';
    wait for 25 ns;
    wait;
  end process;

  foo_inst: foo port map (
    a => a, -- підключення сигналів
    b => b,
    c => f
  );

  -- затримка вихідних сигналів у вихідному звіті
  c <= f after 50 ns; 

end architecture;
