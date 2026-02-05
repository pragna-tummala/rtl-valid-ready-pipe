module pipe_reg_valid_ready #(
  parameter int WIDTH = 32
) (
  input  logic              clk,
  input  logic              rst_n,

  // input side
  input  logic              in_valid,
  output logic              in_ready,
  input  logic [WIDTH-1:0]  in_data,

  // output side
  output logic              out_valid,
  input  logic              out_ready,
  output logic [WIDTH-1:0]  out_data
);

  logic             full;
  logic [WIDTH-1:0] data_q;

  assign out_valid = full;
  assign out_data  = data_q;

  assign in_ready  = ~full || (out_ready && out_valid);

  wire push = in_valid && in_ready;
  wire pop  = out_valid && out_ready;

  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      full   <= 1'b0;
      data_q <= '0;
    end else begin
      unique case ({push, pop})
        2'b10: begin
          full   <= 1'b1;
          data_q <= in_data;
        end
        2'b01: begin
          full <= 1'b0;
        end
        2'b11: begin
          full   <= 1'b1;
          data_q <= in_data;
        end
        default: begin
        end
      endcase
    end
  end

endmodule
