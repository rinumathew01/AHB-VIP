interface intf_ahb(input logic clk);

    logic HRESETn;
    logic HREADY;
    logic [1:0] HTRANS;
    logic [2:0] HBURST;
    logic [2:0] HSIZE;
    logic HWRITE;
    logic [31:0] HADDR;
    logic [31:0] HWDATA;
    logic [31:0] HRDATA;
    logic [1:0] HRESP;

    clocking mdrv_cb@(posedge HCLK);
            default input #1 output #0;

            output HTRANS;
            output HBURST;
            output HSIZE;
            output HWRITE;
            output HADDR;
            output HWDATA;
            input HREADY;
            input negedge HRESP;
            input HRDATA;

    endclocking
    clocking mmon_cb@(posedge HCLK);
            default input #1 output #0;

            input HRESETn;
            input HREADY;
            input HTRANS;
            input HBURST;
            input HSIZE;
            input HWRITE;
            input HADDR;
            input HWDATA;
            input HRESP;
            input HRDATA;

    endclocking

    clocking sdrv_cb@(posedge HCLK);
            default input #1 output #0;

            input HTRANS;
            input HBURST;
            input HSIZE;
            input HWRITE;
            input HADDR;
            input HWDATA;
            inout HREADY;
            output HRESP;
            output negedge HRDATA;

    endclocking

    clocking smon_cb@(posedge HCLK);
            default input #1 output #0;

            input HREADY;
            input HTRANS;
            input HBURST;
            input HSIZE;
            input HWRITE;
            input HADDR;
            input HWDATA;
            input HRESP;
            input HRDATA;

    endclocking

endinterface