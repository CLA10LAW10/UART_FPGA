`timescale 1ns / 1ps

module uart_tb();

parameter DBIT = 8; // # data bits
parameter SB_TICK = 1; // # 16 ticks for 1 stop bit
parameter FIFO_W = 2; // # addr bits of FIFO

reg clk; 
reg reset;
reg rd_uart; 
reg wr_uart;
reg rx; 
reg [7:0] w_data;
reg [10:0] dvsr;
wire tx_full; 
wire rx_empty;
wire tx;
wire [7:0] r_data;

uart #(.DBIT(DBIT), .SB_TICK(SB_TICK),.FIFO_W(FIFO_W)) uart_uut (.*);
endmodule