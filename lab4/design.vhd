library ieee;
use ieee.std_logic_1164.all;

entity mux is
  port(
    sel: in std_logic_vector(1 downto 0);
    in1, in2, in3, in4: in std_logic_vector(3 downto 0);
    output: out std_logic_vector(3 downto 0)
  );
end entity;

architecture prl of mux is
begin
	output <= in1 when sel = "00" else
              in2 when sel = "01" else
              in3 when sel = "10" else
              in4 when sel = "11" else
              "0000";
end architecture;
