type token =
  | FIELD of (
# 30 "lib/cudf_822_parser.mly"
        string * (Cudf_types.loc * string)
# 6 "lib/cudf_822_parser.ml"
)
  | CONT of (
# 31 "lib/cudf_822_parser.mly"
        Cudf_types.loc * string
# 11 "lib/cudf_822_parser.ml"
)
  | EOL
  | EOF

open Parsing
let _ = parse_error;;
# 21 "lib/cudf_822_parser.mly"

open ExtLib

exception Dup_stanza

let join (r1, v) (r2, cont) = Cudf_types.extend_loc r1 r2, v ^ cont

# 26 "lib/cudf_822_parser.ml"
let yytransl_const = [|
  259 (* EOL *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  257 (* FIELD *);
  258 (* CONT *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\002\000\002\000\002\000\002\000\004\000\004\000\
\003\000\003\000\003\000\005\000\006\000\006\000\007\000\007\000\
\008\000\008\000\000\000\000\000"

let yylen = "\002\000\
\001\000\002\000\001\000\002\000\002\000\001\000\001\000\002\000\
\000\000\002\000\003\000\001\000\001\000\002\000\002\000\003\000\
\002\000\003\000\002\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\000\000\019\000\001\000\000\000\
\000\000\012\000\000\000\006\000\020\000\000\000\003\000\000\000\
\008\000\002\000\010\000\000\000\014\000\005\000\004\000\000\000\
\016\000\011\000\000\000\018\000"

let yydgoto = "\003\000\
\006\000\013\000\007\000\008\000\009\000\010\000\011\000\025\000"

let yysindex = "\018\000\
\015\255\005\000\000\000\000\255\004\255\000\000\000\000\007\255\
\006\000\000\000\007\255\000\000\000\000\010\000\000\000\009\255\
\000\000\000\000\000\000\007\255\000\000\000\000\000\000\012\255\
\000\000\000\000\009\255\000\000"

let yyrindex = "\000\000\
\022\000\000\000\000\000\000\000\009\000\000\000\000\000\022\000\
\000\000\000\000\004\000\000\000\000\000\000\000\000\000\001\000\
\000\000\000\000\000\000\022\000\000\000\000\000\000\000\000\000\
\000\000\000\000\002\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\248\255\012\000\011\000\013\000\000\000\252\255"

let yytablesize = 267
let yytable = "\018\000\
\015\000\017\000\016\000\013\000\012\000\019\000\005\000\004\000\
\007\000\022\000\024\000\026\000\015\000\014\000\027\000\004\000\
\017\000\005\000\001\000\002\000\020\000\009\000\028\000\021\000\
\023\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\015\000\017\000\015\000\017\000\004\000\013\000\005\000\
\005\000\007\000\004\000"

let yycheck = "\008\000\
\000\000\000\000\003\001\000\000\000\000\000\000\003\001\001\001\
\000\000\000\000\002\001\020\000\002\000\002\000\003\001\001\001\
\005\000\003\001\001\000\002\000\009\000\000\000\027\000\011\000\
\014\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\001\001\001\001\003\001\003\001\001\001\003\001\003\001\
\003\001\001\001\001\001"

let yynames_const = "\
  EOL\000\
  EOF\000\
  "

let yynames_block = "\
  FIELD\000\
  CONT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'stanzas) in
    Obj.repr(
# 40 "lib/cudf_822_parser.mly"
              ( _1 )
# 161 "lib/cudf_822_parser.ml"
               : (string * (Cudf_types.loc * string)) list list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'eols) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stanzas) in
    Obj.repr(
# 41 "lib/cudf_822_parser.mly"
                 ( _2 )
# 169 "lib/cudf_822_parser.ml"
               : (string * (Cudf_types.loc * string)) list list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'stanza) in
    Obj.repr(
# 45 "lib/cudf_822_parser.mly"
           ( Some _1 )
# 176 "lib/cudf_822_parser.ml"
               : (string * (Cudf_types.loc * string)) list option))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'eols) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stanza) in
    Obj.repr(
# 46 "lib/cudf_822_parser.mly"
                ( Some _2 )
# 184 "lib/cudf_822_parser.ml"
               : (string * (Cudf_types.loc * string)) list option))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'eols) in
    Obj.repr(
# 47 "lib/cudf_822_parser.mly"
             ( None )
# 191 "lib/cudf_822_parser.ml"
               : (string * (Cudf_types.loc * string)) list option))
; (fun __caml_parser_env ->
    Obj.repr(
# 48 "lib/cudf_822_parser.mly"
         ( None )
# 197 "lib/cudf_822_parser.ml"
               : (string * (Cudf_types.loc * string)) list option))
; (fun __caml_parser_env ->
    Obj.repr(
# 52 "lib/cudf_822_parser.mly"
         ()
# 203 "lib/cudf_822_parser.ml"
               : 'eols))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'eols) in
    Obj.repr(
# 53 "lib/cudf_822_parser.mly"
             ()
# 210 "lib/cudf_822_parser.ml"
               : 'eols))
; (fun __caml_parser_env ->
    Obj.repr(
# 57 "lib/cudf_822_parser.mly"
       ( [] )
# 216 "lib/cudf_822_parser.ml"
               : 'stanzas))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stanza) in
    Obj.repr(
# 58 "lib/cudf_822_parser.mly"
                ( [ _1 ] )
# 223 "lib/cudf_822_parser.ml"
               : 'stanzas))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'stanza) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'eols) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'stanzas) in
    Obj.repr(
# 59 "lib/cudf_822_parser.mly"
                        ( _1 :: _3 )
# 232 "lib/cudf_822_parser.ml"
               : 'stanzas))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'fields) in
    Obj.repr(
# 63 "lib/cudf_822_parser.mly"
           ( let keys = List.map fst _1 in
		  (* check for re-defined keys *)
		  if List.length (List.unique keys) < List.length keys then
		    raise Dup_stanza
		  else
		    _1
		)
# 245 "lib/cudf_822_parser.ml"
               : 'stanza))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'field) in
    Obj.repr(
# 73 "lib/cudf_822_parser.mly"
           ( [ _1 ] )
# 252 "lib/cudf_822_parser.ml"
               : 'fields))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'field) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fields) in
    Obj.repr(
# 74 "lib/cudf_822_parser.mly"
                 ( _1 :: _2 )
# 260 "lib/cudf_822_parser.ml"
               : 'fields))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string * (Cudf_types.loc * string)) in
    Obj.repr(
# 78 "lib/cudf_822_parser.mly"
               ( _1 )
# 267 "lib/cudf_822_parser.ml"
               : 'field))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string * (Cudf_types.loc * string)) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'linecont) in
    Obj.repr(
# 79 "lib/cudf_822_parser.mly"
                       ( let k, v = _1 in
			  k, (join v _3) )
# 276 "lib/cudf_822_parser.ml"
               : 'field))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Cudf_types.loc * string) in
    Obj.repr(
# 84 "lib/cudf_822_parser.mly"
              ( _1 )
# 283 "lib/cudf_822_parser.ml"
               : 'linecont))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Cudf_types.loc * string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'linecont) in
    Obj.repr(
# 85 "lib/cudf_822_parser.mly"
                      ( join _1 _3 )
# 291 "lib/cudf_822_parser.ml"
               : 'linecont))
(* Entry doc_822 *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
(* Entry stanza_822 *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let doc_822 (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : (string * (Cudf_types.loc * string)) list list)
let stanza_822 (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 2 lexfun lexbuf : (string * (Cudf_types.loc * string)) list option)
;;
# 89 "lib/cudf_822_parser.mly"

let error_wrapper f =
  fun lexer lexbuf ->
    try
      f lexer lexbuf
    with 
      | Parsing.Parse_error ->
	  raise (Cudf_types.Parse_error_822
		   ("RFC 822 (stanza structure) parse error",
		    Cudf_types.loc_of_lexbuf lexbuf))
      | Dup_stanza ->
	  raise (Cudf_types.Parse_error_822
		   ("duplicate keys in stanza",
		    Cudf_types.loc_of_lexbuf lexbuf))

let doc_822 = error_wrapper doc_822
let stanza_822 = error_wrapper stanza_822
# 338 "lib/cudf_822_parser.ml"
