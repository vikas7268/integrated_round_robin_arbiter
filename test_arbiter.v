
//////////////////////////////////////////////////////////////////////////////////

// Design Name: 
// Module Name: test_arbiter
// 
//////////////////////////////////////////////////////////////////////////////////


module test_arbiter(  );

reg clk;
reg [3:0]req;
wire [3:0]grant;

Arbiter_rr p3(clk,req,grant  );

initial 
begin
clk=1'b0;
end
always
begin
#5 clk =~clk;
end

initial 
begin
 
  #10 req=4'b1000; 
 #10 req=4'b0010;
 #20 req =4'b0100;
 #40 req =4'b0011;
 #20 req=4'b0010;
 #20 req =4'b0101;
 #20 req =4'b1011;
 #20 req=4'b001;
 #20 req =4'b0100;
 #20 req =4'b0011;
 #100 $finish;
 end
 
 initial
 begin
 $monitor ($time, "data input =%b  out = %b",req,grant);
 
end

endmodule

