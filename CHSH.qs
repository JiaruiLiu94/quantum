// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT license.

//////////////////////////////////////////////////////////////////////
// This file contains reference solutions to all tasks.
// The tasks themselves can be found in Tasks.qs file.
// We recommend that you try to solve the tasks yourself first,
// but feel free to look up the solution if you get stuck.
//////////////////////////////////////////////////////////////////////

namespace Quantum.Kata.GHZGame {

    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Logical;


    //////////////////////////////////////////////////////////////////
    
    //////////////////////////////////////////////////////////////////

    // Task 1.1. Win condition
    function WinCondition_CHSH (r:Bool, s:Bool,a:Bool,b:Bool) : Bool {

        return (r and s) == Xor(a,b);
    }





    //////////////////////////////////////////////////////////////////
    // Part II. Quantum GHZ
    //////////////////////////////////////////////////////////////////

    // Task 2.1. Entangled triple
    // The entangled state shared by Alice and Bob will be |ψi = (|00i +|11i)/√2;
    operation CreateEntangledTriple_CHSH (qs : Qubit[]) : Unit is Adj {
        H(qs[0]);
        CNOT(qs[0],qs[1]);
    }


    // Task 2.2. Quantum strategy
    operation QuantumStrategy_CHSH (input : Bool, qubit : Qubit) : Bool {
        if (input) {
            H(qubit);
        }
        return ResultAsBool(M(qubit));
    }

operation AliceQuantum (bit : Bool, qubit : Qubit) : Bool {
        // Measure in sign basis if bit is 1, and
        // measure in computational basis if bit is 0
        let basis = bit ? PauliX | PauliZ;
        return ResultAsBool(Measure([basis], [qubit]));
    }
    operation RotateBobQubit (clockwise : Bool, qubit : Qubit) : Unit {
        let angle = 2.0 * PI() / 8.0;
        Ry(clockwise ? -angle | angle, qubit);
    }
    operation BobQuantum(bit : Bool, qubit : Qubit) : Bool {
        RotateBobQubit(not bit, qubit);
        return ResultAsBool(M(qubit));
    }
    operation PlayQuantumCHSH (r:Bool, s:Bool ) : (Bool, Bool) {

        using ((a, b) = (Qubit(), Qubit())) {
            CreateEntangledTriple_CHSH([a, b]);
            let aliceResult = AliceQuantum(r,a);
            let bobResult = BobQuantum(s,b);
            Reset(a);
            Reset(b);
            return (aliceResult, bobResult);
        }
    }

}

