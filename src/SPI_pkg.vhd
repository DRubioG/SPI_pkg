--
-- This package simulates the communication between two devices using SPI
-- It is needed at least one part for the master read/write and other for
-- the slave read/write.
-- By default this package work with 15 bits, but this could be changed.
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package SPI_pkg is
    -- All the file is fed by this constants.
    constant WIDTH : integer := 15;
    constant blanking_time : time := 2 ns;


-- MASTER MODES
-- writing

    -- writing in mode 0
    procedure spi_master_write_mode0 (
        signal cs : out std_logic;
        signal mosi : out std_logic;
        signal sclk : out std_logic;
        value : std_logic_vector(WIDTH-1 downto 0);
        clk_period : time;
        little_endian : std_logic := '0'
    );
    
    -- writing in mode 1
    procedure spi_master_write_mode1 (
        signal cs : out std_logic;
        signal mosi : out std_logic;
        signal sclk : out std_logic;
        value : std_logic_vector(WIDTH-1 downto 0);
        clk_period : time;
        little_endian : std_logic := '0'
    );
    
    -- writing in mode 2
    procedure spi_master_write_mode2 (
        signal cs : out std_logic;
        signal mosi : out std_logic;
        signal sclk : out std_logic;
        value : std_logic_vector(WIDTH-1 downto 0);
        clk_period : time;
        little_endian : std_logic := '0'
    );
    
    -- writing in mode 3
    procedure spi_master_write_mode3 (
        signal cs : out std_logic;
        signal mosi : out std_logic;
        signal sclk : out std_logic;
        value : std_logic_vector(WIDTH-1 downto 0);
        clk_period : time;
        little_endian : std_logic := '0'
    );
    
    -- generic writing with cpol and cpha
    procedure spi_master_write (
        signal cs : out std_logic;
        signal mosi : out std_logic;
        signal sclk : out std_logic;
        value : std_logic_vector(WIDTH-1 downto 0);
        clk_period : time;
        little_endian : std_logic := '0';
        cpol : std_logic := '0';
        cpha : std_logic := '0'
    );
    
    
-- reading

   -- reading in mode 0
    procedure spi_master_read_mode0 (
        signal cs : out std_logic;
        signal miso : in std_logic;
        signal sclk : out std_logic;
        signal read_value : out std_logic_vector(WIDTH-1 downto 0);
        clk_period : time;
        little_endian : std_logic := '0'
    );
    
   -- reading in mode 1
    procedure spi_master_read_mode1 (
        signal cs : out std_logic;
        signal miso : in std_logic;
        signal sclk : out std_logic;
        signal read_value : out std_logic_vector(WIDTH-1 downto 0);
        clk_period : time;
        little_endian : std_logic := '0'
    );
    
   -- reading in mode 2
    procedure spi_master_read_mode2 (
        signal cs : out std_logic;
        signal miso : in std_logic;
        signal sclk : out std_logic;
        signal read_value : out std_logic_vector(WIDTH-1 downto 0);
        clk_period : time;
        little_endian : std_logic := '0'
    );
    
   -- reading in mode 3
    procedure spi_master_read_mode3 (
        signal cs : out std_logic;
        signal miso : in std_logic;
        signal sclk : out std_logic;
        signal read_value : out std_logic_vector(WIDTH-1 downto 0);
        clk_period : time;
        little_endian : std_logic := '0'
    );
    
   -- generic reading with cpol and cpha
    procedure spi_master_read (
        signal cs : out std_logic;
        signal miso : in std_logic;
        signal sclk : out std_logic;
        signal read_value : out std_logic_vector(WIDTH-1 downto 0);
        clk_period : time;
        little_endian : std_logic := '0';
        cpol : std_logic := '0';
        cpha : std_logic := '0'
    );


-- SLAVE MODES

