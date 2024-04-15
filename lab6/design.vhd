library IEEE;
use IEEE.std_logic_1164.all;

entity for_example is
  port(
    input_signals: in std_logic_vector(7 downto 0);
    output_result: out std_logic_vector(3 downto 0)
  );
end entity;

architecture behavioral of for_example is
begin
  process(input_signals)
  begin
    for i in 0 to 3 loop
      output_result(i) <= input_signals(2*i) xor input_signals(2*i + 1);
    end loop;
  end process;
end architecture;
