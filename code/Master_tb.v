module MSTB();
reg reset;
reg [7:0] masterDataToSend;
wire [7:0] masterDataReceived;
reg MISO;
reg clk;
reg start;
reg [1:0]slaveSelect;
wire SCLK;
wire [2:0]CS;
wire MOSI;
reg[7:0]ReceivedData;
Master MS(.clk(clk), .reset(reset),
	.start(start), .slaveSelect(slaveSelect), 
.masterDataToSend(masterDataToSend), .masterDataReceived(masterDataReceived),
	.SCLK(SCLK), .CS(CS), .MOSI(MOSI), .MISO(MISO));
localparam PERIOD = 20;
reg [7:0]ReceivedTemp;
reg [7:0]Temp;
initial 
begin
Temp=0;
reset= 1;
clk=0;
start=0;
#PERIOD
reset=0;
masterDataToSend=8'b01010111;
ReceivedData=8'b11011010;
ReceivedTemp=ReceivedData;
slaveSelect=0;
start=1;
#PERIOD start=0;
#(PERIOD*20);
if(ReceivedTemp==masterDataReceived)
$display ("From Slave to Master : Success (Expected: %b, Received: %b)",ReceivedTemp,masterDataReceived);
else
$display ("From Slave to Master : Failure (Expected: %b, Received: %b)",ReceivedTemp,masterDataReceived);
if(Temp==masterDataToSend)
$display ("From Master to Slave : Success (Expected: %b, Received: %b)",masterDataToSend,Temp);
else
$display ("From Master to Slave : Failure (Expected: %b, Received: %b)",masterDataToSend,Temp);
end 
always@(posedge SCLK)
begin
if(CS!==3'b111)
begin
MISO=ReceivedData[0];
ReceivedData=ReceivedData>>1;
end
else
MISO=1'bz;
end
always@(negedge SCLK)
begin
if(CS!==3'b111)
begin
if(MOSI!==1'bz)
begin
Temp=Temp>>1;
Temp[7]=MOSI;
end
end
else
MISO=1'bz;
end
always 
# PERIOD clk=~clk;
endmodule