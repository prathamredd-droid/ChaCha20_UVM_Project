`include "uvm_pkg.sv"
`include "chacha20_driver.sv"
`include "chacha20_monitor.sv"
`include "chacha20_transaction.sv"
`include "chacha20_if.sv"

class chacha20_agent;
    chacha20_driver driver;
    chacha20_monitor monitor;
    virtual chacha20_if vif;

    function new(); endfunction

    function void build(virtual chacha20_if _vif);
        vif = _vif;
        driver = new();
        monitor = new();
        driver.vif = vif;
        monitor.vif = vif;
    endfunction
endclass
