library ieee;
use ieee.std_logic_1164.all;

entity case_unit is
  port(
    clk: in std_logic;
    sel: in std_logic_vector(1 downto 0);
    out_val: out std_logic_vector(1 downto 0)
  );
end entity;

architecture basic of case_unit is
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      case sel is
        when "00" =>
          out_val <= "11";  
        when "01" =>
          out_val <= "10";  
        when "10" =>
          out_val <= "01";  
        when "11" =>
          out_val <= "00"; 
        when others =>
          out_val <= "00"; 
      end case;
    end if;
  end process;
end architecture;