LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
--USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY controle IS
GENERIC(n: INTEGER:=10);
PORT 	(	clk,reset, write_enable: IN STD_LOGIC;
			adress: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
END controle;

ARCHITECTURE comportamento OF controle IS

BEGIN

PROCESS (clk,reset)
VARIABLE cont: INTEGER:=0;
BEGIN
	IF reset = '1' THEN
		cont := 0;
		write_enable = '0';
	ELSE
		enable = '1';
		IF clk'EVENT AND clk='1' THEN
			IF 
			adress <= STD_LOGIC_VECTOR(TO_UNSIGNED(cont, 32));
			cont := cont +1;
		END IF;
	END IF;
END PROCESS;

END comportamento;