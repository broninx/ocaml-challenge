type token =
  | FIELD of (
# 30 "lib/cudf_822_parser.mly"
        string * (Cudf_types.loc * string)
# 6 "lib/cudf_822_parser.mli"
)
  | CONT of (
# 31 "lib/cudf_822_parser.mly"
        Cudf_types.loc * string
# 11 "lib/cudf_822_parser.mli"
)
  | EOL
  | EOF

val doc_822 :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> (string * (Cudf_types.loc * string)) list list
val stanza_822 :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> (string * (Cudf_types.loc * string)) list option
