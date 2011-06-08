LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY data_path IS
PORT 	(	clk,reset: IN STD_LOGIC;
			y, x, dx, u, i_in: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			i_out: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			resultado_f1: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			resultado_f2: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			resultado_f3: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
END data_path;

ARCHITECTURE comportamento OF data_path IS

COMPONENT  func1 IS
PORT 	(	clk,reset: IN STD_LOGIC;
			x, dx: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			resultado: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
END COMPONENT;

COMPONENT func2 IS
PORT 	(	clk,reset: IN STD_LOGIC;
			u, x, dx, y: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			resultado: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
END COMPONENT;

COMPONENT func3 IS
PORT 	(	clk,reset: IN STD_LOGIC;
			y, u, dx: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			resultado: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
END COMPONENT;

SIGNAL reg_i_in: STD_LOGIC_VECTOR(31 DOWNTO 0);

BEGIN

PROCESS (clk,reset)
BEGIN
	IF reset = '1' THEN
		reg_i_in <= (OTHERS=>'0');
		i_out <= (OTHERS=>'0');
	ELSIF clk'EVENT AND clk='1' THEN
		reg_i_in <= i_in;
		i_out <= reg_i_in;
	END IF;
END PROCESS;

FUNCAO_1: func1 PORT MAP (
clk => clk,
reset => reset,
x => x,
dx => dx,
resultado => resultado_f1);

FUNCAO_2: func2 PORT MAP (
clk => clk,
reset => reset,
u => u,
x => x,
dx => dx,
y => y,
resultado => resultado_f2);

FUNCAO_3: func3 PORT MAP (
clk => clk,
reset => reset,
y => y,
u => u,
dx => dx,
resultado => resultado_f3);

END comportamento;
