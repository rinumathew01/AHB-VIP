class test_ahb extends uvm_test;

    `uvm_component_utils(test_ahb)

    env_ahb env;

    extern function new(string name = "test_ahb",uvm_component parent);
    extern function void build_phase(uvm_phase phase);
    extern function void connect_phase(uvm_phase phase);

endclass :: test_ahb

        function test_ahb::new(string name = "test_ahb",uvm_component parent);
            super.new(name,parent);
        endfunction

        function void test_ahb::build_phase(uvm_phase phase);
            super.build_phase(phase);
            env = env_ahb ::type_id::create("env",this);
        endfunction

        function void test_ahb::connect_phase(uvm_phase phase);
            super.connect_phase(phase);
        endfunction