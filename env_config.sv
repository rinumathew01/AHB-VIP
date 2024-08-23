class env_config extends uvm_object;
    `uvm_object_utils(env_config)

    virtual intf_ahb vif;

    magnt_config magnt_cfg;
    sagnt_config sagnt_cfg;

    uvm_active_passive_enum m_is_active;
    uvm_active_passive_enum s_is_active;

    extern function new(string name = "env_config");

endclass : env_config

        function env_config::new(string name = "env_config");
            super.new(name);
        endfunction