--writing

    -- writing in mode 0
    procedure spi_slave_write_mode0 (
        signal cs : in std_logic;
        signal miso : out std_logic;
        signal sclk : in std_logic;
        value : std_logic_vector(WIDTH-1 downto 0);
        clk_period : time;
        little_endian : std_logic := '0'
    );
    
    -- writing in mode 1
    procedure spi_slave_write_mode1 (
        signal cs : in std_logic;
        signal miso : out std_logic;
        signal sclk : in std_logic;
        value : std_logic_vector(WIDTH-1 downto 0);
        clk_period : time;
        little_endian : std_logic := '0'
    );
    
    -- writing in mode 2
    procedure spi_slave_write_mode2 (
        signal cs : in std_logic;
        signal miso : out std_logic;
        signal sclk : in std_logic;
        value : std_logic_vector(WIDTH-1 downto 0);
        clk_period : time;
        little_endian : std_logic := '0'
    );
    
    -- writing in mode 3
    procedure spi_slave_write_mode3 (
        signal cs : in std_logic;
        signal miso : out std_logic;
        signal sclk : in std_logic;
        value : std_logic_vector(WIDTH-1 downto 0);
        clk_period : time;
        little_endian : std_logic := '0'
    );
    
    -- generic writing with cpol and cpha
    procedure spi_slave_write (
        signal cs : in std_logic;
        signal miso : out std_logic;
        signal sclk : in std_logic;
        value : std_logic_vector(WIDTH-1 downto 0);
        clk_period : time;
        little_endian : std_logic := '0';
        cpol : std_logic := '0';
        cpha : std_logic := '0'
    );

-- reading

    -- reading in mode 0
    procedure spi_slave_read_mode0 (
        signal cs : in std_logic;
        signal mosi : in std_logic;
        signal sclk : in std_logic;
        signal read_value : out std_logic_vector(WIDTH-1 downto 0);
        clk_period : time;
        little_endian : std_logic := '0'
    );
    
    -- reading in mode 1
    procedure spi_slave_read_mode1 (
        signal cs : in std_logic;
        signal mosi : in std_logic;
        signal sclk : in std_logic;
        signal read_value : out std_logic_vector(WIDTH-1 downto 0);
        clk_period : time;
        little_endian : std_logic := '0'
    );
    
    -- reading in mode 2
    procedure spi_slave_read_mode2 (
        signal cs : in std_logic;
        signal mosi : in std_logic;
        signal sclk : in std_logic;
        signal read_value : out std_logic_vector(WIDTH-1 downto 0);
        clk_period : time;
        little_endian : std_logic := '0'
    );
    
    -- reading in mode 3
    procedure spi_slave_read_mode3 (
        signal cs : in std_logic;
        signal mosi : in std_logic;
        signal sclk : in std_logic;
        signal read_value : out std_logic_vector(WIDTH-1 downto 0);
        clk_period : time;
        little_endian : std_logic := '0'
    );
    
    -- generic writing with cpol and cpha
    procedure spi_slave_read (
        signal cs : in std_logic;
        signal mosi : in std_logic;
        signal sclk : in std_logic;
        signal read_value : out std_logic_vector(WIDTH-1 downto 0);
        clk_period : time;
        little_endian : std_logic := '0';
        cpol : std_logic := '0';
        cpha : std_logic := '0'
    );
    
end package;

package body SPI_pkg is

-- MASTER MODES
-- Writing

-- This procedure writes a data to the slave in mode 0
-- Parameters: 
--      CS : chip select line
--      MOSI : write line for the master
--      SCLK : clock line
--      value : value for sending
--      clk_period : clock period
--      little_endian : parameter for sending using big endian or little endian
--                      by default in big endian('0') ['1' for little endian]
    procedure spi_master_write_mode0 (
        signal cs : out std_logic;
        signal mosi : out std_logic;
        signal sclk : out std_logic;
        value : std_logic_vector(WIDTH-1 downto 0);
        clk_period : time;
        little_endian : std_logic := '0'
    ) is
    begin
        sclk <= '0';
        cs <= '1';
        wait for clk_period;
        cs <= '0';
        wait for blanking_time;
        
        if little_endian = '1' then
            for i in 0 to WIDTH-1 loop
                mosi <= value(i);
                sclk <= '0';
                wait for clk_period/2;
                sclk <= '1';    -- rising_edge sampling
                wait for clk_period/2;
            end loop;
        else
            for i in WIDTH-1 downto 0 loop
                mosi <= value(i);
                sclk <= '0';
                wait for clk_period/2;
                sclk <= '1';    -- rising_edge sampling
                wait for clk_period/2;
            end loop;
        end if;
        
        mosi <= '0';
        sclk <= '0';
        cs <= '1';
        wait for clk_period;
        
    end procedure;
    
    
