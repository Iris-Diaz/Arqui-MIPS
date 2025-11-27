`timescale 1ns/1ns 
module alu_control(
input [5:0] operacion,
output reg [3:0] alu_func
); 
always @(*) begin
alu_func = 4'b0000;
if (operacion == 000100) 
begin
alu_func = 4'b0010;
	end 
end 
endmodule 