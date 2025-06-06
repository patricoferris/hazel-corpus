
let checkSame (x,y) = x == y;;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w =
  if checkSame ((listReverse (explode w)), (explode w))
  then true
  else false c;;
