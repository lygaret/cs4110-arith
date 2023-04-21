let usage   = "arith [-verbose] [<file>]"
let verbose = ref false
let input   = ref None
let anon_fun filename =
  input := Some filename

let spec_list =
  [("-verbose", Arg.Set verbose, "output debug information")]

let () = 
  Arg.parse spec_list anon_fun usage;
  Arith.Parser.pp_exceptions ();

  let expr = 
    if Option.is_some !input then
      Arith.Parser.parse_file (Option.get !input)
    else
      begin
        Printf.printf "arith 0.0.0 -- ctrl-d to complete the expression\n\n%!";
        Arith.Parser.parse_chan stdin
      end
  in

  if !verbose then
    Printf.printf "tokens:\n%s\n\n" (Arith.Core.show_exp expr);

  let res = Arith.Core.eval_exp [] expr in
  Printf.printf "= %d" res
