`timescale 1ns / 1ps

module uart_tb();

  parameter DBIT = 8; // # data bits
  parameter SB_TICK = 16; // # 16 ticks for 1 stop bit
  parameter FIFO_W = 0; // # addr bits of FIFO

  reg clk;
  reg reset;
  reg [3:0] sw;
  wire [3:0] led;
  wire led_r;
  wire led_g;
  wire led_b;
  wire tx;
  reg rx;

  parameter CP = 8;
  parameter delay = 2000;

  uart_top #(.DBIT(DBIT), .SB_TICK(SB_TICK),.FIFO_W(FIFO_W)) uart_uut (.*);

  // Process made to toggle the clock every 5ns.
  always
  begin
    clk <= 1'b1;
    #(CP/2);
    clk <= 1'b0;
    #(CP/2);
  end

  // Simulation inputs.
  initial
  begin
    reset <= 1'b1; // Reset
    sw <= 1'b0;
    #(CP * delay);
    sw <= 1'b1;
    reset <= 1'b0;
    #(CP * delay);

    rx <= 1'b1; // Parity Bit
    #(CP * delay);
    rx <= 1'b0; 
    #(13000);

    rx <= 1'b1; // Bit 1
    #(8600);
    rx <= 1'b0; // Bit 2
    #(8800);
    rx <= 1'b1; // Bit 3
    #(8850);
    rx <= 1'b0; // Bit 4
    #(8850);
    rx <= 1'b1; // Bit 5
    #(8800);
    rx <= 1'b0; // Bit 6
    #(8850);
    rx <= 1'b1; // Bit 7
    #(8800);
    rx <= 1'b0; // Bit 0
    #(CP * 40000);

    reset <= 1'b1; // Reset
    #(CP * delay);
    $finish;

  end

endmodule
