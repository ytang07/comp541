`timescale 1ns / 1ps
`default_nettype none

module counter(
    input wire clock,
    output logic [15:0] value
    );
    logic [38:0] counter;
    always_ff @(posedge clock) begin
        counter <= (counter + 1);
        value <= counter[38:23];
    end
endmodule
