-- design.vhd
library IEEE;
use IEEE.std_logic_1164.all;

entity register_array is
  generic(
    WIDTH: positive := 8
  );
  port(
    clk: in std_logic;
    reset: in std_logic;
    din: in std_logic_vector(WIDTH - 1 downto 0);
    dout: out std_logic_vector(WIDTH - 1 downto 0)
  );
end entity;

architecture Behavioral of register_array is
begin
  registers: for i in 0 to WIDTH - 1 generate
    reg: process(clk, reset)
    begin
      if reset = '1' then
        dout(i) <= '0';
      elsif rising_edge(clk) then
        dout(i) <= din(i);
      end if;
    end process reg;
  end generate registers;
end architecture Behavioral;
