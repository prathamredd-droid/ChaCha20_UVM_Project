`timescale 1ns/1ps
`include "uvm_pkg.sv"
`include "chacha20_if.sv"
`include "chacha20_test.sv"
`include "chacha20_env.sv"
`include "chacha20_sequence.sv"
`include "../rtl/chacha20_ENCRYPTION.sv"

module top;
    bit clk = 0;
    always #5 clk = ~clk;

    chacha20_if intf(clk);

    chacha20_ENCRYPTION dut (
        .clk(clk),
        .reset(intf.reset),
        .key(intf.key),
        .nonce(intf.nonce),
        .counter(intf.counter),
        .plaintext(intf.plaintext),
        .ciphertext(intf.ciphertext),
        .done(intf.done)
    );

    initial begin
        // Build environment
        chacha20_env env;
        chacha20_sequence seq;
        chacha20_transaction tx;
        chacha20_scoreboard sb;
        chacha20_agent agent;

        env = new();
        env.build(intf);
        sb = new();
        agent = env.agent;

        // Create sequence and transaction
        seq = new();
        tx = new();
        // Populate tx using sequence.body task
        seq.body(tx);

        // Drive transaction through agent's driver
        fork
            begin
                // drive
                agent.driver.drive(tx);
            end
            begin
                // monitor and collect
                chacha20_transaction mon_tx;
                // wait for done and capture via monitor (monitor prints)
                @(posedge intf.done);
                mon_tx = new();
                mon_tx.ciphertext = intf.ciphertext;
                sb.write(mon_tx);
                sb.report();
                $finish;
            end
        join
    end
endmodule
