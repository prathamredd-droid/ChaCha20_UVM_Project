# ModelSim/Questa run script (uses local uvm_pkg.sv)
vlib work
# Compile local UVM shim first
vlog -sv tb/uvm_pkg.sv
# Compile RTL
vlog -sv rtl/chacha20_ENCRYPTION.sv
# Compile all TB files
vlog -sv tb/*.sv
# Run
vsim -novopt work.top
run -all
