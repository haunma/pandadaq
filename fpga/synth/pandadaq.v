`timescale 1ns / 1ps
module pandadaq(
	 output led_blue,
	 output led_green,
    inout [7:0] ja,
    inout [7:0] jb,
	 inout jc0,
	 inout jc1,
	 inout jc4,
	 inout jc5,
    output [2:0] ad2_os,
    output ad2_stby,
    output ad2_range,
    output adx_convsta,
    output adx_convstb,
    output adx_reset,
    output adx_sclk,
    output ad2_ncs,
	 input ad2_busy,
    input ad2_douta,
    input ad2_doutb,
    output [2:0] ad1_os,
    output ad1_stby,
    output ad1_range,
    output ad1_ncs,
    input ad1_busy,
    output ad1_douta,
    output ad1_doutb,
    output da_din,
    output da_sclk,
    output da_nldac,
    output da_nsync,
    output mcspi1_somi,
    input mcspi1_simo,
    input mcspi1_clk,
    input mcspi1_cs0,
    input mcspi1_cs1,
    output gps_sda,
    output gps_scl,
    input gps_txrdy,
	 input gps_extint,
    input gps_resv,
    input gps_1pps,
    inout [7:0] je,
	 input fpga_ocxo,
	 input fpga_clk,
    output fpga_init,
	 output fpga_awake,
	 inout gpio_54,
    inout gpio_140,
    inout [15:0] gpmc_ad,
    input gpmc_clk,
    input gpmc_nbe0,
    input gpmc_ale,
    input gpmc_ncs0,
    input gpmc_ncs1,
    input gpmc_noe,
    input gpmc_nwe,
    output gpmc_wait0
    );

blinky #(24) blink_green(fpga_clk, led_green);
blinky #(25) blink_blue(fpga_clk, led_blue);

endmodule
