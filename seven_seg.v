module seven_seg(
     input [3:0] SW,
     output reg [6:0] HEX0
    );
    always @*  
        case (SW)             0 : 	HEX0 = 7'b1000000;
            1 : 	HEX0 = 7'b1111001;
            2 : 	HEX0 = 7'b0100100; 
            3 : 	HEX0 = 7'b0110000;
            4 : 	HEX0 = 7'b0011001;
            5 : 	HEX0 = 7'b0010010;
            6 : 	HEX0 = 7'b0000010;
            7 : 	HEX0 = 7'b1111000;
            8 : 	HEX0 = 7'b0000000;
            9 : 	HEX0 = 7'b0010000;
           4'ha : 	HEX0 = 7'b0001000;	
           4'hb : 	HEX0 = 7'b0000011;
           4'hc : 	HEX0 = 7'b1000110;	
           4'hd :  HEX0 = 7'b0100001;
           4'he :  HEX0 = 7'b0000110;
         default: HEX0 = 7'b001110; 
        endcase
endmodule
