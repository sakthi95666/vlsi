`

module tb_nor;
    reg a;
    reg b;
    wire y;

    // Instantiate the DUT
    nor_gate uut (
        .a(a),
        .b(b),
        .y(y)
    );

    // Dump waveform
    initial begin
        $dumpfile("nor_tb.vcd");   // Output VCD file
        $dumpvars(0, tb_nor);      // Dump all variables in tb_nor
    end

    // Apply test inputs
    initial begin
        $display("time\ta\tb\ty");
        $monitor("%0dns\t%b\t%b\t%b", $time, a, b, y);

        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $display("Test complete");
        $finish;
    end
endmodule