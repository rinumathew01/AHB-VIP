class mseqr_ahb extends uvm_sequencer#(mstr_item_ahb);

    `uvm_component_utils(mseqr_ahb)

    extern function new(string name = "mseqr_ahb",uvm_component parent);

endclass : mseqr_ahb

        function mseqr_ahb::new(string name = "mseqr_ahb",uvm_component parent);
            super.new(name,parent);
        endfunction