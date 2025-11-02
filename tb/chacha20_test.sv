`timescale 1ns/1ps
`include "uvm_pkg.sv"
`include "chacha20_env.sv"
`include "chacha20_sequence.sv"
`include "chacha20_driver.sv"
`include "chacha20_scoreboard.sv"

module tb_top;
    bit clk = 0;
    always #5 clk = ~clk;

    chacha20_if intf(clk);

    // DUT instance will be instantiated in top.sv; this TB module controls sequences
    initial begin
        intf.reset = 1;
        repeat (2) @(posedge clk);
        intf.reset = 0;
    end

endmodule
