`include "uvm_pkg.sv"
import uvm_pkg::*;
`define UVM_MACROS_INCLUDED
class chacha20_transaction;
    rand bit [255:0] key;
    rand bit [95:0]  nonce;
    rand bit [31:0]  counter;
    rand bit [511:0] plaintext;
         bit [511:0] ciphertext;

    function new();
    endfunction
endclass
