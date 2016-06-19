library ieee;
use ieee.std_logic_1164.all;

entity MainControl is
    port(
        opcode      : in std_logic_vector(5 downto 0);
        funct       : in std_logic_vector(5 downto 0);
        branch      : out std_logic_vector(1 downto 0);
        ALUOp       : out std_logic_vector(3 downto 0);
        extOp       : out std_logic_vector(1 downto 0);
        jump        : out std_logic;
        load        : out std_logic;
        memWrite    : out std_logic;
        regWrite    : out std_logic;
        memToReg    : out std_logic_vector(1 downto 0);
        ALUsrc      : out std_logic;
        regDst      : out std_logic_vector(1 downto 0));
end MainControl;

architecture Behavioral of MainControl is

begin

    ---

end Behavioral;