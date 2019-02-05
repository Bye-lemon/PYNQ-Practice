`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: DLUT
// Engineer: Li Yingping
// 
// Create Date: 2019/01/25 08:56:30
// Design Name: 
// Module Name: top
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


module top(
    input sysclk,
    input[0: 0] btn,
    output led4_r, led4_g, led4_b,
    output led5_r, led5_g, led5_b
    );
    
wire rst_n;
assign rst_n = !btn[0];

wire[7: 0] cnt;
wire[2:0] light1, light2;

timer u1(.clk(sysclk), .rst_n(rst_n), .count(cnt));
signal u2(.clk(sysclk), .rst_n(rst_n), .count(cnt), .light1(light1), .light2(light2));
led u3(.clk(sysclk), .rst_n(rst_n), .light1(light1), .light2(light2), .ld4_r(led4_r), .ld4_g(led4_g), .ld4_b(led4_b), .ld5_r(led5_r), .ld5_g(led5_g), .ld5_b(led5_b));
    
endmodule
