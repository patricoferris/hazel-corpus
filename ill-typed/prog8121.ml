
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Neg of expr
  | Average of expr* expr
  | Times of expr* expr
  | AddMul of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e -> "sin(pi*" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(pi*" ^ ((exprToString e) ^ ")")
  | Neg e -> (exprToString e) ^ " * -1.0"
  | Average (e,ex) ->
      "((" ^ ((exprToString e) ^ ("+" ^ ((exprToString ex) ^ ")/2)")))
  | Times (e,ex) -> (exprToString e) ^ ("*" ^ (exprToString ex))
  | AveThree (e1,e2,e3) ->
      "((" ^
        ((exprToString e1) ^
           ("+" ^ ((exprToString e2) ^ ("+" ^ (exprToString e3 ")/3")))))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))));;
