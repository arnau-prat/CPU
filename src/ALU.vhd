library ieee;
use ieee.std_logic_1164.all;

entity ALU is
    port(
        alu_op  : in std_logic_vector(6 downto 0);
        in_a    : in std_logic_vector(31 downto 0);
        in_b    : in std_logic_vector(31 downto 0);
        result  : out std_logic_vector(31 downto 0);
        zero    : out std_logic);
end ALU;

architecture Behavioral of ALU is

begin

    ---

end Behavioral;