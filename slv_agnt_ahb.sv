class slv_agnt_ahb extends uvm_env;

    `uvm_component_utils(slv_agnt_ahb)

    function new(string name = "slv_agnt_ahb",parent = componennt);
    super.new(name,component);
        
    endfunction

    function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    endfunction

    function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    endfunction

    
endclass