-- This procedure writes a data to the slave in mode 1
-- Parameters: 
--      CS : chip select line
--      MOSI : write line for the master
--      SCLK : clock line
--      value : value for sending
--      clk_period : clock period
--      little_endian : parameter for sending using big endian or little endian
--                      by default in big endian('0') ['1' for little endian]
    procedure spi_master_write_mode1 (
        signal cs : out std_logic;
        signal mosi : out std_logic;
        signal sclk : out std_logic;
        value : std_logic_vector(WIDTH-1 downto 0);
        clk_period : time;
        little_endian : std_logic := '0'
    ) is
    begin
        sclk <= '0';
        cs <= '1';
        wait for clk_period;
        cs <= '0';
        wait for blanking_time;
        
        if little_endian = '1' then
            for i in 0 to WIDTH-1 loop
                sclk <= '1';    -- falling_edge sampling
                mosi <= value(i);
                wait for clk_period/2;
                sclk <= '0';
                wait for clk_period/2;
            end loop;
        else
            for i in WIDTH-1 downto 0 loop
                sclk <= '1';    -- falling_edge sampling
                mosi <= value(i);
                wait for clk_period/2;
                sclk <= '0';
                wait for clk_period/2;
            end loop;
        end if;
        
        mosi <= '0';
        cs <= '1';
        wait for clk_period;
        
    end procedure;
    
   
-- This procedure writes a data to the slave in mode 2
-- Parameters: 
--      CS : chip select line
--      MOSI : write line for the master
--      SCLK : clock line
--      value : value for sending
--      clk_period : clock period
--      little_endian : parameter for sending using big endian or little endian
--                      by default in big endian('0') ['1' for little endian] 
    procedure spi_master_write_mode2 (
        signal cs : out std_logic;
        signal mosi : out std_logic;
        signal sclk : out std_logic;
        value : std_logic_vector(WIDTH-1 downto 0);
        clk_period : time;
        little_endian : std_logic := '0'
    ) is
    begin
        sclk <= '1';
        cs <= '1';
        wait for clk_period/2;
        cs <= '0';
        wait for blanking_time;
        
        if little_endian = '1' then
            for i in 0 to WIDTH-1 loop
                sclk <= '0';    -- falling_edge sampling
                wait for clk_period/2;
                mosi <= value(i);
                sclk <= '1';
                wait for clk_period/2;
            end loop;
        else
            for i in WIDTH-1 downto 0 loop
                sclk <= '0';    -- falling_edge sampling
                wait for clk_period/2;
                mosi <= value(i);
                sclk <= '1';
                wait for clk_period/2;
            end loop;
        end if;
        
        sclk <= '0';
        wait for clk_period/2;
        sclk <= '1';
        wait for blanking_time;
        mosi <= '0';
        cs <= '1';
        wait for clk_period/2;
        sclk <= '0';
        wait for clk_period/2;
     end procedure;
     
     
-- This procedure writes a data to the slave in mode 3
-- Parameters: 
--      CS : chip select line
--      MOSI : write line for the master
--      SCLK : clock line
--      value : value for sending
--      clk_period : clock period
--      little_endian : parameter for sending using big endian or little endian
--                      by default in big endian('0') ['1' for little endian]
     procedure spi_master_write_mode3 (
        signal cs : out std_logic;
        signal mosi : out std_logic;
        signal sclk : out std_logic;
        value : std_logic_vector(WIDTH-1 downto 0);
        clk_period : time;
        little_endian : std_logic := '0'
    ) is
    begin
        sclk <= '1';
        cs <= '1';
        wait for clk_period/2;
        cs <= '0';
        wait for blanking_time;
        
        if little_endian = '1' then
            for i in 0 to WIDTH-1 loop
                sclk <= '0';    -- rising_edge sampling
                mosi <= value(i);
                wait for clk_period/2;
                sclk <= '1';
                wait for clk_period/2;
            end loop;
        else
            for i in WIDTH-1 downto 0 loop
                sclk <= '0';    -- rising_edge sampling
                mosi <= value(i);
                wait for clk_period/2;
                sclk <= '1';
                wait for clk_period/2;
            end loop;
        end if;
        
        sclk <= '0';
        wait for clk_period/2;
        sclk <= '1';
        wait for blanking_time;
        mosi <= '0';
        cs <= '1';
        wait for clk_period/2;
        sclk <= '0';
        wait for clk_period/2;
     end procedure;
     
     
     
