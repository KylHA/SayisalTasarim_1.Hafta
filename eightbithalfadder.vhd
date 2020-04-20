--330133--
--Mehmet Caner YILIK--
--8 bit half adder--
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity eightbithalfadder is
Port(
A : in std_logic_vector(7 downto 0);
B : in std_logic_vector(7 downto 0);
S : out std_logic_vector(7 downto 0);
Carry : out std_logic
);

end eightbithalfadder;

architecture Behovior of eightbithalfadder is

signal C : std_logic_vector (14 downto 0) :="000000000000000";
signal Sa : std_logic_vector (6 downto 0) :="0000000";
signal LAin : std_logic_vector (5 downto 0) :="000000";
begin

process is
begin

S(0) <= A(0) xor B(0);

GEN_REG:for i in 0 to 6 loop
Sa(i) <= A(i+1) xor B(i+1);
end loop GEN_REG;

GEN_Cout: for i in 0 to 7 loop
C(i) <= A(i) and B(i);
end loop GEN_Cout;

S(1) <= Sa(1) xor C(0);

C(8) <= Sa(1) and  C(0);

GEN_SREMAIN: for i in 0 to 5 loop
LAin(i) <= C(i+8) or C(i+1);
C(i+9) <= LAin(i) and Sa(i+1);
S(i+2) <= LAin(i) xor Sa(i+1);
end loop GEN_SREMAIN;

Carry <= C(7) or C(14);

wait for 10 ns;
end process;
end Behovior;