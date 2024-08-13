`include "uvm_macros.svh"
import uvm_pkg::*;
import pkg_ahb::*;

module top_ahb;

    logic clock;

    initial begin
    clock = 1;
    forever #10 clock =~ clock;
    end

    intf_ahb intf(clock);

    initial begin

    uvm_config_db #(virtual intf_ahb)::set(null,"*","intf_ahb",intf);

    run_test();

    end


endmodule