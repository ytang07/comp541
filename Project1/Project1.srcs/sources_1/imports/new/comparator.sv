`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2017 12:58:13 PM
// Design Name: 
// Module Name: comparator
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module comparator(
    input wire FlagN, FlagV, FlagC, bool0,
    output wire comparrison
    );
    
    //If bool0 is 0 then do LT
    //If bool0 is 1 then do LTU
    assign comparrison = bool0 ? ~FlagC : FlagN ^ FlagV;
    
    
endmodule
