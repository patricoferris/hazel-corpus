
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Square of expr* expr
  | Exponential of expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine i -> "sin(pi*" ^ ((exprToString i) ^ ")")
  | Cosine i -> "cos(pi*" ^ ((exprToString i) ^ ")")
  | Average (i1,i2) ->
      "((" ^ ((exprToString i1) ^ (" + " ^ ((exprToString i2) ^ ")/2)")))
  | Times (i1,i2) -> (exprToString i1) ^ ("*" ^ (exprToString i2))
  | Thresh (i1,i2,i3,i4) ->
      "(" ^
        ((exprToString i1) ^
           ("<" ^
              ((exprToString i2) ^
                 (" ? " ^
                    ((exprToString i3) ^ (":" ^ ((exprToString i4) ^ ")")))))))
  | Square i -> exprToString i "*" exprToString i
  | Exponential (i1,i2) -> exprToString i1 "*" exprToString i2;;
