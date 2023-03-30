`timescale 1ns / 1ps

module uart_tb();

  parameter DBIT = 8; // # data bits
  parameter SB_TICK = 1; // # 16 ticks for 1 stop bit
  parameter FIFO_W = 0; // # addr bits of FIFO

  reg clk;
  reg reset;
  wire  [3:0] led;
  wire  led_r;
  wire  led_g;
  wire  led_b;
  wire  tx;
  reg rx;

  uart_top #(.DBIT(DBIT), .SB_TICK(SB_TICK),.FIFO_W(FIFO_W)) uart_uut (.*);
endmodule
