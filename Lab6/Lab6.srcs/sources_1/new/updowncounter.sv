`timescale 1ns / 1ps
`default_nettype none


module updowncounter(
        input wire countup,
        input wire paused,
        input wire clk,
        output logic [31:0] val
    );
    
    logic [63:0] counter;
    always_ff @(posedge clk) begin
        counter <= (paused == 0) ? (countup == 0) ? (counter-1) : (counter + 1) : counter;
        val <= counter[52:21];
    end
endmodule
