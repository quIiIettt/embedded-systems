library IEEE;
use IEEE.std_logic_1164.all;

entity test is
end entity;

architecture testbench of test is
	component flip_flop is
	  port(
        clk: in std_logic;
        d: in std_logic;
        q: out std_logic
      );
	end component;
  signal clk: std_logic;
  signal d: std_logic;
  signal f: std_logic;
begin
  flip_flop_inst: flip_flop port map (
    clk => clk,
    d => d,
    q => f
  );
stimuli: process
      begin
		d <= '1';
        wait for 4 ps;
        d <= '0';
        wait for 4 ps;
        d <= '0';
        wait for 4 ps;
        d <= '1';
        wait for 4 ps;
      wait;
    end process;
clk_proc: process
    begin
		for i in 1 to 10 loop
          clk <= '1';
          wait for 1 ps;
          clk <= '0';
          wait for 1 ps;
	end loop;
	wait;
    end process;
end architecture;

