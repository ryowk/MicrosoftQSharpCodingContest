namespace Solution
{
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Primitive;

    operation MySolve () : Int
    {
        // 初期 Qubit を用意して Solve を実行する
        // 提出時には不要（あっても良い）
        mutable ans = 0;
        using(qs = Qubit[8]){
            set ans = Solve(qs);
            ResetAll(qs);  // using 抜ける前は |0> にしておく仕様
        }
        return ans;
    }
    operation Solve(qs: Qubit[]): Int {
        mutable ans = 0;
        for(i in 0..Length(qs)-1){
            let res = M(qs[i]);
            if(res == One){
                set ans = 1;
            }
        }
        return ans;
    }
}
