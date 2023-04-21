%token EOF
%token OPAREN CPAREN
%token PLUS STAR ASSIGN SEMI

%token<string> VAR
%token<int>    INT

%{
    open Core
%}

%start <exp> main

%%

let main := 
| e = expr; EOF?; { e }

let expr :=
| ~ = INT; <Int>
| ~ = VAR; <Var>

(* can use parens for precedence, otherwise strict left right *)
| OPAREN; e = expr; CPAREN; { e }

(* bin ops *)
| a = expr; PLUS; b = expr; { Add (a, b) }
| a = expr; STAR; b = expr; { Mul (a, b) }

(* complicated *)
| id = VAR; ASSIGN; e1 = expr; SEMI; e2 = expr; { Assign (id, e1, e2) }