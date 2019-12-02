namespace Solution
{
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Primitive;
 
    operation MySolve () : Int
    {
        // 初期 Qubit を用意して Solve を実行する
        // 提出時には不要（あっても良い）
        mutable ans = 0;
        using(q = Qubit()){
            set ans = Solve(q);
            Reset(q);  // using 抜ける前は |0> にしておく仕様
        }
        return ans;
    }
    operation Solve(q: Qubit): Int
    {
        let r = RandomInt(2);
        if(r == 0){
            let res = M(q);
            if(res == One){
                return 1;
            }else{
                return -1;
            }
        }else{
            R(PauliY, 3.141592/2.0, q);
            let res = M(q);
            if(res == Zero){
                return 0;
            }else{
                return -1;
            }
        }
    }
}
