// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT license.

//////////////////////////////////////////////////////////////////////
// This file contains reference solutions to all tasks.
// The tasks themselves can be found in Tasks.qs file.
// We recommend that you try to solve the tasks yourself first,
// but feel free to look up the solution if you get stuck.
//////////////////////////////////////////////////////////////////////


// coin flip on two coins
namespace Quantum.Kata.GHZGame {

    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Logical;


    operation ComputerPly_Kcoins (qs : Qubit[]) : Unit{
    
        H(qs[0]);
        let n = Length(qs);
        ApplyToEachA(CNOT(qs[0],_),qs[1..n-1]);
    }
    operation peoplePlay_Kc0ins (qs : Qubit[], flipPattern: Bool[]) : Unit{   
        let n = Length(flipPattern);
        for( i in 0..n-1){
            if(flipPattern[i]) {
                X(qs[i]);
            }
        }
    }
    operation ComputerAnswer (qs : Qubit[]) : Unit{
        let n = Length(qs);
        ApplyToEachA(H,qs[0..1]);
        ApplyToEachA(CNOT(qs[0],_),qs[1..n-1]);
        H(qs[0]);
    }

}

