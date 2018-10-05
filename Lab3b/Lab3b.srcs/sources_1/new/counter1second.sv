`timescale 1ns / 1ps
`default_nettype none

module counter1second(
    input wire clock,
    output logic [3:0] value
    );
    logic [31:0] counter;
    always_ff @(posedge clock) begin
        counter <= (counter + 1);
        value <= counter[30:27];
    end
endmodule
