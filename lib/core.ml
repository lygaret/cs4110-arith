type exp = 
    Var    of string
  | Int    of int
  | Add    of exp * exp
  | Mul    of exp * exp
  | Assign of string * exp * exp

let rec show_exp = function
| Var(s)             -> Printf.sprintf "Var(%s)" s
| Int(i)             -> Printf.sprintf "Int(%d)" i
| Add(a, b)          -> Printf.sprintf "Add(%s, %s)" (show_exp  a) (show_exp  b)
| Mul(a, b)          -> Printf.sprintf "Mul(%s, %s)" (show_exp  a) (show_exp  b)
| Assign(name, l, r) -> Printf.sprintf "let %s = %s { %s }" name (show_exp l) (show_exp  r)

let rec eval_exp store exp =
  let lookup store key   = List.assoc key store 
  and update store key v = (key, v) :: store 
  in
  match exp with
    | Var(s)    -> lookup store s
    | Int(i)    -> i
    | Add(a, b) ->
      let ae = eval_exp store a in
      let be = eval_exp store b in
        ae + be
    | Mul(a, b) ->
      let ae = eval_exp store a in
      let be = eval_exp store b in
        ae * be
    | Assign(name, v, e) ->
      let ve = eval_exp store v in
      let se = update store name ve in
        eval_exp se e

