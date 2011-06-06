LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY funcao IS
GENERIC (n: INTEGER := 10);
 PORT (	clk,reset: IN STD_LOGIC;
			resultado_f1: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			resultado_f2: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			resultado_f3: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
END funcao;

ARCHITECTURE comportamento OF funcao IS

COMPONENT controle IS
GENERIC(n: INTEGER:=10);
PORT 	(	clk,reset: IN STD_LOGIC;
			adress: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
END COMPONENT;

COMPONENT memoria IS
PORT 	(	adress: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			y, u, x, dx: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
END COMPONENT;

COMPONENT data_path IS
PORT 	(	clk,reset: IN STD_LOGIC;
			y, x, dx, u: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			resultado_f1: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			resultado_f2: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			resultado_f3: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
END COMPONENT;

SIGNAL adress, y, u, dx, x: STD_LOGIC_VECTOR(31 DOWNTO 0);

BEGIN

CONTROLE_0: controle GENERIC MAP (10) PORT MAP (
clk => clk,
reset => reset,
adress => adress
);

MEMORIA_0: memoria PORT MAP (
adress => adress,
y => y,
x => x,
u => u,
dx => dx
);

DATA_PATH_0: data_path PORT MAP (
clk => clk,
reset => reset,
y => y,
x => x,
dx => dx,
u => u,
resultado_f1 => resultado_f1,
resultado_f2 => resultado_f2,
resultado_f3 => resultado_f3
);

END comportamento;