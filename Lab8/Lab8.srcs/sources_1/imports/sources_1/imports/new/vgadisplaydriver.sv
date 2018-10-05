`timescale 1ns / 1ps
`default_nettype none
`include "display640x480.vh"

module vgadisplaydriver #(
    parameter Nloc,
    parameter Dbits,
    parameter initfile
)(
    input wire clk,
    output wire [$clog2(Nloc)-1:0] screen_addr,
    input wire [Dbits-1:0] char_code,
    output wire [11:0] RGB,
    output wire hsync, vsync
    );
    
    wire [`xbits-1:0] x;
    wire [`ybits-1:0] y;
    wire activevideo;
    
    vgatimer myvgatimer(clk, hsync, vsync, activevideo, x, y);
    
    assign screen_addr = ((y[`ybits-1:4] << 5) + (y[`ybits-1:4] << 3) + x[`xbits-1:4]);
    
    wire [$clog2(Nloc)-1:0] bitmapaddr;
    assign bitmapaddr = {char_code, x[3:0], y[3:0]};
    
    wire [Dbits-1:0] col_val;
    bitmap_mem #(Nloc, Dbits, initfile) bmem (bitmapaddr, col_val);
    
    assign RGB = (activevideo == 1) ? col_val : 12'b0000_0000_0000;
    
endmodule
