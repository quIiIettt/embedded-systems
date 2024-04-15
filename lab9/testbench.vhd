library IEEE;
use IEEE.std_logic_1164.all;

entity test is
end entity;

architecture testbench of test is

	component fsm_example is
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
	end component;
    
    signal sclk: std_logic;
    signal srst: std_logic;
    signal sstart: std_logic;
    signal sin1: std_logic_vector(3 downto 0);
    signal sin2: std_logic_vector(3 downto 0);
    signal sin3: std_logic_vector(3 downto 0);
    signal sin4: std_logic_vector(3 downto 0);
    signal sres: std_logic_vector(5 downto 0);
    signal sready: std_logic;
   
begin
    
	fsm_example_inst: fsm_example port map (
    	clk => sclk,
    	rst => srst,
    	start => sstart,
    	in1 => sin1,
    	in2 => sin2,
    	in3 => sin3,
    	in4 => sin4,
    	res => sres,
    	ready => sready
    );
    
    clock: process
    begin
      for i in 0 to 5 loop
	    sclk <= '1';
	    wait for 0.5 ns;
	    sclk <= '0';
	    wait for 0.5 ns;
      end loop;
      wait;
    end process;
    
    stimuli: process
    begin
        srst <= '1';
        sstart <= '0';
        sin1 <= "0001";
        sin2 <= "0001";
        sin3 <= "0001";
        sin4 <= "0001";
        wait for 1 ns;
        srst <= '0';
        sstart <= '1';
        wait for 1 ns;
        sstart <= '0';
        wait;
    end process;
  
  
end architecture; 
