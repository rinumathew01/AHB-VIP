class env_ahb extends uvm_env;

    `uvm_component_utils(env_ahb)

    function new(string name = "env_ahb",uvm_component parent);
    super.new(name,parent);
        
    endfunction

    mstr_agnt_ahb mgnt;
    slv_agnt_ahb sgnt;

    function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    mgnt = mstr_agnt_ahb :: type_id :: create("magnt",this);
    sgnt = slv_agnt_ahb :: type_id :: create("sagnt",this);
    endfunction

    function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    endfunction

    
endclass