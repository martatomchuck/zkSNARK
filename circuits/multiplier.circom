pragma circom 2.1.5;

// Example of the circuit
template Multiplier2() {
    // Declaration of signals
    // Signals are immutable
    // Input signals are private as default (they cannot be called in other circuits)
    // Output signals are public as default
    signal input a;
    signal input b;
    signal output c;

    // Constraints; double arrow will imply the presence of contraint (===)
    // Constraints have to be quadratic expression
    c <== a*b;
}

// Making input signals public
component main {public [a,b]} = Multiplier2();