
module t_flipflop (
    input clk,
    input reset,
    input t,
    output reg q
);

always @(posedge clk or posedge reset)
begin
    if (reset)
        q <= 1'b0;
    else if (t)
        q <= ~q;
end

endmodule


module down_counter (
    input clk,
    input reset,
    output [3:0] count
);

wire [3:0] t;

assign t[0] = 1'b1;
assign t[1] = ~count[0];
assign t[2] = ~count[1] & ~count[0];
assign t[3] = ~count[2] & ~count[1] & ~count[0];

t_flipflop T0(clk, reset, t[0], count[0]);
t_flipflop T1(clk, reset, t[1], count[1]);
t_flipflop T2(clk, reset, t[2], count[2]);
t_flipflop T3(clk, reset, t[3], count[3]);

endmodule

