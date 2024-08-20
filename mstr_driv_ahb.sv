class mstr_driv_ahb extends uvm_driver#(mstr_item_ahb);

    `uvm_component_utils(mstr_driv_ahb)

    function new(string name = "mstr_driv_ahb",uvm_component parent);
    super.new(name,parent);
        
    endfunction

    virtual intf_ahb intf;

    function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!(uvm_config_db #(virtual intf_ahb)::get(null,"*","intf_ahb",intf)))
        `uvm_fatal(get_type_name(),"Failed to access interface");

    endfunction

    function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    endfunction

    
endclass