`include "uvm_pkg.sv"
`include "chacha20_transaction.sv"

class chacha20_scoreboard;
    int pass_count = 0;
    int total_count = 0;
    function new(); endfunction

    function void write(chacha20_transaction tx);
        total_count++;
        if (tx.ciphertext !== 0) begin
            pass_count++;
            $display("[SCOREBOARD] PASS - Test %0d: Ciphertext generated", total_count);
        end else begin
            $display("[SCOREBOARD] FAIL - Test %0d: No ciphertext", total_count);
        end
    endfunction

    task report();
        $display("========================================");
        $display("          TEST SUMMARY                  ");
        $display("========================================");
        $display("Total Tests:  %0d", total_count);
        $display("Passed:       %0d", pass_count);
        $display("Failed:       %0d", total_count - pass_count);
        if (pass_count == total_count)
            $display("Status: ALL TESTS PASSED");
        else
            $display("Status: SOME TESTS FAILED");
        $display("========================================");
    endtask
endclass
