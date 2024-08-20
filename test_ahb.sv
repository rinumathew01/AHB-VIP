class test_ahb extends uvm_test;

    `uvm_component_utils(test_ahb)

    function new(string name = "test_ahb",uvm_component parent);
    super.new(name,parent);
        
    endfunction

    env_ahb env;

    function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = env_ahb ::type_id::create("env",this);
    endfunction

    function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    endfunction

    
endclass