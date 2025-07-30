type token =
  | IDENT of (
# 53 "lib/cudf_type_parser.mly"
        string
# 6 "lib/cudf_type_parser.mli"
)
  | PKGNAME of (
# 53 "lib/cudf_type_parser.mly"
        string
# 11 "lib/cudf_type_parser.mli"
)
  | QSTRING of (
# 53 "lib/cudf_type_parser.mly"
        string
# 16 "lib/cudf_type_parser.mli"
)
  | RELOP of (
# 53 "lib/cudf_type_parser.mly"
        string
# 21 "lib/cudf_type_parser.mli"
)
  | POSINT of (
# 54 "lib/cudf_type_parser.mly"
        string
# 26 "lib/cudf_type_parser.mli"
)
  | NEGINT of (
# 54 "lib/cudf_type_parser.mly"
        string
# 31 "lib/cudf_type_parser.mli"
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

val int_top :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> int
val ident_top :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> string
val qstring_top :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> string
val pkgname_top :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Cudf_types.pkgname
val vpkg_top :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Cudf_types.vpkg
val vpkglist_top :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Cudf_types.vpkglist
val vpkgformula_top :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Cudf_types.vpkgformula
val typedecl_top :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Cudf_types.typedecl
val type_top :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Cudf_types.typ
