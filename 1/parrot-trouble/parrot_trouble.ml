let parrot_trouble t h = match t,h with
| true,ho when h > 7 && h < 20 -> Some false
| ta,ho when h >= 0 && h <= 23 -> Some ta
| _,_ -> None
