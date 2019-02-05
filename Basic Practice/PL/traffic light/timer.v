`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: DLUT
// Engineer: Li Yingping
// 
// Create Date: 2019/01/25 08:52:52
// Design Name: 
// Module Name: timer
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


module timer(
    input clk,
    input rst_n,
    output reg[7: 0] count
    );

reg[31: 0] cnt;

always @(posedge clk or negedge rst_n)
    if (rst_n)
        cnt <= 32'd0;
    else if (cnt == 32'd125_000_000 - 1)
        cnt <= 32'd0;
    else 
        cnt <= cnt + 1'b1;
        
always @(posedge clk or negedge rst_n)
    if (rst_n)
        count <= 8'd0;
    else if (cnt == 32'd125_000_000 - 1)
        if (count == 8'd20 -1)
            count <= 8'd0;
        else
            count <= count + 1'b1;  
    
endmodule
