module uart_top
  #(parameter  FIFO_DEPTH_BIT = 0),  // # addr bits of FIFO
  parameter DBIT = 8,               // # Data bits
  parameter SB_TICK = 16,           // # ticks for stop bits
   (
     input  logic clk,
     input  logic reset,
     // slot interface
     output logic [3:0] led,
     output logic led_r,
     output logic led_g,
     output logic led_b,
     // Rx and Tx Pins
     output logic tx,
     input  logic rx
   );

  // signal declaration
  logic wr_en, wr_uart, rd_uart, wr_dvsr ;
  logic tx_full, rx_empty;
  logic [10:0] dvsr_reg;
  logic [7:0] r_data;
  logic [7:0] w_data;
  logic [10:0] dvsr_reg;

  parameter [10:0] dvsr 11'd68; //  dvsr = SYS_CLK_FREQ *1000000 / 16 / baud - 1; roundup(125 * 1_000_000)/16/(115200-1);

  // body
  // instantiate uart
  uart #(.DBIT(DBIT), .SB_TICK(SB_TICK), .FIFO_W(FIFO_DEPTH_BIT)) uart_unit
       (.*, .dvsr(dvsr_reg), .w_data(w_data));

  // dvsr register
//   always_ff @(posedge clk, posedge reset)
//     if (reset)
//       dvsr_reg <= 0;
//     else
//       if (wr_dvsr)
//         dvsr_reg <= wr_data[10:0];

assign led = r_data[3:0];
assign wr_uart = 1'b1;
assign rd_uart = 1'b1;

endmodule