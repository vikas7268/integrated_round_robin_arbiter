
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.05.2020 20:40:03
// Design Name: 
// Module Name: Arbiter_rr
// Project Name: Integrated Round Robin arbiter one hot encoding technique
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Arbiter_rr(clk,req,grant  );
input clk;
input [3:0]req;
output reg [3:0]grant;

parameter 
A=4'b0100, B=4'b0010,C=4'b0001,D=4'b1000;

reg [3:0] curr_state, next_state;

always @(posedge clk )
begin
      curr_state <= next_state;
  end
 
always @(curr_state or req)
begin
 
casex (curr_state)

 A:         begin
             casex(req)
              4'b1000:  begin    next_state <= A;
                    grant<=4'b1000;
                    end 
              4'bx1xx :
                begin
                      next_state <= B;
                      grant<=4'b0100;
                    end 
            4'bx01x:
             begin
                    next_state <= C;
                    grant<=4'b0010;
                    end 
             4'bx001:
              begin
                    next_state <= D;
                    grant<=4'b0001;
                    end 
              
              endcase
              end      
                    
  B:         begin
                casex(req)
                4'b0100:
                   begin    next_state <= B;
                       grant<=4'b0100;
                       end 
                4'bxx1x: 
                   begin
                             next_state <= C;
                             grant<=4'b0010;
                           end 
                 4'b1x00:
                    begin
                           next_state <= A;
                           grant<=4'b1000;
                           end 
                 4'bxx01:
                     begin
                           next_state <= D;
                           grant<=4'b0001;
                           end 
                 
                   endcase    
                  end    
 C :      begin
          casex(req) 
           4'b0010:
          begin    next_state <= C;
              grant<=4'b0010;
              end 
          4'b01x0: 
          begin
                    next_state <= B;
                    grant<=4'b0100;
                  end 
          4'bxxx1:
           begin
                  next_state <=D;
                  grant<=4'b0001;
                  end 
          4'b1xx0:
            begin
                  next_state <= A;
                  grant<=4'b1000;
                  end 
           endcase
           end
                              
 D:         begin
            casex(req)
            4'b0001:
            begin    next_state <= D;
                grant<=4'b0001;
                end 
            4'b1xxx: 
            begin
                      next_state <= A;
                      grant<=4'b1000;
                    end 
            4'b001x:
             begin
                    next_state <= C;
                    grant<=4'b0010;
                    end 
             4'b01xx:
              begin
                    next_state <= B;
                    grant<=4'b0100;
                    end     
            endcase
            end         
            
                               
default : begin
           end
endcase
end


endmodule


