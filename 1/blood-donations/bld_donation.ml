type blood_group = A | B | AB | O 

let check_groups d r = match d with
| O -> true
| c when r = c -> true
| A | B when r = AB -> true
| _ -> false;;

assert (check_groups O AB = true);;
assert (check_groups A B = false);;
assert (check_groups AB AB = true);;
