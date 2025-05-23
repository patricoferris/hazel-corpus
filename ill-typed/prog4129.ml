
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX x -> x
  | VarY y -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (x,y) -> ((eval (e, x, y)) +. (eval (e, x, y))) /. 2.0
  | Times (x,y) -> (eval (e, x, y)) *. (eval (e, x, y))
  | Thresh (e1,e2,e3,e4) -> failwith "sad";;
