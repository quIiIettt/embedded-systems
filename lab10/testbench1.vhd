library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

entity text_test is
end entity ;

architecture arch of text_test is
  file input_data: text;
  signal clk: std_logic;
  signal input_signal : std_logic_vector(3 downto 0) := (others => '0');
begin

  clock :process
    begin
      for i in 0 to 10 loop
	    clk <= '1';
	    wait for 0.5 ns;
	    clk <= '0';
	    wait for 0.5 ns;
      end loop;
      wait;
    wait;
  end process;
    
  read_file: process
    variable in_line: line;
	variable input_variable: std_logic_vector(3 downto 0);
  begin
    file_open(input_data, "input.txt", READ_MODE);
	while not endfile(input_data) loop
	  readline(input_data, in_line);
	  read(in_line, input_variable);
	  input_signal <= input_variable;
	  wait until rising_edge(clk);
	end loop;
	file_close(input_data);
  end process;
  
  end architecture; 
