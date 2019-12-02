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
    operation Solve(N: Int, Uf: ((Qubit[], Qubit) => Unit)) : Int[]
    {
        mutable a = new Int[N];
        using(qs = Qubit[N+1]){
            X(qs[N]);
            for(i in 0..N){
                H(qs[i]);
            }
            Uf(qs[0..N-1], qs[N]);
            for(i in 0..N-1){
                H(qs[i]);
            }
            for(i in 0..N-1){
                let res = M(qs[i]);
                if(res == Zero){
                    set a[i] = 0;
                }else{
                    set a[i] = 1;
                }
            }
            for(i in 0..N){
                Reset(qs[i]);
            }
        }
        return a;
    }
}
