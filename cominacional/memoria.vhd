LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
--USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD;

ENTITY memoria IS
GENERIC (n: INTEGER:=10);
PORT 	(	adress: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			y, u, x, dx: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
END memoria;

ARCHITECTURE comportamento OF memoria IS

TYPE mem IS ARRAY (n-1 DOWNTO 0) OF STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL memoria_y: mem:= (
"00000000000000000000000000000010",
"00000000000000000000000000000010",
"00000000000000000000000000000010",
"00000000000000000000000000000010",
"00000000000000000000000000000010",
"00000000000000000000000000000010",
"00000000000000000000000000000010",
"00000000000000000000000000000010",
"00000000000000000000000000000010",
"00000000000000000000000000000010");

SIGNAL memoria_x: mem:= (
"00000000000000000000000000000010",
"00000000000000000000000000000010",
"00000000000000000000000000000010",
"00000000000000000000000000000010",
"00000000000000000000000000000010",
"00000000000000000000000000000010",
"00000000000000000000000000000010",
"00000000000000000000000000000010",
"00000000000000000000000000000010",
"00000000000000000000000000000010");

SIGNAL memoria_dx: mem:= (
"00000000000000000000000000000010",
"00000000000000000000000000000010",
"00000000000000000000000000000010",
"00000000000000000000000000000010",
"00000000000000000000000000000010",
"00000000000000000000000000000010",
"00000000000000000000000000000010",
"00000000000000000000000000000010",
"00000000000000000000000000000010",
"00000000000000000000000000000010");

SIGNAL memoria_u: mem:= (
"00000000000000000000000000000010",
"00000000000000000000000000000010",
"00000000000000000000000000000010",
"00000000000000000000000000000010",
"00000000000000000000000000000010",
"00000000000000000000000000000010",
"00000000000000000000000000000010",
"00000000000000000000000000000010",
"00000000000000000000000000000010",
"00000000000000000000000000000010");


BEGIN

y <= memoria_y(CONV_INTEGER(adress));
x <= memoria_x(CONV_INTEGER(adress));
dx <= memoria_dx(CONV_INTEGER(adress));
u <= memoria_u(CONV_INTEGER(adress));

END comportamento;