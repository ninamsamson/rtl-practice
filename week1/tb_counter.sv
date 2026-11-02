module tb_counter;
  logic       clk = 0, rst_n = 0, en = 0;
  logic [3:0] count;
  int         errors = 0;

  counter #(.WIDTH(4)) dut (.*);

  always #5 clk = ~clk;

  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb_counter);

    // hold reset for 2 cycles, drive inputs on the falling edge to avoid races
    repeat (2) @(negedge clk);
    rst_n = 1;
    en    = 1;

    // check 20 counts, including wrap-around at 16
    for (int i = 1; i <= 20; i++) begin
      @(posedge clk); #1;
      if (count !== 4'(i)) begin
        $error("Mismatch at cycle %0d: got %0d, expected %0d", i, count, 4'(i));
        errors++;
      end
    end

    if (errors == 0) $display("PASS: counter works");
    else             $display("FAIL: %0d errors", errors);
    $finish;
  end
endmodule