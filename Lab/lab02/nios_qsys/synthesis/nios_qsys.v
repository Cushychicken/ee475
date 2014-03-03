// nios_qsys.v


`timescale 1 ps / 1 ps
module nios_qsys (
		input  wire [17:0] switches_external_connection_export, // switches_external_connection.export
		input  wire        reset_reset_n,                       //                        reset.reset_n
		input  wire        clk_clk,                             //                          clk.clk
		output wire [17:0] leds_external_connection_export      //     leds_external_connection.export
	);

	wire         nios2_qsys_0_instruction_master_waitrequest;                                                         // nios2_qsys_0_instruction_master_translator:av_waitrequest -> nios2_qsys_0:i_waitrequest
	wire  [14:0] nios2_qsys_0_instruction_master_address;                                                             // nios2_qsys_0:i_address -> nios2_qsys_0_instruction_master_translator:av_address
	wire         nios2_qsys_0_instruction_master_read;                                                                // nios2_qsys_0:i_read -> nios2_qsys_0_instruction_master_translator:av_read
	wire  [31:0] nios2_qsys_0_instruction_master_readdata;                                                            // nios2_qsys_0_instruction_master_translator:av_readdata -> nios2_qsys_0:i_readdata
	wire         nios2_qsys_0_data_master_waitrequest;                                                                // nios2_qsys_0_data_master_translator:av_waitrequest -> nios2_qsys_0:d_waitrequest
	wire  [31:0] nios2_qsys_0_data_master_writedata;                                                                  // nios2_qsys_0:d_writedata -> nios2_qsys_0_data_master_translator:av_writedata
	wire  [14:0] nios2_qsys_0_data_master_address;                                                                    // nios2_qsys_0:d_address -> nios2_qsys_0_data_master_translator:av_address
	wire         nios2_qsys_0_data_master_write;                                                                      // nios2_qsys_0:d_write -> nios2_qsys_0_data_master_translator:av_write
	wire         nios2_qsys_0_data_master_read;                                                                       // nios2_qsys_0:d_read -> nios2_qsys_0_data_master_translator:av_read
	wire  [31:0] nios2_qsys_0_data_master_readdata;                                                                   // nios2_qsys_0_data_master_translator:av_readdata -> nios2_qsys_0:d_readdata
	wire         nios2_qsys_0_data_master_debugaccess;                                                                // nios2_qsys_0:jtag_debug_module_debugaccess_to_roms -> nios2_qsys_0_data_master_translator:av_debugaccess
	wire   [3:0] nios2_qsys_0_data_master_byteenable;                                                                 // nios2_qsys_0:d_byteenable -> nios2_qsys_0_data_master_translator:av_byteenable
	wire  [31:0] nios2_qsys_0_jtag_debug_module_translator_avalon_anti_slave_0_writedata;                             // nios2_qsys_0_jtag_debug_module_translator:av_writedata -> nios2_qsys_0:jtag_debug_module_writedata
	wire   [8:0] nios2_qsys_0_jtag_debug_module_translator_avalon_anti_slave_0_address;                               // nios2_qsys_0_jtag_debug_module_translator:av_address -> nios2_qsys_0:jtag_debug_module_address
	wire         nios2_qsys_0_jtag_debug_module_translator_avalon_anti_slave_0_chipselect;                            // nios2_qsys_0_jtag_debug_module_translator:av_chipselect -> nios2_qsys_0:jtag_debug_module_select
	wire         nios2_qsys_0_jtag_debug_module_translator_avalon_anti_slave_0_write;                                 // nios2_qsys_0_jtag_debug_module_translator:av_write -> nios2_qsys_0:jtag_debug_module_write
	wire  [31:0] nios2_qsys_0_jtag_debug_module_translator_avalon_anti_slave_0_readdata;                              // nios2_qsys_0:jtag_debug_module_readdata -> nios2_qsys_0_jtag_debug_module_translator:av_readdata
	wire         nios2_qsys_0_jtag_debug_module_translator_avalon_anti_slave_0_begintransfer;                         // nios2_qsys_0_jtag_debug_module_translator:av_begintransfer -> nios2_qsys_0:jtag_debug_module_begintransfer
	wire         nios2_qsys_0_jtag_debug_module_translator_avalon_anti_slave_0_debugaccess;                           // nios2_qsys_0_jtag_debug_module_translator:av_debugaccess -> nios2_qsys_0:jtag_debug_module_debugaccess
	wire   [3:0] nios2_qsys_0_jtag_debug_module_translator_avalon_anti_slave_0_byteenable;                            // nios2_qsys_0_jtag_debug_module_translator:av_byteenable -> nios2_qsys_0:jtag_debug_module_byteenable
	wire   [1:0] switches_s1_translator_avalon_anti_slave_0_address;                                                  // switches_s1_translator:av_address -> switches:address
	wire  [31:0] switches_s1_translator_avalon_anti_slave_0_readdata;                                                 // switches:readdata -> switches_s1_translator:av_readdata
	wire  [31:0] leds_s1_translator_avalon_anti_slave_0_writedata;                                                    // leds_s1_translator:av_writedata -> leds:writedata
	wire   [1:0] leds_s1_translator_avalon_anti_slave_0_address;                                                      // leds_s1_translator:av_address -> leds:address
	wire         leds_s1_translator_avalon_anti_slave_0_chipselect;                                                   // leds_s1_translator:av_chipselect -> leds:chipselect
	wire         leds_s1_translator_avalon_anti_slave_0_write;                                                        // leds_s1_translator:av_write -> leds:write_n
	wire  [31:0] leds_s1_translator_avalon_anti_slave_0_readdata;                                                     // leds:readdata -> leds_s1_translator:av_readdata
	wire  [31:0] onchip_memory2_0_s1_translator_avalon_anti_slave_0_writedata;                                        // onchip_memory2_0_s1_translator:av_writedata -> onchip_memory2_0:writedata
	wire  [10:0] onchip_memory2_0_s1_translator_avalon_anti_slave_0_address;                                          // onchip_memory2_0_s1_translator:av_address -> onchip_memory2_0:address
	wire         onchip_memory2_0_s1_translator_avalon_anti_slave_0_chipselect;                                       // onchip_memory2_0_s1_translator:av_chipselect -> onchip_memory2_0:chipselect
	wire         onchip_memory2_0_s1_translator_avalon_anti_slave_0_clken;                                            // onchip_memory2_0_s1_translator:av_clken -> onchip_memory2_0:clken
	wire         onchip_memory2_0_s1_translator_avalon_anti_slave_0_write;                                            // onchip_memory2_0_s1_translator:av_write -> onchip_memory2_0:write
	wire  [31:0] onchip_memory2_0_s1_translator_avalon_anti_slave_0_readdata;                                         // onchip_memory2_0:readdata -> onchip_memory2_0_s1_translator:av_readdata
	wire   [3:0] onchip_memory2_0_s1_translator_avalon_anti_slave_0_byteenable;                                       // onchip_memory2_0_s1_translator:av_byteenable -> onchip_memory2_0:byteenable
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_anti_slave_0_waitrequest;                            // jtag_uart_0:av_waitrequest -> jtag_uart_0_avalon_jtag_slave_translator:av_waitrequest
	wire  [31:0] jtag_uart_0_avalon_jtag_slave_translator_avalon_anti_slave_0_writedata;                              // jtag_uart_0_avalon_jtag_slave_translator:av_writedata -> jtag_uart_0:av_writedata
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_anti_slave_0_address;                                // jtag_uart_0_avalon_jtag_slave_translator:av_address -> jtag_uart_0:av_address
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_anti_slave_0_chipselect;                             // jtag_uart_0_avalon_jtag_slave_translator:av_chipselect -> jtag_uart_0:av_chipselect
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_anti_slave_0_write;                                  // jtag_uart_0_avalon_jtag_slave_translator:av_write -> jtag_uart_0:av_write_n
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_anti_slave_0_read;                                   // jtag_uart_0_avalon_jtag_slave_translator:av_read -> jtag_uart_0:av_read_n
	wire  [31:0] jtag_uart_0_avalon_jtag_slave_translator_avalon_anti_slave_0_readdata;                               // jtag_uart_0:av_readdata -> jtag_uart_0_avalon_jtag_slave_translator:av_readdata
	wire         nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_waitrequest;                    // nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent:av_waitrequest -> nios2_qsys_0_instruction_master_translator:uav_waitrequest
	wire   [2:0] nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_burstcount;                     // nios2_qsys_0_instruction_master_translator:uav_burstcount -> nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent:av_burstcount
	wire  [31:0] nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_writedata;                      // nios2_qsys_0_instruction_master_translator:uav_writedata -> nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent:av_writedata
	wire  [14:0] nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_address;                        // nios2_qsys_0_instruction_master_translator:uav_address -> nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent:av_address
	wire         nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_lock;                           // nios2_qsys_0_instruction_master_translator:uav_lock -> nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent:av_lock
	wire         nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_write;                          // nios2_qsys_0_instruction_master_translator:uav_write -> nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent:av_write
	wire         nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_read;                           // nios2_qsys_0_instruction_master_translator:uav_read -> nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent:av_read
	wire  [31:0] nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_readdata;                       // nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent:av_readdata -> nios2_qsys_0_instruction_master_translator:uav_readdata
	wire         nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_debugaccess;                    // nios2_qsys_0_instruction_master_translator:uav_debugaccess -> nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent:av_debugaccess
	wire   [3:0] nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_byteenable;                     // nios2_qsys_0_instruction_master_translator:uav_byteenable -> nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent:av_byteenable
	wire         nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_readdatavalid;                  // nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent:av_readdatavalid -> nios2_qsys_0_instruction_master_translator:uav_readdatavalid
	wire         nios2_qsys_0_data_master_translator_avalon_universal_master_0_waitrequest;                           // nios2_qsys_0_data_master_translator_avalon_universal_master_0_agent:av_waitrequest -> nios2_qsys_0_data_master_translator:uav_waitrequest
	wire   [2:0] nios2_qsys_0_data_master_translator_avalon_universal_master_0_burstcount;                            // nios2_qsys_0_data_master_translator:uav_burstcount -> nios2_qsys_0_data_master_translator_avalon_universal_master_0_agent:av_burstcount
	wire  [31:0] nios2_qsys_0_data_master_translator_avalon_universal_master_0_writedata;                             // nios2_qsys_0_data_master_translator:uav_writedata -> nios2_qsys_0_data_master_translator_avalon_universal_master_0_agent:av_writedata
	wire  [14:0] nios2_qsys_0_data_master_translator_avalon_universal_master_0_address;                               // nios2_qsys_0_data_master_translator:uav_address -> nios2_qsys_0_data_master_translator_avalon_universal_master_0_agent:av_address
	wire         nios2_qsys_0_data_master_translator_avalon_universal_master_0_lock;                                  // nios2_qsys_0_data_master_translator:uav_lock -> nios2_qsys_0_data_master_translator_avalon_universal_master_0_agent:av_lock
	wire         nios2_qsys_0_data_master_translator_avalon_universal_master_0_write;                                 // nios2_qsys_0_data_master_translator:uav_write -> nios2_qsys_0_data_master_translator_avalon_universal_master_0_agent:av_write
	wire         nios2_qsys_0_data_master_translator_avalon_universal_master_0_read;                                  // nios2_qsys_0_data_master_translator:uav_read -> nios2_qsys_0_data_master_translator_avalon_universal_master_0_agent:av_read
	wire  [31:0] nios2_qsys_0_data_master_translator_avalon_universal_master_0_readdata;                              // nios2_qsys_0_data_master_translator_avalon_universal_master_0_agent:av_readdata -> nios2_qsys_0_data_master_translator:uav_readdata
	wire         nios2_qsys_0_data_master_translator_avalon_universal_master_0_debugaccess;                           // nios2_qsys_0_data_master_translator:uav_debugaccess -> nios2_qsys_0_data_master_translator_avalon_universal_master_0_agent:av_debugaccess
	wire   [3:0] nios2_qsys_0_data_master_translator_avalon_universal_master_0_byteenable;                            // nios2_qsys_0_data_master_translator:uav_byteenable -> nios2_qsys_0_data_master_translator_avalon_universal_master_0_agent:av_byteenable
	wire         nios2_qsys_0_data_master_translator_avalon_universal_master_0_readdatavalid;                         // nios2_qsys_0_data_master_translator_avalon_universal_master_0_agent:av_readdatavalid -> nios2_qsys_0_data_master_translator:uav_readdatavalid
	wire         nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_waitrequest;             // nios2_qsys_0_jtag_debug_module_translator:uav_waitrequest -> nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent:m0_waitrequest
	wire   [2:0] nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_burstcount;              // nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent:m0_burstcount -> nios2_qsys_0_jtag_debug_module_translator:uav_burstcount
	wire  [31:0] nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_writedata;               // nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent:m0_writedata -> nios2_qsys_0_jtag_debug_module_translator:uav_writedata
	wire  [14:0] nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_address;                 // nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent:m0_address -> nios2_qsys_0_jtag_debug_module_translator:uav_address
	wire         nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_write;                   // nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent:m0_write -> nios2_qsys_0_jtag_debug_module_translator:uav_write
	wire         nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_lock;                    // nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent:m0_lock -> nios2_qsys_0_jtag_debug_module_translator:uav_lock
	wire         nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_read;                    // nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent:m0_read -> nios2_qsys_0_jtag_debug_module_translator:uav_read
	wire  [31:0] nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_readdata;                // nios2_qsys_0_jtag_debug_module_translator:uav_readdata -> nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent:m0_readdata
	wire         nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_readdatavalid;           // nios2_qsys_0_jtag_debug_module_translator:uav_readdatavalid -> nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent:m0_readdatavalid
	wire         nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_debugaccess;             // nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent:m0_debugaccess -> nios2_qsys_0_jtag_debug_module_translator:uav_debugaccess
	wire   [3:0] nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_byteenable;              // nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent:m0_byteenable -> nios2_qsys_0_jtag_debug_module_translator:uav_byteenable
	wire         nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_endofpacket;      // nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent:rf_source_endofpacket -> nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:in_endofpacket
	wire         nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_valid;            // nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent:rf_source_valid -> nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:in_valid
	wire         nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_startofpacket;    // nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent:rf_source_startofpacket -> nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:in_startofpacket
	wire  [70:0] nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_data;             // nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent:rf_source_data -> nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:in_data
	wire         nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_ready;            // nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:in_ready -> nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent:rf_source_ready
	wire         nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket;   // nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:out_endofpacket -> nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent:rf_sink_endofpacket
	wire         nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid;         // nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:out_valid -> nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent:rf_sink_valid
	wire         nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket; // nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:out_startofpacket -> nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent:rf_sink_startofpacket
	wire  [70:0] nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data;          // nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:out_data -> nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent:rf_sink_data
	wire         nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready;         // nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent:rf_sink_ready -> nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:out_ready
	wire         nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid;       // nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent:rdata_fifo_src_valid -> nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_valid
	wire  [31:0] nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data;        // nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent:rdata_fifo_src_data -> nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_data
	wire         nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready;       // nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_ready -> nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent:rdata_fifo_src_ready
	wire         switches_s1_translator_avalon_universal_slave_0_agent_m0_waitrequest;                                // switches_s1_translator:uav_waitrequest -> switches_s1_translator_avalon_universal_slave_0_agent:m0_waitrequest
	wire   [2:0] switches_s1_translator_avalon_universal_slave_0_agent_m0_burstcount;                                 // switches_s1_translator_avalon_universal_slave_0_agent:m0_burstcount -> switches_s1_translator:uav_burstcount
	wire  [31:0] switches_s1_translator_avalon_universal_slave_0_agent_m0_writedata;                                  // switches_s1_translator_avalon_universal_slave_0_agent:m0_writedata -> switches_s1_translator:uav_writedata
	wire  [14:0] switches_s1_translator_avalon_universal_slave_0_agent_m0_address;                                    // switches_s1_translator_avalon_universal_slave_0_agent:m0_address -> switches_s1_translator:uav_address
	wire         switches_s1_translator_avalon_universal_slave_0_agent_m0_write;                                      // switches_s1_translator_avalon_universal_slave_0_agent:m0_write -> switches_s1_translator:uav_write
	wire         switches_s1_translator_avalon_universal_slave_0_agent_m0_lock;                                       // switches_s1_translator_avalon_universal_slave_0_agent:m0_lock -> switches_s1_translator:uav_lock
	wire         switches_s1_translator_avalon_universal_slave_0_agent_m0_read;                                       // switches_s1_translator_avalon_universal_slave_0_agent:m0_read -> switches_s1_translator:uav_read
	wire  [31:0] switches_s1_translator_avalon_universal_slave_0_agent_m0_readdata;                                   // switches_s1_translator:uav_readdata -> switches_s1_translator_avalon_universal_slave_0_agent:m0_readdata
	wire         switches_s1_translator_avalon_universal_slave_0_agent_m0_readdatavalid;                              // switches_s1_translator:uav_readdatavalid -> switches_s1_translator_avalon_universal_slave_0_agent:m0_readdatavalid
	wire         switches_s1_translator_avalon_universal_slave_0_agent_m0_debugaccess;                                // switches_s1_translator_avalon_universal_slave_0_agent:m0_debugaccess -> switches_s1_translator:uav_debugaccess
	wire   [3:0] switches_s1_translator_avalon_universal_slave_0_agent_m0_byteenable;                                 // switches_s1_translator_avalon_universal_slave_0_agent:m0_byteenable -> switches_s1_translator:uav_byteenable
	wire         switches_s1_translator_avalon_universal_slave_0_agent_rf_source_endofpacket;                         // switches_s1_translator_avalon_universal_slave_0_agent:rf_source_endofpacket -> switches_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_endofpacket
	wire         switches_s1_translator_avalon_universal_slave_0_agent_rf_source_valid;                               // switches_s1_translator_avalon_universal_slave_0_agent:rf_source_valid -> switches_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_valid
	wire         switches_s1_translator_avalon_universal_slave_0_agent_rf_source_startofpacket;                       // switches_s1_translator_avalon_universal_slave_0_agent:rf_source_startofpacket -> switches_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_startofpacket
	wire  [70:0] switches_s1_translator_avalon_universal_slave_0_agent_rf_source_data;                                // switches_s1_translator_avalon_universal_slave_0_agent:rf_source_data -> switches_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_data
	wire         switches_s1_translator_avalon_universal_slave_0_agent_rf_source_ready;                               // switches_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_ready -> switches_s1_translator_avalon_universal_slave_0_agent:rf_source_ready
	wire         switches_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket;                      // switches_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_endofpacket -> switches_s1_translator_avalon_universal_slave_0_agent:rf_sink_endofpacket
	wire         switches_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid;                            // switches_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_valid -> switches_s1_translator_avalon_universal_slave_0_agent:rf_sink_valid
	wire         switches_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket;                    // switches_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_startofpacket -> switches_s1_translator_avalon_universal_slave_0_agent:rf_sink_startofpacket
	wire  [70:0] switches_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data;                             // switches_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_data -> switches_s1_translator_avalon_universal_slave_0_agent:rf_sink_data
	wire         switches_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready;                            // switches_s1_translator_avalon_universal_slave_0_agent:rf_sink_ready -> switches_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_ready
	wire         switches_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid;                          // switches_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_valid -> switches_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_valid
	wire  [31:0] switches_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data;                           // switches_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_data -> switches_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_data
	wire         switches_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready;                          // switches_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_ready -> switches_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_ready
	wire         leds_s1_translator_avalon_universal_slave_0_agent_m0_waitrequest;                                    // leds_s1_translator:uav_waitrequest -> leds_s1_translator_avalon_universal_slave_0_agent:m0_waitrequest
	wire   [2:0] leds_s1_translator_avalon_universal_slave_0_agent_m0_burstcount;                                     // leds_s1_translator_avalon_universal_slave_0_agent:m0_burstcount -> leds_s1_translator:uav_burstcount
	wire  [31:0] leds_s1_translator_avalon_universal_slave_0_agent_m0_writedata;                                      // leds_s1_translator_avalon_universal_slave_0_agent:m0_writedata -> leds_s1_translator:uav_writedata
	wire  [14:0] leds_s1_translator_avalon_universal_slave_0_agent_m0_address;                                        // leds_s1_translator_avalon_universal_slave_0_agent:m0_address -> leds_s1_translator:uav_address
	wire         leds_s1_translator_avalon_universal_slave_0_agent_m0_write;                                          // leds_s1_translator_avalon_universal_slave_0_agent:m0_write -> leds_s1_translator:uav_write
	wire         leds_s1_translator_avalon_universal_slave_0_agent_m0_lock;                                           // leds_s1_translator_avalon_universal_slave_0_agent:m0_lock -> leds_s1_translator:uav_lock
	wire         leds_s1_translator_avalon_universal_slave_0_agent_m0_read;                                           // leds_s1_translator_avalon_universal_slave_0_agent:m0_read -> leds_s1_translator:uav_read
	wire  [31:0] leds_s1_translator_avalon_universal_slave_0_agent_m0_readdata;                                       // leds_s1_translator:uav_readdata -> leds_s1_translator_avalon_universal_slave_0_agent:m0_readdata
	wire         leds_s1_translator_avalon_universal_slave_0_agent_m0_readdatavalid;                                  // leds_s1_translator:uav_readdatavalid -> leds_s1_translator_avalon_universal_slave_0_agent:m0_readdatavalid
	wire         leds_s1_translator_avalon_universal_slave_0_agent_m0_debugaccess;                                    // leds_s1_translator_avalon_universal_slave_0_agent:m0_debugaccess -> leds_s1_translator:uav_debugaccess
	wire   [3:0] leds_s1_translator_avalon_universal_slave_0_agent_m0_byteenable;                                     // leds_s1_translator_avalon_universal_slave_0_agent:m0_byteenable -> leds_s1_translator:uav_byteenable
	wire         leds_s1_translator_avalon_universal_slave_0_agent_rf_source_endofpacket;                             // leds_s1_translator_avalon_universal_slave_0_agent:rf_source_endofpacket -> leds_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_endofpacket
	wire         leds_s1_translator_avalon_universal_slave_0_agent_rf_source_valid;                                   // leds_s1_translator_avalon_universal_slave_0_agent:rf_source_valid -> leds_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_valid
	wire         leds_s1_translator_avalon_universal_slave_0_agent_rf_source_startofpacket;                           // leds_s1_translator_avalon_universal_slave_0_agent:rf_source_startofpacket -> leds_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_startofpacket
	wire  [70:0] leds_s1_translator_avalon_universal_slave_0_agent_rf_source_data;                                    // leds_s1_translator_avalon_universal_slave_0_agent:rf_source_data -> leds_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_data
	wire         leds_s1_translator_avalon_universal_slave_0_agent_rf_source_ready;                                   // leds_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_ready -> leds_s1_translator_avalon_universal_slave_0_agent:rf_source_ready
	wire         leds_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket;                          // leds_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_endofpacket -> leds_s1_translator_avalon_universal_slave_0_agent:rf_sink_endofpacket
	wire         leds_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid;                                // leds_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_valid -> leds_s1_translator_avalon_universal_slave_0_agent:rf_sink_valid
	wire         leds_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket;                        // leds_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_startofpacket -> leds_s1_translator_avalon_universal_slave_0_agent:rf_sink_startofpacket
	wire  [70:0] leds_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data;                                 // leds_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_data -> leds_s1_translator_avalon_universal_slave_0_agent:rf_sink_data
	wire         leds_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready;                                // leds_s1_translator_avalon_universal_slave_0_agent:rf_sink_ready -> leds_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_ready
	wire         leds_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid;                              // leds_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_valid -> leds_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_valid
	wire  [31:0] leds_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data;                               // leds_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_data -> leds_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_data
	wire         leds_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready;                              // leds_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_ready -> leds_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_ready
	wire         onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_m0_waitrequest;                        // onchip_memory2_0_s1_translator:uav_waitrequest -> onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent:m0_waitrequest
	wire   [2:0] onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_m0_burstcount;                         // onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent:m0_burstcount -> onchip_memory2_0_s1_translator:uav_burstcount
	wire  [31:0] onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_m0_writedata;                          // onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent:m0_writedata -> onchip_memory2_0_s1_translator:uav_writedata
	wire  [14:0] onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_m0_address;                            // onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent:m0_address -> onchip_memory2_0_s1_translator:uav_address
	wire         onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_m0_write;                              // onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent:m0_write -> onchip_memory2_0_s1_translator:uav_write
	wire         onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_m0_lock;                               // onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent:m0_lock -> onchip_memory2_0_s1_translator:uav_lock
	wire         onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_m0_read;                               // onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent:m0_read -> onchip_memory2_0_s1_translator:uav_read
	wire  [31:0] onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_m0_readdata;                           // onchip_memory2_0_s1_translator:uav_readdata -> onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent:m0_readdata
	wire         onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_m0_readdatavalid;                      // onchip_memory2_0_s1_translator:uav_readdatavalid -> onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent:m0_readdatavalid
	wire         onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_m0_debugaccess;                        // onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent:m0_debugaccess -> onchip_memory2_0_s1_translator:uav_debugaccess
	wire   [3:0] onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_m0_byteenable;                         // onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent:m0_byteenable -> onchip_memory2_0_s1_translator:uav_byteenable
	wire         onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rf_source_endofpacket;                 // onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent:rf_source_endofpacket -> onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_endofpacket
	wire         onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rf_source_valid;                       // onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent:rf_source_valid -> onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_valid
	wire         onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rf_source_startofpacket;               // onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent:rf_source_startofpacket -> onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_startofpacket
	wire  [70:0] onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rf_source_data;                        // onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent:rf_source_data -> onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_data
	wire         onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rf_source_ready;                       // onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:in_ready -> onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent:rf_source_ready
	wire         onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket;              // onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_endofpacket -> onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent:rf_sink_endofpacket
	wire         onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid;                    // onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_valid -> onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent:rf_sink_valid
	wire         onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket;            // onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_startofpacket -> onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent:rf_sink_startofpacket
	wire  [70:0] onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data;                     // onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_data -> onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent:rf_sink_data
	wire         onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready;                    // onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent:rf_sink_ready -> onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:out_ready
	wire         onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid;                  // onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_valid -> onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_valid
	wire  [31:0] onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data;                   // onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_data -> onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_data
	wire         onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready;                  // onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_ready -> onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent:rdata_fifo_src_ready
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_waitrequest;              // jtag_uart_0_avalon_jtag_slave_translator:uav_waitrequest -> jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:m0_waitrequest
	wire   [2:0] jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_burstcount;               // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:m0_burstcount -> jtag_uart_0_avalon_jtag_slave_translator:uav_burstcount
	wire  [31:0] jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_writedata;                // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:m0_writedata -> jtag_uart_0_avalon_jtag_slave_translator:uav_writedata
	wire  [14:0] jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_address;                  // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:m0_address -> jtag_uart_0_avalon_jtag_slave_translator:uav_address
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_write;                    // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:m0_write -> jtag_uart_0_avalon_jtag_slave_translator:uav_write
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_lock;                     // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:m0_lock -> jtag_uart_0_avalon_jtag_slave_translator:uav_lock
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_read;                     // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:m0_read -> jtag_uart_0_avalon_jtag_slave_translator:uav_read
	wire  [31:0] jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_readdata;                 // jtag_uart_0_avalon_jtag_slave_translator:uav_readdata -> jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:m0_readdata
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_readdatavalid;            // jtag_uart_0_avalon_jtag_slave_translator:uav_readdatavalid -> jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:m0_readdatavalid
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_debugaccess;              // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:m0_debugaccess -> jtag_uart_0_avalon_jtag_slave_translator:uav_debugaccess
	wire   [3:0] jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_m0_byteenable;               // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:m0_byteenable -> jtag_uart_0_avalon_jtag_slave_translator:uav_byteenable
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_endofpacket;       // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rf_source_endofpacket -> jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:in_endofpacket
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_valid;             // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rf_source_valid -> jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:in_valid
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_startofpacket;     // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rf_source_startofpacket -> jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:in_startofpacket
	wire  [70:0] jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_data;              // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rf_source_data -> jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:in_data
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rf_source_ready;             // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:in_ready -> jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rf_source_ready
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket;    // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:out_endofpacket -> jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rf_sink_endofpacket
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid;          // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:out_valid -> jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rf_sink_valid
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket;  // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:out_startofpacket -> jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rf_sink_startofpacket
	wire  [70:0] jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data;           // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:out_data -> jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rf_sink_data
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready;          // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rf_sink_ready -> jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:out_ready
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid;        // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rdata_fifo_src_valid -> jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_valid
	wire  [31:0] jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data;         // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rdata_fifo_src_data -> jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_data
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready;        // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rdata_fifo_sink_ready -> jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rdata_fifo_src_ready
	wire         nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent_cp_endofpacket;           // nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent:cp_endofpacket -> addr_router:sink_endofpacket
	wire         nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent_cp_valid;                 // nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent:cp_valid -> addr_router:sink_valid
	wire         nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent_cp_startofpacket;         // nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent:cp_startofpacket -> addr_router:sink_startofpacket
	wire  [69:0] nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent_cp_data;                  // nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent:cp_data -> addr_router:sink_data
	wire         nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent_cp_ready;                 // addr_router:sink_ready -> nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent:cp_ready
	wire         nios2_qsys_0_data_master_translator_avalon_universal_master_0_agent_cp_endofpacket;                  // nios2_qsys_0_data_master_translator_avalon_universal_master_0_agent:cp_endofpacket -> addr_router_001:sink_endofpacket
	wire         nios2_qsys_0_data_master_translator_avalon_universal_master_0_agent_cp_valid;                        // nios2_qsys_0_data_master_translator_avalon_universal_master_0_agent:cp_valid -> addr_router_001:sink_valid
	wire         nios2_qsys_0_data_master_translator_avalon_universal_master_0_agent_cp_startofpacket;                // nios2_qsys_0_data_master_translator_avalon_universal_master_0_agent:cp_startofpacket -> addr_router_001:sink_startofpacket
	wire  [69:0] nios2_qsys_0_data_master_translator_avalon_universal_master_0_agent_cp_data;                         // nios2_qsys_0_data_master_translator_avalon_universal_master_0_agent:cp_data -> addr_router_001:sink_data
	wire         nios2_qsys_0_data_master_translator_avalon_universal_master_0_agent_cp_ready;                        // addr_router_001:sink_ready -> nios2_qsys_0_data_master_translator_avalon_universal_master_0_agent:cp_ready
	wire         nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_endofpacket;             // nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent:rp_endofpacket -> id_router:sink_endofpacket
	wire         nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_valid;                   // nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent:rp_valid -> id_router:sink_valid
	wire         nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_startofpacket;           // nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent:rp_startofpacket -> id_router:sink_startofpacket
	wire  [69:0] nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_data;                    // nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent:rp_data -> id_router:sink_data
	wire         nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_ready;                   // id_router:sink_ready -> nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent:rp_ready
	wire         switches_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket;                                // switches_s1_translator_avalon_universal_slave_0_agent:rp_endofpacket -> id_router_001:sink_endofpacket
	wire         switches_s1_translator_avalon_universal_slave_0_agent_rp_valid;                                      // switches_s1_translator_avalon_universal_slave_0_agent:rp_valid -> id_router_001:sink_valid
	wire         switches_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket;                              // switches_s1_translator_avalon_universal_slave_0_agent:rp_startofpacket -> id_router_001:sink_startofpacket
	wire  [69:0] switches_s1_translator_avalon_universal_slave_0_agent_rp_data;                                       // switches_s1_translator_avalon_universal_slave_0_agent:rp_data -> id_router_001:sink_data
	wire         switches_s1_translator_avalon_universal_slave_0_agent_rp_ready;                                      // id_router_001:sink_ready -> switches_s1_translator_avalon_universal_slave_0_agent:rp_ready
	wire         leds_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket;                                    // leds_s1_translator_avalon_universal_slave_0_agent:rp_endofpacket -> id_router_002:sink_endofpacket
	wire         leds_s1_translator_avalon_universal_slave_0_agent_rp_valid;                                          // leds_s1_translator_avalon_universal_slave_0_agent:rp_valid -> id_router_002:sink_valid
	wire         leds_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket;                                  // leds_s1_translator_avalon_universal_slave_0_agent:rp_startofpacket -> id_router_002:sink_startofpacket
	wire  [69:0] leds_s1_translator_avalon_universal_slave_0_agent_rp_data;                                           // leds_s1_translator_avalon_universal_slave_0_agent:rp_data -> id_router_002:sink_data
	wire         leds_s1_translator_avalon_universal_slave_0_agent_rp_ready;                                          // id_router_002:sink_ready -> leds_s1_translator_avalon_universal_slave_0_agent:rp_ready
	wire         onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket;                        // onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent:rp_endofpacket -> id_router_003:sink_endofpacket
	wire         onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rp_valid;                              // onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent:rp_valid -> id_router_003:sink_valid
	wire         onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket;                      // onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent:rp_startofpacket -> id_router_003:sink_startofpacket
	wire  [69:0] onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rp_data;                               // onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent:rp_data -> id_router_003:sink_data
	wire         onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rp_ready;                              // id_router_003:sink_ready -> onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent:rp_ready
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_endofpacket;              // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rp_endofpacket -> id_router_004:sink_endofpacket
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_valid;                    // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rp_valid -> id_router_004:sink_valid
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_startofpacket;            // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rp_startofpacket -> id_router_004:sink_startofpacket
	wire  [69:0] jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_data;                     // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rp_data -> id_router_004:sink_data
	wire         jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rp_ready;                    // id_router_004:sink_ready -> jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:rp_ready
	wire         addr_router_src_endofpacket;                                                                         // addr_router:src_endofpacket -> limiter:cmd_sink_endofpacket
	wire         addr_router_src_valid;                                                                               // addr_router:src_valid -> limiter:cmd_sink_valid
	wire         addr_router_src_startofpacket;                                                                       // addr_router:src_startofpacket -> limiter:cmd_sink_startofpacket
	wire  [69:0] addr_router_src_data;                                                                                // addr_router:src_data -> limiter:cmd_sink_data
	wire   [4:0] addr_router_src_channel;                                                                             // addr_router:src_channel -> limiter:cmd_sink_channel
	wire         addr_router_src_ready;                                                                               // limiter:cmd_sink_ready -> addr_router:src_ready
	wire         limiter_rsp_src_endofpacket;                                                                         // limiter:rsp_src_endofpacket -> nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent:rp_endofpacket
	wire         limiter_rsp_src_valid;                                                                               // limiter:rsp_src_valid -> nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent:rp_valid
	wire         limiter_rsp_src_startofpacket;                                                                       // limiter:rsp_src_startofpacket -> nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent:rp_startofpacket
	wire  [69:0] limiter_rsp_src_data;                                                                                // limiter:rsp_src_data -> nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent:rp_data
	wire   [4:0] limiter_rsp_src_channel;                                                                             // limiter:rsp_src_channel -> nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent:rp_channel
	wire         limiter_rsp_src_ready;                                                                               // nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent:rp_ready -> limiter:rsp_src_ready
	wire         addr_router_001_src_endofpacket;                                                                     // addr_router_001:src_endofpacket -> limiter_001:cmd_sink_endofpacket
	wire         addr_router_001_src_valid;                                                                           // addr_router_001:src_valid -> limiter_001:cmd_sink_valid
	wire         addr_router_001_src_startofpacket;                                                                   // addr_router_001:src_startofpacket -> limiter_001:cmd_sink_startofpacket
	wire  [69:0] addr_router_001_src_data;                                                                            // addr_router_001:src_data -> limiter_001:cmd_sink_data
	wire   [4:0] addr_router_001_src_channel;                                                                         // addr_router_001:src_channel -> limiter_001:cmd_sink_channel
	wire         addr_router_001_src_ready;                                                                           // limiter_001:cmd_sink_ready -> addr_router_001:src_ready
	wire         limiter_001_rsp_src_endofpacket;                                                                     // limiter_001:rsp_src_endofpacket -> nios2_qsys_0_data_master_translator_avalon_universal_master_0_agent:rp_endofpacket
	wire         limiter_001_rsp_src_valid;                                                                           // limiter_001:rsp_src_valid -> nios2_qsys_0_data_master_translator_avalon_universal_master_0_agent:rp_valid
	wire         limiter_001_rsp_src_startofpacket;                                                                   // limiter_001:rsp_src_startofpacket -> nios2_qsys_0_data_master_translator_avalon_universal_master_0_agent:rp_startofpacket
	wire  [69:0] limiter_001_rsp_src_data;                                                                            // limiter_001:rsp_src_data -> nios2_qsys_0_data_master_translator_avalon_universal_master_0_agent:rp_data
	wire   [4:0] limiter_001_rsp_src_channel;                                                                         // limiter_001:rsp_src_channel -> nios2_qsys_0_data_master_translator_avalon_universal_master_0_agent:rp_channel
	wire         limiter_001_rsp_src_ready;                                                                           // nios2_qsys_0_data_master_translator_avalon_universal_master_0_agent:rp_ready -> limiter_001:rsp_src_ready
	wire         rst_controller_reset_out_reset;                                                                      // rst_controller:reset_out -> [addr_router:reset, addr_router_001:reset, cmd_xbar_demux:reset, cmd_xbar_demux_001:reset, cmd_xbar_mux:reset, cmd_xbar_mux_001:reset, cmd_xbar_mux_002:reset, cmd_xbar_mux_003:reset, id_router:reset, id_router_001:reset, id_router_002:reset, id_router_003:reset, id_router_004:reset, irq_mapper:reset, jtag_uart_0:rst_n, jtag_uart_0_avalon_jtag_slave_translator:reset, jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:reset, jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent_rsp_fifo:reset, leds:reset_n, leds_s1_translator:reset, leds_s1_translator_avalon_universal_slave_0_agent:reset, leds_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:reset, limiter:reset, limiter_001:reset, nios2_qsys_0:reset_n, nios2_qsys_0_data_master_translator:reset, nios2_qsys_0_data_master_translator_avalon_universal_master_0_agent:reset, nios2_qsys_0_instruction_master_translator:reset, nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent:reset, nios2_qsys_0_jtag_debug_module_translator:reset, nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent:reset, nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo:reset, onchip_memory2_0:reset, onchip_memory2_0_s1_translator:reset, onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent:reset, onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:reset, rsp_xbar_demux:reset, rsp_xbar_demux_001:reset, rsp_xbar_demux_002:reset, rsp_xbar_demux_003:reset, rsp_xbar_demux_004:reset, rsp_xbar_mux:reset, rsp_xbar_mux_001:reset, switches:reset_n, switches_s1_translator:reset, switches_s1_translator_avalon_universal_slave_0_agent:reset, switches_s1_translator_avalon_universal_slave_0_agent_rsp_fifo:reset]
	wire         cmd_xbar_demux_src0_endofpacket;                                                                     // cmd_xbar_demux:src0_endofpacket -> cmd_xbar_mux:sink0_endofpacket
	wire         cmd_xbar_demux_src0_valid;                                                                           // cmd_xbar_demux:src0_valid -> cmd_xbar_mux:sink0_valid
	wire         cmd_xbar_demux_src0_startofpacket;                                                                   // cmd_xbar_demux:src0_startofpacket -> cmd_xbar_mux:sink0_startofpacket
	wire  [69:0] cmd_xbar_demux_src0_data;                                                                            // cmd_xbar_demux:src0_data -> cmd_xbar_mux:sink0_data
	wire   [4:0] cmd_xbar_demux_src0_channel;                                                                         // cmd_xbar_demux:src0_channel -> cmd_xbar_mux:sink0_channel
	wire         cmd_xbar_demux_src0_ready;                                                                           // cmd_xbar_mux:sink0_ready -> cmd_xbar_demux:src0_ready
	wire         cmd_xbar_demux_src1_endofpacket;                                                                     // cmd_xbar_demux:src1_endofpacket -> cmd_xbar_mux_001:sink0_endofpacket
	wire         cmd_xbar_demux_src1_valid;                                                                           // cmd_xbar_demux:src1_valid -> cmd_xbar_mux_001:sink0_valid
	wire         cmd_xbar_demux_src1_startofpacket;                                                                   // cmd_xbar_demux:src1_startofpacket -> cmd_xbar_mux_001:sink0_startofpacket
	wire  [69:0] cmd_xbar_demux_src1_data;                                                                            // cmd_xbar_demux:src1_data -> cmd_xbar_mux_001:sink0_data
	wire   [4:0] cmd_xbar_demux_src1_channel;                                                                         // cmd_xbar_demux:src1_channel -> cmd_xbar_mux_001:sink0_channel
	wire         cmd_xbar_demux_src1_ready;                                                                           // cmd_xbar_mux_001:sink0_ready -> cmd_xbar_demux:src1_ready
	wire         cmd_xbar_demux_src2_endofpacket;                                                                     // cmd_xbar_demux:src2_endofpacket -> cmd_xbar_mux_002:sink0_endofpacket
	wire         cmd_xbar_demux_src2_valid;                                                                           // cmd_xbar_demux:src2_valid -> cmd_xbar_mux_002:sink0_valid
	wire         cmd_xbar_demux_src2_startofpacket;                                                                   // cmd_xbar_demux:src2_startofpacket -> cmd_xbar_mux_002:sink0_startofpacket
	wire  [69:0] cmd_xbar_demux_src2_data;                                                                            // cmd_xbar_demux:src2_data -> cmd_xbar_mux_002:sink0_data
	wire   [4:0] cmd_xbar_demux_src2_channel;                                                                         // cmd_xbar_demux:src2_channel -> cmd_xbar_mux_002:sink0_channel
	wire         cmd_xbar_demux_src2_ready;                                                                           // cmd_xbar_mux_002:sink0_ready -> cmd_xbar_demux:src2_ready
	wire         cmd_xbar_demux_src3_endofpacket;                                                                     // cmd_xbar_demux:src3_endofpacket -> cmd_xbar_mux_003:sink0_endofpacket
	wire         cmd_xbar_demux_src3_valid;                                                                           // cmd_xbar_demux:src3_valid -> cmd_xbar_mux_003:sink0_valid
	wire         cmd_xbar_demux_src3_startofpacket;                                                                   // cmd_xbar_demux:src3_startofpacket -> cmd_xbar_mux_003:sink0_startofpacket
	wire  [69:0] cmd_xbar_demux_src3_data;                                                                            // cmd_xbar_demux:src3_data -> cmd_xbar_mux_003:sink0_data
	wire   [4:0] cmd_xbar_demux_src3_channel;                                                                         // cmd_xbar_demux:src3_channel -> cmd_xbar_mux_003:sink0_channel
	wire         cmd_xbar_demux_src3_ready;                                                                           // cmd_xbar_mux_003:sink0_ready -> cmd_xbar_demux:src3_ready
	wire         cmd_xbar_demux_001_src0_endofpacket;                                                                 // cmd_xbar_demux_001:src0_endofpacket -> cmd_xbar_mux:sink1_endofpacket
	wire         cmd_xbar_demux_001_src0_valid;                                                                       // cmd_xbar_demux_001:src0_valid -> cmd_xbar_mux:sink1_valid
	wire         cmd_xbar_demux_001_src0_startofpacket;                                                               // cmd_xbar_demux_001:src0_startofpacket -> cmd_xbar_mux:sink1_startofpacket
	wire  [69:0] cmd_xbar_demux_001_src0_data;                                                                        // cmd_xbar_demux_001:src0_data -> cmd_xbar_mux:sink1_data
	wire   [4:0] cmd_xbar_demux_001_src0_channel;                                                                     // cmd_xbar_demux_001:src0_channel -> cmd_xbar_mux:sink1_channel
	wire         cmd_xbar_demux_001_src0_ready;                                                                       // cmd_xbar_mux:sink1_ready -> cmd_xbar_demux_001:src0_ready
	wire         cmd_xbar_demux_001_src1_endofpacket;                                                                 // cmd_xbar_demux_001:src1_endofpacket -> cmd_xbar_mux_001:sink1_endofpacket
	wire         cmd_xbar_demux_001_src1_valid;                                                                       // cmd_xbar_demux_001:src1_valid -> cmd_xbar_mux_001:sink1_valid
	wire         cmd_xbar_demux_001_src1_startofpacket;                                                               // cmd_xbar_demux_001:src1_startofpacket -> cmd_xbar_mux_001:sink1_startofpacket
	wire  [69:0] cmd_xbar_demux_001_src1_data;                                                                        // cmd_xbar_demux_001:src1_data -> cmd_xbar_mux_001:sink1_data
	wire   [4:0] cmd_xbar_demux_001_src1_channel;                                                                     // cmd_xbar_demux_001:src1_channel -> cmd_xbar_mux_001:sink1_channel
	wire         cmd_xbar_demux_001_src1_ready;                                                                       // cmd_xbar_mux_001:sink1_ready -> cmd_xbar_demux_001:src1_ready
	wire         cmd_xbar_demux_001_src2_endofpacket;                                                                 // cmd_xbar_demux_001:src2_endofpacket -> cmd_xbar_mux_002:sink1_endofpacket
	wire         cmd_xbar_demux_001_src2_valid;                                                                       // cmd_xbar_demux_001:src2_valid -> cmd_xbar_mux_002:sink1_valid
	wire         cmd_xbar_demux_001_src2_startofpacket;                                                               // cmd_xbar_demux_001:src2_startofpacket -> cmd_xbar_mux_002:sink1_startofpacket
	wire  [69:0] cmd_xbar_demux_001_src2_data;                                                                        // cmd_xbar_demux_001:src2_data -> cmd_xbar_mux_002:sink1_data
	wire   [4:0] cmd_xbar_demux_001_src2_channel;                                                                     // cmd_xbar_demux_001:src2_channel -> cmd_xbar_mux_002:sink1_channel
	wire         cmd_xbar_demux_001_src2_ready;                                                                       // cmd_xbar_mux_002:sink1_ready -> cmd_xbar_demux_001:src2_ready
	wire         cmd_xbar_demux_001_src3_endofpacket;                                                                 // cmd_xbar_demux_001:src3_endofpacket -> cmd_xbar_mux_003:sink1_endofpacket
	wire         cmd_xbar_demux_001_src3_valid;                                                                       // cmd_xbar_demux_001:src3_valid -> cmd_xbar_mux_003:sink1_valid
	wire         cmd_xbar_demux_001_src3_startofpacket;                                                               // cmd_xbar_demux_001:src3_startofpacket -> cmd_xbar_mux_003:sink1_startofpacket
	wire  [69:0] cmd_xbar_demux_001_src3_data;                                                                        // cmd_xbar_demux_001:src3_data -> cmd_xbar_mux_003:sink1_data
	wire   [4:0] cmd_xbar_demux_001_src3_channel;                                                                     // cmd_xbar_demux_001:src3_channel -> cmd_xbar_mux_003:sink1_channel
	wire         cmd_xbar_demux_001_src3_ready;                                                                       // cmd_xbar_mux_003:sink1_ready -> cmd_xbar_demux_001:src3_ready
	wire         cmd_xbar_demux_001_src4_endofpacket;                                                                 // cmd_xbar_demux_001:src4_endofpacket -> jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:cp_endofpacket
	wire         cmd_xbar_demux_001_src4_valid;                                                                       // cmd_xbar_demux_001:src4_valid -> jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:cp_valid
	wire         cmd_xbar_demux_001_src4_startofpacket;                                                               // cmd_xbar_demux_001:src4_startofpacket -> jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:cp_startofpacket
	wire  [69:0] cmd_xbar_demux_001_src4_data;                                                                        // cmd_xbar_demux_001:src4_data -> jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:cp_data
	wire   [4:0] cmd_xbar_demux_001_src4_channel;                                                                     // cmd_xbar_demux_001:src4_channel -> jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:cp_channel
	wire         rsp_xbar_demux_src0_endofpacket;                                                                     // rsp_xbar_demux:src0_endofpacket -> rsp_xbar_mux:sink0_endofpacket
	wire         rsp_xbar_demux_src0_valid;                                                                           // rsp_xbar_demux:src0_valid -> rsp_xbar_mux:sink0_valid
	wire         rsp_xbar_demux_src0_startofpacket;                                                                   // rsp_xbar_demux:src0_startofpacket -> rsp_xbar_mux:sink0_startofpacket
	wire  [69:0] rsp_xbar_demux_src0_data;                                                                            // rsp_xbar_demux:src0_data -> rsp_xbar_mux:sink0_data
	wire   [4:0] rsp_xbar_demux_src0_channel;                                                                         // rsp_xbar_demux:src0_channel -> rsp_xbar_mux:sink0_channel
	wire         rsp_xbar_demux_src0_ready;                                                                           // rsp_xbar_mux:sink0_ready -> rsp_xbar_demux:src0_ready
	wire         rsp_xbar_demux_src1_endofpacket;                                                                     // rsp_xbar_demux:src1_endofpacket -> rsp_xbar_mux_001:sink0_endofpacket
	wire         rsp_xbar_demux_src1_valid;                                                                           // rsp_xbar_demux:src1_valid -> rsp_xbar_mux_001:sink0_valid
	wire         rsp_xbar_demux_src1_startofpacket;                                                                   // rsp_xbar_demux:src1_startofpacket -> rsp_xbar_mux_001:sink0_startofpacket
	wire  [69:0] rsp_xbar_demux_src1_data;                                                                            // rsp_xbar_demux:src1_data -> rsp_xbar_mux_001:sink0_data
	wire   [4:0] rsp_xbar_demux_src1_channel;                                                                         // rsp_xbar_demux:src1_channel -> rsp_xbar_mux_001:sink0_channel
	wire         rsp_xbar_demux_src1_ready;                                                                           // rsp_xbar_mux_001:sink0_ready -> rsp_xbar_demux:src1_ready
	wire         rsp_xbar_demux_001_src0_endofpacket;                                                                 // rsp_xbar_demux_001:src0_endofpacket -> rsp_xbar_mux:sink1_endofpacket
	wire         rsp_xbar_demux_001_src0_valid;                                                                       // rsp_xbar_demux_001:src0_valid -> rsp_xbar_mux:sink1_valid
	wire         rsp_xbar_demux_001_src0_startofpacket;                                                               // rsp_xbar_demux_001:src0_startofpacket -> rsp_xbar_mux:sink1_startofpacket
	wire  [69:0] rsp_xbar_demux_001_src0_data;                                                                        // rsp_xbar_demux_001:src0_data -> rsp_xbar_mux:sink1_data
	wire   [4:0] rsp_xbar_demux_001_src0_channel;                                                                     // rsp_xbar_demux_001:src0_channel -> rsp_xbar_mux:sink1_channel
	wire         rsp_xbar_demux_001_src0_ready;                                                                       // rsp_xbar_mux:sink1_ready -> rsp_xbar_demux_001:src0_ready
	wire         rsp_xbar_demux_001_src1_endofpacket;                                                                 // rsp_xbar_demux_001:src1_endofpacket -> rsp_xbar_mux_001:sink1_endofpacket
	wire         rsp_xbar_demux_001_src1_valid;                                                                       // rsp_xbar_demux_001:src1_valid -> rsp_xbar_mux_001:sink1_valid
	wire         rsp_xbar_demux_001_src1_startofpacket;                                                               // rsp_xbar_demux_001:src1_startofpacket -> rsp_xbar_mux_001:sink1_startofpacket
	wire  [69:0] rsp_xbar_demux_001_src1_data;                                                                        // rsp_xbar_demux_001:src1_data -> rsp_xbar_mux_001:sink1_data
	wire   [4:0] rsp_xbar_demux_001_src1_channel;                                                                     // rsp_xbar_demux_001:src1_channel -> rsp_xbar_mux_001:sink1_channel
	wire         rsp_xbar_demux_001_src1_ready;                                                                       // rsp_xbar_mux_001:sink1_ready -> rsp_xbar_demux_001:src1_ready
	wire         rsp_xbar_demux_002_src0_endofpacket;                                                                 // rsp_xbar_demux_002:src0_endofpacket -> rsp_xbar_mux:sink2_endofpacket
	wire         rsp_xbar_demux_002_src0_valid;                                                                       // rsp_xbar_demux_002:src0_valid -> rsp_xbar_mux:sink2_valid
	wire         rsp_xbar_demux_002_src0_startofpacket;                                                               // rsp_xbar_demux_002:src0_startofpacket -> rsp_xbar_mux:sink2_startofpacket
	wire  [69:0] rsp_xbar_demux_002_src0_data;                                                                        // rsp_xbar_demux_002:src0_data -> rsp_xbar_mux:sink2_data
	wire   [4:0] rsp_xbar_demux_002_src0_channel;                                                                     // rsp_xbar_demux_002:src0_channel -> rsp_xbar_mux:sink2_channel
	wire         rsp_xbar_demux_002_src0_ready;                                                                       // rsp_xbar_mux:sink2_ready -> rsp_xbar_demux_002:src0_ready
	wire         rsp_xbar_demux_002_src1_endofpacket;                                                                 // rsp_xbar_demux_002:src1_endofpacket -> rsp_xbar_mux_001:sink2_endofpacket
	wire         rsp_xbar_demux_002_src1_valid;                                                                       // rsp_xbar_demux_002:src1_valid -> rsp_xbar_mux_001:sink2_valid
	wire         rsp_xbar_demux_002_src1_startofpacket;                                                               // rsp_xbar_demux_002:src1_startofpacket -> rsp_xbar_mux_001:sink2_startofpacket
	wire  [69:0] rsp_xbar_demux_002_src1_data;                                                                        // rsp_xbar_demux_002:src1_data -> rsp_xbar_mux_001:sink2_data
	wire   [4:0] rsp_xbar_demux_002_src1_channel;                                                                     // rsp_xbar_demux_002:src1_channel -> rsp_xbar_mux_001:sink2_channel
	wire         rsp_xbar_demux_002_src1_ready;                                                                       // rsp_xbar_mux_001:sink2_ready -> rsp_xbar_demux_002:src1_ready
	wire         rsp_xbar_demux_003_src0_endofpacket;                                                                 // rsp_xbar_demux_003:src0_endofpacket -> rsp_xbar_mux:sink3_endofpacket
	wire         rsp_xbar_demux_003_src0_valid;                                                                       // rsp_xbar_demux_003:src0_valid -> rsp_xbar_mux:sink3_valid
	wire         rsp_xbar_demux_003_src0_startofpacket;                                                               // rsp_xbar_demux_003:src0_startofpacket -> rsp_xbar_mux:sink3_startofpacket
	wire  [69:0] rsp_xbar_demux_003_src0_data;                                                                        // rsp_xbar_demux_003:src0_data -> rsp_xbar_mux:sink3_data
	wire   [4:0] rsp_xbar_demux_003_src0_channel;                                                                     // rsp_xbar_demux_003:src0_channel -> rsp_xbar_mux:sink3_channel
	wire         rsp_xbar_demux_003_src0_ready;                                                                       // rsp_xbar_mux:sink3_ready -> rsp_xbar_demux_003:src0_ready
	wire         rsp_xbar_demux_003_src1_endofpacket;                                                                 // rsp_xbar_demux_003:src1_endofpacket -> rsp_xbar_mux_001:sink3_endofpacket
	wire         rsp_xbar_demux_003_src1_valid;                                                                       // rsp_xbar_demux_003:src1_valid -> rsp_xbar_mux_001:sink3_valid
	wire         rsp_xbar_demux_003_src1_startofpacket;                                                               // rsp_xbar_demux_003:src1_startofpacket -> rsp_xbar_mux_001:sink3_startofpacket
	wire  [69:0] rsp_xbar_demux_003_src1_data;                                                                        // rsp_xbar_demux_003:src1_data -> rsp_xbar_mux_001:sink3_data
	wire   [4:0] rsp_xbar_demux_003_src1_channel;                                                                     // rsp_xbar_demux_003:src1_channel -> rsp_xbar_mux_001:sink3_channel
	wire         rsp_xbar_demux_003_src1_ready;                                                                       // rsp_xbar_mux_001:sink3_ready -> rsp_xbar_demux_003:src1_ready
	wire         rsp_xbar_demux_004_src0_endofpacket;                                                                 // rsp_xbar_demux_004:src0_endofpacket -> rsp_xbar_mux_001:sink4_endofpacket
	wire         rsp_xbar_demux_004_src0_valid;                                                                       // rsp_xbar_demux_004:src0_valid -> rsp_xbar_mux_001:sink4_valid
	wire         rsp_xbar_demux_004_src0_startofpacket;                                                               // rsp_xbar_demux_004:src0_startofpacket -> rsp_xbar_mux_001:sink4_startofpacket
	wire  [69:0] rsp_xbar_demux_004_src0_data;                                                                        // rsp_xbar_demux_004:src0_data -> rsp_xbar_mux_001:sink4_data
	wire   [4:0] rsp_xbar_demux_004_src0_channel;                                                                     // rsp_xbar_demux_004:src0_channel -> rsp_xbar_mux_001:sink4_channel
	wire         rsp_xbar_demux_004_src0_ready;                                                                       // rsp_xbar_mux_001:sink4_ready -> rsp_xbar_demux_004:src0_ready
	wire         limiter_cmd_src_endofpacket;                                                                         // limiter:cmd_src_endofpacket -> cmd_xbar_demux:sink_endofpacket
	wire         limiter_cmd_src_startofpacket;                                                                       // limiter:cmd_src_startofpacket -> cmd_xbar_demux:sink_startofpacket
	wire  [69:0] limiter_cmd_src_data;                                                                                // limiter:cmd_src_data -> cmd_xbar_demux:sink_data
	wire   [4:0] limiter_cmd_src_channel;                                                                             // limiter:cmd_src_channel -> cmd_xbar_demux:sink_channel
	wire         limiter_cmd_src_ready;                                                                               // cmd_xbar_demux:sink_ready -> limiter:cmd_src_ready
	wire         rsp_xbar_mux_src_endofpacket;                                                                        // rsp_xbar_mux:src_endofpacket -> limiter:rsp_sink_endofpacket
	wire         rsp_xbar_mux_src_valid;                                                                              // rsp_xbar_mux:src_valid -> limiter:rsp_sink_valid
	wire         rsp_xbar_mux_src_startofpacket;                                                                      // rsp_xbar_mux:src_startofpacket -> limiter:rsp_sink_startofpacket
	wire  [69:0] rsp_xbar_mux_src_data;                                                                               // rsp_xbar_mux:src_data -> limiter:rsp_sink_data
	wire   [4:0] rsp_xbar_mux_src_channel;                                                                            // rsp_xbar_mux:src_channel -> limiter:rsp_sink_channel
	wire         rsp_xbar_mux_src_ready;                                                                              // limiter:rsp_sink_ready -> rsp_xbar_mux:src_ready
	wire         limiter_001_cmd_src_endofpacket;                                                                     // limiter_001:cmd_src_endofpacket -> cmd_xbar_demux_001:sink_endofpacket
	wire         limiter_001_cmd_src_startofpacket;                                                                   // limiter_001:cmd_src_startofpacket -> cmd_xbar_demux_001:sink_startofpacket
	wire  [69:0] limiter_001_cmd_src_data;                                                                            // limiter_001:cmd_src_data -> cmd_xbar_demux_001:sink_data
	wire   [4:0] limiter_001_cmd_src_channel;                                                                         // limiter_001:cmd_src_channel -> cmd_xbar_demux_001:sink_channel
	wire         limiter_001_cmd_src_ready;                                                                           // cmd_xbar_demux_001:sink_ready -> limiter_001:cmd_src_ready
	wire         rsp_xbar_mux_001_src_endofpacket;                                                                    // rsp_xbar_mux_001:src_endofpacket -> limiter_001:rsp_sink_endofpacket
	wire         rsp_xbar_mux_001_src_valid;                                                                          // rsp_xbar_mux_001:src_valid -> limiter_001:rsp_sink_valid
	wire         rsp_xbar_mux_001_src_startofpacket;                                                                  // rsp_xbar_mux_001:src_startofpacket -> limiter_001:rsp_sink_startofpacket
	wire  [69:0] rsp_xbar_mux_001_src_data;                                                                           // rsp_xbar_mux_001:src_data -> limiter_001:rsp_sink_data
	wire   [4:0] rsp_xbar_mux_001_src_channel;                                                                        // rsp_xbar_mux_001:src_channel -> limiter_001:rsp_sink_channel
	wire         rsp_xbar_mux_001_src_ready;                                                                          // limiter_001:rsp_sink_ready -> rsp_xbar_mux_001:src_ready
	wire         cmd_xbar_mux_src_endofpacket;                                                                        // cmd_xbar_mux:src_endofpacket -> nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent:cp_endofpacket
	wire         cmd_xbar_mux_src_valid;                                                                              // cmd_xbar_mux:src_valid -> nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent:cp_valid
	wire         cmd_xbar_mux_src_startofpacket;                                                                      // cmd_xbar_mux:src_startofpacket -> nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent:cp_startofpacket
	wire  [69:0] cmd_xbar_mux_src_data;                                                                               // cmd_xbar_mux:src_data -> nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent:cp_data
	wire   [4:0] cmd_xbar_mux_src_channel;                                                                            // cmd_xbar_mux:src_channel -> nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent:cp_channel
	wire         cmd_xbar_mux_src_ready;                                                                              // nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent:cp_ready -> cmd_xbar_mux:src_ready
	wire         id_router_src_endofpacket;                                                                           // id_router:src_endofpacket -> rsp_xbar_demux:sink_endofpacket
	wire         id_router_src_valid;                                                                                 // id_router:src_valid -> rsp_xbar_demux:sink_valid
	wire         id_router_src_startofpacket;                                                                         // id_router:src_startofpacket -> rsp_xbar_demux:sink_startofpacket
	wire  [69:0] id_router_src_data;                                                                                  // id_router:src_data -> rsp_xbar_demux:sink_data
	wire   [4:0] id_router_src_channel;                                                                               // id_router:src_channel -> rsp_xbar_demux:sink_channel
	wire         id_router_src_ready;                                                                                 // rsp_xbar_demux:sink_ready -> id_router:src_ready
	wire         cmd_xbar_mux_001_src_endofpacket;                                                                    // cmd_xbar_mux_001:src_endofpacket -> switches_s1_translator_avalon_universal_slave_0_agent:cp_endofpacket
	wire         cmd_xbar_mux_001_src_valid;                                                                          // cmd_xbar_mux_001:src_valid -> switches_s1_translator_avalon_universal_slave_0_agent:cp_valid
	wire         cmd_xbar_mux_001_src_startofpacket;                                                                  // cmd_xbar_mux_001:src_startofpacket -> switches_s1_translator_avalon_universal_slave_0_agent:cp_startofpacket
	wire  [69:0] cmd_xbar_mux_001_src_data;                                                                           // cmd_xbar_mux_001:src_data -> switches_s1_translator_avalon_universal_slave_0_agent:cp_data
	wire   [4:0] cmd_xbar_mux_001_src_channel;                                                                        // cmd_xbar_mux_001:src_channel -> switches_s1_translator_avalon_universal_slave_0_agent:cp_channel
	wire         cmd_xbar_mux_001_src_ready;                                                                          // switches_s1_translator_avalon_universal_slave_0_agent:cp_ready -> cmd_xbar_mux_001:src_ready
	wire         id_router_001_src_endofpacket;                                                                       // id_router_001:src_endofpacket -> rsp_xbar_demux_001:sink_endofpacket
	wire         id_router_001_src_valid;                                                                             // id_router_001:src_valid -> rsp_xbar_demux_001:sink_valid
	wire         id_router_001_src_startofpacket;                                                                     // id_router_001:src_startofpacket -> rsp_xbar_demux_001:sink_startofpacket
	wire  [69:0] id_router_001_src_data;                                                                              // id_router_001:src_data -> rsp_xbar_demux_001:sink_data
	wire   [4:0] id_router_001_src_channel;                                                                           // id_router_001:src_channel -> rsp_xbar_demux_001:sink_channel
	wire         id_router_001_src_ready;                                                                             // rsp_xbar_demux_001:sink_ready -> id_router_001:src_ready
	wire         cmd_xbar_mux_002_src_endofpacket;                                                                    // cmd_xbar_mux_002:src_endofpacket -> leds_s1_translator_avalon_universal_slave_0_agent:cp_endofpacket
	wire         cmd_xbar_mux_002_src_valid;                                                                          // cmd_xbar_mux_002:src_valid -> leds_s1_translator_avalon_universal_slave_0_agent:cp_valid
	wire         cmd_xbar_mux_002_src_startofpacket;                                                                  // cmd_xbar_mux_002:src_startofpacket -> leds_s1_translator_avalon_universal_slave_0_agent:cp_startofpacket
	wire  [69:0] cmd_xbar_mux_002_src_data;                                                                           // cmd_xbar_mux_002:src_data -> leds_s1_translator_avalon_universal_slave_0_agent:cp_data
	wire   [4:0] cmd_xbar_mux_002_src_channel;                                                                        // cmd_xbar_mux_002:src_channel -> leds_s1_translator_avalon_universal_slave_0_agent:cp_channel
	wire         cmd_xbar_mux_002_src_ready;                                                                          // leds_s1_translator_avalon_universal_slave_0_agent:cp_ready -> cmd_xbar_mux_002:src_ready
	wire         id_router_002_src_endofpacket;                                                                       // id_router_002:src_endofpacket -> rsp_xbar_demux_002:sink_endofpacket
	wire         id_router_002_src_valid;                                                                             // id_router_002:src_valid -> rsp_xbar_demux_002:sink_valid
	wire         id_router_002_src_startofpacket;                                                                     // id_router_002:src_startofpacket -> rsp_xbar_demux_002:sink_startofpacket
	wire  [69:0] id_router_002_src_data;                                                                              // id_router_002:src_data -> rsp_xbar_demux_002:sink_data
	wire   [4:0] id_router_002_src_channel;                                                                           // id_router_002:src_channel -> rsp_xbar_demux_002:sink_channel
	wire         id_router_002_src_ready;                                                                             // rsp_xbar_demux_002:sink_ready -> id_router_002:src_ready
	wire         cmd_xbar_mux_003_src_endofpacket;                                                                    // cmd_xbar_mux_003:src_endofpacket -> onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent:cp_endofpacket
	wire         cmd_xbar_mux_003_src_valid;                                                                          // cmd_xbar_mux_003:src_valid -> onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent:cp_valid
	wire         cmd_xbar_mux_003_src_startofpacket;                                                                  // cmd_xbar_mux_003:src_startofpacket -> onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent:cp_startofpacket
	wire  [69:0] cmd_xbar_mux_003_src_data;                                                                           // cmd_xbar_mux_003:src_data -> onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent:cp_data
	wire   [4:0] cmd_xbar_mux_003_src_channel;                                                                        // cmd_xbar_mux_003:src_channel -> onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent:cp_channel
	wire         cmd_xbar_mux_003_src_ready;                                                                          // onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent:cp_ready -> cmd_xbar_mux_003:src_ready
	wire         id_router_003_src_endofpacket;                                                                       // id_router_003:src_endofpacket -> rsp_xbar_demux_003:sink_endofpacket
	wire         id_router_003_src_valid;                                                                             // id_router_003:src_valid -> rsp_xbar_demux_003:sink_valid
	wire         id_router_003_src_startofpacket;                                                                     // id_router_003:src_startofpacket -> rsp_xbar_demux_003:sink_startofpacket
	wire  [69:0] id_router_003_src_data;                                                                              // id_router_003:src_data -> rsp_xbar_demux_003:sink_data
	wire   [4:0] id_router_003_src_channel;                                                                           // id_router_003:src_channel -> rsp_xbar_demux_003:sink_channel
	wire         id_router_003_src_ready;                                                                             // rsp_xbar_demux_003:sink_ready -> id_router_003:src_ready
	wire         cmd_xbar_demux_001_src4_ready;                                                                       // jtag_uart_0_avalon_jtag_slave_translator_avalon_universal_slave_0_agent:cp_ready -> cmd_xbar_demux_001:src4_ready
	wire         id_router_004_src_endofpacket;                                                                       // id_router_004:src_endofpacket -> rsp_xbar_demux_004:sink_endofpacket
	wire         id_router_004_src_valid;                                                                             // id_router_004:src_valid -> rsp_xbar_demux_004:sink_valid
	wire         id_router_004_src_startofpacket;                                                                     // id_router_004:src_startofpacket -> rsp_xbar_demux_004:sink_startofpacket
	wire  [69:0] id_router_004_src_data;                                                                              // id_router_004:src_data -> rsp_xbar_demux_004:sink_data
	wire   [4:0] id_router_004_src_channel;                                                                           // id_router_004:src_channel -> rsp_xbar_demux_004:sink_channel
	wire         id_router_004_src_ready;                                                                             // rsp_xbar_demux_004:sink_ready -> id_router_004:src_ready
	wire   [4:0] limiter_cmd_valid_data;                                                                              // limiter:cmd_src_valid -> cmd_xbar_demux:sink_valid
	wire   [4:0] limiter_001_cmd_valid_data;                                                                          // limiter_001:cmd_src_valid -> cmd_xbar_demux_001:sink_valid
	wire         irq_mapper_receiver0_irq;                                                                            // jtag_uart_0:av_irq -> irq_mapper:receiver0_irq
	wire  [31:0] nios2_qsys_0_d_irq_irq;                                                                              // irq_mapper:sender_irq -> nios2_qsys_0:d_irq

	nios_qsys_nios2_qsys_0 nios2_qsys_0 (
		.clk                                   (clk_clk),                                                                     //                       clk.clk
		.reset_n                               (~rst_controller_reset_out_reset),                                             //                   reset_n.reset_n
		.d_address                             (nios2_qsys_0_data_master_address),                                            //               data_master.address
		.d_byteenable                          (nios2_qsys_0_data_master_byteenable),                                         //                          .byteenable
		.d_read                                (nios2_qsys_0_data_master_read),                                               //                          .read
		.d_readdata                            (nios2_qsys_0_data_master_readdata),                                           //                          .readdata
		.d_waitrequest                         (nios2_qsys_0_data_master_waitrequest),                                        //                          .waitrequest
		.d_write                               (nios2_qsys_0_data_master_write),                                              //                          .write
		.d_writedata                           (nios2_qsys_0_data_master_writedata),                                          //                          .writedata
		.jtag_debug_module_debugaccess_to_roms (nios2_qsys_0_data_master_debugaccess),                                        //                          .debugaccess
		.i_address                             (nios2_qsys_0_instruction_master_address),                                     //        instruction_master.address
		.i_read                                (nios2_qsys_0_instruction_master_read),                                        //                          .read
		.i_readdata                            (nios2_qsys_0_instruction_master_readdata),                                    //                          .readdata
		.i_waitrequest                         (nios2_qsys_0_instruction_master_waitrequest),                                 //                          .waitrequest
		.d_irq                                 (nios2_qsys_0_d_irq_irq),                                                      //                     d_irq.irq
		.jtag_debug_module_resetrequest        (),                                                                            //   jtag_debug_module_reset.reset
		.jtag_debug_module_address             (nios2_qsys_0_jtag_debug_module_translator_avalon_anti_slave_0_address),       //         jtag_debug_module.address
		.jtag_debug_module_begintransfer       (nios2_qsys_0_jtag_debug_module_translator_avalon_anti_slave_0_begintransfer), //                          .begintransfer
		.jtag_debug_module_byteenable          (nios2_qsys_0_jtag_debug_module_translator_avalon_anti_slave_0_byteenable),    //                          .byteenable
		.jtag_debug_module_debugaccess         (nios2_qsys_0_jtag_debug_module_translator_avalon_anti_slave_0_debugaccess),   //                          .debugaccess
		.jtag_debug_module_readdata            (nios2_qsys_0_jtag_debug_module_translator_avalon_anti_slave_0_readdata),      //                          .readdata
		.jtag_debug_module_select              (nios2_qsys_0_jtag_debug_module_translator_avalon_anti_slave_0_chipselect),    //                          .chipselect
		.jtag_debug_module_write               (nios2_qsys_0_jtag_debug_module_translator_avalon_anti_slave_0_write),         //                          .write
		.jtag_debug_module_writedata           (nios2_qsys_0_jtag_debug_module_translator_avalon_anti_slave_0_writedata),     //                          .writedata
		.no_ci_readra                          ()                                                                             // custom_instruction_master.readra
	);

	nios_qsys_switches switches (
		.clk      (clk_clk),                                             //                 clk.clk
		.reset_n  (~rst_controller_reset_out_reset),                     //               reset.reset_n
		.address  (switches_s1_translator_avalon_anti_slave_0_address),  //                  s1.address
		.readdata (switches_s1_translator_avalon_anti_slave_0_readdata), //                    .readdata
		.in_port  (switches_external_connection_export)                  // external_connection.export
	);

	nios_qsys_leds leds (
		.clk        (clk_clk),                                           //                 clk.clk
		.reset_n    (~rst_controller_reset_out_reset),                   //               reset.reset_n
		.address    (leds_s1_translator_avalon_anti_slave_0_address),    //                  s1.address
		.write_n    (~leds_s1_translator_avalon_anti_slave_0_write),     //                    .write_n
		.writedata  (leds_s1_translator_avalon_anti_slave_0_writedata),  //                    .writedata
		.chipselect (leds_s1_translator_avalon_anti_slave_0_chipselect), //                    .chipselect
		.readdata   (leds_s1_translator_avalon_anti_slave_0_readdata),   //                    .readdata
		.out_port   (leds_external_connection_export)                    // external_connection.export
	);

	nios_qsys_onchip_memory2_0 onchip_memory2_0 (
		.clk        (clk_clk),                                                       //   clk1.clk
		.address    (onchip_memory2_0_s1_translator_avalon_anti_slave_0_address),    //     s1.address
		.chipselect (onchip_memory2_0_s1_translator_avalon_anti_slave_0_chipselect), //       .chipselect
		.clken      (onchip_memory2_0_s1_translator_avalon_anti_slave_0_clken),      //       .clken
		.readdata   (onchip_memory2_0_s1_translator_avalon_anti_slave_0_readdata),   //       .readdata
		.write      (onchip_memory2_0_s1_translator_avalon_anti_slave_0_write),      //       .write
		.writedata  (onchip_memory2_0_s1_translator_avalon_anti_slave_0_writedata),  //       .writedata
		.byteenable (onchip_memory2_0_s1_translator_avalon_anti_slave_0_byteenable), //       .byteenable
		.reset      (rst_controller_reset_out_reset)                                 // reset1.reset
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

	altera_merlin_master_translator #(
		.AV_ADDRESS_W                (15),
		.AV_DATA_W                   (32),
		.AV_BURSTCOUNT_W             (1),
		.AV_BYTEENABLE_W             (4),
		.UAV_ADDRESS_W               (15),
		.UAV_BURSTCOUNT_W            (3),
		.USE_READ                    (1),
		.USE_WRITE                   (0),
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
		.AV_LINEWRAPBURSTS           (1),
		.AV_REGISTERINCOMINGSIGNALS  (0)
	) nios2_qsys_0_instruction_master_translator (
		.clk                   (clk_clk),                                                                            //                       clk.clk
		.reset                 (rst_controller_reset_out_reset),                                                     //                     reset.reset
		.uav_address           (nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_address),       // avalon_universal_master_0.address
		.uav_burstcount        (nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_burstcount),    //                          .burstcount
		.uav_read              (nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_read),          //                          .read
		.uav_write             (nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_write),         //                          .write
		.uav_waitrequest       (nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_waitrequest),   //                          .waitrequest
		.uav_readdatavalid     (nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_readdatavalid), //                          .readdatavalid
		.uav_byteenable        (nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_byteenable),    //                          .byteenable
		.uav_readdata          (nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_readdata),      //                          .readdata
		.uav_writedata         (nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_writedata),     //                          .writedata
		.uav_lock              (nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_lock),          //                          .lock
		.uav_debugaccess       (nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_debugaccess),   //                          .debugaccess
		.av_address            (nios2_qsys_0_instruction_master_address),                                            //      avalon_anti_master_0.address
		.av_waitrequest        (nios2_qsys_0_instruction_master_waitrequest),                                        //                          .waitrequest
		.av_read               (nios2_qsys_0_instruction_master_read),                                               //                          .read
		.av_readdata           (nios2_qsys_0_instruction_master_readdata),                                           //                          .readdata
		.av_burstcount         (1'b1),                                                                               //               (terminated)
		.av_byteenable         (4'b1111),                                                                            //               (terminated)
		.av_beginbursttransfer (1'b0),                                                                               //               (terminated)
		.av_begintransfer      (1'b0),                                                                               //               (terminated)
		.av_chipselect         (1'b0),                                                                               //               (terminated)
		.av_readdatavalid      (),                                                                                   //               (terminated)
		.av_write              (1'b0),                                                                               //               (terminated)
		.av_writedata          (32'b00000000000000000000000000000000),                                               //               (terminated)
		.av_lock               (1'b0),                                                                               //               (terminated)
		.av_debugaccess        (1'b0),                                                                               //               (terminated)
		.uav_clken             (),                                                                                   //               (terminated)
		.av_clken              (1'b1)                                                                                //               (terminated)
	);

	altera_merlin_master_translator #(
		.AV_ADDRESS_W                (15),
		.AV_DATA_W                   (32),
		.AV_BURSTCOUNT_W             (1),
		.AV_BYTEENABLE_W             (4),
		.UAV_ADDRESS_W               (15),
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
		.AV_REGISTERINCOMINGSIGNALS  (1)
	) nios2_qsys_0_data_master_translator (
		.clk                   (clk_clk),                                                                     //                       clk.clk
		.reset                 (rst_controller_reset_out_reset),                                              //                     reset.reset
		.uav_address           (nios2_qsys_0_data_master_translator_avalon_universal_master_0_address),       // avalon_universal_master_0.address
		.uav_burstcount        (nios2_qsys_0_data_master_translator_avalon_universal_master_0_burstcount),    //                          .burstcount
		.uav_read              (nios2_qsys_0_data_master_translator_avalon_universal_master_0_read),          //                          .read
		.uav_write             (nios2_qsys_0_data_master_translator_avalon_universal_master_0_write),         //                          .write
		.uav_waitrequest       (nios2_qsys_0_data_master_translator_avalon_universal_master_0_waitrequest),   //                          .waitrequest
		.uav_readdatavalid     (nios2_qsys_0_data_master_translator_avalon_universal_master_0_readdatavalid), //                          .readdatavalid
		.uav_byteenable        (nios2_qsys_0_data_master_translator_avalon_universal_master_0_byteenable),    //                          .byteenable
		.uav_readdata          (nios2_qsys_0_data_master_translator_avalon_universal_master_0_readdata),      //                          .readdata
		.uav_writedata         (nios2_qsys_0_data_master_translator_avalon_universal_master_0_writedata),     //                          .writedata
		.uav_lock              (nios2_qsys_0_data_master_translator_avalon_universal_master_0_lock),          //                          .lock
		.uav_debugaccess       (nios2_qsys_0_data_master_translator_avalon_universal_master_0_debugaccess),   //                          .debugaccess
		.av_address            (nios2_qsys_0_data_master_address),                                            //      avalon_anti_master_0.address
		.av_waitrequest        (nios2_qsys_0_data_master_waitrequest),                                        //                          .waitrequest
		.av_byteenable         (nios2_qsys_0_data_master_byteenable),                                         //                          .byteenable
		.av_read               (nios2_qsys_0_data_master_read),                                               //                          .read
		.av_readdata           (nios2_qsys_0_data_master_readdata),                                           //                          .readdata
		.av_write              (nios2_qsys_0_data_master_write),                                              //                          .write
		.av_writedata          (nios2_qsys_0_data_master_writedata),                                          //                          .writedata
		.av_debugaccess        (nios2_qsys_0_data_master_debugaccess),                                        //                          .debugaccess
		.av_burstcount         (1'b1),                                                                        //               (terminated)
		.av_beginbursttransfer (1'b0),                                                                        //               (terminated)
		.av_begintransfer      (1'b0),                                                                        //               (terminated)
		.av_chipselect         (1'b0),                                                                        //               (terminated)
		.av_readdatavalid      (),                                                                            //               (terminated)
		.av_lock               (1'b0),                                                                        //               (terminated)
		.uav_clken             (),                                                                            //               (terminated)
		.av_clken              (1'b1)                                                                         //               (terminated)
	);

	altera_merlin_slave_translator #(
		.AV_ADDRESS_W                   (9),
		.AV_DATA_W                      (32),
		.UAV_DATA_W                     (32),
		.AV_BURSTCOUNT_W                (1),
		.AV_BYTEENABLE_W                (4),
		.UAV_BYTEENABLE_W               (4),
		.UAV_ADDRESS_W                  (15),
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
	) nios2_qsys_0_jtag_debug_module_translator (
		.clk                   (clk_clk),                                                                                   //                      clk.clk
		.reset                 (rst_controller_reset_out_reset),                                                            //                    reset.reset
		.uav_address           (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_address),       // avalon_universal_slave_0.address
		.uav_burstcount        (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_burstcount),    //                         .burstcount
		.uav_read              (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_read),          //                         .read
		.uav_write             (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_write),         //                         .write
		.uav_waitrequest       (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_waitrequest),   //                         .waitrequest
		.uav_readdatavalid     (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_readdatavalid), //                         .readdatavalid
		.uav_byteenable        (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_byteenable),    //                         .byteenable
		.uav_readdata          (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_readdata),      //                         .readdata
		.uav_writedata         (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_writedata),     //                         .writedata
		.uav_lock              (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_lock),          //                         .lock
		.uav_debugaccess       (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_debugaccess),   //                         .debugaccess
		.av_address            (nios2_qsys_0_jtag_debug_module_translator_avalon_anti_slave_0_address),                     //      avalon_anti_slave_0.address
		.av_write              (nios2_qsys_0_jtag_debug_module_translator_avalon_anti_slave_0_write),                       //                         .write
		.av_readdata           (nios2_qsys_0_jtag_debug_module_translator_avalon_anti_slave_0_readdata),                    //                         .readdata
		.av_writedata          (nios2_qsys_0_jtag_debug_module_translator_avalon_anti_slave_0_writedata),                   //                         .writedata
		.av_begintransfer      (nios2_qsys_0_jtag_debug_module_translator_avalon_anti_slave_0_begintransfer),               //                         .begintransfer
		.av_byteenable         (nios2_qsys_0_jtag_debug_module_translator_avalon_anti_slave_0_byteenable),                  //                         .byteenable
		.av_chipselect         (nios2_qsys_0_jtag_debug_module_translator_avalon_anti_slave_0_chipselect),                  //                         .chipselect
		.av_debugaccess        (nios2_qsys_0_jtag_debug_module_translator_avalon_anti_slave_0_debugaccess),                 //                         .debugaccess
		.av_read               (),                                                                                          //              (terminated)
		.av_beginbursttransfer (),                                                                                          //              (terminated)
		.av_burstcount         (),                                                                                          //              (terminated)
		.av_readdatavalid      (1'b0),                                                                                      //              (terminated)
		.av_waitrequest        (1'b0),                                                                                      //              (terminated)
		.av_writebyteenable    (),                                                                                          //              (terminated)
		.av_lock               (),                                                                                          //              (terminated)
		.av_clken              (),                                                                                          //              (terminated)
		.uav_clken             (1'b0),                                                                                      //              (terminated)
		.av_outputenable       ()                                                                                           //              (terminated)
	);

	altera_merlin_slave_translator #(
		.AV_ADDRESS_W                   (2),
		.AV_DATA_W                      (32),
		.UAV_DATA_W                     (32),
		.AV_BURSTCOUNT_W                (1),
		.AV_BYTEENABLE_W                (1),
		.UAV_BYTEENABLE_W               (4),
		.UAV_ADDRESS_W                  (15),
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
		.AV_ADDRESS_W                   (2),
		.AV_DATA_W                      (32),
		.UAV_DATA_W                     (32),
		.AV_BURSTCOUNT_W                (1),
		.AV_BYTEENABLE_W                (1),
		.UAV_BYTEENABLE_W               (4),
		.UAV_ADDRESS_W                  (15),
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
		.AV_ADDRESS_W                   (11),
		.AV_DATA_W                      (32),
		.UAV_DATA_W                     (32),
		.AV_BURSTCOUNT_W                (1),
		.AV_BYTEENABLE_W                (4),
		.UAV_BYTEENABLE_W               (4),
		.UAV_ADDRESS_W                  (15),
		.UAV_BURSTCOUNT_W               (3),
		.AV_READLATENCY                 (1),
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
		.AV_READ_WAIT_CYCLES            (0),
		.AV_WRITE_WAIT_CYCLES           (0),
		.AV_SETUP_WAIT_CYCLES           (0),
		.AV_DATA_HOLD_CYCLES            (0)
	) onchip_memory2_0_s1_translator (
		.clk                   (clk_clk),                                                                        //                      clk.clk
		.reset                 (rst_controller_reset_out_reset),                                                 //                    reset.reset
		.uav_address           (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_m0_address),       // avalon_universal_slave_0.address
		.uav_burstcount        (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_m0_burstcount),    //                         .burstcount
		.uav_read              (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_m0_read),          //                         .read
		.uav_write             (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_m0_write),         //                         .write
		.uav_waitrequest       (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_m0_waitrequest),   //                         .waitrequest
		.uav_readdatavalid     (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_m0_readdatavalid), //                         .readdatavalid
		.uav_byteenable        (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_m0_byteenable),    //                         .byteenable
		.uav_readdata          (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_m0_readdata),      //                         .readdata
		.uav_writedata         (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_m0_writedata),     //                         .writedata
		.uav_lock              (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_m0_lock),          //                         .lock
		.uav_debugaccess       (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_m0_debugaccess),   //                         .debugaccess
		.av_address            (onchip_memory2_0_s1_translator_avalon_anti_slave_0_address),                     //      avalon_anti_slave_0.address
		.av_write              (onchip_memory2_0_s1_translator_avalon_anti_slave_0_write),                       //                         .write
		.av_readdata           (onchip_memory2_0_s1_translator_avalon_anti_slave_0_readdata),                    //                         .readdata
		.av_writedata          (onchip_memory2_0_s1_translator_avalon_anti_slave_0_writedata),                   //                         .writedata
		.av_byteenable         (onchip_memory2_0_s1_translator_avalon_anti_slave_0_byteenable),                  //                         .byteenable
		.av_chipselect         (onchip_memory2_0_s1_translator_avalon_anti_slave_0_chipselect),                  //                         .chipselect
		.av_clken              (onchip_memory2_0_s1_translator_avalon_anti_slave_0_clken),                       //                         .clken
		.av_read               (),                                                                               //              (terminated)
		.av_begintransfer      (),                                                                               //              (terminated)
		.av_beginbursttransfer (),                                                                               //              (terminated)
		.av_burstcount         (),                                                                               //              (terminated)
		.av_readdatavalid      (1'b0),                                                                           //              (terminated)
		.av_waitrequest        (1'b0),                                                                           //              (terminated)
		.av_writebyteenable    (),                                                                               //              (terminated)
		.av_lock               (),                                                                               //              (terminated)
		.uav_clken             (1'b0),                                                                           //              (terminated)
		.av_debugaccess        (),                                                                               //              (terminated)
		.av_outputenable       ()                                                                                //              (terminated)
	);

	altera_merlin_slave_translator #(
		.AV_ADDRESS_W                   (1),
		.AV_DATA_W                      (32),
		.UAV_DATA_W                     (32),
		.AV_BURSTCOUNT_W                (1),
		.AV_BYTEENABLE_W                (1),
		.UAV_BYTEENABLE_W               (4),
		.UAV_ADDRESS_W                  (15),
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

	altera_merlin_master_agent #(
		.PKT_PROTECTION_H          (69),
		.PKT_PROTECTION_L          (69),
		.PKT_BEGIN_BURST           (62),
		.PKT_BURSTWRAP_H           (61),
		.PKT_BURSTWRAP_L           (59),
		.PKT_BYTE_CNT_H            (58),
		.PKT_BYTE_CNT_L            (56),
		.PKT_ADDR_H                (50),
		.PKT_ADDR_L                (36),
		.PKT_TRANS_COMPRESSED_READ (51),
		.PKT_TRANS_POSTED          (52),
		.PKT_TRANS_WRITE           (53),
		.PKT_TRANS_READ            (54),
		.PKT_TRANS_LOCK            (55),
		.PKT_DATA_H                (31),
		.PKT_DATA_L                (0),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32),
		.PKT_SRC_ID_H              (65),
		.PKT_SRC_ID_L              (63),
		.PKT_DEST_ID_H             (68),
		.PKT_DEST_ID_L             (66),
		.ST_DATA_W                 (70),
		.ST_CHANNEL_W              (5),
		.AV_BURSTCOUNT_W           (3),
		.SUPPRESS_0_BYTEEN_RSP     (0),
		.ID                        (1),
		.BURSTWRAP_VALUE           (3)
	) nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent (
		.clk              (clk_clk),                                                                                     //       clk.clk
		.reset            (rst_controller_reset_out_reset),                                                              // clk_reset.reset
		.av_address       (nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_address),                //        av.address
		.av_write         (nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_write),                  //          .write
		.av_read          (nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_read),                   //          .read
		.av_writedata     (nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_writedata),              //          .writedata
		.av_readdata      (nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_readdata),               //          .readdata
		.av_waitrequest   (nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_waitrequest),            //          .waitrequest
		.av_readdatavalid (nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_readdatavalid),          //          .readdatavalid
		.av_byteenable    (nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_byteenable),             //          .byteenable
		.av_burstcount    (nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_burstcount),             //          .burstcount
		.av_debugaccess   (nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_debugaccess),            //          .debugaccess
		.av_lock          (nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_lock),                   //          .lock
		.cp_valid         (nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent_cp_valid),         //        cp.valid
		.cp_data          (nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent_cp_data),          //          .data
		.cp_startofpacket (nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent_cp_startofpacket), //          .startofpacket
		.cp_endofpacket   (nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent_cp_endofpacket),   //          .endofpacket
		.cp_ready         (nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent_cp_ready),         //          .ready
		.rp_valid         (limiter_rsp_src_valid),                                                                       //        rp.valid
		.rp_data          (limiter_rsp_src_data),                                                                        //          .data
		.rp_channel       (limiter_rsp_src_channel),                                                                     //          .channel
		.rp_startofpacket (limiter_rsp_src_startofpacket),                                                               //          .startofpacket
		.rp_endofpacket   (limiter_rsp_src_endofpacket),                                                                 //          .endofpacket
		.rp_ready         (limiter_rsp_src_ready)                                                                        //          .ready
	);

	altera_merlin_master_agent #(
		.PKT_PROTECTION_H          (69),
		.PKT_PROTECTION_L          (69),
		.PKT_BEGIN_BURST           (62),
		.PKT_BURSTWRAP_H           (61),
		.PKT_BURSTWRAP_L           (59),
		.PKT_BYTE_CNT_H            (58),
		.PKT_BYTE_CNT_L            (56),
		.PKT_ADDR_H                (50),
		.PKT_ADDR_L                (36),
		.PKT_TRANS_COMPRESSED_READ (51),
		.PKT_TRANS_POSTED          (52),
		.PKT_TRANS_WRITE           (53),
		.PKT_TRANS_READ            (54),
		.PKT_TRANS_LOCK            (55),
		.PKT_DATA_H                (31),
		.PKT_DATA_L                (0),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32),
		.PKT_SRC_ID_H              (65),
		.PKT_SRC_ID_L              (63),
		.PKT_DEST_ID_H             (68),
		.PKT_DEST_ID_L             (66),
		.ST_DATA_W                 (70),
		.ST_CHANNEL_W              (5),
		.AV_BURSTCOUNT_W           (3),
		.SUPPRESS_0_BYTEEN_RSP     (0),
		.ID                        (2),
		.BURSTWRAP_VALUE           (7)
	) nios2_qsys_0_data_master_translator_avalon_universal_master_0_agent (
		.clk              (clk_clk),                                                                              //       clk.clk
		.reset            (rst_controller_reset_out_reset),                                                       // clk_reset.reset
		.av_address       (nios2_qsys_0_data_master_translator_avalon_universal_master_0_address),                //        av.address
		.av_write         (nios2_qsys_0_data_master_translator_avalon_universal_master_0_write),                  //          .write
		.av_read          (nios2_qsys_0_data_master_translator_avalon_universal_master_0_read),                   //          .read
		.av_writedata     (nios2_qsys_0_data_master_translator_avalon_universal_master_0_writedata),              //          .writedata
		.av_readdata      (nios2_qsys_0_data_master_translator_avalon_universal_master_0_readdata),               //          .readdata
		.av_waitrequest   (nios2_qsys_0_data_master_translator_avalon_universal_master_0_waitrequest),            //          .waitrequest
		.av_readdatavalid (nios2_qsys_0_data_master_translator_avalon_universal_master_0_readdatavalid),          //          .readdatavalid
		.av_byteenable    (nios2_qsys_0_data_master_translator_avalon_universal_master_0_byteenable),             //          .byteenable
		.av_burstcount    (nios2_qsys_0_data_master_translator_avalon_universal_master_0_burstcount),             //          .burstcount
		.av_debugaccess   (nios2_qsys_0_data_master_translator_avalon_universal_master_0_debugaccess),            //          .debugaccess
		.av_lock          (nios2_qsys_0_data_master_translator_avalon_universal_master_0_lock),                   //          .lock
		.cp_valid         (nios2_qsys_0_data_master_translator_avalon_universal_master_0_agent_cp_valid),         //        cp.valid
		.cp_data          (nios2_qsys_0_data_master_translator_avalon_universal_master_0_agent_cp_data),          //          .data
		.cp_startofpacket (nios2_qsys_0_data_master_translator_avalon_universal_master_0_agent_cp_startofpacket), //          .startofpacket
		.cp_endofpacket   (nios2_qsys_0_data_master_translator_avalon_universal_master_0_agent_cp_endofpacket),   //          .endofpacket
		.cp_ready         (nios2_qsys_0_data_master_translator_avalon_universal_master_0_agent_cp_ready),         //          .ready
		.rp_valid         (limiter_001_rsp_src_valid),                                                            //        rp.valid
		.rp_data          (limiter_001_rsp_src_data),                                                             //          .data
		.rp_channel       (limiter_001_rsp_src_channel),                                                          //          .channel
		.rp_startofpacket (limiter_001_rsp_src_startofpacket),                                                    //          .startofpacket
		.rp_endofpacket   (limiter_001_rsp_src_endofpacket),                                                      //          .endofpacket
		.rp_ready         (limiter_001_rsp_src_ready)                                                             //          .ready
	);

	altera_merlin_slave_agent #(
		.PKT_DATA_H                (31),
		.PKT_DATA_L                (0),
		.PKT_BEGIN_BURST           (62),
		.PKT_SYMBOL_W              (8),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32),
		.PKT_ADDR_H                (50),
		.PKT_ADDR_L                (36),
		.PKT_TRANS_COMPRESSED_READ (51),
		.PKT_TRANS_POSTED          (52),
		.PKT_TRANS_WRITE           (53),
		.PKT_TRANS_READ            (54),
		.PKT_TRANS_LOCK            (55),
		.PKT_SRC_ID_H              (65),
		.PKT_SRC_ID_L              (63),
		.PKT_DEST_ID_H             (68),
		.PKT_DEST_ID_L             (66),
		.PKT_BURSTWRAP_H           (61),
		.PKT_BURSTWRAP_L           (59),
		.PKT_BYTE_CNT_H            (58),
		.PKT_BYTE_CNT_L            (56),
		.PKT_PROTECTION_H          (69),
		.PKT_PROTECTION_L          (69),
		.ST_CHANNEL_W              (5),
		.ST_DATA_W                 (70),
		.AVS_BURSTCOUNT_W          (3),
		.SUPPRESS_0_BYTEEN_CMD     (0),
		.PREVENT_FIFO_OVERFLOW     (1)
	) nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent (
		.clk                     (clk_clk),                                                                                             //             clk.clk
		.reset                   (rst_controller_reset_out_reset),                                                                      //       clk_reset.reset
		.m0_address              (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_address),                 //              m0.address
		.m0_burstcount           (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_burstcount),              //                .burstcount
		.m0_byteenable           (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_byteenable),              //                .byteenable
		.m0_debugaccess          (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_debugaccess),             //                .debugaccess
		.m0_lock                 (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_lock),                    //                .lock
		.m0_readdata             (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_readdata),                //                .readdata
		.m0_readdatavalid        (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_readdatavalid),           //                .readdatavalid
		.m0_read                 (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_read),                    //                .read
		.m0_waitrequest          (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_waitrequest),             //                .waitrequest
		.m0_writedata            (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_writedata),               //                .writedata
		.m0_write                (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_m0_write),                   //                .write
		.rp_endofpacket          (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_endofpacket),             //              rp.endofpacket
		.rp_ready                (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_ready),                   //                .ready
		.rp_valid                (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_valid),                   //                .valid
		.rp_data                 (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_data),                    //                .data
		.rp_startofpacket        (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_startofpacket),           //                .startofpacket
		.cp_ready                (cmd_xbar_mux_src_ready),                                                                              //              cp.ready
		.cp_valid                (cmd_xbar_mux_src_valid),                                                                              //                .valid
		.cp_data                 (cmd_xbar_mux_src_data),                                                                               //                .data
		.cp_startofpacket        (cmd_xbar_mux_src_startofpacket),                                                                      //                .startofpacket
		.cp_endofpacket          (cmd_xbar_mux_src_endofpacket),                                                                        //                .endofpacket
		.cp_channel              (cmd_xbar_mux_src_channel),                                                                            //                .channel
		.rf_sink_ready           (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //         rf_sink.ready
		.rf_sink_valid           (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //                .valid
		.rf_sink_startofpacket   (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //                .startofpacket
		.rf_sink_endofpacket     (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //                .endofpacket
		.rf_sink_data            (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //                .data
		.rf_source_ready         (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_ready),            //       rf_source.ready
		.rf_source_valid         (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_valid),            //                .valid
		.rf_source_startofpacket (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //                .startofpacket
		.rf_source_endofpacket   (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //                .endofpacket
		.rf_source_data          (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_data),             //                .data
		.rdata_fifo_sink_ready   (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       // rdata_fifo_sink.ready
		.rdata_fifo_sink_valid   (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_sink_data    (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data),        //                .data
		.rdata_fifo_src_ready    (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       //  rdata_fifo_src.ready
		.rdata_fifo_src_valid    (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_src_data     (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data)         //                .data
	);

	altera_avalon_sc_fifo #(
		.SYMBOLS_PER_BEAT    (1),
		.BITS_PER_SYMBOL     (71),
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
	) nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo (
		.clk               (clk_clk),                                                                                             //       clk.clk
		.reset             (rst_controller_reset_out_reset),                                                                      // clk_reset.reset
		.in_data           (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_data),             //        in.data
		.in_valid          (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_valid),            //          .valid
		.in_ready          (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_ready),            //          .ready
		.in_startofpacket  (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //          .startofpacket
		.in_endofpacket    (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //          .endofpacket
		.out_data          (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //       out.data
		.out_valid         (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //          .valid
		.out_ready         (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //          .ready
		.out_startofpacket (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //          .startofpacket
		.out_endofpacket   (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //          .endofpacket
		.csr_address       (2'b00),                                                                                               // (terminated)
		.csr_read          (1'b0),                                                                                                // (terminated)
		.csr_write         (1'b0),                                                                                                // (terminated)
		.csr_readdata      (),                                                                                                    // (terminated)
		.csr_writedata     (32'b00000000000000000000000000000000),                                                                // (terminated)
		.almost_full_data  (),                                                                                                    // (terminated)
		.almost_empty_data (),                                                                                                    // (terminated)
		.in_empty          (1'b0),                                                                                                // (terminated)
		.out_empty         (),                                                                                                    // (terminated)
		.in_error          (1'b0),                                                                                                // (terminated)
		.out_error         (),                                                                                                    // (terminated)
		.in_channel        (1'b0),                                                                                                // (terminated)
		.out_channel       ()                                                                                                     // (terminated)
	);

	altera_merlin_slave_agent #(
		.PKT_DATA_H                (31),
		.PKT_DATA_L                (0),
		.PKT_BEGIN_BURST           (62),
		.PKT_SYMBOL_W              (8),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32),
		.PKT_ADDR_H                (50),
		.PKT_ADDR_L                (36),
		.PKT_TRANS_COMPRESSED_READ (51),
		.PKT_TRANS_POSTED          (52),
		.PKT_TRANS_WRITE           (53),
		.PKT_TRANS_READ            (54),
		.PKT_TRANS_LOCK            (55),
		.PKT_SRC_ID_H              (65),
		.PKT_SRC_ID_L              (63),
		.PKT_DEST_ID_H             (68),
		.PKT_DEST_ID_L             (66),
		.PKT_BURSTWRAP_H           (61),
		.PKT_BURSTWRAP_L           (59),
		.PKT_BYTE_CNT_H            (58),
		.PKT_BYTE_CNT_L            (56),
		.PKT_PROTECTION_H          (69),
		.PKT_PROTECTION_L          (69),
		.ST_CHANNEL_W              (5),
		.ST_DATA_W                 (70),
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
		.cp_ready                (cmd_xbar_mux_001_src_ready),                                                       //              cp.ready
		.cp_valid                (cmd_xbar_mux_001_src_valid),                                                       //                .valid
		.cp_data                 (cmd_xbar_mux_001_src_data),                                                        //                .data
		.cp_startofpacket        (cmd_xbar_mux_001_src_startofpacket),                                               //                .startofpacket
		.cp_endofpacket          (cmd_xbar_mux_001_src_endofpacket),                                                 //                .endofpacket
		.cp_channel              (cmd_xbar_mux_001_src_channel),                                                     //                .channel
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
		.BITS_PER_SYMBOL     (71),
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
		.PKT_BEGIN_BURST           (62),
		.PKT_SYMBOL_W              (8),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32),
		.PKT_ADDR_H                (50),
		.PKT_ADDR_L                (36),
		.PKT_TRANS_COMPRESSED_READ (51),
		.PKT_TRANS_POSTED          (52),
		.PKT_TRANS_WRITE           (53),
		.PKT_TRANS_READ            (54),
		.PKT_TRANS_LOCK            (55),
		.PKT_SRC_ID_H              (65),
		.PKT_SRC_ID_L              (63),
		.PKT_DEST_ID_H             (68),
		.PKT_DEST_ID_L             (66),
		.PKT_BURSTWRAP_H           (61),
		.PKT_BURSTWRAP_L           (59),
		.PKT_BYTE_CNT_H            (58),
		.PKT_BYTE_CNT_L            (56),
		.PKT_PROTECTION_H          (69),
		.PKT_PROTECTION_L          (69),
		.ST_CHANNEL_W              (5),
		.ST_DATA_W                 (70),
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
		.cp_ready                (cmd_xbar_mux_002_src_ready),                                                   //              cp.ready
		.cp_valid                (cmd_xbar_mux_002_src_valid),                                                   //                .valid
		.cp_data                 (cmd_xbar_mux_002_src_data),                                                    //                .data
		.cp_startofpacket        (cmd_xbar_mux_002_src_startofpacket),                                           //                .startofpacket
		.cp_endofpacket          (cmd_xbar_mux_002_src_endofpacket),                                             //                .endofpacket
		.cp_channel              (cmd_xbar_mux_002_src_channel),                                                 //                .channel
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
		.BITS_PER_SYMBOL     (71),
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
		.PKT_BEGIN_BURST           (62),
		.PKT_SYMBOL_W              (8),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32),
		.PKT_ADDR_H                (50),
		.PKT_ADDR_L                (36),
		.PKT_TRANS_COMPRESSED_READ (51),
		.PKT_TRANS_POSTED          (52),
		.PKT_TRANS_WRITE           (53),
		.PKT_TRANS_READ            (54),
		.PKT_TRANS_LOCK            (55),
		.PKT_SRC_ID_H              (65),
		.PKT_SRC_ID_L              (63),
		.PKT_DEST_ID_H             (68),
		.PKT_DEST_ID_L             (66),
		.PKT_BURSTWRAP_H           (61),
		.PKT_BURSTWRAP_L           (59),
		.PKT_BYTE_CNT_H            (58),
		.PKT_BYTE_CNT_L            (56),
		.PKT_PROTECTION_H          (69),
		.PKT_PROTECTION_L          (69),
		.ST_CHANNEL_W              (5),
		.ST_DATA_W                 (70),
		.AVS_BURSTCOUNT_W          (3),
		.SUPPRESS_0_BYTEEN_CMD     (0),
		.PREVENT_FIFO_OVERFLOW     (1)
	) onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent (
		.clk                     (clk_clk),                                                                                  //             clk.clk
		.reset                   (rst_controller_reset_out_reset),                                                           //       clk_reset.reset
		.m0_address              (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_m0_address),                 //              m0.address
		.m0_burstcount           (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_m0_burstcount),              //                .burstcount
		.m0_byteenable           (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_m0_byteenable),              //                .byteenable
		.m0_debugaccess          (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_m0_debugaccess),             //                .debugaccess
		.m0_lock                 (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_m0_lock),                    //                .lock
		.m0_readdata             (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_m0_readdata),                //                .readdata
		.m0_readdatavalid        (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_m0_readdatavalid),           //                .readdatavalid
		.m0_read                 (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_m0_read),                    //                .read
		.m0_waitrequest          (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_m0_waitrequest),             //                .waitrequest
		.m0_writedata            (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_m0_writedata),               //                .writedata
		.m0_write                (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_m0_write),                   //                .write
		.rp_endofpacket          (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket),             //              rp.endofpacket
		.rp_ready                (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rp_ready),                   //                .ready
		.rp_valid                (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rp_valid),                   //                .valid
		.rp_data                 (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rp_data),                    //                .data
		.rp_startofpacket        (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket),           //                .startofpacket
		.cp_ready                (cmd_xbar_mux_003_src_ready),                                                               //              cp.ready
		.cp_valid                (cmd_xbar_mux_003_src_valid),                                                               //                .valid
		.cp_data                 (cmd_xbar_mux_003_src_data),                                                                //                .data
		.cp_startofpacket        (cmd_xbar_mux_003_src_startofpacket),                                                       //                .startofpacket
		.cp_endofpacket          (cmd_xbar_mux_003_src_endofpacket),                                                         //                .endofpacket
		.cp_channel              (cmd_xbar_mux_003_src_channel),                                                             //                .channel
		.rf_sink_ready           (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //         rf_sink.ready
		.rf_sink_valid           (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //                .valid
		.rf_sink_startofpacket   (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //                .startofpacket
		.rf_sink_endofpacket     (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //                .endofpacket
		.rf_sink_data            (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //                .data
		.rf_source_ready         (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rf_source_ready),            //       rf_source.ready
		.rf_source_valid         (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rf_source_valid),            //                .valid
		.rf_source_startofpacket (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //                .startofpacket
		.rf_source_endofpacket   (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //                .endofpacket
		.rf_source_data          (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rf_source_data),             //                .data
		.rdata_fifo_sink_ready   (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       // rdata_fifo_sink.ready
		.rdata_fifo_sink_valid   (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_sink_data    (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data),        //                .data
		.rdata_fifo_src_ready    (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_ready),       //  rdata_fifo_src.ready
		.rdata_fifo_src_valid    (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_valid),       //                .valid
		.rdata_fifo_src_data     (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rdata_fifo_src_data)         //                .data
	);

	altera_avalon_sc_fifo #(
		.SYMBOLS_PER_BEAT    (1),
		.BITS_PER_SYMBOL     (71),
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
	) onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo (
		.clk               (clk_clk),                                                                                  //       clk.clk
		.reset             (rst_controller_reset_out_reset),                                                           // clk_reset.reset
		.in_data           (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rf_source_data),             //        in.data
		.in_valid          (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rf_source_valid),            //          .valid
		.in_ready          (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rf_source_ready),            //          .ready
		.in_startofpacket  (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rf_source_startofpacket),    //          .startofpacket
		.in_endofpacket    (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rf_source_endofpacket),      //          .endofpacket
		.out_data          (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_data),          //       out.data
		.out_valid         (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_valid),         //          .valid
		.out_ready         (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_ready),         //          .ready
		.out_startofpacket (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_startofpacket), //          .startofpacket
		.out_endofpacket   (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo_out_endofpacket),   //          .endofpacket
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
		.PKT_BEGIN_BURST           (62),
		.PKT_SYMBOL_W              (8),
		.PKT_BYTEEN_H              (35),
		.PKT_BYTEEN_L              (32),
		.PKT_ADDR_H                (50),
		.PKT_ADDR_L                (36),
		.PKT_TRANS_COMPRESSED_READ (51),
		.PKT_TRANS_POSTED          (52),
		.PKT_TRANS_WRITE           (53),
		.PKT_TRANS_READ            (54),
		.PKT_TRANS_LOCK            (55),
		.PKT_SRC_ID_H              (65),
		.PKT_SRC_ID_L              (63),
		.PKT_DEST_ID_H             (68),
		.PKT_DEST_ID_L             (66),
		.PKT_BURSTWRAP_H           (61),
		.PKT_BURSTWRAP_L           (59),
		.PKT_BYTE_CNT_H            (58),
		.PKT_BYTE_CNT_L            (56),
		.PKT_PROTECTION_H          (69),
		.PKT_PROTECTION_L          (69),
		.ST_CHANNEL_W              (5),
		.ST_DATA_W                 (70),
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
		.BITS_PER_SYMBOL     (71),
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

	nios_qsys_addr_router addr_router (
		.sink_ready         (nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent_cp_ready),         //      sink.ready
		.sink_valid         (nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent_cp_valid),         //          .valid
		.sink_data          (nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent_cp_data),          //          .data
		.sink_startofpacket (nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent_cp_startofpacket), //          .startofpacket
		.sink_endofpacket   (nios2_qsys_0_instruction_master_translator_avalon_universal_master_0_agent_cp_endofpacket),   //          .endofpacket
		.clk                (clk_clk),                                                                                     //       clk.clk
		.reset              (rst_controller_reset_out_reset),                                                              // clk_reset.reset
		.src_ready          (addr_router_src_ready),                                                                       //       src.ready
		.src_valid          (addr_router_src_valid),                                                                       //          .valid
		.src_data           (addr_router_src_data),                                                                        //          .data
		.src_channel        (addr_router_src_channel),                                                                     //          .channel
		.src_startofpacket  (addr_router_src_startofpacket),                                                               //          .startofpacket
		.src_endofpacket    (addr_router_src_endofpacket)                                                                  //          .endofpacket
	);

	nios_qsys_addr_router_001 addr_router_001 (
		.sink_ready         (nios2_qsys_0_data_master_translator_avalon_universal_master_0_agent_cp_ready),         //      sink.ready
		.sink_valid         (nios2_qsys_0_data_master_translator_avalon_universal_master_0_agent_cp_valid),         //          .valid
		.sink_data          (nios2_qsys_0_data_master_translator_avalon_universal_master_0_agent_cp_data),          //          .data
		.sink_startofpacket (nios2_qsys_0_data_master_translator_avalon_universal_master_0_agent_cp_startofpacket), //          .startofpacket
		.sink_endofpacket   (nios2_qsys_0_data_master_translator_avalon_universal_master_0_agent_cp_endofpacket),   //          .endofpacket
		.clk                (clk_clk),                                                                              //       clk.clk
		.reset              (rst_controller_reset_out_reset),                                                       // clk_reset.reset
		.src_ready          (addr_router_001_src_ready),                                                            //       src.ready
		.src_valid          (addr_router_001_src_valid),                                                            //          .valid
		.src_data           (addr_router_001_src_data),                                                             //          .data
		.src_channel        (addr_router_001_src_channel),                                                          //          .channel
		.src_startofpacket  (addr_router_001_src_startofpacket),                                                    //          .startofpacket
		.src_endofpacket    (addr_router_001_src_endofpacket)                                                       //          .endofpacket
	);

	nios_qsys_id_router id_router (
		.sink_ready         (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_ready),         //      sink.ready
		.sink_valid         (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_valid),         //          .valid
		.sink_data          (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_data),          //          .data
		.sink_startofpacket (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_startofpacket), //          .startofpacket
		.sink_endofpacket   (nios2_qsys_0_jtag_debug_module_translator_avalon_universal_slave_0_agent_rp_endofpacket),   //          .endofpacket
		.clk                (clk_clk),                                                                                   //       clk.clk
		.reset              (rst_controller_reset_out_reset),                                                            // clk_reset.reset
		.src_ready          (id_router_src_ready),                                                                       //       src.ready
		.src_valid          (id_router_src_valid),                                                                       //          .valid
		.src_data           (id_router_src_data),                                                                        //          .data
		.src_channel        (id_router_src_channel),                                                                     //          .channel
		.src_startofpacket  (id_router_src_startofpacket),                                                               //          .startofpacket
		.src_endofpacket    (id_router_src_endofpacket)                                                                  //          .endofpacket
	);

	nios_qsys_id_router id_router_001 (
		.sink_ready         (switches_s1_translator_avalon_universal_slave_0_agent_rp_ready),         //      sink.ready
		.sink_valid         (switches_s1_translator_avalon_universal_slave_0_agent_rp_valid),         //          .valid
		.sink_data          (switches_s1_translator_avalon_universal_slave_0_agent_rp_data),          //          .data
		.sink_startofpacket (switches_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket), //          .startofpacket
		.sink_endofpacket   (switches_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket),   //          .endofpacket
		.clk                (clk_clk),                                                                //       clk.clk
		.reset              (rst_controller_reset_out_reset),                                         // clk_reset.reset
		.src_ready          (id_router_001_src_ready),                                                //       src.ready
		.src_valid          (id_router_001_src_valid),                                                //          .valid
		.src_data           (id_router_001_src_data),                                                 //          .data
		.src_channel        (id_router_001_src_channel),                                              //          .channel
		.src_startofpacket  (id_router_001_src_startofpacket),                                        //          .startofpacket
		.src_endofpacket    (id_router_001_src_endofpacket)                                           //          .endofpacket
	);

	nios_qsys_id_router id_router_002 (
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

	nios_qsys_id_router id_router_003 (
		.sink_ready         (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rp_ready),         //      sink.ready
		.sink_valid         (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rp_valid),         //          .valid
		.sink_data          (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rp_data),          //          .data
		.sink_startofpacket (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rp_startofpacket), //          .startofpacket
		.sink_endofpacket   (onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rp_endofpacket),   //          .endofpacket
		.clk                (clk_clk),                                                                        //       clk.clk
		.reset              (rst_controller_reset_out_reset),                                                 // clk_reset.reset
		.src_ready          (id_router_003_src_ready),                                                        //       src.ready
		.src_valid          (id_router_003_src_valid),                                                        //          .valid
		.src_data           (id_router_003_src_data),                                                         //          .data
		.src_channel        (id_router_003_src_channel),                                                      //          .channel
		.src_startofpacket  (id_router_003_src_startofpacket),                                                //          .startofpacket
		.src_endofpacket    (id_router_003_src_endofpacket)                                                   //          .endofpacket
	);

	nios_qsys_id_router_004 id_router_004 (
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

	altera_merlin_traffic_limiter #(
		.PKT_DEST_ID_H             (68),
		.PKT_DEST_ID_L             (66),
		.PKT_TRANS_POSTED          (52),
		.MAX_OUTSTANDING_RESPONSES (5),
		.PIPELINED                 (0),
		.ST_DATA_W                 (70),
		.ST_CHANNEL_W              (5),
		.VALID_WIDTH               (5),
		.ENFORCE_ORDER             (0),
		.PKT_BYTE_CNT_H            (58),
		.PKT_BYTE_CNT_L            (56),
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
		.PKT_DEST_ID_H             (68),
		.PKT_DEST_ID_L             (66),
		.PKT_TRANS_POSTED          (52),
		.MAX_OUTSTANDING_RESPONSES (5),
		.PIPELINED                 (0),
		.ST_DATA_W                 (70),
		.ST_CHANNEL_W              (5),
		.VALID_WIDTH               (5),
		.ENFORCE_ORDER             (0),
		.PKT_BYTE_CNT_H            (58),
		.PKT_BYTE_CNT_L            (56),
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
		.src1_endofpacket   (cmd_xbar_demux_src1_endofpacket),   //           .endofpacket
		.src2_ready         (cmd_xbar_demux_src2_ready),         //       src2.ready
		.src2_valid         (cmd_xbar_demux_src2_valid),         //           .valid
		.src2_data          (cmd_xbar_demux_src2_data),          //           .data
		.src2_channel       (cmd_xbar_demux_src2_channel),       //           .channel
		.src2_startofpacket (cmd_xbar_demux_src2_startofpacket), //           .startofpacket
		.src2_endofpacket   (cmd_xbar_demux_src2_endofpacket),   //           .endofpacket
		.src3_ready         (cmd_xbar_demux_src3_ready),         //       src3.ready
		.src3_valid         (cmd_xbar_demux_src3_valid),         //           .valid
		.src3_data          (cmd_xbar_demux_src3_data),          //           .data
		.src3_channel       (cmd_xbar_demux_src3_channel),       //           .channel
		.src3_startofpacket (cmd_xbar_demux_src3_startofpacket), //           .startofpacket
		.src3_endofpacket   (cmd_xbar_demux_src3_endofpacket)    //           .endofpacket
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
		.src4_endofpacket   (cmd_xbar_demux_001_src4_endofpacket)    //           .endofpacket
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

	nios_qsys_cmd_xbar_mux cmd_xbar_mux_002 (
		.clk                 (clk_clk),                               //       clk.clk
		.reset               (rst_controller_reset_out_reset),        // clk_reset.reset
		.src_ready           (cmd_xbar_mux_002_src_ready),            //       src.ready
		.src_valid           (cmd_xbar_mux_002_src_valid),            //          .valid
		.src_data            (cmd_xbar_mux_002_src_data),             //          .data
		.src_channel         (cmd_xbar_mux_002_src_channel),          //          .channel
		.src_startofpacket   (cmd_xbar_mux_002_src_startofpacket),    //          .startofpacket
		.src_endofpacket     (cmd_xbar_mux_002_src_endofpacket),      //          .endofpacket
		.sink0_ready         (cmd_xbar_demux_src2_ready),             //     sink0.ready
		.sink0_valid         (cmd_xbar_demux_src2_valid),             //          .valid
		.sink0_channel       (cmd_xbar_demux_src2_channel),           //          .channel
		.sink0_data          (cmd_xbar_demux_src2_data),              //          .data
		.sink0_startofpacket (cmd_xbar_demux_src2_startofpacket),     //          .startofpacket
		.sink0_endofpacket   (cmd_xbar_demux_src2_endofpacket),       //          .endofpacket
		.sink1_ready         (cmd_xbar_demux_001_src2_ready),         //     sink1.ready
		.sink1_valid         (cmd_xbar_demux_001_src2_valid),         //          .valid
		.sink1_channel       (cmd_xbar_demux_001_src2_channel),       //          .channel
		.sink1_data          (cmd_xbar_demux_001_src2_data),          //          .data
		.sink1_startofpacket (cmd_xbar_demux_001_src2_startofpacket), //          .startofpacket
		.sink1_endofpacket   (cmd_xbar_demux_001_src2_endofpacket)    //          .endofpacket
	);

	nios_qsys_cmd_xbar_mux cmd_xbar_mux_003 (
		.clk                 (clk_clk),                               //       clk.clk
		.reset               (rst_controller_reset_out_reset),        // clk_reset.reset
		.src_ready           (cmd_xbar_mux_003_src_ready),            //       src.ready
		.src_valid           (cmd_xbar_mux_003_src_valid),            //          .valid
		.src_data            (cmd_xbar_mux_003_src_data),             //          .data
		.src_channel         (cmd_xbar_mux_003_src_channel),          //          .channel
		.src_startofpacket   (cmd_xbar_mux_003_src_startofpacket),    //          .startofpacket
		.src_endofpacket     (cmd_xbar_mux_003_src_endofpacket),      //          .endofpacket
		.sink0_ready         (cmd_xbar_demux_src3_ready),             //     sink0.ready
		.sink0_valid         (cmd_xbar_demux_src3_valid),             //          .valid
		.sink0_channel       (cmd_xbar_demux_src3_channel),           //          .channel
		.sink0_data          (cmd_xbar_demux_src3_data),              //          .data
		.sink0_startofpacket (cmd_xbar_demux_src3_startofpacket),     //          .startofpacket
		.sink0_endofpacket   (cmd_xbar_demux_src3_endofpacket),       //          .endofpacket
		.sink1_ready         (cmd_xbar_demux_001_src3_ready),         //     sink1.ready
		.sink1_valid         (cmd_xbar_demux_001_src3_valid),         //          .valid
		.sink1_channel       (cmd_xbar_demux_001_src3_channel),       //          .channel
		.sink1_data          (cmd_xbar_demux_001_src3_data),          //          .data
		.sink1_startofpacket (cmd_xbar_demux_001_src3_startofpacket), //          .startofpacket
		.sink1_endofpacket   (cmd_xbar_demux_001_src3_endofpacket)    //          .endofpacket
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
		.sink_ready         (id_router_001_src_ready),               //      sink.ready
		.sink_channel       (id_router_001_src_channel),             //          .channel
		.sink_data          (id_router_001_src_data),                //          .data
		.sink_startofpacket (id_router_001_src_startofpacket),       //          .startofpacket
		.sink_endofpacket   (id_router_001_src_endofpacket),         //          .endofpacket
		.sink_valid         (id_router_001_src_valid),               //          .valid
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

	nios_qsys_rsp_xbar_demux rsp_xbar_demux_002 (
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
		.src0_endofpacket   (rsp_xbar_demux_002_src0_endofpacket),   //          .endofpacket
		.src1_ready         (rsp_xbar_demux_002_src1_ready),         //      src1.ready
		.src1_valid         (rsp_xbar_demux_002_src1_valid),         //          .valid
		.src1_data          (rsp_xbar_demux_002_src1_data),          //          .data
		.src1_channel       (rsp_xbar_demux_002_src1_channel),       //          .channel
		.src1_startofpacket (rsp_xbar_demux_002_src1_startofpacket), //          .startofpacket
		.src1_endofpacket   (rsp_xbar_demux_002_src1_endofpacket)    //          .endofpacket
	);

	nios_qsys_rsp_xbar_demux rsp_xbar_demux_003 (
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
		.src0_endofpacket   (rsp_xbar_demux_003_src0_endofpacket),   //          .endofpacket
		.src1_ready         (rsp_xbar_demux_003_src1_ready),         //      src1.ready
		.src1_valid         (rsp_xbar_demux_003_src1_valid),         //          .valid
		.src1_data          (rsp_xbar_demux_003_src1_data),          //          .data
		.src1_channel       (rsp_xbar_demux_003_src1_channel),       //          .channel
		.src1_startofpacket (rsp_xbar_demux_003_src1_startofpacket), //          .startofpacket
		.src1_endofpacket   (rsp_xbar_demux_003_src1_endofpacket)    //          .endofpacket
	);

	nios_qsys_rsp_xbar_demux_004 rsp_xbar_demux_004 (
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
		.sink1_endofpacket   (rsp_xbar_demux_001_src0_endofpacket),   //          .endofpacket
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
		.sink3_endofpacket   (rsp_xbar_demux_003_src0_endofpacket)    //          .endofpacket
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
		.sink2_ready         (rsp_xbar_demux_002_src1_ready),         //     sink2.ready
		.sink2_valid         (rsp_xbar_demux_002_src1_valid),         //          .valid
		.sink2_channel       (rsp_xbar_demux_002_src1_channel),       //          .channel
		.sink2_data          (rsp_xbar_demux_002_src1_data),          //          .data
		.sink2_startofpacket (rsp_xbar_demux_002_src1_startofpacket), //          .startofpacket
		.sink2_endofpacket   (rsp_xbar_demux_002_src1_endofpacket),   //          .endofpacket
		.sink3_ready         (rsp_xbar_demux_003_src1_ready),         //     sink3.ready
		.sink3_valid         (rsp_xbar_demux_003_src1_valid),         //          .valid
		.sink3_channel       (rsp_xbar_demux_003_src1_channel),       //          .channel
		.sink3_data          (rsp_xbar_demux_003_src1_data),          //          .data
		.sink3_startofpacket (rsp_xbar_demux_003_src1_startofpacket), //          .startofpacket
		.sink3_endofpacket   (rsp_xbar_demux_003_src1_endofpacket),   //          .endofpacket
		.sink4_ready         (rsp_xbar_demux_004_src0_ready),         //     sink4.ready
		.sink4_valid         (rsp_xbar_demux_004_src0_valid),         //          .valid
		.sink4_channel       (rsp_xbar_demux_004_src0_channel),       //          .channel
		.sink4_data          (rsp_xbar_demux_004_src0_data),          //          .data
		.sink4_startofpacket (rsp_xbar_demux_004_src0_startofpacket), //          .startofpacket
		.sink4_endofpacket   (rsp_xbar_demux_004_src0_endofpacket)    //          .endofpacket
	);

	nios_qsys_irq_mapper irq_mapper (
		.clk           (clk_clk),                        //       clk.clk
		.reset         (rst_controller_reset_out_reset), // clk_reset.reset
		.receiver0_irq (irq_mapper_receiver0_irq),       // receiver0.irq
		.sender_irq    (nios2_qsys_0_d_irq_irq)          //    sender.irq
	);

endmodule
