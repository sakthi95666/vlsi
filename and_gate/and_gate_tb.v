module tb_and;
    reg a;
    reg b;
    wire y;

    // Instantiate DUT
    and_gate uut (
        .a(a),
        .b(b),
        .y(y)
    );

    // Dump waveform
    initial begin
        $dumpfile("and_tb.vcd");   // Output VCD file
        $dumpvars(0, tb_and);      // Dump all variables in tb_and
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