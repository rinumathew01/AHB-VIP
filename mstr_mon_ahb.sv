class mstr_mon_ahb extends uvm_monitor;

    `uvm_component_utils(mstr_mon_ahb)

    virtual intf_ahb vif;
    mstr_item_ahb mitem;

    extern function new(string name = "mstr_mon_ahb",uvm_component parent);
    extern function void build_phase(uvm_phase phase);
    extern function void connect_phase(uvm_phase phase);

endclass :mstr_mon_ahb

        function mstr_mon_ahb::new(string name = "mstr_mon_ahb",uvm_component parent);
            super.new(name,parent);
        endfunction
        
        function void mstr_mon_ahb::build_phase(uvm_phase phase);
            super.build_phase(phase);
            if(!(uvm_config_db #(virtual intf_ahb)::get(null,"*","intf_ahb",vif)))
                `uvm_fatal(get_type_name(),"Failed to access interface");
            mitem = mstr_item_ahb :: type_id :: create("mitem",this);
        endfunction

        function void mstr_mon_ahb::connect_phase(uvm_phase phase);
            super.connect_phase(phase);
        endfunction