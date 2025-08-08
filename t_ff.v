module t_f(input clk,rst,t,output reg q);
  initial begin
  q=1'b0;
  end
  always @ (posedge clk) begin
    if (!rst)
      q <= 0;
    else
      if (t==0)
      		q <= 0;
    	else
      		q <= ~q;
  end
endmodule
