`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.01.2026 19:24:59
// Design Name: 
// Module Name: piped_alu_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module piped_alu_tb();
    wire [7:0] Out;
    reg [2:0] rs1, rs2, rd;
    reg [3:0] opcode;
    reg clk;
    reg reset;
    integer i;
    
    piped_alu DUT (.clk(clk), 
                   .reset(reset), 
                   .Out(Out), 
                   .rs1(rs1), 
                   .rs2(rs2), 
                   .rd(rd), 
                   .opcode(opcode));
                   
    always #5 clk = ~clk;   
    
    //Initialize register bank
    initial begin
        clk   = 0;
        reset = 1;
        rs1   = 0;
        rs2   = 0;
        rd    = 0;
        opcode = 0;

        // Hold reset for 2 cycles
        #20;
        reset = 0;

        // Initialize register bank with known values
        for (i = 0; i < 8; i = i + 1)
            DUT.regbank[i] = i;
    end
    
    initial begin
        #30;

        rs1=1; rs2=2; rd=1; opcode=0;   #10; // ADD
        rs1=3; rs2=1; rd=2; opcode=1;   #10; // SUB
        rs1=2; rs2=3; rd=3; opcode=2;   #10; // MUL
        rs1=4; rs2=5; rd=4; opcode=3;   #10; // AND
        rs1=4; rs2=6; rd=5; opcode=4;   #10; // OR
        rs1=5; rs2=7; rd=6; opcode=5;   #10; // XOR
        rs1=6; rs2=0; rd=7; opcode=6;   #10; // NOT A
        rs1=7; rs2=0; rd=0; opcode=7;   #10; // NOT B
        rs1=1; rs2=0; rd=1; opcode=8;   #10; // SEL A
        rs1=2; rs2=0; rd=2; opcode=9;   #10; // SEL B
        rs1=3; rs2=0; rd=3; opcode=10;  #10; // SHR
        rs1=3; rs2=0; rd=4; opcode=11;  #10; // SHL

        // Allow pipeline to flush all its operations
        #120;
        $finish;
    end
    
    initial begin
        $monitor(
            "Time=%0t | rs1=%0d rs2=%0d rd=%0d opcode=%0d | Out=%0d",
            $time, rs1, rs2, rd, opcode, Out
        );
    end
endmodule
