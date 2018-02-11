// 8 bit shift register based on 74HC595

module shiftregister (
  output reg q0,
  output reg q1,
  output reg q2,
  output reg q3,
  output reg q4,
  output reg q5,
  output reg q6,
  output reg q7,
  input oe,  // output enable active low
  input din, // ds
  input reset, // mr active low
  input shcp, // shift register clock input
  input stcp // storage register clock input);
);

  reg [7:0] storage;
  
  initial begin
     storage = 8'b00000000;
  end
  
  always @(posedge shcp) begin
    // Reset Storage register and outputs    
    if (~reset) begin
      storage = 8'b00000000;
      q0 <= 1'b0;
      q1 <= 1'b0;
      q2 <= 1'b0;
      q3 <= 1'b0;
      q4 <= 1'b0;
      q5 <= 1'b0;  
      q6 <= 1'b0;
      q7 <= 1'b0;
    end else begin
      // output data to q outputs  
      if (~oe) begin
        q0 <= storage[0];
        q1 <= storage[1];
        q2 <= storage[2];
        q3 <= storage[3];
        q4 <= storage[4];
        q5 <= storage[5];
        q6 <= storage[6];
        q7 <= storage[7];
      end
      // Shift data into sotrage register
      if (stcp) begin
        storage = storage << 1;
        storage[0] <= din;
      end 
    end   
  end
 
endmodule