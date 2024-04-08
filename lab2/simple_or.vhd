library IEEE;
use IEEE.std_logic_1164.all;

entity simple_or is 
	port(
      a: in std_logic;
      b: in std_logic;
      c: out std_logic
    );
end entity;

architecture arch of simple_or is 
begin
  c <= a or b;
end architecture;
