let mux2 s0 a b = (s0 && a) || ((not s0) && b);;

let mux4 s0 s1 a0 a1 a2 a3 = 
  mux2 (s0 == s1) (mux2 s0 a3 a0) (mux2 s1 a1 a2)
