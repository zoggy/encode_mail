(** Encoding mail address into &#<code>; form, usable in web page and not
  handled by spam-bots.
  Usage: ocaml encode_mail.ml address
*)

let encode_char c = Printf.sprintf "&#%03d;" (Char.code c);;
let encode_string s =
  let len = String.length s in
  let b = Buffer.create (6 * len) in
  for i = 0 to len - 1 do
    Buffer.add_string b (encode_char s.[i])
  done;
  Buffer.contents b
;;

for i = 1 to Array.length Sys.argv - 1 do
  print_endline (encode_string Sys.argv.(i))
done;;