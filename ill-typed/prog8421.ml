
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
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine v -> "sin(pi*" ^ ((exprToString v) ^ ")")
  | Cosine v -> "sin(pi*" ^ ((exprToString v) ^ ")")
  | Average (v,w) ->
      "(" ^ ((exprToString v) ^ ("+" ^ ((exprToString w) ^ ")/2")))
  | Times (v,w) -> (exprToString v) ^ ("*" ^ (exprToString w))
  | Thresh (v,w,x,y) ->
      (exprToString v) ^
        ("<" ^
           ((exprToString w) ^
              ("?" ^ ((exprToString x) ^ (":" ^ (exprToString y))))))
  | Divide (v,w) -> (exprToString v) ^ ("/" ^ (exprToString w))
  | Super (v,w) ->
      "(" ^
        ((exprToString v) ^
           ("+" ^ ((exprToString w) ^ (") *" ^ (exprToString v)))));;
