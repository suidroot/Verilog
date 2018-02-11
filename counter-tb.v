// Code your testbench here
// or browse Examples
module test;
  
  parameter SIZE = 8;

  
  reg clock;
  reg clockinh;
  reg [SIZE+1:0] counteroutput;
  reg carryout;
  reg reset;
  
  int i;
  
  counter COUNTER(.clock(clock), 
                  .clockinh(clockinh), 
                  .countoutput(counteroutput),
                  .carryout(carryout),
                  .reset(reset)
            
                 );
  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    $display("Count to %d", SIZE*4);
    for (i = 0; i < SIZE*4; i = i + 1) begin
      clock = 1;
      display;
      clock = 0; 
      display;
    end
 
    $display("Count to 4");
    for (i = 0; i < 4; i = i + 1) begin
      clock = 1;
      display;
      clock = 0;  
      display;
    end
    
    $display("Reset Data");
    clock = 1;
    reset = 1;
    display;
    clock = 0;
    display;
    
    $display("Count to 2");
    for (i = 0; i < 2; i = i + 1) begin
      clock = 1;
      display;
      clock = 0; 
      display;
    end
    
    $display("Inhibit 2 cycles");
    for (i = 0; i < 2; i = i + 1) begin
      clock = 1;
      clockinh = 1;
      display;
      clock = 0;
      display;
    end
    
    clockinh = 0;
    
    $display("Count to 2");
    for (i = 0; i < 2; i = i + 1) begin
      clock = 1;
      display;
      clock = 0; 
      display;
    end
  
  end
  task display;
    #1 $display("clock:%0h, clockinh:%0h, reset:%0h, clockoutput:%0b, carryout:%0h", 
                clock, clockinh, reset, counteroutput, carryout);
  endtask  
  
  
  
endmodule