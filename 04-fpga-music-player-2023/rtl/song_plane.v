`define MUTE    3'd0
`define DO  3'd1
`define RE  3'd2
`define ME  3'd3
`define PA  3'd4
`define SOL 3'd5
`define RA  3'd6
`define SI  3'd7

`define NOTE_SIZE   32

module song_plane(
    input   wire    clk,
    input   wire    [4:0]   order,
    output  wire    [2:0]   out
);

wire [2:0]   note    [0:`NOTE_SIZE];
assign  note[0] =   `MUTE;
assign  note[1] =   `ME;
assign  note[2] =   `RE;
assign  note[3] =   `DO;
assign  note[4] =   `RE;
assign  note[5] =   `ME;
assign  note[6] =   `ME;
assign  note[7] =   `ME;
assign  note[8] =   `RE;
assign  note[9] =   `RE;
assign  note[10] =   `RE;
assign  note[11]=   `ME;
assign  note[12]=   `SOL;
assign  note[13]=   `SOL;
assign  note[14]=   `SOL;
assign  note[15]=   `ME;
assign  note[16] =   `RE;
assign  note[17] =   `DO;
assign  note[18] =   `RE;
assign  note[19] =   `ME;
assign  note[20] =   `ME;
assign  note[21] =   `ME;
assign  note[22] =   `RE;
assign  note[23] =   `RE;
assign  note[24] =   `ME;
assign  note[25] =   `RE;
assign  note[26] =   `DO;

assign  out =   (order == 0)    ?   note[0] :
                (order == 1)    ?   note[1] :
                (order == 2)    ?   note[2] :
                (order == 3)    ?   note[3] :
                (order == 4)    ?   note[4] :
                (order == 5)    ?   note[5] :
                (order == 6)    ?   note[6] :
                (order == 7)    ?   note[7] :
                (order == 8)    ?   note[8] :
                (order == 9)    ?   note[9] :
                (order == 10)    ?   note[10] :
                (order == 11)    ?   note[11] :
                (order == 12)    ?   note[12] :
                (order == 13)    ?   note[13] :
                (order == 14)    ?   note[14] :
                (order == 15)    ?   note[15] :
                (order == 16)    ?   note[16] :
                (order == 17)    ?   note[17] :
                (order == 18)    ?   note[18] :
                (order == 19)    ?   note[19] :
                (order == 20)    ?   note[20] :
                (order == 21)    ?   note[21] :
                (order == 22)    ?   note[22] :
                (order == 23)    ?   note[23] :
                (order == 24)    ?   note[24] :
                (order == 25)    ?   note[25] :
                (order == 26)    ?   note[26] :     `MUTE;


endmodule
