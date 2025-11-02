// Minimal local UVM stubs to allow compilation on ModelSim Student/Lite.
// This is NOT full UVM; it's a lightweight shim so the UVM-style TB compiles.
package uvm_pkg;
    // Basic type aliases
    typedef class uvm_object uvm_object;
    // Base classes (empty)
    class uvm_object; endclass
    class uvm_sequence_item; endclass
    class uvm_component; endclass
    class uvm_driver; endclass
    class uvm_monitor; endclass
    class uvm_agent; endclass
    class uvm_env; endclass
    class uvm_test; endclass
    class uvm_scoreboard; endclass
    class uvm_sequence #(type T=uvm_sequence_item); endclass
    class uvm_sequencer #(type T=uvm_sequence_item); endclass

    // Minimal macros replacements as tasks/functions
    `define uvm_object_utils(x)
    `define uvm_component_utils(x)
    `define uvm_field_int(a,b)
    `define uvm_info(id, msg, lvl) $display("[UVM_INFO] %0s: %s", id, msg)
    `define uvm_error(id, msg)     $display("[UVM_ERROR] %0s: %s", id, msg)
    `define uvm_fatal(id, msg)     $display("[UVM_FATAL] %0s: %s", id, msg)
endpackage
