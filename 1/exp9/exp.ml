let square x = x * x;;


let exp9 x = (square x |> square |> square) * x ;;
