class sagnt_config extends uvm_object;
    `uvm_object_utils(sagnt_config)

    virtual intf_ahb vif;
    uvm_active_passive_enum is_active;

    extern function new (string name="sagnt_config");

endclass :sagnt_config

    function sagnt_config::new(string name="sagnt_config");
        super.new(name);
    endfunction