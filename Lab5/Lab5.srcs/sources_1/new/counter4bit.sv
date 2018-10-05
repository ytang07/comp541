`timescale 1ns / 1ps
`default_nettype none



module counter4bit(
    input wire clk,
    output logic [7:0] digitselect,
    output logic [7:0] segments
    );
    wire [15:0]A0;
    counter c(clk, A0);
    display4digit d(A0, clk, segments, digitselect);
    
endmodule
