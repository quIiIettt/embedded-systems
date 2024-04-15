library IEEE;
use IEEE.std_logic_1164.all;

entity test is
end entity;

architecture tst of test is

	component mux is
	port(
      sel: in std_logic_vector(1 downto 0);
      in1, in2, in3, in4: in std_logic_vector(3 downto 0);
      output: out std_logic_vector(3 downto 0)
    );
	end component;
    
    signal sel: std_logic_vector(1 downto 0);
    signal in1, in2, in3, in4: std_logic_vector(3 downto 0);
    signal output : std_logic_vector(3 downto 0);
    
begin
    process
    begin
        sel <= "01";
        in1 <= "1100";
        in2 <= "0011";
        in3 <= "0110";
        in4 <= "1110";
        wait;   
    end process;  
    
    mux_inst: mux port map (
    	sel => sel,
        in1 => in1,
        in2 => in2,
        in3 => in3,
        in4 => in4,
        output => output
    );
  
end architecture;