class slv_driv_ahb extends uvm_driver#(slv_item_ahb);

    `uvm_component_utils(slv_driv_ahb)

    slv_item_ahb sitem;

    extern function new(string name = "slv_driv_ahb",uvm_component parent);
    extern function void build_phase(uvm_phase phase);
    extern function void connect_phase(uvm_phase phase);

endclass :: slv_driv_ahb

        function slv_driv_ahb::new(string name = "slv_driv_ahb",uvm_component parent);
            super.new(name,parent);  
        endfunction

        function void slv_driv_ahb::build_phase(uvm_phase phase);
            super.build_phase(phase);
            if(!(uvm_config_db #(virtual intf_ahb)::get(null,"*","intf_ahb",intf)))
                `uvm_fatal(get_type_name(),"Failed to access interface");
            sitem = slv_item_ahb :: type_id :: create("sitem",this);
        endfunction

        function void slv_driv_ahb::connect_phase(uvm_phase phase);
            super.connect_phase(phase);
        endfunction