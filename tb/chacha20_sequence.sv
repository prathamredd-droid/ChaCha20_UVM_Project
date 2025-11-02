`include "uvm_pkg.sv"
`include "chacha20_transaction.sv"
class chacha20_sequence;
    function new(); endfunction

    task start_item(ref chacha20_transaction tx);
        // placeholder for UVM's start_item
    endtask

    task finish_item(ref chacha20_transaction tx);
        // placeholder for UVM's finish_item
    endtask

    task body(output chacha20_transaction tx);
        // User sequence: produce one deterministic transaction (same as earlier)
        tx = new();
        tx.key = 256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;
        tx.nonce = 96'h000000090000004a00000000;
        tx.counter = 32'h00000001;
        tx.plaintext = 512'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD;
    endtask
endclass
