class slv_agnt_ahb extends uvm_agent;

    `uvm_component_utils(slv_agnt_ahb)

    sagnt_config sagnt_cfg;
    uvm_active_passive_agent is_active;

    slv_driv_ahb sdriv;
    slv_mon_ahb smon;
    sseqr_ahb sseqr;

    extern function new(string name = "slv_agnt_ahb",uvm_component parent);
    extern function void build_phase(uvm_phase phase);
    extern function void connect_phase(uvm_phase phase);
 
endclass :: slv_agnt_ahb

            function slv_agnt_ahb::new(string name = "slv_agnt_ahb",uvm_component parent);
                super.new(name,parent);
            endfunction

            function void slv_agnt_ahb::build_phase(uvm_phase phase);
                super.build_phase(phase);

                if(!uvm_config_db#(sagnt_config)::get(this,"*","sagnt_config",sagnt_cfg))
                    `uvm_fatal(get_type_name(),"could not fetch MAGENT CONFIG from config db")

                is_active = sagnt_cfg.is_active;

                smon = slv_mon_ahb :: type_id :: create("smon",this);

                if(is_active == UVM_ACTIVE) 
                    begin
                        sdriv = slv_driv_ahb :: type_id :: create("sdriv",this);
                        sseqr = sseqr_ahb :: type_id :: create("sseqr",this);
                    end
                
            endfunction

            function void slv_agnt_ahb::connect_phase(uvm_phase phase);
                super.connect_phase(phase);
                if(is_active == UVM_ACTIVE)
                    begin
                        sdriv.seq_item_port.connect(sseqr.seq_item_export);
                    end
            endfunction

