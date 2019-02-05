`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: DLUT
// Engineer: Li Yingping
// 
// Create Date: 2019/01/25 08:56:30
// Design Name: 
// Module Name: signal
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


module signal(
    input clk,
    input rst_n,
    input[7: 0] count,
    output reg[2: 0] light1,
    output reg[2: 0] light2
    );
 
reg[2: 0] status; 
    
always @(posedge clk or negedge rst_n)
    if (rst_n)
    begin 
        light1 <= 3'd0;
        light2 <= 3'd0;
        status <= 3'd0;
    end
    else
        case(status)
            3'd0: if(count == 8'd0)  begin light1 <= 3'd4; light2 <= 3'd2; status <= 3'd1; end
            3'd1: if(count == 8'd8)  begin light1 <= 3'd4; light2 <= 3'd6; status <= 3'd2; end
            3'd2: if(count == 8'd10) begin light1 <= 3'd2; light2 <= 3'd4; status <= 3'd3; end
            3'd3: if(count == 8'd18) begin light1 <= 3'd6; light2 <= 3'd2; status <= 3'd0; end
        endcase 
    
endmodule
