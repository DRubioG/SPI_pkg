# SPI_pkg

This package simulates the SPI protocol in VHDL for the testbenchs

This has every SPI mode included.

[package](./src/SPI_pkg.vhd)

This package contains all the procedures that do the simulation.
This package is by default to 15 bit, but you can change.
It also has a blanking time for insurace the communication.
``` vhdl
-- All the file is fed by this constants.
constant WIDTH : integer := 15;
constant blanking_time : time := 2 ns;
```

[testbench](./testbench/spi_tb.vhd)

This testbench has an example of the use also if you are master or you are slave.

If you are master you use this procedures, for reading from a slave or for writing to a slave.

```vhdl
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
```

If you are slave you use this procedures, for reading from a master or for writing to a master.

```vhdl
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
```