-- This procedure write a data to the slave using cpol and cpha
-- Parameters: 
--      CS : chip select line
--      MOSI : write line for the master
--      SCLK : clock line
--      value : value for sending
--      clk_period : clock period
--      little_endian : parameter for sending using big endian or little endian
--                      by default in big endian('0') ['1' for little endian]
--      cpol : sclk polarity
--      cpha : sample edge
     procedure spi_master_write (
        signal cs : out std_logic;
        signal mosi : out std_logic;
        signal sclk : out std_logic;
        value : std_logic_vector(WIDTH-1 downto 0);
        clk_period : time;
        little_endian : std_logic := '0';
        cpol : std_logic := '0';
        cpha : std_logic := '0'
    ) is
    begin
        if cpol = '0' and cpha = '0' then
            spi_master_write_mode0 (cs, mosi, sclk, value, clk_period, little_endian);
        elsif cpol = '0' and cpha = '1' then
            spi_master_write_mode1 (cs, mosi, sclk, value, clk_period, little_endian);
        elsif cpol = '1' and cpha = '0' then
            spi_master_write_mode2 (cs, mosi, sclk, value, clk_period, little_endian);
        elsif cpol = '1' and cpha = '1' then
            spi_master_write_mode3 (cs, mosi, sclk, value, clk_period, little_endian);
        end if;
    end procedure;


-- reading

-- This procedure reads a data from the slave in mode 0
-- Parameters: 
--      CS : chip select line
--      MISO : read line for the master
--      SCLK : clock line
--      read_value : received value, this signal is for plotting the value
--      clk_period : clock period
--      little_endian : parameter for sending using big endian or little endian
--                      by default in big endian('0') ['1' for little endian]
    procedure spi_master_read_mode0 (
        signal cs : out std_logic;
        signal miso : in std_logic;
        signal sclk : out std_logic;
        signal read_value : out std_logic_vector(WIDTH-1 downto 0);
        clk_period : time;
        little_endian : std_logic := '0'
    ) is
    begin
        read_value <= (others=>'0');
        sclk <= '0';
        cs <= '1';
        wait for clk_period;
        cs <= '0';
        wait for blanking_time;
        
        if little_endian = '1' then
            for i in 0 to WIDTH-1 loop
                sclk <= '0';
                wait for clk_period/2;
                read_value(i) <= miso;
                sclk <= '1';    -- rising_edge sampling
                wait for clk_period/2;
            end loop;
        else
            for i in WIDTH-1 downto 0 loop
                sclk <= '0';
                wait for clk_period/2;
                read_value(i) <= miso;
                sclk <= '1';    -- rising_edge sampling
                wait for clk_period/2;
            end loop;
        end if;
        
        sclk <= '0';
        cs <= '1';
        wait for clk_period;
        
    end procedure;
    
    
-- This procedure reads a data from the slave in mode 1
-- Parameters: 
--      CS : chip select line
--      MISO : read line for the master
--      SCLK : clock line
--      read_value : received value, this signal is for plotting the value
--      clk_period : clock period
--      little_endian : parameter for sending using big endian or little endian
--                      by default in big endian('0') ['1' for little endian]
    procedure spi_master_read_mode1 (
        signal cs : out std_logic;
        signal miso : in std_logic;
        signal sclk : out std_logic;
        signal read_value : out std_logic_vector(WIDTH-1 downto 0);
        clk_period : time;
        little_endian : std_logic := '0'
    ) is
    begin
        read_value <= (others=>'0');
        sclk <= '0';
        cs <= '1';
        wait for clk_period;
        cs <= '0';
        wait for blanking_time;
        
        if little_endian = '1' then
            for i in 0 to WIDTH-1 loop
                sclk <= '1';
                wait for clk_period/2;
                read_value(i) <= miso;
                sclk <= '0';    -- rising_edge sampling
                wait for clk_period/2;
            end loop;
        else
            for i in WIDTH-1 downto 0 loop
                sclk <= '1';
                wait for clk_period/2;
                read_value(i) <= miso;
                sclk <= '0';    -- rising_edge sampling
                wait for clk_period/2;
            end loop;
        end if;
        
        sclk <= '0';
        cs <= '1';
        wait for clk_period;
        
    end procedure;
    
    
