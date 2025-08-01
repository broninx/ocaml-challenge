let max_nat a b = if (a>0 && b>0) 
  then (match a - b with c when c>0 -> a | _ -> b)
  else failwith ("both numbers must be natural numbers");;


assert(max_nat 2 5 = 5);;
assert(max_nat 5 2 = 5);;
assert(try max_nat (-2) 5 |> fun _ -> false with _ -> true);;
assert(try max_nat 2 (-5) |> fun _ -> false with _ -> true);;
assert(try max_nat (-2) (-5) |> fun _ -> false with _ -> true);;
