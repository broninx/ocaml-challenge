type token =
  | IDENT of (
# 53 "lib/cudf_type_parser.mly"
        string
# 6 "lib/cudf_type_parser.ml"
)
  | PKGNAME of (
# 53 "lib/cudf_type_parser.mly"
        string
# 11 "lib/cudf_type_parser.ml"
)
  | QSTRING of (
# 53 "lib/cudf_type_parser.mly"
        string
# 16 "lib/cudf_type_parser.ml"
)
  | RELOP of (
# 53 "lib/cudf_type_parser.mly"
        string
# 21 "lib/cudf_type_parser.ml"
)
  | POSINT of (
# 54 "lib/cudf_type_parser.mly"
        string
# 26 "lib/cudf_type_parser.ml"
)
  | NEGINT of (
# 54 "lib/cudf_type_parser.mly"
        string
# 31 "lib/cudf_type_parser.ml"
)
  | LBRACKET
  | RBRACKET
  | LPAREN
  | RPAREN
  | COMMA
  | PIPE
  | COLON
  | EQ
  | VPKGTRUE
  | VPKGFALSE
  | EOL

open Parsing
let _ = parse_error;;
# 22 "lib/cudf_type_parser.mly"

(** a non-located parse error carrying an error message (...) *)
exception Parse_error_msg of string

