`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2023 09:35:07 PM
// Design Name: 
// Module Name: tb_single_port_RAM
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


`define WIDTH 8
`define DEPTH 16 
`define ADDR $clog2(`DEPTH)

module TB_single_port_RAM;

    reg clk,enable,read_en;
    reg [(`WIDTH-1):0] data_in;
    reg [(`ADDR-1):0] address;
    wire [(`WIDTH-1):0] data_out;
    
    Single_Port_RAM dut(
    .clk(clk),
    .enable(enable),
    .read_en(read_en),
    .address(address),
    .data_in(data_in),
    .data_out(data_out)
    );

    initial 
    begin
        clk=0;
        #2 enable=1;
    end
    
    always #5 clk=~clk;
  
    initial
    begin
        
        #10 read_en=0;data_in=8'haa;address=0;
        #10 data_in=8'h11;address=1;
        #10 data_in=8'h12;address=2;

        #10 read_en=1;address=0;data_in=8'bz;
        #10 address=1;
        #10 address=2;
        #20;
        $finish;
    end 
endmodule