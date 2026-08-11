// ============================================================
// Sum of Digits
// Verilog HDL
//
// Calculates the sum of all decimal digits of a 16-bit number.
// ============================================================

module sum_of_digits (
    input  wire [15:0] number,
    output reg  [19:0] digit_sum
);

    integer temp;
    integer sum;

    always @(*) begin

        temp = number;
        sum  = 0;

        // Extract and add each digit
        while (temp > 0) begin
            sum  = sum + (temp % 10);
            temp = temp / 10;
        end

        digit_sum = sum;

    end

endmodule