let parse_relop = function
  | "="  -> `Eq
  | "!=" -> `Neq
  | ">=" -> `Geq
  | ">"  -> `Gt
  | "<=" -> `Leq
  | "<"  -> `Lt
  | _ -> assert false	(* lexer shouldn't have returned such a RELOP! *)

(** parse a type declaration with no default value *)
let parse_typename = function
  | "int"        -> `Int
  | "posint"     -> `Posint
  | "nat"        -> `Nat
  | "bool"       -> `Bool
  | "string"     -> `String
  | "pkgname"    -> `Pkgname
  | "ident"      -> `Ident
  | "vpkg"       -> `Vpkg
  | "vpkgformula" -> `Vpkgformula
  | "vpkglist"   -> `Vpkglist
  | "veqpkg"     -> `Veqpkg
  | "veqpkglist" -> `Veqpkglist
  | s            -> raise (Parse_error_msg ("unknown type name: " ^ s))

# 77 "lib/cudf_type_parser.ml"
let yytransl_const = [|
  263 (* LBRACKET *);
  264 (* RBRACKET *);
  265 (* LPAREN *);
  266 (* RPAREN *);
  267 (* COMMA *);
  268 (* PIPE *);
  269 (* COLON *);
  270 (* EQ *);
  271 (* VPKGTRUE *);
  272 (* VPKGFALSE *);
  273 (* EOL *);
    0|]

let yytransl_block = [|
  257 (* IDENT *);
  258 (* PKGNAME *);
  259 (* QSTRING *);
  260 (* RELOP *);
  261 (* POSINT *);
  262 (* NEGINT *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\003\000\004\000\005\000\006\000\007\000\008\000\
\009\000\011\000\012\000\019\000\013\000\013\000\013\000\013\000\
\020\000\020\000\010\000\010\000\014\000\014\000\015\000\015\000\
\021\000\021\000\016\000\016\000\016\000\022\000\022\000\023\000\
\023\000\024\000\024\000\024\000\025\000\025\000\026\000\026\000\
\027\000\027\000\017\000\017\000\028\000\028\000\029\000\029\000\
\018\000\018\000\031\000\031\000\030\000\030\000\030\000\030\000\
\030\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000"

let yylen = "\002\000\
\002\000\002\000\002\000\002\000\002\000\002\000\002\000\002\000\
\002\000\001\000\001\000\001\000\001\000\001\000\001\000\001\000\
\001\000\001\000\001\000\001\000\001\000\003\000\000\000\001\000\
\001\000\003\000\001\000\001\000\001\000\001\000\003\000\001\000\
\003\000\001\000\001\000\001\000\001\000\003\000\001\000\003\000\
\001\000\003\000\000\000\001\000\001\000\003\000\003\000\007\000\
\001\000\004\000\001\000\003\000\000\000\001\000\001\000\001\000\
\001\000\002\000\002\000\002\000\002\000\002\000\002\000\002\000\
\002\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\019\000\020\000\058\000\000\000\010\000\059\000\
\000\000\011\000\060\000\000\000\014\000\013\000\015\000\016\000\
\061\000\000\000\062\000\000\000\000\000\063\000\000\000\000\000\
\024\000\028\000\029\000\064\000\000\000\000\000\027\000\000\000\
\065\000\000\000\000\000\044\000\000\000\066\000\000\000\000\000\
\001\000\002\000\003\000\004\000\017\000\018\000\000\000\005\000\
\000\000\006\000\000\000\007\000\000\000\000\000\008\000\000\000\
\000\000\009\000\012\000\022\000\026\000\033\000\031\000\000\000\
\046\000\000\000\000\000\000\000\000\000\050\000\000\000\052\000\
\000\000\000\000\000\000\000\000\035\000\036\000\055\000\054\000\
\056\000\000\000\000\000\000\000\057\000\034\000\037\000\039\000\
\000\000\000\000\000\000\000\000\048\000\000\000\000\000\038\000"

let yydgoto = "\010\000\
\013\000\016\000\019\000\025\000\027\000\030\000\036\000\041\000\
\046\000\014\000\042\000\020\000\028\000\037\000\032\000\038\000\
\043\000\048\000\068\000\055\000\033\000\039\000\040\000\093\000\
\094\000\095\000\096\000\044\000\045\000\097\000\075\000"

let yysindex = "\079\000\
\033\255\016\255\018\255\088\255\088\255\088\255\014\255\016\255\
\016\255\000\000\000\000\000\000\000\000\024\255\000\000\000\000\
\035\255\000\000\000\000\052\255\000\000\000\000\000\000\000\000\
\000\000\055\255\000\000\004\255\074\255\000\000\022\255\080\255\
\000\000\000\000\000\000\000\000\059\255\081\255\000\000\089\255\
\000\000\086\255\085\255\000\000\090\255\000\000\096\255\087\255\
\000\000\000\000\000\000\000\000\000\000\000\000\100\255\000\000\
\088\255\000\000\088\255\000\000\088\255\016\255\000\000\016\255\
\016\255\000\000\000\000\000\000\000\000\000\000\000\000\092\255\
\000\000\097\255\099\255\102\255\016\255\000\000\008\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\004\255\098\255\101\255\000\000\000\000\000\000\000\000\
\103\255\100\255\088\255\088\255\000\000\000\000\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\104\255\000\000\105\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\062\255\000\000\000\000\106\255\000\000\
\000\000\000\000\000\000\000\000\042\255\000\000\000\000\251\254\
\000\000\000\000\000\000\000\000\107\255\000\000\050\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\015\255\
\000\000\108\255\000\000\000\000\000\000\000\000\109\255\000\000\
\023\255\032\255\043\255\054\255\000\000\000\000\000\000\000\000\
\000\000\037\255\114\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\084\255\017\255\000\000"

let yygindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\034\000\254\255\035\000\253\255\255\255\000\000\000\000\
\000\000\053\000\020\000\029\000\063\000\201\255\199\255\000\000\
\000\000\000\000\000\000\062\000\000\000\000\000\050\000"

let yytablesize = 127
let yytable = "\017\000\
\026\000\070\000\030\000\029\000\031\000\071\000\047\000\053\000\
\081\000\082\000\018\000\030\000\083\000\084\000\021\000\022\000\
\015\000\054\000\023\000\024\000\018\000\092\000\085\000\086\000\
\040\000\047\000\014\000\033\000\034\000\035\000\010\000\047\000\
\057\000\014\000\014\000\013\000\014\000\011\000\012\000\041\000\
\049\000\103\000\013\000\013\000\104\000\013\000\015\000\021\000\
\021\000\032\000\019\000\050\000\032\000\015\000\015\000\031\000\
\015\000\016\000\032\000\047\000\049\000\020\000\074\000\049\000\
\016\000\016\000\049\000\016\000\051\000\021\000\059\000\052\000\
\021\000\021\000\074\000\090\000\088\000\091\000\021\000\001\000\
\002\000\003\000\004\000\009\000\005\000\006\000\007\000\008\000\
\021\000\022\000\056\000\042\000\023\000\024\000\022\000\022\000\
\058\000\060\000\062\000\061\000\064\000\063\000\065\000\066\000\
\067\000\076\000\078\000\077\000\079\000\099\000\101\000\100\000\
\087\000\089\000\072\000\051\000\053\000\102\000\098\000\069\000\
\023\000\043\000\025\000\045\000\032\000\073\000\080\000"

let yycheck = "\002\000\
\004\000\059\000\008\001\005\000\006\000\061\000\009\000\004\001\
\001\001\002\001\003\001\017\001\005\001\006\001\001\001\002\001\
\001\001\014\001\005\001\006\001\003\001\079\000\015\001\016\001\
\008\001\011\001\004\001\011\001\015\001\016\001\008\001\017\001\
\011\001\011\001\012\001\004\001\014\001\005\001\006\001\008\001\
\017\001\099\000\011\001\012\001\100\000\014\001\004\001\011\001\
\012\001\008\001\008\001\017\001\011\001\011\001\012\001\057\000\
\014\001\004\001\017\001\062\000\011\001\008\001\065\000\014\001\
\011\001\012\001\017\001\014\001\017\001\008\001\012\001\017\001\
\011\001\012\001\077\000\079\000\079\000\079\000\017\001\001\000\
\002\000\003\000\004\000\005\000\006\000\007\000\008\000\009\000\
\001\001\002\001\017\001\008\001\005\001\006\001\011\001\012\001\
\017\001\017\001\013\001\011\001\011\001\017\001\007\001\017\001\
\005\001\014\001\008\001\011\001\007\001\012\001\008\001\011\001\
\079\000\079\000\062\000\008\001\008\001\098\000\090\000\057\000\
\017\001\017\001\017\001\017\001\011\001\064\000\077\000"

let yynames_const = "\
  LBRACKET\000\
  RBRACKET\000\
  LPAREN\000\
  RPAREN\000\
  COMMA\000\
  PIPE\000\
  COLON\000\
  EQ\000\
  VPKGTRUE\000\
  VPKGFALSE\000\
  EOL\000\
  "

let yynames_block = "\
  IDENT\000\
  PKGNAME\000\
  QSTRING\000\
  RELOP\000\
  POSINT\000\
  NEGINT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'int) in
    Obj.repr(
# 74 "lib/cudf_type_parser.mly"
                 ( _1 )
# 247 "lib/cudf_type_parser.ml"
               : int))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'ident) in
    Obj.repr(
# 75 "lib/cudf_type_parser.mly"
                     ( _1 )
# 254 "lib/cudf_type_parser.ml"
               : string))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'qstring) in
    Obj.repr(
# 76 "lib/cudf_type_parser.mly"
                         ( _1 )
# 261 "lib/cudf_type_parser.ml"
               : string))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'pkgname) in
    Obj.repr(
# 77 "lib/cudf_type_parser.mly"
                         ( _1 )
# 268 "lib/cudf_type_parser.ml"
               : Cudf_types.pkgname))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'vpkg) in
    Obj.repr(
# 78 "lib/cudf_type_parser.mly"
                   ( _1 )
# 275 "lib/cudf_type_parser.ml"
               : Cudf_types.vpkg))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'vpkglist) in
    Obj.repr(
# 79 "lib/cudf_type_parser.mly"
                           ( _1 )
# 282 "lib/cudf_type_parser.ml"
               : Cudf_types.vpkglist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'vpkgformula) in
    Obj.repr(
# 80 "lib/cudf_type_parser.mly"
                                 ( _1 )
# 289 "lib/cudf_type_parser.ml"
               : Cudf_types.vpkgformula))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'typedecl) in
    Obj.repr(
# 81 "lib/cudf_type_parser.mly"
                           ( _1 )
# 296 "lib/cudf_type_parser.ml"
               : Cudf_types.typedecl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'type_) in
    Obj.repr(
# 82 "lib/cudf_type_parser.mly"
                    ( _1 )
# 303 "lib/cudf_type_parser.ml"
               : Cudf_types.typ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 84 "lib/cudf_type_parser.mly"
             ( _1 )
# 310 "lib/cudf_type_parser.ml"
               : 'ident))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 85 "lib/cudf_type_parser.mly"
                 ( _1 )
# 317 "lib/cudf_type_parser.ml"
               : 'qstring))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 86 "lib/cudf_type_parser.mly"
                ( int_of_string _1 )
# 324 "lib/cudf_type_parser.ml"
               : 'version))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 89 "lib/cudf_type_parser.mly"
            ( _1 )
# 331 "lib/cudf_type_parser.ml"
               : 'pkgname))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 90 "lib/cudf_type_parser.mly"
          ( _1 )
# 338 "lib/cudf_type_parser.ml"
               : 'pkgname))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 91 "lib/cudf_type_parser.mly"
           ( _1 )
# 345 "lib/cudf_type_parser.ml"
               : 'pkgname))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 92 "lib/cudf_type_parser.mly"
           ( _1 )
# 352 "lib/cudf_type_parser.ml"
               : 'pkgname))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 96 "lib/cudf_type_parser.mly"
          ( parse_relop _1 )
# 359 "lib/cudf_type_parser.ml"
               : 'relop))
; (fun __caml_parser_env ->
    Obj.repr(
# 97 "lib/cudf_type_parser.mly"
        ( `Eq )
# 365 "lib/cudf_type_parser.ml"
               : 'relop))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 101 "lib/cudf_type_parser.mly"
           ( int_of_string _1 )
# 372 "lib/cudf_type_parser.ml"
               : 'int))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 102 "lib/cudf_type_parser.mly"
           ( int_of_string _1 )
# 379 "lib/cudf_type_parser.ml"
               : 'int))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'pkgname) in
    Obj.repr(
# 106 "lib/cudf_type_parser.mly"
              ( (_1, None) )
# 386 "lib/cudf_type_parser.ml"
               : 'vpkg))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'pkgname) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'relop) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'version) in
    Obj.repr(
# 107 "lib/cudf_type_parser.mly"
                          ( (_1, Some (_2, _3)) )
# 395 "lib/cudf_type_parser.ml"
               : 'vpkg))
; (fun __caml_parser_env ->
    Obj.repr(
# 110 "lib/cudf_type_parser.mly"
     ( [] )
# 401 "lib/cudf_type_parser.ml"
               : 'vpkglist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'vpkglist_ne) in
    Obj.repr(
# 111 "lib/cudf_type_parser.mly"
                ( _1 )
# 408 "lib/cudf_type_parser.ml"
               : 'vpkglist))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'vpkg) in
    Obj.repr(
# 114 "lib/cudf_type_parser.mly"
           ( [ _1 ] )
# 415 "lib/cudf_type_parser.ml"
               : 'vpkglist_ne))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'vpkg) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'vpkglist_ne) in
    Obj.repr(
# 115 "lib/cudf_type_parser.mly"
                           ( _1 :: _3 )
# 423 "lib/cudf_type_parser.ml"
               : 'vpkglist_ne))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'and_formula) in
    Obj.repr(
# 119 "lib/cudf_type_parser.mly"
                 ( _1 )
# 430 "lib/cudf_type_parser.ml"
               : 'vpkgformula))
; (fun __caml_parser_env ->
    Obj.repr(
# 120 "lib/cudf_type_parser.mly"
              ( [] )
# 436 "lib/cudf_type_parser.ml"
               : 'vpkgformula))
; (fun __caml_parser_env ->
    Obj.repr(
# 121 "lib/cudf_type_parser.mly"
               ( [ [] ] )
# 442 "lib/cudf_type_parser.ml"
               : 'vpkgformula))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'or_formula) in
    Obj.repr(
# 125 "lib/cudf_type_parser.mly"
                  ( [ _1 ] )
# 449 "lib/cudf_type_parser.ml"
               : 'and_formula))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'or_formula) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'and_formula) in
    Obj.repr(
# 126 "lib/cudf_type_parser.mly"
                                 ( _1 :: _3 )
# 457 "lib/cudf_type_parser.ml"
               : 'and_formula))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'vpkg) in
    Obj.repr(
# 130 "lib/cudf_type_parser.mly"
           ( [ _1 ] )
# 464 "lib/cudf_type_parser.ml"
               : 'or_formula))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'vpkg) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'or_formula) in
    Obj.repr(
# 131 "lib/cudf_type_parser.mly"
                         ( _1 :: _3 )
# 472 "lib/cudf_type_parser.ml"
               : 'or_formula))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'and_formula_ntriv) in
    Obj.repr(
# 137 "lib/cudf_type_parser.mly"
                      ( _1 )
# 479 "lib/cudf_type_parser.ml"
               : 'vpkgformula_ntriv))
; (fun __caml_parser_env ->
    Obj.repr(
# 138 "lib/cudf_type_parser.mly"
              ( [] )
# 485 "lib/cudf_type_parser.ml"
               : 'vpkgformula_ntriv))
; (fun __caml_parser_env ->
    Obj.repr(
# 139 "lib/cudf_type_parser.mly"
               ( [ [] ] )
# 491 "lib/cudf_type_parser.ml"
               : 'vpkgformula_ntriv))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'or_formula_ntriv) in
    Obj.repr(
# 142 "lib/cudf_type_parser.mly"
                        ( [ _1 ] )
# 498 "lib/cudf_type_parser.ml"
               : 'and_formula_ntriv))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'or_formula) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'and_formula) in
    Obj.repr(
# 143 "lib/cudf_type_parser.mly"
                                  ( _1 :: _3 )
# 506 "lib/cudf_type_parser.ml"
               : 'and_formula_ntriv))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'vpkg_ntriv) in
    Obj.repr(
# 146 "lib/cudf_type_parser.mly"
                 ( [ _1 ] )
# 513 "lib/cudf_type_parser.ml"
               : 'or_formula_ntriv))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'vpkg) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'or_formula) in
    Obj.repr(
# 147 "lib/cudf_type_parser.mly"
                         ( _1 :: _3 )
# 521 "lib/cudf_type_parser.ml"
               : 'or_formula_ntriv))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 150 "lib/cudf_type_parser.mly"
              ( (_1, None) )
# 528 "lib/cudf_type_parser.ml"
               : 'vpkg_ntriv))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'pkgname) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'relop) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'version) in
    Obj.repr(
# 151 "lib/cudf_type_parser.mly"
                          ( (_1, Some (_2, _3)) )
# 537 "lib/cudf_type_parser.ml"
               : 'vpkg_ntriv))
; (fun __caml_parser_env ->
    Obj.repr(
# 155 "lib/cudf_type_parser.mly"
       ( [] )
# 543 "lib/cudf_type_parser.ml"
               : 'typedecl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'typedecl_ne) in
    Obj.repr(
# 156 "lib/cudf_type_parser.mly"
                  ( _1 )
# 550 "lib/cudf_type_parser.ml"
               : 'typedecl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'typedecl_) in
    Obj.repr(
# 159 "lib/cudf_type_parser.mly"
                ( [ _1 ] )
# 557 "lib/cudf_type_parser.ml"
               : 'typedecl_ne))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'typedecl_) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'typedecl_ne) in
    Obj.repr(
# 160 "lib/cudf_type_parser.mly"
                                ( _1 :: _3 )
# 565 "lib/cudf_type_parser.ml"
               : 'typedecl_ne))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'ident) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'type_) in
    Obj.repr(
# 164 "lib/cudf_type_parser.mly"
                        ( (_1, Cudf_types.typedecl_of_type _3) )
# 573 "lib/cudf_type_parser.ml"
               : 'typedecl_))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 6 : 'ident) in
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'type_) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : 'typed_value) in
    Obj.repr(
# 166 "lib/cudf_type_parser.mly"
                                       ( let name, typ, v = _1, _3, _6 in
					  (name,
					   Cudf_types.typedecl_of_value
					     (Cudf_types.cast typ v)) )
# 585 "lib/cudf_type_parser.ml"
               : 'typedecl_))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'ident) in
    Obj.repr(
# 173 "lib/cudf_type_parser.mly"
             ( parse_typename _1 )
# 592 "lib/cudf_type_parser.ml"
               : 'type_))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'ident) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'enums) in
    Obj.repr(
# 174 "lib/cudf_type_parser.mly"
                                  ( if _1 = "enum"
					  then `Enum _3
					  else raise Parsing.Parse_error )
# 602 "lib/cudf_type_parser.ml"
               : 'type_))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'ident) in
    Obj.repr(
# 180 "lib/cudf_type_parser.mly"
           ( [ _1 ] )
# 609 "lib/cudf_type_parser.ml"
               : 'enums))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'ident) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'enums) in
    Obj.repr(
# 181 "lib/cudf_type_parser.mly"
                      ( _1 :: _3 )
# 617 "lib/cudf_type_parser.ml"
               : 'enums))
; (fun __caml_parser_env ->
    Obj.repr(
# 185 "lib/cudf_type_parser.mly"
      ( `Vpkglist [] )
# 623 "lib/cudf_type_parser.ml"
               : 'typed_value))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'ident) in
    Obj.repr(
# 186 "lib/cudf_type_parser.mly"
           ( `Ident _1 )
# 630 "lib/cudf_type_parser.ml"
               : 'typed_value))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'int) in
    Obj.repr(
# 187 "lib/cudf_type_parser.mly"
          ( `Int _1 )
# 637 "lib/cudf_type_parser.ml"
               : 'typed_value))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'qstring) in
    Obj.repr(
# 188 "lib/cudf_type_parser.mly"
             ( `String _1 )
# 644 "lib/cudf_type_parser.ml"
               : 'typed_value))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'vpkgformula_ntriv) in
    Obj.repr(
# 189 "lib/cudf_type_parser.mly"
                      ( `Vpkgformula _1 )
# 651 "lib/cudf_type_parser.ml"
               : 'typed_value))
(* Entry int_top *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
(* Entry ident_top *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
(* Entry qstring_top *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
(* Entry pkgname_top *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
(* Entry vpkg_top *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
(* Entry vpkglist_top *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
(* Entry vpkgformula_top *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
(* Entry typedecl_top *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
(* Entry type_top *)
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
let int_top (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : int)
let ident_top (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 2 lexfun lexbuf : string)
let qstring_top (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 3 lexfun lexbuf : string)
let pkgname_top (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 4 lexfun lexbuf : Cudf_types.pkgname)
let vpkg_top (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 6 lexfun lexbuf : Cudf_types.vpkg)
let vpkglist_top (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 7 lexfun lexbuf : Cudf_types.vpkglist)
let vpkgformula_top (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 8 lexfun lexbuf : Cudf_types.vpkgformula)
let typedecl_top (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 9 lexfun lexbuf : Cudf_types.typedecl)
let type_top (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 5 lexfun lexbuf : Cudf_types.typ)
;;
# 193 "lib/cudf_type_parser.mly"

open ExtLib

let error_wrapper f =
  fun lexer lexbuf ->
    let syntax_error msg =
      raise (Cudf_types.Syntax_error (msg, Cudf_types.loc_of_lexbuf lexbuf)) in
    try
      f lexer lexbuf
    with
      | Parsing.Parse_error -> syntax_error "parse error"
      | Failure _m when String.starts_with _m "lexing" ->
	  syntax_error "lexer error"
      | Cudf_types.Type_error _ -> syntax_error "type error"
      | Parse_error_msg msg -> syntax_error msg

let int_top = error_wrapper int_top
let ident_top = error_wrapper ident_top
let pkgname_top = error_wrapper pkgname_top
let vpkg_top = error_wrapper vpkg_top
let vpkglist_top = error_wrapper vpkglist_top
let vpkgformula_top = error_wrapper vpkgformula_top
let typedecl_top = error_wrapper typedecl_top

let qstring_top = error_wrapper qstring_top
let type_top = error_wrapper type_top
# 735 "lib/cudf_type_parser.ml"
