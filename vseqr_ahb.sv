class vseqr_ahb extends uvm_sequencer#(uvm_sequence_item);

    `uvm_component_utils(vseqr_ahb)

    mseqr_ahb mseqr;
    sseqr_ahb sseqr;

    extern function new(string name = "vseqr_ahb",uvm_component parent);

endclass : vseqr_ahb

        function vseqr_ahb::new (string name = "vseqr_ahb", uvm_component parent);
            super.new(name,parent);
        endfunction