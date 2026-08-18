module top_level_tesina
(input wire rx,clk,resetn,
output [6:0] HEX0);

wire tick_internal;
wire rx_done_tick_internal;
wire [7:0] d_internal;
wire [3:0] load_internal;
wire up_down_internal;
wire maxtick_internal;
wire [3:0] q_internal;

cont_par #(.N(8),.M(163)) baud_rate_generator (.clk(clk),.resetn(resetn),.max_tick(tick_internal));
receiver my_receiver (.clk(clk),.resetn(resetn),.rx(rx),.s_tick(tick_internal),.rx_done_tick(rx_done_tick_internal),.dout(d_internal));
interface_uart_counter my_interface_uart_counter (.din(d_internal),.rx_done_tick(rx_done_tick_internal),.clk(clk),.resetn(resetn),.load(load_internal),.up_down(up_down_internal));
cont_par #(.N(26),.M(50000000)) cont_mod50M (.clk(clk),.resetn(resetn),.max_tick(maxtick_internal));
cont_mod10  my_cont_mod10 (.clk(clk),.resetn(resetn),.enable(maxtick_internal),.up_down(up_down_internal),.load(load_internal),.Q(q_internal));
seven_seg my_seven_seg (.SW(q_internal),.HEX0(HEX0));

endmodule