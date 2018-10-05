`timescale 1ns / 1ps

module comparator(
    input wire FlagN, FlagV, FlagC, bool0,
    output wire comparison
    );
    assign comparison = ~bool0 ? FlagN ^ FlagV : ~FlagC;
endmodule
