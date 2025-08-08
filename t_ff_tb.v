module t_f_tb;
  reg clk,rst,t;
  wire q;
  t_f g1(.clk(clk),.rst(rst),.t(t),.q(q));
  initial fork
    clk=0;
    rst=0;
    t=0;
    repeat(20)
      #5 clk = ~clk;
    repeat(20)#5 rst=~rst;
    repeat(20)#5t=~t;
      join
      initial begin
            $monitor ("T=%0t rst=%0b t=%0d q=%0d", $time, rst, t, q);
      end 
  initial begin
        $dumpfile("t_f_tb.vcd");
        $dumpvars(0);
      end
    endmodule
