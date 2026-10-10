`define FREQ_100M   27'd100000000
//`define FREQ_100M   27'd10000   //for just testbench
module buzzer_gen
(
    input  wire             clk,
    input  wire             rst,

    input  wire [2:0]      tone_sel,
    output                buzzer_out
);

localparam Mute      = 27'd3000000;
localparam Do        = `FREQ_100M / 27'd523 / 2;
localparam Re        = `FREQ_100M / 27'd597 / 2;
localparam Mi        = `FREQ_100M / 27'd659 / 2;
localparam Pa        = `FREQ_100M / 27'd699 / 2;
localparam Sol       = `FREQ_100M / 27'd784 / 2;
localparam Ra        = `FREQ_100M / 27'd880 / 2;
localparam Si        = `FREQ_100M / 27'd988 / 2;
localparam Hi_Do     = `FREQ_100M / 27'd1047 / 2;


reg   [26:0]   hz_sel;
reg   [26:0]   hz_cnt;
reg   [3:0]   tone_sel_buf;


always @(*) begin
   case (tone_sel)
      3'd0 : hz_sel  <= Mute  ;
      3'd1 : hz_sel  <= Do    ;
      3'd2 : hz_sel  <= Re    ;
      3'd3 : hz_sel  <= Mi    ;
      3'd4 : hz_sel  <= Pa    ;
      3'd5 : hz_sel  <= Sol   ;
      3'd6 : hz_sel  <= Ra    ;
      3'd7 : hz_sel  <= Si    ;
      default : hz_sel  <= Mute;
   endcase
end

reg tone_out;

always @(posedge clk or posedge rst) begin
   if (rst) begin
      hz_cnt         <= 'd0;
      tone_out       <= 1'b0;
      tone_sel_buf   <= 4'd0;
   end
   else begin
      tone_sel_buf   <= tone_sel;

      if (tone_sel != tone_sel_buf) begin
         hz_cnt      <= 'd0;
         tone_out    <= 1'b0;
      end
      else if (Mute == hz_sel) begin
         hz_cnt      <= 'd0;
         tone_out    <= 1'b0;
      end
      else if (hz_sel == hz_cnt) begin
         hz_cnt      <= 'd0;
         tone_out    <= ~tone_out;
      end
      else begin
         hz_cnt      <= hz_cnt + 1;
         tone_out    <= tone_out;
      end
   end
end

assign buzzer_out = tone_out;

endmodule
