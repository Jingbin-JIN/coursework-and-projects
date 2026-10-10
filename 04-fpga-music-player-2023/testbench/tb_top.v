`timescale 1ns / 1ps

module tb_top();


reg    rst;            //DIP_SW1
reg    song_sel;       //DIP_SW2
reg    pause;
reg    clk100M;

reg    led_lever13;    //DIP SW13
reg    led_lever14;    //DIP SW14
reg    led_lever15;    //DIP SW15
reg    led_lever16;    //DIP SW16

wire    led13;  //led13
wire    led14;  //led14
wire    led15;  //led15
wire    led16;  //led16
wire    [1:0]   digit_seg7;
wire    [7:0]   led_seg7;

wire    buzzer_out;

top Utop (
    .rst(rst),
    .song_sel(song_sel),
    .pause(pause),
    .clk100M(clk100M),
    .led_lever13(led_lever13),
    .led_lever14(led_lever14),
    .led_lever15(led_lever15),
    .led_lever16(led_lever16),
    .led13(led13),
    .led14(led14),
    .led15(led15),
    .led16(led16),
    .buzzer_out(buzzer_out),
    .digit_seg7(digit_seg7),
    .led_seg7(led_seg7)
);

always #5   clk100M = ~clk100M;

initial begin
    rst=0;
    song_sel=1;
    pause=0;
    clk100M=0;
    led_lever13=0;  led_lever14=0;  led_lever15=0;  led_lever16=0;

    #113;   rst=1;
    #100;   rst=0;
    #100;   pause=1;
    #10;    pause=0;

    #700000;   pause=1;
    #700000;   pause=0;
    #1000000;   pause=1;
    #700000;   pause=0;

end

endmodule
