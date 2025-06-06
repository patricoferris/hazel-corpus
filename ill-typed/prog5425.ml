
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let rec build (rand,depth) =
  if depth > 0
  then
    match rand (1, 7) with
    | 1 -> VarX
    | 2 -> VarY
    | 3 -> buildSine (build (rand, (depth - 1)))
    | 4 -> buildCosine (build (rand, (depth - 1)))
    | 5 ->
        buildAverage
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 6 ->
        buildTimes ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
    | 7 ->
        buildThresh
          ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
            (build (rand, (depth - 1))));;
