// Example testbench for MIPS processor

module testbench();

  logic        clk;
  logic        reset;

  logic [31:0] writedata, dataadr;
  logic        memwrite;

  // instantiate device to be tested
  top dut(clk, reset, writedata, dataadr, memwrite);
  
  // initialize test
  initial
    begin
      reset <= 1; # 22; reset <= 0;
    end

  // generate clock to sequence tests
  always
    begin
      clk <= 1; # 5; clk <= 0; # 5;
    end

// testbench for part A or B
/*
  // check that 7 gets written to address 84
  always@(negedge clk)
    begin
      if(memwrite) begin
        if(dataadr === 84 & writedata === 7) begin
	// if (dataadr === 20 & writedata === 28) begin
          $display("Simulation succeeded");
          //$stop;
        //end else if (dataadr !== 26) begin
        end else if (dataadr !== 80) begin
          $display("Simulation failed");
          //$stop;
        end
      end
    end
  */ 
// testbench for test_c
  always@(negedge clk)
    begin
      if(dataadr === 16 & writedata === -6) begin
	if(memwrite) begin
          $display("Test C Simulation succeeded");
          $stop;
        end
      end
    end

endmodule
