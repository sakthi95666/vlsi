

module tb_or;
    reg a;
    reg b;
    wire y;

    // Instantiate DUT
    or_gate uut (
        .a(a),
        .b(b),
        .y(y)
    );

    // Dump waveform
    initial begin
        $dumpfile("or_tb.vcd");   // Output VCD file
        $dumpvars(0, tb_or);      // Dump all variables in tb_or
    end

    // Apply test patterns
    initial begin
        $display("time\ta\tb\ty");
        $monitor("%0dns\t%b\t%b\t%b", $time, a, b, y);

        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        // Extra toggles
        a = 0; b = 0; #5;
        a = 1; b = 1; #5;

        $display("Test complete");
        $finish;
    end
endmodule