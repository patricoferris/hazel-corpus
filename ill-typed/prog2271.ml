
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> VarX
  | VarY  -> VarY
  | Sine e1 -> exprToString e1
  | Cosine e1 -> exprToString e1
  | Average (e1,e2) -> (exprToString e1) ^ (exprToString e2)
  | Times (e1,e2) -> (exprToString e1) ^ (exprToString e2)
  | Thresh (e1,e2,e3) ->
      (exprToString e1) ^ ((exprToString e2) ^ (exprToString e3));;
