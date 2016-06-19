library ieee;
use ieee.std_logic_1164.all;

entity CPU is
    port(
        clk         : in std_logic;
        reset       : in std_logic);
end CPU;

architecture Behavioral of CPU is

    component RegisterFile
    port(
        clk         : in std_logic;
        reset       : in std_logic;
        rsel1       : in std_logic_vector(3 downto 0);
        rsel2       : in std_logic_vector(3 downto 0);
        wsel        : in std_logic;
        wdat        : in std_logic_vector(31 downto 0);
        rdat1       : out std_logic_vector(31 downto 0);
        rdat2       : out std_logic_vector(31 downto 0));
    end component;

    component MainControl
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
    end component;

    component ALUControl
    port(
        ALUOp_RegD  : in std_logic_vector(3 downto 0);
        funct_RegD  : in std_logic_vector(5 downto 0);
        JR          : in std_logic;
        alu_op      : in std_logic_vector(5 downto 0));
    end component;

    component ALU
    port(
        alu_op      : in std_logic_vector(5 downto 0);
        in_a        : in std_logic_vector(31 downto 0);
        in_b        : in std_logic_vector(31 downto 0);
        result      : out std_logic_vector(31 downto 0);
        zero        : out std_logic);
    end component;

begin

    ---

end Behavioral;