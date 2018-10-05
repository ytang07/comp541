`timescale 1ns / 1ps
`default_nettype none

module bitmap_mem #(
    parameter Nloc = 1024,
    parameter Dbits = 12,
    parameter initfile = "bmem_screentest.mem"
)(
    input wire [$clog2(Nloc)-1:0] addr,
    output wire [Dbits-1:0] read_out
    );
    
    logic [Dbits-1:0] mem [Nloc-1:0];
    initial $readmemh(initfile, mem, 0, Nloc-1);
    assign read_out = mem[addr];    
    
endmodule
