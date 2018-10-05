`timescale 1ns / 1ps
`default_nettype none

module counter8digit(
    input wire clk,
    output logic [7:0] digitselect,
    output logic [7:0] segments
    );
    
    wire [31:0]A0;
    counter2 c(clk, A0);
    display8digit d(A0, clk, segments, digitselect);
endmodule
