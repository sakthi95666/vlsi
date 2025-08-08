`
module full_subtractor_tb;

    reg A, B, Bin;
    wire Diff, Bout;

    // Instantiate the full subtractor
    full_subtractor fs(A, B, Bin, Diff, Bout);

    initial begin
        $dumpfile("full_subtractor.vcd");
        $dumpvars(0, full_subtractor_tb);

        // Test all input combinations
        A = 0; B = 0; Bin = 0; #10;
        A = 0; B = 0; Bin = 1; #10;
        A = 0; B = 1; Bin = 0; #10;
        A = 0; B = 1; Bin = 1; #10;
        A = 1; B = 0; Bin = 0; #10;
        A = 1; B = 0; Bin = 1; #10;
        A = 1; B = 1; Bin = 0; #10;
        A = 1; B = 1; Bin = 1; #10;

        $finish;
    end

endmodule