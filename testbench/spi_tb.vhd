library ieee;
use ieee.std_logic_1164.all;

library work;
use work.SPI_pkg.all;


entity spi_tb is
end entity;

architecture arch_spi_tb of spi_tb is

signal cs, mosi, miso, sclk : std_logic;


-- SPI by default to 15 bits, to change in the SPI_pkg.vhd
signal read_value_slave, read_value_master : std_logic_vector(14 downto 0);


begin





-- master
 process begin
    mosi <= '0';
    
-- READ from a SLAVE

    -- big endian
    -- parameters : CS, MISO, SCLK, <signal to see the value received>, <clk period> ...
    --                        ...  <big/little endian>, <cpol>, <cpha>
    -- by default : big/little endian := '0' (big endian) ['1' little endian]
    --              cpol := '0', cpha := '0' (mode 0)
    
    spi_master_read(cs, miso, sclk, read_value_master, 10 ns, '0', '0', '0');
    spi_master_read(cs, miso, sclk, read_value_master, 10 ns, '0', '0', '1');
    spi_master_read(cs, miso, sclk, read_value_master, 10 ns, '0', '1', '0');
    spi_master_read(cs, miso, sclk, read_value_master, 10 ns, '0', '1', '1');
    
    -- same with other procedure (last value: big/little endian)
--    spi_master_read_mode0(cs, miso, sclk, read_value_master, 10 ns, '0');
--    spi_master_read_mode1(cs, miso, sclk, read_value_master, 10 ns);
--    spi_master_read_mode2(cs, miso, sclk, read_value_master, 10 ns, '0');
--    spi_master_read_mode3(cs, miso, sclk, read_value_master, 10 ns);
    
    
    -- little endian
    spi_master_read(cs, miso, sclk, read_value_master, 10 ns, '1', '0', '0');
    spi_master_read(cs, miso, sclk, read_value_master, 10 ns, '1', '0', '1');
    spi_master_read(cs, miso, sclk, read_value_master, 10 ns, '1', '1', '0');
    spi_master_read(cs, miso, sclk, read_value_master, 10 ns, '1', '1', '1');
    
    -- same with other procedure (last value: big/little endian)
--    spi_master_read_mode0(cs, miso, sclk, read_value_master, 10 ns, '1');
--    spi_master_read_mode1(cs, miso, sclk, read_value_master, 10 ns, '1');
--    spi_master_read_mode2(cs, miso, sclk, read_value_master, 10 ns, '1');
--    spi_master_read_mode3(cs, miso, sclk, read_value_master, 10 ns, '1');



-- WRITE to a SLAVE

    -- big endian
    -- parameters : CS, MOSI, SCLK, value, <clk period> ...
    --                        ...  <big/little endian>, <cpol>, <cpha>
    -- by default : big/little endian := '0' (big endian) ['1' little endian]
    --              cpol := '0', cpha := '0' (mode 0)
    
    spi_master_write(cs, mosi, sclk, "110101010101011", 10 ns);
    spi_master_write(cs, mosi, sclk, "110101010101011", 10 ns, '0', '0', '1');
    spi_master_write(cs, mosi, sclk, "110101010101011", 10 ns, '0', '1', '0');
    spi_master_write(cs, mosi, sclk, "110101010101011", 10 ns, '0', '1', '1');
    
    -- same with other procedure (last value: big/little endian)
--    spi_master_write_mode0(cs, mosi, sclk, "110101010101011", 10 ns, '0');
--    spi_master_write_mode1(cs, mosi, sclk, "110101010101011", 10 ns, '0');
--    spi_master_write_mode2(cs, mosi, sclk, "110101010101011", 10 ns);
--    spi_master_write_mode3(cs, mosi, sclk, "110101010101011", 10 ns);
    
    
    -- little endian
    spi_master_write(cs, mosi, sclk, "110101010101011", 10 ns, '1');
    spi_master_write(cs, mosi, sclk, "110101010101011", 10 ns, '1', '0', '1');
    spi_master_write(cs, mosi, sclk, "110101010101011", 10 ns, '1', '1', '0');
    spi_master_write(cs, mosi, sclk, "110101010101011", 10 ns, '1', '1', '1');
    
    -- same with other procedure (last value: big/little endian)
--    spi_master_write_mode0(cs, mosi, sclk, "110101010101011", 10 ns, '1');
--    spi_master_write_mode1(cs, mosi, sclk, "110101010101011", 10 ns, '1');
--    spi_master_write_mode2(cs, mosi, sclk, "110101010101011", 10 ns, '1');
--    spi_master_write_mode3(cs, mosi, sclk, "110101010101011", 10 ns, '1');
    
    report "stop" severity failure;
 end process;
 
 
 
 
 
 
