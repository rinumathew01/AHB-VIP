class base_test extends uvm_test;

    `uvm_component_utils(base_test)

    env_ahb env;
    env_config env_cfg;

    virtual intf_ahb vif;

    uvm_active_passive_enum m_is_active;
    uvm_active_passive_enum s_is_active;

    extern function new(string name = "base_test",uvm_component parent);
    extern function void build_phase(uvm_phase phase);
    extern function void connect_phase(uvm_phase phase);

endclass : base_test

        function base_test::new(string name = "base_test",uvm_component parent);
            super.new(name,parent);
        endfunction

        function void base_test::build_phase(uvm_phase phase);
            env_cfg = env_config :: type_id :: create("env_cfg");

            if(!(uvm_config_db #(virtual intf_ahb)::get(null,"","intf_ahb",intf)))
                `uvm_fatal(get_type_name(),"Failed to access vif from config db");

            env_cfg.vif = vif;

            m_is_active = UVM_ACTIVE;
            s_is_active = UVM_ACTIVE;

            env_cfg.m_is_active = m_is_active;
            env_cfg.s_is_active = s_is_active;

            uvm_config_db#(env_config)::set(this,"*","env_config",env_cfg);

            super.build_phase(phase);
            
            env = env_ahb ::type_id::create("env",this);
        endfunction

        function void base_test::connect_phase(uvm_phase phase);
            super.connect_phase(phase);
        endfunction