
module down_counter_tb;

reg clk;
reg reset;
wire [3:0] count;

down_counter uut (
    .clk(clk),
    .reset(reset),
    .count(count)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $monitor("Time=%0t | Reset=%b | Count=%b (%d)",
             $time, reset, count, count);

    reset = 1;
    #10;

    reset = 0;

    #180;

    $finish;
end

endmodule
