`timescale 1ns / 1ps
`default_nettype none

module counter2(
    input wire clock,
    output logic [31:0] value
    );
    logic [55:0] counter;
    always_ff @(posedge clock) begin
        counter <= (counter + 1);
        value <= counter[52:21];
    end
endmodule
