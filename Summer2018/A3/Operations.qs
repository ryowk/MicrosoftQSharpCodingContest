namespace Solution{
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Primitive;

    operation MySolve () : Unit
    {
        let bits0 = new Bool[8];
        let bits1 = new Bool[8];
        using(qs = Qubit[8]){
            Solve(qs, bits0, bits1);
            ResetAll(qs);
        }
    }
 
    operation Solve(qs: Qubit[], bits0: Bool[], bits1: Bool[]) : Unit
    {
        mutable pos = 0;
        for(i in 0..Length(qs)-1){
            if(bits0[i] != bits1[i]){
                set pos = i;
            }
        }
        H(qs[pos]);
 
        for(i in 0..Length(qs)-1){
            if(bits0[i] != bits1[i] && i != pos){
                CNOT(qs[pos], qs[i]);
            }
        }
 
        for(i in 0..Length(qs)-1){
            if(bits0[i]){
                X(qs[i]);
            }
        }
    }
}
