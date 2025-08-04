let guess5 n =
  assert (n >= 1 && n <= 5);
  let g = Random.int(5) + 1 in
  (n = g, g)
