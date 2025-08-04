let is_posfrac = function 
| _,0 -> failwith ("0 fraction")
| x,y -> ((x >= 0) && (y >= 0)) || ((x <= 0) && (y <= 0));;


let compare_posfrac f1 f2 = match f1,f2 with 
  | f1,f2 when not (is_posfrac f1 && is_posfrac f2) -> 
      failwith ("not positive fractions") 
  | (x,y), (a,b) -> let r = ((b * x) - (y * a)) in max (-1) (min r 1);;

let compare_frac f1 f2 = match f1,f2 with 
  | (x,y), (a,b) -> let r = ((y * b / y * x) - (y * b / b * a)) in max (-1) (min r 1);;

 
