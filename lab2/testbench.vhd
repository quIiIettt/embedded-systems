library IEEE;
use IEEE.std_logic_1164.all;

entity test is
end entity;

architecture testbench of test is
	component str is
	port(
      a: in std_logic;
      b: in std_logic;
      c: in std_logic;
      d: in std_logic;
      res: out std_logic
    );
	end component;
    signal a, b, c, d, res: std_logic;
begin
	str_inst: str port map (
    	a => a,
        b => b,
        c => c,
        d => d,
        res => res
    );
    process
    
    begin
      	a <= '1';
        b <= '0';
        c <= '0';
        d <= '1';
        wait;
    end process;
    
end architecture;