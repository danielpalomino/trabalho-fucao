LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY func1 IS
PORT 	(	clk,reset: IN STD_LOGIC;
			x, dx: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			resultado: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
END func1;

ARCHITECTURE comportamento OF func1 IS

SIGNAL reg_x, reg_dx, fio_resultado: STD_LOGIC_VECTOR(31 DOWNTO 0);

BEGIN

PROCESS (clk,reset)
BEGIN
	IF reset = '1' THEN
		reg_x <= (OTHERS=>'0');
		reg_dx <= (OTHERS=>'0');
		resultado <= (OTHERS=>'0');
	ELSIF clk'EVENT AND clk='1' THEN
		reg_x <= x;
		reg_dx <= dx;
		resultado <= fio_resultado;
	END IF;
END PROCESS;

fio_resultado <= reg_x + reg_dx;

END comportamento;
