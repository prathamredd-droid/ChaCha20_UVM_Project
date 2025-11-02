`include "uvm_pkg.sv"
`include "chacha20_transaction.sv"
`include "chacha20_if.sv"

class chacha20_driver;
    virtual chacha20_if vif;
    function new(); endfunction

    task run();
        chacha20_transaction tx;
        forever begin
            // In this simple harness we'll be triggered externally to drive a tx.
            @(posedge vif.clk);
        end
    endtask

    task drive(ref chacha20_transaction tx);
        @(posedge vif.clk);
        vif.key       <= tx.key;
        vif.nonce     <= tx.nonce;
        vif.counter   <= tx.counter;
        vif.plaintext <= tx.plaintext;
        // wait for DUT to assert done
        wait (vif.done == 1);
        @(posedge vif.clk);
        tx.ciphertext = vif.ciphertext;
    endtask
endclass
