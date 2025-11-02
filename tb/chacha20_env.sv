`include "uvm_pkg.sv"
`include "chacha20_agent.sv"
`include "chacha20_scoreboard.sv"

class chacha20_env;
    chacha20_agent agent;
    chacha20_scoreboard scoreboard;

    function new(); endfunction

    function void build(virtual chacha20_if vif);
        agent = new();
        agent.build(vif);
        scoreboard = new();
    endfunction
endclass
