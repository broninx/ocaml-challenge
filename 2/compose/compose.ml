let comp (g: 'b -> 'c) (f: 'a -> 'b) = fun x -> g (f x)

let double x = x * 2;;
let square x = x * x;;

assert((comp square double) 3 = 36);;
assert((comp double square) 3 = 18);;

assert(comp (fun b -> if b then 0 else 1) (fun x -> x>0) 3 = 0);;
assert(comp (fun b -> if b then 0 else 1) (fun x -> x>0) 0 = 1);;
