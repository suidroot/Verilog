// Code your design here
module counter (clock, 
                clockinh,
                reset,
                countoutput,
                carryout
               );
  
  parameter SIZE = 8;
  
  input clock;
  input clockinh;
  input reset;
  output reg [SIZE+1:0] countoutput;
  output reg carryout;
  
  initial begin
    countoutput = 0;
  end
  
  always @(posedge clock) begin
    if (~clockinh) begin
      if (countoutput+1 < SIZE) 
        begin
        countoutput = countoutput + 1;
      end 
      else 
        begin
          carryout = 1;
          countoutput = 0;
        end 
    end 
    else if (reset) 
      begin
        countoutput = 0;
        carryout = 0;
      end 
    else 
      begin
        countoutput = countoutput;
      end
    end
    
endmodule
    
         
        