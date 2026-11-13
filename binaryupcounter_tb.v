
module tb_binary_up_counter;

reg clk;
reg reset;
wire [2:0] Q;

binary_up_counter uut (
    .clk(clk),
    .reset(reset),
    .Q(Q)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $monitor("Time=%0t | Reset=%b | Count=%b",
              $time, reset, Q);

    reset = 1;
    #12;

    reset = 0;
    #100;

    $finish;
end

endmodule

