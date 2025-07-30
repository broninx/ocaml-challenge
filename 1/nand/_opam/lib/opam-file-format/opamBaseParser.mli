
(* The type of tokens. *)

type token = 
  | STRING of (string)
  | RPAR
  | RELOP of (OpamParserTypes.FullPos.relop_kind)
  | RBRACKET
  | RBRACE
  | PFXOP of (OpamParserTypes.FullPos.pfxop_kind)
  | OR
  | LPAR
  | LBRACKET
  | LBRACE
  | INT of (int)
  | IDENT of (string)
  | EOF
  | ENVOP of (OpamParserTypes.FullPos.env_update_op_kind)
  | COLON
  | BOOL of (bool)
  | AND

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val value: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (OpamParserTypes.FullPos.value)

val main: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (string -> OpamParserTypes.FullPos.opamfile)
