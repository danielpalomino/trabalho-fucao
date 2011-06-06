LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;

ENTITY func2 IS
PORT 	(	clk,reset: IN STD_LOGIC;
			u, x, dx, y: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			resultado: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
END func2;

ARCHITECTURE comportamento OF func2 IS

SIGNAL reg_x, reg_dx, reg_y, reg_u, fio_resultado, sub0: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL multi0, multi1, multi2, multi3, multi4: STD_LOGIC_VECTOR(63 DOWNTO 0);

BEGIN

PROCESS (clk,reset)
BEGIN
	IF reset = '1' THEN
		reg_x <= (OTHERS=>'0');
		reg_dx <= (OTHERS=>'0');
		reg_y <= (OTHERS=>'0');
		reg_u <= (OTHERS=>'0');
		resultado <= (OTHERS=>'0');
	ELSIF clk'EVENT AND clk='1' THEN
		reg_x <= x;
		reg_dx <= dx;
		reg_y <= y;
		reg_u <= u;
		resultado <= fio_resultado;
	END IF;
END PROCESS;

multi0 <= "00000000000000000000000000000011" * reg_x;
multi1 <= reg_u * reg_dx;
multi2 <= (multi0(31 DOWNTO 0)) * (multi1(31 DOWNTO 0));
multi3 <= "00000000000000000000000000000011" * reg_y;
multi4 <= (multi3 (31 DOWNTO 0))* reg_dx;
sub0 <= reg_u - (multi2(31 DOWNTO 0));
fio_resultado <= sub0 - (multi4(31 DOWNTO 0));

END comportamento;
