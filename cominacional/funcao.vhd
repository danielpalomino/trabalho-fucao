LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY funcao IS
 PORT (	clk, reset, start: IN STD_LOGIC;
			ready: OUT STD_LOGIC
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
PORT 	(	clk,reset, start: IN STD_LOGIC;
			i: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			write_enable: OUT STD_LOGIC;
			adress: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			ready: OUT STD_LOGIC
		);
END COMPONENT;

COMPONENT write_memory IS
PORT 	(	
			clk, reset: IN STD_LOGIC;
			we: IN STD_LOGIC;
			data_f1, data_f2, data_f3, adress: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			out_f1, out_f2, out_f3: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
END COMPONENT;

COMPONENT read_memory IS
PORT 	(	clk, reset: IN STD_LOGIC;
			we: IN STD_LOGIC;
			adress: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			y_in, u_in, x_in, dx_in: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			y, u, x, dx: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
END COMPONENT;

SIGNAL read_adress, write_adress, y_signal, u_signal, dx_signal, x_signal: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL resultado_f1_signal, resultado_f2_signal, resultado_f3_signal: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL write_enable: STD_LOGIC;

BEGIN

CONTROLE_0: controle GENERIC MAP (10) PORT MAP(
clk => clk,
reset => reset,
start => start,
i => write_adress,
write_enable => write_enable,
adress => read_adress,
ready => ready
);

READ_MEMORY_0: read_memory PORT MAP(
clk => clk,
reset => reset,
we => '0',
adress => read_adress,
y_in => "00000000000000000000000000000000",
u_in => "00000000000000000000000000000000",
x_in => "00000000000000000000000000000000",
dx_in => "00000000000000000000000000000000",
y => y_signal,
u => u_signal,
x => x_signal,
dx => dx_signal
);

DATA_PATH_0: data_path PORT MAP(
clk => clk,
reset => reset,
y => y_signal,
x => x_signal,
dx => dx_signal,
u => u_signal,
i_in => read_adress,
i_out => write_adress,
resultado_f1 => resultado_f1_signal,
resultado_f2 => resultado_f2_signal,
resultado_f3 => resultado_f3_signal
);

WRITE_MEMORY_0: write_memory PORT MAP(
clk => clk,
reset => reset,
we => write_enable,
data_f1 => resultado_f1_signal,
data_f2 => resultado_f2_signal,
data_f3 => resultado_f3_signal,
adress => write_adress,
out_f1 => open,
out_f2 => open,
out_f3 => open
);

END comportamento;