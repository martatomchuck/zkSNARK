pragma circom 2.1.5;

include "../node_modules/circomlib/circuits/comparators.circom";

// we can define as many templates as we want
template AgeCheck() {
    // signal is immutable - once it has received a value, you cannot change it
    // one signal - the age (we want to prove that the age is grater than the one set by the verifier without reveling the actual age)
    signal input age; // private
    signal input ageLimit; // public - set by the verifier
    signal output isAgeAboveLimit; // result of circuit computation, public by default

    component greaterThan = GreaterEqThan(7); // we work with 7 bit numbers because 2 ^ 7 is 128 [0, 2^7 -1] assuming that maximum age is at most 127

    // OUTPUT SIGNALS (public by default)
    greaterThan.in[0] <== age;  // greaterThan component determines whether age is greater than or equal to age limit
    greaterThan.in[1] <== ageLimit;
    greaterThan.out ==> isAgeAboveLimit; // if the output is 1 - proof is valid

}

// here we specify which template we are going to use
// we specify which input signals are public (all input signals are private by default)
component main {public [ageLimit]} = AgeCheck();
