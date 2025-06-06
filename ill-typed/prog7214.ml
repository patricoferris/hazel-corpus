
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SinCos of expr;;

let rec eval (e,x,y) =
  let pi = 3.14 in
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine ex -> sin (pi *. (eval (ex, x, y)))
  | Cosine ex -> cos (pi *. (eval (ex, x, y)))
  | Average (ex1,ex2) -> ((eval (ex1, x, y)) +. (eval (ex2, x, y))) /. 2.0
  | Times (ex1,ex2) -> (eval (ex1, x, y)) *. (eval (ex2, x, y))
  | Thresh (ex1,ex2,ex3,ex4) ->
      if (eval (ex1, x, y)) < (eval (ex2, x, y))
      then eval (ex3, x, y)
      else eval (ex4, x, y)
  | SinCos ex ->
      (sin (pi *. (eval (ex, x, y)))) *. (cos (pi *. (eval (ex, x, y))))
  | Three (ex1,ex2,ex3) ->
      ((eval (ex1, x, y)) *. (cos (pi *. (eval (ex2, x, y))))) *.
        (sin (pi *. (eval (ex3, x, y))));;
