library IEEE;
use IEEE.std_logic_1164.all;

entity flip_flop is 
	port(
      clk: in std_logic;
      d: in std_logic;
      q: out std_logic
    );
end entity;

architecture arch of flip_flop is 
begin
  process(all)
  begin
    if clk = '1' and clk'event then 
        	q <= d;
    end if;
  end process;
end architecture;
