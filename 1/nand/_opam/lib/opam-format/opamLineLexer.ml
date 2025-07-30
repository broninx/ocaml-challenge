# 12 "src/format/opamLineLexer.mll"
 

type token =
  | WORD of string
  | NEWLINE
  | EOF

let word = Buffer.create 57


# 13 "src/format/opamLineLexer.ml"
let __ocaml_lex_tables = {
  Lexing.lex_base =
   "\000\000\249\255\251\255\002\000\007\000\005\000\008\000\255\255\
    \253\255\001\000\012\000\255\255";
  Lexing.lex_backtrk =
   "\255\255\255\255\255\255\005\000\003\000\001\000\255\255\255\255\
    \255\255\255\255\001\000\255\255";
  Lexing.lex_default =
   "\003\000\000\000\000\000\003\000\004\000\255\255\255\255\000\000\
    \000\000\010\000\010\000\000\000";
  Lexing.lex_trans =
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\005\000\007\000\255\255\255\255\006\000\005\000\255\255\
    \255\255\255\255\007\000\000\000\255\255\255\255\255\255\000\000\
    \000\000\255\255\000\000\000\000\000\000\000\000\000\000\000\000\
    \005\000\000\000\255\255\000\000\000\000\005\000\000\000\255\255\
    \000\000\000\000\000\000\000\000\255\255\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \004\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\002\000\000\000\002\000\000\000\
    \000\000\000\000\000\000\008\000\000\000\000\000\000\000\000\000\
    \011\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
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
    \001\000\255\255\255\255\000\000\000\000\000\000\000\000\255\255\
    \000\000\000\000\000\000\000\000\255\255";
  Lexing.lex_check =
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\003\000\003\000\000\000\005\000\003\000\
    \004\000\004\000\006\000\255\255\004\000\010\000\010\000\255\255\
    \255\255\010\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\255\255\003\000\255\255\255\255\005\000\255\255\004\000\
    \255\255\255\255\255\255\255\255\010\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\000\000\255\255\003\000\255\255\
    \255\255\255\255\255\255\004\000\255\255\255\255\255\255\255\255\
    \010\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
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
    \000\000\009\000\003\000\255\255\255\255\255\255\255\255\004\000\
    \255\255\255\255\255\255\255\255\010\000";
  Lexing.lex_base_code =
   "";
  Lexing.lex_backtrk_code =
   "";
  Lexing.lex_default_code =
   "";
  Lexing.lex_trans_code =
   "";
  Lexing.lex_check_code =
   "";
  Lexing.lex_code =
   "";
}

let rec main lexbuf =
   __ocaml_lex_main_rec lexbuf 0
and __ocaml_lex_main_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 27 "src/format/opamLineLexer.mll"
               ( Lexing.new_line lexbuf; NEWLINE )
# 115 "src/format/opamLineLexer.ml"

  | 1 ->
# 28 "src/format/opamLineLexer.mll"
               ( main lexbuf )
# 120 "src/format/opamLineLexer.ml"

  | 2 ->
let
# 29 "src/format/opamLineLexer.mll"
                       w
# 126 "src/format/opamLineLexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos (lexbuf.Lexing.lex_curr_pos + -1) in
# 30 "src/format/opamLineLexer.mll"
               ( Buffer.reset word ; Buffer.add_string word w; escaped lexbuf )
# 130 "src/format/opamLineLexer.ml"

  | 3 ->
let
# 31 "src/format/opamLineLexer.mll"
                       w
# 136 "src/format/opamLineLexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 32 "src/format/opamLineLexer.mll"
               ( if w = "@" then WORD "" else WORD w )
# 140 "src/format/opamLineLexer.ml"

  | 4 ->
let
# 33 "src/format/opamLineLexer.mll"
                  w
# 146 "src/format/opamLineLexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos (lexbuf.Lexing.lex_curr_pos + -1) in
# 34 "src/format/opamLineLexer.mll"
               ( Buffer.reset word ; Buffer.add_string word w; escaped lexbuf )
# 150 "src/format/opamLineLexer.ml"

  | 5 ->
let
# 35 "src/format/opamLineLexer.mll"
                  w
# 156 "src/format/opamLineLexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 36 "src/format/opamLineLexer.mll"
               ( WORD w )
# 160 "src/format/opamLineLexer.ml"

  | 6 ->
# 37 "src/format/opamLineLexer.mll"
               ( EOF )
# 165 "src/format/opamLineLexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_main_rec lexbuf __ocaml_lex_state

and escaped lexbuf =
   __ocaml_lex_escaped_rec lexbuf 9
and __ocaml_lex_escaped_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
let
# 40 "src/format/opamLineLexer.mll"
                     w
# 178 "src/format/opamLineLexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos (lexbuf.Lexing.lex_curr_pos + -1) in
# 41 "src/format/opamLineLexer.mll"
               ( Buffer.add_string word w; escaped lexbuf )
# 182 "src/format/opamLineLexer.ml"

  | 1 ->
let
# 42 "src/format/opamLineLexer.mll"
                     w
# 188 "src/format/opamLineLexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 43 "src/format/opamLineLexer.mll"
               ( Buffer.add_string word w; WORD (Buffer.contents word) )
# 192 "src/format/opamLineLexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_escaped_rec lexbuf __ocaml_lex_state

;;

# 45 "src/format/opamLineLexer.mll"
 

let main lexbuf =
  let rec aux lines words =
    match main lexbuf with
    | WORD s -> aux lines (s::words)
    | NEWLINE ->
      let lines = if words = [] then lines else List.rev words::lines in
      aux lines []
    | EOF ->
      let lines = if words = [] then lines else List.rev words::lines in
      List.rev lines
  in
  aux [] []


# 216 "src/format/opamLineLexer.ml"
