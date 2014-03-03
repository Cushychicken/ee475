// nios_qsys.v


`timescale 1 ps / 1 ps
module nios_qsys (
		input  wire [7:0]  y_coord_export,  //  y_coord.export
		input  wire [17:0] switches_export, // switches.export
		output wire        sdram_cas_n,     //    sdram.cas_n
		output wire [1:0]  sdram_ba,        //         .ba
		output wire        sdram_cs_n,      //         .cs_n
		output wire        sdram_we_n,      //         .we_n
		output wire [11:0] sdram_addr,      //         .addr
		output wire        sdram_cke,       //         .cke
		inout  wire [15:0] sdram_dq,        //         .dq
		output wire        sdram_ras_n,     //         .ras_n
		output wire [1:0]  sdram_dqm,       //         .dqm
		output wire [15:0] data_cal_export, // data_cal.export
		output wire [17:0] leds_export,     //     leds.export
		input  wire [15:0] data_export,     //     data.export
		input  wire        reset_reset_n,   //    reset.reset_n
		output wire        lcd_RS,          //      lcd.RS
		output wire        lcd_RW,          //         .RW
		output wire        lcd_E,           //         .E
		inout  wire [7:0]  lcd_data,        //         .data
		input  wire        clk_clk,         //      clk.clk
		input  wire [8:0]  x_coord_export,  //  x_coord.export
		input  wire        rs232_rxd,       //    rs232.rxd
		output wire        rs232_txd        //         .txd
	);

	wire         cpu_nios_instruction_master_waitrequest;                                                            // cpu_nios_instruction_master_translator:av_waitrequest -> cpu_nios:i_waitrequest
	wire  [24:0] cpu_nios_instruction_master_address;                                                                // cpu_nios:i_address -> cpu_nios_instruction_master_translator:av_address
	wire         cpu_nios_instruction_master_read;                                                                   // cpu_nios:i_read -> cpu_nios_instruction_master_translator:av_read
	wire  [31:0] cpu_nios_instruction_master_readdata;                                                               // cpu_nios_instruction_master_translator:av_readdata -> cpu_nios:i_readdata
	wire         cpu_nios_instruction_master_readdatavalid;                                                          // cpu_nios_instruction_master_translator:av_readdatavalid -> cpu_nios:i_readdatavalid
	wire         cpu_nios_data_master_waitrequest;                                                                   // cpu_nios_data_master_translator:av_waitrequest -> cpu_nios:d_waitrequest
	wire  [31:0] cpu_nios_data_master_writedata;                                                                     // cpu_nios:d_writedata -> cpu_nios_data_master_translator:av_writedata
	wire  [24:0] cpu_nios_data_master_address;                                                                       // cpu_nios:d_address -> cpu_nios_data_master_translator:av_address
	wire         cpu_nios_data_master_write;                                                                         // cpu_nios:d_write -> cpu_nios_data_master_translator:av_write
	wire         cpu_nios_data_master_read;                                                                          // cpu_nios:d_read -> cpu_nios_data_master_translator:av_read
	wire  [31:0] cpu_nios_data_master_readdata;                                                                      // cpu_nios_data_master_translator:av_readdata -> cpu_nios:d_readdata
	wire         cpu_nios_data_master_debugaccess;                                                                   // cpu_nios:jtag_debug_module_debugaccess_to_roms -> cpu_nios_data_master_translator:av_debugaccess
	wire   [3:0] cpu_nios_data_master_byteenable;                                                                    // cpu_nios:d_byteenable -> cpu_nios_data_master_translator:av_byteenable
	wire  [31:0] cpu_nios_jtag_debug_module_translator_avalon_anti_slave_0_writedata;                                // cpu_nios_jtag_debug_module_translator:av_writedata -> cpu_nios:jtag_debug_module_writedata
	wire   [8:0] cpu_nios_jtag_debug_module_translator_avalon_anti_slave_0_address;                                  // cpu_nios_jtag_debug_module_translator:av_address -> cpu_nios:jtag_debug_module_address
	wire         cpu_nios_jtag_debug_module_translator_avalon_anti_slave_0_chipselect;                               // cpu_nios_jtag_debug_module_translator:av_chipselect -> cpu_nios:jtag_debug_module_select
	wire         cpu_nios_jtag_debug_module_translator_avalon_anti_slave_0_write;                                    // cpu_nios_jtag_debug_module_translator:av_write -> cpu_nios:jtag_debug_module_write
	wire  [31:0] cpu_nios_jtag_debug_module_translator_avalon_anti_slave_0_readdata;                                 // cpu_nios:jtag_debug_module_readdata -> cpu_nios_jtag_debug_module_translator:av_readdata
	wire         cpu_nios_jtag_debug_module_translator_avalon_anti_slave_0_begintransfer;                            // cpu_nios_jtag_debug_module_translator:av_begintransfer -> cpu_nios:jtag_debug_module_begintransfer
	wire         cpu_nios_jtag_debug_module_translator_avalon_anti_slave_0_debugaccess;                              // cpu_nios_jtag_debug_module_translator:av_debugaccess -> cpu_nios:jtag_debug_module_debugaccess
	wire   [3:0] cpu_nios_jtag_debug_module_translator_avalon_anti_slave_0_byteenable;                               // cpu_nios_jtag_debug_module_translator:av_byteenable -> cpu_nios:jtag_debug_module_byteenable
	wire         sdram_controller_s1_translator_avalon_anti_slave_0_waitrequest;                                     // sdram_controller:za_waitrequest -> sdram_controller_s1_translator:av_waitrequest
	wire  [15:0] sdram_controller_s1_translator_avalon_anti_slave_0_writedata;                                       // sdram_controller_s1_translator:av_writedata -> sdram_controller:az_data
	wire  [21:0] sdram_controller_s1_translator_avalon_anti_slave_0_address;                                         // sdram_controller_s1_translator:av_address -> sdram_controller:az_addr
	wire         sdram_controller_s1_translator_avalon_anti_slave_0_chipselect;                                      // sdram_controller_s1_translator:av_chipselect -> sdram_controller:az_cs
	wire         sdram_controller_s1_translator_avalon_anti_slave_0_write;                                           // sdram_controller_s1_translator:av_write -> sdram_controller:az_wr_n
	wire         sdram_controller_s1_translator_avalon_anti_slave_0_read;                                            // sdram_controller_s1_translator:av_read -> sdram_controller:az_rd_n
	wire  [15:0] sdram_controller_s1_translator_avalon_anti_slave_0_readdata;                                        // sdram_controller:za_data -> sdram_controller_s1_translator:av_readdata
	wire         sdram_controller_s1_translator_avalon_anti_slave_0_readdatavalid;                                   // sdram_controller:za_valid -> sdram_controller_s1_translator:av_readdatavalid
	wire   [1:0] sdram_controller_s1_translator_avalon_anti_slave_0_byteenable;                                      // sdram_controller_s1_translator:av_byteenable -> sdram_controller:az_be_n
	wire  [31:0] leds_s1_translator_avalon_anti_slave_0_writedata;                                                   // leds_s1_translator:av_writedata -> leds:writedata
	wire   [1:0] leds_s1_translator_avalon_anti_slave_0_address;                                                     // leds_s1_translator:av_address -> leds:address
	wire         leds_s1_translator_avalon_anti_slave_0_chipselect;                                                  // leds_s1_translator:av_chipselect -> leds:chipselect
	wire         leds_s1_translator_avalon_anti_slave_0_write;                                                       // leds_s1_translator:av_write -> leds:write_n
	wire  [31:0] leds_s1_translator_avalon_anti_slave_0_readdata;                                                    // leds:readdata -> leds_s1_translator:av_readdata
	wire   [1:0] switches_s1_translator_avalon_anti_slave_0_address;                                                 // switches_s1_translator:av_address -> switches:address
	wire  [31:0] switches_s1_translator_avalon_anti_slave_0_readdata;                                                // switches:readdata -> switches_s1_translator:av_readdata
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_anti_slave_0_waitrequest;                           // jtag_uart_0:av_waitrequest -> jtag_uart_0_avalon_jtag_slave_translator:av_waitrequest
	wire  [31:0] jtag_uart_0_avalon_jtag_slave_translator_avalon_anti_slave_0_writedata;                             // jtag_uart_0_avalon_jtag_slave_translator:av_writedata -> jtag_uart_0:av_writedata
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_anti_slave_0_address;                               // jtag_uart_0_avalon_jtag_slave_translator:av_address -> jtag_uart_0:av_address
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_anti_slave_0_chipselect;                            // jtag_uart_0_avalon_jtag_slave_translator:av_chipselect -> jtag_uart_0:av_chipselect
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_anti_slave_0_write;                                 // jtag_uart_0_avalon_jtag_slave_translator:av_write -> jtag_uart_0:av_write_n
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_anti_slave_0_read;                                  // jtag_uart_0_avalon_jtag_slave_translator:av_read -> jtag_uart_0:av_read_n
	wire  [31:0] jtag_uart_0_avalon_jtag_slave_translator_avalon_anti_slave_0_readdata;                              // jtag_uart_0:av_readdata -> jtag_uart_0_avalon_jtag_slave_translator:av_readdata
	wire   [7:0] lcd_0_control_slave_translator_avalon_anti_slave_0_writedata;                                       // lcd_0_control_slave_translator:av_writedata -> lcd_0:writedata
	wire   [1:0] lcd_0_control_slave_translator_avalon_anti_slave_0_address;                                         // lcd_0_control_slave_translator:av_address -> lcd_0:address
	wire         lcd_0_control_slave_translator_avalon_anti_slave_0_write;                                           // lcd_0_control_slave_translator:av_write -> lcd_0:write
	wire         lcd_0_control_slave_translator_avalon_anti_slave_0_read;                                            // lcd_0_control_slave_translator:av_read -> lcd_0:read
	wire   [7:0] lcd_0_control_slave_translator_avalon_anti_slave_0_readdata;                                        // lcd_0:readdata -> lcd_0_control_slave_translator:av_readdata
	wire         lcd_0_control_slave_translator_avalon_anti_slave_0_begintransfer;                                   // lcd_0_control_slave_translator:av_begintransfer -> lcd_0:begintransfer
	wire  [15:0] uart_rs232_s1_translator_avalon_anti_slave_0_writedata;                                             // uart_RS232_s1_translator:av_writedata -> uart_RS232:writedata
	wire   [2:0] uart_rs232_s1_translator_avalon_anti_slave_0_address;                                               // uart_RS232_s1_translator:av_address -> uart_RS232:address
	wire         uart_rs232_s1_translator_avalon_anti_slave_0_chipselect;                                            // uart_RS232_s1_translator:av_chipselect -> uart_RS232:chipselect
	wire         uart_rs232_s1_translator_avalon_anti_slave_0_write;                                                 // uart_RS232_s1_translator:av_write -> uart_RS232:write_n
	wire         uart_rs232_s1_translator_avalon_anti_slave_0_read;                                                  // uart_RS232_s1_translator:av_read -> uart_RS232:read_n
	wire  [15:0] uart_rs232_s1_translator_avalon_anti_slave_0_readdata;                                              // uart_RS232:readdata -> uart_RS232_s1_translator:av_readdata
	wire         uart_rs232_s1_translator_avalon_anti_slave_0_begintransfer;                                         // uart_RS232_s1_translator:av_begintransfer -> uart_RS232:begintransfer
	wire  [15:0] timer_0_s1_translator_avalon_anti_slave_0_writedata;                                                // timer_0_s1_translator:av_writedata -> timer_0:writedata
	wire   [2:0] timer_0_s1_translator_avalon_anti_slave_0_address;                                                  // timer_0_s1_translator:av_address -> timer_0:address
	wire         timer_0_s1_translator_avalon_anti_slave_0_chipselect;                                               // timer_0_s1_translator:av_chipselect -> timer_0:chipselect
	wire         timer_0_s1_translator_avalon_anti_slave_0_write;                                                    // timer_0_s1_translator:av_write -> timer_0:write_n
	wire  [15:0] timer_0_s1_translator_avalon_anti_slave_0_readdata;                                                 // timer_0:readdata -> timer_0_s1_translator:av_readdata
	wire  [31:0] calibrate_avalon_0_s1_translator_avalon_anti_slave_0_writedata;                                     // calibrate_avalon_0_s1_translator:av_writedata -> calibrate_avalon_0:avs_s1_writedata
	wire   [1:0] calibrate_avalon_0_s1_translator_avalon_anti_slave_0_address;                                       // calibrate_avalon_0_s1_translator:av_address -> calibrate_avalon_0:avs_s1_address
	wire         calibrate_avalon_0_s1_translator_avalon_anti_slave_0_write;                                         // calibrate_avalon_0_s1_translator:av_write -> calibrate_avalon_0:avs_s1_write
	wire         calibrate_avalon_0_s1_translator_avalon_anti_slave_0_read;                                          // calibrate_avalon_0_s1_translator:av_read -> calibrate_avalon_0:avs_s1_read
	wire  [31:0] calibrate_avalon_0_s1_translator_avalon_anti_slave_0_readdata;                                      // calibrate_avalon_0:avs_s1_readdata -> calibrate_avalon_0_s1_translator:av_readdata
	wire         cpu_nios_instruction_master_translator_avalon_universal_master_0_waitrequest;                       // cpu_nios_instruction_master_translator_avalon_universal_master_0_agent:av_waitrequest -> cpu_nios_instruction_master_translator:uav_waitrequest
	wire   [2:0] cpu_nios_instruction_master_translator_avalon_universal_master_0_burstcount;                        // cpu_nios_instruction_master_translator:uav_burstcount -> cpu_nios_instruction_master_translator_avalon_universal_master_0_agent:av_burstcount
	wire  [31:0] cpu_nios_instruction_master_translator_avalon_universal_master_0_writedata;                         // cpu_nios_instruction_master_translator:uav_writedata -> cpu_nios_instruction_master_translator_avalon_universal_master_0_agent:av_writedata
	wire  [24:0] cpu_nios_instruction_master_translator_avalon_universal_master_0_address;                           // cpu_nios_instruction_master_translator:uav_address -> cpu_nios_instruction_master_translator_avalon_universal_master_0_agent:av_address
	wire         cpu_nios_instruction_master_translator_avalon_universal_master_0_lock;                              // cpu_nios_instruction_master_translator:uav_lock -> cpu_nios_instruction_master_translator_avalon_universal_master_0_agent:av_lock
	wire         cpu_nios_instruction_master_translator_avalon_universal_master_0_write;                             // cpu_nios_instruction_master_translator:uav_write -> cpu_nios_instruction_master_translator_avalon_universal_master_0_agent:av_write
	wire         cpu_nios_instruction_master_translator_avalon_universal_master_0_read;                              // cpu_nios_instruction_master_translator:uav_read -> cpu_nios_instruction_master_translator_avalon_universal_master_0_agent:av_read
	wire  [31:0] cpu_nios_instruction_master_translator_avalon_universal_master_0_readdata;                          // cpu_nios_instruction_master_translator_avalon_universal_master_0_agent:av_readdata -> cpu_nios_instruction_master_translator:uav_readdata
	wire         cpu_nios_instruction_master_translator_avalon_universal_master_0_debugaccess;                       // cpu_nios_instruction_master_translator:uav_debugaccess -> cpu_nios_instruction_master_translator_avalon_universal_master_0_agent:av_debugaccess
	wire   [3:0] cpu_nios_instruction_master_translator_avalon_universal_master_0_byteenable;                        // cpu_nios_instruction_master_translator:uav_byteenable -> cpu_nios_instruction_master_translator_avalon_universal_master_0_agent:av_byteenable
	wire         cpu_nios_instruction_master_translator_avalon_universal_master_0_readdatavalid;                     // cpu_nios_instruction_master_translator_avalon_universal_master_0_agent:av_readdatavalid -> cpu_nios_instruction_master_translator:uav_readdatavalid
	wire         cpu_nios_data_master_translator_avalon_universal_master_0_waitrequest;                              // cpu_nios_data_master_translator_avalon_universal_master_0_agent:av_waitrequest -> cpu_nios_data_master_translator:uav_waitrequest
	wire   [2:0] cpu_nios_data_master_translator_avalon_universal_master_0_burstcount;                               // cpu_nios_data_master_translator:uav_burstcount -> cpu_nios_data_master_translator_avalon_universal_master_0_agent:av_burstcount
	wire  [31:0] cpu_nios_data_master_translator_avalon_universal_master_0_writedata;                                // cpu_nios_data_master_translator:uav_writedata -> cpu_nios_data_master_translator_avalon_universal_master_0_agent:av_writedata
	wire  [24:0] cpu_nios_data_master_translator_avalon_universal_master_0_address;                                  // cpu_nios_data_master_translator:uav_address -> cpu_nios_data_master_translator_avalon_universal_master_0_agent:av_address
	wire         cpu_nios_data_master_translator_avalon_universal_master_0_lock;                                     // cpu_nios_data_master_translator:uav_lock -> cpu_nios_data_master_translator_avalon_universal_master_0_agent:av_lock
	wire         cpu_nios_data_master_translator_avalon_universal_master_0_write;                                    // cpu_nios_data_master_translator:uav_write -> cpu_nios_data_master_translator_avalon_universal_master_0_agent:av_write
	wire         cpu_nios_data_master_translator_avalon_universal_master_0_read;                                     // cpu_nios_data_master_translator:uav_read -> cpu_nios_data_master_translator_avalon_universal_master_0_agent:av_read
	wire  [31:0] cpu_nios_data_master_translator_avalon_universal_master_0_readdata;                                 // cpu_nios_data_master_translator_avalon_universal_master_0_agent:av_readdata -> cpu_nios_data_master_translator:uav_readdata
	wire         cpu_nios_data_master_translator_avalon_universal_master_0_debugaccess;                              // cpu_nios_data_master_translator:uav_debugaccess -> cpu_nios_data_master_translator_avalon_universal_master_0_agent:av_debugaccess
	wire   [3:0] cpu_nios_data_master_translator_avalon_universal_master_0_byteenable;                               // cpu_nios_data_master_translator:uav_byteenable -> cpu_nios_data_master_translator_avalon_universal_master_0_agent:av_byteenable
	wire         cpu_nios_data_master_translator_avalon_universal_master_0_readdatavalid;                            // cpu_nios_data_master_translator_avalon_universal_master_0_agent:av_readdatavalid -> cpu_nios_data_master_translator:uav_readdatavalid
	wire         cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_waitrequest;                // cpu_nios_jtag_debug_module_translator:uav_waitrequest -> cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent:m0_waitrequest
	wire   [2:0] cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_burstcount;                 // cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent:m0_burstcount -> cpu_nios_jtag_debug_module_translator:uav_burstcount
	wire  [31:0] cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_writedata;                  // cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent:m0_writedata -> cpu_nios_jtag_debug_module_translator:uav_writedata
	wire  [24:0] cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_address;                    // cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent:m0_address -> cpu_nios_jtag_debug_module_translator:uav_address
	wire         cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_write;                      // cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent:m0_write -> cpu_nios_jtag_debug_module_translator:uav_write
	wire         cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_lock;                       // cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent:m0_lock -> cpu_nios_jtag_debug_module_translator:uav_lock
	wire         cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_read;                       // cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent:m0_read -> cpu_nios_jtag_debug_module_translator:uav_read
	wire  [31:0] cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_readdata;                   // cpu_nios_jtag_debug_module_translator:uav_readdata -> cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent:m0_readdata
	wire         cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_readdatavalid;              // cpu_nios_jtag_debug_module_translator:uav_readdatavalid -> cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent:m0_readdatavalid
	wire         cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_debugaccess;                // cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent:m0_debugaccess -> cpu_nios_jtag_debug_module_translator:uav_debugaccess
	wire   [3:0] cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_byteenable;                 // cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent:m0_byteenable -> cpu_nios_jtag_debug_module_translator:uav_byteenable
	wire         cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_endofpacket;         // cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent:rf_source_endofpacket -> cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:in_endofpacket
	wire         cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_valid;               // cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent:rf_source_valid -> cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:in_valid
	wire         cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_startofpacket;       // cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent:rf_source_startofpacket -> cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:in_startofpacket
	wire  [82:0] cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_data;                // cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent:rf_source_data -> cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:in_data
	wire         cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_ready;               // cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:in_ready -> cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent:rf_source_ready
	wire         cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket;      // cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:out_endofpacket -> cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent:rf_sink_endofpacket
	wire         cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid;            // cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:out_valid -> cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent:rf_sink_valid
	wire         cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket;    // cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:out_startofpacket -> cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent:rf_sink_startofpacket
	wire  [82:0] cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data;             // cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:out_data -> cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent:rf_sink_data
	wire         cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready;            // cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent:rf_sink_ready -> cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:out_ready
	wire         cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid;          // cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent:rdata_fifo_src_valid -> cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_valid
	wire  [31:0] cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data;           // cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent:rdata_fifo_src_data -> cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_data
	wire         cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready;          // cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_ready -> cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent:rdata_fifo_src_ready
	wire         sdram_controller_s1_translator_avalon_universal_slave_0_agent_m0_waitrequest;                       // sdram_controller_s1_translator:uav_waitrequest -> sdram_controller_s1_translator_avalon_universal_slave_0_agent:m0_waitrequest
	wire   [1:0] sdram_controller_s1_translator_avalon_universal_slave_0_agent_m0_burstcount;                        // sdram_controller_s1_translator_avalon_universal_slave_0_agent:m0_burstcount -> sdram_controller_s1_translator:uav_burstcount
	wire  [15:0] sdram_controller_s1_translator_avalon_universal_slave_0_agent_m0_writedata;                         // sdram_controller_s1_translator_avalon_universal_slave_0_agent:m0_writedata -> sdram_controller_s1_translator:uav_writedata
	wire  [24:0] sdram_controller_s1_translator_avalon_universal_slave_0_agent_m0_address;                           // sdram_controller_s1_translator_avalon_universal_slave_0_agent:m0_address -> sdram_controller_s1_translator:uav_address
	wire         sdram_controller_s1_translator_avalon_universal_slave_0_agent_m0_write;                             // sdram_controller_s1_translator_avalon_universal_slave_0_agent:m0_write -> sdram_controller_s1_translator:uav_write
	wire         sdram_controller_s1_translator_avalon_universal_slave_0_agent_m0_lock;                              // sdram_controller_s1_translator_avalon_universal_slave_0_agent:m0_lock -> sdram_controller_s1_translator:uav_lock
	wire         sdram_controller_s1_translator_avalon_universal_slave_0_agent_m0_read;                              // sdram_controller_s1_translator_avalon_universal_slave_0_agent:m0_read -> sdram_controller_s1_translator:uav_read
	wire  [15:0] sdram_controller_s1_translator_avalon_universal_slave_0_agent_m0_readdata;                          // sdram_controller_s1_translator:uav_readdata -> sdram_controller_s1_translator_avalon_universal_slave_0_agent:m0_readdata
	wire         sdram_controller_s1_translator_avalon_universal_slave_0_agent_m0_readdatavalid;                     // sdram_controller_s1_translator:uav_readdatavalid -> sdram_controller_s1_translator_avalon_universal_slave_0_agent:m0_readdatavalid
	wire         sdram_controller_s1_translator_avalon_universal_slave_0_agent_m0_debugaccess;                       // sdram_controller_s1_translator_avalon_universal_slave_0_agent:m0_debugaccess -> sdram_controller_s1_translator:uav_debugaccess
	wire   [1:0] sdram_controller_s1_translator_avalon_universal_slave_0_agent_m0_byteenable;                        // sdram_controller_s1_translator_avalon_universal_slave_0_agent:m0_byteenable -> sdram_controller_s1_translator:uav_byteenable
	wire         sdram_controller_s1_translator_avalon_universal_slave_0_agent_rf_source_endofpacket;                // sdram_controller_s1_translator_avalon_universal_slave_0_agent:rf_source_endofpacket -> sdram_controller_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_endofpacket
	wire         sdram_controller_s1_translator_avalon_universal_slave_0_agent_rf_source_valid;                      // sdram_controller_s1_translator_avalon_universal_slave_0_agent:rf_source_valid -> sdram_controller_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_valid
	wire         sdram_controller_s1_translator_avalon_universal_slave_0_agent_rf_source_startofpacket;              // sdram_controller_s1_translator_avalon_universal_slave_0_agent:rf_source_startofpacket -> sdram_controller_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_startofpacket
	wire  [64:0] sdram_controller_s1_translator_avalon_universal_slave_0_agent_rf_source_data;                       // sdram_controller_s1_translator_avalon_universal_slave_0_agent:rf_source_data -> sdram_controller_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_data
	wire         sdram_controller_s1_translator_avalon_universal_slave_0_agent_rf_source_ready;                      // sdram_controller_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_ready -> sdram_controller_s1_translator_avalon_universal_slave_0_agent:rf_source_ready
	wire         sdram_controller_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket;             // sdram_controller_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_endofpacket -> sdram_controller_s1_translator_avalon_universal_slave_0_agent:rf_sink_endofpacket
	wire         sdram_controller_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid;                   // sdram_controller_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_valid -> sdram_controller_s1_translator_avalon_universal_slave_0_agent:rf_sink_valid
	wire         sdram_controller_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket;           // sdram_controller_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_startofpacket -> sdram_controller_s1_translator_avalon_universal_slave_0_agent:rf_sink_startofpacket
	wire  [64:0] sdram_controller_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data;                    // sdram_controller_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_data -> sdram_controller_s1_translator_avalon_universal_slave_0_agent:rf_sink_data
	wire         sdram_controller_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready;                   // sdram_controller_s1_translator_avalon_universal_slave_0_agent:rf_sink_ready -> sdram_controller_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_ready
	wire         sdram_controller_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid;                 // sdram_controller_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_valid -> sdram_controller_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_valid
	wire  [15:0] sdram_controller_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data;                  // sdram_controller_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_data -> sdram_controller_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_data
	wire         sdram_controller_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready;                 // sdram_controller_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_ready -> sdram_controller_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_ready
	wire         leds_s1_translator_avalon_universal_slave_0_agent_m0_waitrequest;                                   // leds_s1_translator:uav_waitrequest -> leds_s1_translator_avalon_universal_slave_0_agent:m0_waitrequest
	wire   [2:0] leds_s1_translator_avalon_universal_slave_0_agent_m0_burstcount;                                    // leds_s1_translator_avalon_universal_slave_0_agent:m0_burstcount -> leds_s1_translator:uav_burstcount
	wire  [31:0] leds_s1_translator_avalon_universal_slave_0_agent_m0_writedata;                                     // leds_s1_translator_avalon_universal_slave_0_agent:m0_writedata -> leds_s1_translator:uav_writedata
	wire  [24:0] leds_s1_translator_avalon_universal_slave_0_agent_m0_address;                                       // leds_s1_translator_avalon_universal_slave_0_agent:m0_address -> leds_s1_translator:uav_address
	wire         leds_s1_translator_avalon_universal_slave_0_agent_m0_write;                                         // leds_s1_translator_avalon_universal_slave_0_agent:m0_write -> leds_s1_translator:uav_write
	wire         leds_s1_translator_avalon_universal_slave_0_agent_m0_lock;                                          // leds_s1_translator_avalon_universal_slave_0_agent:m0_lock -> leds_s1_translator:uav_lock
	wire         leds_s1_translator_avalon_universal_slave_0_agent_m0_read;                                          // leds_s1_translator_avalon_universal_slave_0_agent:m0_read -> leds_s1_translator:uav_read
	wire  [31:0] leds_s1_translator_avalon_universal_slave_0_agent_m0_readdata;                                      // leds_s1_translator:uav_readdata -> leds_s1_translator_avalon_universal_slave_0_agent:m0_readdata
	wire         leds_s1_translator_avalon_universal_slave_0_agent_m0_readdatavalid;                                 // leds_s1_translator:uav_readdatavalid -> leds_s1_translator_avalon_universal_slave_0_agent:m0_readdatavalid
	wire         leds_s1_translator_avalon_universal_slave_0_agent_m0_debugaccess;                                   // leds_s1_translator_avalon_universal_slave_0_agent:m0_debugaccess -> leds_s1_translator:uav_debugaccess
	wire   [3:0] leds_s1_translator_avalon_universal_slave_0_agent_m0_byteenable;                                    // leds_s1_translator_avalon_universal_slave_0_agent:m0_byteenable -> leds_s1_translator:uav_byteenable
	wire         leds_s1_translator_avalon_universal_slave_0_agent_rf_source_endofpacket;                            // leds_s1_translator_avalon_universal_slave_0_agent:rf_source_endofpacket -> leds_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_endofpacket
	wire         leds_s1_translator_avalon_universal_slave_0_agent_rf_source_valid;                                  // leds_s1_translator_avalon_universal_slave_0_agent:rf_source_valid -> leds_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_valid
	wire         leds_s1_translator_avalon_universal_slave_0_agent_rf_source_startofpacket;                          // leds_s1_translator_avalon_universal_slave_0_agent:rf_source_startofpacket -> leds_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_startofpacket
	wire  [82:0] leds_s1_translator_avalon_universal_slave_0_agent_rf_source_data;                                   // leds_s1_translator_avalon_universal_slave_0_agent:rf_source_data -> leds_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_data
	wire         leds_s1_translator_avalon_universal_slave_0_agent_rf_source_ready;                                  // leds_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_ready -> leds_s1_translator_avalon_universal_slave_0_agent:rf_source_ready
	wire         leds_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket;                         // leds_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_endofpacket -> leds_s1_translator_avalon_universal_slave_0_agent:rf_sink_endofpacket
	wire         leds_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid;                               // leds_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_valid -> leds_s1_translator_avalon_universal_slave_0_agent:rf_sink_valid
	wire         leds_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket;                       // leds_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_startofpacket -> leds_s1_translator_avalon_universal_slave_0_agent:rf_sink_startofpacket
	wire  [82:0] leds_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data;                                // leds_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_data -> leds_s1_translator_avalon_universal_slave_0_agent:rf_sink_data
	wire         leds_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready;                               // leds_s1_translator_avalon_universal_slave_0_agent:rf_sink_ready -> leds_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_ready
	wire         leds_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid;                             // leds_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_valid -> leds_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_valid
	wire  [31:0] leds_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data;                              // leds_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_data -> leds_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_data
	wire         leds_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready;                             // leds_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_ready -> leds_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_ready
	wire         switches_s1_translator_avalon_universal_slave_0_agent_m0_waitrequest;                               // switches_s1_translator:uav_waitrequest -> switches_s1_translator_avalon_universal_slave_0_agent:m0_waitrequest
	wire   [2:0] switches_s1_translator_avalon_universal_slave_0_agent_m0_burstcount;                                // switches_s1_translator_avalon_universal_slave_0_agent:m0_burstcount -> switches_s1_translator:uav_burstcount
	wire  [31:0] switches_s1_translator_avalon_universal_slave_0_agent_m0_writedata;                                 // switches_s1_translator_avalon_universal_slave_0_agent:m0_writedata -> switches_s1_translator:uav_writedata
	wire  [24:0] switches_s1_translator_avalon_universal_slave_0_agent_m0_address;                                   // switches_s1_translator_avalon_universal_slave_0_agent:m0_address -> switches_s1_translator:uav_address
	wire         switches_s1_translator_avalon_universal_slave_0_agent_m0_write;                                     // switches_s1_translator_avalon_universal_slave_0_agent:m0_write -> switches_s1_translator:uav_write
	wire         switches_s1_translator_avalon_universal_slave_0_agent_m0_lock;                                      // switches_s1_translator_avalon_universal_slave_0_agent:m0_lock -> switches_s1_translator:uav_lock
	wire         switches_s1_translator_avalon_universal_slave_0_agent_m0_read;                                      // switches_s1_translator_avalon_universal_slave_0_agent:m0_read -> switches_s1_translator:uav_read
	wire  [31:0] switches_s1_translator_avalon_universal_slave_0_agent_m0_readdata;                                  // switches_s1_translator:uav_readdata -> switches_s1_translator_avalon_universal_slave_0_agent:m0_readdata
	wire         switches_s1_translator_avalon_universal_slave_0_agent_m0_readdatavalid;                             // switches_s1_translator:uav_readdatavalid -> switches_s1_translator_avalon_universal_slave_0_agent:m0_readdatavalid
	wire         switches_s1_translator_avalon_universal_slave_0_agent_m0_debugaccess;                               // switches_s1_translator_avalon_universal_slave_0_agent:m0_debugaccess -> switches_s1_translator:uav_debugaccess
	wire   [3:0] switches_s1_translator_avalon_universal_slave_0_agent_m0_byteenable;                                // switches_s1_translator_avalon_universal_slave_0_agent:m0_byteenable -> switches_s1_translator:uav_byteenable
	wire         switches_s1_translator_avalon_universal_slave_0_agent_rf_source_endofpacket;                        // switches_s1_translator_avalon_universal_slave_0_agent:rf_source_endofpacket -> switches_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_endofpacket
	wire         switches_s1_translator_avalon_universal_slave_0_agent_rf_source_valid;                              // switches_s1_translator_avalon_universal_slave_0_agent:rf_source_valid -> switches_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_valid
	wire         switches_s1_translator_avalon_universal_slave_0_agent_rf_source_startofpacket;                      // switches_s1_translator_avalon_universal_slave_0_agent:rf_source_startofpacket -> switches_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_startofpacket
	wire  [82:0] switches_s1_translator_avalon_universal_slave_0_agent_rf_source_data;                               // switches_s1_translator_avalon_universal_slave_0_agent:rf_source_data -> switches_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_data
	wire         switches_s1_translator_avalon_universal_slave_0_agent_rf_source_ready;                              // switches_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_ready -> switches_s1_translator_avalon_universal_slave_0_agent:rf_source_ready
	wire         switches_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket;                     // switches_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_endofpacket -> switches_s1_translator_avalon_universal_slave_0_agent:rf_sink_endofpacket
	wire         switches_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid;                           // switches_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_valid -> switches_s1_translator_avalon_universal_slave_0_agent:rf_sink_valid
	wire         switches_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket;                   // switches_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_startofpacket -> switches_s1_translator_avalon_universal_slave_0_agent:rf_sink_startofpacket
	wire  [82:0] switches_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data;                            // switches_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_data -> switches_s1_translator_avalon_universal_slave_0_agent:rf_sink_data
	wire         switches_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready;                           // switches_s1_translator_avalon_universal_slave_0_agent:rf_sink_ready -> switches_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_ready
	wire         switches_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid;                         // switches_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_valid -> switches_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_valid
	wire  [31:0] switches_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data;                          // switches_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_data -> switches_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_data
	wire         switches_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready;                         // switches_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_ready -> switches_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_ready
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_waitrequest;             // jtag_uart_0_avalon_jtag_slave_translator:uav_waitrequest -> jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:m0_waitrequest
	wire   [2:0] jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_burstcount;              // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:m0_burstcount -> jtag_uart_0_avalon_jtag_slave_translator:uav_burstcount
	wire  [31:0] jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_writedata;               // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:m0_writedata -> jtag_uart_0_avalon_jtag_slave_translator:uav_writedata
	wire  [24:0] jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_address;                 // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:m0_address -> jtag_uart_0_avalon_jtag_slave_translator:uav_address
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_write;                   // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:m0_write -> jtag_uart_0_avalon_jtag_slave_translator:uav_write
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_lock;                    // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:m0_lock -> jtag_uart_0_avalon_jtag_slave_translator:uav_lock
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_read;                    // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:m0_read -> jtag_uart_0_avalon_jtag_slave_translator:uav_read
	wire  [31:0] jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_readdata;                // jtag_uart_0_avalon_jtag_slave_translator:uav_readdata -> jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:m0_readdata
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_readdatavalid;           // jtag_uart_0_avalon_jtag_slave_translator:uav_readdatavalid -> jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:m0_readdatavalid
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_debugaccess;             // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:m0_debugaccess -> jtag_uart_0_avalon_jtag_slave_translator:uav_debugaccess
	wire   [3:0] jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_byteenable;              // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:m0_byteenable -> jtag_uart_0_avalon_jtag_slave_translator:uav_byteenable
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_endofpacket;      // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rf_source_endofpacket -> jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:in_endofpacket
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_valid;            // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rf_source_valid -> jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:in_valid
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_startofpacket;    // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rf_source_startofpacket -> jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:in_startofpacket
	wire  [82:0] jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_data;             // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rf_source_data -> jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:in_data
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_ready;            // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:in_ready -> jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rf_source_ready
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket;   // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:out_endofpacket -> jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rf_sink_endofpacket
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid;         // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:out_valid -> jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rf_sink_valid
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket; // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:out_startofpacket -> jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rf_sink_startofpacket
	wire  [82:0] jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data;          // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:out_data -> jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rf_sink_data
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready;         // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rf_sink_ready -> jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:out_ready
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid;       // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rdata_fifo_src_valid -> jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_valid
	wire  [31:0] jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data;        // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rdata_fifo_src_data -> jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_data
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready;       // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_ready -> jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rdata_fifo_src_ready
	wire         lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_waitrequest;                       // lcd_0_control_slave_translator:uav_waitrequest -> lcd_0_control_slave_translator_avalon_universal_slave_0_agent:m0_waitrequest
	wire   [2:0] lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_burstcount;                        // lcd_0_control_slave_translator_avalon_universal_slave_0_agent:m0_burstcount -> lcd_0_control_slave_translator:uav_burstcount
	wire  [31:0] lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_writedata;                         // lcd_0_control_slave_translator_avalon_universal_slave_0_agent:m0_writedata -> lcd_0_control_slave_translator:uav_writedata
	wire  [24:0] lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_address;                           // lcd_0_control_slave_translator_avalon_universal_slave_0_agent:m0_address -> lcd_0_control_slave_translator:uav_address
	wire         lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_write;                             // lcd_0_control_slave_translator_avalon_universal_slave_0_agent:m0_write -> lcd_0_control_slave_translator:uav_write
	wire         lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_lock;                              // lcd_0_control_slave_translator_avalon_universal_slave_0_agent:m0_lock -> lcd_0_control_slave_translator:uav_lock
	wire         lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_read;                              // lcd_0_control_slave_translator_avalon_universal_slave_0_agent:m0_read -> lcd_0_control_slave_translator:uav_read
	wire  [31:0] lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_readdata;                          // lcd_0_control_slave_translator:uav_readdata -> lcd_0_control_slave_translator_avalon_universal_slave_0_agent:m0_readdata
	wire         lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_readdatavalid;                     // lcd_0_control_slave_translator:uav_readdatavalid -> lcd_0_control_slave_translator_avalon_universal_slave_0_agent:m0_readdatavalid
	wire         lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_debugaccess;                       // lcd_0_control_slave_translator_avalon_universal_slave_0_agent:m0_debugaccess -> lcd_0_control_slave_translator:uav_debugaccess
	wire   [3:0] lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_byteenable;                        // lcd_0_control_slave_translator_avalon_universal_slave_0_agent:m0_byteenable -> lcd_0_control_slave_translator:uav_byteenable
	wire         lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_endofpacket;                // lcd_0_control_slave_translator_avalon_universal_slave_0_agent:rf_source_endofpacket -> lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:in_endofpacket
	wire         lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_valid;                      // lcd_0_control_slave_translator_avalon_universal_slave_0_agent:rf_source_valid -> lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:in_valid
	wire         lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_startofpacket;              // lcd_0_control_slave_translator_avalon_universal_slave_0_agent:rf_source_startofpacket -> lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:in_startofpacket
	wire  [82:0] lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_data;                       // lcd_0_control_slave_translator_avalon_universal_slave_0_agent:rf_source_data -> lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:in_data
	wire         lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_ready;                      // lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:in_ready -> lcd_0_control_slave_translator_avalon_universal_slave_0_agent:rf_source_ready
	wire         lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket;             // lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:out_endofpacket -> lcd_0_control_slave_translator_avalon_universal_slave_0_agent:rf_sink_endofpacket
	wire         lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid;                   // lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:out_valid -> lcd_0_control_slave_translator_avalon_universal_slave_0_agent:rf_sink_valid
	wire         lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket;           // lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:out_startofpacket -> lcd_0_control_slave_translator_avalon_universal_slave_0_agent:rf_sink_startofpacket
	wire  [82:0] lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data;                    // lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:out_data -> lcd_0_control_slave_translator_avalon_universal_slave_0_agent:rf_sink_data
	wire         lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready;                   // lcd_0_control_slave_translator_avalon_universal_slave_0_agent:rf_sink_ready -> lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:out_ready
	wire         lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid;                 // lcd_0_control_slave_translator_avalon_universal_slave_0_agent:rdata_fifo_src_valid -> lcd_0_control_slave_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_valid
	wire  [31:0] lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data;                  // lcd_0_control_slave_translator_avalon_universal_slave_0_agent:rdata_fifo_src_data -> lcd_0_control_slave_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_data
	wire         lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready;                 // lcd_0_control_slave_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_ready -> lcd_0_control_slave_translator_avalon_universal_slave_0_agent:rdata_fifo_src_ready
	wire         uart_rs232_s1_translator_avalon_universal_slave_0_agent_m0_waitrequest;                             // uart_RS232_s1_translator:uav_waitrequest -> uart_RS232_s1_translator_avalon_universal_slave_0_agent:m0_waitrequest
	wire   [2:0] uart_rs232_s1_translator_avalon_universal_slave_0_agent_m0_burstcount;                              // uart_RS232_s1_translator_avalon_universal_slave_0_agent:m0_burstcount -> uart_RS232_s1_translator:uav_burstcount
	wire  [31:0] uart_rs232_s1_translator_avalon_universal_slave_0_agent_m0_writedata;                               // uart_RS232_s1_translator_avalon_universal_slave_0_agent:m0_writedata -> uart_RS232_s1_translator:uav_writedata
	wire  [24:0] uart_rs232_s1_translator_avalon_universal_slave_0_agent_m0_address;                                 // uart_RS232_s1_translator_avalon_universal_slave_0_agent:m0_address -> uart_RS232_s1_translator:uav_address
	wire         uart_rs232_s1_translator_avalon_universal_slave_0_agent_m0_write;                                   // uart_RS232_s1_translator_avalon_universal_slave_0_agent:m0_write -> uart_RS232_s1_translator:uav_write
	wire         uart_rs232_s1_translator_avalon_universal_slave_0_agent_m0_lock;                                    // uart_RS232_s1_translator_avalon_universal_slave_0_agent:m0_lock -> uart_RS232_s1_translator:uav_lock
	wire         uart_rs232_s1_translator_avalon_universal_slave_0_agent_m0_read;                                    // uart_RS232_s1_translator_avalon_universal_slave_0_agent:m0_read -> uart_RS232_s1_translator:uav_read
	wire  [31:0] uart_rs232_s1_translator_avalon_universal_slave_0_agent_m0_readdata;                                // uart_RS232_s1_translator:uav_readdata -> uart_RS232_s1_translator_avalon_universal_slave_0_agent:m0_readdata
	wire         uart_rs232_s1_translator_avalon_universal_slave_0_agent_m0_readdatavalid;                           // uart_RS232_s1_translator:uav_readdatavalid -> uart_RS232_s1_translator_avalon_universal_slave_0_agent:m0_readdatavalid
	wire         uart_rs232_s1_translator_avalon_universal_slave_0_agent_m0_debugaccess;                             // uart_RS232_s1_translator_avalon_universal_slave_0_agent:m0_debugaccess -> uart_RS232_s1_translator:uav_debugaccess
	wire   [3:0] uart_rs232_s1_translator_avalon_universal_slave_0_agent_m0_byteenable;                              // uart_RS232_s1_translator_avalon_universal_slave_0_agent:m0_byteenable -> uart_RS232_s1_translator:uav_byteenable
	wire         uart_rs232_s1_translator_avalon_universal_slave_0_agent_rf_source_endofpacket;                      // uart_RS232_s1_translator_avalon_universal_slave_0_agent:rf_source_endofpacket -> uart_RS232_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_endofpacket
	wire         uart_rs232_s1_translator_avalon_universal_slave_0_agent_rf_source_valid;                            // uart_RS232_s1_translator_avalon_universal_slave_0_agent:rf_source_valid -> uart_RS232_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_valid
	wire         uart_rs232_s1_translator_avalon_universal_slave_0_agent_rf_source_startofpacket;                    // uart_RS232_s1_translator_avalon_universal_slave_0_agent:rf_source_startofpacket -> uart_RS232_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_startofpacket
	wire  [82:0] uart_rs232_s1_translator_avalon_universal_slave_0_agent_rf_source_data;                             // uart_RS232_s1_translator_avalon_universal_slave_0_agent:rf_source_data -> uart_RS232_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_data
	wire         uart_rs232_s1_translator_avalon_universal_slave_0_agent_rf_source_ready;                            // uart_RS232_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_ready -> uart_RS232_s1_translator_avalon_universal_slave_0_agent:rf_source_ready
	wire         uart_rs232_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket;                   // uart_RS232_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_endofpacket -> uart_RS232_s1_translator_avalon_universal_slave_0_agent:rf_sink_endofpacket
	wire         uart_rs232_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid;                         // uart_RS232_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_valid -> uart_RS232_s1_translator_avalon_universal_slave_0_agent:rf_sink_valid
	wire         uart_rs232_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket;                 // uart_RS232_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_startofpacket -> uart_RS232_s1_translator_avalon_universal_slave_0_agent:rf_sink_startofpacket
	wire  [82:0] uart_rs232_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data;                          // uart_RS232_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_data -> uart_RS232_s1_translator_avalon_universal_slave_0_agent:rf_sink_data
	wire         uart_rs232_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready;                         // uart_RS232_s1_translator_avalon_universal_slave_0_agent:rf_sink_ready -> uart_RS232_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_ready
	wire         uart_rs232_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid;                       // uart_RS232_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_valid -> uart_RS232_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_valid
	wire  [31:0] uart_rs232_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data;                        // uart_RS232_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_data -> uart_RS232_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_data
	wire         uart_rs232_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready;                       // uart_RS232_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_ready -> uart_RS232_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_ready
	wire         timer_0_s1_translator_avalon_universal_slave_0_agent_m0_waitrequest;                                // timer_0_s1_translator:uav_waitrequest -> timer_0_s1_translator_avalon_universal_slave_0_agent:m0_waitrequest
	wire   [2:0] timer_0_s1_translator_avalon_universal_slave_0_agent_m0_burstcount;                                 // timer_0_s1_translator_avalon_universal_slave_0_agent:m0_burstcount -> timer_0_s1_translator:uav_burstcount
	wire  [31:0] timer_0_s1_translator_avalon_universal_slave_0_agent_m0_writedata;                                  // timer_0_s1_translator_avalon_universal_slave_0_agent:m0_writedata -> timer_0_s1_translator:uav_writedata
	wire  [24:0] timer_0_s1_translator_avalon_universal_slave_0_agent_m0_address;                                    // timer_0_s1_translator_avalon_universal_slave_0_agent:m0_address -> timer_0_s1_translator:uav_address
	wire         timer_0_s1_translator_avalon_universal_slave_0_agent_m0_write;                                      // timer_0_s1_translator_avalon_universal_slave_0_agent:m0_write -> timer_0_s1_translator:uav_write
	wire         timer_0_s1_translator_avalon_universal_slave_0_agent_m0_lock;                                       // timer_0_s1_translator_avalon_universal_slave_0_agent:m0_lock -> timer_0_s1_translator:uav_lock
	wire         timer_0_s1_translator_avalon_universal_slave_0_agent_m0_read;                                       // timer_0_s1_translator_avalon_universal_slave_0_agent:m0_read -> timer_0_s1_translator:uav_read
	wire  [31:0] timer_0_s1_translator_avalon_universal_slave_0_agent_m0_readdata;                                   // timer_0_s1_translator:uav_readdata -> timer_0_s1_translator_avalon_universal_slave_0_agent:m0_readdata
	wire         timer_0_s1_translator_avalon_universal_slave_0_agent_m0_readdatavalid;                              // timer_0_s1_translator:uav_readdatavalid -> timer_0_s1_translator_avalon_universal_slave_0_agent:m0_readdatavalid
	wire         timer_0_s1_translator_avalon_universal_slave_0_agent_m0_debugaccess;                                // timer_0_s1_translator_avalon_universal_slave_0_agent:m0_debugaccess -> timer_0_s1_translator:uav_debugaccess
	wire   [3:0] timer_0_s1_translator_avalon_universal_slave_0_agent_m0_byteenable;                                 // timer_0_s1_translator_avalon_universal_slave_0_agent:m0_byteenable -> timer_0_s1_translator:uav_byteenable
	wire         timer_0_s1_translator_avalon_universal_slave_0_agent_rf_source_endofpacket;                         // timer_0_s1_translator_avalon_universal_slave_0_agent:rf_source_endofpacket -> timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_endofpacket
	wire         timer_0_s1_translator_avalon_universal_slave_0_agent_rf_source_valid;                               // timer_0_s1_translator_avalon_universal_slave_0_agent:rf_source_valid -> timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_valid
	wire         timer_0_s1_translator_avalon_universal_slave_0_agent_rf_source_startofpacket;                       // timer_0_s1_translator_avalon_universal_slave_0_agent:rf_source_startofpacket -> timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_startofpacket
	wire  [82:0] timer_0_s1_translator_avalon_universal_slave_0_agent_rf_source_data;                                // timer_0_s1_translator_avalon_universal_slave_0_agent:rf_source_data -> timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_data
	wire         timer_0_s1_translator_avalon_universal_slave_0_agent_rf_source_ready;                               // timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_ready -> timer_0_s1_translator_avalon_universal_slave_0_agent:rf_source_ready
	wire         timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket;                      // timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_endofpacket -> timer_0_s1_translator_avalon_universal_slave_0_agent:rf_sink_endofpacket
	wire         timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid;                            // timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_valid -> timer_0_s1_translator_avalon_universal_slave_0_agent:rf_sink_valid
	wire         timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket;                    // timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_startofpacket -> timer_0_s1_translator_avalon_universal_slave_0_agent:rf_sink_startofpacket
	wire  [82:0] timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data;                             // timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_data -> timer_0_s1_translator_avalon_universal_slave_0_agent:rf_sink_data
	wire         timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready;                            // timer_0_s1_translator_avalon_universal_slave_0_agent:rf_sink_ready -> timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_ready
	wire         timer_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid;                          // timer_0_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_valid -> timer_0_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_valid
	wire  [31:0] timer_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data;                           // timer_0_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_data -> timer_0_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_data
	wire         timer_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready;                          // timer_0_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_ready -> timer_0_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_ready
	wire         calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_m0_waitrequest;                     // calibrate_avalon_0_s1_translator:uav_waitrequest -> calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent:m0_waitrequest
	wire   [2:0] calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_m0_burstcount;                      // calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent:m0_burstcount -> calibrate_avalon_0_s1_translator:uav_burstcount
	wire  [31:0] calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_m0_writedata;                       // calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent:m0_writedata -> calibrate_avalon_0_s1_translator:uav_writedata
	wire  [24:0] calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_m0_address;                         // calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent:m0_address -> calibrate_avalon_0_s1_translator:uav_address
	wire         calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_m0_write;                           // calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent:m0_write -> calibrate_avalon_0_s1_translator:uav_write
	wire         calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_m0_lock;                            // calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent:m0_lock -> calibrate_avalon_0_s1_translator:uav_lock
	wire         calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_m0_read;                            // calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent:m0_read -> calibrate_avalon_0_s1_translator:uav_read
	wire  [31:0] calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_m0_readdata;                        // calibrate_avalon_0_s1_translator:uav_readdata -> calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent:m0_readdata
	wire         calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_m0_readdatavalid;                   // calibrate_avalon_0_s1_translator:uav_readdatavalid -> calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent:m0_readdatavalid
	wire         calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_m0_debugaccess;                     // calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent:m0_debugaccess -> calibrate_avalon_0_s1_translator:uav_debugaccess
	wire   [3:0] calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_m0_byteenable;                      // calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent:m0_byteenable -> calibrate_avalon_0_s1_translator:uav_byteenable
	wire         calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rf_source_endofpacket;              // calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent:rf_source_endofpacket -> calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_endofpacket
	wire         calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rf_source_valid;                    // calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent:rf_source_valid -> calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_valid
	wire         calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rf_source_startofpacket;            // calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent:rf_source_startofpacket -> calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_startofpacket
	wire  [82:0] calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rf_source_data;                     // calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent:rf_source_data -> calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_data
	wire         calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rf_source_ready;                    // calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_ready -> calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent:rf_source_ready
	wire         calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket;           // calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_endofpacket -> calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent:rf_sink_endofpacket
	wire         calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid;                 // calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_valid -> calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent:rf_sink_valid
	wire         calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket;         // calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_startofpacket -> calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent:rf_sink_startofpacket
	wire  [82:0] calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data;                  // calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_data -> calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent:rf_sink_data
	wire         calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready;                 // calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent:rf_sink_ready -> calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_ready
	wire         calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid;               // calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_valid -> calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_valid
	wire  [31:0] calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data;                // calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_data -> calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_data
	wire         calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready;               // calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_ready -> calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_ready
	wire         cpu_nios_instruction_master_translator_avalon_universal_master_0_agent_cp_endofpacket;              // cpu_nios_instruction_master_translator_avalon_universal_master_0_agent:cp_endofpacket -> addr_router:sink_endofpacket
	wire         cpu_nios_instruction_master_translator_avalon_universal_master_0_agent_cp_valid;                    // cpu_nios_instruction_master_translator_avalon_universal_master_0_agent:cp_valid -> addr_router:sink_valid
	wire         cpu_nios_instruction_master_translator_avalon_universal_master_0_agent_cp_startofpacket;            // cpu_nios_instruction_master_translator_avalon_universal_master_0_agent:cp_startofpacket -> addr_router:sink_startofpacket
	wire  [81:0] cpu_nios_instruction_master_translator_avalon_universal_master_0_agent_cp_data;                     // cpu_nios_instruction_master_translator_avalon_universal_master_0_agent:cp_data -> addr_router:sink_data
	wire         cpu_nios_instruction_master_translator_avalon_universal_master_0_agent_cp_ready;                    // addr_router:sink_ready -> cpu_nios_instruction_master_translator_avalon_universal_master_0_agent:cp_ready
	wire         cpu_nios_data_master_translator_avalon_universal_master_0_agent_cp_endofpacket;                     // cpu_nios_data_master_translator_avalon_universal_master_0_agent:cp_endofpacket -> addr_router_001:sink_endofpacket
	wire         cpu_nios_data_master_translator_avalon_universal_master_0_agent_cp_valid;                           // cpu_nios_data_master_translator_avalon_universal_master_0_agent:cp_valid -> addr_router_001:sink_valid
	wire         cpu_nios_data_master_translator_avalon_universal_master_0_agent_cp_startofpacket;                   // cpu_nios_data_master_translator_avalon_universal_master_0_agent:cp_startofpacket -> addr_router_001:sink_startofpacket
	wire  [81:0] cpu_nios_data_master_translator_avalon_universal_master_0_agent_cp_data;                            // cpu_nios_data_master_translator_avalon_universal_master_0_agent:cp_data -> addr_router_001:sink_data
	wire         cpu_nios_data_master_translator_avalon_universal_master_0_agent_cp_ready;                           // addr_router_001:sink_ready -> cpu_nios_data_master_translator_avalon_universal_master_0_agent:cp_ready
	wire         cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_endofpacket;                // cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent:rp_endofpacket -> id_router:sink_endofpacket
	wire         cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_valid;                      // cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent:rp_valid -> id_router:sink_valid
	wire         cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_startofpacket;              // cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent:rp_startofpacket -> id_router:sink_startofpacket
	wire  [81:0] cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_data;                       // cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent:rp_data -> id_router:sink_data
	wire         cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_ready;                      // id_router:sink_ready -> cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent:rp_ready
	wire         sdram_controller_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket;                       // sdram_controller_s1_translator_avalon_universal_slave_0_agent:rp_endofpacket -> id_router_001:sink_endofpacket
	wire         sdram_controller_s1_translator_avalon_universal_slave_0_agent_rp_valid;                             // sdram_controller_s1_translator_avalon_universal_slave_0_agent:rp_valid -> id_router_001:sink_valid
	wire         sdram_controller_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket;                     // sdram_controller_s1_translator_avalon_universal_slave_0_agent:rp_startofpacket -> id_router_001:sink_startofpacket
	wire  [63:0] sdram_controller_s1_translator_avalon_universal_slave_0_agent_rp_data;                              // sdram_controller_s1_translator_avalon_universal_slave_0_agent:rp_data -> id_router_001:sink_data
	wire         sdram_controller_s1_translator_avalon_universal_slave_0_agent_rp_ready;                             // id_router_001:sink_ready -> sdram_controller_s1_translator_avalon_universal_slave_0_agent:rp_ready
	wire         leds_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket;                                   // leds_s1_translator_avalon_universal_slave_0_agent:rp_endofpacket -> id_router_002:sink_endofpacket
	wire         leds_s1_translator_avalon_universal_slave_0_agent_rp_valid;                                         // leds_s1_translator_avalon_universal_slave_0_agent:rp_valid -> id_router_002:sink_valid
	wire         leds_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket;                                 // leds_s1_translator_avalon_universal_slave_0_agent:rp_startofpacket -> id_router_002:sink_startofpacket
	wire  [81:0] leds_s1_translator_avalon_universal_slave_0_agent_rp_data;                                          // leds_s1_translator_avalon_universal_slave_0_agent:rp_data -> id_router_002:sink_data
	wire         leds_s1_translator_avalon_universal_slave_0_agent_rp_ready;                                         // id_router_002:sink_ready -> leds_s1_translator_avalon_universal_slave_0_agent:rp_ready
	wire         switches_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket;                               // switches_s1_translator_avalon_universal_slave_0_agent:rp_endofpacket -> id_router_003:sink_endofpacket
	wire         switches_s1_translator_avalon_universal_slave_0_agent_rp_valid;                                     // switches_s1_translator_avalon_universal_slave_0_agent:rp_valid -> id_router_003:sink_valid
	wire         switches_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket;                             // switches_s1_translator_avalon_universal_slave_0_agent:rp_startofpacket -> id_router_003:sink_startofpacket
	wire  [81:0] switches_s1_translator_avalon_universal_slave_0_agent_rp_data;                                      // switches_s1_translator_avalon_universal_slave_0_agent:rp_data -> id_router_003:sink_data
	wire         switches_s1_translator_avalon_universal_slave_0_agent_rp_ready;                                     // id_router_003:sink_ready -> switches_s1_translator_avalon_universal_slave_0_agent:rp_ready
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_endofpacket;             // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rp_endofpacket -> id_router_004:sink_endofpacket
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_valid;                   // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rp_valid -> id_router_004:sink_valid
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_startofpacket;           // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rp_startofpacket -> id_router_004:sink_startofpacket
	wire  [81:0] jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_data;                    // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rp_data -> id_router_004:sink_data
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_ready;                   // id_router_004:sink_ready -> jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rp_ready
	wire         lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rp_endofpacket;                       // lcd_0_control_slave_translator_avalon_universal_slave_0_agent:rp_endofpacket -> id_router_005:sink_endofpacket
	wire         lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rp_valid;                             // lcd_0_control_slave_translator_avalon_universal_slave_0_agent:rp_valid -> id_router_005:sink_valid
	wire         lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rp_startofpacket;                     // lcd_0_control_slave_translator_avalon_universal_slave_0_agent:rp_startofpacket -> id_router_005:sink_startofpacket
	wire  [81:0] lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rp_data;                              // lcd_0_control_slave_translator_avalon_universal_slave_0_agent:rp_data -> id_router_005:sink_data
	wire         lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rp_ready;                             // id_router_005:sink_ready -> lcd_0_control_slave_translator_avalon_universal_slave_0_agent:rp_ready
	wire         uart_rs232_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket;                             // uart_RS232_s1_translator_avalon_universal_slave_0_agent:rp_endofpacket -> id_router_006:sink_endofpacket
	wire         uart_rs232_s1_translator_avalon_universal_slave_0_agent_rp_valid;                                   // uart_RS232_s1_translator_avalon_universal_slave_0_agent:rp_valid -> id_router_006:sink_valid
	wire         uart_rs232_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket;                           // uart_RS232_s1_translator_avalon_universal_slave_0_agent:rp_startofpacket -> id_router_006:sink_startofpacket
	wire  [81:0] uart_rs232_s1_translator_avalon_universal_slave_0_agent_rp_data;                                    // uart_RS232_s1_translator_avalon_universal_slave_0_agent:rp_data -> id_router_006:sink_data
	wire         uart_rs232_s1_translator_avalon_universal_slave_0_agent_rp_ready;                                   // id_router_006:sink_ready -> uart_RS232_s1_translator_avalon_universal_slave_0_agent:rp_ready
	wire         timer_0_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket;                                // timer_0_s1_translator_avalon_universal_slave_0_agent:rp_endofpacket -> id_router_007:sink_endofpacket
	wire         timer_0_s1_translator_avalon_universal_slave_0_agent_rp_valid;                                      // timer_0_s1_translator_avalon_universal_slave_0_agent:rp_valid -> id_router_007:sink_valid
	wire         timer_0_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket;                              // timer_0_s1_translator_avalon_universal_slave_0_agent:rp_startofpacket -> id_router_007:sink_startofpacket
	wire  [81:0] timer_0_s1_translator_avalon_universal_slave_0_agent_rp_data;                                       // timer_0_s1_translator_avalon_universal_slave_0_agent:rp_data -> id_router_007:sink_data
	wire         timer_0_s1_translator_avalon_universal_slave_0_agent_rp_ready;                                      // id_router_007:sink_ready -> timer_0_s1_translator_avalon_universal_slave_0_agent:rp_ready
	wire         calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket;                     // calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent:rp_endofpacket -> id_router_008:sink_endofpacket
	wire         calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rp_valid;                           // calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent:rp_valid -> id_router_008:sink_valid
	wire         calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket;                   // calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent:rp_startofpacket -> id_router_008:sink_startofpacket
	wire  [81:0] calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rp_data;                            // calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent:rp_data -> id_router_008:sink_data
	wire         calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rp_ready;                           // id_router_008:sink_ready -> calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent:rp_ready
	wire         addr_router_src_endofpacket;                                                                        // addr_router:src_endofpacket -> limiter:cmd_sink_endofpacket
	wire         addr_router_src_valid;                                                                              // addr_router:src_valid -> limiter:cmd_sink_valid
	wire         addr_router_src_startofpacket;                                                                      // addr_router:src_startofpacket -> limiter:cmd_sink_startofpacket
	wire  [81:0] addr_router_src_data;                                                                               // addr_router:src_data -> limiter:cmd_sink_data
	wire   [8:0] addr_router_src_channel;                                                                            // addr_router:src_channel -> limiter:cmd_sink_channel
	wire         addr_router_src_ready;                                                                              // limiter:cmd_sink_ready -> addr_router:src_ready
	wire         limiter_rsp_src_endofpacket;                                                                        // limiter:rsp_src_endofpacket -> cpu_nios_instruction_master_translator_avalon_universal_master_0_agent:rp_endofpacket
	wire         limiter_rsp_src_valid;                                                                              // limiter:rsp_src_valid -> cpu_nios_instruction_master_translator_avalon_universal_master_0_agent:rp_valid
	wire         limiter_rsp_src_startofpacket;                                                                      // limiter:rsp_src_startofpacket -> cpu_nios_instruction_master_translator_avalon_universal_master_0_agent:rp_startofpacket
	wire  [81:0] limiter_rsp_src_data;                                                                               // limiter:rsp_src_data -> cpu_nios_instruction_master_translator_avalon_universal_master_0_agent:rp_data
	wire   [8:0] limiter_rsp_src_channel;                                                                            // limiter:rsp_src_channel -> cpu_nios_instruction_master_translator_avalon_universal_master_0_agent:rp_channel
	wire         limiter_rsp_src_ready;                                                                              // cpu_nios_instruction_master_translator_avalon_universal_master_0_agent:rp_ready -> limiter:rsp_src_ready
	wire         addr_router_001_src_endofpacket;                                                                    // addr_router_001:src_endofpacket -> limiter_001:cmd_sink_endofpacket
	wire         addr_router_001_src_valid;                                                                          // addr_router_001:src_valid -> limiter_001:cmd_sink_valid
	wire         addr_router_001_src_startofpacket;                                                                  // addr_router_001:src_startofpacket -> limiter_001:cmd_sink_startofpacket
	wire  [81:0] addr_router_001_src_data;                                                                           // addr_router_001:src_data -> limiter_001:cmd_sink_data
	wire   [8:0] addr_router_001_src_channel;                                                                        // addr_router_001:src_channel -> limiter_001:cmd_sink_channel
	wire         addr_router_001_src_ready;                                                                          // limiter_001:cmd_sink_ready -> addr_router_001:src_ready
	wire         limiter_001_rsp_src_endofpacket;                                                                    // limiter_001:rsp_src_endofpacket -> cpu_nios_data_master_translator_avalon_universal_master_0_agent:rp_endofpacket
	wire         limiter_001_rsp_src_valid;                                                                          // limiter_001:rsp_src_valid -> cpu_nios_data_master_translator_avalon_universal_master_0_agent:rp_valid
	wire         limiter_001_rsp_src_startofpacket;                                                                  // limiter_001:rsp_src_startofpacket -> cpu_nios_data_master_translator_avalon_universal_master_0_agent:rp_startofpacket
	wire  [81:0] limiter_001_rsp_src_data;                                                                           // limiter_001:rsp_src_data -> cpu_nios_data_master_translator_avalon_universal_master_0_agent:rp_data
	wire   [8:0] limiter_001_rsp_src_channel;                                                                        // limiter_001:rsp_src_channel -> cpu_nios_data_master_translator_avalon_universal_master_0_agent:rp_channel
	wire         limiter_001_rsp_src_ready;                                                                          // cpu_nios_data_master_translator_avalon_universal_master_0_agent:rp_ready -> limiter_001:rsp_src_ready
	wire         burst_adapter_source0_endofpacket;                                                                  // burst_adapter:source0_endofpacket -> sdram_controller_s1_translator_avalon_universal_slave_0_agent:cp_endofpacket
	wire         burst_adapter_source0_valid;                                                                        // burst_adapter:source0_valid -> sdram_controller_s1_translator_avalon_universal_slave_0_agent:cp_valid
	wire         burst_adapter_source0_startofpacket;                                                                // burst_adapter:source0_startofpacket -> sdram_controller_s1_translator_avalon_universal_slave_0_agent:cp_startofpacket
	wire  [63:0] burst_adapter_source0_data;                                                                         // burst_adapter:source0_data -> sdram_controller_s1_translator_avalon_universal_slave_0_agent:cp_data
	wire         burst_adapter_source0_ready;                                                                        // sdram_controller_s1_translator_avalon_universal_slave_0_agent:cp_ready -> burst_adapter:source0_ready
	wire   [8:0] burst_adapter_source0_channel;                                                                      // burst_adapter:source0_channel -> sdram_controller_s1_translator_avalon_universal_slave_0_agent:cp_channel
	wire         rst_controller_reset_out_reset;                                                                     // rst_controller:reset_out -> [addr_router:reset, addr_router_001:reset, burst_adapter:reset, calibrate_avalon_0:reset_n, calibrate_avalon_0_s1_translator:reset, calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent:reset, calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:reset, cmd_xbar_demux:reset, cmd_xbar_demux_001:reset, cmd_xbar_mux:reset, cmd_xbar_mux_001:reset, cpu_nios:reset_n, cpu_nios_data_master_translator:reset, cpu_nios_data_master_translator_avalon_universal_master_0_agent:reset, cpu_nios_instruction_master_translator:reset, cpu_nios_instruction_master_translator_avalon_universal_master_0_agent:reset, cpu_nios_jtag_debug_module_translator:reset, cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent:reset, cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:reset, id_router:reset, id_router_001:reset, id_router_002:reset, id_router_003:reset, id_router_004:reset, id_router_005:reset, id_router_006:reset, id_router_007:reset, id_router_008:reset, irq_mapper:reset, jtag_uart_0:rst_n, jtag_uart_0_avalon_jtag_slave_translator:reset, jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:reset, jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:reset, lcd_0:reset_n, lcd_0_control_slave_translator:reset, lcd_0_control_slave_translator_avalon_universal_slave_0_agent:reset, lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:reset, leds:reset_n, leds_s1_translator:reset, leds_s1_translator_avalon_universal_slave_0_agent:reset, leds_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:reset, limiter:reset, limiter_001:reset, rsp_xbar_demux:reset, rsp_xbar_demux_001:reset, rsp_xbar_demux_002:reset, rsp_xbar_demux_003:reset, rsp_xbar_demux_004:reset, rsp_xbar_demux_005:reset, rsp_xbar_demux_006:reset, rsp_xbar_demux_007:reset, rsp_xbar_demux_008:reset, rsp_xbar_mux:reset, rsp_xbar_mux_001:reset, sdram_controller:reset_n, sdram_controller_s1_translator:reset, sdram_controller_s1_translator_avalon_universal_slave_0_agent:reset, sdram_controller_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:reset, switches:reset_n, switches_s1_translator:reset, switches_s1_translator_avalon_universal_slave_0_agent:reset, switches_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:reset, timer_0:reset_n, timer_0_s1_translator:reset, timer_0_s1_translator_avalon_universal_slave_0_agent:reset, timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:reset, uart_RS232:reset_n, uart_RS232_s1_translator:reset, uart_RS232_s1_translator_avalon_universal_slave_0_agent:reset, uart_RS232_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:reset, width_adapter:reset, width_adapter_001:reset]
	wire         cmd_xbar_demux_src0_endofpacket;                                                                    // cmd_xbar_demux:src0_endofpacket -> cmd_xbar_mux:sink0_endofpacket
	wire         cmd_xbar_demux_src0_valid;                                                                          // cmd_xbar_demux:src0_valid -> cmd_xbar_mux:sink0_valid
	wire         cmd_xbar_demux_src0_startofpacket;                                                                  // cmd_xbar_demux:src0_startofpacket -> cmd_xbar_mux:sink0_startofpacket
	wire  [81:0] cmd_xbar_demux_src0_data;                                                                           // cmd_xbar_demux:src0_data -> cmd_xbar_mux:sink0_data
	wire   [8:0] cmd_xbar_demux_src0_channel;                                                                        // cmd_xbar_demux:src0_channel -> cmd_xbar_mux:sink0_channel
	wire         cmd_xbar_demux_src0_ready;                                                                          // cmd_xbar_mux:sink0_ready -> cmd_xbar_demux:src0_ready
	wire         cmd_xbar_demux_src1_endofpacket;                                                                    // cmd_xbar_demux:src1_endofpacket -> cmd_xbar_mux_001:sink0_endofpacket
	wire         cmd_xbar_demux_src1_valid;                                                                          // cmd_xbar_demux:src1_valid -> cmd_xbar_mux_001:sink0_valid
	wire         cmd_xbar_demux_src1_startofpacket;                                                                  // cmd_xbar_demux:src1_startofpacket -> cmd_xbar_mux_001:sink0_startofpacket
	wire  [81:0] cmd_xbar_demux_src1_data;                                                                           // cmd_xbar_demux:src1_data -> cmd_xbar_mux_001:sink0_data
	wire   [8:0] cmd_xbar_demux_src1_channel;                                                                        // cmd_xbar_demux:src1_channel -> cmd_xbar_mux_001:sink0_channel
	wire         cmd_xbar_demux_src1_ready;                                                                          // cmd_xbar_mux_001:sink0_ready -> cmd_xbar_demux:src1_ready
	wire         cmd_xbar_demux_001_src0_endofpacket;                                                                // cmd_xbar_demux_001:src0_endofpacket -> cmd_xbar_mux:sink1_endofpacket
	wire         cmd_xbar_demux_001_src0_valid;                                                                      // cmd_xbar_demux_001:src0_valid -> cmd_xbar_mux:sink1_valid
	wire         cmd_xbar_demux_001_src0_startofpacket;                                                              // cmd_xbar_demux_001:src0_startofpacket -> cmd_xbar_mux:sink1_startofpacket
	wire  [81:0] cmd_xbar_demux_001_src0_data;                                                                       // cmd_xbar_demux_001:src0_data -> cmd_xbar_mux:sink1_data
	wire   [8:0] cmd_xbar_demux_001_src0_channel;                                                                    // cmd_xbar_demux_001:src0_channel -> cmd_xbar_mux:sink1_channel
	wire         cmd_xbar_demux_001_src0_ready;                                                                      // cmd_xbar_mux:sink1_ready -> cmd_xbar_demux_001:src0_ready
	wire         cmd_xbar_demux_001_src1_endofpacket;                                                                // cmd_xbar_demux_001:src1_endofpacket -> cmd_xbar_mux_001:sink1_endofpacket
	wire         cmd_xbar_demux_001_src1_valid;                                                                      // cmd_xbar_demux_001:src1_valid -> cmd_xbar_mux_001:sink1_valid
	wire         cmd_xbar_demux_001_src1_startofpacket;                                                              // cmd_xbar_demux_001:src1_startofpacket -> cmd_xbar_mux_001:sink1_startofpacket
	wire  [81:0] cmd_xbar_demux_001_src1_data;                                                                       // cmd_xbar_demux_001:src1_data -> cmd_xbar_mux_001:sink1_data
	wire   [8:0] cmd_xbar_demux_001_src1_channel;                                                                    // cmd_xbar_demux_001:src1_channel -> cmd_xbar_mux_001:sink1_channel
	wire         cmd_xbar_demux_001_src1_ready;                                                                      // cmd_xbar_mux_001:sink1_ready -> cmd_xbar_demux_001:src1_ready
	wire         cmd_xbar_demux_001_src2_endofpacket;                                                                // cmd_xbar_demux_001:src2_endofpacket -> leds_s1_translator_avalon_universal_slave_0_agent:cp_endofpacket
	wire         cmd_xbar_demux_001_src2_valid;                                                                      // cmd_xbar_demux_001:src2_valid -> leds_s1_translator_avalon_universal_slave_0_agent:cp_valid
	wire         cmd_xbar_demux_001_src2_startofpacket;                                                              // cmd_xbar_demux_001:src2_startofpacket -> leds_s1_translator_avalon_universal_slave_0_agent:cp_startofpacket
	wire  [81:0] cmd_xbar_demux_001_src2_data;                                                                       // cmd_xbar_demux_001:src2_data -> leds_s1_translator_avalon_universal_slave_0_agent:cp_data
	wire   [8:0] cmd_xbar_demux_001_src2_channel;                                                                    // cmd_xbar_demux_001:src2_channel -> leds_s1_translator_avalon_universal_slave_0_agent:cp_channel
	wire         cmd_xbar_demux_001_src3_endofpacket;                                                                // cmd_xbar_demux_001:src3_endofpacket -> switches_s1_translator_avalon_universal_slave_0_agent:cp_endofpacket
	wire         cmd_xbar_demux_001_src3_valid;                                                                      // cmd_xbar_demux_001:src3_valid -> switches_s1_translator_avalon_universal_slave_0_agent:cp_valid
	wire         cmd_xbar_demux_001_src3_startofpacket;                                                              // cmd_xbar_demux_001:src3_startofpacket -> switches_s1_translator_avalon_universal_slave_0_agent:cp_startofpacket
	wire  [81:0] cmd_xbar_demux_001_src3_data;                                                                       // cmd_xbar_demux_001:src3_data -> switches_s1_translator_avalon_universal_slave_0_agent:cp_data
	wire   [8:0] cmd_xbar_demux_001_src3_channel;                                                                    // cmd_xbar_demux_001:src3_channel -> switches_s1_translator_avalon_universal_slave_0_agent:cp_channel
	wire         cmd_xbar_demux_001_src4_endofpacket;                                                                // cmd_xbar_demux_001:src4_endofpacket -> jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:cp_endofpacket
	wire         cmd_xbar_demux_001_src4_valid;                                                                      // cmd_xbar_demux_001:src4_valid -> jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:cp_valid
	wire         cmd_xbar_demux_001_src4_startofpacket;                                                              // cmd_xbar_demux_001:src4_startofpacket -> jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:cp_startofpacket
	wire  [81:0] cmd_xbar_demux_001_src4_data;                                                                       // cmd_xbar_demux_001:src4_data -> jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:cp_data
	wire   [8:0] cmd_xbar_demux_001_src4_channel;                                                                    // cmd_xbar_demux_001:src4_channel -> jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:cp_channel
	wire         cmd_xbar_demux_001_src5_endofpacket;                                                                // cmd_xbar_demux_001:src5_endofpacket -> lcd_0_control_slave_translator_avalon_universal_slave_0_agent:cp_endofpacket
	wire         cmd_xbar_demux_001_src5_valid;                                                                      // cmd_xbar_demux_001:src5_valid -> lcd_0_control_slave_translator_avalon_universal_slave_0_agent:cp_valid
	wire         cmd_xbar_demux_001_src5_startofpacket;                                                              // cmd_xbar_demux_001:src5_startofpacket -> lcd_0_control_slave_translator_avalon_universal_slave_0_agent:cp_startofpacket
	wire  [81:0] cmd_xbar_demux_001_src5_data;                                                                       // cmd_xbar_demux_001:src5_data -> lcd_0_control_slave_translator_avalon_universal_slave_0_agent:cp_data
	wire   [8:0] cmd_xbar_demux_001_src5_channel;                                                                    // cmd_xbar_demux_001:src5_channel -> lcd_0_control_slave_translator_avalon_universal_slave_0_agent:cp_channel
	wire         cmd_xbar_demux_001_src6_endofpacket;                                                                // cmd_xbar_demux_001:src6_endofpacket -> uart_RS232_s1_translator_avalon_universal_slave_0_agent:cp_endofpacket
	wire         cmd_xbar_demux_001_src6_valid;                                                                      // cmd_xbar_demux_001:src6_valid -> uart_RS232_s1_translator_avalon_universal_slave_0_agent:cp_valid
	wire         cmd_xbar_demux_001_src6_startofpacket;                                                              // cmd_xbar_demux_001:src6_startofpacket -> uart_RS232_s1_translator_avalon_universal_slave_0_agent:cp_startofpacket
	wire  [81:0] cmd_xbar_demux_001_src6_data;                                                                       // cmd_xbar_demux_001:src6_data -> uart_RS232_s1_translator_avalon_universal_slave_0_agent:cp_data
	wire   [8:0] cmd_xbar_demux_001_src6_channel;                                                                    // cmd_xbar_demux_001:src6_channel -> uart_RS232_s1_translator_avalon_universal_slave_0_agent:cp_channel
	wire         cmd_xbar_demux_001_src7_endofpacket;                                                                // cmd_xbar_demux_001:src7_endofpacket -> timer_0_s1_translator_avalon_universal_slave_0_agent:cp_endofpacket
	wire         cmd_xbar_demux_001_src7_valid;                                                                      // cmd_xbar_demux_001:src7_valid -> timer_0_s1_translator_avalon_universal_slave_0_agent:cp_valid
	wire         cmd_xbar_demux_001_src7_startofpacket;                                                              // cmd_xbar_demux_001:src7_startofpacket -> timer_0_s1_translator_avalon_universal_slave_0_agent:cp_startofpacket
	wire  [81:0] cmd_xbar_demux_001_src7_data;                                                                       // cmd_xbar_demux_001:src7_data -> timer_0_s1_translator_avalon_universal_slave_0_agent:cp_data
	wire   [8:0] cmd_xbar_demux_001_src7_channel;                                                                    // cmd_xbar_demux_001:src7_channel -> timer_0_s1_translator_avalon_universal_slave_0_agent:cp_channel
	wire         cmd_xbar_demux_001_src8_endofpacket;                                                                // cmd_xbar_demux_001:src8_endofpacket -> calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent:cp_endofpacket
	wire         cmd_xbar_demux_001_src8_valid;                                                                      // cmd_xbar_demux_001:src8_valid -> calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent:cp_valid
	wire         cmd_xbar_demux_001_src8_startofpacket;                                                              // cmd_xbar_demux_001:src8_startofpacket -> calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent:cp_startofpacket
	wire  [81:0] cmd_xbar_demux_001_src8_data;                                                                       // cmd_xbar_demux_001:src8_data -> calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent:cp_data
	wire   [8:0] cmd_xbar_demux_001_src8_channel;                                                                    // cmd_xbar_demux_001:src8_channel -> calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent:cp_channel
	wire         rsp_xbar_demux_src0_endofpacket;                                                                    // rsp_xbar_demux:src0_endofpacket -> rsp_xbar_mux:sink0_endofpacket
	wire         rsp_xbar_demux_src0_valid;                                                                          // rsp_xbar_demux:src0_valid -> rsp_xbar_mux:sink0_valid
	wire         rsp_xbar_demux_src0_startofpacket;                                                                  // rsp_xbar_demux:src0_startofpacket -> rsp_xbar_mux:sink0_startofpacket
	wire  [81:0] rsp_xbar_demux_src0_data;                                                                           // rsp_xbar_demux:src0_data -> rsp_xbar_mux:sink0_data
	wire   [8:0] rsp_xbar_demux_src0_channel;                                                                        // rsp_xbar_demux:src0_channel -> rsp_xbar_mux:sink0_channel
	wire         rsp_xbar_demux_src0_ready;                                                                          // rsp_xbar_mux:sink0_ready -> rsp_xbar_demux:src0_ready
	wire         rsp_xbar_demux_src1_endofpacket;                                                                    // rsp_xbar_demux:src1_endofpacket -> rsp_xbar_mux_001:sink0_endofpacket
	wire         rsp_xbar_demux_src1_valid;                                                                          // rsp_xbar_demux:src1_valid -> rsp_xbar_mux_001:sink0_valid
	wire         rsp_xbar_demux_src1_startofpacket;                                                                  // rsp_xbar_demux:src1_startofpacket -> rsp_xbar_mux_001:sink0_startofpacket
	wire  [81:0] rsp_xbar_demux_src1_data;                                                                           // rsp_xbar_demux:src1_data -> rsp_xbar_mux_001:sink0_data
	wire   [8:0] rsp_xbar_demux_src1_channel;                                                                        // rsp_xbar_demux:src1_channel -> rsp_xbar_mux_001:sink0_channel
	wire         rsp_xbar_demux_src1_ready;                                                                          // rsp_xbar_mux_001:sink0_ready -> rsp_xbar_demux:src1_ready
	wire         rsp_xbar_demux_001_src0_endofpacket;                                                                // rsp_xbar_demux_001:src0_endofpacket -> rsp_xbar_mux:sink1_endofpacket
	wire         rsp_xbar_demux_001_src0_valid;                                                                      // rsp_xbar_demux_001:src0_valid -> rsp_xbar_mux:sink1_valid
	wire         rsp_xbar_demux_001_src0_startofpacket;                                                              // rsp_xbar_demux_001:src0_startofpacket -> rsp_xbar_mux:sink1_startofpacket
	wire  [81:0] rsp_xbar_demux_001_src0_data;                                                                       // rsp_xbar_demux_001:src0_data -> rsp_xbar_mux:sink1_data
	wire   [8:0] rsp_xbar_demux_001_src0_channel;                                                                    // rsp_xbar_demux_001:src0_channel -> rsp_xbar_mux:sink1_channel
	wire         rsp_xbar_demux_001_src0_ready;                                                                      // rsp_xbar_mux:sink1_ready -> rsp_xbar_demux_001:src0_ready
	wire         rsp_xbar_demux_001_src1_endofpacket;                                                                // rsp_xbar_demux_001:src1_endofpacket -> rsp_xbar_mux_001:sink1_endofpacket
	wire         rsp_xbar_demux_001_src1_valid;                                                                      // rsp_xbar_demux_001:src1_valid -> rsp_xbar_mux_001:sink1_valid
	wire         rsp_xbar_demux_001_src1_startofpacket;                                                              // rsp_xbar_demux_001:src1_startofpacket -> rsp_xbar_mux_001:sink1_startofpacket
	wire  [81:0] rsp_xbar_demux_001_src1_data;                                                                       // rsp_xbar_demux_001:src1_data -> rsp_xbar_mux_001:sink1_data
	wire   [8:0] rsp_xbar_demux_001_src1_channel;                                                                    // rsp_xbar_demux_001:src1_channel -> rsp_xbar_mux_001:sink1_channel
	wire         rsp_xbar_demux_001_src1_ready;                                                                      // rsp_xbar_mux_001:sink1_ready -> rsp_xbar_demux_001:src1_ready
	wire         rsp_xbar_demux_002_src0_endofpacket;                                                                // rsp_xbar_demux_002:src0_endofpacket -> rsp_xbar_mux_001:sink2_endofpacket
	wire         rsp_xbar_demux_002_src0_valid;                                                                      // rsp_xbar_demux_002:src0_valid -> rsp_xbar_mux_001:sink2_valid
	wire         rsp_xbar_demux_002_src0_startofpacket;                                                              // rsp_xbar_demux_002:src0_startofpacket -> rsp_xbar_mux_001:sink2_startofpacket
	wire  [81:0] rsp_xbar_demux_002_src0_data;                                                                       // rsp_xbar_demux_002:src0_data -> rsp_xbar_mux_001:sink2_data
	wire   [8:0] rsp_xbar_demux_002_src0_channel;                                                                    // rsp_xbar_demux_002:src0_channel -> rsp_xbar_mux_001:sink2_channel
	wire         rsp_xbar_demux_002_src0_ready;                                                                      // rsp_xbar_mux_001:sink2_ready -> rsp_xbar_demux_002:src0_ready
	wire         rsp_xbar_demux_003_src0_endofpacket;                                                                // rsp_xbar_demux_003:src0_endofpacket -> rsp_xbar_mux_001:sink3_endofpacket
	wire         rsp_xbar_demux_003_src0_valid;                                                                      // rsp_xbar_demux_003:src0_valid -> rsp_xbar_mux_001:sink3_valid
	wire         rsp_xbar_demux_003_src0_startofpacket;                                                              // rsp_xbar_demux_003:src0_startofpacket -> rsp_xbar_mux_001:sink3_startofpacket
	wire  [81:0] rsp_xbar_demux_003_src0_data;                                                                       // rsp_xbar_demux_003:src0_data -> rsp_xbar_mux_001:sink3_data
	wire   [8:0] rsp_xbar_demux_003_src0_channel;                                                                    // rsp_xbar_demux_003:src0_channel -> rsp_xbar_mux_001:sink3_channel
	wire         rsp_xbar_demux_003_src0_ready;                                                                      // rsp_xbar_mux_001:sink3_ready -> rsp_xbar_demux_003:src0_ready
	wire         rsp_xbar_demux_004_src0_endofpacket;                                                                // rsp_xbar_demux_004:src0_endofpacket -> rsp_xbar_mux_001:sink4_endofpacket
	wire         rsp_xbar_demux_004_src0_valid;                                                                      // rsp_xbar_demux_004:src0_valid -> rsp_xbar_mux_001:sink4_valid
	wire         rsp_xbar_demux_004_src0_startofpacket;                                                              // rsp_xbar_demux_004:src0_startofpacket -> rsp_xbar_mux_001:sink4_startofpacket
	wire  [81:0] rsp_xbar_demux_004_src0_data;                                                                       // rsp_xbar_demux_004:src0_data -> rsp_xbar_mux_001:sink4_data
	wire   [8:0] rsp_xbar_demux_004_src0_channel;                                                                    // rsp_xbar_demux_004:src0_channel -> rsp_xbar_mux_001:sink4_channel
	wire         rsp_xbar_demux_004_src0_ready;                                                                      // rsp_xbar_mux_001:sink4_ready -> rsp_xbar_demux_004:src0_ready
	wire         rsp_xbar_demux_005_src0_endofpacket;                                                                // rsp_xbar_demux_005:src0_endofpacket -> rsp_xbar_mux_001:sink5_endofpacket
	wire         rsp_xbar_demux_005_src0_valid;                                                                      // rsp_xbar_demux_005:src0_valid -> rsp_xbar_mux_001:sink5_valid
	wire         rsp_xbar_demux_005_src0_startofpacket;                                                              // rsp_xbar_demux_005:src0_startofpacket -> rsp_xbar_mux_001:sink5_startofpacket
	wire  [81:0] rsp_xbar_demux_005_src0_data;                                                                       // rsp_xbar_demux_005:src0_data -> rsp_xbar_mux_001:sink5_data
	wire   [8:0] rsp_xbar_demux_005_src0_channel;                                                                    // rsp_xbar_demux_005:src0_channel -> rsp_xbar_mux_001:sink5_channel
	wire         rsp_xbar_demux_005_src0_ready;                                                                      // rsp_xbar_mux_001:sink5_ready -> rsp_xbar_demux_005:src0_ready
	wire         rsp_xbar_demux_006_src0_endofpacket;                                                                // rsp_xbar_demux_006:src0_endofpacket -> rsp_xbar_mux_001:sink6_endofpacket
	wire         rsp_xbar_demux_006_src0_valid;                                                                      // rsp_xbar_demux_006:src0_valid -> rsp_xbar_mux_001:sink6_valid
	wire         rsp_xbar_demux_006_src0_startofpacket;                                                              // rsp_xbar_demux_006:src0_startofpacket -> rsp_xbar_mux_001:sink6_startofpacket
	wire  [81:0] rsp_xbar_demux_006_src0_data;                                                                       // rsp_xbar_demux_006:src0_data -> rsp_xbar_mux_001:sink6_data
	wire   [8:0] rsp_xbar_demux_006_src0_channel;                                                                    // rsp_xbar_demux_006:src0_channel -> rsp_xbar_mux_001:sink6_channel
	wire         rsp_xbar_demux_006_src0_ready;                                                                      // rsp_xbar_mux_001:sink6_ready -> rsp_xbar_demux_006:src0_ready
	wire         rsp_xbar_demux_007_src0_endofpacket;                                                                // rsp_xbar_demux_007:src0_endofpacket -> rsp_xbar_mux_001:sink7_endofpacket
	wire         rsp_xbar_demux_007_src0_valid;                                                                      // rsp_xbar_demux_007:src0_valid -> rsp_xbar_mux_001:sink7_valid
	wire         rsp_xbar_demux_007_src0_startofpacket;                                                              // rsp_xbar_demux_007:src0_startofpacket -> rsp_xbar_mux_001:sink7_startofpacket
	wire  [81:0] rsp_xbar_demux_007_src0_data;                                                                       // rsp_xbar_demux_007:src0_data -> rsp_xbar_mux_001:sink7_data
	wire   [8:0] rsp_xbar_demux_007_src0_channel;                                                                    // rsp_xbar_demux_007:src0_channel -> rsp_xbar_mux_001:sink7_channel
	wire         rsp_xbar_demux_007_src0_ready;                                                                      // rsp_xbar_mux_001:sink7_ready -> rsp_xbar_demux_007:src0_ready
	wire         rsp_xbar_demux_008_src0_endofpacket;                                                                // rsp_xbar_demux_008:src0_endofpacket -> rsp_xbar_mux_001:sink8_endofpacket
	wire         rsp_xbar_demux_008_src0_valid;                                                                      // rsp_xbar_demux_008:src0_valid -> rsp_xbar_mux_001:sink8_valid
	wire         rsp_xbar_demux_008_src0_startofpacket;                                                              // rsp_xbar_demux_008:src0_startofpacket -> rsp_xbar_mux_001:sink8_startofpacket
	wire  [81:0] rsp_xbar_demux_008_src0_data;                                                                       // rsp_xbar_demux_008:src0_data -> rsp_xbar_mux_001:sink8_data
	wire   [8:0] rsp_xbar_demux_008_src0_channel;                                                                    // rsp_xbar_demux_008:src0_channel -> rsp_xbar_mux_001:sink8_channel
	wire         rsp_xbar_demux_008_src0_ready;                                                                      // rsp_xbar_mux_001:sink8_ready -> rsp_xbar_demux_008:src0_ready
	wire         limiter_cmd_src_endofpacket;                                                                        // limiter:cmd_src_endofpacket -> cmd_xbar_demux:sink_endofpacket
	wire         limiter_cmd_src_startofpacket;                                                                      // limiter:cmd_src_startofpacket -> cmd_xbar_demux:sink_startofpacket
	wire  [81:0] limiter_cmd_src_data;                                                                               // limiter:cmd_src_data -> cmd_xbar_demux:sink_data
	wire   [8:0] limiter_cmd_src_channel;                                                                            // limiter:cmd_src_channel -> cmd_xbar_demux:sink_channel
	wire         limiter_cmd_src_ready;                                                                              // cmd_xbar_demux:sink_ready -> limiter:cmd_src_ready
	wire         rsp_xbar_mux_src_endofpacket;                                                                       // rsp_xbar_mux:src_endofpacket -> limiter:rsp_sink_endofpacket
	wire         rsp_xbar_mux_src_valid;                                                                             // rsp_xbar_mux:src_valid -> limiter:rsp_sink_valid
	wire         rsp_xbar_mux_src_startofpacket;                                                                     // rsp_xbar_mux:src_startofpacket -> limiter:rsp_sink_startofpacket
	wire  [81:0] rsp_xbar_mux_src_data;                                                                              // rsp_xbar_mux:src_data -> limiter:rsp_sink_data
	wire   [8:0] rsp_xbar_mux_src_channel;                                                                           // rsp_xbar_mux:src_channel -> limiter:rsp_sink_channel
	wire         rsp_xbar_mux_src_ready;                                                                             // limiter:rsp_sink_ready -> rsp_xbar_mux:src_ready
	wire         limiter_001_cmd_src_endofpacket;                                                                    // limiter_001:cmd_src_endofpacket -> cmd_xbar_demux_001:sink_endofpacket
	wire         limiter_001_cmd_src_startofpacket;                                                                  // limiter_001:cmd_src_startofpacket -> cmd_xbar_demux_001:sink_startofpacket
	wire  [81:0] limiter_001_cmd_src_data;                                                                           // limiter_001:cmd_src_data -> cmd_xbar_demux_001:sink_data
	wire   [8:0] limiter_001_cmd_src_channel;                                                                        // limiter_001:cmd_src_channel -> cmd_xbar_demux_001:sink_channel
	wire         limiter_001_cmd_src_ready;                                                                          // cmd_xbar_demux_001:sink_ready -> limiter_001:cmd_src_ready
	wire         rsp_xbar_mux_001_src_endofpacket;                                                                   // rsp_xbar_mux_001:src_endofpacket -> limiter_001:rsp_sink_endofpacket
	wire         rsp_xbar_mux_001_src_valid;                                                                         // rsp_xbar_mux_001:src_valid -> limiter_001:rsp_sink_valid
	wire         rsp_xbar_mux_001_src_startofpacket;                                                                 // rsp_xbar_mux_001:src_startofpacket -> limiter_001:rsp_sink_startofpacket
	wire  [81:0] rsp_xbar_mux_001_src_data;                                                                          // rsp_xbar_mux_001:src_data -> limiter_001:rsp_sink_data
	wire   [8:0] rsp_xbar_mux_001_src_channel;                                                                       // rsp_xbar_mux_001:src_channel -> limiter_001:rsp_sink_channel
	wire         rsp_xbar_mux_001_src_ready;                                                                         // limiter_001:rsp_sink_ready -> rsp_xbar_mux_001:src_ready
	wire         cmd_xbar_mux_src_endofpacket;                                                                       // cmd_xbar_mux:src_endofpacket -> cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent:cp_endofpacket
	wire         cmd_xbar_mux_src_valid;                                                                             // cmd_xbar_mux:src_valid -> cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent:cp_valid
	wire         cmd_xbar_mux_src_startofpacket;                                                                     // cmd_xbar_mux:src_startofpacket -> cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent:cp_startofpacket
	wire  [81:0] cmd_xbar_mux_src_data;                                                                              // cmd_xbar_mux:src_data -> cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent:cp_data
	wire   [8:0] cmd_xbar_mux_src_channel;                                                                           // cmd_xbar_mux:src_channel -> cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent:cp_channel
	wire         cmd_xbar_mux_src_ready;                                                                             // cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent:cp_ready -> cmd_xbar_mux:src_ready
	wire         id_router_src_endofpacket;                                                                          // id_router:src_endofpacket -> rsp_xbar_demux:sink_endofpacket
	wire         id_router_src_valid;                                                                                // id_router:src_valid -> rsp_xbar_demux:sink_valid
	wire         id_router_src_startofpacket;                                                                        // id_router:src_startofpacket -> rsp_xbar_demux:sink_startofpacket
	wire  [81:0] id_router_src_data;                                                                                 // id_router:src_data -> rsp_xbar_demux:sink_data
	wire   [8:0] id_router_src_channel;                                                                              // id_router:src_channel -> rsp_xbar_demux:sink_channel
	wire         id_router_src_ready;                                                                                // rsp_xbar_demux:sink_ready -> id_router:src_ready
	wire         cmd_xbar_demux_001_src2_ready;                                                                      // leds_s1_translator_avalon_universal_slave_0_agent:cp_ready -> cmd_xbar_demux_001:src2_ready
	wire         id_router_002_src_endofpacket;                                                                      // id_router_002:src_endofpacket -> rsp_xbar_demux_002:sink_endofpacket
	wire         id_router_002_src_valid;                                                                            // id_router_002:src_valid -> rsp_xbar_demux_002:sink_valid
	wire         id_router_002_src_startofpacket;                                                                    // id_router_002:src_startofpacket -> rsp_xbar_demux_002:sink_startofpacket
	wire  [81:0] id_router_002_src_data;                                                                             // id_router_002:src_data -> rsp_xbar_demux_002:sink_data
	wire   [8:0] id_router_002_src_channel;                                                                          // id_router_002:src_channel -> rsp_xbar_demux_002:sink_channel
	wire         id_router_002_src_ready;                                                                            // rsp_xbar_demux_002:sink_ready -> id_router_002:src_ready
	wire         cmd_xbar_demux_001_src3_ready;                                                                      // switches_s1_translator_avalon_universal_slave_0_agent:cp_ready -> cmd_xbar_demux_001:src3_ready
	wire         id_router_003_src_endofpacket;                                                                      // id_router_003:src_endofpacket -> rsp_xbar_demux_003:sink_endofpacket
	wire         id_router_003_src_valid;                                                                            // id_router_003:src_valid -> rsp_xbar_demux_003:sink_valid
	wire         id_router_003_src_startofpacket;                                                                    // id_router_003:src_startofpacket -> rsp_xbar_demux_003:sink_startofpacket
	wire  [81:0] id_router_003_src_data;                                                                             // id_router_003:src_data -> rsp_xbar_demux_003:sink_data
	wire   [8:0] id_router_003_src_channel;                                                                          // id_router_003:src_channel -> rsp_xbar_demux_003:sink_channel
	wire         id_router_003_src_ready;                                                                            // rsp_xbar_demux_003:sink_ready -> id_router_003:src_ready
	wire         cmd_xbar_demux_001_src4_ready;                                                                      // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:cp_ready -> cmd_xbar_demux_001:src4_ready
	wire         id_router_004_src_endofpacket;                                                                      // id_router_004:src_endofpacket -> rsp_xbar_demux_004:sink_endofpacket
	wire         id_router_004_src_valid;                                                                            // id_router_004:src_valid -> rsp_xbar_demux_004:sink_valid
	wire         id_router_004_src_startofpacket;                                                                    // id_router_004:src_startofpacket -> rsp_xbar_demux_004:sink_startofpacket
	wire  [81:0] id_router_004_src_data;                                                                             // id_router_004:src_data -> rsp_xbar_demux_004:sink_data
	wire   [8:0] id_router_004_src_channel;                                                                          // id_router_004:src_channel -> rsp_xbar_demux_004:sink_channel
	wire         id_router_004_src_ready;                                                                            // rsp_xbar_demux_004:sink_ready -> id_router_004:src_ready
	wire         cmd_xbar_demux_001_src5_ready;                                                                      // lcd_0_control_slave_translator_avalon_universal_slave_0_agent:cp_ready -> cmd_xbar_demux_001:src5_ready
	wire         id_router_005_src_endofpacket;                                                                      // id_router_005:src_endofpacket -> rsp_xbar_demux_005:sink_endofpacket
	wire         id_router_005_src_valid;                                                                            // id_router_005:src_valid -> rsp_xbar_demux_005:sink_valid
	wire         id_router_005_src_startofpacket;                                                                    // id_router_005:src_startofpacket -> rsp_xbar_demux_005:sink_startofpacket
	wire  [81:0] id_router_005_src_data;                                                                             // id_router_005:src_data -> rsp_xbar_demux_005:sink_data
	wire   [8:0] id_router_005_src_channel;                                                                          // id_router_005:src_channel -> rsp_xbar_demux_005:sink_channel
	wire         id_router_005_src_ready;                                                                            // rsp_xbar_demux_005:sink_ready -> id_router_005:src_ready
	wire         cmd_xbar_demux_001_src6_ready;                                                                      // uart_RS232_s1_translator_avalon_universal_slave_0_agent:cp_ready -> cmd_xbar_demux_001:src6_ready
	wire         id_router_006_src_endofpacket;                                                                      // id_router_006:src_endofpacket -> rsp_xbar_demux_006:sink_endofpacket
	wire         id_router_006_src_valid;                                                                            // id_router_006:src_valid -> rsp_xbar_demux_006:sink_valid
	wire         id_router_006_src_startofpacket;                                                                    // id_router_006:src_startofpacket -> rsp_xbar_demux_006:sink_startofpacket
	wire  [81:0] id_router_006_src_data;                                                                             // id_router_006:src_data -> rsp_xbar_demux_006:sink_data
	wire   [8:0] id_router_006_src_channel;                                                                          // id_router_006:src_channel -> rsp_xbar_demux_006:sink_channel
	wire         id_router_006_src_ready;                                                                            // rsp_xbar_demux_006:sink_ready -> id_router_006:src_ready
	wire         cmd_xbar_demux_001_src7_ready;                                                                      // timer_0_s1_translator_avalon_universal_slave_0_agent:cp_ready -> cmd_xbar_demux_001:src7_ready
	wire         id_router_007_src_endofpacket;                                                                      // id_router_007:src_endofpacket -> rsp_xbar_demux_007:sink_endofpacket
	wire         id_router_007_src_valid;                                                                            // id_router_007:src_valid -> rsp_xbar_demux_007:sink_valid
	wire         id_router_007_src_startofpacket;                                                                    // id_router_007:src_startofpacket -> rsp_xbar_demux_007:sink_startofpacket
	wire  [81:0] id_router_007_src_data;                                                                             // id_router_007:src_data -> rsp_xbar_demux_007:sink_data
	wire   [8:0] id_router_007_src_channel;                                                                          // id_router_007:src_channel -> rsp_xbar_demux_007:sink_channel
	wire         id_router_007_src_ready;                                                                            // rsp_xbar_demux_007:sink_ready -> id_router_007:src_ready
	wire         cmd_xbar_demux_001_src8_ready;                                                                      // calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent:cp_ready -> cmd_xbar_demux_001:src8_ready
	wire         id_router_008_src_endofpacket;                                                                      // id_router_008:src_endofpacket -> rsp_xbar_demux_008:sink_endofpacket
	wire         id_router_008_src_valid;                                                                            // id_router_008:src_valid -> rsp_xbar_demux_008:sink_valid
	wire         id_router_008_src_startofpacket;                                                                    // id_router_008:src_startofpacket -> rsp_xbar_demux_008:sink_startofpacket
	wire  [81:0] id_router_008_src_data;                                                                             // id_router_008:src_data -> rsp_xbar_demux_008:sink_data
	wire   [8:0] id_router_008_src_channel;                                                                          // id_router_008:src_channel -> rsp_xbar_demux_008:sink_channel
	wire         id_router_008_src_ready;                                                                            // rsp_xbar_demux_008:sink_ready -> id_router_008:src_ready
	wire         cmd_xbar_mux_001_src_endofpacket;                                                                   // cmd_xbar_mux_001:src_endofpacket -> width_adapter:in_endofpacket
	wire         cmd_xbar_mux_001_src_valid;                                                                         // cmd_xbar_mux_001:src_valid -> width_adapter:in_valid
	wire         cmd_xbar_mux_001_src_startofpacket;                                                                 // cmd_xbar_mux_001:src_startofpacket -> width_adapter:in_startofpacket
	wire  [81:0] cmd_xbar_mux_001_src_data;                                                                          // cmd_xbar_mux_001:src_data -> width_adapter:in_data
	wire   [8:0] cmd_xbar_mux_001_src_channel;                                                                       // cmd_xbar_mux_001:src_channel -> width_adapter:in_channel
	wire         cmd_xbar_mux_001_src_ready;                                                                         // width_adapter:in_ready -> cmd_xbar_mux_001:src_ready
	wire         width_adapter_src_endofpacket;                                                                      // width_adapter:out_endofpacket -> burst_adapter:sink0_endofpacket
	wire         width_adapter_src_valid;                                                                            // width_adapter:out_valid -> burst_adapter:sink0_valid
	wire         width_adapter_src_startofpacket;                                                                    // width_adapter:out_startofpacket -> burst_adapter:sink0_startofpacket
	wire  [63:0] width_adapter_src_data;                                                                             // width_adapter:out_data -> burst_adapter:sink0_data
	wire         width_adapter_src_ready;                                                                            // burst_adapter:sink0_ready -> width_adapter:out_ready
	wire   [8:0] width_adapter_src_channel;                                                                          // width_adapter:out_channel -> burst_adapter:sink0_channel
	wire         id_router_001_src_endofpacket;                                                                      // id_router_001:src_endofpacket -> width_adapter_001:in_endofpacket
	wire         id_router_001_src_valid;                                                                            // id_router_001:src_valid -> width_adapter_001:in_valid
	wire         id_router_001_src_startofpacket;                                                                    // id_router_001:src_startofpacket -> width_adapter_001:in_startofpacket
	wire  [63:0] id_router_001_src_data;                                                                             // id_router_001:src_data -> width_adapter_001:in_data
	wire   [8:0] id_router_001_src_channel;                                                                          // id_router_001:src_channel -> width_adapter_001:in_channel
	wire         id_router_001_src_ready;                                                                            // width_adapter_001:in_ready -> id_router_001:src_ready
	wire         width_adapter_001_src_endofpacket;                                                                  // width_adapter_001:out_endofpacket -> rsp_xbar_demux_001:sink_endofpacket
	wire         width_adapter_001_src_valid;                                                                        // width_adapter_001:out_valid -> rsp_xbar_demux_001:sink_valid
	wire         width_adapter_001_src_startofpacket;                                                                // width_adapter_001:out_startofpacket -> rsp_xbar_demux_001:sink_startofpacket
	wire  [81:0] width_adapter_001_src_data;                                                                         // width_adapter_001:out_data -> rsp_xbar_demux_001:sink_data
	wire         width_adapter_001_src_ready;                                                                        // rsp_xbar_demux_001:sink_ready -> width_adapter_001:out_ready
	wire   [8:0] width_adapter_001_src_channel;                                                                      // width_adapter_001:out_channel -> rsp_xbar_demux_001:sink_channel
	wire   [8:0] limiter_cmd_valid_data;                                                                             // limiter:cmd_src_valid -> cmd_xbar_demux:sink_valid
	wire   [8:0] limiter_001_cmd_valid_data;                                                                         // limiter_001:cmd_src_valid -> cmd_xbar_demux_001:sink_valid
	wire         irq_mapper_receiver0_irq;                                                                           // jtag_uart_0:av_irq -> irq_mapper:receiver0_irq
	wire         irq_mapper_receiver1_irq;                                                                           // uart_RS232:irq -> irq_mapper:receiver1_irq
	wire         irq_mapper_receiver2_irq;                                                                           // timer_0:irq -> irq_mapper:receiver2_irq
	wire  [31:0] cpu_nios_d_irq_irq;                                                                                 // irq_mapper:sender_irq -> cpu_nios:d_irq

	nios_qsys_cpu_nios cpu_nios (
		.clk                                   (clk_clk),                                                                 //                       clk.clk
		.reset_n                               (~rst_controller_reset_out_reset),                                         //                   reset_n.reset_n
		.d_address                             (cpu_nios_data_master_address),                                            //               data_master.address
		.d_byteenable                          (cpu_nios_data_master_byteenable),                                         //                          .byteenable
		.d_read                                (cpu_nios_data_master_read),                                               //                          .read
		.d_readdata                            (cpu_nios_data_master_readdata),                                           //                          .readdata
		.d_waitrequest                         (cpu_nios_data_master_waitrequest),                                        //                          .waitrequest
		.d_write                               (cpu_nios_data_master_write),                                              //                          .write
		.d_writedata                           (cpu_nios_data_master_writedata),                                          //                          .writedata
		.jtag_debug_module_debugaccess_to_roms (cpu_nios_data_master_debugaccess),                                        //                          .debugaccess
		.i_address                             (cpu_nios_instruction_master_address),                                     //        instruction_master.address
		.i_read                                (cpu_nios_instruction_master_read),                                        //                          .read
		.i_readdata                            (cpu_nios_instruction_master_readdata),                                    //                          .readdata
		.i_waitrequest                         (cpu_nios_instruction_master_waitrequest),                                 //                          .waitrequest
		.i_readdatavalid                       (cpu_nios_instruction_master_readdatavalid),                               //                          .readdatavalid
		.d_irq                                 (cpu_nios_d_irq_irq),                                                      //                     d_irq.irq
		.jtag_debug_module_resetrequest        (),                                                                        //   jtag_debug_module_reset.reset
		.jtag_debug_module_address             (cpu_nios_jtag_debug_module_translator_avalon_anti_slave_0_address),       //         jtag_debug_module.address
		.jtag_debug_module_begintransfer       (cpu_nios_jtag_debug_module_translator_avalon_anti_slave_0_begintransfer), //                          .begintransfer
		.jtag_debug_module_byteenable          (cpu_nios_jtag_debug_module_translator_avalon_anti_slave_0_byteenable),    //                          .byteenable
		.jtag_debug_module_debugaccess         (cpu_nios_jtag_debug_module_translator_avalon_anti_slave_0_debugaccess),   //                          .debugaccess
		.jtag_debug_module_readdata            (cpu_nios_jtag_debug_module_translator_avalon_anti_slave_0_readdata),      //                          .readdata
		.jtag_debug_module_select              (cpu_nios_jtag_debug_module_translator_avalon_anti_slave_0_chipselect),    //                          .chipselect
		.jtag_debug_module_write               (cpu_nios_jtag_debug_module_translator_avalon_anti_slave_0_write),         //                          .write
		.jtag_debug_module_writedata           (cpu_nios_jtag_debug_module_translator_avalon_anti_slave_0_writedata),     //                          .writedata
		.no_ci_readra                          ()                                                                         // custom_instruction_master.readra
	);

	nios_qsys_leds leds (
		.clk        (clk_clk),                                           //                 clk.clk
		.reset_n    (~rst_controller_reset_out_reset),                   //               reset.reset_n
		.address    (leds_s1_translator_avalon_anti_slave_0_address),    //                  s1.address
		.write_n    (~leds_s1_translator_avalon_anti_slave_0_write),     //                    .write_n
		.writedata  (leds_s1_translator_avalon_anti_slave_0_writedata),  //                    .writedata
		.chipselect (leds_s1_translator_avalon_anti_slave_0_chipselect), //                    .chipselect
		.readdata   (leds_s1_translator_avalon_anti_slave_0_readdata),   //                    .readdata
		.out_port   (leds_export)                                        // external_connection.export
	);

	nios_qsys_switches switches (
		.clk      (clk_clk),                                             //                 clk.clk
		.reset_n  (~rst_controller_reset_out_reset),                     //               reset.reset_n
		.address  (switches_s1_translator_avalon_anti_slave_0_address),  //                  s1.address
		.readdata (switches_s1_translator_avalon_anti_slave_0_readdata), //                    .readdata
		.in_port  (switches_export)                                      // external_connection.export
	);

	nios_qsys_sdram_controller sdram_controller (
		.clk            (clk_clk),                                                          //   clk.clk
		.reset_n        (~rst_controller_reset_out_reset),                                  // reset.reset_n
		.az_addr        (sdram_controller_s1_translator_avalon_anti_slave_0_address),       //    s1.address
		.az_be_n        (~sdram_controller_s1_translator_avalon_anti_slave_0_byteenable),   //      .byteenable_n
		.az_cs          (sdram_controller_s1_translator_avalon_anti_slave_0_chipselect),    //      .chipselect
		.az_data        (sdram_controller_s1_translator_avalon_anti_slave_0_writedata),     //      .writedata
		.az_rd_n        (~sdram_controller_s1_translator_avalon_anti_slave_0_read),         //      .read_n
		.az_wr_n        (~sdram_controller_s1_translator_avalon_anti_slave_0_write),        //      .write_n
		.za_data        (sdram_controller_s1_translator_avalon_anti_slave_0_readdata),      //      .readdata
		.za_valid       (sdram_controller_s1_translator_avalon_anti_slave_0_readdatavalid), //      .readdatavalid
		.za_waitrequest (sdram_controller_s1_translator_avalon_anti_slave_0_waitrequest),   //      .waitrequest
		.zs_addr        (sdram_addr),                                                       //  wire.export
		.zs_ba          (sdram_ba),                                                         //      .export
		.zs_cas_n       (sdram_cas_n),                                                      //      .export
		.zs_cke         (sdram_cke),                                                        //      .export
		.zs_cs_n        (sdram_cs_n),                                                       //      .export
		.zs_dq          (sdram_dq),                                                         //      .export
		.zs_dqm         (sdram_dqm),                                                        //      .export
		.zs_ras_n       (sdram_ras_n),                                                      //      .export
		.zs_we_n        (sdram_we_n)                                                        //      .export
	);

	nios_qsys_jtag_uart_0 jtag_uart_0 (
		.clk            (clk_clk),                                                                  //               clk.clk
		.rst_n          (~rst_controller_reset_out_reset),                                          //             reset.reset_n
		.av_chipselect  (jtag_uart_0_avalon_jtag_slave_translator_avalon_anti_slave_0_chipselect),  // avalon_jtag_slave.chipselect
		.av_address     (jtag_uart_0_avalon_jtag_slave_translator_avalon_anti_slave_0_address),     //                  .address
		.av_read_n      (~jtag_uart_0_avalon_jtag_slave_translator_avalon_anti_slave_0_read),       //                  .read_n
		.av_readdata    (jtag_uart_0_avalon_jtag_slave_translator_avalon_anti_slave_0_readdata),    //                  .readdata
		.av_write_n     (~jtag_uart_0_avalon_jtag_slave_translator_avalon_anti_slave_0_write),      //                  .write_n
		.av_writedata   (jtag_uart_0_avalon_jtag_slave_translator_avalon_anti_slave_0_writedata),   //                  .writedata
		.av_waitrequest (jtag_uart_0_avalon_jtag_slave_translator_avalon_anti_slave_0_waitrequest), //                  .waitrequest
		.dataavailable  (),                                                                         //                  .dataavailable
		.readyfordata   (),                                                                         //                  .readyfordata
		.av_irq         (irq_mapper_receiver0_irq)                                                  //               irq.irq
	);

	nios_qsys_lcd_0 lcd_0 (
		.clk           (clk_clk),                                                          //           clk.clk
		.reset_n       (~rst_controller_reset_out_reset),                                  //         reset.reset_n
		.address       (lcd_0_control_slave_translator_avalon_anti_slave_0_address),       // control_slave.address
		.begintransfer (lcd_0_control_slave_translator_avalon_anti_slave_0_begintransfer), //              .begintransfer
		.read          (lcd_0_control_slave_translator_avalon_anti_slave_0_read),          //              .read
		.readdata      (lcd_0_control_slave_translator_avalon_anti_slave_0_readdata),      //              .readdata
		.write         (lcd_0_control_slave_translator_avalon_anti_slave_0_write),         //              .write
		.writedata     (lcd_0_control_slave_translator_avalon_anti_slave_0_writedata),     //              .writedata
		.LCD_data      (lcd_data),                                                         //      external.export
		.LCD_E         (lcd_E),                                                            //              .export
		.LCD_RS        (lcd_RS),                                                           //              .export
		.LCD_RW        (lcd_RW)                                                            //              .export
	);

	nios_qsys_uart_RS232 uart_rs232 (
		.clk           (clk_clk),                                                    //                 clk.clk
		.reset_n       (~rst_controller_reset_out_reset),                            //               reset.reset_n
		.address       (uart_rs232_s1_translator_avalon_anti_slave_0_address),       //                  s1.address
		.begintransfer (uart_rs232_s1_translator_avalon_anti_slave_0_begintransfer), //                    .begintransfer
		.chipselect    (uart_rs232_s1_translator_avalon_anti_slave_0_chipselect),    //                    .chipselect
		.read_n        (~uart_rs232_s1_translator_avalon_anti_slave_0_read),         //                    .read_n
		.write_n       (~uart_rs232_s1_translator_avalon_anti_slave_0_write),        //                    .write_n
		.writedata     (uart_rs232_s1_translator_avalon_anti_slave_0_writedata),     //                    .writedata
		.readdata      (uart_rs232_s1_translator_avalon_anti_slave_0_readdata),      //                    .readdata
		.dataavailable (),                                                           //                    .dataavailable
		.readyfordata  (),                                                           //                    .readyfordata
		.rxd           (rs232_rxd),                                                  // external_connection.export
		.txd           (rs232_txd),                                                  //                    .export
		.irq           (irq_mapper_receiver1_irq)                                    //                 irq.irq
	);

	nios_qsys_timer_0 timer_0 (
		.clk        (clk_clk),                                              //   clk.clk
		.reset_n    (~rst_controller_reset_out_reset),                      // reset.reset_n
		.address    (timer_0_s1_translator_avalon_anti_slave_0_address),    //    s1.address
		.writedata  (timer_0_s1_translator_avalon_anti_slave_0_writedata),  //      .writedata
		.readdata   (timer_0_s1_translator_avalon_anti_slave_0_readdata),   //      .readdata
		.chipselect (timer_0_s1_translator_avalon_anti_slave_0_chipselect), //      .chipselect
		.write_n    (~timer_0_s1_translator_avalon_anti_slave_0_write),     //      .write_n
		.irq        (irq_mapper_receiver2_irq)                              //   irq.irq
	);

	calibrate_avalon calibrate_avalon_0 (
		.clk              (clk_clk),                                                        //    clock.clk
		.reset_n          (~rst_controller_reset_out_reset),                                //    reset.reset_n
		.avs_s1_write     (calibrate_avalon_0_s1_translator_avalon_anti_slave_0_write),     //       s1.write
		.avs_s1_read      (calibrate_avalon_0_s1_translator_avalon_anti_slave_0_read),      //         .read
		.avs_s1_address   (calibrate_avalon_0_s1_translator_avalon_anti_slave_0_address),   //         .address
		.avs_s1_writedata (calibrate_avalon_0_s1_translator_avalon_anti_slave_0_writedata), //         .writedata
		.avs_s1_readdata  (calibrate_avalon_0_s1_translator_avalon_anti_slave_0_readdata),  //         .readdata
		.data             (data_export),                                                    //     data.export
		.x_coord          (x_coord_export),                                                 //  x_coord.export
		.y_coord          (y_coord_export),                                                 //  y_coord.export
		.data_cal         (data_cal_export)                                                 // data_cal.export
	);

	altera_merlin_master_translator #(
		.AV_ADDRESS_W                (25),
		.AV_DATA_W                   (32),
		.AV_BURSTCOUNT_W             (1),
		.AV_BYTEENABLE_W             (4),
		.UAV_ADDRESS_W               (25),
		.UAV_BURSTCOUNT_W            (3),
		.USE_READ                    (1),
		.USE_WRITE                   (0),
		.USE_BEGINBURSTTRANSFER      (0),
		.USE_BEGINTRANSFER           (0),
		.USE_CHIPSELECT              (0),
		.USE_BURSTCOUNT              (0),
		.USE_READDATAVALID           (1),
		.USE_WAITREQUEST             (1),
		.AV_SYMBOLS_PER_WORD         (4),
		.AV_ADDRESS_SYMBOLS          (1),
		.AV_BURSTCOUNT_SYMBOLS       (0),
		.AV_CONSTANT_BURST_BEHAVIOR  (0),
		.UAV_CONSTANT_BURST_BEHAVIOR (0),
		.AV_LINEWRAPBURSTS           (1),
		.AV_REGISTERINCOMINGSIGNALS  (0)
	) cpu_nios_instruction_master_translator (
		.clk                   (clk_clk),                                                                        //                       clk.clk
		.reset                 (rst_controller_reset_out_reset),                                                 //                     reset.reset
		.uav_address           (cpu_nios_instruction_master_translator_avalon_universal_master_0_address),       // avalon_universal_master_0.address
		.uav_burstcount        (cpu_nios_instruction_master_translator_avalon_universal_master_0_burstcount),    //                          .burstcount
		.uav_read              (cpu_nios_instruction_master_translator_avalon_universal_master_0_read),          //                          .read
		.uav_write             (cpu_nios_instruction_master_translator_avalon_universal_master_0_write),         //                          .write
		.uav_waitrequest       (cpu_nios_instruction_master_translator_avalon_universal_master_0_waitrequest),   //                          .waitrequest
		.uav_readdatavalid     (cpu_nios_instruction_master_translator_avalon_universal_master_0_readdatavalid), //                          .readdatavalid
		.uav_byteenable        (cpu_nios_instruction_master_translator_avalon_universal_master_0_byteenable),    //                          .byteenable
		.uav_readdata          (cpu_nios_instruction_master_translator_avalon_universal_master_0_readdata),      //                          .readdata
		.uav_writedata         (cpu_nios_instruction_master_translator_avalon_universal_master_0_writedata),     //                          .writedata
		.uav_lock              (cpu_nios_instruction_master_translator_avalon_universal_master_0_lock),          //                          .lock
		.uav_debugaccess       (cpu_nios_instruction_master_translator_avalon_universal_master_0_debugaccess),   //                          .debugaccess
		.av_address            (cpu_nios_instruction_master_address),                                            //      avalon_anti_master_0.address
		.av_waitrequest        (cpu_nios_instruction_master_waitrequest),                                        //                          .waitrequest
		.av_read               (cpu_nios_instruction_master_read),                                               //                          .read
		.av_readdata           (cpu_nios_instruction_master_readdata),                                           //                          .readdata
		.av_readdatavalid      (cpu_nios_instruction_master_readdatavalid),                                      //                          .readdatavalid
		.av_burstcount         (1'b1),                                                                           //               (terminated)
		.av_byteenable         (4'b1111),                                                                        //               (terminated)
		.av_beginbursttransfer (1'b0),                                                                           //               (terminated)
		.av_begintransfer      (1'b0),                                                                           //               (terminated)
		.av_chipselect         (1'b0),                                                                           //               (terminated)
		.av_write              (1'b0),                                                                           //               (terminated)
		.av_writedata          (32'b00000000000000000000000000000000),                                           //               (terminated)
		.av_lock               (1'b0),                                                                           //               (terminated)
		.av_debugaccess        (1'b0),                                                                           //               (terminated)
		.uav_clken             (),                                                                               //               (terminated)
		.av_clken              (1'b1)                                                                            //               (terminated)
	);

	altera_merlin_master_translator #(
		.AV_ADDRESS_W                (25),
		.AV_DATA_W                   (32),
		.AV_BURSTCOUNT_W             (1),
		.AV_BYTEENABLE_W             (4),
		.UAV_ADDRESS_W               (25),
		.UAV_BURSTCOUNT_W            (3),
		.USE_READ                    (1),
		.USE_WRITE                   (1),
		.USE_BEGINBURSTTRANSFER      (0),
		.USE_BEGINTRANSFER           (0),
		.USE_CHIPSELECT              (0),
		.USE_BURSTCOUNT              (0),
		.USE_READDATAVALID           (0),
		.USE_WAITREQUEST             (1),
		.AV_SYMBOLS_PER_WORD         (4),
		.AV_ADDRESS_SYMBOLS          (1),
		.AV_BURSTCOUNT_SYMBOLS       (0),
		.AV_CONSTANT_BURST_BEHAVIOR  (0),
		.UAV_CONSTANT_BURST_BEHAVIOR (0),
		.AV_LINEWRAPBURSTS           (0),
		.AV_REGISTERINCOMINGSIGNALS  (0)
	) cpu_nios_data_master_translator (
		.clk                   (clk_clk),                                                                 //                       clk.clk
		.reset                 (rst_controller_reset_out_reset),                                          //                     reset.reset
		.uav_address           (cpu_nios_data_master_translator_avalon_universal_master_0_address),       // avalon_universal_master_0.address
		.uav_burstcount        (cpu_nios_data_master_translator_avalon_universal_master_0_burstcount),    //                          .burstcount
		.uav_read              (cpu_nios_data_master_translator_avalon_universal_master_0_read),          //                          .read
		.uav_write             (cpu_nios_data_master_translator_avalon_universal_master_0_write),         //                          .write
		.uav_waitrequest       (cpu_nios_data_master_translator_avalon_universal_master_0_waitrequest),   //                          .waitrequest
		.uav_readdatavalid     (cpu_nios_data_master_translator_avalon_universal_master_0_readdatavalid), //                          .readdatavalid
		.uav_byteenable        (cpu_nios_data_master_translator_avalon_universal_master_0_byteenable),    //                          .byteenable
		.uav_readdata          (cpu_nios_data_master_translator_avalon_universal_master_0_readdata),      //                          .readdata
		.uav_writedata         (cpu_nios_data_master_translator_avalon_universal_master_0_writedata),     //                          .writedata
		.uav_lock              (cpu_nios_data_master_translator_avalon_universal_master_0_lock),          //                          .lock
		.uav_debugaccess       (cpu_nios_data_master_translator_avalon_universal_master_0_debugaccess),   //                          .debugaccess
		.av_address            (cpu_nios_data_master_address),                                            //      avalon_anti_master_0.address
		.av_waitrequest        (cpu_nios_data_master_waitrequest),                                        //                          .waitrequest
		.av_byteenable         (cpu_nios_data_master_byteenable),                                         //                          .byteenable
		.av_read               (cpu_nios_data_master_read),                                               //                          .read
		.av_readdata           (cpu_nios_data_master_readdata),                                           //                          .readdata
		.av_write              (cpu_nios_data_master_write),                                              //                          .write
		.av_writedata          (cpu_nios_data_master_writedata),                                          //                          .writedata
		.av_debugaccess        (cpu_nios_data_master_debugaccess),                                        //                          .debugaccess
		.av_burstcount         (1'b1),                                                                    //               (terminated)
		.av_beginbursttransfer (1'b0),                                                                    //               (terminated)
		.av_begintransfer      (1'b0),                                                                    //               (terminated)
		.av_chipselect         (1'b0),                                                                    //               (terminated)
		.av_readdatavalid      (),                                                                        //               (terminated)
		.av_lock               (1'b0),                                                                    //               (terminated)
		.uav_clken             (),                                                                        //               (terminated)
		.av_clken              (1'b1)                                                                     //               (terminated)
	);

	altera_merlin_slave_translator #(
		.AV_ADDRESS_W                   (9),
		.AV_DATA_W                      (32),
		.UAV_DATA_W                     (32),
		.AV_BURSTCOUNT_W                (1),
		.AV_BYTEENABLE_W                (4),
		.UAV_BYTEENABLE_W               (4),
		.UAV_ADDRESS_W                  (25),
		.UAV_BURSTCOUNT_W               (3),
		.AV_READLATENCY                 (0),
		.USE_READDATAVALID              (0),
		.USE_WAITREQUEST                (0),
		.USE_UAV_CLKEN                  (0),
		.AV_SYMBOLS_PER_WORD            (4),
		.AV_ADDRESS_SYMBOLS             (0),
		.AV_BURSTCOUNT_SYMBOLS          (0),
		.AV_CONSTANT_BURST_BEHAVIOR     (0),
		.UAV_CONSTANT_BURST_BEHAVIOR    (0),
		.AV_REQUIRE_UNALIGNED_ADDRESSES (0),
		.CHIPSELECT_THROUGH_READLATENCY (0),
		.AV_READ_WAIT_CYCLES            (1),
		.AV_WRITE_WAIT_CYCLES           (0),
		.AV_SETUP_WAIT_CYCLES           (0),
		.AV_DATA_HOLD_CYCLES            (0)
	) cpu_nios_jtag_debug_module_translator (
		.clk                   (clk_clk),                                                                               //                      clk.clk
		.reset                 (rst_controller_reset_out_reset),                                                        //                    reset.reset
		.uav_address           (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_address),       // avalon_universal_slave_0.address
		.uav_burstcount        (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_burstcount),    //                         .burstcount
		.uav_read              (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_read),          //                         .read
		.uav_write             (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_write),         //                         .write
		.uav_waitrequest       (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_waitrequest),   //                         .waitrequest
		.uav_readdatavalid     (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_readdatavalid), //                         .readdatavalid
		.uav_byteenable        (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_byteenable),    //                         .byteenable
		.uav_readdata          (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_readdata),      //                         .readdata
		.uav_writedata         (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_writedata),     //                         .writedata
		.uav_lock              (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_lock),          //                         .lock
		.uav_debugaccess       (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_debugaccess),   //                         .debugaccess
		.av_address            (cpu_nios_jtag_debug_module_translator_avalon_anti_slave_0_address),                     //      avalon_anti_slave_0.address
		.av_write              (cpu_nios_jtag_debug_module_translator_avalon_anti_slave_0_write),                       //                         .write
		.av_readdata           (cpu_nios_jtag_debug_module_translator_avalon_anti_slave_0_readdata),                    //                         .readdata
		.av_writedata          (cpu_nios_jtag_debug_module_translator_avalon_anti_slave_0_writedata),                   //                         .writedata
		.av_begintransfer      (cpu_nios_jtag_debug_module_translator_avalon_anti_slave_0_begintransfer),               //                         .begintransfer
		.av_byteenable         (cpu_nios_jtag_debug_module_translator_avalon_anti_slave_0_byteenable),                  //                         .byteenable
		.av_chipselect         (cpu_nios_jtag_debug_module_translator_avalon_anti_slave_0_chipselect),                  //                         .chipselect
		.av_debugaccess        (cpu_nios_jtag_debug_module_translator_avalon_anti_slave_0_debugaccess),                 //                         .debugaccess
		.av_read               (),                                                                                      //              (terminated)
		.av_beginbursttransfer (),                                                                                      //              (terminated)
		.av_burstcount         (),                                                                                      //              (terminated)
		.av_readdatavalid      (1'b0),                                                                                  //              (terminated)
		.av_waitrequest        (1'b0),                                                                                  //              (terminated)
		.av_writebyteenable    (),                                                                                      //              (terminated)
		.av_lock               (),                                                                                      //              (terminated)
		.av_clken              (),                                                                                      //              (terminated)
		.uav_clken             (1'b0),                                                                                  //              (terminated)
		.av_outputenable       ()                                                                                       //              (terminated)
	);

	altera_merlin_slave_translator #(
		.AV_ADDRESS_W                   (22),
		.AV_DATA_W                      (16),
		.UAV_DATA_W                     (16),
		.AV_BURSTCOUNT_W                (1),
		.AV_BYTEENABLE_W                (2),
		.UAV_BYTEENABLE_W               (2),
		.UAV_ADDRESS_W                  (25),
		.UAV_BURSTCOUNT_W               (2),
		.AV_READLATENCY                 (0),
		.USE_READDATAVALID              (1),
		.USE_WAITREQUEST                (1),
		.USE_UAV_CLKEN                  (0),
		.AV_SYMBOLS_PER_WORD            (2),
		.AV_ADDRESS_SYMBOLS             (0),
		.AV_BURSTCOUNT_SYMBOLS          (0),
		.AV_CONSTANT_BURST_BEHAVIOR     (0),
		.UAV_CONSTANT_BURST_BEHAVIOR    (0),
		.AV_REQUIRE_UNALIGNED_ADDRESSES (0),
		.CHIPSELECT_THROUGH_READLATENCY (0),
		.AV_READ_WAIT_CYCLES            (1),
		.AV_WRITE_WAIT_CYCLES           (0),
		.AV_SETUP_WAIT_CYCLES           (0),
		.AV_DATA_HOLD_CYCLES            (0)
	) sdram_controller_s1_translator (
		.clk                   (clk_clk),                                                                        //                      clk.clk
		.reset                 (rst_controller_reset_out_reset),                                                 //                    reset.reset
		.uav_address           (sdram_controller_s1_translator_avalon_universal_slave_0_agent_m0_address),       // avalon_universal_slave_0.address
		.uav_burstcount        (sdram_controller_s1_translator_avalon_universal_slave_0_agent_m0_burstcount),    //                         .burstcount
		.uav_read              (sdram_controller_s1_translator_avalon_universal_slave_0_agent_m0_read),          //                         .read
		.uav_write             (sdram_controller_s1_translator_avalon_universal_slave_0_agent_m0_write),         //                         .write
		.uav_waitrequest       (sdram_controller_s1_translator_avalon_universal_slave_0_agent_m0_waitrequest),   //                         .waitrequest
		.uav_readdatavalid     (sdram_controller_s1_translator_avalon_universal_slave_0_agent_m0_readdatavalid), //                         .readdatavalid
		.uav_byteenable        (sdram_controller_s1_translator_avalon_universal_slave_0_agent_m0_byteenable),    //                         .byteenable
		.uav_readdata          (sdram_controller_s1_translator_avalon_universal_slave_0_agent_m0_readdata),      //                         .readdata
		.uav_writedata         (sdram_controller_s1_translator_avalon_universal_slave_0_agent_m0_writedata),     //                         .writedata
		.uav_lock              (sdram_controller_s1_translator_avalon_universal_slave_0_agent_m0_lock),          //                         .lock
		.uav_debugaccess       (sdram_controller_s1_translator_avalon_universal_slave_0_agent_m0_debugaccess),   //                         .debugaccess
		.av_address            (sdram_controller_s1_translator_avalon_anti_slave_0_address),                     //      avalon_anti_slave_0.address
		.av_write              (sdram_controller_s1_translator_avalon_anti_slave_0_write),                       //                         .write
		.av_read               (sdram_controller_s1_translator_avalon_anti_slave_0_read),                        //                         .read
		.av_readdata           (sdram_controller_s1_translator_avalon_anti_slave_0_readdata),                    //                         .readdata
		.av_writedata          (sdram_controller_s1_translator_avalon_anti_slave_0_writedata),                   //                         .writedata
		.av_byteenable         (sdram_controller_s1_translator_avalon_anti_slave_0_byteenable),                  //                         .byteenable
		.av_readdatavalid      (sdram_controller_s1_translator_avalon_anti_slave_0_readdatavalid),               //                         .readdatavalid
		.av_waitrequest        (sdram_controller_s1_translator_avalon_anti_slave_0_waitrequest),                 //                         .waitrequest
		.av_chipselect         (sdram_controller_s1_translator_avalon_anti_slave_0_chipselect),                  //                         .chipselect
		.av_begintransfer      (),                                                                               //              (terminated)
		.av_beginbursttransfer (),                                                                               //              (terminated)
		.av_burstcount         (),                                                                               //              (terminated)
		.av_writebyteenable    (),                                                                               //              (terminated)
		.av_lock               (),                                                                               //              (terminated)
		.av_clken              (),                                                                               //              (terminated)
		.uav_clken             (1'b0),                                                                           //              (terminated)
		.av_debugaccess        (),                                                                               //              (terminated)
		.av_outputenable       ()                                                                                //              (terminated)
	);

	altera_merlin_slave_translator #(
		.AV_ADDRESS_W                   (2),
		.AV_DATA_W                      (32),
		.UAV_DATA_W                     (32),
		.AV_BURSTCOUNT_W                (1),
		.AV_BYTEENABLE_W                (1),
		.UAV_BYTEENABLE_W               (4),
		.UAV_ADDRESS_W                  (25),
		.UAV_BURSTCOUNT_W               (3),
		.AV_READLATENCY                 (0),
		.USE_READDATAVALID              (0),
		.USE_WAITREQUEST                (0),
		.USE_UAV_CLKEN                  (0),
		.AV_SYMBOLS_PER_WORD            (4),
		.AV_ADDRESS_SYMBOLS             (0),
		.AV_BURSTCOUNT_SYMBOLS          (0),
		.AV_CONSTANT_BURST_BEHAVIOR     (0),
		.UAV_CONSTANT_BURST_BEHAVIOR    (0),
		.AV_REQUIRE_UNALIGNED_ADDRESSES (0),
		.CHIPSELECT_THROUGH_READLATENCY (0),
		.AV_READ_WAIT_CYCLES            (1),
		.AV_WRITE_WAIT_CYCLES           (0),
		.AV_SETUP_WAIT_CYCLES           (0),
		.AV_DATA_HOLD_CYCLES            (0)
	) leds_s1_translator (
		.clk                   (clk_clk),                                                            //                      clk.clk
		.reset                 (rst_controller_reset_out_reset),                                     //                    reset.reset
		.uav_address           (leds_s1_translator_avalon_universal_slave_0_agent_m0_address),       // avalon_universal_slave_0.address
		.uav_burstcount        (leds_s1_translator_avalon_universal_slave_0_agent_m0_burstcount),    //                         .burstcount
		.uav_read              (leds_s1_translator_avalon_universal_slave_0_agent_m0_read),          //                         .read
		.uav_write             (leds_s1_translator_avalon_universal_slave_0_agent_m0_write),         //                         .write
		.uav_waitrequest       (leds_s1_translator_avalon_universal_slave_0_agent_m0_waitrequest),   //                         .waitrequest
		.uav_readdatavalid     (leds_s1_translator_avalon_universal_slave_0_agent_m0_readdatavalid), //                         .readdatavalid
		.uav_byteenable        (leds_s1_translator_avalon_universal_slave_0_agent_m0_byteenable),    //                         .byteenable
		.uav_readdata          (leds_s1_translator_avalon_universal_slave_0_agent_m0_readdata),      //                         .readdata
		.uav_writedata         (leds_s1_translator_avalon_universal_slave_0_agent_m0_writedata),     //                         .writedata
		.uav_lock              (leds_s1_translator_avalon_universal_slave_0_agent_m0_lock),          //                         .lock
		.uav_debugaccess       (leds_s1_translator_avalon_universal_slave_0_agent_m0_debugaccess),   //                         .debugaccess
		.av_address            (leds_s1_translator_avalon_anti_slave_0_address),                     //      avalon_anti_slave_0.address
		.av_write              (leds_s1_translator_avalon_anti_slave_0_write),                       //                         .write
		.av_readdata           (leds_s1_translator_avalon_anti_slave_0_readdata),                    //                         .readdata
		.av_writedata          (leds_s1_translator_avalon_anti_slave_0_writedata),                   //                         .writedata
		.av_chipselect         (leds_s1_translator_avalon_anti_slave_0_chipselect),                  //                         .chipselect
		.av_read               (),                                                                   //              (terminated)
		.av_begintransfer      (),                                                                   //              (terminated)
		.av_beginbursttransfer (),                                                                   //              (terminated)
		.av_burstcount         (),                                                                   //              (terminated)
		.av_byteenable         (),                                                                   //              (terminated)
		.av_readdatavalid      (1'b0),                                                               //              (terminated)
		.av_waitrequest        (1'b0),                                                               //              (terminated)
		.av_writebyteenable    (),                                                                   //              (terminated)
		.av_lock               (),                                                                   //              (terminated)
		.av_clken              (),                                                                   //              (terminated)
		.uav_clken             (1'b0),                                                               //              (terminated)
		.av_debugaccess        (),                                                                   //              (terminated)
		.av_outputenable       ()                                                                    //              (terminated)
	);

	altera_merlin_slave_translator #(
		.AV_ADDRESS_W                   (2),
		.AV_DATA_W                      (32),
		.UAV_DATA_W                     (32),
		.AV_BURSTCOUNT_W                (1),
		.AV_BYTEENABLE_W                (1),
		.UAV_BYTEENABLE_W               (4),
		.UAV_ADDRESS_W                  (25),
		.UAV_BURSTCOUNT_W               (3),
		.AV_READLATENCY                 (0),
		.USE_READDATAVALID              (0),
		.USE_WAITREQUEST                (0),
		.USE_UAV_CLKEN                  (0),
		.AV_SYMBOLS_PER_WORD            (4),
		.AV_ADDRESS_SYMBOLS             (0),
		.AV_BURSTCOUNT_SYMBOLS          (0),
		.AV_CONSTANT_BURST_BEHAVIOR     (0),
		.UAV_CONSTANT_BURST_BEHAVIOR    (0),
		.AV_REQUIRE_UNALIGNED_ADDRESSES (0),
		.CHIPSELECT_THROUGH_READLATENCY (0),
		.AV_READ_WAIT_CYCLES            (1),
		.AV_WRITE_WAIT_CYCLES           (0),
		.AV_SETUP_WAIT_CYCLES           (0),
		.AV_DATA_HOLD_CYCLES            (0)
	) switches_s1_translator (
		.clk                   (clk_clk),                                                                //                      clk.clk
		.reset                 (rst_controller_reset_out_reset),                                         //                    reset.reset
		.uav_address           (switches_s1_translator_avalon_universal_slave_0_agent_m0_address),       // avalon_universal_slave_0.address
		.uav_burstcount        (switches_s1_translator_avalon_universal_slave_0_agent_m0_burstcount),    //                         .burstcount
		.uav_read              (switches_s1_translator_avalon_universal_slave_0_agent_m0_read),          //                         .read
		.uav_write             (switches_s1_translator_avalon_universal_slave_0_agent_m0_write),         //                         .write
		.uav_waitrequest       (switches_s1_translator_avalon_universal_slave_0_agent_m0_waitrequest),   //                         .waitrequest
		.uav_readdatavalid     (switches_s1_translator_avalon_universal_slave_0_agent_m0_readdatavalid), //                         .readdatavalid
		.uav_byteenable        (switches_s1_translator_avalon_universal_slave_0_agent_m0_byteenable),    //                         .byteenable
		.uav_readdata          (switches_s1_translator_avalon_universal_slave_0_agent_m0_readdata),      //                         .readdata
		.uav_writedata         (switches_s1_translator_avalon_universal_slave_0_agent_m0_writedata),     //                         .writedata
		.uav_lock              (switches_s1_translator_avalon_universal_slave_0_agent_m0_lock),          //                         .lock
		.uav_debugaccess       (switches_s1_translator_avalon_universal_slave_0_agent_m0_debugaccess),   //                         .debugaccess
		.av_address            (switches_s1_translator_avalon_anti_slave_0_address),                     //      avalon_anti_slave_0.address
		.av_readdata           (switches_s1_translator_avalon_anti_slave_0_readdata),                    //                         .readdata
		.av_write              (),                                                                       //              (terminated)
		.av_read               (),                                                                       //              (terminated)
		.av_writedata          (),                                                                       //              (terminated)
		.av_begintransfer      (),                                                                       //              (terminated)
		.av_beginbursttransfer (),                                                                       //              (terminated)
		.av_burstcount         (),                                                                       //              (terminated)
		.av_byteenable         (),                                                                       //              (terminated)
		.av_readdatavalid      (1'b0),                                                                   //              (terminated)
		.av_waitrequest        (1'b0),                                                                   //              (terminated)
		.av_writebyteenable    (),                                                                       //              (terminated)
		.av_lock               (),                                                                       //              (terminated)
		.av_chipselect         (),                                                                       //              (terminated)
		.av_clken              (),                                                                       //              (terminated)
		.uav_clken             (1'b0),                                                                   //              (terminated)
		.av_debugaccess        (),                                                                       //              (terminated)
		.av_outputenable       ()                                                                        //              (terminated)
	);

	altera_merlin_slave_translator #(
		.AV_ADDRESS_W                   (1),
		.AV_DATA_W                      (32),
		.UAV_DATA_W                     (32),
		.AV_BURSTCOUNT_W                (1),
		.AV_BYTEENABLE_W                (1),
		.UAV_BYTEENABLE_W               (4),
		.UAV_ADDRESS_W                  (25),
		.UAV_BURSTCOUNT_W               (3),
		.AV_READLATENCY                 (0),
		.USE_READDATAVALID              (0),
		.USE_WAITREQUEST                (1),
		.USE_UAV_CLKEN                  (0),
		.AV_SYMBOLS_PER_WORD            (4),
		.AV_ADDRESS_SYMBOLS             (0),
		.AV_BURSTCOUNT_SYMBOLS          (0),
		.AV_CONSTANT_BURST_BEHAVIOR     (0),
		.UAV_CONSTANT_BURST_BEHAVIOR    (0),
		.AV_REQUIRE_UNALIGNED_ADDRESSES (0),
		.CHIPSELECT_THROUGH_READLATENCY (0),
		.AV_READ_WAIT_CYCLES            (1),
		.AV_WRITE_WAIT_CYCLES           (0),
		.AV_SETUP_WAIT_CYCLES           (0),
		.AV_DATA_HOLD_CYCLES            (0)
	) jtag_uart_0_avalon_jtag_slave_translator (
		.clk                   (clk_clk),                                                                                  //                      clk.clk
		.reset                 (rst_controller_reset_out_reset),                                                           //                    reset.reset
		.uav_address           (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_address),       // avalon_universal_slave_0.address
		.uav_burstcount        (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_burstcount),    //                         .burstcount
		.uav_read              (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_read),          //                         .read
		.uav_write             (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_write),         //                         .write
		.uav_waitrequest       (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_waitrequest),   //                         .waitrequest
		.uav_readdatavalid     (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_readdatavalid), //                         .readdatavalid
		.uav_byteenable        (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_byteenable),    //                         .byteenable
		.uav_readdata          (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_readdata),      //                         .readdata
		.uav_writedata         (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_writedata),     //                         .writedata
		.uav_lock              (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_lock),          //                         .lock
		.uav_debugaccess       (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_debugaccess),   //                         .debugaccess
		.av_address            (jtag_uart_0_avalon_jtag_slave_translator_avalon_anti_slave_0_address),                     //      avalon_anti_slave_0.address
		.av_write              (jtag_uart_0_avalon_jtag_slave_translator_avalon_anti_slave_0_write),                       //                         .write
		.av_read               (jtag_uart_0_avalon_jtag_slave_translator_avalon_anti_slave_0_read),                        //                         .read
		.av_readdata           (jtag_uart_0_avalon_jtag_slave_translator_avalon_anti_slave_0_readdata),                    //                         .readdata
		.av_writedata          (jtag_uart_0_avalon_jtag_slave_translator_avalon_anti_slave_0_writedata),                   //                         .writedata
		.av_waitrequest        (jtag_uart_0_avalon_jtag_slave_translator_avalon_anti_slave_0_waitrequest),                 //                         .waitrequest
		.av_chipselect         (jtag_uart_0_avalon_jtag_slave_translator_avalon_anti_slave_0_chipselect),                  //                         .chipselect
		.av_begintransfer      (),                                                                                         //              (terminated)
		.av_beginbursttransfer (),                                                                                         //              (terminated)
		.av_burstcount         (),                                                                                         //              (terminated)
		.av_byteenable         (),                                                                                         //              (terminated)
		.av_readdatavalid      (1'b0),                                                                                     //              (terminated)
		.av_writebyteenable    (),                                                                                         //              (terminated)
		.av_lock               (),                                                                                         //              (terminated)
		.av_clken              (),                                                                                         //              (terminated)
		.uav_clken             (1'b0),                                                                                     //              (terminated)
		.av_debugaccess        (),                                                                                         //              (terminated)
		.av_outputenable       ()                                                                                          //              (terminated)
	);

	altera_merlin_slave_translator #(
		.AV_ADDRESS_W                   (2),
		.AV_DATA_W                      (8),
		.UAV_DATA_W                     (32),
		.AV_BURSTCOUNT_W                (1),
		.AV_BYTEENABLE_W                (1),
		.UAV_BYTEENABLE_W               (4),
		.UAV_ADDRESS_W                  (25),
		.UAV_BURSTCOUNT_W               (3),
		.AV_READLATENCY                 (0),
		.USE_READDATAVALID              (0),
		.USE_WAITREQUEST                (0),
		.USE_UAV_CLKEN                  (0),
		.AV_SYMBOLS_PER_WORD            (4),
		.AV_ADDRESS_SYMBOLS             (0),
		.AV_BURSTCOUNT_SYMBOLS          (0),
		.AV_CONSTANT_BURST_BEHAVIOR     (0),
		.UAV_CONSTANT_BURST_BEHAVIOR    (0),
		.AV_REQUIRE_UNALIGNED_ADDRESSES (0),
		.CHIPSELECT_THROUGH_READLATENCY (0),
		.AV_READ_WAIT_CYCLES            (13),
		.AV_WRITE_WAIT_CYCLES           (13),
		.AV_SETUP_WAIT_CYCLES           (13),
		.AV_DATA_HOLD_CYCLES            (13)
	) lcd_0_control_slave_translator (
		.clk                   (clk_clk),                                                                        //                      clk.clk
		.reset                 (rst_controller_reset_out_reset),                                                 //                    reset.reset
		.uav_address           (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_address),       // avalon_universal_slave_0.address
		.uav_burstcount        (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_burstcount),    //                         .burstcount
		.uav_read              (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_read),          //                         .read
		.uav_write             (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_write),         //                         .write
		.uav_waitrequest       (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_waitrequest),   //                         .waitrequest
		.uav_readdatavalid     (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_readdatavalid), //                         .readdatavalid
		.uav_byteenable        (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_byteenable),    //                         .byteenable
		.uav_readdata          (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_readdata),      //                         .readdata
		.uav_writedata         (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_writedata),     //                         .writedata
		.uav_lock              (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_lock),          //                         .lock
		.uav_debugaccess       (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_debugaccess),   //                         .debugaccess
		.av_address            (lcd_0_control_slave_translator_avalon_anti_slave_0_address),                     //      avalon_anti_slave_0.address
		.av_write              (lcd_0_control_slave_translator_avalon_anti_slave_0_write),                       //                         .write
		.av_read               (lcd_0_control_slave_translator_avalon_anti_slave_0_read),                        //                         .read
		.av_readdata           (lcd_0_control_slave_translator_avalon_anti_slave_0_readdata),                    //                         .readdata
		.av_writedata          (lcd_0_control_slave_translator_avalon_anti_slave_0_writedata),                   //                         .writedata
		.av_begintransfer      (lcd_0_control_slave_translator_avalon_anti_slave_0_begintransfer),               //                         .begintransfer
		.av_beginbursttransfer (),                                                                               //              (terminated)
		.av_burstcount         (),                                                                               //              (terminated)
		.av_byteenable         (),                                                                               //              (terminated)
		.av_readdatavalid      (1'b0),                                                                           //              (terminated)
		.av_waitrequest        (1'b0),                                                                           //              (terminated)
		.av_writebyteenable    (),                                                                               //              (terminated)
		.av_lock               (),                                                                               //              (terminated)
		.av_chipselect         (),                                                                               //              (terminated)
		.av_clken              (),                                                                               //              (terminated)
		.uav_clken             (1'b0),                                                                           //              (terminated)
		.av_debugaccess        (),                                                                               //              (terminated)
		.av_outputenable       ()                                                                                //              (terminated)
	);

	altera_merlin_slave_translator #(
		.AV_ADDRESS_W                   (3),
		.AV_DATA_W                      (16),
		.UAV_DATA_W                     (32),
		.AV_BURSTCOUNT_W                (1),
		.AV_BYTEENABLE_W                (1),
		.UAV_BYTEENABLE_W               (4),
		.UAV_ADDRESS_W                  (25),
		.UAV_BURSTCOUNT_W               (3),
		.AV_READLATENCY                 (0),
		.USE_READDATAVALID              (0),
		.USE_WAITREQUEST                (0),
		.USE_UAV_CLKEN                  (0),
		.AV_SYMBOLS_PER_WORD            (4),
		.AV_ADDRESS_SYMBOLS             (0),
		.AV_BURSTCOUNT_SYMBOLS          (0),
		.AV_CONSTANT_BURST_BEHAVIOR     (0),
		.UAV_CONSTANT_BURST_BEHAVIOR    (0),
		.AV_REQUIRE_UNALIGNED_ADDRESSES (0),
		.CHIPSELECT_THROUGH_READLATENCY (0),
		.AV_READ_WAIT_CYCLES            (1),
		.AV_WRITE_WAIT_CYCLES           (1),
		.AV_SETUP_WAIT_CYCLES           (0),
		.AV_DATA_HOLD_CYCLES            (0)
	) uart_rs232_s1_translator (
		.clk                   (clk_clk),                                                                  //                      clk.clk
		.reset                 (rst_controller_reset_out_reset),                                           //                    reset.reset
		.uav_address           (uart_rs232_s1_translator_avalon_universal_slave_0_agent_m0_address),       // avalon_universal_slave_0.address
		.uav_burstcount        (uart_rs232_s1_translator_avalon_universal_slave_0_agent_m0_burstcount),    //                         .burstcount
		.uav_read              (uart_rs232_s1_translator_avalon_universal_slave_0_agent_m0_read),          //                         .read
		.uav_write             (uart_rs232_s1_translator_avalon_universal_slave_0_agent_m0_write),         //                         .write
		.uav_waitrequest       (uart_rs232_s1_translator_avalon_universal_slave_0_agent_m0_waitrequest),   //                         .waitrequest
		.uav_readdatavalid     (uart_rs232_s1_translator_avalon_universal_slave_0_agent_m0_readdatavalid), //                         .readdatavalid
		.uav_byteenable        (uart_rs232_s1_translator_avalon_universal_slave_0_agent_m0_byteenable),    //                         .byteenable
		.uav_readdata          (uart_rs232_s1_translator_avalon_universal_slave_0_agent_m0_readdata),      //                         .readdata
		.uav_writedata         (uart_rs232_s1_translator_avalon_universal_slave_0_agent_m0_writedata),     //                         .writedata
		.uav_lock              (uart_rs232_s1_translator_avalon_universal_slave_0_agent_m0_lock),          //                         .lock
		.uav_debugaccess       (uart_rs232_s1_translator_avalon_universal_slave_0_agent_m0_debugaccess),   //                         .debugaccess
		.av_address            (uart_rs232_s1_translator_avalon_anti_slave_0_address),                     //      avalon_anti_slave_0.address
		.av_write              (uart_rs232_s1_translator_avalon_anti_slave_0_write),                       //                         .write
		.av_read               (uart_rs232_s1_translator_avalon_anti_slave_0_read),                        //                         .read
		.av_readdata           (uart_rs232_s1_translator_avalon_anti_slave_0_readdata),                    //                         .readdata
		.av_writedata          (uart_rs232_s1_translator_avalon_anti_slave_0_writedata),                   //                         .writedata
		.av_begintransfer      (uart_rs232_s1_translator_avalon_anti_slave_0_begintransfer),               //                         .begintransfer
		.av_chipselect         (uart_rs232_s1_translator_avalon_anti_slave_0_chipselect),                  //                         .chipselect
		.av_beginbursttransfer (),                                                                         //              (terminated)
		.av_burstcount         (),                                                                         //              (terminated)
		.av_byteenable         (),                                                                         //              (terminated)
		.av_readdatavalid      (1'b0),                                                                     //              (terminated)
		.av_waitrequest        (1'b0),                                                                     //              (terminated)
		.av_writebyteenable    (),                                                                         //              (terminated)
		.av_lock               (),                                                                         //              (terminated)
		.av_clken              (),                                                                         //              (terminated)
		.uav_clken             (1'b0),                                                                     //              (terminated)
		.av_debugaccess        (),                                                                         //              (terminated)
		.av_outputenable       ()                                                                          //              (terminated)
	);

	altera_merlin_slave_translator #(
		.AV_ADDRESS_W                   (3),
		.AV_DATA_W                      (16),
		.UAV_DATA_W                     (32),
		.AV_BURSTCOUNT_W                (1),
		.AV_BYTEENABLE_W                (1),
		.UAV_BYTEENABLE_W               (4),
		.UAV_ADDRESS_W                  (25),
		.UAV_BURSTCOUNT_W               (3),
		.AV_READLATENCY                 (0),
		.USE_READDATAVALID              (0),
		.USE_WAITREQUEST                (0),
		.USE_UAV_CLKEN                  (0),
		.AV_SYMBOLS_PER_WORD            (4),
		.AV_ADDRESS_SYMBOLS             (0),
		.AV_BURSTCOUNT_SYMBOLS          (0),
		.AV_CONSTANT_BURST_BEHAVIOR     (0),
		.UAV_CONSTANT_BURST_BEHAVIOR    (0),
		.AV_REQUIRE_UNALIGNED_ADDRESSES (0),
		.CHIPSELECT_THROUGH_READLATENCY (0),
		.AV_READ_WAIT_CYCLES            (1),
		.AV_WRITE_WAIT_CYCLES           (0),
		.AV_SETUP_WAIT_CYCLES           (0),
		.AV_DATA_HOLD_CYCLES            (0)
	) timer_0_s1_translator (
		.clk                   (clk_clk),                                                               //                      clk.clk
		.reset                 (rst_controller_reset_out_reset),                                        //                    reset.reset
		.uav_address           (timer_0_s1_translator_avalon_universal_slave_0_agent_m0_address),       // avalon_universal_slave_0.address
		.uav_burstcount        (timer_0_s1_translator_avalon_universal_slave_0_agent_m0_burstcount),    //                         .burstcount
		.uav_read              (timer_0_s1_translator_avalon_universal_slave_0_agent_m0_read),          //                         .read
		.uav_write             (timer_0_s1_translator_avalon_universal_slave_0_agent_m0_write),         //                         .write
		.uav_waitrequest       (timer_0_s1_translator_avalon_universal_slave_0_agent_m0_waitrequest),   //                         .waitrequest
		.uav_readdatavalid     (timer_0_s1_translator_avalon_universal_slave_0_agent_m0_readdatavalid), //                         .readdatavalid
		.uav_byteenable        (timer_0_s1_translator_avalon_universal_slave_0_agent_m0_byteenable),    //                         .byteenable
		.uav_readdata          (timer_0_s1_translator_avalon_universal_slave_0_agent_m0_readdata),      //                         .readdata
		.uav_writedata         (timer_0_s1_translator_avalon_universal_slave_0_agent_m0_writedata),     //                         .writedata
		.uav_lock              (timer_0_s1_translator_avalon_universal_slave_0_agent_m0_lock),          //                         .lock
		.uav_debugaccess       (timer_0_s1_translator_avalon_universal_slave_0_agent_m0_debugaccess),   //                         .debugaccess
		.av_address            (timer_0_s1_translator_avalon_anti_slave_0_address),                     //      avalon_anti_slave_0.address
		.av_write              (timer_0_s1_translator_avalon_anti_slave_0_write),                       //                         .write
		.av_readdata           (timer_0_s1_translator_avalon_anti_slave_0_readdata),                    //                         .readdata
		.av_writedata          (timer_0_s1_translator_avalon_anti_slave_0_writedata),                   //                         .writedata
		.av_chipselect         (timer_0_s1_translator_avalon_anti_slave_0_chipselect),                  //                         .chipselect
		.av_read               (),                                                                      //              (terminated)
		.av_begintransfer      (),                                                                      //              (terminated)
		.av_beginbursttransfer (),                                                                      //              (terminated)
		.av_burstcount         (),                                                                      //              (terminated)
		.av_byteenable         (),                                                                      //              (terminated)
		.av_readdatavalid      (1'b0),                                                                  //              (terminated)
		.av_waitrequest        (1'b0),                                                                  //              (terminated)
		.av_writebyteenable    (),                                                                      //              (terminated)
		.av_lock               (),                                                                      //              (terminated)
		.av_clken              (),                                                                      //              (terminated)
		.uav_clken             (1'b0),                                                                  //              (terminated)
		.av_debugaccess        (),                                                                      //              (terminated)
		.av_outputenable       ()                                                                       //              (terminated)
	);

	altera_merlin_slave_translator #(
		.AV_ADDRESS_W                   (2),
		.AV_DATA_W                      (32),
		.UAV_DATA_W                     (32),
		.AV_BURSTCOUNT_W                (1),
		.AV_BYTEENABLE_W                (4),
		.UAV_BYTEENABLE_W               (4),
		.UAV_ADDRESS_W                  (25),
		.UAV_BURSTCOUNT_W               (3),
		.AV_READLATENCY                 (0),
		.USE_READDATAVALID              (0),
		.USE_WAITREQUEST                (0),
		.USE_UAV_CLKEN                  (0),
		.AV_SYMBOLS_PER_WORD            (4),
		.AV_ADDRESS_SYMBOLS             (0),
		.AV_BURSTCOUNT_SYMBOLS          (0),
		.AV_CONSTANT_BURST_BEHAVIOR     (0),
		.UAV_CONSTANT_BURST_BEHAVIOR    (0),
		.AV_REQUIRE_UNALIGNED_ADDRESSES (0),
		.CHIPSELECT_THROUGH_READLATENCY (0),
		.AV_READ_WAIT_CYCLES            (1),
		.AV_WRITE_WAIT_CYCLES           (0),
		.AV_SETUP_WAIT_CYCLES           (0),
		.AV_DATA_HOLD_CYCLES            (0)
	) calibrate_avalon_0_s1_translator (
		.clk                   (clk_clk),                                                                          //                      clk.clk
		.reset                 (rst_controller_reset_out_reset),                                                   //                    reset.reset
		.uav_address           (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_m0_address),       // avalon_universal_slave_0.address
		.uav_burstcount        (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_m0_burstcount),    //                         .burstcount
		.uav_read              (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_m0_read),          //                         .read
		.uav_write             (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_m0_write),         //                         .write
		.uav_waitrequest       (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_m0_waitrequest),   //                         .waitrequest
		.uav_readdatavalid     (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_m0_readdatavalid), //                         .readdatavalid
		.uav_byteenable        (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_m0_byteenable),    //                         .byteenable
		.uav_readdata          (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_m0_readdata),      //                         .readdata
		.uav_writedata         (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_m0_writedata),     //                         .writedata
		.uav_lock              (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_m0_lock),          //                         .lock
		.uav_debugaccess       (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_m0_debugaccess),   //                         .debugaccess
		.av_address            (calibrate_avalon_0_s1_translator_avalon_anti_slave_0_address),                     //      avalon_anti_slave_0.address
		.av_write              (calibrate_avalon_0_s1_translator_avalon_anti_slave_0_write),                       //                         .write
		.av_read               (calibrate_avalon_0_s1_translator_avalon_anti_slave_0_read),                        //                         .read
		.av_readdata           (calibrate_avalon_0_s1_translator_avalon_anti_slave_0_readdata),                    //                         .readdata
		.av_writedata          (calibrate_avalon_0_s1_translator_avalon_anti_slave_0_writedata),                   //                         .writedata
		.av_begintransfer      (),                                                                                 //              (terminated)
		.av_beginbursttransfer (),                                                                                 //              (terminated)
		.av_burstcount         (),                                                                                 //              (terminated)
		.av_byteenable         (),                                                                                 //              (terminated)
		.av_readdatavalid      (1'b0),                                                                             //              (terminated)
		.av_waitrequest        (1'b0),                                                                             //              (terminated)
		.av_writebyteenable    (),                                                                                 //              (terminated)
		.av_lock               (),                                                                                 //              (terminated)
		.av_chipselect         (),                                                                                 //              (terminated)
		.av_clken              (),                                                                                 //              (terminated)
		.uav_clken             (1'b0),                                                                             //              (terminated)
		.av_debugaccess        (),                                                                                 //              (terminated)
		.av_outputenable       ()                                                                                  //              (terminated)
	);

	altera_merlin_master_agent #(
		.PKT_PROTECTION_H          (81),
		.PKT_PROTECTION_L          (81),
		.PKT_BEGIN_BURST           (72),
		.PKT_BURSTWRAP_H           (71),
		.PKT_BURSTWRAP_L           (69),
		.PKT_BYTE_CNT_H            (68),
		.PKT_BYTE_CNT_L            (66),
		.PKT_ADDR_H                (60),
		.PKT_ADDR_L                (36),
		.PKT_TRANS_COMPRESSED_READ (61),
		.PKT_TRANS_POSTED          (62),
		.PKT_TRANS_WRITE           (63),
		.PKT_TRANS_READ            (64),
		.PKT_TRANS_LOCK            (65),
		.PKT_DATA_H                (31),
		.PKT_DATA_L                (0),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32),
		.PKT_SRC_ID_H              (76),
		.PKT_SRC_ID_L              (73),
		.PKT_DEST_ID_H             (80),
		.PKT_DEST_ID_L             (77),
		.ST_DATA_W                 (82),
		.ST_CHANNEL_W              (9),
		.AV_BURSTCOUNT_W           (3),
		.SUPPRESS_0_BYTEEN_RSP     (0),
		.ID                        (1),
		.BURSTWRAP_VALUE           (3)
	) cpu_nios_instruction_master_translator_avalon_universal_master_0_agent (
		.clk              (clk_clk),                                                                                 //       clk.clk
		.reset            (rst_controller_reset_out_reset),                                                          // clk_reset.reset
		.av_address       (cpu_nios_instruction_master_translator_avalon_universal_master_0_address),                //        av.address
		.av_write         (cpu_nios_instruction_master_translator_avalon_universal_master_0_write),                  //          .write
		.av_read          (cpu_nios_instruction_master_translator_avalon_universal_master_0_read),                   //          .read
		.av_writedata     (cpu_nios_instruction_master_translator_avalon_universal_master_0_writedata),              //          .writedata
		.av_readdata      (cpu_nios_instruction_master_translator_avalon_universal_master_0_readdata),               //          .readdata
		.av_waitrequest   (cpu_nios_instruction_master_translator_avalon_universal_master_0_waitrequest),            //          .waitrequest
		.av_readdatavalid (cpu_nios_instruction_master_translator_avalon_universal_master_0_readdatavalid),          //          .readdatavalid
		.av_byteenable    (cpu_nios_instruction_master_translator_avalon_universal_master_0_byteenable),             //          .byteenable
		.av_burstcount    (cpu_nios_instruction_master_translator_avalon_universal_master_0_burstcount),             //          .burstcount
		.av_debugaccess   (cpu_nios_instruction_master_translator_avalon_universal_master_0_debugaccess),            //          .debugaccess
		.av_lock          (cpu_nios_instruction_master_translator_avalon_universal_master_0_lock),                   //          .lock
		.cp_valid         (cpu_nios_instruction_master_translator_avalon_universal_master_0_agent_cp_valid),         //        cp.valid
		.cp_data          (cpu_nios_instruction_master_translator_avalon_universal_master_0_agent_cp_data),          //          .data
		.cp_startofpacket (cpu_nios_instruction_master_translator_avalon_universal_master_0_agent_cp_startofpacket), //          .startofpacket
		.cp_endofpacket   (cpu_nios_instruction_master_translator_avalon_universal_master_0_agent_cp_endofpacket),   //          .endofpacket
		.cp_ready         (cpu_nios_instruction_master_translator_avalon_universal_master_0_agent_cp_ready),         //          .ready
		.rp_valid         (limiter_rsp_src_valid),                                                                   //        rp.valid
		.rp_data          (limiter_rsp_src_data),                                                                    //          .data
		.rp_channel       (limiter_rsp_src_channel),                                                                 //          .channel
		.rp_startofpacket (limiter_rsp_src_startofpacket),                                                           //          .startofpacket
		.rp_endofpacket   (limiter_rsp_src_endofpacket),                                                             //          .endofpacket
		.rp_ready         (limiter_rsp_src_ready)                                                                    //          .ready
	);

	altera_merlin_master_agent #(
		.PKT_PROTECTION_H          (81),
		.PKT_PROTECTION_L          (81),
		.PKT_BEGIN_BURST           (72),
		.PKT_BURSTWRAP_H           (71),
		.PKT_BURSTWRAP_L           (69),
		.PKT_BYTE_CNT_H            (68),
		.PKT_BYTE_CNT_L            (66),
		.PKT_ADDR_H                (60),
		.PKT_ADDR_L                (36),
		.PKT_TRANS_COMPRESSED_READ (61),
		.PKT_TRANS_POSTED          (62),
		.PKT_TRANS_WRITE           (63),
		.PKT_TRANS_READ            (64),
		.PKT_TRANS_LOCK            (65),
		.PKT_DATA_H                (31),
		.PKT_DATA_L                (0),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32),
		.PKT_SRC_ID_H              (76),
		.PKT_SRC_ID_L              (73),
		.PKT_DEST_ID_H             (80),
		.PKT_DEST_ID_L             (77),
		.ST_DATA_W                 (82),
		.ST_CHANNEL_W              (9),
		.AV_BURSTCOUNT_W           (3),
		.SUPPRESS_0_BYTEEN_RSP     (0),
		.ID                        (2),
		.BURSTWRAP_VALUE           (7)
	) cpu_nios_data_master_translator_avalon_universal_master_0_agent (
		.clk              (clk_clk),                                                                          //       clk.clk
		.reset            (rst_controller_reset_out_reset),                                                   // clk_reset.reset
		.av_address       (cpu_nios_data_master_translator_avalon_universal_master_0_address),                //        av.address
		.av_write         (cpu_nios_data_master_translator_avalon_universal_master_0_write),                  //          .write
		.av_read          (cpu_nios_data_master_translator_avalon_universal_master_0_read),                   //          .read
		.av_writedata     (cpu_nios_data_master_translator_avalon_universal_master_0_writedata),              //          .writedata
		.av_readdata      (cpu_nios_data_master_translator_avalon_universal_master_0_readdata),               //          .readdata
		.av_waitrequest   (cpu_nios_data_master_translator_avalon_universal_master_0_waitrequest),            //          .waitrequest
		.av_readdatavalid (cpu_nios_data_master_translator_avalon_universal_master_0_readdatavalid),          //          .readdatavalid
		.av_byteenable    (cpu_nios_data_master_translator_avalon_universal_master_0_byteenable),             //          .byteenable
		.av_burstcount    (cpu_nios_data_master_translator_avalon_universal_master_0_burstcount),             //          .burstcount
		.av_debugaccess   (cpu_nios_data_master_translator_avalon_universal_master_0_debugaccess),            //          .debugaccess
		.av_lock          (cpu_nios_data_master_translator_avalon_universal_master_0_lock),                   //          .lock
		.cp_valid         (cpu_nios_data_master_translator_avalon_universal_master_0_agent_cp_valid),         //        cp.valid
		.cp_data          (cpu_nios_data_master_translator_avalon_universal_master_0_agent_cp_data),          //          .data
		.cp_startofpacket (cpu_nios_data_master_translator_avalon_universal_master_0_agent_cp_startofpacket), //          .startofpacket
		.cp_endofpacket   (cpu_nios_data_master_translator_avalon_universal_master_0_agent_cp_endofpacket),   //          .endofpacket
		.cp_ready         (cpu_nios_data_master_translator_avalon_universal_master_0_agent_cp_ready),         //          .ready
		.rp_valid         (limiter_001_rsp_src_valid),                                                        //        rp.valid
		.rp_data          (limiter_001_rsp_src_data),                                                         //          .data
		.rp_channel       (limiter_001_rsp_src_channel),                                                      //          .channel
		.rp_startofpacket (limiter_001_rsp_src_startofpacket),                                                //          .startofpacket
		.rp_endofpacket   (limiter_001_rsp_src_endofpacket),                                                  //          .endofpacket
		.rp_ready         (limiter_001_rsp_src_ready)                                                         //          .ready
	);

	altera_merlin_slave_agent #(
		.PKT_DATA_H                (31),
		.PKT_DATA_L                (0),
		.PKT_BEGIN_BURST           (72),
		.PKT_SYMBOL_W              (8),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32),
		.PKT_ADDR_H                (60),
		.PKT_ADDR_L                (36),
		.PKT_TRANS_COMPRESSED_READ (61),
		.PKT_TRANS_POSTED          (62),
		.PKT_TRANS_WRITE           (63),
		.PKT_TRANS_READ            (64),
		.PKT_TRANS_LOCK            (65),
		.PKT_SRC_ID_H              (76),
		.PKT_SRC_ID_L              (73),
		.PKT_DEST_ID_H             (80),
		.PKT_DEST_ID_L             (77),
		.PKT_BURSTWRAP_H           (71),
		.PKT_BURSTWRAP_L           (69),
		.PKT_BYTE_CNT_H            (68),
		.PKT_BYTE_CNT_L            (66),
		.PKT_PROTECTION_H          (81),
		.PKT_PROTECTION_L          (81),
		.ST_CHANNEL_W              (9),
		.ST_DATA_W                 (82),
		.AVS_BURSTCOUNT_W          (3),
		.SUPPRESS_0_BYTEEN_CMD     (0),
		.PREVENT_FIFO_OVERFLOW     (1)
	) cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent (
		.clk                     (clk_clk),                                                                                         //             clk.clk
		.reset                   (rst_controller_reset_out_reset),                                                                  //       clk_reset.reset
		.m0_address              (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_address),                 //              m0.address
		.m0_burstcount           (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_burstcount),              //                .burstcount
		.m0_byteenable           (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_byteenable),              //                .byteenable
		.m0_debugaccess          (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_debugaccess),             //                .debugaccess
		.m0_lock                 (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_lock),                    //                .lock
		.m0_readdata             (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_readdata),                //                .readdata
		.m0_readdatavalid        (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_readdatavalid),           //                .readdatavalid
		.m0_read                 (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_read),                    //                .read
		.m0_waitrequest          (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_waitrequest),             //                .waitrequest
		.m0_writedata            (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_writedata),               //                .writedata
		.m0_write                (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_write),                   //                .write
		.rp_endofpacket          (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_endofpacket),             //              rp.endofpacket
		.rp_ready                (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_ready),                   //                .ready
		.rp_valid                (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_valid),                   //                .valid
		.rp_data                 (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_data),                    //                .data
		.rp_startofpacket        (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_startofpacket),           //                .startofpacket
		.cp_ready                (cmd_xbar_mux_src_ready),                                                                          //              cp.ready
		.cp_valid                (cmd_xbar_mux_src_valid),                                                                          //                .valid
		.cp_data                 (cmd_xbar_mux_src_data),                                                                           //                .data
		.cp_startofpacket        (cmd_xbar_mux_src_startofpacket),                                                                  //                .startofpacket
		.cp_endofpacket          (cmd_xbar_mux_src_endofpacket),                                                                    //                .endofpacket
		.cp_channel              (cmd_xbar_mux_src_channel),                                                                        //                .channel
		.rf_sink_ready           (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //         rf_sink.ready
		.rf_sink_valid           (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //                .valid
		.rf_sink_startofpacket   (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //                .startofpacket
		.rf_sink_endofpacket     (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //                .endofpacket
		.rf_sink_data            (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //                .data
		.rf_source_ready         (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_ready),            //       rf_source.ready
		.rf_source_valid         (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_valid),            //                .valid
		.rf_source_startofpacket (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //                .startofpacket
		.rf_source_endofpacket   (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //                .endofpacket
		.rf_source_data          (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_data),             //                .data
		.rdata_fifo_sink_ready   (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       // rdata_fifo_sink.ready
		.rdata_fifo_sink_valid   (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_sink_data    (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data),        //                .data
		.rdata_fifo_src_ready    (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       //  rdata_fifo_src.ready
		.rdata_fifo_src_valid    (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_src_data     (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data)         //                .data
	);

	altera_avalon_sc_fifo #(
		.SYMBOLS_PER_BEAT    (1),
		.BITS_PER_SYMBOL     (83),
		.FIFO_DEPTH          (2),
		.CHANNEL_WIDTH       (0),
		.ERROR_WIDTH         (0),
		.USE_PACKETS         (1),
		.USE_FILL_LEVEL      (0),
		.EMPTY_LATENCY       (1),
		.USE_MEMORY_BLOCKS   (0),
		.USE_STORE_FORWARD   (0),
		.USE_ALMOST_FULL_IF  (0),
		.USE_ALMOST_EMPTY_IF (0)
	) cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo (
		.clk               (clk_clk),                                                                                         //       clk.clk
		.reset             (rst_controller_reset_out_reset),                                                                  // clk_reset.reset
		.in_data           (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_data),             //        in.data
		.in_valid          (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_valid),            //          .valid
		.in_ready          (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_ready),            //          .ready
		.in_startofpacket  (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //          .startofpacket
		.in_endofpacket    (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //          .endofpacket
		.out_data          (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //       out.data
		.out_valid         (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //          .valid
		.out_ready         (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //          .ready
		.out_startofpacket (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //          .startofpacket
		.out_endofpacket   (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //          .endofpacket
		.csr_address       (2'b00),                                                                                           // (terminated)
		.csr_read          (1'b0),                                                                                            // (terminated)
		.csr_write         (1'b0),                                                                                            // (terminated)
		.csr_readdata      (),                                                                                                // (terminated)
		.csr_writedata     (32'b00000000000000000000000000000000),                                                            // (terminated)
		.almost_full_data  (),                                                                                                // (terminated)
		.almost_empty_data (),                                                                                                // (terminated)
		.in_empty          (1'b0),                                                                                            // (terminated)
		.out_empty         (),                                                                                                // (terminated)
		.in_error          (1'b0),                                                                                            // (terminated)
		.out_error         (),                                                                                                // (terminated)
		.in_channel        (1'b0),                                                                                            // (terminated)
		.out_channel       ()                                                                                                 // (terminated)
	);

	altera_merlin_slave_agent #(
		.PKT_DATA_H                (15),
		.PKT_DATA_L                (0),
		.PKT_BEGIN_BURST           (54),
		.PKT_SYMBOL_W              (8),
		.PKT_BYTEEN_H              (17),
		.PKT_BYTEEN_L              (16),
		.PKT_ADDR_H                (42),
		.PKT_ADDR_L                (18),
		.PKT_TRANS_COMPRESSED_READ (43),
		.PKT_TRANS_POSTED          (44),
		.PKT_TRANS_WRITE           (45),
		.PKT_TRANS_READ            (46),
		.PKT_TRANS_LOCK            (47),
		.PKT_SRC_ID_H              (58),
		.PKT_SRC_ID_L              (55),
		.PKT_DEST_ID_H             (62),
		.PKT_DEST_ID_L             (59),
		.PKT_BURSTWRAP_H           (53),
		.PKT_BURSTWRAP_L           (51),
		.PKT_BYTE_CNT_H            (50),
		.PKT_BYTE_CNT_L            (48),
		.PKT_PROTECTION_H          (63),
		.PKT_PROTECTION_L          (63),
		.ST_CHANNEL_W              (9),
		.ST_DATA_W                 (64),
		.AVS_BURSTCOUNT_W          (2),
		.SUPPRESS_0_BYTEEN_CMD     (1),
		.PREVENT_FIFO_OVERFLOW     (1)
	) sdram_controller_s1_translator_avalon_universal_slave_0_agent (
		.clk                     (clk_clk),                                                                                  //             clk.clk
		.reset                   (rst_controller_reset_out_reset),                                                           //       clk_reset.reset
		.m0_address              (sdram_controller_s1_translator_avalon_universal_slave_0_agent_m0_address),                 //              m0.address
		.m0_burstcount           (sdram_controller_s1_translator_avalon_universal_slave_0_agent_m0_burstcount),              //                .burstcount
		.m0_byteenable           (sdram_controller_s1_translator_avalon_universal_slave_0_agent_m0_byteenable),              //                .byteenable
		.m0_debugaccess          (sdram_controller_s1_translator_avalon_universal_slave_0_agent_m0_debugaccess),             //                .debugaccess
		.m0_lock                 (sdram_controller_s1_translator_avalon_universal_slave_0_agent_m0_lock),                    //                .lock
		.m0_readdata             (sdram_controller_s1_translator_avalon_universal_slave_0_agent_m0_readdata),                //                .readdata
		.m0_readdatavalid        (sdram_controller_s1_translator_avalon_universal_slave_0_agent_m0_readdatavalid),           //                .readdatavalid
		.m0_read                 (sdram_controller_s1_translator_avalon_universal_slave_0_agent_m0_read),                    //                .read
		.m0_waitrequest          (sdram_controller_s1_translator_avalon_universal_slave_0_agent_m0_waitrequest),             //                .waitrequest
		.m0_writedata            (sdram_controller_s1_translator_avalon_universal_slave_0_agent_m0_writedata),               //                .writedata
		.m0_write                (sdram_controller_s1_translator_avalon_universal_slave_0_agent_m0_write),                   //                .write
		.rp_endofpacket          (sdram_controller_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket),             //              rp.endofpacket
		.rp_ready                (sdram_controller_s1_translator_avalon_universal_slave_0_agent_rp_ready),                   //                .ready
		.rp_valid                (sdram_controller_s1_translator_avalon_universal_slave_0_agent_rp_valid),                   //                .valid
		.rp_data                 (sdram_controller_s1_translator_avalon_universal_slave_0_agent_rp_data),                    //                .data
		.rp_startofpacket        (sdram_controller_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket),           //                .startofpacket
		.cp_ready                (burst_adapter_source0_ready),                                                              //              cp.ready
		.cp_valid                (burst_adapter_source0_valid),                                                              //                .valid
		.cp_data                 (burst_adapter_source0_data),                                                               //                .data
		.cp_startofpacket        (burst_adapter_source0_startofpacket),                                                      //                .startofpacket
		.cp_endofpacket          (burst_adapter_source0_endofpacket),                                                        //                .endofpacket
		.cp_channel              (burst_adapter_source0_channel),                                                            //                .channel
		.rf_sink_ready           (sdram_controller_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //         rf_sink.ready
		.rf_sink_valid           (sdram_controller_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //                .valid
		.rf_sink_startofpacket   (sdram_controller_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //                .startofpacket
		.rf_sink_endofpacket     (sdram_controller_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //                .endofpacket
		.rf_sink_data            (sdram_controller_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //                .data
		.rf_source_ready         (sdram_controller_s1_translator_avalon_universal_slave_0_agent_rf_source_ready),            //       rf_source.ready
		.rf_source_valid         (sdram_controller_s1_translator_avalon_universal_slave_0_agent_rf_source_valid),            //                .valid
		.rf_source_startofpacket (sdram_controller_s1_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //                .startofpacket
		.rf_source_endofpacket   (sdram_controller_s1_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //                .endofpacket
		.rf_source_data          (sdram_controller_s1_translator_avalon_universal_slave_0_agent_rf_source_data),             //                .data
		.rdata_fifo_sink_ready   (sdram_controller_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       // rdata_fifo_sink.ready
		.rdata_fifo_sink_valid   (sdram_controller_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_sink_data    (sdram_controller_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data),        //                .data
		.rdata_fifo_src_ready    (sdram_controller_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       //  rdata_fifo_src.ready
		.rdata_fifo_src_valid    (sdram_controller_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_src_data     (sdram_controller_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data)         //                .data
	);

	altera_avalon_sc_fifo #(
		.SYMBOLS_PER_BEAT    (1),
		.BITS_PER_SYMBOL     (65),
		.FIFO_DEPTH          (8),
		.CHANNEL_WIDTH       (0),
		.ERROR_WIDTH         (0),
		.USE_PACKETS         (1),
		.USE_FILL_LEVEL      (0),
		.EMPTY_LATENCY       (1),
		.USE_MEMORY_BLOCKS   (0),
		.USE_STORE_FORWARD   (0),
		.USE_ALMOST_FULL_IF  (0),
		.USE_ALMOST_EMPTY_IF (0)
	) sdram_controller_s1_translator_avalon_universal_slave_0_agent_rsp_fifo (
		.clk               (clk_clk),                                                                                  //       clk.clk
		.reset             (rst_controller_reset_out_reset),                                                           // clk_reset.reset
		.in_data           (sdram_controller_s1_translator_avalon_universal_slave_0_agent_rf_source_data),             //        in.data
		.in_valid          (sdram_controller_s1_translator_avalon_universal_slave_0_agent_rf_source_valid),            //          .valid
		.in_ready          (sdram_controller_s1_translator_avalon_universal_slave_0_agent_rf_source_ready),            //          .ready
		.in_startofpacket  (sdram_controller_s1_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //          .startofpacket
		.in_endofpacket    (sdram_controller_s1_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //          .endofpacket
		.out_data          (sdram_controller_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //       out.data
		.out_valid         (sdram_controller_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //          .valid
		.out_ready         (sdram_controller_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //          .ready
		.out_startofpacket (sdram_controller_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //          .startofpacket
		.out_endofpacket   (sdram_controller_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //          .endofpacket
		.csr_address       (2'b00),                                                                                    // (terminated)
		.csr_read          (1'b0),                                                                                     // (terminated)
		.csr_write         (1'b0),                                                                                     // (terminated)
		.csr_readdata      (),                                                                                         // (terminated)
		.csr_writedata     (32'b00000000000000000000000000000000),                                                     // (terminated)
		.almost_full_data  (),                                                                                         // (terminated)
		.almost_empty_data (),                                                                                         // (terminated)
		.in_empty          (1'b0),                                                                                     // (terminated)
		.out_empty         (),                                                                                         // (terminated)
		.in_error          (1'b0),                                                                                     // (terminated)
		.out_error         (),                                                                                         // (terminated)
		.in_channel        (1'b0),                                                                                     // (terminated)
		.out_channel       ()                                                                                          // (terminated)
	);

	altera_merlin_slave_agent #(
		.PKT_DATA_H                (31),
		.PKT_DATA_L                (0),
		.PKT_BEGIN_BURST           (72),
		.PKT_SYMBOL_W              (8),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32),
		.PKT_ADDR_H                (60),
		.PKT_ADDR_L                (36),
		.PKT_TRANS_COMPRESSED_READ (61),
		.PKT_TRANS_POSTED          (62),
		.PKT_TRANS_WRITE           (63),
		.PKT_TRANS_READ            (64),
		.PKT_TRANS_LOCK            (65),
		.PKT_SRC_ID_H              (76),
		.PKT_SRC_ID_L              (73),
		.PKT_DEST_ID_H             (80),
		.PKT_DEST_ID_L             (77),
		.PKT_BURSTWRAP_H           (71),
		.PKT_BURSTWRAP_L           (69),
		.PKT_BYTE_CNT_H            (68),
		.PKT_BYTE_CNT_L            (66),
		.PKT_PROTECTION_H          (81),
		.PKT_PROTECTION_L          (81),
		.ST_CHANNEL_W              (9),
		.ST_DATA_W                 (82),
		.AVS_BURSTCOUNT_W          (3),
		.SUPPRESS_0_BYTEEN_CMD     (0),
		.PREVENT_FIFO_OVERFLOW     (1)
	) leds_s1_translator_avalon_universal_slave_0_agent (
		.clk                     (clk_clk),                                                                      //             clk.clk
		.reset                   (rst_controller_reset_out_reset),                                               //       clk_reset.reset
		.m0_address              (leds_s1_translator_avalon_universal_slave_0_agent_m0_address),                 //              m0.address
		.m0_burstcount           (leds_s1_translator_avalon_universal_slave_0_agent_m0_burstcount),              //                .burstcount
		.m0_byteenable           (leds_s1_translator_avalon_universal_slave_0_agent_m0_byteenable),              //                .byteenable
		.m0_debugaccess          (leds_s1_translator_avalon_universal_slave_0_agent_m0_debugaccess),             //                .debugaccess
		.m0_lock                 (leds_s1_translator_avalon_universal_slave_0_agent_m0_lock),                    //                .lock
		.m0_readdata             (leds_s1_translator_avalon_universal_slave_0_agent_m0_readdata),                //                .readdata
		.m0_readdatavalid        (leds_s1_translator_avalon_universal_slave_0_agent_m0_readdatavalid),           //                .readdatavalid
		.m0_read                 (leds_s1_translator_avalon_universal_slave_0_agent_m0_read),                    //                .read
		.m0_waitrequest          (leds_s1_translator_avalon_universal_slave_0_agent_m0_waitrequest),             //                .waitrequest
		.m0_writedata            (leds_s1_translator_avalon_universal_slave_0_agent_m0_writedata),               //                .writedata
		.m0_write                (leds_s1_translator_avalon_universal_slave_0_agent_m0_write),                   //                .write
		.rp_endofpacket          (leds_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket),             //              rp.endofpacket
		.rp_ready                (leds_s1_translator_avalon_universal_slave_0_agent_rp_ready),                   //                .ready
		.rp_valid                (leds_s1_translator_avalon_universal_slave_0_agent_rp_valid),                   //                .valid
		.rp_data                 (leds_s1_translator_avalon_universal_slave_0_agent_rp_data),                    //                .data
		.rp_startofpacket        (leds_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket),           //                .startofpacket
		.cp_ready                (cmd_xbar_demux_001_src2_ready),                                                //              cp.ready
		.cp_valid                (cmd_xbar_demux_001_src2_valid),                                                //                .valid
		.cp_data                 (cmd_xbar_demux_001_src2_data),                                                 //                .data
		.cp_startofpacket        (cmd_xbar_demux_001_src2_startofpacket),                                        //                .startofpacket
		.cp_endofpacket          (cmd_xbar_demux_001_src2_endofpacket),                                          //                .endofpacket
		.cp_channel              (cmd_xbar_demux_001_src2_channel),                                              //                .channel
		.rf_sink_ready           (leds_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //         rf_sink.ready
		.rf_sink_valid           (leds_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //                .valid
		.rf_sink_startofpacket   (leds_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //                .startofpacket
		.rf_sink_endofpacket     (leds_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //                .endofpacket
		.rf_sink_data            (leds_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //                .data
		.rf_source_ready         (leds_s1_translator_avalon_universal_slave_0_agent_rf_source_ready),            //       rf_source.ready
		.rf_source_valid         (leds_s1_translator_avalon_universal_slave_0_agent_rf_source_valid),            //                .valid
		.rf_source_startofpacket (leds_s1_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //                .startofpacket
		.rf_source_endofpacket   (leds_s1_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //                .endofpacket
		.rf_source_data          (leds_s1_translator_avalon_universal_slave_0_agent_rf_source_data),             //                .data
		.rdata_fifo_sink_ready   (leds_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       // rdata_fifo_sink.ready
		.rdata_fifo_sink_valid   (leds_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_sink_data    (leds_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data),        //                .data
		.rdata_fifo_src_ready    (leds_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       //  rdata_fifo_src.ready
		.rdata_fifo_src_valid    (leds_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_src_data     (leds_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data)         //                .data
	);

	altera_avalon_sc_fifo #(
		.SYMBOLS_PER_BEAT    (1),
		.BITS_PER_SYMBOL     (83),
		.FIFO_DEPTH          (2),
		.CHANNEL_WIDTH       (0),
		.ERROR_WIDTH         (0),
		.USE_PACKETS         (1),
		.USE_FILL_LEVEL      (0),
		.EMPTY_LATENCY       (1),
		.USE_MEMORY_BLOCKS   (0),
		.USE_STORE_FORWARD   (0),
		.USE_ALMOST_FULL_IF  (0),
		.USE_ALMOST_EMPTY_IF (0)
	) leds_s1_translator_avalon_universal_slave_0_agent_rsp_fifo (
		.clk               (clk_clk),                                                                      //       clk.clk
		.reset             (rst_controller_reset_out_reset),                                               // clk_reset.reset
		.in_data           (leds_s1_translator_avalon_universal_slave_0_agent_rf_source_data),             //        in.data
		.in_valid          (leds_s1_translator_avalon_universal_slave_0_agent_rf_source_valid),            //          .valid
		.in_ready          (leds_s1_translator_avalon_universal_slave_0_agent_rf_source_ready),            //          .ready
		.in_startofpacket  (leds_s1_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //          .startofpacket
		.in_endofpacket    (leds_s1_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //          .endofpacket
		.out_data          (leds_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //       out.data
		.out_valid         (leds_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //          .valid
		.out_ready         (leds_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //          .ready
		.out_startofpacket (leds_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //          .startofpacket
		.out_endofpacket   (leds_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //          .endofpacket
		.csr_address       (2'b00),                                                                        // (terminated)
		.csr_read          (1'b0),                                                                         // (terminated)
		.csr_write         (1'b0),                                                                         // (terminated)
		.csr_readdata      (),                                                                             // (terminated)
		.csr_writedata     (32'b00000000000000000000000000000000),                                         // (terminated)
		.almost_full_data  (),                                                                             // (terminated)
		.almost_empty_data (),                                                                             // (terminated)
		.in_empty          (1'b0),                                                                         // (terminated)
		.out_empty         (),                                                                             // (terminated)
		.in_error          (1'b0),                                                                         // (terminated)
		.out_error         (),                                                                             // (terminated)
		.in_channel        (1'b0),                                                                         // (terminated)
		.out_channel       ()                                                                              // (terminated)
	);

	altera_merlin_slave_agent #(
		.PKT_DATA_H                (31),
		.PKT_DATA_L                (0),
		.PKT_BEGIN_BURST           (72),
		.PKT_SYMBOL_W              (8),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32),
		.PKT_ADDR_H                (60),
		.PKT_ADDR_L                (36),
		.PKT_TRANS_COMPRESSED_READ (61),
		.PKT_TRANS_POSTED          (62),
		.PKT_TRANS_WRITE           (63),
		.PKT_TRANS_READ            (64),
		.PKT_TRANS_LOCK            (65),
		.PKT_SRC_ID_H              (76),
		.PKT_SRC_ID_L              (73),
		.PKT_DEST_ID_H             (80),
		.PKT_DEST_ID_L             (77),
		.PKT_BURSTWRAP_H           (71),
		.PKT_BURSTWRAP_L           (69),
		.PKT_BYTE_CNT_H            (68),
		.PKT_BYTE_CNT_L            (66),
		.PKT_PROTECTION_H          (81),
		.PKT_PROTECTION_L          (81),
		.ST_CHANNEL_W              (9),
		.ST_DATA_W                 (82),
		.AVS_BURSTCOUNT_W          (3),
		.SUPPRESS_0_BYTEEN_CMD     (0),
		.PREVENT_FIFO_OVERFLOW     (1)
	) switches_s1_translator_avalon_universal_slave_0_agent (
		.clk                     (clk_clk),                                                                          //             clk.clk
		.reset                   (rst_controller_reset_out_reset),                                                   //       clk_reset.reset
		.m0_address              (switches_s1_translator_avalon_universal_slave_0_agent_m0_address),                 //              m0.address
		.m0_burstcount           (switches_s1_translator_avalon_universal_slave_0_agent_m0_burstcount),              //                .burstcount
		.m0_byteenable           (switches_s1_translator_avalon_universal_slave_0_agent_m0_byteenable),              //                .byteenable
		.m0_debugaccess          (switches_s1_translator_avalon_universal_slave_0_agent_m0_debugaccess),             //                .debugaccess
		.m0_lock                 (switches_s1_translator_avalon_universal_slave_0_agent_m0_lock),                    //                .lock
		.m0_readdata             (switches_s1_translator_avalon_universal_slave_0_agent_m0_readdata),                //                .readdata
		.m0_readdatavalid        (switches_s1_translator_avalon_universal_slave_0_agent_m0_readdatavalid),           //                .readdatavalid
		.m0_read                 (switches_s1_translator_avalon_universal_slave_0_agent_m0_read),                    //                .read
		.m0_waitrequest          (switches_s1_translator_avalon_universal_slave_0_agent_m0_waitrequest),             //                .waitrequest
		.m0_writedata            (switches_s1_translator_avalon_universal_slave_0_agent_m0_writedata),               //                .writedata
		.m0_write                (switches_s1_translator_avalon_universal_slave_0_agent_m0_write),                   //                .write
		.rp_endofpacket          (switches_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket),             //              rp.endofpacket
		.rp_ready                (switches_s1_translator_avalon_universal_slave_0_agent_rp_ready),                   //                .ready
		.rp_valid                (switches_s1_translator_avalon_universal_slave_0_agent_rp_valid),                   //                .valid
		.rp_data                 (switches_s1_translator_avalon_universal_slave_0_agent_rp_data),                    //                .data
		.rp_startofpacket        (switches_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket),           //                .startofpacket
		.cp_ready                (cmd_xbar_demux_001_src3_ready),                                                    //              cp.ready
		.cp_valid                (cmd_xbar_demux_001_src3_valid),                                                    //                .valid
		.cp_data                 (cmd_xbar_demux_001_src3_data),                                                     //                .data
		.cp_startofpacket        (cmd_xbar_demux_001_src3_startofpacket),                                            //                .startofpacket
		.cp_endofpacket          (cmd_xbar_demux_001_src3_endofpacket),                                              //                .endofpacket
		.cp_channel              (cmd_xbar_demux_001_src3_channel),                                                  //                .channel
		.rf_sink_ready           (switches_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //         rf_sink.ready
		.rf_sink_valid           (switches_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //                .valid
		.rf_sink_startofpacket   (switches_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //                .startofpacket
		.rf_sink_endofpacket     (switches_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //                .endofpacket
		.rf_sink_data            (switches_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //                .data
		.rf_source_ready         (switches_s1_translator_avalon_universal_slave_0_agent_rf_source_ready),            //       rf_source.ready
		.rf_source_valid         (switches_s1_translator_avalon_universal_slave_0_agent_rf_source_valid),            //                .valid
		.rf_source_startofpacket (switches_s1_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //                .startofpacket
		.rf_source_endofpacket   (switches_s1_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //                .endofpacket
		.rf_source_data          (switches_s1_translator_avalon_universal_slave_0_agent_rf_source_data),             //                .data
		.rdata_fifo_sink_ready   (switches_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       // rdata_fifo_sink.ready
		.rdata_fifo_sink_valid   (switches_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_sink_data    (switches_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data),        //                .data
		.rdata_fifo_src_ready    (switches_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       //  rdata_fifo_src.ready
		.rdata_fifo_src_valid    (switches_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_src_data     (switches_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data)         //                .data
	);

	altera_avalon_sc_fifo #(
		.SYMBOLS_PER_BEAT    (1),
		.BITS_PER_SYMBOL     (83),
		.FIFO_DEPTH          (2),
		.CHANNEL_WIDTH       (0),
		.ERROR_WIDTH         (0),
		.USE_PACKETS         (1),
		.USE_FILL_LEVEL      (0),
		.EMPTY_LATENCY       (1),
		.USE_MEMORY_BLOCKS   (0),
		.USE_STORE_FORWARD   (0),
		.USE_ALMOST_FULL_IF  (0),
		.USE_ALMOST_EMPTY_IF (0)
	) switches_s1_translator_avalon_universal_slave_0_agent_rsp_fifo (
		.clk               (clk_clk),                                                                          //       clk.clk
		.reset             (rst_controller_reset_out_reset),                                                   // clk_reset.reset
		.in_data           (switches_s1_translator_avalon_universal_slave_0_agent_rf_source_data),             //        in.data
		.in_valid          (switches_s1_translator_avalon_universal_slave_0_agent_rf_source_valid),            //          .valid
		.in_ready          (switches_s1_translator_avalon_universal_slave_0_agent_rf_source_ready),            //          .ready
		.in_startofpacket  (switches_s1_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //          .startofpacket
		.in_endofpacket    (switches_s1_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //          .endofpacket
		.out_data          (switches_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //       out.data
		.out_valid         (switches_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //          .valid
		.out_ready         (switches_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //          .ready
		.out_startofpacket (switches_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //          .startofpacket
		.out_endofpacket   (switches_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //          .endofpacket
		.csr_address       (2'b00),                                                                            // (terminated)
		.csr_read          (1'b0),                                                                             // (terminated)
		.csr_write         (1'b0),                                                                             // (terminated)
		.csr_readdata      (),                                                                                 // (terminated)
		.csr_writedata     (32'b00000000000000000000000000000000),                                             // (terminated)
		.almost_full_data  (),                                                                                 // (terminated)
		.almost_empty_data (),                                                                                 // (terminated)
		.in_empty          (1'b0),                                                                             // (terminated)
		.out_empty         (),                                                                                 // (terminated)
		.in_error          (1'b0),                                                                             // (terminated)
		.out_error         (),                                                                                 // (terminated)
		.in_channel        (1'b0),                                                                             // (terminated)
		.out_channel       ()                                                                                  // (terminated)
	);

	altera_merlin_slave_agent #(
		.PKT_DATA_H                (31),
		.PKT_DATA_L                (0),
		.PKT_BEGIN_BURST           (72),
		.PKT_SYMBOL_W              (8),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32),
		.PKT_ADDR_H                (60),
		.PKT_ADDR_L                (36),
		.PKT_TRANS_COMPRESSED_READ (61),
		.PKT_TRANS_POSTED          (62),
		.PKT_TRANS_WRITE           (63),
		.PKT_TRANS_READ            (64),
		.PKT_TRANS_LOCK            (65),
		.PKT_SRC_ID_H              (76),
		.PKT_SRC_ID_L              (73),
		.PKT_DEST_ID_H             (80),
		.PKT_DEST_ID_L             (77),
		.PKT_BURSTWRAP_H           (71),
		.PKT_BURSTWRAP_L           (69),
		.PKT_BYTE_CNT_H            (68),
		.PKT_BYTE_CNT_L            (66),
		.PKT_PROTECTION_H          (81),
		.PKT_PROTECTION_L          (81),
		.ST_CHANNEL_W              (9),
		.ST_DATA_W                 (82),
		.AVS_BURSTCOUNT_W          (3),
		.SUPPRESS_0_BYTEEN_CMD     (0),
		.PREVENT_FIFO_OVERFLOW     (1)
	) jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent (
		.clk                     (clk_clk),                                                                                            //             clk.clk
		.reset                   (rst_controller_reset_out_reset),                                                                     //       clk_reset.reset
		.m0_address              (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_address),                 //              m0.address
		.m0_burstcount           (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_burstcount),              //                .burstcount
		.m0_byteenable           (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_byteenable),              //                .byteenable
		.m0_debugaccess          (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_debugaccess),             //                .debugaccess
		.m0_lock                 (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_lock),                    //                .lock
		.m0_readdata             (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_readdata),                //                .readdata
		.m0_readdatavalid        (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_readdatavalid),           //                .readdatavalid
		.m0_read                 (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_read),                    //                .read
		.m0_waitrequest          (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_waitrequest),             //                .waitrequest
		.m0_writedata            (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_writedata),               //                .writedata
		.m0_write                (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_write),                   //                .write
		.rp_endofpacket          (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_endofpacket),             //              rp.endofpacket
		.rp_ready                (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_ready),                   //                .ready
		.rp_valid                (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_valid),                   //                .valid
		.rp_data                 (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_data),                    //                .data
		.rp_startofpacket        (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_startofpacket),           //                .startofpacket
		.cp_ready                (cmd_xbar_demux_001_src4_ready),                                                                      //              cp.ready
		.cp_valid                (cmd_xbar_demux_001_src4_valid),                                                                      //                .valid
		.cp_data                 (cmd_xbar_demux_001_src4_data),                                                                       //                .data
		.cp_startofpacket        (cmd_xbar_demux_001_src4_startofpacket),                                                              //                .startofpacket
		.cp_endofpacket          (cmd_xbar_demux_001_src4_endofpacket),                                                                //                .endofpacket
		.cp_channel              (cmd_xbar_demux_001_src4_channel),                                                                    //                .channel
		.rf_sink_ready           (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //         rf_sink.ready
		.rf_sink_valid           (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //                .valid
		.rf_sink_startofpacket   (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //                .startofpacket
		.rf_sink_endofpacket     (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //                .endofpacket
		.rf_sink_data            (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //                .data
		.rf_source_ready         (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_ready),            //       rf_source.ready
		.rf_source_valid         (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_valid),            //                .valid
		.rf_source_startofpacket (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //                .startofpacket
		.rf_source_endofpacket   (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //                .endofpacket
		.rf_source_data          (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_data),             //                .data
		.rdata_fifo_sink_ready   (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       // rdata_fifo_sink.ready
		.rdata_fifo_sink_valid   (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_sink_data    (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data),        //                .data
		.rdata_fifo_src_ready    (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       //  rdata_fifo_src.ready
		.rdata_fifo_src_valid    (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_src_data     (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data)         //                .data
	);

	altera_avalon_sc_fifo #(
		.SYMBOLS_PER_BEAT    (1),
		.BITS_PER_SYMBOL     (83),
		.FIFO_DEPTH          (2),
		.CHANNEL_WIDTH       (0),
		.ERROR_WIDTH         (0),
		.USE_PACKETS         (1),
		.USE_FILL_LEVEL      (0),
		.EMPTY_LATENCY       (1),
		.USE_MEMORY_BLOCKS   (0),
		.USE_STORE_FORWARD   (0),
		.USE_ALMOST_FULL_IF  (0),
		.USE_ALMOST_EMPTY_IF (0)
	) jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo (
		.clk               (clk_clk),                                                                                            //       clk.clk
		.reset             (rst_controller_reset_out_reset),                                                                     // clk_reset.reset
		.in_data           (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_data),             //        in.data
		.in_valid          (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_valid),            //          .valid
		.in_ready          (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_ready),            //          .ready
		.in_startofpacket  (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //          .startofpacket
		.in_endofpacket    (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //          .endofpacket
		.out_data          (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //       out.data
		.out_valid         (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //          .valid
		.out_ready         (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //          .ready
		.out_startofpacket (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //          .startofpacket
		.out_endofpacket   (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //          .endofpacket
		.csr_address       (2'b00),                                                                                              // (terminated)
		.csr_read          (1'b0),                                                                                               // (terminated)
		.csr_write         (1'b0),                                                                                               // (terminated)
		.csr_readdata      (),                                                                                                   // (terminated)
		.csr_writedata     (32'b00000000000000000000000000000000),                                                               // (terminated)
		.almost_full_data  (),                                                                                                   // (terminated)
		.almost_empty_data (),                                                                                                   // (terminated)
		.in_empty          (1'b0),                                                                                               // (terminated)
		.out_empty         (),                                                                                                   // (terminated)
		.in_error          (1'b0),                                                                                               // (terminated)
		.out_error         (),                                                                                                   // (terminated)
		.in_channel        (1'b0),                                                                                               // (terminated)
		.out_channel       ()                                                                                                    // (terminated)
	);

	altera_merlin_slave_agent #(
		.PKT_DATA_H                (31),
		.PKT_DATA_L                (0),
		.PKT_BEGIN_BURST           (72),
		.PKT_SYMBOL_W              (8),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32),
		.PKT_ADDR_H                (60),
		.PKT_ADDR_L                (36),
		.PKT_TRANS_COMPRESSED_READ (61),
		.PKT_TRANS_POSTED          (62),
		.PKT_TRANS_WRITE           (63),
		.PKT_TRANS_READ            (64),
		.PKT_TRANS_LOCK            (65),
		.PKT_SRC_ID_H              (76),
		.PKT_SRC_ID_L              (73),
		.PKT_DEST_ID_H             (80),
		.PKT_DEST_ID_L             (77),
		.PKT_BURSTWRAP_H           (71),
		.PKT_BURSTWRAP_L           (69),
		.PKT_BYTE_CNT_H            (68),
		.PKT_BYTE_CNT_L            (66),
		.PKT_PROTECTION_H          (81),
		.PKT_PROTECTION_L          (81),
		.ST_CHANNEL_W              (9),
		.ST_DATA_W                 (82),
		.AVS_BURSTCOUNT_W          (3),
		.SUPPRESS_0_BYTEEN_CMD     (0),
		.PREVENT_FIFO_OVERFLOW     (1)
	) lcd_0_control_slave_translator_avalon_universal_slave_0_agent (
		.clk                     (clk_clk),                                                                                  //             clk.clk
		.reset                   (rst_controller_reset_out_reset),                                                           //       clk_reset.reset
		.m0_address              (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_address),                 //              m0.address
		.m0_burstcount           (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_burstcount),              //                .burstcount
		.m0_byteenable           (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_byteenable),              //                .byteenable
		.m0_debugaccess          (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_debugaccess),             //                .debugaccess
		.m0_lock                 (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_lock),                    //                .lock
		.m0_readdata             (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_readdata),                //                .readdata
		.m0_readdatavalid        (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_readdatavalid),           //                .readdatavalid
		.m0_read                 (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_read),                    //                .read
		.m0_waitrequest          (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_waitrequest),             //                .waitrequest
		.m0_writedata            (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_writedata),               //                .writedata
		.m0_write                (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_m0_write),                   //                .write
		.rp_endofpacket          (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rp_endofpacket),             //              rp.endofpacket
		.rp_ready                (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rp_ready),                   //                .ready
		.rp_valid                (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rp_valid),                   //                .valid
		.rp_data                 (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rp_data),                    //                .data
		.rp_startofpacket        (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rp_startofpacket),           //                .startofpacket
		.cp_ready                (cmd_xbar_demux_001_src5_ready),                                                            //              cp.ready
		.cp_valid                (cmd_xbar_demux_001_src5_valid),                                                            //                .valid
		.cp_data                 (cmd_xbar_demux_001_src5_data),                                                             //                .data
		.cp_startofpacket        (cmd_xbar_demux_001_src5_startofpacket),                                                    //                .startofpacket
		.cp_endofpacket          (cmd_xbar_demux_001_src5_endofpacket),                                                      //                .endofpacket
		.cp_channel              (cmd_xbar_demux_001_src5_channel),                                                          //                .channel
		.rf_sink_ready           (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //         rf_sink.ready
		.rf_sink_valid           (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //                .valid
		.rf_sink_startofpacket   (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //                .startofpacket
		.rf_sink_endofpacket     (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //                .endofpacket
		.rf_sink_data            (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //                .data
		.rf_source_ready         (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_ready),            //       rf_source.ready
		.rf_source_valid         (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_valid),            //                .valid
		.rf_source_startofpacket (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //                .startofpacket
		.rf_source_endofpacket   (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //                .endofpacket
		.rf_source_data          (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_data),             //                .data
		.rdata_fifo_sink_ready   (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       // rdata_fifo_sink.ready
		.rdata_fifo_sink_valid   (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_sink_data    (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data),        //                .data
		.rdata_fifo_src_ready    (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       //  rdata_fifo_src.ready
		.rdata_fifo_src_valid    (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_src_data     (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data)         //                .data
	);

	altera_avalon_sc_fifo #(
		.SYMBOLS_PER_BEAT    (1),
		.BITS_PER_SYMBOL     (83),
		.FIFO_DEPTH          (2),
		.CHANNEL_WIDTH       (0),
		.ERROR_WIDTH         (0),
		.USE_PACKETS         (1),
		.USE_FILL_LEVEL      (0),
		.EMPTY_LATENCY       (1),
		.USE_MEMORY_BLOCKS   (0),
		.USE_STORE_FORWARD   (0),
		.USE_ALMOST_FULL_IF  (0),
		.USE_ALMOST_EMPTY_IF (0)
	) lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo (
		.clk               (clk_clk),                                                                                  //       clk.clk
		.reset             (rst_controller_reset_out_reset),                                                           // clk_reset.reset
		.in_data           (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_data),             //        in.data
		.in_valid          (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_valid),            //          .valid
		.in_ready          (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_ready),            //          .ready
		.in_startofpacket  (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //          .startofpacket
		.in_endofpacket    (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //          .endofpacket
		.out_data          (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //       out.data
		.out_valid         (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //          .valid
		.out_ready         (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //          .ready
		.out_startofpacket (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //          .startofpacket
		.out_endofpacket   (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //          .endofpacket
		.csr_address       (2'b00),                                                                                    // (terminated)
		.csr_read          (1'b0),                                                                                     // (terminated)
		.csr_write         (1'b0),                                                                                     // (terminated)
		.csr_readdata      (),                                                                                         // (terminated)
		.csr_writedata     (32'b00000000000000000000000000000000),                                                     // (terminated)
		.almost_full_data  (),                                                                                         // (terminated)
		.almost_empty_data (),                                                                                         // (terminated)
		.in_empty          (1'b0),                                                                                     // (terminated)
		.out_empty         (),                                                                                         // (terminated)
		.in_error          (1'b0),                                                                                     // (terminated)
		.out_error         (),                                                                                         // (terminated)
		.in_channel        (1'b0),                                                                                     // (terminated)
		.out_channel       ()                                                                                          // (terminated)
	);

	altera_merlin_slave_agent #(
		.PKT_DATA_H                (31),
		.PKT_DATA_L                (0),
		.PKT_BEGIN_BURST           (72),
		.PKT_SYMBOL_W              (8),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32),
		.PKT_ADDR_H                (60),
		.PKT_ADDR_L                (36),
		.PKT_TRANS_COMPRESSED_READ (61),
		.PKT_TRANS_POSTED          (62),
		.PKT_TRANS_WRITE           (63),
		.PKT_TRANS_READ            (64),
		.PKT_TRANS_LOCK            (65),
		.PKT_SRC_ID_H              (76),
		.PKT_SRC_ID_L              (73),
		.PKT_DEST_ID_H             (80),
		.PKT_DEST_ID_L             (77),
		.PKT_BURSTWRAP_H           (71),
		.PKT_BURSTWRAP_L           (69),
		.PKT_BYTE_CNT_H            (68),
		.PKT_BYTE_CNT_L            (66),
		.PKT_PROTECTION_H          (81),
		.PKT_PROTECTION_L          (81),
		.ST_CHANNEL_W              (9),
		.ST_DATA_W                 (82),
		.AVS_BURSTCOUNT_W          (3),
		.SUPPRESS_0_BYTEEN_CMD     (0),
		.PREVENT_FIFO_OVERFLOW     (1)
	) uart_rs232_s1_translator_avalon_universal_slave_0_agent (
		.clk                     (clk_clk),                                                                            //             clk.clk
		.reset                   (rst_controller_reset_out_reset),                                                     //       clk_reset.reset
		.m0_address              (uart_rs232_s1_translator_avalon_universal_slave_0_agent_m0_address),                 //              m0.address
		.m0_burstcount           (uart_rs232_s1_translator_avalon_universal_slave_0_agent_m0_burstcount),              //                .burstcount
		.m0_byteenable           (uart_rs232_s1_translator_avalon_universal_slave_0_agent_m0_byteenable),              //                .byteenable
		.m0_debugaccess          (uart_rs232_s1_translator_avalon_universal_slave_0_agent_m0_debugaccess),             //                .debugaccess
		.m0_lock                 (uart_rs232_s1_translator_avalon_universal_slave_0_agent_m0_lock),                    //                .lock
		.m0_readdata             (uart_rs232_s1_translator_avalon_universal_slave_0_agent_m0_readdata),                //                .readdata
		.m0_readdatavalid        (uart_rs232_s1_translator_avalon_universal_slave_0_agent_m0_readdatavalid),           //                .readdatavalid
		.m0_read                 (uart_rs232_s1_translator_avalon_universal_slave_0_agent_m0_read),                    //                .read
		.m0_waitrequest          (uart_rs232_s1_translator_avalon_universal_slave_0_agent_m0_waitrequest),             //                .waitrequest
		.m0_writedata            (uart_rs232_s1_translator_avalon_universal_slave_0_agent_m0_writedata),               //                .writedata
		.m0_write                (uart_rs232_s1_translator_avalon_universal_slave_0_agent_m0_write),                   //                .write
		.rp_endofpacket          (uart_rs232_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket),             //              rp.endofpacket
		.rp_ready                (uart_rs232_s1_translator_avalon_universal_slave_0_agent_rp_ready),                   //                .ready
		.rp_valid                (uart_rs232_s1_translator_avalon_universal_slave_0_agent_rp_valid),                   //                .valid
		.rp_data                 (uart_rs232_s1_translator_avalon_universal_slave_0_agent_rp_data),                    //                .data
		.rp_startofpacket        (uart_rs232_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket),           //                .startofpacket
		.cp_ready                (cmd_xbar_demux_001_src6_ready),                                                      //              cp.ready
		.cp_valid                (cmd_xbar_demux_001_src6_valid),                                                      //                .valid
		.cp_data                 (cmd_xbar_demux_001_src6_data),                                                       //                .data
		.cp_startofpacket        (cmd_xbar_demux_001_src6_startofpacket),                                              //                .startofpacket
		.cp_endofpacket          (cmd_xbar_demux_001_src6_endofpacket),                                                //                .endofpacket
		.cp_channel              (cmd_xbar_demux_001_src6_channel),                                                    //                .channel
		.rf_sink_ready           (uart_rs232_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //         rf_sink.ready
		.rf_sink_valid           (uart_rs232_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //                .valid
		.rf_sink_startofpacket   (uart_rs232_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //                .startofpacket
		.rf_sink_endofpacket     (uart_rs232_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //                .endofpacket
		.rf_sink_data            (uart_rs232_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //                .data
		.rf_source_ready         (uart_rs232_s1_translator_avalon_universal_slave_0_agent_rf_source_ready),            //       rf_source.ready
		.rf_source_valid         (uart_rs232_s1_translator_avalon_universal_slave_0_agent_rf_source_valid),            //                .valid
		.rf_source_startofpacket (uart_rs232_s1_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //                .startofpacket
		.rf_source_endofpacket   (uart_rs232_s1_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //                .endofpacket
		.rf_source_data          (uart_rs232_s1_translator_avalon_universal_slave_0_agent_rf_source_data),             //                .data
		.rdata_fifo_sink_ready   (uart_rs232_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       // rdata_fifo_sink.ready
		.rdata_fifo_sink_valid   (uart_rs232_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_sink_data    (uart_rs232_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data),        //                .data
		.rdata_fifo_src_ready    (uart_rs232_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       //  rdata_fifo_src.ready
		.rdata_fifo_src_valid    (uart_rs232_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_src_data     (uart_rs232_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data)         //                .data
	);

	altera_avalon_sc_fifo #(
		.SYMBOLS_PER_BEAT    (1),
		.BITS_PER_SYMBOL     (83),
		.FIFO_DEPTH          (2),
		.CHANNEL_WIDTH       (0),
		.ERROR_WIDTH         (0),
		.USE_PACKETS         (1),
		.USE_FILL_LEVEL      (0),
		.EMPTY_LATENCY       (1),
		.USE_MEMORY_BLOCKS   (0),
		.USE_STORE_FORWARD   (0),
		.USE_ALMOST_FULL_IF  (0),
		.USE_ALMOST_EMPTY_IF (0)
	) uart_rs232_s1_translator_avalon_universal_slave_0_agent_rsp_fifo (
		.clk               (clk_clk),                                                                            //       clk.clk
		.reset             (rst_controller_reset_out_reset),                                                     // clk_reset.reset
		.in_data           (uart_rs232_s1_translator_avalon_universal_slave_0_agent_rf_source_data),             //        in.data
		.in_valid          (uart_rs232_s1_translator_avalon_universal_slave_0_agent_rf_source_valid),            //          .valid
		.in_ready          (uart_rs232_s1_translator_avalon_universal_slave_0_agent_rf_source_ready),            //          .ready
		.in_startofpacket  (uart_rs232_s1_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //          .startofpacket
		.in_endofpacket    (uart_rs232_s1_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //          .endofpacket
		.out_data          (uart_rs232_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //       out.data
		.out_valid         (uart_rs232_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //          .valid
		.out_ready         (uart_rs232_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //          .ready
		.out_startofpacket (uart_rs232_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //          .startofpacket
		.out_endofpacket   (uart_rs232_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //          .endofpacket
		.csr_address       (2'b00),                                                                              // (terminated)
		.csr_read          (1'b0),                                                                               // (terminated)
		.csr_write         (1'b0),                                                                               // (terminated)
		.csr_readdata      (),                                                                                   // (terminated)
		.csr_writedata     (32'b00000000000000000000000000000000),                                               // (terminated)
		.almost_full_data  (),                                                                                   // (terminated)
		.almost_empty_data (),                                                                                   // (terminated)
		.in_empty          (1'b0),                                                                               // (terminated)
		.out_empty         (),                                                                                   // (terminated)
		.in_error          (1'b0),                                                                               // (terminated)
		.out_error         (),                                                                                   // (terminated)
		.in_channel        (1'b0),                                                                               // (terminated)
		.out_channel       ()                                                                                    // (terminated)
	);

	altera_merlin_slave_agent #(
		.PKT_DATA_H                (31),
		.PKT_DATA_L                (0),
		.PKT_BEGIN_BURST           (72),
		.PKT_SYMBOL_W              (8),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32),
		.PKT_ADDR_H                (60),
		.PKT_ADDR_L                (36),
		.PKT_TRANS_COMPRESSED_READ (61),
		.PKT_TRANS_POSTED          (62),
		.PKT_TRANS_WRITE           (63),
		.PKT_TRANS_READ            (64),
		.PKT_TRANS_LOCK            (65),
		.PKT_SRC_ID_H              (76),
		.PKT_SRC_ID_L              (73),
		.PKT_DEST_ID_H             (80),
		.PKT_DEST_ID_L             (77),
		.PKT_BURSTWRAP_H           (71),
		.PKT_BURSTWRAP_L           (69),
		.PKT_BYTE_CNT_H            (68),
		.PKT_BYTE_CNT_L            (66),
		.PKT_PROTECTION_H          (81),
		.PKT_PROTECTION_L          (81),
		.ST_CHANNEL_W              (9),
		.ST_DATA_W                 (82),
		.AVS_BURSTCOUNT_W          (3),
		.SUPPRESS_0_BYTEEN_CMD     (0),
		.PREVENT_FIFO_OVERFLOW     (1)
	) timer_0_s1_translator_avalon_universal_slave_0_agent (
		.clk                     (clk_clk),                                                                         //             clk.clk
		.reset                   (rst_controller_reset_out_reset),                                                  //       clk_reset.reset
		.m0_address              (timer_0_s1_translator_avalon_universal_slave_0_agent_m0_address),                 //              m0.address
		.m0_burstcount           (timer_0_s1_translator_avalon_universal_slave_0_agent_m0_burstcount),              //                .burstcount
		.m0_byteenable           (timer_0_s1_translator_avalon_universal_slave_0_agent_m0_byteenable),              //                .byteenable
		.m0_debugaccess          (timer_0_s1_translator_avalon_universal_slave_0_agent_m0_debugaccess),             //                .debugaccess
		.m0_lock                 (timer_0_s1_translator_avalon_universal_slave_0_agent_m0_lock),                    //                .lock
		.m0_readdata             (timer_0_s1_translator_avalon_universal_slave_0_agent_m0_readdata),                //                .readdata
		.m0_readdatavalid        (timer_0_s1_translator_avalon_universal_slave_0_agent_m0_readdatavalid),           //                .readdatavalid
		.m0_read                 (timer_0_s1_translator_avalon_universal_slave_0_agent_m0_read),                    //                .read
		.m0_waitrequest          (timer_0_s1_translator_avalon_universal_slave_0_agent_m0_waitrequest),             //                .waitrequest
		.m0_writedata            (timer_0_s1_translator_avalon_universal_slave_0_agent_m0_writedata),               //                .writedata
		.m0_write                (timer_0_s1_translator_avalon_universal_slave_0_agent_m0_write),                   //                .write
		.rp_endofpacket          (timer_0_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket),             //              rp.endofpacket
		.rp_ready                (timer_0_s1_translator_avalon_universal_slave_0_agent_rp_ready),                   //                .ready
		.rp_valid                (timer_0_s1_translator_avalon_universal_slave_0_agent_rp_valid),                   //                .valid
		.rp_data                 (timer_0_s1_translator_avalon_universal_slave_0_agent_rp_data),                    //                .data
		.rp_startofpacket        (timer_0_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket),           //                .startofpacket
		.cp_ready                (cmd_xbar_demux_001_src7_ready),                                                   //              cp.ready
		.cp_valid                (cmd_xbar_demux_001_src7_valid),                                                   //                .valid
		.cp_data                 (cmd_xbar_demux_001_src7_data),                                                    //                .data
		.cp_startofpacket        (cmd_xbar_demux_001_src7_startofpacket),                                           //                .startofpacket
		.cp_endofpacket          (cmd_xbar_demux_001_src7_endofpacket),                                             //                .endofpacket
		.cp_channel              (cmd_xbar_demux_001_src7_channel),                                                 //                .channel
		.rf_sink_ready           (timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //         rf_sink.ready
		.rf_sink_valid           (timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //                .valid
		.rf_sink_startofpacket   (timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //                .startofpacket
		.rf_sink_endofpacket     (timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //                .endofpacket
		.rf_sink_data            (timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //                .data
		.rf_source_ready         (timer_0_s1_translator_avalon_universal_slave_0_agent_rf_source_ready),            //       rf_source.ready
		.rf_source_valid         (timer_0_s1_translator_avalon_universal_slave_0_agent_rf_source_valid),            //                .valid
		.rf_source_startofpacket (timer_0_s1_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //                .startofpacket
		.rf_source_endofpacket   (timer_0_s1_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //                .endofpacket
		.rf_source_data          (timer_0_s1_translator_avalon_universal_slave_0_agent_rf_source_data),             //                .data
		.rdata_fifo_sink_ready   (timer_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       // rdata_fifo_sink.ready
		.rdata_fifo_sink_valid   (timer_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_sink_data    (timer_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data),        //                .data
		.rdata_fifo_src_ready    (timer_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       //  rdata_fifo_src.ready
		.rdata_fifo_src_valid    (timer_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_src_data     (timer_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data)         //                .data
	);

	altera_avalon_sc_fifo #(
		.SYMBOLS_PER_BEAT    (1),
		.BITS_PER_SYMBOL     (83),
		.FIFO_DEPTH          (2),
		.CHANNEL_WIDTH       (0),
		.ERROR_WIDTH         (0),
		.USE_PACKETS         (1),
		.USE_FILL_LEVEL      (0),
		.EMPTY_LATENCY       (1),
		.USE_MEMORY_BLOCKS   (0),
		.USE_STORE_FORWARD   (0),
		.USE_ALMOST_FULL_IF  (0),
		.USE_ALMOST_EMPTY_IF (0)
	) timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo (
		.clk               (clk_clk),                                                                         //       clk.clk
		.reset             (rst_controller_reset_out_reset),                                                  // clk_reset.reset
		.in_data           (timer_0_s1_translator_avalon_universal_slave_0_agent_rf_source_data),             //        in.data
		.in_valid          (timer_0_s1_translator_avalon_universal_slave_0_agent_rf_source_valid),            //          .valid
		.in_ready          (timer_0_s1_translator_avalon_universal_slave_0_agent_rf_source_ready),            //          .ready
		.in_startofpacket  (timer_0_s1_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //          .startofpacket
		.in_endofpacket    (timer_0_s1_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //          .endofpacket
		.out_data          (timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //       out.data
		.out_valid         (timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //          .valid
		.out_ready         (timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //          .ready
		.out_startofpacket (timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //          .startofpacket
		.out_endofpacket   (timer_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //          .endofpacket
		.csr_address       (2'b00),                                                                           // (terminated)
		.csr_read          (1'b0),                                                                            // (terminated)
		.csr_write         (1'b0),                                                                            // (terminated)
		.csr_readdata      (),                                                                                // (terminated)
		.csr_writedata     (32'b00000000000000000000000000000000),                                            // (terminated)
		.almost_full_data  (),                                                                                // (terminated)
		.almost_empty_data (),                                                                                // (terminated)
		.in_empty          (1'b0),                                                                            // (terminated)
		.out_empty         (),                                                                                // (terminated)
		.in_error          (1'b0),                                                                            // (terminated)
		.out_error         (),                                                                                // (terminated)
		.in_channel        (1'b0),                                                                            // (terminated)
		.out_channel       ()                                                                                 // (terminated)
	);

	altera_merlin_slave_agent #(
		.PKT_DATA_H                (31),
		.PKT_DATA_L                (0),
		.PKT_BEGIN_BURST           (72),
		.PKT_SYMBOL_W              (8),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32),
		.PKT_ADDR_H                (60),
		.PKT_ADDR_L                (36),
		.PKT_TRANS_COMPRESSED_READ (61),
		.PKT_TRANS_POSTED          (62),
		.PKT_TRANS_WRITE           (63),
		.PKT_TRANS_READ            (64),
		.PKT_TRANS_LOCK            (65),
		.PKT_SRC_ID_H              (76),
		.PKT_SRC_ID_L              (73),
		.PKT_DEST_ID_H             (80),
		.PKT_DEST_ID_L             (77),
		.PKT_BURSTWRAP_H           (71),
		.PKT_BURSTWRAP_L           (69),
		.PKT_BYTE_CNT_H            (68),
		.PKT_BYTE_CNT_L            (66),
		.PKT_PROTECTION_H          (81),
		.PKT_PROTECTION_L          (81),
		.ST_CHANNEL_W              (9),
		.ST_DATA_W                 (82),
		.AVS_BURSTCOUNT_W          (3),
		.SUPPRESS_0_BYTEEN_CMD     (0),
		.PREVENT_FIFO_OVERFLOW     (1)
	) calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent (
		.clk                     (clk_clk),                                                                                    //             clk.clk
		.reset                   (rst_controller_reset_out_reset),                                                             //       clk_reset.reset
		.m0_address              (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_m0_address),                 //              m0.address
		.m0_burstcount           (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_m0_burstcount),              //                .burstcount
		.m0_byteenable           (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_m0_byteenable),              //                .byteenable
		.m0_debugaccess          (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_m0_debugaccess),             //                .debugaccess
		.m0_lock                 (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_m0_lock),                    //                .lock
		.m0_readdata             (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_m0_readdata),                //                .readdata
		.m0_readdatavalid        (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_m0_readdatavalid),           //                .readdatavalid
		.m0_read                 (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_m0_read),                    //                .read
		.m0_waitrequest          (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_m0_waitrequest),             //                .waitrequest
		.m0_writedata            (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_m0_writedata),               //                .writedata
		.m0_write                (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_m0_write),                   //                .write
		.rp_endofpacket          (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket),             //              rp.endofpacket
		.rp_ready                (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rp_ready),                   //                .ready
		.rp_valid                (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rp_valid),                   //                .valid
		.rp_data                 (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rp_data),                    //                .data
		.rp_startofpacket        (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket),           //                .startofpacket
		.cp_ready                (cmd_xbar_demux_001_src8_ready),                                                              //              cp.ready
		.cp_valid                (cmd_xbar_demux_001_src8_valid),                                                              //                .valid
		.cp_data                 (cmd_xbar_demux_001_src8_data),                                                               //                .data
		.cp_startofpacket        (cmd_xbar_demux_001_src8_startofpacket),                                                      //                .startofpacket
		.cp_endofpacket          (cmd_xbar_demux_001_src8_endofpacket),                                                        //                .endofpacket
		.cp_channel              (cmd_xbar_demux_001_src8_channel),                                                            //                .channel
		.rf_sink_ready           (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //         rf_sink.ready
		.rf_sink_valid           (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //                .valid
		.rf_sink_startofpacket   (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //                .startofpacket
		.rf_sink_endofpacket     (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //                .endofpacket
		.rf_sink_data            (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //                .data
		.rf_source_ready         (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rf_source_ready),            //       rf_source.ready
		.rf_source_valid         (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rf_source_valid),            //                .valid
		.rf_source_startofpacket (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //                .startofpacket
		.rf_source_endofpacket   (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //                .endofpacket
		.rf_source_data          (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rf_source_data),             //                .data
		.rdata_fifo_sink_ready   (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       // rdata_fifo_sink.ready
		.rdata_fifo_sink_valid   (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_sink_data    (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data),        //                .data
		.rdata_fifo_src_ready    (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       //  rdata_fifo_src.ready
		.rdata_fifo_src_valid    (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_src_data     (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data)         //                .data
	);

	altera_avalon_sc_fifo #(
		.SYMBOLS_PER_BEAT    (1),
		.BITS_PER_SYMBOL     (83),
		.FIFO_DEPTH          (2),
		.CHANNEL_WIDTH       (0),
		.ERROR_WIDTH         (0),
		.USE_PACKETS         (1),
		.USE_FILL_LEVEL      (0),
		.EMPTY_LATENCY       (1),
		.USE_MEMORY_BLOCKS   (0),
		.USE_STORE_FORWARD   (0),
		.USE_ALMOST_FULL_IF  (0),
		.USE_ALMOST_EMPTY_IF (0)
	) calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo (
		.clk               (clk_clk),                                                                                    //       clk.clk
		.reset             (rst_controller_reset_out_reset),                                                             // clk_reset.reset
		.in_data           (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rf_source_data),             //        in.data
		.in_valid          (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rf_source_valid),            //          .valid
		.in_ready          (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rf_source_ready),            //          .ready
		.in_startofpacket  (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //          .startofpacket
		.in_endofpacket    (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //          .endofpacket
		.out_data          (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //       out.data
		.out_valid         (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //          .valid
		.out_ready         (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //          .ready
		.out_startofpacket (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //          .startofpacket
		.out_endofpacket   (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //          .endofpacket
		.csr_address       (2'b00),                                                                                      // (terminated)
		.csr_read          (1'b0),                                                                                       // (terminated)
		.csr_write         (1'b0),                                                                                       // (terminated)
		.csr_readdata      (),                                                                                           // (terminated)
		.csr_writedata     (32'b00000000000000000000000000000000),                                                       // (terminated)
		.almost_full_data  (),                                                                                           // (terminated)
		.almost_empty_data (),                                                                                           // (terminated)
		.in_empty          (1'b0),                                                                                       // (terminated)
		.out_empty         (),                                                                                           // (terminated)
		.in_error          (1'b0),                                                                                       // (terminated)
		.out_error         (),                                                                                           // (terminated)
		.in_channel        (1'b0),                                                                                       // (terminated)
		.out_channel       ()                                                                                            // (terminated)
	);

	nios_qsys_addr_router addr_router (
		.sink_ready         (cpu_nios_instruction_master_translator_avalon_universal_master_0_agent_cp_ready),         //      sink.ready
		.sink_valid         (cpu_nios_instruction_master_translator_avalon_universal_master_0_agent_cp_valid),         //          .valid
		.sink_data          (cpu_nios_instruction_master_translator_avalon_universal_master_0_agent_cp_data),          //          .data
		.sink_startofpacket (cpu_nios_instruction_master_translator_avalon_universal_master_0_agent_cp_startofpacket), //          .startofpacket
		.sink_endofpacket   (cpu_nios_instruction_master_translator_avalon_universal_master_0_agent_cp_endofpacket),   //          .endofpacket
		.clk                (clk_clk),                                                                                 //       clk.clk
		.reset              (rst_controller_reset_out_reset),                                                          // clk_reset.reset
		.src_ready          (addr_router_src_ready),                                                                   //       src.ready
		.src_valid          (addr_router_src_valid),                                                                   //          .valid
		.src_data           (addr_router_src_data),                                                                    //          .data
		.src_channel        (addr_router_src_channel),                                                                 //          .channel
		.src_startofpacket  (addr_router_src_startofpacket),                                                           //          .startofpacket
		.src_endofpacket    (addr_router_src_endofpacket)                                                              //          .endofpacket
	);

	nios_qsys_addr_router_001 addr_router_001 (
		.sink_ready         (cpu_nios_data_master_translator_avalon_universal_master_0_agent_cp_ready),         //      sink.ready
		.sink_valid         (cpu_nios_data_master_translator_avalon_universal_master_0_agent_cp_valid),         //          .valid
		.sink_data          (cpu_nios_data_master_translator_avalon_universal_master_0_agent_cp_data),          //          .data
		.sink_startofpacket (cpu_nios_data_master_translator_avalon_universal_master_0_agent_cp_startofpacket), //          .startofpacket
		.sink_endofpacket   (cpu_nios_data_master_translator_avalon_universal_master_0_agent_cp_endofpacket),   //          .endofpacket
		.clk                (clk_clk),                                                                          //       clk.clk
		.reset              (rst_controller_reset_out_reset),                                                   // clk_reset.reset
		.src_ready          (addr_router_001_src_ready),                                                        //       src.ready
		.src_valid          (addr_router_001_src_valid),                                                        //          .valid
		.src_data           (addr_router_001_src_data),                                                         //          .data
		.src_channel        (addr_router_001_src_channel),                                                      //          .channel
		.src_startofpacket  (addr_router_001_src_startofpacket),                                                //          .startofpacket
		.src_endofpacket    (addr_router_001_src_endofpacket)                                                   //          .endofpacket
	);

	nios_qsys_id_router id_router (
		.sink_ready         (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_ready),         //      sink.ready
		.sink_valid         (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_valid),         //          .valid
		.sink_data          (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_data),          //          .data
		.sink_startofpacket (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_startofpacket), //          .startofpacket
		.sink_endofpacket   (cpu_nios_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_endofpacket),   //          .endofpacket
		.clk                (clk_clk),                                                                               //       clk.clk
		.reset              (rst_controller_reset_out_reset),                                                        // clk_reset.reset
		.src_ready          (id_router_src_ready),                                                                   //       src.ready
		.src_valid          (id_router_src_valid),                                                                   //          .valid
		.src_data           (id_router_src_data),                                                                    //          .data
		.src_channel        (id_router_src_channel),                                                                 //          .channel
		.src_startofpacket  (id_router_src_startofpacket),                                                           //          .startofpacket
		.src_endofpacket    (id_router_src_endofpacket)                                                              //          .endofpacket
	);

	nios_qsys_id_router_001 id_router_001 (
		.sink_ready         (sdram_controller_s1_translator_avalon_universal_slave_0_agent_rp_ready),         //      sink.ready
		.sink_valid         (sdram_controller_s1_translator_avalon_universal_slave_0_agent_rp_valid),         //          .valid
		.sink_data          (sdram_controller_s1_translator_avalon_universal_slave_0_agent_rp_data),          //          .data
		.sink_startofpacket (sdram_controller_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket), //          .startofpacket
		.sink_endofpacket   (sdram_controller_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket),   //          .endofpacket
		.clk                (clk_clk),                                                                        //       clk.clk
		.reset              (rst_controller_reset_out_reset),                                                 // clk_reset.reset
		.src_ready          (id_router_001_src_ready),                                                        //       src.ready
		.src_valid          (id_router_001_src_valid),                                                        //          .valid
		.src_data           (id_router_001_src_data),                                                         //          .data
		.src_channel        (id_router_001_src_channel),                                                      //          .channel
		.src_startofpacket  (id_router_001_src_startofpacket),                                                //          .startofpacket
		.src_endofpacket    (id_router_001_src_endofpacket)                                                   //          .endofpacket
	);

	nios_qsys_id_router_002 id_router_002 (
		.sink_ready         (leds_s1_translator_avalon_universal_slave_0_agent_rp_ready),         //      sink.ready
		.sink_valid         (leds_s1_translator_avalon_universal_slave_0_agent_rp_valid),         //          .valid
		.sink_data          (leds_s1_translator_avalon_universal_slave_0_agent_rp_data),          //          .data
		.sink_startofpacket (leds_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket), //          .startofpacket
		.sink_endofpacket   (leds_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket),   //          .endofpacket
		.clk                (clk_clk),                                                            //       clk.clk
		.reset              (rst_controller_reset_out_reset),                                     // clk_reset.reset
		.src_ready          (id_router_002_src_ready),                                            //       src.ready
		.src_valid          (id_router_002_src_valid),                                            //          .valid
		.src_data           (id_router_002_src_data),                                             //          .data
		.src_channel        (id_router_002_src_channel),                                          //          .channel
		.src_startofpacket  (id_router_002_src_startofpacket),                                    //          .startofpacket
		.src_endofpacket    (id_router_002_src_endofpacket)                                       //          .endofpacket
	);

	nios_qsys_id_router_002 id_router_003 (
		.sink_ready         (switches_s1_translator_avalon_universal_slave_0_agent_rp_ready),         //      sink.ready
		.sink_valid         (switches_s1_translator_avalon_universal_slave_0_agent_rp_valid),         //          .valid
		.sink_data          (switches_s1_translator_avalon_universal_slave_0_agent_rp_data),          //          .data
		.sink_startofpacket (switches_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket), //          .startofpacket
		.sink_endofpacket   (switches_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket),   //          .endofpacket
		.clk                (clk_clk),                                                                //       clk.clk
		.reset              (rst_controller_reset_out_reset),                                         // clk_reset.reset
		.src_ready          (id_router_003_src_ready),                                                //       src.ready
		.src_valid          (id_router_003_src_valid),                                                //          .valid
		.src_data           (id_router_003_src_data),                                                 //          .data
		.src_channel        (id_router_003_src_channel),                                              //          .channel
		.src_startofpacket  (id_router_003_src_startofpacket),                                        //          .startofpacket
		.src_endofpacket    (id_router_003_src_endofpacket)                                           //          .endofpacket
	);

	nios_qsys_id_router_002 id_router_004 (
		.sink_ready         (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_ready),         //      sink.ready
		.sink_valid         (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_valid),         //          .valid
		.sink_data          (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_data),          //          .data
		.sink_startofpacket (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_startofpacket), //          .startofpacket
		.sink_endofpacket   (jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_endofpacket),   //          .endofpacket
		.clk                (clk_clk),                                                                                  //       clk.clk
		.reset              (rst_controller_reset_out_reset),                                                           // clk_reset.reset
		.src_ready          (id_router_004_src_ready),                                                                  //       src.ready
		.src_valid          (id_router_004_src_valid),                                                                  //          .valid
		.src_data           (id_router_004_src_data),                                                                   //          .data
		.src_channel        (id_router_004_src_channel),                                                                //          .channel
		.src_startofpacket  (id_router_004_src_startofpacket),                                                          //          .startofpacket
		.src_endofpacket    (id_router_004_src_endofpacket)                                                             //          .endofpacket
	);

	nios_qsys_id_router_002 id_router_005 (
		.sink_ready         (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rp_ready),         //      sink.ready
		.sink_valid         (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rp_valid),         //          .valid
		.sink_data          (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rp_data),          //          .data
		.sink_startofpacket (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rp_startofpacket), //          .startofpacket
		.sink_endofpacket   (lcd_0_control_slave_translator_avalon_universal_slave_0_agent_rp_endofpacket),   //          .endofpacket
		.clk                (clk_clk),                                                                        //       clk.clk
		.reset              (rst_controller_reset_out_reset),                                                 // clk_reset.reset
		.src_ready          (id_router_005_src_ready),                                                        //       src.ready
		.src_valid          (id_router_005_src_valid),                                                        //          .valid
		.src_data           (id_router_005_src_data),                                                         //          .data
		.src_channel        (id_router_005_src_channel),                                                      //          .channel
		.src_startofpacket  (id_router_005_src_startofpacket),                                                //          .startofpacket
		.src_endofpacket    (id_router_005_src_endofpacket)                                                   //          .endofpacket
	);

	nios_qsys_id_router_002 id_router_006 (
		.sink_ready         (uart_rs232_s1_translator_avalon_universal_slave_0_agent_rp_ready),         //      sink.ready
		.sink_valid         (uart_rs232_s1_translator_avalon_universal_slave_0_agent_rp_valid),         //          .valid
		.sink_data          (uart_rs232_s1_translator_avalon_universal_slave_0_agent_rp_data),          //          .data
		.sink_startofpacket (uart_rs232_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket), //          .startofpacket
		.sink_endofpacket   (uart_rs232_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket),   //          .endofpacket
		.clk                (clk_clk),                                                                  //       clk.clk
		.reset              (rst_controller_reset_out_reset),                                           // clk_reset.reset
		.src_ready          (id_router_006_src_ready),                                                  //       src.ready
		.src_valid          (id_router_006_src_valid),                                                  //          .valid
		.src_data           (id_router_006_src_data),                                                   //          .data
		.src_channel        (id_router_006_src_channel),                                                //          .channel
		.src_startofpacket  (id_router_006_src_startofpacket),                                          //          .startofpacket
		.src_endofpacket    (id_router_006_src_endofpacket)                                             //          .endofpacket
	);

	nios_qsys_id_router_002 id_router_007 (
		.sink_ready         (timer_0_s1_translator_avalon_universal_slave_0_agent_rp_ready),         //      sink.ready
		.sink_valid         (timer_0_s1_translator_avalon_universal_slave_0_agent_rp_valid),         //          .valid
		.sink_data          (timer_0_s1_translator_avalon_universal_slave_0_agent_rp_data),          //          .data
		.sink_startofpacket (timer_0_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket), //          .startofpacket
		.sink_endofpacket   (timer_0_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket),   //          .endofpacket
		.clk                (clk_clk),                                                               //       clk.clk
		.reset              (rst_controller_reset_out_reset),                                        // clk_reset.reset
		.src_ready          (id_router_007_src_ready),                                               //       src.ready
		.src_valid          (id_router_007_src_valid),                                               //          .valid
		.src_data           (id_router_007_src_data),                                                //          .data
		.src_channel        (id_router_007_src_channel),                                             //          .channel
		.src_startofpacket  (id_router_007_src_startofpacket),                                       //          .startofpacket
		.src_endofpacket    (id_router_007_src_endofpacket)                                          //          .endofpacket
	);

	nios_qsys_id_router_002 id_router_008 (
		.sink_ready         (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rp_ready),         //      sink.ready
		.sink_valid         (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rp_valid),         //          .valid
		.sink_data          (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rp_data),          //          .data
		.sink_startofpacket (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket), //          .startofpacket
		.sink_endofpacket   (calibrate_avalon_0_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket),   //          .endofpacket
		.clk                (clk_clk),                                                                          //       clk.clk
		.reset              (rst_controller_reset_out_reset),                                                   // clk_reset.reset
		.src_ready          (id_router_008_src_ready),                                                          //       src.ready
		.src_valid          (id_router_008_src_valid),                                                          //          .valid
		.src_data           (id_router_008_src_data),                                                           //          .data
		.src_channel        (id_router_008_src_channel),                                                        //          .channel
		.src_startofpacket  (id_router_008_src_startofpacket),                                                  //          .startofpacket
		.src_endofpacket    (id_router_008_src_endofpacket)                                                     //          .endofpacket
	);

	altera_merlin_traffic_limiter #(
		.PKT_DEST_ID_H             (80),
		.PKT_DEST_ID_L             (77),
		.PKT_TRANS_POSTED          (62),
		.MAX_OUTSTANDING_RESPONSES (13),
		.PIPELINED                 (0),
		.ST_DATA_W                 (82),
		.ST_CHANNEL_W              (9),
		.VALID_WIDTH               (9),
		.ENFORCE_ORDER             (1),
		.PKT_BYTE_CNT_H            (68),
		.PKT_BYTE_CNT_L            (66),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32)
	) limiter (
		.clk                    (clk_clk),                        //       clk.clk
		.reset                  (rst_controller_reset_out_reset), // clk_reset.reset
		.cmd_sink_ready         (addr_router_src_ready),          //  cmd_sink.ready
		.cmd_sink_valid         (addr_router_src_valid),          //          .valid
		.cmd_sink_data          (addr_router_src_data),           //          .data
		.cmd_sink_channel       (addr_router_src_channel),        //          .channel
		.cmd_sink_startofpacket (addr_router_src_startofpacket),  //          .startofpacket
		.cmd_sink_endofpacket   (addr_router_src_endofpacket),    //          .endofpacket
		.cmd_src_ready          (limiter_cmd_src_ready),          //   cmd_src.ready
		.cmd_src_data           (limiter_cmd_src_data),           //          .data
		.cmd_src_channel        (limiter_cmd_src_channel),        //          .channel
		.cmd_src_startofpacket  (limiter_cmd_src_startofpacket),  //          .startofpacket
		.cmd_src_endofpacket    (limiter_cmd_src_endofpacket),    //          .endofpacket
		.rsp_sink_ready         (rsp_xbar_mux_src_ready),         //  rsp_sink.ready
		.rsp_sink_valid         (rsp_xbar_mux_src_valid),         //          .valid
		.rsp_sink_channel       (rsp_xbar_mux_src_channel),       //          .channel
		.rsp_sink_data          (rsp_xbar_mux_src_data),          //          .data
		.rsp_sink_startofpacket (rsp_xbar_mux_src_startofpacket), //          .startofpacket
		.rsp_sink_endofpacket   (rsp_xbar_mux_src_endofpacket),   //          .endofpacket
		.rsp_src_ready          (limiter_rsp_src_ready),          //   rsp_src.ready
		.rsp_src_valid          (limiter_rsp_src_valid),          //          .valid
		.rsp_src_data           (limiter_rsp_src_data),           //          .data
		.rsp_src_channel        (limiter_rsp_src_channel),        //          .channel
		.rsp_src_startofpacket  (limiter_rsp_src_startofpacket),  //          .startofpacket
		.rsp_src_endofpacket    (limiter_rsp_src_endofpacket),    //          .endofpacket
		.cmd_src_valid          (limiter_cmd_valid_data)          // cmd_valid.data
	);

	altera_merlin_traffic_limiter #(
		.PKT_DEST_ID_H             (80),
		.PKT_DEST_ID_L             (77),
		.PKT_TRANS_POSTED          (62),
		.MAX_OUTSTANDING_RESPONSES (13),
		.PIPELINED                 (0),
		.ST_DATA_W                 (82),
		.ST_CHANNEL_W              (9),
		.VALID_WIDTH               (9),
		.ENFORCE_ORDER             (0),
		.PKT_BYTE_CNT_H            (68),
		.PKT_BYTE_CNT_L            (66),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32)
	) limiter_001 (
		.clk                    (clk_clk),                            //       clk.clk
		.reset                  (rst_controller_reset_out_reset),     // clk_reset.reset
		.cmd_sink_ready         (addr_router_001_src_ready),          //  cmd_sink.ready
		.cmd_sink_valid         (addr_router_001_src_valid),          //          .valid
		.cmd_sink_data          (addr_router_001_src_data),           //          .data
		.cmd_sink_channel       (addr_router_001_src_channel),        //          .channel
		.cmd_sink_startofpacket (addr_router_001_src_startofpacket),  //          .startofpacket
		.cmd_sink_endofpacket   (addr_router_001_src_endofpacket),    //          .endofpacket
		.cmd_src_ready          (limiter_001_cmd_src_ready),          //   cmd_src.ready
		.cmd_src_data           (limiter_001_cmd_src_data),           //          .data
		.cmd_src_channel        (limiter_001_cmd_src_channel),        //          .channel
		.cmd_src_startofpacket  (limiter_001_cmd_src_startofpacket),  //          .startofpacket
		.cmd_src_endofpacket    (limiter_001_cmd_src_endofpacket),    //          .endofpacket
		.rsp_sink_ready         (rsp_xbar_mux_001_src_ready),         //  rsp_sink.ready
		.rsp_sink_valid         (rsp_xbar_mux_001_src_valid),         //          .valid
		.rsp_sink_channel       (rsp_xbar_mux_001_src_channel),       //          .channel
		.rsp_sink_data          (rsp_xbar_mux_001_src_data),          //          .data
		.rsp_sink_startofpacket (rsp_xbar_mux_001_src_startofpacket), //          .startofpacket
		.rsp_sink_endofpacket   (rsp_xbar_mux_001_src_endofpacket),   //          .endofpacket
		.rsp_src_ready          (limiter_001_rsp_src_ready),          //   rsp_src.ready
		.rsp_src_valid          (limiter_001_rsp_src_valid),          //          .valid
		.rsp_src_data           (limiter_001_rsp_src_data),           //          .data
		.rsp_src_channel        (limiter_001_rsp_src_channel),        //          .channel
		.rsp_src_startofpacket  (limiter_001_rsp_src_startofpacket),  //          .startofpacket
		.rsp_src_endofpacket    (limiter_001_rsp_src_endofpacket),    //          .endofpacket
		.cmd_src_valid          (limiter_001_cmd_valid_data)          // cmd_valid.data
	);

	altera_merlin_burst_adapter #(
		.PKT_ADDR_H                (42),
		.PKT_ADDR_L                (18),
		.PKT_BEGIN_BURST           (54),
		.PKT_BYTE_CNT_H            (50),
		.PKT_BYTE_CNT_L            (48),
		.PKT_BYTEEN_H              (17),
		.PKT_BYTEEN_L              (16),
		.PKT_BURSTWRAP_H           (53),
		.PKT_BURSTWRAP_L           (51),
		.PKT_TRANS_COMPRESSED_READ (43),
		.PKT_TRANS_WRITE           (45),
		.PKT_TRANS_READ            (46),
		.ST_DATA_W                 (64),
		.ST_CHANNEL_W              (9),
		.OUT_BYTE_CNT_H            (49),
		.OUT_BURSTWRAP_H           (53),
		.COMPRESSED_READ_SUPPORT   (0),
		.BURSTWRAP_CONST_MASK      (3),
		.BURSTWRAP_CONST_VALUE     (3)
	) burst_adapter (
		.clk                   (clk_clk),                             //       cr0.clk
		.reset                 (rst_controller_reset_out_reset),      // cr0_reset.reset
		.sink0_valid           (width_adapter_src_valid),             //     sink0.valid
		.sink0_data            (width_adapter_src_data),              //          .data
		.sink0_channel         (width_adapter_src_channel),           //          .channel
		.sink0_startofpacket   (width_adapter_src_startofpacket),     //          .startofpacket
		.sink0_endofpacket     (width_adapter_src_endofpacket),       //          .endofpacket
		.sink0_ready           (width_adapter_src_ready),             //          .ready
		.source0_valid         (burst_adapter_source0_valid),         //   source0.valid
		.source0_data          (burst_adapter_source0_data),          //          .data
		.source0_channel       (burst_adapter_source0_channel),       //          .channel
		.source0_startofpacket (burst_adapter_source0_startofpacket), //          .startofpacket
		.source0_endofpacket   (burst_adapter_source0_endofpacket),   //          .endofpacket
		.source0_ready         (burst_adapter_source0_ready)          //          .ready
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS        (1),
		.OUTPUT_RESET_SYNC_EDGES ("deassert"),
		.SYNC_DEPTH              (2)
	) rst_controller (
		.reset_in0  (~reset_reset_n),                 // reset_in0.reset
		.clk        (clk_clk),                        //       clk.clk
		.reset_out  (rst_controller_reset_out_reset), // reset_out.reset
		.reset_in1  (1'b0),                           // (terminated)
		.reset_in2  (1'b0),                           // (terminated)
		.reset_in3  (1'b0),                           // (terminated)
		.reset_in4  (1'b0),                           // (terminated)
		.reset_in5  (1'b0),                           // (terminated)
		.reset_in6  (1'b0),                           // (terminated)
		.reset_in7  (1'b0),                           // (terminated)
		.reset_in8  (1'b0),                           // (terminated)
		.reset_in9  (1'b0),                           // (terminated)
		.reset_in10 (1'b0),                           // (terminated)
		.reset_in11 (1'b0),                           // (terminated)
		.reset_in12 (1'b0),                           // (terminated)
		.reset_in13 (1'b0),                           // (terminated)
		.reset_in14 (1'b0),                           // (terminated)
		.reset_in15 (1'b0)                            // (terminated)
	);

	nios_qsys_cmd_xbar_demux cmd_xbar_demux (
		.clk                (clk_clk),                           //        clk.clk
		.reset              (rst_controller_reset_out_reset),    //  clk_reset.reset
		.sink_ready         (limiter_cmd_src_ready),             //       sink.ready
		.sink_channel       (limiter_cmd_src_channel),           //           .channel
		.sink_data          (limiter_cmd_src_data),              //           .data
		.sink_startofpacket (limiter_cmd_src_startofpacket),     //           .startofpacket
		.sink_endofpacket   (limiter_cmd_src_endofpacket),       //           .endofpacket
		.sink_valid         (limiter_cmd_valid_data),            // sink_valid.data
		.src0_ready         (cmd_xbar_demux_src0_ready),         //       src0.ready
		.src0_valid         (cmd_xbar_demux_src0_valid),         //           .valid
		.src0_data          (cmd_xbar_demux_src0_data),          //           .data
		.src0_channel       (cmd_xbar_demux_src0_channel),       //           .channel
		.src0_startofpacket (cmd_xbar_demux_src0_startofpacket), //           .startofpacket
		.src0_endofpacket   (cmd_xbar_demux_src0_endofpacket),   //           .endofpacket
		.src1_ready         (cmd_xbar_demux_src1_ready),         //       src1.ready
		.src1_valid         (cmd_xbar_demux_src1_valid),         //           .valid
		.src1_data          (cmd_xbar_demux_src1_data),          //           .data
		.src1_channel       (cmd_xbar_demux_src1_channel),       //           .channel
		.src1_startofpacket (cmd_xbar_demux_src1_startofpacket), //           .startofpacket
		.src1_endofpacket   (cmd_xbar_demux_src1_endofpacket)    //           .endofpacket
	);

	nios_qsys_cmd_xbar_demux_001 cmd_xbar_demux_001 (
		.clk                (clk_clk),                               //        clk.clk
		.reset              (rst_controller_reset_out_reset),        //  clk_reset.reset
		.sink_ready         (limiter_001_cmd_src_ready),             //       sink.ready
		.sink_channel       (limiter_001_cmd_src_channel),           //           .channel
		.sink_data          (limiter_001_cmd_src_data),              //           .data
		.sink_startofpacket (limiter_001_cmd_src_startofpacket),     //           .startofpacket
		.sink_endofpacket   (limiter_001_cmd_src_endofpacket),       //           .endofpacket
		.sink_valid         (limiter_001_cmd_valid_data),            // sink_valid.data
		.src0_ready         (cmd_xbar_demux_001_src0_ready),         //       src0.ready
		.src0_valid         (cmd_xbar_demux_001_src0_valid),         //           .valid
		.src0_data          (cmd_xbar_demux_001_src0_data),          //           .data
		.src0_channel       (cmd_xbar_demux_001_src0_channel),       //           .channel
		.src0_startofpacket (cmd_xbar_demux_001_src0_startofpacket), //           .startofpacket
		.src0_endofpacket   (cmd_xbar_demux_001_src0_endofpacket),   //           .endofpacket
		.src1_ready         (cmd_xbar_demux_001_src1_ready),         //       src1.ready
		.src1_valid         (cmd_xbar_demux_001_src1_valid),         //           .valid
		.src1_data          (cmd_xbar_demux_001_src1_data),          //           .data
		.src1_channel       (cmd_xbar_demux_001_src1_channel),       //           .channel
		.src1_startofpacket (cmd_xbar_demux_001_src1_startofpacket), //           .startofpacket
		.src1_endofpacket   (cmd_xbar_demux_001_src1_endofpacket),   //           .endofpacket
		.src2_ready         (cmd_xbar_demux_001_src2_ready),         //       src2.ready
		.src2_valid         (cmd_xbar_demux_001_src2_valid),         //           .valid
		.src2_data          (cmd_xbar_demux_001_src2_data),          //           .data
		.src2_channel       (cmd_xbar_demux_001_src2_channel),       //           .channel
		.src2_startofpacket (cmd_xbar_demux_001_src2_startofpacket), //           .startofpacket
		.src2_endofpacket   (cmd_xbar_demux_001_src2_endofpacket),   //           .endofpacket
		.src3_ready         (cmd_xbar_demux_001_src3_ready),         //       src3.ready
		.src3_valid         (cmd_xbar_demux_001_src3_valid),         //           .valid
		.src3_data          (cmd_xbar_demux_001_src3_data),          //           .data
		.src3_channel       (cmd_xbar_demux_001_src3_channel),       //           .channel
		.src3_startofpacket (cmd_xbar_demux_001_src3_startofpacket), //           .startofpacket
		.src3_endofpacket   (cmd_xbar_demux_001_src3_endofpacket),   //           .endofpacket
		.src4_ready         (cmd_xbar_demux_001_src4_ready),         //       src4.ready
		.src4_valid         (cmd_xbar_demux_001_src4_valid),         //           .valid
		.src4_data          (cmd_xbar_demux_001_src4_data),          //           .data
		.src4_channel       (cmd_xbar_demux_001_src4_channel),       //           .channel
		.src4_startofpacket (cmd_xbar_demux_001_src4_startofpacket), //           .startofpacket
		.src4_endofpacket   (cmd_xbar_demux_001_src4_endofpacket),   //           .endofpacket
		.src5_ready         (cmd_xbar_demux_001_src5_ready),         //       src5.ready
		.src5_valid         (cmd_xbar_demux_001_src5_valid),         //           .valid
		.src5_data          (cmd_xbar_demux_001_src5_data),          //           .data
		.src5_channel       (cmd_xbar_demux_001_src5_channel),       //           .channel
		.src5_startofpacket (cmd_xbar_demux_001_src5_startofpacket), //           .startofpacket
		.src5_endofpacket   (cmd_xbar_demux_001_src5_endofpacket),   //           .endofpacket
		.src6_ready         (cmd_xbar_demux_001_src6_ready),         //       src6.ready
		.src6_valid         (cmd_xbar_demux_001_src6_valid),         //           .valid
		.src6_data          (cmd_xbar_demux_001_src6_data),          //           .data
		.src6_channel       (cmd_xbar_demux_001_src6_channel),       //           .channel
		.src6_startofpacket (cmd_xbar_demux_001_src6_startofpacket), //           .startofpacket
		.src6_endofpacket   (cmd_xbar_demux_001_src6_endofpacket),   //           .endofpacket
		.src7_ready         (cmd_xbar_demux_001_src7_ready),         //       src7.ready
		.src7_valid         (cmd_xbar_demux_001_src7_valid),         //           .valid
		.src7_data          (cmd_xbar_demux_001_src7_data),          //           .data
		.src7_channel       (cmd_xbar_demux_001_src7_channel),       //           .channel
		.src7_startofpacket (cmd_xbar_demux_001_src7_startofpacket), //           .startofpacket
		.src7_endofpacket   (cmd_xbar_demux_001_src7_endofpacket),   //           .endofpacket
		.src8_ready         (cmd_xbar_demux_001_src8_ready),         //       src8.ready
		.src8_valid         (cmd_xbar_demux_001_src8_valid),         //           .valid
		.src8_data          (cmd_xbar_demux_001_src8_data),          //           .data
		.src8_channel       (cmd_xbar_demux_001_src8_channel),       //           .channel
		.src8_startofpacket (cmd_xbar_demux_001_src8_startofpacket), //           .startofpacket
		.src8_endofpacket   (cmd_xbar_demux_001_src8_endofpacket)    //           .endofpacket
	);

	nios_qsys_cmd_xbar_mux cmd_xbar_mux (
		.clk                 (clk_clk),                               //       clk.clk
		.reset               (rst_controller_reset_out_reset),        // clk_reset.reset
		.src_ready           (cmd_xbar_mux_src_ready),                //       src.ready
		.src_valid           (cmd_xbar_mux_src_valid),                //          .valid
		.src_data            (cmd_xbar_mux_src_data),                 //          .data
		.src_channel         (cmd_xbar_mux_src_channel),              //          .channel
		.src_startofpacket   (cmd_xbar_mux_src_startofpacket),        //          .startofpacket
		.src_endofpacket     (cmd_xbar_mux_src_endofpacket),          //          .endofpacket
		.sink0_ready         (cmd_xbar_demux_src0_ready),             //     sink0.ready
		.sink0_valid         (cmd_xbar_demux_src0_valid),             //          .valid
		.sink0_channel       (cmd_xbar_demux_src0_channel),           //          .channel
		.sink0_data          (cmd_xbar_demux_src0_data),              //          .data
		.sink0_startofpacket (cmd_xbar_demux_src0_startofpacket),     //          .startofpacket
		.sink0_endofpacket   (cmd_xbar_demux_src0_endofpacket),       //          .endofpacket
		.sink1_ready         (cmd_xbar_demux_001_src0_ready),         //     sink1.ready
		.sink1_valid         (cmd_xbar_demux_001_src0_valid),         //          .valid
		.sink1_channel       (cmd_xbar_demux_001_src0_channel),       //          .channel
		.sink1_data          (cmd_xbar_demux_001_src0_data),          //          .data
		.sink1_startofpacket (cmd_xbar_demux_001_src0_startofpacket), //          .startofpacket
		.sink1_endofpacket   (cmd_xbar_demux_001_src0_endofpacket)    //          .endofpacket
	);

	nios_qsys_cmd_xbar_mux cmd_xbar_mux_001 (
		.clk                 (clk_clk),                               //       clk.clk
		.reset               (rst_controller_reset_out_reset),        // clk_reset.reset
		.src_ready           (cmd_xbar_mux_001_src_ready),            //       src.ready
		.src_valid           (cmd_xbar_mux_001_src_valid),            //          .valid
		.src_data            (cmd_xbar_mux_001_src_data),             //          .data
		.src_channel         (cmd_xbar_mux_001_src_channel),          //          .channel
		.src_startofpacket   (cmd_xbar_mux_001_src_startofpacket),    //          .startofpacket
		.src_endofpacket     (cmd_xbar_mux_001_src_endofpacket),      //          .endofpacket
		.sink0_ready         (cmd_xbar_demux_src1_ready),             //     sink0.ready
		.sink0_valid         (cmd_xbar_demux_src1_valid),             //          .valid
		.sink0_channel       (cmd_xbar_demux_src1_channel),           //          .channel
		.sink0_data          (cmd_xbar_demux_src1_data),              //          .data
		.sink0_startofpacket (cmd_xbar_demux_src1_startofpacket),     //          .startofpacket
		.sink0_endofpacket   (cmd_xbar_demux_src1_endofpacket),       //          .endofpacket
		.sink1_ready         (cmd_xbar_demux_001_src1_ready),         //     sink1.ready
		.sink1_valid         (cmd_xbar_demux_001_src1_valid),         //          .valid
		.sink1_channel       (cmd_xbar_demux_001_src1_channel),       //          .channel
		.sink1_data          (cmd_xbar_demux_001_src1_data),          //          .data
		.sink1_startofpacket (cmd_xbar_demux_001_src1_startofpacket), //          .startofpacket
		.sink1_endofpacket   (cmd_xbar_demux_001_src1_endofpacket)    //          .endofpacket
	);

	nios_qsys_rsp_xbar_demux rsp_xbar_demux (
		.clk                (clk_clk),                           //       clk.clk
		.reset              (rst_controller_reset_out_reset),    // clk_reset.reset
		.sink_ready         (id_router_src_ready),               //      sink.ready
		.sink_channel       (id_router_src_channel),             //          .channel
		.sink_data          (id_router_src_data),                //          .data
		.sink_startofpacket (id_router_src_startofpacket),       //          .startofpacket
		.sink_endofpacket   (id_router_src_endofpacket),         //          .endofpacket
		.sink_valid         (id_router_src_valid),               //          .valid
		.src0_ready         (rsp_xbar_demux_src0_ready),         //      src0.ready
		.src0_valid         (rsp_xbar_demux_src0_valid),         //          .valid
		.src0_data          (rsp_xbar_demux_src0_data),          //          .data
		.src0_channel       (rsp_xbar_demux_src0_channel),       //          .channel
		.src0_startofpacket (rsp_xbar_demux_src0_startofpacket), //          .startofpacket
		.src0_endofpacket   (rsp_xbar_demux_src0_endofpacket),   //          .endofpacket
		.src1_ready         (rsp_xbar_demux_src1_ready),         //      src1.ready
		.src1_valid         (rsp_xbar_demux_src1_valid),         //          .valid
		.src1_data          (rsp_xbar_demux_src1_data),          //          .data
		.src1_channel       (rsp_xbar_demux_src1_channel),       //          .channel
		.src1_startofpacket (rsp_xbar_demux_src1_startofpacket), //          .startofpacket
		.src1_endofpacket   (rsp_xbar_demux_src1_endofpacket)    //          .endofpacket
	);

	nios_qsys_rsp_xbar_demux rsp_xbar_demux_001 (
		.clk                (clk_clk),                               //       clk.clk
		.reset              (rst_controller_reset_out_reset),        // clk_reset.reset
		.sink_ready         (width_adapter_001_src_ready),           //      sink.ready
		.sink_channel       (width_adapter_001_src_channel),         //          .channel
		.sink_data          (width_adapter_001_src_data),            //          .data
		.sink_startofpacket (width_adapter_001_src_startofpacket),   //          .startofpacket
		.sink_endofpacket   (width_adapter_001_src_endofpacket),     //          .endofpacket
		.sink_valid         (width_adapter_001_src_valid),           //          .valid
		.src0_ready         (rsp_xbar_demux_001_src0_ready),         //      src0.ready
		.src0_valid         (rsp_xbar_demux_001_src0_valid),         //          .valid
		.src0_data          (rsp_xbar_demux_001_src0_data),          //          .data
		.src0_channel       (rsp_xbar_demux_001_src0_channel),       //          .channel
		.src0_startofpacket (rsp_xbar_demux_001_src0_startofpacket), //          .startofpacket
		.src0_endofpacket   (rsp_xbar_demux_001_src0_endofpacket),   //          .endofpacket
		.src1_ready         (rsp_xbar_demux_001_src1_ready),         //      src1.ready
		.src1_valid         (rsp_xbar_demux_001_src1_valid),         //          .valid
		.src1_data          (rsp_xbar_demux_001_src1_data),          //          .data
		.src1_channel       (rsp_xbar_demux_001_src1_channel),       //          .channel
		.src1_startofpacket (rsp_xbar_demux_001_src1_startofpacket), //          .startofpacket
		.src1_endofpacket   (rsp_xbar_demux_001_src1_endofpacket)    //          .endofpacket
	);

	nios_qsys_rsp_xbar_demux_002 rsp_xbar_demux_002 (
		.clk                (clk_clk),                               //       clk.clk
		.reset              (rst_controller_reset_out_reset),        // clk_reset.reset
		.sink_ready         (id_router_002_src_ready),               //      sink.ready
		.sink_channel       (id_router_002_src_channel),             //          .channel
		.sink_data          (id_router_002_src_data),                //          .data
		.sink_startofpacket (id_router_002_src_startofpacket),       //          .startofpacket
		.sink_endofpacket   (id_router_002_src_endofpacket),         //          .endofpacket
		.sink_valid         (id_router_002_src_valid),               //          .valid
		.src0_ready         (rsp_xbar_demux_002_src0_ready),         //      src0.ready
		.src0_valid         (rsp_xbar_demux_002_src0_valid),         //          .valid
		.src0_data          (rsp_xbar_demux_002_src0_data),          //          .data
		.src0_channel       (rsp_xbar_demux_002_src0_channel),       //          .channel
		.src0_startofpacket (rsp_xbar_demux_002_src0_startofpacket), //          .startofpacket
		.src0_endofpacket   (rsp_xbar_demux_002_src0_endofpacket)    //          .endofpacket
	);

	nios_qsys_rsp_xbar_demux_002 rsp_xbar_demux_003 (
		.clk                (clk_clk),                               //       clk.clk
		.reset              (rst_controller_reset_out_reset),        // clk_reset.reset
		.sink_ready         (id_router_003_src_ready),               //      sink.ready
		.sink_channel       (id_router_003_src_channel),             //          .channel
		.sink_data          (id_router_003_src_data),                //          .data
		.sink_startofpacket (id_router_003_src_startofpacket),       //          .startofpacket
		.sink_endofpacket   (id_router_003_src_endofpacket),         //          .endofpacket
		.sink_valid         (id_router_003_src_valid),               //          .valid
		.src0_ready         (rsp_xbar_demux_003_src0_ready),         //      src0.ready
		.src0_valid         (rsp_xbar_demux_003_src0_valid),         //          .valid
		.src0_data          (rsp_xbar_demux_003_src0_data),          //          .data
		.src0_channel       (rsp_xbar_demux_003_src0_channel),       //          .channel
		.src0_startofpacket (rsp_xbar_demux_003_src0_startofpacket), //          .startofpacket
		.src0_endofpacket   (rsp_xbar_demux_003_src0_endofpacket)    //          .endofpacket
	);

	nios_qsys_rsp_xbar_demux_002 rsp_xbar_demux_004 (
		.clk                (clk_clk),                               //       clk.clk
		.reset              (rst_controller_reset_out_reset),        // clk_reset.reset
		.sink_ready         (id_router_004_src_ready),               //      sink.ready
		.sink_channel       (id_router_004_src_channel),             //          .channel
		.sink_data          (id_router_004_src_data),                //          .data
		.sink_startofpacket (id_router_004_src_startofpacket),       //          .startofpacket
		.sink_endofpacket   (id_router_004_src_endofpacket),         //          .endofpacket
		.sink_valid         (id_router_004_src_valid),               //          .valid
		.src0_ready         (rsp_xbar_demux_004_src0_ready),         //      src0.ready
		.src0_valid         (rsp_xbar_demux_004_src0_valid),         //          .valid
		.src0_data          (rsp_xbar_demux_004_src0_data),          //          .data
		.src0_channel       (rsp_xbar_demux_004_src0_channel),       //          .channel
		.src0_startofpacket (rsp_xbar_demux_004_src0_startofpacket), //          .startofpacket
		.src0_endofpacket   (rsp_xbar_demux_004_src0_endofpacket)    //          .endofpacket
	);

	nios_qsys_rsp_xbar_demux_002 rsp_xbar_demux_005 (
		.clk                (clk_clk),                               //       clk.clk
		.reset              (rst_controller_reset_out_reset),        // clk_reset.reset
		.sink_ready         (id_router_005_src_ready),               //      sink.ready
		.sink_channel       (id_router_005_src_channel),             //          .channel
		.sink_data          (id_router_005_src_data),                //          .data
		.sink_startofpacket (id_router_005_src_startofpacket),       //          .startofpacket
		.sink_endofpacket   (id_router_005_src_endofpacket),         //          .endofpacket
		.sink_valid         (id_router_005_src_valid),               //          .valid
		.src0_ready         (rsp_xbar_demux_005_src0_ready),         //      src0.ready
		.src0_valid         (rsp_xbar_demux_005_src0_valid),         //          .valid
		.src0_data          (rsp_xbar_demux_005_src0_data),          //          .data
		.src0_channel       (rsp_xbar_demux_005_src0_channel),       //          .channel
		.src0_startofpacket (rsp_xbar_demux_005_src0_startofpacket), //          .startofpacket
		.src0_endofpacket   (rsp_xbar_demux_005_src0_endofpacket)    //          .endofpacket
	);

	nios_qsys_rsp_xbar_demux_002 rsp_xbar_demux_006 (
		.clk                (clk_clk),                               //       clk.clk
		.reset              (rst_controller_reset_out_reset),        // clk_reset.reset
		.sink_ready         (id_router_006_src_ready),               //      sink.ready
		.sink_channel       (id_router_006_src_channel),             //          .channel
		.sink_data          (id_router_006_src_data),                //          .data
		.sink_startofpacket (id_router_006_src_startofpacket),       //          .startofpacket
		.sink_endofpacket   (id_router_006_src_endofpacket),         //          .endofpacket
		.sink_valid         (id_router_006_src_valid),               //          .valid
		.src0_ready         (rsp_xbar_demux_006_src0_ready),         //      src0.ready
		.src0_valid         (rsp_xbar_demux_006_src0_valid),         //          .valid
		.src0_data          (rsp_xbar_demux_006_src0_data),          //          .data
		.src0_channel       (rsp_xbar_demux_006_src0_channel),       //          .channel
		.src0_startofpacket (rsp_xbar_demux_006_src0_startofpacket), //          .startofpacket
		.src0_endofpacket   (rsp_xbar_demux_006_src0_endofpacket)    //          .endofpacket
	);

	nios_qsys_rsp_xbar_demux_002 rsp_xbar_demux_007 (
		.clk                (clk_clk),                               //       clk.clk
		.reset              (rst_controller_reset_out_reset),        // clk_reset.reset
		.sink_ready         (id_router_007_src_ready),               //      sink.ready
		.sink_channel       (id_router_007_src_channel),             //          .channel
		.sink_data          (id_router_007_src_data),                //          .data
		.sink_startofpacket (id_router_007_src_startofpacket),       //          .startofpacket
		.sink_endofpacket   (id_router_007_src_endofpacket),         //          .endofpacket
		.sink_valid         (id_router_007_src_valid),               //          .valid
		.src0_ready         (rsp_xbar_demux_007_src0_ready),         //      src0.ready
		.src0_valid         (rsp_xbar_demux_007_src0_valid),         //          .valid
		.src0_data          (rsp_xbar_demux_007_src0_data),          //          .data
		.src0_channel       (rsp_xbar_demux_007_src0_channel),       //          .channel
		.src0_startofpacket (rsp_xbar_demux_007_src0_startofpacket), //          .startofpacket
		.src0_endofpacket   (rsp_xbar_demux_007_src0_endofpacket)    //          .endofpacket
	);

	nios_qsys_rsp_xbar_demux_002 rsp_xbar_demux_008 (
		.clk                (clk_clk),                               //       clk.clk
		.reset              (rst_controller_reset_out_reset),        // clk_reset.reset
		.sink_ready         (id_router_008_src_ready),               //      sink.ready
		.sink_channel       (id_router_008_src_channel),             //          .channel
		.sink_data          (id_router_008_src_data),                //          .data
		.sink_startofpacket (id_router_008_src_startofpacket),       //          .startofpacket
		.sink_endofpacket   (id_router_008_src_endofpacket),         //          .endofpacket
		.sink_valid         (id_router_008_src_valid),               //          .valid
		.src0_ready         (rsp_xbar_demux_008_src0_ready),         //      src0.ready
		.src0_valid         (rsp_xbar_demux_008_src0_valid),         //          .valid
		.src0_data          (rsp_xbar_demux_008_src0_data),          //          .data
		.src0_channel       (rsp_xbar_demux_008_src0_channel),       //          .channel
		.src0_startofpacket (rsp_xbar_demux_008_src0_startofpacket), //          .startofpacket
		.src0_endofpacket   (rsp_xbar_demux_008_src0_endofpacket)    //          .endofpacket
	);

	nios_qsys_rsp_xbar_mux rsp_xbar_mux (
		.clk                 (clk_clk),                               //       clk.clk
		.reset               (rst_controller_reset_out_reset),        // clk_reset.reset
		.src_ready           (rsp_xbar_mux_src_ready),                //       src.ready
		.src_valid           (rsp_xbar_mux_src_valid),                //          .valid
		.src_data            (rsp_xbar_mux_src_data),                 //          .data
		.src_channel         (rsp_xbar_mux_src_channel),              //          .channel
		.src_startofpacket   (rsp_xbar_mux_src_startofpacket),        //          .startofpacket
		.src_endofpacket     (rsp_xbar_mux_src_endofpacket),          //          .endofpacket
		.sink0_ready         (rsp_xbar_demux_src0_ready),             //     sink0.ready
		.sink0_valid         (rsp_xbar_demux_src0_valid),             //          .valid
		.sink0_channel       (rsp_xbar_demux_src0_channel),           //          .channel
		.sink0_data          (rsp_xbar_demux_src0_data),              //          .data
		.sink0_startofpacket (rsp_xbar_demux_src0_startofpacket),     //          .startofpacket
		.sink0_endofpacket   (rsp_xbar_demux_src0_endofpacket),       //          .endofpacket
		.sink1_ready         (rsp_xbar_demux_001_src0_ready),         //     sink1.ready
		.sink1_valid         (rsp_xbar_demux_001_src0_valid),         //          .valid
		.sink1_channel       (rsp_xbar_demux_001_src0_channel),       //          .channel
		.sink1_data          (rsp_xbar_demux_001_src0_data),          //          .data
		.sink1_startofpacket (rsp_xbar_demux_001_src0_startofpacket), //          .startofpacket
		.sink1_endofpacket   (rsp_xbar_demux_001_src0_endofpacket)    //          .endofpacket
	);

	nios_qsys_rsp_xbar_mux_001 rsp_xbar_mux_001 (
		.clk                 (clk_clk),                               //       clk.clk
		.reset               (rst_controller_reset_out_reset),        // clk_reset.reset
		.src_ready           (rsp_xbar_mux_001_src_ready),            //       src.ready
		.src_valid           (rsp_xbar_mux_001_src_valid),            //          .valid
		.src_data            (rsp_xbar_mux_001_src_data),             //          .data
		.src_channel         (rsp_xbar_mux_001_src_channel),          //          .channel
		.src_startofpacket   (rsp_xbar_mux_001_src_startofpacket),    //          .startofpacket
		.src_endofpacket     (rsp_xbar_mux_001_src_endofpacket),      //          .endofpacket
		.sink0_ready         (rsp_xbar_demux_src1_ready),             //     sink0.ready
		.sink0_valid         (rsp_xbar_demux_src1_valid),             //          .valid
		.sink0_channel       (rsp_xbar_demux_src1_channel),           //          .channel
		.sink0_data          (rsp_xbar_demux_src1_data),              //          .data
		.sink0_startofpacket (rsp_xbar_demux_src1_startofpacket),     //          .startofpacket
		.sink0_endofpacket   (rsp_xbar_demux_src1_endofpacket),       //          .endofpacket
		.sink1_ready         (rsp_xbar_demux_001_src1_ready),         //     sink1.ready
		.sink1_valid         (rsp_xbar_demux_001_src1_valid),         //          .valid
		.sink1_channel       (rsp_xbar_demux_001_src1_channel),       //          .channel
		.sink1_data          (rsp_xbar_demux_001_src1_data),          //          .data
		.sink1_startofpacket (rsp_xbar_demux_001_src1_startofpacket), //          .startofpacket
		.sink1_endofpacket   (rsp_xbar_demux_001_src1_endofpacket),   //          .endofpacket
		.sink2_ready         (rsp_xbar_demux_002_src0_ready),         //     sink2.ready
		.sink2_valid         (rsp_xbar_demux_002_src0_valid),         //          .valid
		.sink2_channel       (rsp_xbar_demux_002_src0_channel),       //          .channel
		.sink2_data          (rsp_xbar_demux_002_src0_data),          //          .data
		.sink2_startofpacket (rsp_xbar_demux_002_src0_startofpacket), //          .startofpacket
		.sink2_endofpacket   (rsp_xbar_demux_002_src0_endofpacket),   //          .endofpacket
		.sink3_ready         (rsp_xbar_demux_003_src0_ready),         //     sink3.ready
		.sink3_valid         (rsp_xbar_demux_003_src0_valid),         //          .valid
		.sink3_channel       (rsp_xbar_demux_003_src0_channel),       //          .channel
		.sink3_data          (rsp_xbar_demux_003_src0_data),          //          .data
		.sink3_startofpacket (rsp_xbar_demux_003_src0_startofpacket), //          .startofpacket
		.sink3_endofpacket   (rsp_xbar_demux_003_src0_endofpacket),   //          .endofpacket
		.sink4_ready         (rsp_xbar_demux_004_src0_ready),         //     sink4.ready
		.sink4_valid         (rsp_xbar_demux_004_src0_valid),         //          .valid
		.sink4_channel       (rsp_xbar_demux_004_src0_channel),       //          .channel
		.sink4_data          (rsp_xbar_demux_004_src0_data),          //          .data
		.sink4_startofpacket (rsp_xbar_demux_004_src0_startofpacket), //          .startofpacket
		.sink4_endofpacket   (rsp_xbar_demux_004_src0_endofpacket),   //          .endofpacket
		.sink5_ready         (rsp_xbar_demux_005_src0_ready),         //     sink5.ready
		.sink5_valid         (rsp_xbar_demux_005_src0_valid),         //          .valid
		.sink5_channel       (rsp_xbar_demux_005_src0_channel),       //          .channel
		.sink5_data          (rsp_xbar_demux_005_src0_data),          //          .data
		.sink5_startofpacket (rsp_xbar_demux_005_src0_startofpacket), //          .startofpacket
		.sink5_endofpacket   (rsp_xbar_demux_005_src0_endofpacket),   //          .endofpacket
		.sink6_ready         (rsp_xbar_demux_006_src0_ready),         //     sink6.ready
		.sink6_valid         (rsp_xbar_demux_006_src0_valid),         //          .valid
		.sink6_channel       (rsp_xbar_demux_006_src0_channel),       //          .channel
		.sink6_data          (rsp_xbar_demux_006_src0_data),          //          .data
		.sink6_startofpacket (rsp_xbar_demux_006_src0_startofpacket), //          .startofpacket
		.sink6_endofpacket   (rsp_xbar_demux_006_src0_endofpacket),   //          .endofpacket
		.sink7_ready         (rsp_xbar_demux_007_src0_ready),         //     sink7.ready
		.sink7_valid         (rsp_xbar_demux_007_src0_valid),         //          .valid
		.sink7_channel       (rsp_xbar_demux_007_src0_channel),       //          .channel
		.sink7_data          (rsp_xbar_demux_007_src0_data),          //          .data
		.sink7_startofpacket (rsp_xbar_demux_007_src0_startofpacket), //          .startofpacket
		.sink7_endofpacket   (rsp_xbar_demux_007_src0_endofpacket),   //          .endofpacket
		.sink8_ready         (rsp_xbar_demux_008_src0_ready),         //     sink8.ready
		.sink8_valid         (rsp_xbar_demux_008_src0_valid),         //          .valid
		.sink8_channel       (rsp_xbar_demux_008_src0_channel),       //          .channel
		.sink8_data          (rsp_xbar_demux_008_src0_data),          //          .data
		.sink8_startofpacket (rsp_xbar_demux_008_src0_startofpacket), //          .startofpacket
		.sink8_endofpacket   (rsp_xbar_demux_008_src0_endofpacket)    //          .endofpacket
	);

	altera_merlin_width_adapter #(
		.IN_PKT_ADDR_H                 (60),
		.IN_PKT_ADDR_L                 (36),
		.IN_PKT_DATA_H                 (31),
		.IN_PKT_DATA_L                 (0),
		.IN_PKT_BYTEEN_H               (35),
		.IN_PKT_BYTEEN_L               (32),
		.IN_PKT_BYTE_CNT_H             (68),
		.IN_PKT_BYTE_CNT_L             (66),
		.IN_PKT_TRANS_COMPRESSED_READ  (61),
		.IN_PKT_BURSTWRAP_H            (71),
		.IN_PKT_BURSTWRAP_L            (69),
		.IN_ST_DATA_W                  (82),
		.OUT_PKT_ADDR_H                (42),
		.OUT_PKT_ADDR_L                (18),
		.OUT_PKT_DATA_H                (15),
		.OUT_PKT_DATA_L                (0),
		.OUT_PKT_BYTEEN_H              (17),
		.OUT_PKT_BYTEEN_L              (16),
		.OUT_PKT_BYTE_CNT_H            (50),
		.OUT_PKT_BYTE_CNT_L            (48),
		.OUT_PKT_TRANS_COMPRESSED_READ (43),
		.OUT_ST_DATA_W                 (64),
		.ST_CHANNEL_W                  (9),
		.OPTIMIZE_FOR_RSP              (0)
	) width_adapter (
		.clk               (clk_clk),                            //       clk.clk
		.reset             (rst_controller_reset_out_reset),     // clk_reset.reset
		.in_valid          (cmd_xbar_mux_001_src_valid),         //      sink.valid
		.in_channel        (cmd_xbar_mux_001_src_channel),       //          .channel
		.in_startofpacket  (cmd_xbar_mux_001_src_startofpacket), //          .startofpacket
		.in_endofpacket    (cmd_xbar_mux_001_src_endofpacket),   //          .endofpacket
		.in_ready          (cmd_xbar_mux_001_src_ready),         //          .ready
		.in_data           (cmd_xbar_mux_001_src_data),          //          .data
		.out_endofpacket   (width_adapter_src_endofpacket),      //       src.endofpacket
		.out_data          (width_adapter_src_data),             //          .data
		.out_channel       (width_adapter_src_channel),          //          .channel
		.out_valid         (width_adapter_src_valid),            //          .valid
		.out_ready         (width_adapter_src_ready),            //          .ready
		.out_startofpacket (width_adapter_src_startofpacket)     //          .startofpacket
	);

	altera_merlin_width_adapter #(
		.IN_PKT_ADDR_H                 (42),
		.IN_PKT_ADDR_L                 (18),
		.IN_PKT_DATA_H                 (15),
		.IN_PKT_DATA_L                 (0),
		.IN_PKT_BYTEEN_H               (17),
		.IN_PKT_BYTEEN_L               (16),
		.IN_PKT_BYTE_CNT_H             (50),
		.IN_PKT_BYTE_CNT_L             (48),
		.IN_PKT_TRANS_COMPRESSED_READ  (43),
		.IN_PKT_BURSTWRAP_H            (53),
		.IN_PKT_BURSTWRAP_L            (51),
		.IN_ST_DATA_W                  (64),
		.OUT_PKT_ADDR_H                (60),
		.OUT_PKT_ADDR_L                (36),
		.OUT_PKT_DATA_H                (31),
		.OUT_PKT_DATA_L                (0),
		.OUT_PKT_BYTEEN_H              (35),
		.OUT_PKT_BYTEEN_L              (32),
		.OUT_PKT_BYTE_CNT_H            (68),
		.OUT_PKT_BYTE_CNT_L            (66),
		.OUT_PKT_TRANS_COMPRESSED_READ (61),
		.OUT_ST_DATA_W                 (82),
		.ST_CHANNEL_W                  (9),
		.OPTIMIZE_FOR_RSP              (1)
	) width_adapter_001 (
		.clk               (clk_clk),                             //       clk.clk
		.reset             (rst_controller_reset_out_reset),      // clk_reset.reset
		.in_valid          (id_router_001_src_valid),             //      sink.valid
		.in_channel        (id_router_001_src_channel),           //          .channel
		.in_startofpacket  (id_router_001_src_startofpacket),     //          .startofpacket
		.in_endofpacket    (id_router_001_src_endofpacket),       //          .endofpacket
		.in_ready          (id_router_001_src_ready),             //          .ready
		.in_data           (id_router_001_src_data),              //          .data
		.out_endofpacket   (width_adapter_001_src_endofpacket),   //       src.endofpacket
		.out_data          (width_adapter_001_src_data),          //          .data
		.out_channel       (width_adapter_001_src_channel),       //          .channel
		.out_valid         (width_adapter_001_src_valid),         //          .valid
		.out_ready         (width_adapter_001_src_ready),         //          .ready
		.out_startofpacket (width_adapter_001_src_startofpacket)  //          .startofpacket
	);

	nios_qsys_irq_mapper irq_mapper (
		.clk           (clk_clk),                        //       clk.clk
		.reset         (rst_controller_reset_out_reset), // clk_reset.reset
		.receiver0_irq (irq_mapper_receiver0_irq),       // receiver0.irq
		.receiver1_irq (irq_mapper_receiver1_irq),       // receiver1.irq
		.receiver2_irq (irq_mapper_receiver2_irq),       // receiver2.irq
		.sender_irq    (cpu_nios_d_irq_irq)              //    sender.irq
	);

endmodule
