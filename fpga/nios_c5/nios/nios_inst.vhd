	component nios is
		port (
			clk50_clk                : in    std_logic                     := 'X';             -- clk
			io_ack                   : in    std_logic                     := 'X';             -- ack
			io_rdata                 : in    std_logic_vector(7 downto 0)  := (others => 'X'); -- rdata
			io_read                  : out   std_logic;                                        -- read
			io_wdata                 : out   std_logic_vector(7 downto 0);                     -- wdata
			io_write                 : out   std_logic;                                        -- write
			io_address               : out   std_logic_vector(19 downto 0);                    -- address
			io_irq                   : in    std_logic                     := 'X';             -- irq
			mem32_address            : in    std_logic_vector(25 downto 0) := (others => 'X'); -- address
			mem32_direction          : in    std_logic                     := 'X';             -- direction
			mem32_byte_en            : in    std_logic_vector(3 downto 0)  := (others => 'X'); -- byte_en
			mem32_wdata              : in    std_logic_vector(31 downto 0) := (others => 'X'); -- wdata
			mem32_request            : in    std_logic                     := 'X';             -- request
			mem32_tag                : in    std_logic_vector(7 downto 0)  := (others => 'X'); -- tag
			mem32_dack_tag           : out   std_logic_vector(7 downto 0);                     -- dack_tag
			mem32_rdata              : out   std_logic_vector(31 downto 0);                    -- rdata
			mem32_rack               : out   std_logic;                                        -- rack
			mem32_rack_tag           : out   std_logic_vector(7 downto 0);                     -- rack_tag
			memory_mem_a             : out   std_logic_vector(13 downto 0);                    -- mem_a
			memory_mem_ba            : out   std_logic_vector(1 downto 0);                     -- mem_ba
			memory_mem_ck            : out   std_logic_vector(0 downto 0);                     -- mem_ck
			memory_mem_ck_n          : out   std_logic_vector(0 downto 0);                     -- mem_ck_n
			memory_mem_cke           : out   std_logic_vector(0 downto 0);                     -- mem_cke
			memory_mem_cs_n          : out   std_logic_vector(0 downto 0);                     -- mem_cs_n
			memory_mem_dm            : out   std_logic_vector(0 downto 0);                     -- mem_dm
			memory_mem_ras_n         : out   std_logic_vector(0 downto 0);                     -- mem_ras_n
			memory_mem_cas_n         : out   std_logic_vector(0 downto 0);                     -- mem_cas_n
			memory_mem_we_n          : out   std_logic_vector(0 downto 0);                     -- mem_we_n
			memory_mem_dq            : inout std_logic_vector(7 downto 0)  := (others => 'X'); -- mem_dq
			memory_mem_dqs           : inout std_logic_vector(0 downto 0)  := (others => 'X'); -- mem_dqs
			memory_mem_dqs_n         : inout std_logic_vector(0 downto 0)  := (others => 'X'); -- mem_dqs_n
			memory_mem_odt           : out   std_logic_vector(0 downto 0);                     -- mem_odt
			oct_rzqin                : in    std_logic                     := 'X';             -- rzqin
			pio_in_port              : in    std_logic_vector(31 downto 0) := (others => 'X'); -- in_port
			pio_out_port             : out   std_logic_vector(31 downto 0);                    -- out_port
			reset_reset_n            : in    std_logic                     := 'X';             -- reset_n
			status_local_init_done   : out   std_logic;                                        -- local_init_done
			status_local_cal_success : out   std_logic;                                        -- local_cal_success
			status_local_cal_fail    : out   std_logic;                                        -- local_cal_fail
			sys_clock_clk            : out   std_logic;                                        -- clk
			sys_reset_reset_n        : out   std_logic                                         -- reset_n
		);
	end component nios;

	u0 : component nios
		port map (
			clk50_clk                => CONNECTED_TO_clk50_clk,                --     clk50.clk
			io_ack                   => CONNECTED_TO_io_ack,                   --        io.ack
			io_rdata                 => CONNECTED_TO_io_rdata,                 --          .rdata
			io_read                  => CONNECTED_TO_io_read,                  --          .read
			io_wdata                 => CONNECTED_TO_io_wdata,                 --          .wdata
			io_write                 => CONNECTED_TO_io_write,                 --          .write
			io_address               => CONNECTED_TO_io_address,               --          .address
			io_irq                   => CONNECTED_TO_io_irq,                   --          .irq
			mem32_address            => CONNECTED_TO_mem32_address,            --     mem32.address
			mem32_direction          => CONNECTED_TO_mem32_direction,          --          .direction
			mem32_byte_en            => CONNECTED_TO_mem32_byte_en,            --          .byte_en
			mem32_wdata              => CONNECTED_TO_mem32_wdata,              --          .wdata
			mem32_request            => CONNECTED_TO_mem32_request,            --          .request
			mem32_tag                => CONNECTED_TO_mem32_tag,                --          .tag
			mem32_dack_tag           => CONNECTED_TO_mem32_dack_tag,           --          .dack_tag
			mem32_rdata              => CONNECTED_TO_mem32_rdata,              --          .rdata
			mem32_rack               => CONNECTED_TO_mem32_rack,               --          .rack
			mem32_rack_tag           => CONNECTED_TO_mem32_rack_tag,           --          .rack_tag
			memory_mem_a             => CONNECTED_TO_memory_mem_a,             --    memory.mem_a
			memory_mem_ba            => CONNECTED_TO_memory_mem_ba,            --          .mem_ba
			memory_mem_ck            => CONNECTED_TO_memory_mem_ck,            --          .mem_ck
			memory_mem_ck_n          => CONNECTED_TO_memory_mem_ck_n,          --          .mem_ck_n
			memory_mem_cke           => CONNECTED_TO_memory_mem_cke,           --          .mem_cke
			memory_mem_cs_n          => CONNECTED_TO_memory_mem_cs_n,          --          .mem_cs_n
			memory_mem_dm            => CONNECTED_TO_memory_mem_dm,            --          .mem_dm
			memory_mem_ras_n         => CONNECTED_TO_memory_mem_ras_n,         --          .mem_ras_n
			memory_mem_cas_n         => CONNECTED_TO_memory_mem_cas_n,         --          .mem_cas_n
			memory_mem_we_n          => CONNECTED_TO_memory_mem_we_n,          --          .mem_we_n
			memory_mem_dq            => CONNECTED_TO_memory_mem_dq,            --          .mem_dq
			memory_mem_dqs           => CONNECTED_TO_memory_mem_dqs,           --          .mem_dqs
			memory_mem_dqs_n         => CONNECTED_TO_memory_mem_dqs_n,         --          .mem_dqs_n
			memory_mem_odt           => CONNECTED_TO_memory_mem_odt,           --          .mem_odt
			oct_rzqin                => CONNECTED_TO_oct_rzqin,                --       oct.rzqin
			pio_in_port              => CONNECTED_TO_pio_in_port,              --       pio.in_port
			pio_out_port             => CONNECTED_TO_pio_out_port,             --          .out_port
			reset_reset_n            => CONNECTED_TO_reset_reset_n,            --     reset.reset_n
			status_local_init_done   => CONNECTED_TO_status_local_init_done,   --    status.local_init_done
			status_local_cal_success => CONNECTED_TO_status_local_cal_success, --          .local_cal_success
			status_local_cal_fail    => CONNECTED_TO_status_local_cal_fail,    --          .local_cal_fail
			sys_clock_clk            => CONNECTED_TO_sys_clock_clk,            -- sys_clock.clk
			sys_reset_reset_n        => CONNECTED_TO_sys_reset_reset_n         -- sys_reset.reset_n
		);

