`timescale 1ns / 1ps
`default_nettype none


module hexcounterdisplay(
    input wire clock,
    output logic [7:0] digitselect = ~(8'b0000_0001),
    output logic [7:0] segments
    );
    wire [3:0]A0;
    counter1second c1(clock, A0);
    hexto7seg h1(A0, segments);
    
endmodule
