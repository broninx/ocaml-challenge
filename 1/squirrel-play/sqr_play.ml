type season = Spring | Summer | Autumn | Winter

let squirrel_play d = function
  | _ when d >= 15 && d <=30 -> true 
  | Summer when d >= 31 && d <=35 -> true
  | _ -> false