-- slave
 process begin
 
 -- WRITE to a MASTER

    -- big endian
    -- parameters : CS, MOSI, SCLK, value, <clk period> ...
    --                        ...  <big/little endian>, <cpol>, <cpha>
    -- by default : big/little endian := '0' (big endian) ['1' little endian]
    --              cpol := '0', cpha := '0' (mode 0)
    
    spi_slave_write(cs, miso, sclk, "110101010101011", 10 ns, '0', '0', '0');
    spi_slave_write(cs, miso, sclk, "110101010101011", 10 ns, '0', '0', '1');
    spi_slave_write(cs, miso, sclk, "110101010101011", 10 ns, '0', '1', '0');
    spi_slave_write(cs, miso, sclk, "110101010101011", 10 ns, '0', '1', '1');
    
    -- same with other procedure (last value: big/little endian)
--    spi_slave_write_mode0(cs, miso, sclk, "110101010101011", 10 ns);
--    spi_slave_write_mode1(cs, miso, sclk, "110101010101011", 10 ns);
--    spi_slave_write_mode2(cs, miso, sclk, "110101010101011", 10 ns);
--    spi_slave_write_mode3(cs, miso, sclk, "110101010101011", 10 ns, '0');


    -- little endian
    spi_slave_write(cs, miso, sclk, "110101010101011", 10 ns, '1', '0', '0');
    spi_slave_write(cs, miso, sclk, "110101010101011", 10 ns, '1', '0', '1');
    spi_slave_write(cs, miso, sclk, "110101010101011", 10 ns, '1', '1', '0');
    spi_slave_write(cs, miso, sclk, "110101010101011", 10 ns, '1', '1', '1');

    -- same with other procedure (last value: big/little endian)
--    spi_slave_write_mode0(cs, miso, sclk, "110101010101011", 10 ns, '1');
--    spi_slave_write_mode1(cs, miso, sclk, "110101010101011", 10 ns, '1');
--    spi_slave_write_mode2(cs, miso, sclk, "110101010101011", 10 ns, '1');
--    spi_slave_write_mode3(cs, miso, sclk, "110101010101011", 10 ns, '1');

    
    
-- READ from a MASTER

    -- big endian
    -- parameters : CS, MISO, SCLK, <signal to see the value received>, <clk period> ...
    --                        ...  <big/little endian>, <cpol>, <cpha>
    -- by default : big/little endian := '0' (big endian) ['1' little endian]
    --              cpol := '0', cpha := '0' (mode 0)
    
    spi_slave_read(cs, mosi, sclk, read_value_slave, 10 ns, '0');
    spi_slave_read(cs, mosi, sclk, read_value_slave, 10 ns, '0', '0', '1');
    spi_slave_read(cs, mosi, sclk, read_value_slave, 10 ns, '0', '1', '0');
    spi_slave_read(cs, mosi, sclk, read_value_slave, 10 ns, '0', '1', '1');
    
     -- same with other procedure (last value: big/little endian)
--    spi_slave_read_mode0(cs, mosi, sclk, read_value_slave, 10 ns);
--    spi_slave_read_mode1(cs, mosi, sclk, read_value_slave, 10 ns);
--    spi_slave_read_mode2(cs, mosi, sclk, read_value_slave, 10 ns, '0');
--    spi_slave_read_mode3(cs, mosi, sclk, read_value_slave, 10 ns);
     
     
    -- little endian
    spi_slave_read(cs, miso, sclk, read_value_slave, 10 ns, '1', '0', '0');
    spi_slave_read(cs, miso, sclk, read_value_slave, 10 ns, '1', '0', '1');
    spi_slave_read(cs, miso, sclk, read_value_slave, 10 ns, '1', '1', '0');
    spi_slave_read(cs, miso, sclk, read_value_slave, 10 ns, '1', '1', '1');
    
     -- same with other procedure (last value: big/little endian)
--    spi_slave_read_mode0(cs, miso, sclk, read_value_slave, 10 ns, '1');
--    spi_slave_read_mode1(cs, miso, sclk, read_value_slave, 10 ns, '1');
--    spi_slave_read_mode2(cs, miso, sclk, read_value_slave, 10 ns, '1');
--    spi_slave_read_mode3(cs, miso, sclk, read_value_slave, 10 ns, '1');
    
    report "stop" severity failure;
 end process;

end architecture;