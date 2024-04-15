-- testbench.vhd
library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
end entity testbench;

architecture Behavioral of testbench is
  signal clk, rst: std_logic := '0';
  signal din, dout: std_logic_vector(7 downto 0);
  
begin
  dut: entity work.register_reset
    port map (
      clk => clk,
      rst => rst,
      din => din,
      dout => dout
    );
  
  clk_process: process
  begin
    while now < 100 ns loop
      clk <= '0';
      wait for 5 ns;
      clk <= '1';
      wait for 5 ns;
    end loop;
    wait;
  end process clk_process;
  
  stimulus: process
  begin
    wait for 20 ns;
    rst <= '1'; -- Активація сигналу скидання
    wait for 10 ns;
    rst <= '0'; -- Відключення сигналу скидання
    wait for 10 ns;
    din <= "10101010"; -- Подача вхідних даних
    wait for 50 ns;
    din <= "01010101";
    wait;
  end process stimulus;
end architecture Behavioral;
