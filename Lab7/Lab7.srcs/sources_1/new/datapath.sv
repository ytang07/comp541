`timescale 1ns / 1ps
`default_nettype none

module datapath #(
        parameter Nloc = 32,
        parameter Dbits = 32,
        parameter initfile = "mem_data.mem"
)(
        input wire clock,
        input wire RegWrite,
        input wire [$clog2(Nloc)-1:0] ReadAddr1, ReadAddr2, WriteAddr,
        input wire [4:0] ALUFN,
        input wire [Dbits-1:0] WriteData,
        
        output logic [Dbits-1:0] ReadData1, ReadData2,
        output wire [Nloc-1:0] ALUResult,
        output wire FlagZ
    );
    
    register_file r (clock, RegWrite, ReadAddr1, ReadAddr2, WriteAddr, WriteData, ReadData1, ReadData2);
    
    wire FlagN, FlagC, FlagV;
    ALU a(ReadData1, ReadData2, ALUResult, ALUFN, FlagN, FlagC, FlagV, FlagZ);
endmodule
