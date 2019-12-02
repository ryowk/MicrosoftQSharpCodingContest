namespace Solution
{
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Primitive;

    operation MySolve () : Unit
    {
        let bits = new Bool[8];
        using(qs = Qubit[8]){
            Solve(qs, bits);
            ResetAll(qs);
        }
    }
    operation Solve(qs: Qubit[], bits: Bool[]) : Unit
    {
        H(qs[0]);
        for(i in 1..Length(qs)-1){
            if(bits[i]){
                CNOT(qs[0], qs[i]);
            }
        }
    }
}
