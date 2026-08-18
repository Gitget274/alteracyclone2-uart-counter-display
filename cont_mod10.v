module cont_mod10 
(input clk, resetn, enable,up_down,
input [3:0] load,
output reg [3:0] Q);

always @(posedge(clk))
begin 

if (!resetn) 
begin
	Q <= 4'd0;
end
else if (enable) 
begin
	 if(load==4'd10) 
	 begin
		    if(up_down) 
			 begin
		       if (Q==4'd9)
					  Q <= 4'd0;
			    else 
					  Q <= Q + 4'd1;
			 end
			 else 
			 begin
			    if (Q==4'd0)
					  Q <= 4'd9;
			    else 
					  Q <= Q - 4'd1;
			 end	
	 end
	 else 
	 begin
	      	Q<=load;
				if(up_down) 
			   begin
		       if (Q==4'd9)
					  Q <= 4'd0;
			    else 
					  Q <= Q + 4'd1;
			   end
			   else 
			   begin
			    if (Q==4'd0)
					  Q <= 4'd9;
			    else 
					  Q <= Q - 4'd1;
			   end	
	  end
end	
end

endmodule 

