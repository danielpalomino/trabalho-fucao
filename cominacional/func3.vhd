LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY func3 IS
PORT 	(	clk,reset: IN STD_LOGIC;
			y, u, dx: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			resultado: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
END func3;

ARCHITECTURE comportamento OF func3 IS

SIGNAL reg_y, reg_u, reg_dx, fio_resultado: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL mult: STD_LOGIC_VECTOR(63 DOWNTO 0);

BEGIN

PROCESS (clk,reset)
BEGIN
	IF reset = '1' THEN
		reg_y <= (OTHERS=>'0');
		reg_u <= (OTHERS=>'0');
		reg_dx <= (OTHERS=>'0');
		resultado <= (OTHERS=>'0');
	ELSIF clk'EVENT AND clk='1' THEN
		reg_y <= y;
		reg_u <= u;
		reg_dx <= dx;
		resultado <= fio_resultado;
	END IF;
END PROCESS;

mult <= reg_u * reg_dx;
fio_resultado <= reg_y + (mult(31 DOWNTO 0));

END comportamento;