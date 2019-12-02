namespace Solution
{
    open Microsoft.Quantum.Canon;

    // Primitive は現在 Deprecated で Intrinsic 推奨だが
    // 古い版には存在しないので Primitive を使う
    // open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Primitive;

    operation MySolve () : Unit
    {
        using((x, y) = (Qubit[8], Qubit())){
            Solve(x, y);
            ResetAll(x);
            Reset(y);
        }
    }
    operation Solve(x: Qubit[], y: Qubit) : Unit
    {
        CCNOT(x[0], x[1], y);
        CCNOT(x[1], x[2], y);
        CCNOT(x[2], x[0], y);
    }
}
