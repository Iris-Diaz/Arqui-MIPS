 `timescale 1ns/1ns 
module bancoRegistros(
input [4:0] rs,
input [4:0] rt,
input [4:0]rd,
output reg [31:0] dr1,
output reg [31:0] dr2
);
reg [31:0]ROM[0:31];
initial
	begin
	$readmemb ("datos2.txt",ROM);
		
	end
always @*
	begin
		dr1 = ROM[rs];
		dr2 = ROM[rt];
	end
	
endmodule

