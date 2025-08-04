type card = Joker | Val of int

let ok = function
  | Joker -> true
  | Val x -> x >= 0 && x <= 10
;;

let win pc dc = 
  assert(ok pc && ok dc);
  match pc,dc with
  | _, Joker -> false
  | Joker, _ -> true
  | Val x, Val y -> x > y
