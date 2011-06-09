LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
--USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD;

ENTITY write_memory IS
PORT 	(	
			clk, reset: IN STD_LOGIC;
			we: IN STD_LOGIC;
			data_f1, data_f2, data_f3, adress: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			out_f1, out_f2, out_f3: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
END write_memory;

ARCHITECTURE comportamento OF write_memory IS

TYPE mem IS ARRAY (0 TO 9) OF STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL memoria_f1: mem;

SIGNAL memoria_f2: mem;

SIGNAL memoria_f3: mem;

BEGIN

PROCESS(clk, reset)
BEGIN
	IF reset = '1' THEN
		out_f1 <= (OTHERS=>'0');
		out_f2 <= (OTHERS=>'0');
		out_f3 <= (OTHERS=>'0');
	ELSIF clk'EVENT AND clk = '1' THEN
		IF we = '1' THEN
			memoria_f1(CONV_INTEGER(adress)) <= data_f1;
			memoria_f2(CONV_INTEGER(adress)) <= data_f2;
			memoria_f3(CONV_INTEGER(adress)) <= data_f3;
		ELSE
			out_f1 <= memoria_f1(CONV_INTEGER(adress));
			out_f2 <= memoria_f2(CONV_INTEGER(adress));
			out_f3 <= memoria_f3(CONV_INTEGER(adress));
		END IF;
	END IF;
END PROCESS;

END comportamento;