let best_offer o0 o1 o2 = List.fold_left 
(fun x y -> match x,y with 
  (Some x),(Some y) -> Some (Int.max x y) 
| y,None | None,y -> y) None [o0;o1;o2]
