class sco_ahb extends uvm_env;

    `uvm_component_utils(sco_ahb)

    function new(string name = "sco_ahb",parent = componennt);
    super.new(name,component);
        
    endfunction

    function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    endfunction

    function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    endfunction

    
endclass