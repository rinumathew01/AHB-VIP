class sseqr_ahb extends uvm_sequencer#(slv_item_ahb);

    `uvm_component_utils("sseqr_ahb")

    extern function new(string name = "sseqr_ahb",uvm_component parent);

endclass :: sseqr_ahb

        function sseqr_ahb::new(string name = "sseqr_ahb",uvm_component parent);
            super.new(name,parent);
        endfunction