class env_ahb extends uvm_env;

    `uvm_component_utils(env_ahb)

    env_config env_cfg;

    magnt_config magnt_cfg;
    sagnt_config sagnt_cfg;

    mstr_agnt_ahb mgnt;
    slv_agnt_ahb sgnt;

    vseqr_ahb vseqr;

    extern function new(string name = "env_ahb",uvm_component parent);
    extern function void build_phase(uvm_phase phase);
    extern function void connect_phase(uvm_phase phase);

endclass :env_ahb

        function env_ahb::new(string name = "env_ahb",uvm_component parent);
            super.new(name,parent);  
        endfunction

        function void env_ahb::build_phase(uvm_phase phase);
            if(!uvm_config_db#(env_config)::get(this,"","env_config",env_cfg))
                begin
                    `uvm_fatal(get_type_name(),"could not fetch ENV config from config db")
                end

            magnt_cfg = magnt_config :: type_id :: create("magnt_cfg");
            magnt_cfg.vif = env_cfg.vif;
            magnt_cfg.is_active = env_cfg.m_is_active;
            uvm_config_db#(magnt_config)::set(this,"*","magnt_config",magnt_cfg);

            sagnt_cfg = magnt_config :: type_id :: create("sagnt_cfg");
            sagnt_cfg.vif = env_cfg.vif;
            sagnt_cfg.is_active = env_cfg.s_is_active;
            uvm_config_db#(sagnt_config)::set(this,"*","sagnt_config",sagnt_cfg);

            super.build_phase(phase);

            mgnt = mstr_agnt_ahb :: type_id :: create("magnt",this);
            sgnt = slv_agnt_ahb :: type_id :: create("sagnt",this);

            vseqr = vseqr_ahb :: type_id :: create("vseqr",this);

        endfunction

        function void env_ahb::connect_phase(uvm_phase phase);
            super.connect_phase(phase);
            if(magnt_cfg.is_active == UVM_ACTIVE)
                begin
                    vseqr.mseqr = magnt.mseqr;
                end
            if(sagnt_cfg.is_active == UVM_ACTIVE)
                begin
                    vseqr.sseqr = sagnt.sseqr;
                end
        endfunction