namespace Solution
{
    open Microsoft.Quantum.Canon;

    // Primitive は現在 Deprecated で Intrinsic 推奨だが
    // 古い版には存在しないので Primitive を使う
    // open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Primitive;

    // Uf つくるのめんどい
    // operation MySolve () : Unit
    // {
    //     // 初期 Qubit を用意して Solve を実行する
    //     // 提出時には不要（あっても良い）
    //     using(qs = Qubit[8]){
    //         Solve(qs);
    //         ResetAll(qs);  // using 抜ける前は |0> にしておく仕様
    //     }
    // }
    operation Solve(N: Int, Uf: ((Qubit[], Qubit) => Unit)): Int[]
    {
        mutable ans = 0;
        mutable b = new Int[N];
        using(qs = Qubit[N+1]){
            Uf(qs[0..N-1], qs[N]);
            let res = M(qs[N]);
            if(res == One){
                set ans = 1;
            }
            for(i in 0..N){
                Reset(qs[i]);
            }
        }
        for(i in 0..N-1){
            set b[i] = 0;
        }
        if(ans == 1 && N % 2 == 0){
            set b[0] = 1;
        }
        if(ans == 0 && N % 2 == 1){
            set b[0] = 1;
        }
        return b;
    }
}