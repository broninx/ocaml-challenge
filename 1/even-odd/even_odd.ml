let is_even x = ( x mod 2) = 0

let out_of_scope a = a < 0 || a > 5

let win a b = match a,b with 
| a,b when out_of_scope a && out_of_scope b -> 0
| a,_ when out_of_scope a -> (-1)
| _,b when out_of_scope b -> 1 
| a,b -> if (is_even (a+b)) then 1 else (-1)
