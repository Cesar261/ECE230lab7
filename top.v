// Implement top level module for Lab 07
module top(
    input [9:0] sw,
    output [13:0] led
);

    // Instantiation 1: Half Subtractor
    // Inputs: sw[0] (A), sw[1] (B)
    // Outputs: led[0] (Y), led[1] (Borrow)
    half_sub sub_inst (
        .A(sw[0]),
        .B(sw[1]),
        .Y(led[0]),
        .Borrow(led[1])
    );

    // Instantiation 2: 4-bit One's Complement Adder
    // Inputs: sw[5:2] (Vector A), sw[9:6] (Vector B)
    // Outputs: led[5:2] (Vector Y)
    ones_compliment ones_inst (
        .A(sw[5:2]),
        .B(sw[9:6]),
        .Y(led[5:2])
    );

    // Instantiation 3: 8-bit Two's Complement Converter
    // Inputs: sw[9:2] (8-bit Input Vector)
    // Outputs: led[13:6] (8-bit Two's Complement Output)
    twos_compliment twos_inst (
        .A(sw[9:2]),
        .Y(led[13:6])
    );

endmodule