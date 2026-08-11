# 🔢 Sum of Digits Using Verilog HDL

## 📌 Project Description

This project implements a **Sum of Digits Calculator** using Verilog HDL.

The circuit accepts a 16-bit unsigned decimal number and calculates the sum of all its decimal digits.

### Examples

```text
1234 → 1 + 2 + 3 + 4 = 10

567  → 5 + 6 + 7 = 18

999  → 9 + 9 + 9 = 27
```

The project includes the Verilog design, testbench, simulation, and waveform analysis.

---

## 🎯 Objectives

The objectives of this project are:

- Understand the concept of sum of digits.
- Design a sum-of-digits calculator using Verilog HDL.
- Extract decimal digits using modulo operation.
- Add the extracted digits.
- Create a Verilog testbench.
- Verify the design using simulation.
- Analyze the waveform using GTKWave.
- Upload the complete project to GitHub.

---

## 🛠️ Tools Used

- Verilog HDL
- Icarus Verilog
- GTKWave
- GitHub

---

## 📂 Project Structure

```text
SUM-OF-DIGITS/
│
├── README.md
├── sum_of_digits.v
├── sum_of_digits_tb.v
└── simulation/
    └── sum_of_digits_waveform.png
```

---

## 📖 What is Sum of Digits?

The **sum of digits** of a number is obtained by adding all the individual decimal digits.

For example:

```text
Number = 12345

1 + 2 + 3 + 4 + 5 = 15
```

Therefore:

```text
Sum of digits = 15
```

---

## 🧮 Algorithm

The circuit repeatedly performs two operations:

### Step 1: Extract the last digit

The modulo operator `% 10` extracts the last digit.

```text
1234 % 10 = 4
```

### Step 2: Remove the last digit

Integer division by 10 removes the last digit.

```text
1234 / 10 = 123
```

The process continues until the number becomes zero.

### Example

For `1234`:

```text
1234 % 10 = 4
1234 / 10 = 123

123 % 10 = 3
123 / 10 = 12

12 % 10 = 2
12 / 10 = 1

1 % 10 = 1
1 / 10 = 0
```

Therefore:

```text
4 + 3 + 2 + 1 = 10
```

---

## 🔌 Input

| Signal | Width | Description |
|--------|-------|-------------|
| `number` | 16 bits | Input decimal number |

---

## 📤 Output

| Signal | Width | Description |
|--------|-------|-------------|
| `digit_sum` | 20 bits | Sum of all decimal digits |

---

## 📊 Example Results

| Input Number | Calculation | Digit Sum |
|-------------:|-------------|----------:|
| 0 | 0 | 0 |
| 7 | 7 | 7 |
| 12 | 1 + 2 | 3 |
| 45 | 4 + 5 | 9 |
| 123 | 1 + 2 + 3 | 6 |
| 999 | 9 + 9 + 9 | 27 |
| 1234 | 1 + 2 + 3 + 4 | 10 |
| 5678 | 5 + 6 + 7 + 8 | 26 |
| 12345 | 1 + 2 + 3 + 4 + 5 | 15 |
| 65535 | 6 + 5 + 5 + 3 + 5 | 24 |

---

## 🔄 Working Principle

The design stores the input number in a temporary variable.

It repeatedly:

1. Extracts the last digit using `% 10`.
2. Adds the digit to the sum.
3. Divides the number by 10.
4. Repeats until the number becomes zero.

The final sum is assigned to `digit_sum`.

---

## 💻 Verilog Code

```verilog
module sum_of_digits (
    input wire [15:0] number,
    output reg [19:0] digit_sum
);

    integer temp;
    integer sum;

    always @(*) begin

        temp = number;
        sum  = 0;

        while (temp > 0) begin
            sum  = sum + (temp % 10);
            temp = temp / 10;
        end

        digit_sum = sum;

    end

endmodule
```

---

## 🧪 Testbench

The testbench checks the following input values:

```text
0
7
12
45
123
999
1234
5678
12345
65535
```

The testbench also generates a VCD file for waveform analysis.

---

## ▶️ Simulation Using Icarus Verilog

### Step 1: Compile

```bash
iverilog -o sum_sim sum_of_digits.v sum_of_digits_tb.v
```

### Step 2: Run

```bash
vvp sum_sim
```

---

## 📊 Expected Output

The terminal will display output similar to:

```text
Time=0  | Number=0     | Sum of Digits=0
Time=10 | Number=7     | Sum of Digits=7
Time=20 | Number=12    | Sum of Digits=3
Time=30 | Number=45    | Sum of Digits=9
Time=40 | Number=123   | Sum of Digits=6
Time=50 | Number=999   | Sum of Digits=27
Time=60 | Number=1234  | Sum of Digits=10
Time=70 | Number=5678  | Sum of Digits=26
Time=80 | Number=12345 | Sum of Digits=15
Time=90 | Number=65535 | Sum of Digits=24
```

---

## 📈 Waveform Simulation

The testbench generates:

```text
sum_of_digits.vcd
```

Open the waveform using GTKWave:

```bash
gtkwave sum_of_digits.vcd
```

Add these signals:

```text
number
digit_sum
```

The waveform should show:

```text
Number       Sum
----------------
0       →     0
7       →     7
12      →     3
45      →     9
123     →     6
999     →     27
1234    →     10
5678    →     26
12345   →     15
65535   →     24
```

---

## 📸 Simulation Result

Take a screenshot of the GTKWave simulation and save it as:

```text
simulation/sum_of_digits_waveform.png
```

Add the screenshot to this README:

```markdown
![Sum of Digits Simulation](simulation/sum_of_digits_waveform.png)
```

---

## ✅ Result

The **Sum of Digits Calculator** was successfully designed and simulated using Verilog HDL.

The circuit correctly calculates the sum of decimal digits.

For example:

```text
1234  → 10
5678  → 26
12345 → 15
65535 → 24
```

---

## 📚 Learning Outcomes

After completing this project, you will understand:

- Sum of digits
- Decimal digit extraction
- Modulo operation
- Integer division
- Combinational logic
- Verilog `always @(*)`
- `while` loops
- Testbench development
- Icarus Verilog simulation
- GTKWave waveform analysis
- GitHub project organization

---

## 👩‍💻 Author

**Satya Nandini**

GitHub Repository:

`sum-of-digits-verilog`