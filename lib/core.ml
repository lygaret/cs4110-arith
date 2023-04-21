type exp = 
    Var    of string
  | Int    of int
  | Add    of exp * exp
  | Mul    of exp * exp
  | Assign of string * exp * exp

let rec show_exp = function
| Var(s)             -> Printf.sprintf "Var(%s)" s
| Int(i)             -> Printf.sprintf "Int(%d)" i
| Add(a, b)          -> Printf.sprintf "Add(%s %s)" (show_exp  a) (show_exp  b)
| Mul(a, b)          -> Printf.sprintf "Mul(%s %s)" (show_exp  a) (show_exp  b)
| Assign(name, l, r) -> Printf.sprintf "Assign(%s -> %s); %s" name (show_exp l) (show_exp  r)