class mstr_agnt_ahb extends uvm_agent;

    `uvm_component_utils(mstr_agnt_ahb)

    magnt_config magnt_cfg;
    uvm_active_passive_agent is_active;

    mstr_driv_ahb mdriv;
    mstr_mon_ahb mmon;
    mseqr_ahb mseqr;

    extern function new(string name = "mstr_agnt_ahb",uvm_component parent);
    extern function void build_phase(uvm_phase phase);
    extern function void connect_phase(uvm_phase phase);
 
endclass

            function mstr_agnt_ahb::new(string name = "mstr_agnt_ahb",uvm_component parent);
                super.new(name,parent);
            endfunction

            function void mstr_agnt_ahb::build_phase(uvm_phase phase);
                super.build_phase(phase);

                if(!uvm_config_db#(magnt_config)::get(this,"*","magnt_config",magnt_cfg))
                    `uvm_fatal(get_type_name(),"could not fetch MAGENT CONFIG from config db")

                is_active = magnt_cfg.is_active;

                mmon = mstr_mon_ahb :: type_id :: create("mmon",this);

                if(is_active == UVM_ACTIVE) 
                    begin
                        mdriv = mstr_driv_ahb :: type_id :: create("mdriv",this);
                        mseqr = mseqr_ahb :: type_id :: create("mseqr",this);
                    end
                
            endfunction

            function void mstr_agnt_ahb::connect_phase(uvm_phase phase);
                super.connect_phase(phase);
                if(is_active == UVM_ACTIVE)
                    begin
                        mdriv.seq_item_port.connect(mseqr.seq_item_export);
                    end
            endfunction

