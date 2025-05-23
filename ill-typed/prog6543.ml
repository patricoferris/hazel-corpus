
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
  | Sine s -> "sin(pi*" ^ ((exprToString s) ^ ")")
  | Cosine s -> "cos(pi*" ^ ((exprToString s) ^ ")")
  | Average (s,p) ->
      "((" ^ ((exprToString s) ^ ("+" ^ ((exprToString p) ^ ")/2")))
  | Times (s,p) -> (exprToString s) ^ ("*" ^ (exprToString p))
  | Thresh (s,p,r,d) ->
      "(" ^
        ((exprToString s) ^
           ("<" ^
              ((exprToString p) ^
                 ("?" ^ ((exprToString r) ^ (":" ^ ((exprToString d) ^ ")")))))))
  | AllMult (s,p,r) ->
      (exprToString s) ^
        ("*" ^ ((exprToString p) ^ ("*" ^ (exprToString p))))
  | AvgThree (s,p,r) ->
      "((" ^
        ((exprToString s) ^
           ("+" ^ ((exprToString p) ^ ("+" ^ ((exprToString p) ^ ")/2")))));;
