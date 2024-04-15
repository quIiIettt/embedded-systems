-- testbench.vhd
library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
end entity testbench;

architecture Behavioral of testbench is
  constant WIDTH: positive := 8;
  
  signal clk: std_logic := '0';
  signal reset: std_logic := '0';
  signal din: std_logic_vector(WIDTH - 1 downto 0) := (others => '0');
  signal dout: std_logic_vector(WIDTH - 1 downto 0);
  
begin
  dut: entity work.register_array
    generic map (
      WIDTH => WIDTH
    )
    port map (
      clk => clk,
      reset => reset,
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
    reset <= '1';
    wait for 10 ns;
    reset <= '0';
    wait for 10 ns;
    din <= "10101010";
    wait for 50 ns;
    din <= "01010101";
    wait;
  end process stimulus;
end architecture Behavioral;
