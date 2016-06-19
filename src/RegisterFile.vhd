library ieee;
use ieee.std_logic_1164.all;

entity RegisterFile is
    port(
        clk     : in std_logic;
        reset   : in std_logic;
        rsel1   : in std_logic_vector(3 downto 0);
        rsel2   : in std_logic_vector(3 downto 0);
        wsel    : in std_logic;
        wdat    : in std_logic_vector(31 downto 0);
        rdat1   : out std_logic_vector(31 downto 0);
        rdat2   : out std_logic_vector(31 downto 0));
end RegisterFile;

architecture Behavioral of RegisterFile is

begin

---

end Behavioral;