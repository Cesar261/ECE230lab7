module ones_compliment(
    input [3:0] A,
    input [3:0] B,
    output [3:0] Y
);

    // Wires for stage 1 carry and sum outputs
    wire [3:0] c1;
    wire [3:0] s1;
    
    // Wires for stage 2 carry outputs
    wire [3:0] c2;

    // --- STAGE 1: Calculate (A + B) ---
    full_adder fa0 (
        .A(A[0]), .B(B[0]), .Cin(1'b0),
        .Y(s1[0]), .Cout(c1[0])
    );
    full_adder fa1 (
        .A(A[1]), .B(B[1]), .Cin(c1[0]),
        .Y(s1[1]), .Cout(c1[1])
    );
    full_adder fa2 (
        .A(A[2]), .B(B[2]), .Cin(c1[1]),
        .Y(s1[2]), .Cout(c1[2])
    );
    full_adder fa3 (
        .A(A[3]), .B(B[3]), .Cin(c1[2]),
        .Y(s1[3]), .Cout(c1[3]) // c1[3] is the end-around carry
    );

    // --- STAGE 2: Add end-around carry (c1[3]) back to s1 ---
    full_adder fb0 (
        .A(s1[0]), .B(1'b0), .Cin(c1[3]), // Feed end-around carry here
        .Y(Y[0]), .Cout(c2[0])
    );
    full_adder fb1 (
        .A(s1[1]), .B(1'b0), .Cin(c2[0]),
        .Y(Y[1]), .Cout(c2[1])
    );
    full_adder fb2 (
        .A(s1[2]), .B(1'b0), .Cin(c2[1]),
        .Y(Y[2]), .Cout(c2[2])
    );
    full_adder fb3 (
        .A(s1[3]), .B(1'b0), .Cin(c2[2]),
        .Y(Y[3]), .Cout(c2[3])
    );

endmodule