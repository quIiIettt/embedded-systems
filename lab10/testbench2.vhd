library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

entity text_test is
end entity ;

architecture arch of text_test is
  file output_data: text;
  signal clk: std_logic;
  signal input_signal : std_logic_vector(3 downto 0) := (others => '0');
begin

  clock: process
  begin
    for i in 0 to 10 loop
	  clk <= '1';
	  wait for 0.5 ns;
	  clk <= '0';
	  wait for 0.5 ns;
    end loop;
    wait;
  end process;
    
  write_file: process
    variable out_line: line;
  begin
    file_open(output_data, "output.txt", WRITE_MODE);
    wait until rising_edge(clk);
    for i in 1 to 15 loop
      write(out_line, input_signal, RIGHT, 12);
      writeline(output_data, out_line);
      wait until rising_edge(clk);
    end loop;
    file_close(output_data);
    wait;
  end process;
  
  increment_input: process
  begin
    wait until rising_edge(clk);
    for i in 1 to 15 loop
    input_signal <= std_logic_vector( unsigned(input_signal) + 1 );
    wait until rising_edge(clk);
    end loop;
    wait;
  end process;
  
end architecture; 
