let () = 
  print_endline "arith 0.0.0 - ctd-d to exit";
  Printf.printf "> %!";

  let lexbuf = Lexing.from_channel stdin in
  let expr   = Arith.Parser.main Arith.Lexer.token lexbuf in
  Printf.printf "%s" (Arith.Core.show_exp expr)
