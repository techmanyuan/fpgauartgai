module  dds
(
    input   wire            sys_clk     ,
    input   wire            sys_rst_n   ,
    input   wire            sel         ,
    input   wire            flag        ,
    input   wire  [7:0]     freq        ,

    output  wire    [7:0]   dac_data
);



dds_ctrl    dds_ctrl_inst
(
    .sys_clk     (sys_clk),
    .sys_rst_n   (sys_rst_n),
    .wave_sel    (sel),
    .flag        (flag),
    .freq        (freq),

    .dac_data    (dac_data)
);

endmodule
