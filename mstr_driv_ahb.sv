class mstr_driv_ahb extends uvm_driver#(mstr_item_ahb);

    `uvm_component_utils(mstr_driv_ahb)

    mstr_item_ahb mitem;

    extern function new(string name = "mstr_driv_ahb",uvm_component parent);
    extern function void build_phase(uvm_phase phase);
    extern function void connect_phase(uvm_phase phase);

endclass :mstr_driv_ahb

        function mstr_driv_ahb::new(string name = "mstr_driv_ahb",uvm_component parent);
            super.new(name,parent);  
        endfunction

        function void mstr_driv_ahb::build_phase(uvm_phase phase);
            super.build_phase(phase);
            if(!(uvm_config_db #(virtual intf_ahb)::get(null,"*","intf_ahb",intf)))
                `uvm_fatal(get_type_name(),"Failed to access interface");
            mitem = mstr_item_ahb :: type_id :: create("mitem",this);
        endfunction

        function void mstr_driv_ahb::connect_phase(uvm_phase phase);
            super.connect_phase(phase);
        endfunction