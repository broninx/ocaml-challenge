# 13 "src/common/shell_lexer.mll"
 
  exception UnknownShellEscape of string
  exception UnmatchedChar of char
  let buf_from_str str =
    let buf = Buffer.create 16 in
    Buffer.add_string buf str;
    buf

# 11 "src/common/shell_lexer.ml"
let __ocaml_lex_tables = {
  Lexing.lex_base =
   "\000\000\245\255\247\255\248\255\001\000\004\000\005\000\249\255\
    \250\255\251\255\252\255\253\255\010\000\013\000\248\255\249\255\
    \014\000\255\255\009\000\250\255\251\255\252\255\253\255\254\255\
    \016\000\017\000\020\000\046\000\253\255\254\255\255\255\047\000\
    \249\255\250\255\251\255\018\000\019\000\050\000\253\255\254\255\
    \255\255\051\000";
  Lexing.lex_backtrk =
   "\255\255\255\255\255\255\255\255\009\000\001\000\000\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\008\000\255\255\255\255\
    \009\000\255\255\000\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\007\000\008\000\003\000\255\255\255\255\255\255\000\000\
    \255\255\255\255\255\255\255\255\004\000\003\000\255\255\255\255\
    \255\255\000\000";
  Lexing.lex_default =
   "\005\000\000\000\000\000\000\000\007\000\005\000\255\255\000\000\
    \000\000\000\000\000\000\000\000\013\000\013\000\000\000\000\000\
    \019\000\000\000\255\255\000\000\000\000\000\000\000\000\000\000\
    \025\000\025\000\032\000\255\255\000\000\000\000\000\000\255\255\
    \000\000\000\000\000\000\036\000\036\000\255\255\000\000\000\000\
    \000\000\255\255";
  Lexing.lex_trans =
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\006\000\000\000\000\000\000\000\255\255\006\000\000\000\
    \000\000\000\000\018\000\018\000\000\000\000\000\255\255\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \006\000\008\000\003\000\011\000\255\255\006\000\255\255\002\000\
    \010\000\018\000\018\000\255\255\015\000\255\255\020\000\255\255\
    \023\000\014\000\027\000\255\255\255\255\022\000\034\000\031\000\
    \031\000\037\000\255\255\041\000\041\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\031\000\031\000\
    \029\000\000\000\041\000\041\000\038\000\028\000\000\000\000\000\
    \000\000\039\000\000\000\000\000\004\000\009\000\000\000\000\000\
    \255\255\000\000\000\000\000\000\000\000\000\000\016\000\000\000\
    \000\000\255\255\021\000\000\000\026\000\255\255\000\000\000\000\
    \033\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
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
    \001\000\255\255\000\000\000\000\255\255\000\000\000\000\000\000\
    \000\000\000\000\017\000\000\000\000\000\255\255\255\255\000\000\
    \255\255\255\255\255\255\255\255\255\255\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\030\000\000\000\
    \000\000\000\000\040\000\000\000";
  Lexing.lex_check =
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\255\255\255\255\255\255\005\000\006\000\255\255\
    \255\255\255\255\018\000\012\000\255\255\255\255\013\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\004\000\000\000\004\000\005\000\006\000\005\000\000\000\
    \004\000\018\000\012\000\005\000\012\000\013\000\016\000\013\000\
    \016\000\012\000\024\000\025\000\013\000\016\000\026\000\027\000\
    \031\000\035\000\036\000\037\000\041\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\027\000\031\000\
    \027\000\255\255\037\000\041\000\037\000\027\000\255\255\255\255\
    \255\255\037\000\255\255\255\255\000\000\004\000\255\255\255\255\
    \005\000\255\255\255\255\255\255\255\255\255\255\012\000\255\255\
    \255\255\013\000\016\000\255\255\024\000\025\000\255\255\255\255\
    \026\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
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
    \000\000\004\000\255\255\255\255\005\000\255\255\255\255\255\255\
    \255\255\255\255\012\000\255\255\255\255\013\000\016\000\255\255\
    \024\000\025\000\035\000\036\000\026\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\027\000\255\255\
    \255\255\255\255\037\000\255\255";
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

let rec shell_command argv lexbuf =
   __ocaml_lex_shell_command_rec argv lexbuf 0
and __ocaml_lex_shell_command_rec argv lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 26 "src/common/shell_lexer.mll"
                 ( shell_command argv lexbuf )
# 135 "src/common/shell_lexer.ml"

  | 1 ->
# 27 "src/common/shell_lexer.mll"
                 ( uquote argv (buf_from_str (Lexing.lexeme lexbuf)) lexbuf )
# 140 "src/common/shell_lexer.ml"

  | 2 ->
# 28 "src/common/shell_lexer.mll"
                 ( uquote argv (buf_from_str "\"") lexbuf )
# 145 "src/common/shell_lexer.ml"

  | 3 ->
# 29 "src/common/shell_lexer.mll"
                 ( uquote argv (buf_from_str "'") lexbuf )
# 150 "src/common/shell_lexer.ml"

  | 4 ->
# 30 "src/common/shell_lexer.mll"
                 ( uquote argv (buf_from_str "\\") lexbuf )
# 155 "src/common/shell_lexer.ml"

  | 5 ->
# 31 "src/common/shell_lexer.mll"
                 ( uquote argv (buf_from_str " ") lexbuf )
# 160 "src/common/shell_lexer.ml"

  | 6 ->
let
# 32 "src/common/shell_lexer.mll"
             c
# 166 "src/common/shell_lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos (lexbuf.Lexing.lex_start_pos + 2) in
# 32 "src/common/shell_lexer.mll"
                 ( raise (UnknownShellEscape c) )
# 170 "src/common/shell_lexer.ml"

  | 7 ->
# 33 "src/common/shell_lexer.mll"
                 ( dquote argv (Buffer.create 16) lexbuf )
# 175 "src/common/shell_lexer.ml"

  | 8 ->
# 34 "src/common/shell_lexer.mll"
                 ( squote argv (Buffer.create 16) lexbuf )
# 180 "src/common/shell_lexer.ml"

  | 9 ->
let
# 35 "src/common/shell_lexer.mll"
        c
# 186 "src/common/shell_lexer.ml"
= Lexing.sub_lexeme_char lexbuf lexbuf.Lexing.lex_start_pos in
# 35 "src/common/shell_lexer.mll"
                 ( raise (UnmatchedChar c) )
# 190 "src/common/shell_lexer.ml"

  | 10 ->
# 36 "src/common/shell_lexer.mll"
       ( List.rev argv )
# 195 "src/common/shell_lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_shell_command_rec argv lexbuf __ocaml_lex_state

and uquote argv buf lexbuf =
   __ocaml_lex_uquote_rec argv buf lexbuf 12
and __ocaml_lex_uquote_rec argv buf lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 38 "src/common/shell_lexer.mll"
               ( shell_command ((Buffer.contents buf)::argv) lexbuf )
# 207 "src/common/shell_lexer.ml"

  | 1 ->
# 39 "src/common/shell_lexer.mll"
               ( Buffer.add_string buf "\""; uquote argv buf lexbuf )
# 212 "src/common/shell_lexer.ml"

  | 2 ->
# 40 "src/common/shell_lexer.mll"
               ( Buffer.add_string buf "'"; uquote argv buf lexbuf )
# 217 "src/common/shell_lexer.ml"

  | 3 ->
# 41 "src/common/shell_lexer.mll"
               ( Buffer.add_string buf "\\"; uquote argv buf lexbuf )
# 222 "src/common/shell_lexer.ml"

  | 4 ->
# 42 "src/common/shell_lexer.mll"
               ( Buffer.add_string buf " "; uquote argv buf lexbuf )
# 227 "src/common/shell_lexer.ml"

  | 5 ->
let
# 43 "src/common/shell_lexer.mll"
             c
# 233 "src/common/shell_lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos (lexbuf.Lexing.lex_start_pos + 2) in
# 43 "src/common/shell_lexer.mll"
               ( raise (UnknownShellEscape c) )
# 237 "src/common/shell_lexer.ml"

  | 6 ->
# 44 "src/common/shell_lexer.mll"
               ( dquote argv buf lexbuf )
# 242 "src/common/shell_lexer.ml"

  | 7 ->
# 45 "src/common/shell_lexer.mll"
               ( squote argv buf lexbuf )
# 247 "src/common/shell_lexer.ml"

  | 8 ->
# 46 "src/common/shell_lexer.mll"
               ( Buffer.add_string buf (Lexing.lexeme lexbuf); uquote argv buf lexbuf )
# 252 "src/common/shell_lexer.ml"

  | 9 ->
let
# 47 "src/common/shell_lexer.mll"
        c
# 258 "src/common/shell_lexer.ml"
= Lexing.sub_lexeme_char lexbuf lexbuf.Lexing.lex_start_pos in
# 47 "src/common/shell_lexer.mll"
               ( raise (UnmatchedChar c) )
# 262 "src/common/shell_lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_uquote_rec argv buf lexbuf __ocaml_lex_state

and dquote argv buf lexbuf =
   __ocaml_lex_dquote_rec argv buf lexbuf 24
and __ocaml_lex_dquote_rec argv buf lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 49 "src/common/shell_lexer.mll"
                   ( shell_command ((Buffer.contents buf)::argv) lexbuf )
# 274 "src/common/shell_lexer.ml"

  | 1 ->
# 50 "src/common/shell_lexer.mll"
                   ( dquote argv buf lexbuf )
# 279 "src/common/shell_lexer.ml"

  | 2 ->
# 51 "src/common/shell_lexer.mll"
                   ( squote argv buf lexbuf )
# 284 "src/common/shell_lexer.ml"

  | 3 ->
# 52 "src/common/shell_lexer.mll"
                   ( uquote argv buf lexbuf )
# 289 "src/common/shell_lexer.ml"

  | 4 ->
# 53 "src/common/shell_lexer.mll"
                   ( Buffer.add_string buf "\""; dquote argv buf lexbuf )
# 294 "src/common/shell_lexer.ml"

  | 5 ->
# 54 "src/common/shell_lexer.mll"
                   ( Buffer.add_string buf "\\"; dquote argv buf lexbuf )
# 299 "src/common/shell_lexer.ml"

  | 6 ->
let
# 55 "src/common/shell_lexer.mll"
             c
# 305 "src/common/shell_lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos (lexbuf.Lexing.lex_start_pos + 2) in
# 55 "src/common/shell_lexer.mll"
                   ( raise (UnknownShellEscape c) )
# 309 "src/common/shell_lexer.ml"

  | 7 ->
# 56 "src/common/shell_lexer.mll"
                   ( Buffer.add_string buf (Lexing.lexeme lexbuf); dquote argv buf lexbuf )
# 314 "src/common/shell_lexer.ml"

  | 8 ->
let
# 57 "src/common/shell_lexer.mll"
        c
# 320 "src/common/shell_lexer.ml"
= Lexing.sub_lexeme_char lexbuf lexbuf.Lexing.lex_start_pos in
# 57 "src/common/shell_lexer.mll"
                   ( raise (UnmatchedChar c) )
# 324 "src/common/shell_lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_dquote_rec argv buf lexbuf __ocaml_lex_state

and squote argv buf lexbuf =
   __ocaml_lex_squote_rec argv buf lexbuf 35
and __ocaml_lex_squote_rec argv buf lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 59 "src/common/shell_lexer.mll"
                   ( shell_command ((Buffer.contents buf)::argv) lexbuf )
# 336 "src/common/shell_lexer.ml"

  | 1 ->
# 60 "src/common/shell_lexer.mll"
                   ( squote argv buf lexbuf )
# 341 "src/common/shell_lexer.ml"

  | 2 ->
# 61 "src/common/shell_lexer.mll"
                   ( dquote argv buf lexbuf )
# 346 "src/common/shell_lexer.ml"

  | 3 ->
# 62 "src/common/shell_lexer.mll"
                   ( uquote argv buf lexbuf )
# 351 "src/common/shell_lexer.ml"

  | 4 ->
# 63 "src/common/shell_lexer.mll"
                   ( Buffer.add_string buf (Lexing.lexeme lexbuf); squote argv buf lexbuf )
# 356 "src/common/shell_lexer.ml"

  | 5 ->
let
# 64 "src/common/shell_lexer.mll"
        c
# 362 "src/common/shell_lexer.ml"
= Lexing.sub_lexeme_char lexbuf lexbuf.Lexing.lex_start_pos in
# 64 "src/common/shell_lexer.mll"
                   ( raise (UnmatchedChar c) )
# 366 "src/common/shell_lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_squote_rec argv buf lexbuf __ocaml_lex_state

;;

# 66 "src/common/shell_lexer.mll"
 
  (** given a (possibly quoted) command string, parse it into an argument vector *)
  let parse_string str =
    let lexbuf = Lexing.from_string str in
    shell_command [] lexbuf

# 380 "src/common/shell_lexer.ml"
