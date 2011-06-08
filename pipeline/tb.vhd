LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY tb IS
END tb;

ARCHITECTURE behavior OF tb IS 

COMPONENT funcao IS
 PORT (	clk,reset: IN STD_LOGIC
		);
END COMPONENT;


--Inputs
signal clk : std_logic := '0';
signal reset : std_logic := '0';

--Outputs

-- Clock period definitions
constant clk_period : time := 20ns;

BEGIN

-- Instantiate the Unit Under Test (UUT)
		uut: funcao PORT MAP (
						clk => clk,
						reset => reset
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

		wait for 1ms;

		-- insert stimulus here 

		end process;

		END;

