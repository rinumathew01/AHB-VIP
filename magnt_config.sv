class magnt_config extends uvm_object;
    `uvm_object_utils(magnt_config)

    virtual intf_ahb vif;
    uvm_active_passive_enum is_active;

    extern function new (string name="magnt_config");

endclass : magnt_config

    function magnt_config::new(string name="magnt_config");
        super.new(name);
    endfunction