-- This procedure reads a data from the slave in mode 2
-- Parameters: 
--      CS : chip select line
--      MISO : read line for the master
--      SCLK : clock line
--      read_value : received value, this signal is for plotting the value
--      clk_period : clock period
--      little_endian : parameter for sending using big endian or little endian
--                      by default in big endian('0') ['1' for little endian]
    procedure spi_master_read_mode2 (
        signal cs : out std_logic;
        signal miso : in std_logic;
        signal sclk : out std_logic;
        signal read_value : out std_logic_vector(WIDTH-1 downto 0);
        clk_period : time;
        little_endian : std_logic := '0'
    ) is
    begin
        read_value <= (others=>'0');
        sclk <= '1';
        cs <= '1';
        wait for clk_period/2;
        cs <= '0';
        wait for blanking_time;
        sclk <= '0';
        wait for clk_period/2;
        sclk <= '1';
        wait for clk_period/2;
        
        if little_endian = '1' then
            
            for i in 0 to WIDTH-1 loop
                sclk <= '0';    -- falling_edge sampling
                read_value(i) <= miso;
                wait for clk_period/2;
                sclk <= '1';
                wait for clk_period/2;
            end loop;
        else
            
            for i in WIDTH-1 downto 0 loop
                sclk <= '0';    -- falling_edge sampling
                read_value(i) <= miso;
                wait for clk_period/2;
                sclk <= '1';
                wait for clk_period/2;
            end loop;
        end if;
        
        cs <= '1';
        wait for clk_period/2;
        sclk <= '0';
        wait for clk_period/2;
     end procedure;
     

-- This procedure reads a data from the slave in mode 3
-- Parameters: 
--      CS : chip select line
--      MISO : read line for the master
--      SCLK : clock line
--      read_value : received value, this signal is for plotting the value
--      clk_period : clock period
--      little_endian : parameter for sending using big endian or little endian
--                      by default in big endian('0') ['1' for little endian]
     procedure spi_master_read_mode3 (
        signal cs : out std_logic;
        signal miso : in std_logic;
        signal sclk : out std_logic;
        signal read_value : out std_logic_vector(WIDTH-1 downto 0);
        clk_period : time;
        little_endian : std_logic := '0'
    ) is
    begin
        read_value <= (others=>'0');
        sclk <= '1';
        cs <= '1';
        wait for clk_period/2;
        cs <= '0';
        wait for blanking_time;
        
        if little_endian = '1' then
            for i in 0 to WIDTH-1 loop
                sclk <= '0';    -- rising_edge sampling
                wait for clk_period/2;
                sclk <= '1';
                read_value(i) <= miso;
                wait for clk_period/2;
            end loop;
        else
            for i in WIDTH-1 downto 0 loop
                sclk <= '0';    -- rising_edge sampling
                wait for clk_period/2;
                sclk <= '1';
                read_value(i) <= miso;
                wait for clk_period/2;
            end loop;
        end if;
        
        sclk <= '0';
        wait for clk_period/2;
        sclk <= '1';
        wait for blanking_time;
        cs <= '1';
        wait for clk_period/2;
        sclk <= '0';
        wait for clk_period/2;
     end procedure;
     
     
