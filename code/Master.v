module Master(clk, reset,
	start, slaveSelect, masterDataToSend, masterDataReceived,
	SCLK, CS, MOSI, MISO);
input clk;
input reset;
input start;
input [1:0]slaveSelect;
input [7:0]masterDataToSend;
output reg [7:0]masterDataReceived;
output reg SCLK;
output reg [0:2]CS;
input MISO;
output reg MOSI;  
reg [7:0]Send;
integer count;
reg[1:0] SS;
always@(slaveSelect)
begin
SS=slaveSelect;
end
assign Send=masterDataToSend;
always@(clk)
begin
SCLK=clk;
end
always@(reset)
begin
if(reset===1)
begin
MOSI=0;
masterDataReceived=0;
Send=0;
SCLK=0;
end
end
assign CS=(SS===0)?3'b011:
(SS===1)?3'b101:(SS===2)?3'b110:3'b111;
always@(posedge start )
begin
if(CS===3'b111)
begin
Send=masterDataToSend;
count=0;
masterDataReceived=0;
SS=slaveSelect;
MOSI=1'bz;
end
end
always@(posedge SCLK) 
begin
if(count[0]!==1'bx)
begin
if(count!=8)
begin
MOSI=Send[0];
Send=Send>>1;
end
else
begin
SS=3;
MOSI=1'bz;
end
end
end
always@(negedge SCLK)
begin
if(MISO!==1'bz)
begin
if(count[0]!==1'bx)
begin
if(count!=8)
begin
count=count+1;
Send[7]=MISO;
masterDataReceived=Send;
end
end
end
end
endmodule