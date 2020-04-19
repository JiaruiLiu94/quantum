// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT license.

//////////////////////////////////////////////////////////////////////
// This file contains reference solutions to all tasks.
// The tasks themselves can be found in Tasks.qs file.
// We recommend that you try to solve the tasks yourself first,
// but feel free to look up the solution if you get stuck.
//////////////////////////////////////////////////////////////////////

namespace Quantum.Kata.CHSHGame {

    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Logical;


    //////////////////////////////////////////////////////////////////

    //////////////////////////////////////////////////////////////////

    // Task 1.1 Jugge the answer
    function judge (row : Bool[], col : Bool[], x : Int, y: Int) : Bool {
        return row[y] == col[x];
    } 


    operation CreateEntangledTriple (qs : Qubit[]) : Unit is Adj {
        H(qs[0]);H(qs[1]);
        Controlled X([qs[0]],qs[2]);
        Controlled X([qs[0]],qs[2]);
    }

    operation TransformforAlice(qs : Qubit[], x: Int, y: Int) : Unit is Adj{



    }

    operation TransformforBob(qs : Qubit[]) : Unit is Adj{

    }

    // operation Output(x : Int, y : Int) : Bool[] {
    //     //Message("in reference");
    //     mutable res= new Bool[4]; 
    //     using (q = Qubit[4]){
    //         CreateEntangledTriple(q);


    //         ResetAll(q);
    //     }
    //     return res;
    // }


}