-- This procedure reads a data from the slave using cpol and cpha
-- Parameters: 
--      CS : chip select line
--      MISO : read line for the master
--      SCLK : clock line
--      read_value : received value, this signal is for plotting the value
--      clk_period : clock period
--      little_endian : parameter for sending using big endian or little endian
--                      by default in big endian('0') ['1' for little endian]
--      cpol : sclk polarity
--      cpha : sample edge
     procedure spi_master_read (
        signal cs : out std_logic;
        signal miso : in std_logic;
        signal sclk : out std_logic;
        signal read_value : out std_logic_vector(WIDTH-1 downto 0);
        clk_period : time;
        little_endian : std_logic := '0';
        cpol : std_logic := '0';
        cpha : std_logic := '0'
    ) is
    begin
        if cpol = '0' and cpha = '0' then
            spi_master_read_mode0 (cs, miso, sclk, read_value, clk_period, little_endian);
        elsif cpol = '0' and cpha = '1' then
            spi_master_read_mode1 (cs, miso, sclk, read_value, clk_period, little_endian);
        elsif cpol = '1' and cpha = '0' then
            spi_master_read_mode2 (cs, miso, sclk, read_value, clk_period, little_endian);
        elsif cpol = '1' and cpha = '1' then
            spi_master_read_mode3 (cs, miso, sclk, read_value, clk_period, little_endian);
        end if;
    end procedure;


-- SLAVE MODES
-- writing

-- This procedure writes a data to the master in mode 0
-- Parameters: 
--      CS : chip select line
--      MISO : read line for the master
--      SCLK : clock line
--      value : value for sending
--      clk_period : clock period
--      little_endian : parameter for sending using big endian or little endian
--                      by default in big endian('0') ['1' for little endian]
    procedure spi_slave_write_mode0 (
        signal cs : in std_logic;
        signal miso : out std_logic;
        signal sclk : in std_logic;
        value : std_logic_vector(WIDTH-1 downto 0);
        clk_period : time;
        little_endian : std_logic := '0'
    )is
    begin
        miso <= '0';
        wait until cs = '0';
        wait for blanking_time;
        
        if little_endian = '1' then
            miso <= value(0);
            
            for i in 1 to WIDTH-1 loop
                wait until sclk = '0';
                miso <= value(i);
            end loop;
        else
            miso <= value(WIDTH-1);
            
            for i in WIDTH-2 downto 0 loop
                wait until sclk = '0';
                miso <= value(i);
            end loop;
        end if;
        
        wait until cs = '1';
        miso <= '0';
        wait for clk_period; 
    end procedure;
    
    
-- This procedure writes a data to the master in mode 1
-- Parameters: 
--      CS : chip select line
--      MISO : read line for the master
--      SCLK : clock line
--      value : value for sending
--      clk_period : clock period
--      little_endian : parameter for sending using big endian or little endian
--                      by default in big endian('0') ['1' for little endian]
    procedure spi_slave_write_mode1 (
        signal cs : in std_logic;
        signal miso : out std_logic;
        signal sclk : in std_logic;
        value : std_logic_vector(WIDTH-1 downto 0);
        clk_period : time;
        little_endian : std_logic := '0'
    )is
    begin
        miso <= '0';
        wait until cs = '0';
        wait for blanking_time;
        
        if little_endian = '1' then
            for i in 0 to WIDTH-1 loop
                wait until sclk = '1';
                miso <= value(i);
            end loop;
        else
            for i in WIDTH-1 downto 0 loop
                wait until sclk = '1';
                miso <= value(i);
            end loop;
        end if;
        
        wait until cs = '1';
        miso <= '0';
        wait for clk_period; 
    end procedure;
    
    
-- This procedure writes a data to the master in mode 2
-- Parameters: 
--      CS : chip select line
--      MISO : read line for the master
--      SCLK : clock line
--      value : value for sending
--      clk_period : clock period
--      little_endian : parameter for sending using big endian or little endian
--                      by default in big endian('0') ['1' for little endian]
    procedure spi_slave_write_mode2 (
        signal cs : in std_logic;
        signal miso : out std_logic;
        signal sclk : in std_logic;
        value : std_logic_vector(WIDTH-1 downto 0);
        clk_period : time;
        little_endian : std_logic := '0'
    ) is
    begin
        miso <= '0';
        wait until cs = '0';
        wait until sclk = '0';
        wait for blanking_time;
        
        if little_endian = '1' then
            for i in 0 to WIDTH-1 loop
                wait until sclk = '1';
                miso <= value(i);
            end loop;
        else
            for i in WIDTH-1 downto 0 loop
                wait until sclk = '1';
                miso <= value(i);
            end loop;
        end if;
        
        wait until cs = '1';
        miso <= '0';
        wait for clk_period; 
     end procedure;
     
     
