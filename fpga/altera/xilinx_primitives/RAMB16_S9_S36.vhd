-------------------------------------------------------------------------------
--
-- (C) COPYRIGHT TECHNOLUTION BV, GOUDA NL
-- | =======          I                   ==          I    =
-- |    I             I                    I          I
-- |    I   ===   === I ===  I ===   ===   I  I    I ====  I   ===  I ===
-- |    I  /   \ I    I/   I I/   I I   I  I  I    I  I    I  I   I I/   I
-- |    I  ===== I    I    I I    I I   I  I  I    I  I    I  I   I I    I
-- |    I  \     I    I    I I    I I   I  I  I   /I  \    I  I   I I    I
-- |    I   ===   === I    I I    I  ===  ===  === I   ==  I   ===  I    I
-- |                 +---------------------------------------------------+
-- +----+            |  +++++++++++++++++++++++++++++++++++++++++++++++++|
--      |            |             ++++++++++++++++++++++++++++++++++++++|
--      +------------+                          +++++++++++++++++++++++++|
--                                                         ++++++++++++++|
--              A U T O M A T I O N     T E C H N O L O G Y         +++++|
--
-------------------------------------------------------------------------------
-- Title      : RAMB16_S9_S36
-- Author     : Gideon Zweijtzer <gideon.zweijtzer@technolution.eu>
-------------------------------------------------------------------------------
-- Description: Altera wrapper
-------------------------------------------------------------------------------

library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;


entity RAMB16_S9_S36 is
  generic (
     INITP_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INITP_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INITP_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INITP_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INITP_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INITP_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INITP_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INITP_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_00 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_01 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_02 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_03 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_04 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_05 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_06 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_07 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_08 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_09 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_0A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_0B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_0C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_0D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_0E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_0F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_10 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_11 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_12 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_13 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_14 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_15 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_16 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_17 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_18 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_19 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_1A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_1B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_1C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_1D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_1E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_1F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_20 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_21 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_22 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_23 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_24 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_25 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_26 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_27 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_28 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_29 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_2A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_2B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_2C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_2D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_2E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_2F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_30 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_31 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_32 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_33 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_34 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_35 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_36 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_37 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_38 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_39 : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_3A : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_3B : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_3C : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_3D : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_3E : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_3F : bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
     INIT_A : bit_vector := X"000";
     INIT_B : bit_vector := X"000000000";
     SIM_COLLISION_CHECK : string := "ALL";
     SRVAL_A : bit_vector := X"000";
     SRVAL_B : bit_vector := X"000000000";
     WRITE_MODE_A : string := "READ_FIRST";
     WRITE_MODE_B : string := "READ_FIRST"
  );
  port (
     DOA   : out std_logic_vector(7 downto 0);
     DOB   : out std_logic_vector(31 downto 0);
     DOPA  : out std_logic_vector(0 downto 0);
     DOPB  : out std_logic_vector(3 downto 0);
     ADDRA : in std_logic_vector(10 downto 0);
     ADDRB : in std_logic_vector(8 downto 0);
     CLKA  : in std_ulogic;
     CLKB  : in std_ulogic;
     DIA   : in std_logic_vector(7 downto 0);
     DIB   : in std_logic_vector(31 downto 0);
     DIPA  : in std_logic_vector(0 downto 0);
     DIPB  : in std_logic_vector(3 downto 0);
     ENA   : in std_ulogic;
     ENB   : in std_ulogic;
     SSRA  : in std_ulogic;
     SSRB  : in std_ulogic;
     WEA   : in std_ulogic;
     WEB   : in std_ulogic
  );
end entity;

architecture wrapper of RAMB16_S9_S36 is
    signal wren_a   : std_logic;
    signal wren_b   : std_logic;
begin
    altsyncram_component : altsyncram
    GENERIC MAP (
        address_reg_b => "CLOCK1",
        clock_enable_input_a => "BYPASS",
        clock_enable_input_b => "BYPASS",
        clock_enable_output_a => "BYPASS",
        clock_enable_output_b => "BYPASS",
        indata_reg_b => "CLOCK1",
        intended_device_family => "Cyclone IV E",
        lpm_type => "altsyncram",
        numwords_a => 2048,
        numwords_b => 512,
        operation_mode => "BIDIR_DUAL_PORT",
        outdata_aclr_a => "NONE",
        outdata_aclr_b => "NONE",
        outdata_reg_a => "UNREGISTERED",
        outdata_reg_b => "UNREGISTERED",
        power_up_uninitialized => "FALSE",
        read_during_write_mode_port_a => "NEW_DATA_NO_NBE_READ",
        read_during_write_mode_port_b => "NEW_DATA_NO_NBE_READ",
        widthad_a => 11,
        widthad_b => 9,
        width_a => 8,
        width_b => 32,
        width_byteena_a => 1,
        width_byteena_b => 1,
        wrcontrol_wraddress_reg_b => "CLOCK1"
    )
    PORT MAP (
        address_a => ADDRA,
        address_b => ADDRB,
        clock0    => CLKA,
        clock1    => CLKB,
        data_a    => DIA,
        data_b    => DIB,
        rden_a    => ENA,
        rden_b    => ENB,
        wren_a    => wren_a,
        wren_b    => wren_b,
        q_a       => DOA,
        q_b       => DOB );

    wren_a <= WEA and ENA;
    wren_b <= WEB and ENB;

end architecture;
