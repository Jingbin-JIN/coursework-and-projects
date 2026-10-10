`define SEG7_0  ~8'b01000000
`define SEG7_1  ~8'b01111001
`define SEG7_2  ~8'b00100100
`define SEG7_3  ~8'b00110000
`define SEG7_4  ~8'b00011001
`define SEG7_5  ~8'b00010010
`define SEG7_6  ~8'b00000010
`define SEG7_7  ~8'b01111000
`define SEG7_8  ~8'b00000000
`define SEG7_9  ~8'b00010000
`define SEG7_OFF    ~8'b11111111


`define DO  3'd1
`define RE  3'd2
`define ME  3'd3
`define PA  3'd4
`define SOL 3'd5
`define RA  3'd6
`define SI  3'd7

`define STATE_PAUSE 1'b0
`define STATE_PLAY  1'b1

`define SONG_PLANE  1'b0
`define SONG_SCHOOL 1'b1

`define CNT_NOTE_PLANE  5'd26
`define CNT_NOTE_SCHOOL 5'd24

`define CNT_CLK_1SEC    26'd49999999
`define CNT_CLK_1K  16'd49999
//`define CNT_CLK_1SEC    26'd4999    //for just testbench
//`define CNT_CLK_1K      16'd4


//DIP_SW1: 리셋버튼. 이 스위치를 위로 올리면 시스템은 초기화 상태가 됨.
//DIP_SW1을 올려서 리셋을 하는동안 DIP_SW2로 노래를 선택.
//DIP_SW2가 내려가있으면 비행기 노래, 올라가있으면 학교종 노래 선택. 노래가 나오는 중에는 이를 바꾸지 말 것.
//pause는 5개 중 가운데 있는 push button 연결.
//참고로 DIP_SW1을 리셋하면 기본적으로 일시정지 상태가 되기 때문에 push button으로 pause를 한 번 눌러줘야 노래가 시작됨.
//노래가 진행되는 도중 pause를 누르면 일시정지했다가 다시 pause를 누르면 노래가 나옴.
//clk100M은 datasheet의 100MHz 클락에 연결
//led_lever13 ~ led_lever16은 dip_sw 13~16 연결
//led13~led16은 보드읜 led13~16까지 연결
//buzzer_out: buzzer 핀과 연결
//digit_seg7은 i/o 주석에 달아놓은대로 핀연결 하면 됨
//led_seg7도 i/o 주석에 달아놓은대로 핀연결 하면 됨

module top(
    input   wire    rst,            //DIP_SW1
    input   wire    song_sel,       //DIP_SW2
    input   wire    pause,
    input   wire    clk100M,

    input   wire    led_lever13,    //DIP SW13
    input   wire    led_lever14,    //DIP SW14
    input   wire    led_lever15,    //DIP SW15
    input   wire    led_lever16,    //DIP SW16

    output  wire    led13,  //led13
    output  wire    led14,  //led14
    output  wire    led15,  //led15
    output  wire    led16,  //led16

    output  wire    buzzer_out,
    output  reg     [1:0]   digit_seg7, //digit_seg7[1]:    segment_digit_7
                                        //digit_seg7[0]:    segment_digit_8
    output  wire    [7:0]   led_seg7    //led_seg7[0]:  LED_A~
                                        //led_seg7[7]:  LED_DP
);


//--------------- oneshot part ----------------------
wire    rst_oneshot;
wire    song_sel_oneshot;
wire    pause_oneshot;
oneshot oneshot1(.clk(clk100M), .in(rst), .tick(rst_oneshot));
oneshot oneshot2(.clk(clk100M), .in(song_sel), .tick(song_sel_oneshot));
oneshot oneshot3(.clk(clk100M), .in(pause), .tick(pause_oneshot));

//--------------- song's clock generate -----------------
reg [26-1:0]    cnt_clk_1sec=0;
reg             clk_1sec=0;
always @ (posedge clk100M) begin
    if(cnt_clk_1sec >= `CNT_CLK_1SEC)   clk_1sec    <=  ~clk_1sec;
    if(cnt_clk_1sec >= `CNT_CLK_1SEC)   cnt_clk_1sec    <=  0;
    else                                cnt_clk_1sec    <=  cnt_clk_1sec + 1;
end

