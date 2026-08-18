module interface_uart_counter
(input wire [7:0] din,
input wire rx_done_tick,clk,resetn,
output reg [3:0] load,
output reg up_down);

always@(posedge(clk))
begin
if(!resetn)
begin
up_down<=1'b1; 
load<=4'd10;
end
else
   if(rx_done_tick)
	begin
	   if(din==8'd117)
	     up_down<=1'b1;
		if(din==8'd100)
		  up_down<=1'b0;
		if((din >= 8'd48) && (din <= 8'd57)) 
		  load<=din;
		else 
		  load<=4'd10;
	end
end

endmodule
