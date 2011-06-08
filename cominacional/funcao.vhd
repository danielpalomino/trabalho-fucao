LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY funcao IS
 PORT (	clk,reset: IN STD_LOGIC
		);
END funcao;

ARCHITECTURE comportamento OF funcao IS

COMPONENT data_path IS
PORT 	(	clk,reset: IN STD_LOGIC;
			y, x, dx, u, i_in: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			i_out: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			resultado_f1: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			resultado_f2: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			resultado_f3: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
END COMPONENT;

COMPONENT controle IS
GENERIC(n: INTEGER:=10);
PORT 	(	clk,reset: IN STD_LOGIC;
			i: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			write_enable: OUT STD_LOGIC;
			adress: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
END COMPONENT;

COMPONENT write_memory IS
GENERIC (n: INTEGER:=10);
PORT 	(	
			clk, enable: IN STD_LOGIC;
			data_f1, data_f2, data_f3, adress: IN STD_LOGIC_VECTOR(31 DOWNTO 0)			
		);
END COMPONENT;

COMPONENT read_memory IS
GENERIC (n: INTEGER:=10);
PORT 	(	clk, reset: IN STD_LOGIC;
			adress: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			y, u, x, dx: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
END COMPONENT;

SIGNAL read_adress, write_adress, y, u, dx, x: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL resultado_f1, resultado_f2, resultado_f3: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL write_enable: STD_LOGIC;

BEGIN

CONTROLE_0: controle GENERIC MAP (10) PORT MAP(
clk => clk,
reset => reset,
i => write_adress,
write_enable => write_enable,
adress => read_adress
);

READ_MEMORY_0: read_memory GENERIC MAP (10) PORT MAP(
clk => clk,
reset => reset,
adress => read_adress,
y => y,
u => u,
x => x,
dx => dx
);

DATA_PATH_0: data_path PORT MAP(
clk => clk,
reset => reset,
y => y,
x => x,
dx => dx,
u => u,
i_in => read_adress,
i_out => write_adress,
resultado_f1 => resultado_f1,
resultado_f2 => resultado_f2,
resultado_f3 => resultado_f3
);

WRITE_MEMORY_0: write_memory GENERIC MAP (10) PORT MAP(
clk => clk,
enable => write_enable,
data_f1 => resultado_f1,
data_f2 => resultado_f2,
data_f3 => resultado_f3,
adress => write_adress
);

END comportamento;