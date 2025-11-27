`timescale 1ns/1ns 
module burrote (
input [31:0] instruccion, 
input sel2,
input sel,
output reg [31:0] salida1,
output reg [31:0] salida2,	
output reg [3:0] salida3
);
wire [31:0] c1;
wire [4:0] c2;
wire [31:0] dr1_internal; 
wire [3:0]  alu_func_internal; 
wire [31:0] salida2_int;  
multiuno instb1(
	.A(instruccion[20:16]),
	.B(instruccion[15:11]),
	.sel(sel),
	.S(c2)
);
bancoRegistros instb2(
	.rs(instruccion[25:21]),
	.rt(instruccion[20:16]),
	.rd(c2),
	.dr1(dr1_internal),
	.dr2(c1)
);
multidos instb3(
    .A2(c1),
    .B2(32'b0),
    .sel2(sel2),  
    .S2(salida2_int)
);
alu_control instb4 (
	.operacion(instruccion [5:0]),
	.alu_func(alu_func_internal)
);
always @(*) begin
    salida1 = dr1_internal;     
    salida2 = salida2_int;      
    salida3 = alu_func_internal;
end
endmodule 