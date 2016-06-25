library ieee;
use ieee.std_logic_1164.all;

entity ALU is
    port(
        alu_op  : in std_logic_vector(5 downto 0);
        in1     : in std_logic_vector(31 downto 0);
        in2     : in std_logic_vector(31 downto 0);
        result  : out std_logic_vector(31 downto 0);
        zero    : out std_logic);
end ALU;

architecture Behavioral of ALU is

begin

    ---

end Behavioral;