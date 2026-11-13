
module binary_up_counter (
    input clk,
    input reset,
    output reg [2:0] Q
);

wire [2:0] T;

assign T[0] = 1'b1;
assign T[1] = Q[0];
assign T[2] = Q[1] & Q[0];

always @(posedge clk or posedge reset)
begin
    if (reset)
        Q <= 3'b000;
    else
        Q <= Q ^ T;
end

endmodule

