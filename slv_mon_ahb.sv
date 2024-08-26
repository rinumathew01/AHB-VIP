class slv_mon_ahb extends uvm_monitor;

    `uvm_component_utils(slv_mon_ahb)

    virtual intf_ahb vif;
    slv_item_ahb sitem;

    extern function new(string name = "slv_mon_ahb",uvm_component parent);
    extern function void build_phase(uvm_phase phase);
    extern function void connect_phase(uvm_phase phase);

endclass : slv_mon_ahb

        function slv_mon_ahb::new(string name = "slv_mon_ahb",uvm_component parent);
            super.new(name,parent);
        endfunction
        
        function void slv_mon_ahb::build_phase(uvm_phase phase);
            super.build_phase(phase);
            if(!(uvm_config_db #(virtual intf_ahb)::get(null,"*","intf_ahb",vif)))
                `uvm_fatal(get_type_name(),"Failed to access interface");
            sitem = slv_item_ahb :: type_id :: create("sitem",this);
        endfunction

        function void slv_mon_ahb::connect_phase(uvm_phase phase);
            super.connect_phase(phase);
        endfunction