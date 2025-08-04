let seven_eleven_doubles () = 
  let is_true d1 d2 = (d1 = d2) && (d1 + d2 = 7) && (d1 + d2 = 11) in
  let d1 = Random.int(6) + 1 in
  let d2 = Random.int(6) + 1 in
  (is_true d1 d2, d1, d2)

