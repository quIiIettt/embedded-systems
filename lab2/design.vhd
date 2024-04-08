library IEEE;
use IEEE.std_logic_1164.all;

entity str is 
	port(
      a: in std_logic;
      b: in std_logic;
      c: in std_logic;
      d: in std_logic;
      res: out std_logic
    );
end entity;

architecture arch of str is 
	component simple_and is 
		port(
        a: in std_logic;
      	b: in std_logic;
      	c: out std_logic
        );
    end component;
    
    component simple_or is 
    	port (
        a: in std_logic;
      	b: in std_logic;
      	c: out std_logic
        );
    end component;
    
    signal and_res: std_logic;
	signal or_res: std_logic;
begin
  and1 : simple_and port map (a => a, b => b, c => and_res);
  or1 : simple_or port map (a => c, b => d, c => or_res);
  res <= and_res xor or_res;
end architecture;
