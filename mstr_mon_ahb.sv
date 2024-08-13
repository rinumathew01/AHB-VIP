class mstr_mon_ahb extends uvm_env;

    `uvm_component_utils(mstr_mon_ahb)

    function new(string name = "mstr_mon_ahb",parent = componennt);
    super.new(name,component);
        
    endfunction

    function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    endfunction

    function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    endfunction

    
endclass