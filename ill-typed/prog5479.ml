
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Power of expr* expr
  | Log of expr;;

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Power of expr* expr
  | Op of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine n -> "sin(pi*" ^ ((exprToString n) ^ ")")
  | Cosine n -> "cos(pi*" ^ ((exprToString n) ^ ")")
  | Average (x,y) ->
      "((" ^ ((exprToString x) ^ ("+" ^ ((exprToString y) ^ ")/2)")))
  | Times (x,y) -> (exprToString x) ^ ("*" ^ (exprToString y))
  | Thresh (x,y,z,w) ->
      "(" ^
        ((exprToString x) ^
           ("<" ^
              ((exprToString y) ^
                 ("?" ^ ((exprToString z) ^ (":" ^ ((exprToString w) ^ ")")))))))
  | Power (x,y) -> (exprToString x) ^ ("**" ^ (exprToString y))
  | Op (x,y,z) ->
      "(" ^
        ((exprToString x) ^
           ("*" ^ ((exprToString y) ^ (")/" ^ (exprToString z)))));;

let _ = exprToString (Log VarX);;