//------------- system ----------------------------------
reg state;  //0: pause, 1: play
reg [4:0]   order;
always @ (posedge clk100M or posedge rst) begin
    if(rst) state   <=  `STATE_PAUSE;
    else begin
        if(pause_oneshot) begin
            case(state)
                `STATE_PAUSE:   state   <=  `STATE_PLAY;
                `STATE_PLAY:    state   <=  `STATE_PAUSE;
            endcase
        end
    end
end
always @ (posedge clk_1sec or posedge rst) begin
    if(rst) order   <=  0;
    else begin
        if(state == `STATE_PLAY) begin
            order   <=  order+1;
        end
    end
end

//------------- song note mem & generator --------------
wire    [2:0]   note_plane;
wire    [2:0]   note_school;
song_plane song_plane( .clk(clk_1sec), .order(order), .out(note_plane));
song_school song_school( .clk(clk_1sec), .order(order), .out(note_school));

//--------------- buzzer signal getn--------------------
wire    [2:0]   curr_tone;
assign  curr_tone   =   (song_sel == `SONG_PLANE)   ?   note_plane  :   note_school;
buzzer_gen buzzer_gen(.clk(clk100M), .rst(rst_oneshot), .tone_sel(curr_tone), .buzzer_out(buzzer_out));

//--------------- led levers ---------------------------
assign  led13   =   led_lever13 ?   order[0]    :   1'b0;
assign  led14   =   led_lever14 ?   order[0]    :   1'b0;
assign  led15   =   led_lever15 ?   order[0]    :   1'b0;
assign  led16   =   led_lever16 ?   order[0]    :   1'b0;

//--------------- timer --------------------------------
wire [4:0]   timer;
assign  timer   =   (song_sel == `SONG_PLANE)   ?   `CNT_NOTE_PLANE - order  :   `CNT_NOTE_SCHOOL - order;

wire    [3:0]   timer_digit_10;
wire    [3:0]   timer_digit_1;
assign  timer_digit_10  =   (timer >= 20)   ?   4'd2    :
                            (timer >=10)    ?   4'd1    :   4'd0;
assign  timer_digit_1   =   timer - 10*timer_digit_10;

//-------------- 1kHz clock gen -------------------------
reg [16-1:0]    cnt_clk_1k=0;
reg             clk_1k=0;
always @ (posedge clk100M) begin
    if(cnt_clk_1k >= `CNT_CLK_1K)   clk_1k    <=  ~clk_1k;
    if(cnt_clk_1k >= `CNT_CLK_1K)   cnt_clk_1k    <=  0;
    else                            cnt_clk_1k    <=  cnt_clk_1k + 1;
end

//-------------- 7 segment ------------------------------
wire    [7:0]   seg7_timer_digit_10;
wire    [7:0]   seg7_timer_digit_1;

assign  seg7_timer_digit_10 =   (timer_digit_10 == 4'd0)    ?   `SEG7_0 :
                                (timer_digit_10 == 4'd1)    ?   `SEG7_1 :
                                (timer_digit_10 == 4'd2)    ?   `SEG7_2 :   `SEG7_OFF;

assign  seg7_timer_digit_1  =   (timer_digit_1 == 4'd0) ?   `SEG7_0 :
                                (timer_digit_1 == 4'd1) ?   `SEG7_1 :
                                (timer_digit_1 == 4'd2) ?   `SEG7_2 :
                                (timer_digit_1 == 4'd3) ?   `SEG7_3 :
                                (timer_digit_1 == 4'd4) ?   `SEG7_4 :
                                (timer_digit_1 == 4'd5) ?   `SEG7_5 :
                                (timer_digit_1 == 4'd6) ?   `SEG7_6 :
                                (timer_digit_1 == 4'd7) ?   `SEG7_7 :
                                (timer_digit_1 == 4'd8) ?   `SEG7_8 :
                                (timer_digit_1 == 4'd9) ?   `SEG7_9 :   `SEG7_OFF;


always @ (posedge clk_1k or posedge rst) begin
    if(rst) digit_seg7 <= 0;
    else begin
        if(digit_seg7 == 2'b10)         digit_seg7  <=  2'b01;
        else if(digit_seg7 == 2'b01)    digit_seg7  <=  2'b10;
        else                            digit_seg7  <=  2'b10;
    end
end

assign  led_seg7    =   (digit_seg7==2'b10) ?   seg7_timer_digit_10 :
                        (digit_seg7==2'b01) ?   seg7_timer_digit_1  :   `SEG7_OFF;


endmodule
