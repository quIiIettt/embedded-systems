library IEEE;
use IEEE.std_logic_1164.all;

entity test is
end entity;

architecture testbench of test is

  component case_unit is
    port(
      clk: in std_logic;
      sel: in std_logic_vector(1 downto 0);
      out_val: out std_logic_vector(1 downto 0)
    );
  end component;

  signal sclk, ssclk: std_logic;
  signal ssel: std_logic_vector(1 downto 0);
  signal sout_val: std_logic_vector(1 downto 0);

begin

  case_unit_inst: case_unit port map (
    clk => sclk,
    sel => ssel,
    out_val => sout_val
  );

  clock: process
  begin
    for i in 0 to 6 loop
      sclk <= '1';
      wait for 1 ns;
      sclk <= '0';
      wait for 1 ns;
    end loop;
    wait;
  end process;

  stimuli: process
  begin
    ssel <= "00";
    wait for 2 ns;
    ssel <= "01";
    wait for 2 ns;
    ssel <= "10";
    wait for 2 ns;
    ssel <= "11";
    wait for 2 ns;
    ssel <= "XX";
    wait for 2 ns;
    ssel <= "10";
    wait for 2 ns;
    ssel <= "ZZ";
    wait for 2 ns;
    wait;
  end process;

end architecture;