-- This procedure writes a data to the master in mode 3
-- Parameters: 
--      CS : chip select line
--      MISO : read line for the master
--      SCLK : clock line
--      value : value for sending
--      clk_period : clock period
--      little_endian : parameter for sending using big endian or little endian
--                      by default in big endian('0') ['1' for little endian]
     procedure spi_slave_write_mode3 (
        signal cs : in std_logic;
        signal miso : out std_logic;
        signal sclk : in std_logic;
        value : std_logic_vector(WIDTH-1 downto 0);
        clk_period : time;
        little_endian : std_logic := '0'
    )is
    begin
        miso <= '0';
        wait until cs = '0';
        wait for blanking_time;
        
        if little_endian = '1' then
            for i in 0 to WIDTH-1 loop
                wait until sclk = '0';
                miso <= value(i);
            end loop;
        else
            for i in WIDTH-1 downto 0 loop
                wait until sclk = '0';
                miso <= value(i);
            end loop;
        end if;
        
        wait until cs = '1';
        miso <= '0';
        wait for clk_period; 
    end procedure;
    

-- This procedure writes a data to the master using cpol and cpha
-- Parameters: 
--      CS : chip select line
--      MISO : read line for the master
--      SCLK : clock line
--      value : value for sending
--      clk_period : clock period
--      little_endian : parameter for sending using big endian or little endian
--                      by default in big endian('0') ['1' for little endian]
--      cpol : sclk polarity
--      cpha : sample edge
    procedure spi_slave_write (
        signal cs : in std_logic;
        signal miso : out std_logic;
        signal sclk : in std_logic;
        value : std_logic_vector(WIDTH-1 downto 0);
        clk_period : time;
        little_endian : std_logic := '0';
        cpol : std_logic := '0';
        cpha : std_logic := '0'
    ) is
    begin
        if cpol = '0' and cpha = '0' then
            spi_slave_write_mode0 (cs, miso, sclk, value, clk_period, little_endian);
        elsif cpol = '0' and cpha = '1' then
            spi_slave_write_mode1 (cs, miso, sclk, value, clk_period, little_endian);
        elsif cpol = '1' and cpha = '0' then
            spi_slave_write_mode2 (cs, miso, sclk, value, clk_period, little_endian);
        elsif cpol = '1' and cpha = '1' then
            spi_slave_write_mode3 (cs, miso, sclk, value, clk_period, little_endian);
        end if;
    end procedure;
    
-- reading

-- This procedure reads a data from the master in mode 0
-- Parameters: 
--      CS : chip select line
--      MOSI : write line for the master
--      SCLK : clock line
--      read_value : received value, this signal is for plotting the value
--      clk_period : clock period
--      little_endian : parameter for sending using big endian or little endian
--                      by default in big endian('0') ['1' for little endian]
    procedure spi_slave_read_mode0 (
        signal cs : in std_logic;
        signal mosi : in std_logic;
        signal sclk : in std_logic;
        signal read_value : out std_logic_vector(WIDTH-1 downto 0);
        clk_period : time;
        little_endian : std_logic := '0'
    )is
    begin
        read_value <= (others=>'0');
        wait until cs = '0';
        wait for blanking_time;
        
        if little_endian = '1' then
            for i in 0 to WIDTH-1 loop
                wait until sclk = '1';
                read_value(i) <= mosi;
            end loop;
        else
            for i in WIDTH-1 downto 0 loop
                wait until sclk = '1';
                read_value(i) <= mosi;
            end loop;
        end if;
        
        
        wait for clk_period; 
    end procedure;
    
    
-- This procedure reads a data from the master in mode 1
-- Parameters: 
--      CS : chip select line
--      MOSI : write line for the master
--      SCLK : clock line
--      read_value : received value, this signal is for plotting the value
--      clk_period : clock period
--      little_endian : parameter for sending using big endian or little endian
--                      by default in big endian('0') ['1' for little endian]
    procedure spi_slave_read_mode1 (
        signal cs : in std_logic;
        signal mosi : in std_logic;
        signal sclk : in std_logic;
        signal read_value : out std_logic_vector(WIDTH-1 downto 0);
        clk_period : time;
        little_endian : std_logic := '0'
    )is
    begin
        read_value <= (others=>'0');
        wait until cs = '0';
        wait for blanking_time;
        
        
        if little_endian = '1' then
            for i in 0 to WIDTH-1 loop
                wait until sclk = '0';
                read_value(i) <= mosi;
            end loop;
        else
            for i in WIDTH-1 downto 0 loop
                wait until sclk = '0';
                read_value(i) <= mosi;
            end loop;
        end if;
        
        wait for clk_period; 
    end procedure;
    
    
