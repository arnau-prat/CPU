library ieee;
use ieee.std_logic_1164.all;

entity ALUControl is
    port(
        ALUOp_RegD  : in std_logic_vector(3 downto 0);
        funct_RegD  : in std_logic_vector(5 downto 0);
        JR          : in std_logic;
        alu_op      : in std_logic_vector(5 downto 0));
end ALUControl;

architecture Behavioral of ALUControl is

begin

    ---

end Behavioral;