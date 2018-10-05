`timescale 1ns / 1ps
`default_nettype none

module top#(
    parameter Nloc = 1024,
    parameter Dbits = 12,
    parameter bitmem = "bmem_screentest.mem",
    parameter screenmem = "smem_screentest.mem"
)(
    input wire clk,
    output wire [3:0] red, green, blue,
    output wire hsync, vsync
    );
    
    wire [$clog2(Nloc)-1:0] screen_addr;
    wire [Dbits-1:0] char_code;
    wire [11:0] RGB;
    vgadisplaydriver #(Nloc, Dbits, bitmem) ddrive(.clk(clk), .screen_addr(screen_addr),
        .char_code(char_code), .RGB(RGB), .hsync(hsync), .vsync(vsync));
    screen_mem #(Nloc, Dbits, screenmem) smem(.addr(screen_addr), .read_out(char_code));
    
    assign red = RGB[11:8];
    assign green = RGB[7:4];
    assign blue = RGB[3:0];
    
endmodule
