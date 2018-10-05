`timescale 1ns / 1ps
`default_nettype none

module stopwatch(
    input wire BTNU, BTND, BTNC,
    input wire clk,
    output logic [7:0]segments,
    output logic [7:0]digitselect
    );
    
    wire wu, wd, wc;
    debouncer #(14) up(BTNU, clk, wu);
    debouncer #(14) down(BTND, clk, wd);
    debouncer #(14) center(BTNC, clk, wc);
    
    logic paused, countup;
    fsm giraffe(clk, wu, wd, wc, paused, countup);
    
    logic [31:0] val;
    updowncounter upc(countup, paused, clk, val);
    display8digit dig(val, clk, segments, digitselect);
    
endmodule
