{
  open Grammar
  exception LexError of string

  let[@inline] failwith msg = raise (LexError msg)
  let[@inline] illegal c    = failwith (Printf.sprintf "[lexer] unexpected char: '%c'" c)
}

let whitespace  = [' ' '\r' '\t' '\n']
let ident       = [^' ' '\r' '\t' '\n' '+' '*' ':' '=' ';' '(' ')']
let integer     = '-'? ['0'-'9'] ['0'-'9']*

rule token = parse
  | '\n'               { Lexing.new_line lexbuf; token lexbuf }
  | "#" [^'\n']* '\n'  { Lexing.new_line lexbuf; token lexbuf }
  | whitespace         { token lexbuf }
  | eof                { EOF }

  | "("                { OPAREN }
  | ")"                { CPAREN }
  | "+"                { PLUS }
  | "*"                { STAR }
  | ":="               { ASSIGN }
  | ";"                { SEMI }

  | integer            { INT (int_of_string (Lexing.lexeme lexbuf)) }
  | ident+             { VAR (Lexing.lexeme lexbuf) }

  | _ as c             { illegal c }