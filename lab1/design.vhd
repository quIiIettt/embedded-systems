library IEEE;
use IEEE.std_logic_1164.all;

entity foo is 
	port(
      a: in std_logic;
      b: in std_logic;
      c: out std_logic;
    );
end entity;

architecture arch of foo is 
begin
  c <= a and b;
end architecture;