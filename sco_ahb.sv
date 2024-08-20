class sco_ahb extends uvm_env;

    `uvm_component_utils(sco_ahb)

    function new(string name = "sco_ahb", uvm_component parent);
    super.new(name,parent);
        
    endfunction

    function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    endfunction

    function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    endfunction

    
endclass