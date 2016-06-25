library ieee;
use ieee.std_logic_1164.all;

use ieee.numeric_std.all;

entity RegisterFile is
    port(
        clk     : in std_logic;
        reset   : in std_logic;
        rsel1   : in std_logic_vector(4 downto 0);
        rsel2   : in std_logic_vector(4 downto 0);
        wen     : in std_logic;
        wsel    : in std_logic_vector(4 downto 0);
        wdat    : in std_logic_vector(31 downto 0);
        rdat1   : out std_logic_vector(31 downto 0);
        rdat2   : out std_logic_vector(31 downto 0));
end RegisterFile;

architecture Behavioral of RegisterFile is
type store_t is array (0 to 7) of std_logic_vector(31 downto 0);
signal regs: store_t := (others => X"00000000");
begin
    process(clk)
     begin
        if rising_edge(clk) and wen='1' then
            rdat1 <= regs(to_integer(unsigned(rsel1)));
            rdat2 <= regs(to_integer(unsigned(rsel2)));
            if (wen = '1') then
                regs(to_integer(unsigned(wsel))) <= wdat;
            end if;
        end if;
    end process;

end Behavioral;