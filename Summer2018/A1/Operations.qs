namespace Solution
{
    open Microsoft.Quantum.Canon;

    // Primitive は現在 Deprecated で Intrinsic 推奨だが
    // 古い版には存在しないので Primitive を使う
    // open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Primitive;

    operation MySolve () : Unit
    {
        // 初期 Qubit を用意して Solve を実行する
        // 提出時には不要（あっても良い）
        using(qs = Qubit[8]){
            Solve(qs);
            ResetAll(qs);  // using 抜ける前は |0> にしておく仕様
        }
    }
    operation Solve(qs: Qubit[]) : Unit
    {
        for (i in 0..Length(qs)-1){
            H(qs[i]);
        }
    }
}
