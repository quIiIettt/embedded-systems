library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
end entity;

architecture tb_arch of testbench is
  signal input_signals_tb: std_logic_vector(7 downto 0);
  signal output_result_tb: std_logic_vector(3 downto 0);
  
  component for_example is
    port(
      input_signals: in std_logic_vector(7 downto 0);
      output_result: out std_logic_vector(3 downto 0)
    );
  end component;

begin

  dut: for_example port map (
    input_signals => input_signals_tb,
    output_result => output_result_tb
  );

  stimulus: process
  begin
    input_signals_tb <= "10101010"; 
    wait for 10 ns;
    input_signals_tb <= "01010101"; 
    wait;
  end process;

end architecture;
