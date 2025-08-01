let are_in_range v0 v1 v2 = v0 >=0 && v0 <= 5 && v1 >=0 && v1 <= 5 && v2 >=0 && v2 <= 5

let movie_rating v0 v1 v2 = if (are_in_range v0 v1 v2) then (match v0,v1,v2 with
| 5,5,5 -> "Masterpiece"
| 5,5,4 | 5,4,5 | 4,5,5 -> "Highly Recommended"
| 4,4,3 | 4,3,4 | 3,4,4 -> "Recommended"
| v0',v1',v2' -> "Mixed Reviews")
else failwith ""
