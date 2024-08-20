class mstr_agnt_ahb extends uvm_env;

    `uvm_component_utils(mstr_agnt_ahb)

    function new(string name = "mstr_agnt_ahb",uvm_component parent);
    super.new(name,parent);
        
    endfunction

    mstr_driv_ahb drv;
    mstr_mon_ahb mon;

    function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    drv = mstr_driv_ahb :: type_id :: create("drv",this);
    mon = mstr_mon_ahb :: type_id :: create("mon",this);
    endfunction

    function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    endfunction

    
endclass