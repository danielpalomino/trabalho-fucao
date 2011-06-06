LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY tb IS
END tb;

ARCHITECTURE behavior OF tb IS 

COMPONENT funcao
PORT(
				clk : IN  std_logic;
reset : IN  std_logic;
resultado_f1 : OUT  std_logic_vector(31 downto 0);
resultado_f2 : OUT  std_logic_vector(31 downto 0);
resultado_f3 : OUT  std_logic_vector(31 downto 0)
);
END COMPONENT;


--Inputs
signal clk : std_logic := '0';
signal reset : std_logic := '0';

--Outputs
signal resultado_f1 : std_logic_vector(31 downto 0);
signal resultado_f2 : std_logic_vector(31 downto 0);
signal resultado_f3 : std_logic_vector(31 downto 0);

-- Clock period definitions
constant clk_period : time := 20ns;

BEGIN

-- Instantiate the Unit Under Test (UUT)
		uut: funcao PORT MAP (
						clk => clk,
						reset => reset,
						resultado_f1 => resultado_f1,
						resultado_f2 => resultado_f2,
						resultado_f3 => resultado_f3
						);

		-- Clock process definitions
		clk_process :process
		begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		end process;


		-- Stimulus process
		stim_proc: process
		begin		
		-- hold reset state for 100ms.
		reset <= '1';
		wait for 20ns;
		reset <= '0';

		wait for clk_period*10;

		-- insert stimulus here 

		wait;
		end process;

		END;

