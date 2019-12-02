namespace Solution
{
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Extensions.Math;

    operation MySolve () : Unit
    {
        // 初期 Qubit を用意して Solve を実行する
        // 提出時には不要（あっても良い）
        using(qs = Qubit[8]){
            Solve(qs);
            ResetAll(qs);  // using 抜ける前は |0> にしておく仕様
        }
    }
    operation Solve(qs: Qubit[]): Unit
    {
        mutable N = Length(qs);
        if(N == 1){
            X(qs[0]);
        }elif(N == 2){
            H(qs[0]);
            CNOT(qs[0], qs[1]);
            X(qs[0]);
        }else{
            mutable k = 0;
            mutable fac = 1;
            for(i in 0..N){
                if(fac == N){
                    set k = i;
                }
                set fac = fac * 2;
            }
            H(qs[0]);
            CNOT(qs[0], qs[1]);
            X(qs[0]);
            mutable tobi = 1;
            for(i in 0..k-2){
                set tobi = tobi * 2;
                for(j in 0..tobi-1){
                    (Controlled H)(qs[j..j], qs[j+tobi]);
                    CNOT(qs[j+tobi], qs[j]);
                }
            }
        }
    }
}
