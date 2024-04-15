library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fsm_example is
  port(
    clk: in std_logic;
	rst: in std_logic;
	start: in std_logic;
	in1: in std_logic_vector(3 downto 0);
	in2: in std_logic_vector(3 downto 0);
	in3: in std_logic_vector(3 downto 0);
	in4: in std_logic_vector(3 downto 0);
	res: out std_logic_vector(5 downto 0);
	ready: out std_logic
  );
end entity;

architecture fsm of fsm_example is
  type states is (s_idle, s_first, s_finish);
  signal cur_state, next_state: states;
  signal sum1, sum2: signed(4 downto 0);
  signal sum_res: signed(5 downto 0);
begin
  process(all)
  begin
    if clk'event and clk = '1' then
	  cur_state <= next_state;
	end if;
  end process;
  
  process(all)
  begin
    case cur_state is
	  when s_idle =>
	    if start = '1' then
		  next_state <= s_first;
		else 
		  next_state <= s_idle;
		end if;
	  when s_first => 
	    next_state <= s_finish;
	  when s_finish => 
	    next_state <= s_idle;
    end case;
  end process;
  
  process(all)
  begin
    if rst = '1' then
	  sum1 <= (others => '0');
	  sum2 <= (others => '0');
	  sum_res <= (others => '0');
	  ready <= '0';
	elsif clk'event and clk = '1' then
	  case cur_state is
	    when s_idle =>
	      sum1 <= (others => '0');
	      sum2 <= (others => '0');
	      ready <= '0';
	    when s_first => 
	      sum1 <= resize(signed(in1), 5) + resize(signed(in2), 5);
		  sum2 <= resize(signed(in3), 5) + resize(signed(in4), 5);
	    when s_finish => 
	      sum_res <= resize(sum1, 6) + resize(sum2, 6);
		  ready <= '1';
	  end case;
	end if;
  end process;
  res <= std_logic_vector(sum_res);
end architecture; 

