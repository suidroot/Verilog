module test;

  
  wire q[7:0];
  reg oe;
  reg din;
  reg reset;
  reg shcp;
  reg stcp;
    
  integer i;
    
  // Instantiate design under test
  shiftregister SHIFTREGISTER(.q0(q[0]), .q1(q[1]), .q2(q[2]),
                              .q3(q[3]), .q4(q[4]), .q5(q[5]),
                              .q6(q[6]), .q7(q[7]), .oe(oe),
                              .din(din), .reset(reset), .shcp(shcp),
                              .stcp(stcp));
          
  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1);
 
    shcp = 0;
    stcp = 0;
    din = 0;
    display;
    
    $display("SHCP enable");
    shcp = 1;
    stcp = 0;
    oe = 1;
    reset = 1;
    display;
     
    shcp = 0;
    stcp = 0;
    display;

    $display("Reset Data");
    shcp = 1;
    stcp = 0;
    oe = 1;
    reset = 0;
    display;
    
    shcp = 0;
    stcp = 0;
    display;

    $display("Clock in data");
    
    for (i = 0; i <= 7; i=i+1) begin
      shcp = 1;
      stcp = 1;
      oe = 1;
      reset = 1;
      din = ~din;
     display;
      
        shcp = 0;
      stcp = 0;
      display;

    end 
    
    $display("Output data");
    shcp = 1;
    stcp = 0;
    oe = 0;
    reset = 1;
    display;
    
    shcp = 0;
    stcp = 0;
    display;
        
    $display("Reset Data");
    shcp = 1;
    stcp = 0;
    oe = 1;
    reset = 0;
    display;

    shcp = 0;
    stcp = 0;
    display;
    
    $display("SHCP enable");
    shcp = 1;
    stcp = 0;
    oe = 1;
    reset = 1;
    display;

    shcp = 0;
    stcp = 0;
    display;
    
    $display("Output data");
    shcp = 1;
    stcp = 0;
    oe = 0;
    reset = 1;
    display;
    
    shcp = 0;
    stcp = 0;
    display;
       
  end
  
  task display;
    #1 $display("shcp:%0h, stcp:%0h, oe:%0h, din:%0h, reset:%0h, q[0]:%0h, q[1]:%0h, q[2]:%0h, q[3]:%0h, q[4]:%0h, q[5]:%0h, q[6]:%0h, q[7]:%0h", 
                shcp, stcp, oe, din, reset, q[0], q[1], q[2], q[3], q[4], q[5], q[6], q[7]);
  endtask

  
 endmodule