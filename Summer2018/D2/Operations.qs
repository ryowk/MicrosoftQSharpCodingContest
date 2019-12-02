namespace Solution
{
    open Microsoft.Quantum.Canon;

    // Primitive は現在 Deprecated で Intrinsic 推奨だが
    // 古い版には存在しないので Primitive を使う
    // open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Primitive;

    operation MySolve () : Unit
    {
        let b = new Int[8];
        using((x, y) = (Qubit[8], Qubit())){
            Solve(x, y, b);
            ResetAll(x);
            Reset(y);
        }
    }
    operation Solve(x: Qubit[], y: Qubit, b: Int[]) : Unit
    {
        for(i in 0..Length(x)-1){
            if(b[i] == 1){
                CNOT(x[i], y);
            }else{
                X(x[i]);
                CNOT(x[i], y);
                X(x[i]);
            }
        }
    }
}
