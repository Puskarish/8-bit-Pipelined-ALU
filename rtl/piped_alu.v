`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.01.2026 19:23:40
// Design Name: 
// Module Name: piped_alu
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

//3 stage pipelined ALU
module piped_alu(Out,rs1, rs2, rd, opcode,clk, reset
    );
    input [2:0] rs1, rs2, rd; //Source Register 1, Source Register 2, Destination Register
    input [3:0] opcode; // Opcode selecting arithmetic, logical, and shift operations

    input clk, reset; 
    output [7:0] Out;
    
    reg [7:0] L12_A, L12_B, L23_Out;
    reg [3:0] L12_opcode;
    reg [2:0] L12_rd, L23_rd;
    
    reg [7:0] regbank[0:7];
    
    assign Out = L23_Out;
    
    always @(posedge clk) //Stage 1
    begin
        if (reset) 
        begin
            L12_A <= 0;
            L12_B <= 0;
            L12_opcode <= 0;
            L12_rd <= 0;
        end
        else
        begin
            L12_A <= regbank[rs1];
            L12_B <= regbank[rs2];
            L12_opcode <= opcode;
            L12_rd <= rd;
        end
   end 
   
      
   always @(posedge clk) //Stage 2
   begin
       if (reset)
       begin
           L23_Out <= 0;
           L23_rd <= 0;
       end
       else 
       begin
            case(L12_opcode)
                0: L23_Out <= L12_A + L12_B;
                1: L23_Out <= L12_A - L12_B;
                2: L23_Out <= L12_A * L12_B;
                3: L23_Out <= L12_A & L12_B;
                4: L23_Out <= L12_A | L12_B;
                5: L23_Out <= L12_A ^ L12_B;
                6: L23_Out <= ~L12_A;
                7: L23_Out <= ~L12_B;
                8: L23_Out <= L12_A;
                9: L23_Out <= L12_B;
                10: L23_Out <= L12_A >> 1;
                11: L23_Out <= L12_A << 1;
                default: L23_Out <= 8'h00;
            endcase
            L23_rd <= L12_rd;
       end
   end 
   
   integer i;

   always @(posedge clk) //Stage 3
   begin
        if (reset) 
        begin
            for (i=0; i<8; i=i+1)
                regbank[i] <= 0;
        end 
        else
            regbank[L23_rd] <= L23_Out;
   end
endmodule
