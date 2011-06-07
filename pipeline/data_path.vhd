LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY data_path IS
PORT 	(	clk,reset: IN STD_LOGIC;
			y, x, dx, u, in_in: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			i_out: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			resultado_f1: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			resultado_f2: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			resultado_f3: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
END data_path;

ARCHITECTURE comportamento OF data_path IS

-- registradores entrada
SIGNAL reg_x, reg_dx, reg_u, reg_y, reg_i: STD_LOGIC_VECTOR(31 DOWNTO 0);

-- registradores estagio 1
SIGNAL reg_n1_est1, reg_n2_est1, reg_y_est1, reg_x_est1, reg_dx_est1, reg_u_est1, reg_i_est1: STD_LOGIC_VECTOR(31 DOWNTO 0);

-- registradores estagio 2
SIGNAL reg_n2_est2, reg_n6_est2, reg_n4_est2, reg_y_est2, reg_x_est2, reg_dx_est2, reg_u_est2, reg_i_est2: STD_LOGIC_VECTOR(31 DOWNTO 0);

-- registradores estagio 3
SIGNAL reg_n10_est3, reg_n8_est3, reg_n5_est3, reg_y_est3, reg_i_est3: STD_LOGIC_VECTOR(31 DOWNTO 0);

-- registradores saida
SIGNAL f3, f2, f1, i: STD_LOGIC_VECTOR(31 DOWNTO 0);

BEGIN

--estagio entradas
PROCESS(clk, reset)
BEGIN
	IF reset = '1' THEN
		reg_x <= (OTHERS=>'0');
		reg_dx <= (OTHERS=>'0');
		reg_u <= (OTHERS=>'0');
		reg_y <= (OTHERS=>'0');
		reg_i <= (OTHERS=>'0');
	ELSIF clk'EVENT AND clk = '1' THEN
		reg_x <= x;
		reg_dx <= dx;
		reg_u <= u;
		reg_y <= y;
		reg_i <= i_in;
	END IF;
END PROCESS;

--estagio 1
PROCESS(clk, reset)
BEGIN
	IF reset = '1' THEN
		reg_x <= (OTHERS=>'0');
	ELSIF clk'EVENT AND clk = '1' THEN
		
	END IF;
END PROCESS;

--estagio 2
PROCESS(clk, reset)
BEGIN
	IF reset = '1' THEN
		reg_x <= (OTHERS=>'0');
	ELSIF clk'EVENT AND clk = '1' THEN
		
	END IF;
END PROCESS;

--estagio 3
PROCESS(clk, reset)
BEGIN
	IF reset = '1' THEN
		reg_x <= (OTHERS=>'0');
	ELSIF clk'EVENT AND clk = '1' THEN
		
	END IF;
END PROCESS;

--estagio saida
PROCESS(clk, reset)
BEGIN
	IF reset = '1' THEN
		reg_x <= (OTHERS=>'0');
	ELSIF clk'EVENT AND clk = '1' THEN
		
	END IF;
END PROCESS;

END comportamento;
