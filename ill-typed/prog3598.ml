
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem h seen) = false then h :: seen in
        let rest' = failwith "to be written" in helper (seen', rest') in
  List.rev (helper ([], l));;
