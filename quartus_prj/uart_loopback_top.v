module uart_loopback_top(
    input           sys_clk,            //外部50M时钟
    input           sys_rst_n,          //外部复位信号，低有效

    input           uart_rxd,           //UART接收端口
    //output  wire [7:0] uart_recv_data
    output  wire [15:0]  dac_data,
    output  wire [15:0] uart_recv_data
    );

//parameter define
parameter  CLK_FREQ = 50000000;         //定义系统时钟频率
parameter  UART_BPS = 9600;           //定义串口波特率    
//wire define   
//wire  [7:0]   dac_data;
wire       uart_recv_done;              //UART接收完成
//wire [15:0] uart_recv_data;              //UART接收数据

wire       uart_start_status;
wire       uart_stop_status;
//*****************************************************
//**                    main code
//*****************************************************
//串口接收模块     
uart_recv #(                          
    .CLK_FREQ       (CLK_FREQ),         //设置系统时钟频率
    .UART_BPS       (UART_BPS))         //设置串口接收波特率
u_uart_recv(                 
    .sys_clk        (sys_clk), 
    .sys_rst_n      (sys_rst_n),
	.start_status   (uart_start_status),              //定义启动状态
	.stop_status    (uart_stop_status),      //定义停止状态       
    .uart_rxd       (uart_rxd),
    .uart_done      (uart_recv_done),
    .uart_data      (uart_recv_data)
    );

 /*
dds dds_inst1(
    .sys_clk  (sys_clk)  ,
    .sys_rst_n(sys_rst_n)  ,
    .sel      (uart_recv_data[7])  ,
    .flag     (uart_done)  ,
    .freq     (uart_recv_data[6:0]),

    .dac_data (dac_data[7:0])

);

dds dds_inst2(
    .sys_clk  (sys_clk)  ,
    .sys_rst_n(sys_rst_n)  ,
    .sel      (uart_recv_data[15])  ,
    .flag     (uart_done)  ,
    .freq     (uart_recv_data[14:8]),

    .dac_data (dac_data[15:8])

);
   */ 
    

endmodule
