`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: DLUT
// Engineer: Li Yingping
// 
// Create Date: 2019/01/22 20:18:07
// Design Name: 
// Module Name: blink
// Project Name: PYNQ-Learn
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


module blink(
    input sysclk,
    output[3: 0] led
);
    
reg[31: 0] cnt0;
reg[31: 0] cnt1;
reg[31: 0] cnt2;
reg[31: 0] cnt3;

always @(posedge sysclk)
    if (cnt0 == 32'd250_000_000 - 1)
        cnt0 <= 32'd0;
    else
        cnt0 <= cnt0 + 1'b1;

always @(posedge sysclk)
    if (cnt1 == 32'd125_000_000 - 1)
        cnt1 <= 32'd0;
    else
        cnt1 <= cnt1 + 1'b1;

always @(posedge sysclk)
    if (cnt2 == 32'd62_500_000 - 1)
        cnt2 <= 32'd0;
    else
        cnt2 <= cnt2 + 1'b1;
     
always @(posedge sysclk)
    if (cnt3 == 32'd31_250_000 - 1)
        cnt3 <= 32'd0;
    else 
        cnt3 <= cnt3 + 1'b1;
       
assign led[0] = (cnt0 < 32'd125_000_000);  
assign led[1] = (cnt1 < 32'd62_500_000);
assign led[2] = (cnt2 < 32'd31_250_000);
assign led[3] = (cnt3 < 32'd15_625_000);
   
endmodule
