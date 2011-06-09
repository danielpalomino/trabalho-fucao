LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
--USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY controle IS
GENERIC(n: INTEGER:=10);
PORT 	(	clk,reset: IN STD_LOGIC;
			i: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			write_enable: OUT STD_LOGIC;
			read_enable: OUT STD_LOGIC;
			adress: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			ready: OUT STD_LOGIC
		);
END controle;

ARCHITECTURE comportamento OF controle IS

SIGNAL stop: STD_LOGIC;

BEGIN

PROCESS (clk,reset)
VARIABLE cont: INTEGER:=0;
BEGIN
	read_enable <= '0';
	IF reset = '1' THEN
		ready <= '0';
		cont := 0;
		write_enable <= '0';
		adress <= (OTHERS=>'0');
		stop <= '0';
	ELSIF stop = '1' THEN
	  stop <= '1';
	ELSIF clk'EVENT AND clk='1' THEN
	  IF cont = 10 THEN
	    cont:= 0;
	    adress <= STD_LOGIC_VECTOR(TO_UNSIGNED(cont, 32));
      cont := cont +1;
	  ELSE
	    IF CONV_INTEGER(i) = 9 THEN
				ready <= '1';
			   write_enable <= '0';
			   stop <= '1';
			   adress <= STD_LOGIC_VECTOR(TO_UNSIGNED(cont, 32));
         cont := cont +1;
    		ELSE
			   write_enable <= '1';
			   adress <= STD_LOGIC_VECTOR(TO_UNSIGNED(cont, 32));
				 cont := cont +1;
			END IF;
		END IF;
	END IF;
END PROCESS;

END comportamento;