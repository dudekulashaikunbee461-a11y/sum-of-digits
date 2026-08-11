// ============================================================
// Testbench for Sum of Digits
// ============================================================

`timescale 1ns/1ps

module sum_of_digits_tb;

    reg  [15:0] number;
    wire [19:0] digit_sum;

    // Instantiate Sum of Digits module
    sum_of_digits uut (
        .number(number),
        .digit_sum(digit_sum)
    );

    // Generate waveform
    initial begin
        $dumpfile("sum_of_digits.vcd");
        $dumpvars(0, sum_of_digits_tb);
    end

    // Test cases
    initial begin

        // 0 -> 0
        number = 0;
        #10;

        // 7 -> 7
        number = 7;
        #10;

        // 12 -> 3
        number = 12;
        #10;

        // 45 -> 9
        number = 45;
        #10;

        // 123 -> 6
        number = 123;
        #10;

        // 999 -> 27
        number = 999;
        #10;

        // 1234 -> 10
        number = 1234;
        #10;

        // 5678 -> 26
        number = 5678;
        #10;

        // 12345 -> 15
        number = 12345;
        #10;

        // 65535 -> 24
        number = 65535;
        #10;

        $finish;

    end

    // Display results
    initial begin
        $monitor(
            "Time=%0t | Number=%0d | Sum of Digits=%0d",
            $time,
            number,
            digit_sum
        );
    end

endmodule