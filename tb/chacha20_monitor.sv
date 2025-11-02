`include "uvm_pkg.sv"
`include "chacha20_transaction.sv"
`include "chacha20_if.sv"

class chacha20_monitor;
    virtual chacha20_if vif;
    function new(); endfunction

    // Simple monitor: when done asserted, capture ciphertext and call a callback
    function void set_observer(task automatic (chacha20_transaction) ref cb);
    endfunction

    task run(output chacha20_transaction tx);
        forever begin
            @(posedge vif.done);
            tx = new();
            tx.ciphertext = vif.ciphertext;
            $display("[MON] Captured ciphertext: %h", tx.ciphertext);
        end
    endtask
endclass
