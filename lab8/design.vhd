-- design.vhd
library IEEE;
use IEEE.std_logic_1164.all;

entity register_reset is
  port(
    clk, rst: in std_logic;
    din: in std_logic_vector(7 downto 0);
    dout: out std_logic_vector(7 downto 0)
  );
end entity;

architecture Behavioral of register_reset is
  signal reg: std_logic_vector(7 downto 0);
begin
  process(clk, rst)
  begin
    if rst = '1' then
      reg <= (others => '0'); -- Скидання регістрів при активному сигналі скидання
    elsif rising_edge(clk) then
      reg <= din; -- Збереження вхідних даних у регістрах при спрацюванні фронту тактового сигналу
    end if;
  end process;
  
  dout <= reg; -- Вихідні дані збігаються з вмістом регістрів
end architecture Behavioral;
