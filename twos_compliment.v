module twos_compliment(
    input [7:0] A,
    output [7:0] Y
);

    wire [7:0] c; // Defined as 'c' to match c[0] through c[7]

    // Bit 0: Invert A[0] and add 1 via Cin = 1'b1
    full_adder fa0 (
        .A(~A[0]), .B(1'b0), .Cin(1'b1),
        .Y(Y[0]), .Cout(c[0])
    );
    full_adder fa1 (
        .A(~A[1]), .B(1'b0), .Cin(c[0]),
        .Y(Y[1]), .Cout(c[1])
    );
    full_adder fa2 (
        .A(~A[2]), .B(1'b0), .Cin(c[1]),
        .Y(Y[2]), .Cout(c[2])
    );
    full_adder fa3 (
        .A(~A[3]), .B(1'b0), .Cin(c[2]),
        .Y(Y[3]), .Cout(c[3])
    );
    full_adder fa4 (
        .A(~A[4]), .B(1'b0), .Cin(c[3]),
        .Y(Y[4]), .Cout(c[4])
    );
    full_adder fa5 (
        .A(~A[5]), .B(1'b0), .Cin(c[4]),
        .Y(Y[5]), .Cout(c[5])
    );
    full_adder fa6 (
        .A(~A[6]), .B(1'b0), .Cin(c[5]),
        .Y(Y[6]), .Cout(c[6])
    );
    full_adder fa7 (
        .A(~A[7]), .B(1'b0), .Cin(c[6]),
        .Y(Y[7]), .Cout(c[7])
    );

endmodule