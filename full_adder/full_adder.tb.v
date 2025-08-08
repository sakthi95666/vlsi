

module tb_full_adder;
    reg a;
    reg b;
    reg cin;
    wire sum;
    wire cout;

    // Instantiate DUT
    full_adder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    // Dump waveform
    initial begin
        $dumpfile("full_adder_tb.vcd");  // Output VCD file
        $dumpvars(0, tb_full_adder);     // Dump all variables in tb_full_adder
    end

    // Apply test vectors
    initial begin
        $display("time\ta\tb\tcin\tsum\tcout");
        $monitor("%0dns\t%b\t%b\t%b\t%b\t%b", $time, a, b, cin, sum, cout);

        // All possible combinations
        a=0; b=0; cin=0; #10;
        a=0; b=0; cin=1; #10;
        a=0; b=1; cin=0; #10;
        a=0; b=1; cin=1; #10;
        a=1; b=0; cin=0; #10;
        a=1; b=0; cin=1; #10;
        a=1; b=1; cin=0; #10;
        a=1; b=1; cin=1; #10;

        $display("Test complete");
        $finish;
    end
endmodule