`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: DLUT
// Engineer: Li Yingping
// 
// Create Date: 2019/01/25 08:56:30
// Design Name: 
// Module Name: led
// Project Name: 
// Target Devices: PYNQ-Z2
// Tool Versions: Vivado 2018.2
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module led(
    input clk,
    input rst_n,
    input[2: 0] light1,
    input[2: 0] light2,
    output ld4_r, ld4_g, ld4_b,
    output ld5_r, ld5_g, ld5_b
    );
    
reg[15: 0] cnt;

always @(posedge clk or negedge rst_n)
    if (rst_n)
        cnt <= 16'd0;
    else if (cnt == 16'd12_500 - 1)
        cnt <= 16'd0;
    else
        cnt <= cnt + 1'b1;
        
wire pwm_r, pwm_g, pwm_b;

assign pwm_r = (cnt < 16'd1_500);
assign pwm_g = (cnt < 16'd1_000);
assign pwm_b = (cnt < 16'd1_250);

assign ld5_r = light1[2]? pwm_r: 0;
assign ld5_g = light1[1]? pwm_g: 0;
assign ld5_b = light1[0]? pwm_b: 0;
assign ld4_r = light2[2]? pwm_r: 0;
assign ld4_g = light2[1]? pwm_g: 0;
assign ld4_b = light2[0]? pwm_b: 0;
    
endmodule
