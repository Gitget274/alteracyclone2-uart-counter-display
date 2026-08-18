module cont_par
#(parameter N=4, 
M=10 
)
(input wire clk, resetn,
output wire max_tick,
output wire [N-1:0] q
);

reg [N-1:0] r_reg;
wire [N-1:0] r_next;

always @(posedge clk, negedge resetn)
if (!resetn)
r_reg <= 0;
else
r_reg <= r_next;

assign r_next = (r_reg == (M-1)) ? 0 : r_reg + 1;

assign q = r_reg;
assign max_tick = (r_reg == (M-1));
endmodule
