library ieee;
use ieee.std_logic_1164.all;

entity CPU is
    port(
        clk         : in std_logic;
        reset       : in std_logic);
end CPU;

architecture Behavioral of CPU is

    component RAM32
     port(
        clk         : in std_logic;
        reset       : in std_logic;
        r_w         : in std_logic;
        address     : in std_logic_vector(9 downto 0);
        data_in     : in std_logic_vector(31 downto 0);
        data_out    : out std_logic_vector(31 downto 0));
    end component;

    component RegisterFile
    port(
        clk         : in std_logic;
        reset       : in std_logic;
        rsel1       : in std_logic_vector(4 downto 0);
        rsel2       : in std_logic_vector(4 downto 0);
        wen         : in std_logic;
        wsel        : in std_logic_vector(4 downto 0);
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
        memRead     : out std_logic;
        memWrite    : out std_logic;
        regWrite    : out std_logic;
        memToReg    : out std_logic_vector(1 downto 0);
        ALUsrc      : out std_logic;
        regDst      : out std_logic_vector(1 downto 0));
    end component;

    component ALUControl
    port(
        ALUOp       : in std_logic_vector(3 downto 0);
        funct       : in std_logic_vector(5 downto 0);
        JR          : out std_logic;
        alu_op      : out std_logic_vector(5 downto 0));
    end component;

    component ALU
    port(
        alu_op      : in std_logic_vector(5 downto 0);
        in1         : in std_logic_vector(31 downto 0);
        in2         : in std_logic_vector(31 downto 0);
        result      : out std_logic_vector(31 downto 0);
        zero        : out std_logic);
    end component;
      
    component DataMemory
    port(
        clk         : in std_logic;
        reset       : in std_logic;
        memRead     : in std_logic;
        memWrite    : in std_logic;
        address     : in std_logic_vector(9 downto 0);
        data_in     : in std_logic_vector(31 downto 0);
        data_out    : out std_logic_vector(31 downto 0));
    end component;
     
    signal PC       : std_logic; 
    signal instr    : std_logic_vector(31 downto 0);
    signal regDst   : std_logic;
    signal memRead  : std_logic;
    signal memWrite : std_logic;
    signal memToReg : std_logic;
    signal regWrite : std_logic;
    signal ALUOp    : std_logic_vector(3 downto 0);
    signal ALUsrc   : std_logic;
    signal wdat     : std_logic;
    signal wsel     : std_logic;
    signal alu_op   : std_logic_vector(5 downto 0);
    signal op1      : std_logic_vector(31 downto 0);
    signal op2      : std_logic_vector(31 downto 0);
    signal res      : std_logic_vector(31 downto 0);
    signal resDel   : std_logic_vector(31 downto 0);
    signal zero     : std_logic;
     
begin

    uut_RAM32: RAM32 PORT MAP (
        clk         => clk,
        reset       => reset, 
        r_w         => '1',
        address     => PC,
        data_in     => x"00000000",
        data_out    => instr);
          
     wdat <= resDel when memToReg = '1' else res;
     
    wsel <= instr(15 downto 11) when regDst = '1'
       else instr(25 downto 21);

    uut_registerFile: RegisterFile PORT MAP (
        clk         => clk,
        reset       => reset, 
        rsel1       => instr(25 downto 21),
        rsel2       => instr(20 downto 16),
        wen         => regWrite,
        wsel        => wsel,
        wdat        => wdat,
        rdat1       => op1,
        rdat2       => op2);
          
    uut_ALU: ALU PORT MAP (
        alu_op      => alu_op,
        in1         => op1,
        in2         => op2,
        result      => res,
        zero        => zero);
          
    op_b <= instr(15 downto 0) when ALUsrc = '1' else op_b;
          
    uut_DataMemory: DataMemory PORT MAP (
        clk         => clk,
        reset       => reset, 
        memRead     => memRead,
        memWrite    => memWrite,
        address     => res,
        data_in     => op_b,
        data_out    => resDel);
          
    uut_MainControl: MainControl PORT MAP (
        opcode      => instr(5 downto 0),
        funct       => instr(5 downto 0),
        branch      => branch, ---
        ALUOp       => ALUOp,
        extOp       => extOp, ---
        jump        => jump, ---
        load        => load, ---
        memRead     => memRead,
        memWrite    => memWrite,
        regWrite    => regWrite,
        memToReg    => memToReg,
        ALUsrc      => ALUsrc,
        regDst      => regDst);
        
    uut_ALUControl: ALUControl PORT MAP (
        ALUOp       => ALUOp,
        funct       => instr(6 downto 0),
        JR          => '1',
        alu_op      => alu_op);
        
    ---

end Behavioral;