-- This procedure reads a data from the master in mode 2
-- Parameters: 
--      CS : chip select line
--      MOSI : write line for the master
--      SCLK : clock line
--      read_value : received value, this signal is for plotting the value
--      clk_period : clock period
--      little_endian : parameter for sending using big endian or little endian
--                      by default in big endian('0') ['1' for little endian]
    procedure spi_slave_read_mode2 (
        signal cs : in std_logic;
        signal mosi : in std_logic;
        signal sclk : in std_logic;
        signal read_value : out std_logic_vector(WIDTH-1 downto 0);
        clk_period : time;
        little_endian : std_logic := '0'
    ) is
    begin
        read_value <= (others=>'0');
        wait until cs = '0';
        wait until sclk = '0';
        wait for blanking_time;
        
        if little_endian = '1' then
            for i in 0 to WIDTH-1 loop
                wait until sclk = '0';
                read_value(i) <= mosi;
            end loop;
        else
            for i in WIDTH-1 downto 0 loop
                wait until sclk = '0';
                read_value(i) <= mosi;
            end loop;
        end if;
        
        wait until cs = '1';
        wait for clk_period; 
     end procedure;


-- This procedure reads a data from the master in mode 3
-- Parameters: 
--      CS : chip select line
--      MOSI : write line for the master
--      SCLK : clock line
--      read_value : received value, this signal is for plotting the value
--      clk_period : clock period
--      little_endian : parameter for sending using big endian or little endian
--                      by default in big endian('0') ['1' for little endian]
    procedure spi_slave_read_mode3 (
        signal cs : in std_logic;
        signal mosi : in std_logic;
        signal sclk : in std_logic;
        signal read_value : out std_logic_vector(WIDTH-1 downto 0);
        clk_period : time;
        little_endian : std_logic := '0'
    ) is
    begin
        read_value <= (others=>'0');
        wait until cs = '0';
        wait until sclk = '0';
        wait for blanking_time;
        
        if little_endian = '1' then 
            for i in 0 to WIDTH-1 loop
                wait until sclk = '1';
                read_value(i) <= mosi;
            end loop;
        else
            for i in WIDTH-1 downto 0 loop
                wait until sclk = '1';
                read_value(i) <= mosi;
            end loop;
        end if;
        
        wait until cs = '1';
        wait for clk_period; 
     end procedure;
     
     
-- This procedure reads a data from the master using cpol and cpha
-- Parameters: 
--      CS : chip select line
--      MOSI : write line for the master
--      SCLK : clock line
--      read_value : received value, this signal is for plotting the value
--      clk_period : clock period
--      little_endian : parameter for sending using big endian or little endian
--                      by default in big endian('0') ['1' for little endian]
--      cpol : sclk polarity
--      cpha : sample edge
     procedure spi_slave_read (
        signal cs : in std_logic;
        signal mosi : in std_logic;
        signal sclk : in std_logic;
        signal read_value : out std_logic_vector(WIDTH-1 downto 0);
        clk_period : time;
        little_endian : std_logic := '0';
        cpol : std_logic := '0';
        cpha : std_logic := '0'
    ) is
    begin
        if cpol = '0' and cpha = '0' then
            spi_slave_read_mode0 (cs, mosi, sclk, read_value, clk_period, little_endian);
        elsif cpol = '0' and cpha = '1' then
            spi_slave_read_mode1 (cs, mosi, sclk, read_value, clk_period, little_endian);
        elsif cpol = '1' and cpha = '0' then
            spi_slave_read_mode2 (cs, mosi, sclk, read_value, clk_period, little_endian);
        elsif cpol = '1' and cpha = '1' then
            spi_slave_read_mode3 (cs, mosi, sclk, read_value, clk_period, little_endian);
        end if;
    end procedure;

end SPI_pkg;