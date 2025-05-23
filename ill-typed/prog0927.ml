
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

let rec buildHelper rand max_depth curr_depth =
  if curr_depth < max_depth
  then
    match rand (0, 6) with
    | 0 -> VarX
    | 1 -> VarY
    | 2 -> buildSine (buildHelper rand max_depth (curr_depth + 1))
    | 3 -> buildCosine (buildHelper rand max_depth (curr_depth + 1))
    | 4 ->
        buildAverage (buildHelper rand max_depth (curr_depth + 1))
          (buildHelper rand max_depth (curr_depth + 1))
    | 5 ->
        buildTimes (buildHelper rand max_depth (curr_depth + 1))
          (buildHelper rand max_depth (curr_depth + 1))
    | 6 ->
        buildThresh (buildHelper rand max_depth (curr_depth + 1))
          (buildHelper rand max_depth (curr_depth + 1))
          (buildHelper rand max_depth (curr_depth + 1))
          (buildHelper rand max_depth (curr_depth + 1));;
