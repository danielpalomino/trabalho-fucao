LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
--USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD;

ENTITY write_memory IS
GENERIC (n: INTEGER:=10);
PORT 	(	
			clk, enable: IN STD_LOGIC;
			data_f1, data_f2, data_f3, adress: IN STD_LOGIC_VECTOR(31 DOWNTO 0)			
		);
END write_memory;

ARCHITECTURE comportamento OF write_memory IS

TYPE mem IS ARRAY (n-1 DOWNTO 0) OF STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL memoria_f1: mem;

SIGNAL memoria_f2: mem;

SIGNAL memoria_f3: mem;

BEGIN

PROCESS(clk, enable)
BEGIN
	IF enable = '1' THEN
		IF clk'EVENT AND clk = '1' THEN
			memoria_f1(CONV_INTEGER(adress)) <= data_f1;
			memoria_f2(CONV_INTEGER(adress)) <= data_f2;
			memoria_f3(CONV_INTEGER(adress)) <= data_f3;
		END IF;
	END IF;
END PROCESS;

END comportamento;