namespace Solution
{
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Primitive;
 
    operation MySolve () : Int
    {
        // 初期 Qubit を用意して Solve を実行する
        // 提出時には不要（あっても良い）
        mutable ans = 0;
        using(qs = Qubit[2]){
            set ans = Solve(qs);
            ResetAll(qs);  // using 抜ける前は |0> にしておく仕様
        }
        return ans;
    }
    operation Solve(qs: Qubit[]): Int
    {
        H(qs[1]);
        CNOT(qs[0], qs[1]);
        H(qs[0]);
        let a = M(qs[0]);
        let b = M(qs[1]);
        if(a == One && b == One){
            return 0;
        }elif(a == Zero && b == One){
            return 1;
        }elif(a == One && b == Zero){
            return 2;
        }else{
            return 3;
        }
    }
}