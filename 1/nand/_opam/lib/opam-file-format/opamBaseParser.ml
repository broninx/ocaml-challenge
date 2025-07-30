
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | STRING of (
# 30 "src/opamBaseParser.mly"
       (string)
# 15 "src/opamBaseParser.ml"
  )
    | RPAR
    | RELOP of (
# 38 "src/opamBaseParser.mly"
       (OpamParserTypes.FullPos.relop_kind)
# 21 "src/opamBaseParser.ml"
  )
    | RBRACKET
    | RBRACE
    | PFXOP of (
# 41 "src/opamBaseParser.mly"
       (OpamParserTypes.FullPos.pfxop_kind)
# 28 "src/opamBaseParser.ml"
  )
    | OR
    | LPAR
    | LBRACKET
    | LBRACE
    | INT of (
# 37 "src/opamBaseParser.mly"
       (int)
# 37 "src/opamBaseParser.ml"
  )
    | IDENT of (
# 30 "src/opamBaseParser.mly"
       (string)
# 42 "src/opamBaseParser.ml"
  )
    | EOF
    | ENVOP of (
# 42 "src/opamBaseParser.mly"
       (OpamParserTypes.FullPos.env_update_op_kind)
# 48 "src/opamBaseParser.ml"
  )
    | COLON
    | BOOL of (
# 31 "src/opamBaseParser.mly"
       (bool)
# 54 "src/opamBaseParser.ml"
  )
    | AND
  
end

include MenhirBasics

# 12 "src/opamBaseParser.mly"
  

open OpamParserTypes.FullPos

(** Opam config file generic type parser *)

let get_pos spos epos =
  Lexing.({
    filename = spos.pos_fname;
    start = spos.pos_lnum, spos.pos_cnum - spos.pos_bol;
    stop = epos.pos_lnum, epos.pos_cnum - epos.pos_bol;
  })

(* This must match up with the package's version; checked by the build system *)
let version = (2, 2)


# 80 "src/opamBaseParser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_main) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: main. *)

  | MenhirState03 : (('s, _menhir_box_main) _menhir_cell1_IDENT _menhir_cell0_STRING _menhir_cell0_LBRACE, _menhir_box_main) _menhir_state
    (** State 03.
        Stack shape : IDENT STRING LBRACE.
        Start symbol: main. *)

  | MenhirState06 : (('s, _menhir_box_main) _menhir_cell1_item, _menhir_box_main) _menhir_state
    (** State 06.
        Stack shape : item.
        Start symbol: main. *)

  | MenhirState08 : (('s, _menhir_box_main) _menhir_cell1_IDENT _menhir_cell0_LBRACE, _menhir_box_main) _menhir_state
    (** State 08.
        Stack shape : IDENT LBRACE.
        Start symbol: main. *)

  | MenhirState11 : (('s, _menhir_box_main) _menhir_cell1_IDENT, _menhir_box_main) _menhir_state
    (** State 11.
        Stack shape : IDENT.
        Start symbol: main. *)

  | MenhirState13 : (('s, 'r) _menhir_cell1_RELOP, 'r) _menhir_state
    (** State 13.
        Stack shape : RELOP.
        Start symbol: <undetermined>. *)

  | MenhirState18 : (('s, 'r) _menhir_cell1_PFXOP, 'r) _menhir_state
    (** State 18.
        Stack shape : PFXOP.
        Start symbol: <undetermined>. *)

  | MenhirState19 : (('s, 'r) _menhir_cell1_LPAR, 'r) _menhir_state
    (** State 19.
        Stack shape : LPAR.
        Start symbol: <undetermined>. *)

  | MenhirState20 : (('s, 'r) _menhir_cell1_LBRACKET, 'r) _menhir_state
    (** State 20.
        Stack shape : LBRACKET.
        Start symbol: <undetermined>. *)

  | MenhirState23 : (('s, 'r) _menhir_cell1_valu_, 'r) _menhir_state
    (** State 23.
        Stack shape : valu_.
        Start symbol: <undetermined>. *)

  | MenhirState24 : ((('s, 'r) _menhir_cell1_valu_, 'r) _menhir_cell1_OR, 'r) _menhir_state
    (** State 24.
        Stack shape : valu_ OR.
        Start symbol: <undetermined>. *)

  | MenhirState25 : (((('s, 'r) _menhir_cell1_valu_, 'r) _menhir_cell1_OR, 'r) _menhir_cell1_valu_, 'r) _menhir_state
    (** State 25.
        Stack shape : valu_ OR valu_.
        Start symbol: <undetermined>. *)

  | MenhirState26 : ((('s, 'r) _menhir_cell1_valu_, 'r) _menhir_cell1_LBRACE, 'r) _menhir_state
    (** State 26.
        Stack shape : valu_ LBRACE.
        Start symbol: <undetermined>. *)

  | MenhirState30 : (('s, 'r) _menhir_cell1_atom _menhir_cell0_RELOP, 'r) _menhir_state
    (** State 30.
        Stack shape : atom RELOP.
        Start symbol: <undetermined>. *)

  | MenhirState32 : (('s, 'r) _menhir_cell1_atom _menhir_cell0_ENVOP, 'r) _menhir_state
    (** State 32.
        Stack shape : atom ENVOP.
        Start symbol: <undetermined>. *)

  | MenhirState34 : ((('s, 'r) _menhir_cell1_valu_, 'r) _menhir_cell1_AND, 'r) _menhir_state
    (** State 34.
        Stack shape : valu_ AND.
        Start symbol: <undetermined>. *)

  | MenhirState35 : (((('s, 'r) _menhir_cell1_valu_, 'r) _menhir_cell1_AND, 'r) _menhir_cell1_valu_, 'r) _menhir_state
    (** State 35.
        Stack shape : valu_ AND valu_.
        Start symbol: <undetermined>. *)

  | MenhirState39 : ((('s, 'r) _menhir_cell1_PFXOP, 'r) _menhir_cell1_valu_, 'r) _menhir_state
    (** State 39.
        Stack shape : PFXOP valu_.
        Start symbol: <undetermined>. *)

  | MenhirState40 : ((('s, _menhir_box_main) _menhir_cell1_IDENT, _menhir_box_main) _menhir_cell1_valu_, _menhir_box_main) _menhir_state
    (** State 40.
        Stack shape : IDENT valu_.
        Start symbol: main. *)

  | MenhirState44 : ('s, _menhir_box_value) _menhir_state
    (** State 44.
        Stack shape : .
        Start symbol: value. *)

  | MenhirState46 : (('s, _menhir_box_value) _menhir_cell1_valu_, _menhir_box_value) _menhir_state
    (** State 46.
        Stack shape : valu_.
        Start symbol: value. *)


and ('s, 'r) _menhir_cell1_atom = 
  | MenhirCell1_atom of 's * ('s, 'r) _menhir_state * (
# 57 "src/opamBaseParser.mly"
      (OpamParserTypes.FullPos.value)
# 193 "src/opamBaseParser.ml"
) * Lexing.position * Lexing.position

and ('s, 'r) _menhir_cell1_item = 
  | MenhirCell1_item of 's * ('s, 'r) _menhir_state * (
# 56 "src/opamBaseParser.mly"
      (OpamParserTypes.FullPos.opamfile_item)
# 200 "src/opamBaseParser.ml"
)

and ('s, 'r) _menhir_cell1_valu_ = 
  | MenhirCell1_valu_ of 's * ('s, 'r) _menhir_state * (
# 54 "src/opamBaseParser.mly"
      (OpamParserTypes.FullPos.value)
# 207 "src/opamBaseParser.ml"
) * Lexing.position * Lexing.position

and ('s, 'r) _menhir_cell1_AND = 
  | MenhirCell1_AND of 's * ('s, 'r) _menhir_state * Lexing.position * Lexing.position

and 's _menhir_cell0_ENVOP = 
  | MenhirCell0_ENVOP of 's * (
# 42 "src/opamBaseParser.mly"
       (OpamParserTypes.FullPos.env_update_op_kind)
# 217 "src/opamBaseParser.ml"
) * Lexing.position * Lexing.position

and ('s, 'r) _menhir_cell1_IDENT = 
  | MenhirCell1_IDENT of 's * ('s, 'r) _menhir_state * (
# 30 "src/opamBaseParser.mly"
       (string)
# 224 "src/opamBaseParser.ml"
) * Lexing.position * Lexing.position

and ('s, 'r) _menhir_cell1_LBRACE = 
  | MenhirCell1_LBRACE of 's * ('s, 'r) _menhir_state * Lexing.position

and 's _menhir_cell0_LBRACE = 
  | MenhirCell0_LBRACE of 's * Lexing.position

and ('s, 'r) _menhir_cell1_LBRACKET = 
  | MenhirCell1_LBRACKET of 's * ('s, 'r) _menhir_state * Lexing.position

and ('s, 'r) _menhir_cell1_LPAR = 
  | MenhirCell1_LPAR of 's * ('s, 'r) _menhir_state * Lexing.position

and ('s, 'r) _menhir_cell1_OR = 
  | MenhirCell1_OR of 's * ('s, 'r) _menhir_state * Lexing.position * Lexing.position

and ('s, 'r) _menhir_cell1_PFXOP = 
  | MenhirCell1_PFXOP of 's * ('s, 'r) _menhir_state * (
# 41 "src/opamBaseParser.mly"
       (OpamParserTypes.FullPos.pfxop_kind)
# 246 "src/opamBaseParser.ml"
) * Lexing.position * Lexing.position

and ('s, 'r) _menhir_cell1_RELOP = 
  | MenhirCell1_RELOP of 's * ('s, 'r) _menhir_state * (
# 38 "src/opamBaseParser.mly"
       (OpamParserTypes.FullPos.relop_kind)
# 253 "src/opamBaseParser.ml"
) * Lexing.position * Lexing.position

and 's _menhir_cell0_RELOP = 
  | MenhirCell0_RELOP of 's * (
# 38 "src/opamBaseParser.mly"
       (OpamParserTypes.FullPos.relop_kind)
# 260 "src/opamBaseParser.ml"
) * Lexing.position * Lexing.position

and 's _menhir_cell0_STRING = 
  | MenhirCell0_STRING of 's * (
# 30 "src/opamBaseParser.mly"
       (string)
# 267 "src/opamBaseParser.ml"
) * Lexing.position * Lexing.position

and _menhir_box_value = 
  | MenhirBox_value of (
# 53 "src/opamBaseParser.mly"
      (OpamParserTypes.FullPos.value)
# 274 "src/opamBaseParser.ml"
) [@@unboxed]

and _menhir_box_main = 
  | MenhirBox_main of (
# 52 "src/opamBaseParser.mly"
      (string -> OpamParserTypes.FullPos.opamfile)
# 281 "src/opamBaseParser.ml"
) [@@unboxed]

let _menhir_action_02 =
  fun _1 _endpos__1_ _startpos__1_ ->
    (
# 123 "src/opamBaseParser.mly"
                             ({ pos = get_pos _startpos__1_ _endpos__1_ ; pelem = Ident _1 })
# 289 "src/opamBaseParser.ml"
     : (
# 57 "src/opamBaseParser.mly"
      (OpamParserTypes.FullPos.value)
# 293 "src/opamBaseParser.ml"
    ))

let _menhir_action_03 =
  fun _1 _endpos__1_ _startpos__1_ ->
    (
# 124 "src/opamBaseParser.mly"
                             ({ pos = get_pos _startpos__1_ _endpos__1_ ; pelem = Bool _1 })
# 301 "src/opamBaseParser.ml"
     : (
# 57 "src/opamBaseParser.mly"
      (OpamParserTypes.FullPos.value)
# 305 "src/opamBaseParser.ml"
    ))

let _menhir_action_04 =
  fun _1 _endpos__1_ _startpos__1_ ->
    (
# 125 "src/opamBaseParser.mly"
                             ({ pos = get_pos _startpos__1_ _endpos__1_ ; pelem = Int _1 })
# 313 "src/opamBaseParser.ml"
     : (
# 57 "src/opamBaseParser.mly"
      (OpamParserTypes.FullPos.value)
# 317 "src/opamBaseParser.ml"
    ))

let _menhir_action_05 =
  fun _1 _endpos__1_ _startpos__1_ ->
    (
# 126 "src/opamBaseParser.mly"
                             ({ pos = get_pos _startpos__1_ _endpos__1_ ; pelem = String _1 })
# 325 "src/opamBaseParser.ml"
     : (
# 57 "src/opamBaseParser.mly"
      (OpamParserTypes.FullPos.value)
# 329 "src/opamBaseParser.ml"
    ))

let _menhir_action_06 =
  fun _1 _3 _endpos__1_ _endpos__3_ _startpos__1_ ->
    (
# 72 "src/opamBaseParser.mly"
                                   (
  { pos = get_pos _startpos__1_ _endpos__3_;
    pelem =
      Variable ({ pos = get_pos _startpos__1_ _endpos__1_; pelem =  _1 }, _3);
  }
)
# 342 "src/opamBaseParser.ml"
     : (
# 56 "src/opamBaseParser.mly"
      (OpamParserTypes.FullPos.opamfile_item)
# 346 "src/opamBaseParser.ml"
    ))

let _menhir_action_07 =
  fun _1 _3 _endpos__1_ _endpos__4_ _startpos__1_ _startpos__2_ ->
    (
# 78 "src/opamBaseParser.mly"
                            (
  { pos = get_pos _startpos__1_ _endpos__4_;
    pelem =
      Section ({section_kind = { pos = get_pos _startpos__1_ _endpos__1_; pelem = _1 };
                section_name = None;
                section_items =
                  { pos = get_pos _startpos__2_ _endpos__4_; pelem = _3 };
               })
  }
)
# 363 "src/opamBaseParser.ml"
     : (
# 56 "src/opamBaseParser.mly"
      (OpamParserTypes.FullPos.opamfile_item)
# 367 "src/opamBaseParser.ml"
    ))

let _menhir_action_08 =
  fun _1 _2 _4 _endpos__1_ _endpos__2_ _endpos__5_ _startpos__1_ _startpos__2_ _startpos__3_ ->
    (
# 88 "src/opamBaseParser.mly"
                                   (
  { pos = get_pos _startpos__1_ _endpos__5_;
    pelem =
      Section ({section_kind = { pos = get_pos _startpos__1_ _endpos__1_; pelem = _1 };
                section_name = Some { pos = get_pos _startpos__2_ _endpos__2_; pelem = _2 };
                section_items =
                  { pos = get_pos _startpos__3_ _endpos__5_; pelem = _4 };
               })
  }
)
# 384 "src/opamBaseParser.ml"
     : (
# 56 "src/opamBaseParser.mly"
      (OpamParserTypes.FullPos.opamfile_item)
# 388 "src/opamBaseParser.ml"
    ))

let _menhir_action_09 =
  fun _1 _2 ->
    (
# 67 "src/opamBaseParser.mly"
             ( _1 :: _2 )
# 396 "src/opamBaseParser.ml"
     : (
# 58 "src/opamBaseParser.mly"
      (OpamParserTypes.FullPos.opamfile_item list)
# 400 "src/opamBaseParser.ml"
    ))

let _menhir_action_10 =
  fun () ->
    (
# 68 "src/opamBaseParser.mly"
             ( [] )
# 408 "src/opamBaseParser.ml"
     : (
# 58 "src/opamBaseParser.mly"
      (OpamParserTypes.FullPos.opamfile_item list)
# 412 "src/opamBaseParser.ml"
    ))

let _menhir_action_11 =
  fun _1 ->
    (
# 63 "src/opamBaseParser.mly"
                ( fun file_name -> { file_contents = _1; file_name } )
# 420 "src/opamBaseParser.ml"
     : (
# 52 "src/opamBaseParser.mly"
      (string -> OpamParserTypes.FullPos.opamfile)
# 424 "src/opamBaseParser.ml"
    ))

let _menhir_action_12 =
  fun _1 ->
    (
# 104 "src/opamBaseParser.mly"
                             ( _1 )
# 432 "src/opamBaseParser.ml"
     : (
# 54 "src/opamBaseParser.mly"
      (OpamParserTypes.FullPos.value)
# 436 "src/opamBaseParser.ml"
    ))

let _menhir_action_13 =
  fun _2 _endpos__3_ _startpos__1_ ->
    (
# 105 "src/opamBaseParser.mly"
                             ({ pos = get_pos _startpos__1_ _endpos__3_ ; pelem = Group { pos = get_pos _startpos__1_ _endpos__3_; pelem = _2 } })
# 444 "src/opamBaseParser.ml"
     : (
# 54 "src/opamBaseParser.mly"
      (OpamParserTypes.FullPos.value)
# 448 "src/opamBaseParser.ml"
    ))

let _menhir_action_14 =
  fun _2 _endpos__3_ _startpos__1_ ->
    (
# 106 "src/opamBaseParser.mly"
                             ({ pos = get_pos _startpos__1_ _endpos__3_ ; pelem = List { pos = get_pos _startpos__1_ _endpos__3_; pelem = _2 } })
# 456 "src/opamBaseParser.ml"
     : (
# 54 "src/opamBaseParser.mly"
      (OpamParserTypes.FullPos.value)
# 460 "src/opamBaseParser.ml"
    ))

let _menhir_action_15 =
  fun _1 _3 _endpos__4_ _startpos__1_ _startpos__2_ ->
    (
# 107 "src/opamBaseParser.mly"
                             ({ pos = get_pos _startpos__1_ _endpos__4_ ;
                                pelem = Option (_1, { pos = get_pos _startpos__2_ _endpos__4_; pelem = _3 }) })
# 469 "src/opamBaseParser.ml"
     : (
# 54 "src/opamBaseParser.mly"
      (OpamParserTypes.FullPos.value)
# 473 "src/opamBaseParser.ml"
    ))

let _menhir_action_16 =
  fun _1 _3 _endpos__2_ _endpos__3_ _startpos__1_ _startpos__2_ ->
    (
# 109 "src/opamBaseParser.mly"
                             ({ pos = get_pos _startpos__1_ _endpos__3_ ; pelem = Logop ({ pos = get_pos _startpos__2_ _endpos__2_ ; pelem = `And },_1,_3) })
# 481 "src/opamBaseParser.ml"
     : (
# 54 "src/opamBaseParser.mly"
      (OpamParserTypes.FullPos.value)
# 485 "src/opamBaseParser.ml"
    ))

let _menhir_action_17 =
  fun _1 _3 _endpos__2_ _endpos__3_ _startpos__1_ _startpos__2_ ->
    (
# 110 "src/opamBaseParser.mly"
                             ({ pos = get_pos _startpos__1_ _endpos__3_ ; pelem = Logop ({ pos = get_pos _startpos__2_ _endpos__2_ ; pelem = `Or },_1,_3) })
# 493 "src/opamBaseParser.ml"
     : (
# 54 "src/opamBaseParser.mly"
      (OpamParserTypes.FullPos.value)
# 497 "src/opamBaseParser.ml"
    ))

let _menhir_action_18 =
  fun _1 _2 _3 _endpos__2_ _endpos__3_ _startpos__1_ _startpos__2_ ->
    (
# 111 "src/opamBaseParser.mly"
                             ({ pos = get_pos _startpos__1_ _endpos__3_ ; pelem = Relop ({ pos = get_pos _startpos__2_ _endpos__2_ ; pelem = _2 },_1,_3) })
# 505 "src/opamBaseParser.ml"
     : (
# 54 "src/opamBaseParser.mly"
      (OpamParserTypes.FullPos.value)
# 509 "src/opamBaseParser.ml"
    ))

let _menhir_action_19 =
  fun _1 _2 _3 _endpos__2_ _endpos__3_ _startpos__1_ _startpos__2_ ->
    (
# 112 "src/opamBaseParser.mly"
                             ({ pos = get_pos _startpos__1_ _endpos__3_ ; pelem = Env_binding (_1,{ pos = get_pos _startpos__2_ _endpos__2_ ; pelem = _2 },_3) })
# 517 "src/opamBaseParser.ml"
     : (
# 54 "src/opamBaseParser.mly"
      (OpamParserTypes.FullPos.value)
# 521 "src/opamBaseParser.ml"
    ))

let _menhir_action_20 =
  fun _1 _2 _endpos__1_ _endpos__2_ _startpos__1_ ->
    (
# 113 "src/opamBaseParser.mly"
                             ({ pos = get_pos _startpos__1_ _endpos__2_ ; pelem = Pfxop ({ pos = get_pos _startpos__1_ _endpos__1_ ; pelem = _1 },_2) })
# 529 "src/opamBaseParser.ml"
     : (
# 54 "src/opamBaseParser.mly"
      (OpamParserTypes.FullPos.value)
# 533 "src/opamBaseParser.ml"
    ))

let _menhir_action_21 =
  fun _1 _2 _endpos__1_ _endpos__2_ _startpos__1_ ->
    (
# 114 "src/opamBaseParser.mly"
                             ({ pos = get_pos _startpos__1_ _endpos__2_ ; pelem = Prefix_relop ({ pos = get_pos _startpos__1_ _endpos__1_ ; pelem = _1 },_2) })
# 541 "src/opamBaseParser.ml"
     : (
# 54 "src/opamBaseParser.mly"
      (OpamParserTypes.FullPos.value)
# 545 "src/opamBaseParser.ml"
    ))

let _menhir_action_22 =
  fun _1 ->
    (
# 64 "src/opamBaseParser.mly"
                 ( _1 )
# 553 "src/opamBaseParser.ml"
     : (
# 53 "src/opamBaseParser.mly"
      (OpamParserTypes.FullPos.value)
# 557 "src/opamBaseParser.ml"
    ))

let _menhir_action_23 =
  fun () ->
    (
# 118 "src/opamBaseParser.mly"
                             ( [] )
# 565 "src/opamBaseParser.ml"
     : (
# 55 "src/opamBaseParser.mly"
      (OpamParserTypes.FullPos.value list)
# 569 "src/opamBaseParser.ml"
    ))

let _menhir_action_24 =
  fun _1 _2 ->
    (
# 119 "src/opamBaseParser.mly"
                             ( _1 :: _2 )
# 577 "src/opamBaseParser.ml"
     : (
# 55 "src/opamBaseParser.mly"
      (OpamParserTypes.FullPos.value list)
# 581 "src/opamBaseParser.ml"
    ))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | AND ->
        "AND"
    | BOOL _ ->
        "BOOL"
    | COLON ->
        "COLON"
    | ENVOP _ ->
        "ENVOP"
    | EOF ->
        "EOF"
    | IDENT _ ->
        "IDENT"
    | INT _ ->
        "INT"
    | LBRACE ->
        "LBRACE"
    | LBRACKET ->
        "LBRACKET"
    | LPAR ->
        "LPAR"
    | OR ->
        "OR"
    | PFXOP _ ->
        "PFXOP"
    | RBRACE ->
        "RBRACE"
    | RBRACKET ->
        "RBRACKET"
    | RELOP _ ->
        "RELOP"
    | RPAR ->
        "RPAR"
    | STRING _ ->
        "STRING"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let _menhir_run_42 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _v _tok ->
      match (_tok : MenhirBasics.token) with
      | EOF ->
          let _1 = _v in
          let _v = _menhir_action_11 _1 in
          MenhirBox_main _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_01 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v_0 ->
          let _startpos_1 = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos_2 = _menhir_lexbuf.Lexing.lex_curr_p in
          let _menhir_stack = MenhirCell0_STRING (_menhir_stack, _v_0, _startpos_1, _endpos_2) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LBRACE ->
              let _startpos_3 = _menhir_lexbuf.Lexing.lex_start_p in
              let _menhir_stack = MenhirCell0_LBRACE (_menhir_stack, _startpos_3) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | IDENT _v_4 ->
                  _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState03
              | RBRACE ->
                  let _v_5 = _menhir_action_10 () in
                  _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | LBRACE ->
          let _startpos_6 = _menhir_lexbuf.Lexing.lex_start_p in
          let _menhir_stack = MenhirCell0_LBRACE (_menhir_stack, _startpos_6) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v_7 ->
              _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v_7 MenhirState08
          | RBRACE ->
              let _v_8 = _menhir_action_10 () in
              _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v_8 _tok
          | _ ->
              _eRR ())
      | COLON ->
          let _menhir_s = MenhirState11 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | STRING _v ->
              _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | RELOP _v ->
              _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | PFXOP _v ->
              _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | LPAR ->
              _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LBRACKET ->
              _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IDENT _v ->
              _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | BOOL _v ->
              _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_04 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_IDENT _menhir_cell0_STRING _menhir_cell0_LBRACE -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RBRACE ->
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_LBRACE (_menhir_stack, _startpos__3_) = _menhir_stack in
          let MenhirCell0_STRING (_menhir_stack, _2, _startpos__2_, _endpos__2_) = _menhir_stack in
          let MenhirCell1_IDENT (_menhir_stack, _menhir_s, _1, _startpos__1_, _endpos__1_) = _menhir_stack in
          let (_4, _endpos__5_) = (_v, _endpos) in
          let _v = _menhir_action_08 _1 _2 _4 _endpos__1_ _endpos__2_ _endpos__5_ _startpos__1_ _startpos__2_ _startpos__3_ in
          _menhir_goto_item _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_item : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_item (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | IDENT _v_0 ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState06
      | EOF | RBRACE ->
          let _v_1 = _menhir_action_10 () in
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_07 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_item -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_item (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_09 _1 _2 in
      _menhir_goto_items _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_items : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState00 ->
          _menhir_run_42 _menhir_stack _v _tok
      | MenhirState08 ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState06 ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState03 ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_09 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_IDENT _menhir_cell0_LBRACE -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RBRACE ->
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_LBRACE (_menhir_stack, _startpos__2_) = _menhir_stack in
          let MenhirCell1_IDENT (_menhir_stack, _menhir_s, _1, _startpos__1_, _endpos__1_) = _menhir_stack in
          let (_endpos__4_, _3) = (_endpos, _v) in
          let _v = _menhir_action_07 _1 _3 _endpos__1_ _endpos__4_ _startpos__1_ _startpos__2_ in
          _menhir_goto_item _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_12 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_05 _1 _endpos__1_ _startpos__1_ in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_goto_atom : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState32 ->
          _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState30 ->
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState44 ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState11 ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState18 ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState19 ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState20 ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState23 ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState24 ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState34 ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState26 ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState13 ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_33 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_atom _menhir_cell0_ENVOP -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell0_ENVOP (_menhir_stack, _2, _startpos__2_, _endpos__2_) = _menhir_stack in
      let MenhirCell1_atom (_menhir_stack, _menhir_s, _1, _startpos__1_, _) = _menhir_stack in
      let (_endpos__3_, _3) = (_endpos, _v) in
      let _v = _menhir_action_19 _1 _2 _3 _endpos__2_ _endpos__3_ _startpos__1_ _startpos__2_ in
      _menhir_goto_valu_ _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_goto_valu_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState44 ->
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState11 ->
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState18 ->
          _menhir_run_39 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState34 ->
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState24 ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState19 ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState23 ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState26 ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState20 ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_46 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_value) _menhir_state -> _ -> _menhir_box_value =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | OR ->
          let _menhir_stack = MenhirCell1_valu_ (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState46
      | LBRACE ->
          let _menhir_stack = MenhirCell1_valu_ (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState46
      | EOF ->
          let _1 = _v in
          let _v = _menhir_action_22 _1 in
          MenhirBox_value _v
      | AND ->
          let _menhir_stack = MenhirCell1_valu_ (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState46
      | _ ->
          _eRR ()
  
  and _menhir_run_24 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_valu_ as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _menhir_stack = MenhirCell1_OR (_menhir_stack, _menhir_s, _startpos, _endpos) in
      let _menhir_s = MenhirState24 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RELOP _v ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | PFXOP _v ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LPAR ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRACKET ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENT _v ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BOOL _v ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_13 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _menhir_stack = MenhirCell1_RELOP (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      let _menhir_s = MenhirState13 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | INT _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENT _v ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BOOL _v ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_14 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_04 _1 _endpos__1_ _startpos__1_ in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_15 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_02 _1 _endpos__1_ _startpos__1_ in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_16 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_03 _1 _endpos__1_ _startpos__1_ in
      _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_18 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _menhir_stack = MenhirCell1_PFXOP (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      let _menhir_s = MenhirState18 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RELOP _v ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | PFXOP _v ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LPAR ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRACKET ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENT _v ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BOOL _v ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_19 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_LPAR (_menhir_stack, _menhir_s, _startpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState19
      | RELOP _v ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState19
      | PFXOP _v ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState19
      | LPAR ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState19
      | LBRACKET ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState19
      | INT _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState19
      | IDENT _v ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState19
      | BOOL _v ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState19
      | RPAR ->
          let _v = _menhir_action_23 () in
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_20 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_LBRACKET (_menhir_stack, _menhir_s, _startpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState20
      | RELOP _v ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState20
      | PFXOP _v ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState20
      | LPAR ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState20
      | LBRACKET ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState20
      | INT _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState20
      | IDENT _v ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState20
      | BOOL _v ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState20
      | RBRACKET ->
          let _v = _menhir_action_23 () in
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_21 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_LBRACKET -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RBRACKET ->
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LBRACKET (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_2, _endpos__3_) = (_v, _endpos) in
          let _v = _menhir_action_14 _2 _endpos__3_ _startpos__1_ in
          _menhir_goto_valu_ _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_37 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_LPAR -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAR ->
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAR (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_2, _endpos__3_) = (_v, _endpos) in
          let _v = _menhir_action_13 _2 _endpos__3_ _startpos__1_ in
          _menhir_goto_valu_ _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_26 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_valu_ as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_LBRACE (_menhir_stack, _menhir_s, _startpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState26
      | RELOP _v ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState26
      | PFXOP _v ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState26
      | LPAR ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState26
      | LBRACKET ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState26
      | INT _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState26
      | IDENT _v ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState26
      | BOOL _v ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState26
      | RBRACE ->
          let _v = _menhir_action_23 () in
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_27 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_valu_, ttv_result) _menhir_cell1_LBRACE -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RBRACE ->
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LBRACE (_menhir_stack, _, _startpos__2_) = _menhir_stack in
          let MenhirCell1_valu_ (_menhir_stack, _menhir_s, _1, _startpos__1_, _) = _menhir_stack in
          let (_endpos__4_, _3) = (_endpos, _v) in
          let _v = _menhir_action_15 _1 _3 _endpos__4_ _startpos__1_ _startpos__2_ in
          _menhir_goto_valu_ _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__4_ _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_34 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_valu_ as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _menhir_stack = MenhirCell1_AND (_menhir_stack, _menhir_s, _startpos, _endpos) in
      let _menhir_s = MenhirState34 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RELOP _v ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | PFXOP _v ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LPAR ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRACKET ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENT _v ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BOOL _v ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_40 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_IDENT as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | OR ->
          let _menhir_stack = MenhirCell1_valu_ (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
      | LBRACE ->
          let _menhir_stack = MenhirCell1_valu_ (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
      | AND ->
          let _menhir_stack = MenhirCell1_valu_ (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState40
      | EOF | IDENT _ | RBRACE ->
          let MenhirCell1_IDENT (_menhir_stack, _menhir_s, _1, _startpos__1_, _endpos__1_) = _menhir_stack in
          let (_endpos__3_, _3) = (_endpos, _v) in
          let _v = _menhir_action_06 _1 _3 _endpos__1_ _endpos__3_ _startpos__1_ in
          _menhir_goto_item _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_39 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_PFXOP as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | LBRACE ->
          let _menhir_stack = MenhirCell1_valu_ (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState39
      | AND | BOOL _ | EOF | IDENT _ | INT _ | LBRACKET | LPAR | OR | PFXOP _ | RBRACE | RBRACKET | RELOP _ | RPAR | STRING _ ->
          let MenhirCell1_PFXOP (_menhir_stack, _menhir_s, _1, _startpos__1_, _endpos__1_) = _menhir_stack in
          let (_endpos__2_, _2) = (_endpos, _v) in
          let _v = _menhir_action_20 _1 _2 _endpos__1_ _endpos__2_ _startpos__1_ in
          _menhir_goto_valu_ _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__2_ _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_35 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_valu_, ttv_result) _menhir_cell1_AND as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | LBRACE ->
          let _menhir_stack = MenhirCell1_valu_ (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState35
      | AND | BOOL _ | EOF | IDENT _ | INT _ | LBRACKET | LPAR | OR | PFXOP _ | RBRACE | RBRACKET | RELOP _ | RPAR | STRING _ ->
          let MenhirCell1_AND (_menhir_stack, _, _startpos__2_, _endpos__2_) = _menhir_stack in
          let MenhirCell1_valu_ (_menhir_stack, _menhir_s, _1, _startpos__1_, _) = _menhir_stack in
          let (_endpos__3_, _3) = (_endpos, _v) in
          let _v = _menhir_action_16 _1 _3 _endpos__2_ _endpos__3_ _startpos__1_ _startpos__2_ in
          _menhir_goto_valu_ _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_25 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_valu_, ttv_result) _menhir_cell1_OR as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | LBRACE ->
          let _menhir_stack = MenhirCell1_valu_ (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState25
      | AND ->
          let _menhir_stack = MenhirCell1_valu_ (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState25
      | BOOL _ | EOF | IDENT _ | INT _ | LBRACKET | LPAR | OR | PFXOP _ | RBRACE | RBRACKET | RELOP _ | RPAR | STRING _ ->
          let MenhirCell1_OR (_menhir_stack, _, _startpos__2_, _endpos__2_) = _menhir_stack in
          let MenhirCell1_valu_ (_menhir_stack, _menhir_s, _1, _startpos__1_, _) = _menhir_stack in
          let (_endpos__3_, _3) = (_endpos, _v) in
          let _v = _menhir_action_17 _1 _3 _endpos__2_ _endpos__3_ _startpos__1_ _startpos__2_ in
          _menhir_goto_valu_ _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_23 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_valu_ (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | STRING _v_0 ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState23
      | RELOP _v_1 ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState23
      | PFXOP _v_2 ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState23
      | OR ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState23
      | LPAR ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState23
      | LBRACKET ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState23
      | LBRACE ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState23
      | INT _v_3 ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState23
      | IDENT _v_4 ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState23
      | BOOL _v_5 ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState23
      | AND ->
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState23
      | RBRACE | RBRACKET | RPAR ->
          let _v_6 = _menhir_action_23 () in
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v_6 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_36 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_valu_ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_valu_ (_menhir_stack, _menhir_s, _1, _, _) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_24 _1 _2 in
      _menhir_goto_values _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_values : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState19 ->
          _menhir_run_37 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState23 ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState26 ->
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState20 ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_31 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_atom _menhir_cell0_RELOP -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell0_RELOP (_menhir_stack, _2, _startpos__2_, _endpos__2_) = _menhir_stack in
      let MenhirCell1_atom (_menhir_stack, _menhir_s, _1, _startpos__1_, _) = _menhir_stack in
      let (_endpos__3_, _3) = (_endpos, _v) in
      let _v = _menhir_action_18 _1 _2 _3 _endpos__2_ _endpos__3_ _startpos__1_ _startpos__2_ in
      _menhir_goto_valu_ _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_29 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RELOP _v_0 ->
          let _menhir_stack = MenhirCell1_atom (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          let _v = _v_0 in
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _menhir_stack = MenhirCell0_RELOP (_menhir_stack, _v, _startpos, _endpos) in
          let _menhir_s = MenhirState30 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | STRING _v ->
              _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | INT _v ->
              _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IDENT _v ->
              _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | BOOL _v ->
              _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | ENVOP _v_7 ->
          let _menhir_stack = MenhirCell1_atom (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          let _v = _v_7 in
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _menhir_stack = MenhirCell0_ENVOP (_menhir_stack, _v, _startpos, _endpos) in
          let _menhir_s = MenhirState32 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | STRING _v ->
              _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | INT _v ->
              _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IDENT _v ->
              _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | BOOL _v ->
              _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | AND | BOOL _ | EOF | IDENT _ | INT _ | LBRACE | LBRACKET | LPAR | OR | PFXOP _ | RBRACE | RBRACKET | RPAR | STRING _ ->
          let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_12 _1 in
          _menhir_goto_valu_ _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_17 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_RELOP -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_RELOP (_menhir_stack, _menhir_s, _1, _startpos__1_, _endpos__1_) = _menhir_stack in
      let (_endpos__2_, _2) = (_endpos, _v) in
      let _v = _menhir_action_21 _1 _2 _endpos__1_ _endpos__2_ _startpos__1_ in
      _menhir_goto_valu_ _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__2_ _startpos__1_ _v _menhir_s _tok
  
  let _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00
      | EOF ->
          let _v = _menhir_action_10 () in
          _menhir_run_42 _menhir_stack _v _tok
      | _ ->
          _eRR ()
  
  let _menhir_run_44 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_value =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState44 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RELOP _v ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | PFXOP _v ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LPAR ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LBRACKET ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENT _v ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BOOL _v ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
end

let value =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_value v = _menhir_run_44 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

let main =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_main v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

# 129 "src/opamBaseParser.mly"
  

let nopatch v =
  let s =
  try
    let i = String.index v '.' in
    let i = String.index_from v (i+1) '.' in
    (String.sub v 0 i)
  with Not_found ->
    let rec f i =
      if i >= String.length v then v
      else match String.get v i with
        | '0'..'9' | '.' -> f (i+1)
        | _ -> String.sub v 0 i
    in
    f 0
  in
    try Scanf.sscanf s "%u.%u%!" (fun maj min -> (maj, min))
    with Scanf.Scan_failure _
       | Failure _
       | End_of_file ->
           try Scanf.sscanf s "%u%!" (fun maj -> (maj, 0))
           with Scanf.Scan_failure _
              | Failure _
              | End_of_file -> (0, 0)

(* Update a lexbuf with position information prior to raising an exception *)
let reset_lexbuf_and_abort l file_name (start_line, start_col) (end_line, end_col) exn =
  let open Lexing in
  l.lex_start_p <- {pos_fname = file_name; pos_lnum = start_line; pos_bol = 0; pos_cnum = start_col};
  l.lex_curr_p <- {pos_fname = file_name; pos_lnum = end_line; pos_bol = 0; pos_cnum = end_col};
  exn ()

(* cf. OpamStd.fatal - always allow standard exceptions to propagate. *)
let not_fatal = function
| Sys.Break
| Assert_failure _
| Match_failure _ -> false
| _ -> true

let get_three_tokens lexer lexbuf =
  let open Lexing in
  try
    let p0 = lexbuf.lex_start_p, lexbuf.lex_curr_p in
    let t1 = lexer lexbuf in
    let p1 = lexbuf.lex_start_p, lexbuf.lex_curr_p in
    let t2 = lexer lexbuf in
    let p2 = lexbuf.lex_start_p, lexbuf.lex_curr_p in
    let t3 = lexer lexbuf in
    let p3 = lexbuf.lex_start_p, lexbuf.lex_curr_p in
    ((p0, p1, p2, p3), (t1, t2, t3))
  with
  | e when not_fatal e -> raise Parsing.Parse_error

(* Wrap the ocamlyacc parser *)
let main lexer lexbuf file_name =
  (* Extract the exceptions for opam-version not at the top of the file and
     opam-version duplicated. OpamLexer has special cases for these two
     constants. If OpamLexer.token isn't used, raise Parse_error instead. *)
  let exn_not_first () =
    let _ = lexer (Lexing.from_string "version: \"42\"\nopam-version: \"2.1\"") in
    raise Parsing.Parse_error
  and exn_duplicate () =
    let _ = lexer (Lexing.from_string "opam-version: \"2.1\"\nopam-version: \"z\"") in
    raise Parsing.Parse_error
  and restore_pos (start, curr) =
    let open Lexing in
    lexbuf.lex_start_p <- start;
    lexbuf.lex_curr_p <- curr
  in
  (* Raises the exn_not_first or exn_duplicate exceptions if an invalid
     opam-version variable is found in the result. *)
  let scan_opam_version_variable format_2_1_or_greater = function
  | {pelem = Variable({pelem = "opam-version"; _}, {pelem = String ver; _}); pos = {start; stop; _}} ->
      if format_2_1_or_greater then
        (* [opam-version] can only appear once for 2.1+ *)
        reset_lexbuf_and_abort lexbuf file_name start stop exn_duplicate
      else if nopatch ver > (2, 0) then
        (* Only [opam-version: "2.0"] can appear after the first non-comment/whitespace line of the file *)
        reset_lexbuf_and_abort lexbuf file_name start stop exn_not_first
      else
        ()
  | _ -> ()
  in
  (* Now parse the header of the file manually. The smallest valid opam file
     is `ident: atom`, so if we can't read three tokens we have a parse error *)
  let ((((_, p0) as initial_pos), ((_, p1) as pos1), ((_, p2) as pos2), ((_, p3) as pos3)), (t1, t2, t3)) =
    get_three_tokens lexer lexbuf
  in
  (* Parse those three tokens if they are [opam-version: ver] *)
  let (header, format_2_1_or_greater, trap_exceptions) =
    match (t1, t2, t3) with
    | (IDENT "opam-version", COLON, STRING ver) ->
        let header =
          (* Parsing or lexing errors immediate following opam-version may cause
             an exception to be raised before the element has been fully parsed.
             In this case, we generate a single opam-version Variable to return.
           *)
          {pelem = Variable({pelem = "opam-version"; pos = get_pos p0 p1},
                             {pelem = String ver; pos = get_pos p2 p3});
           pos = get_pos p0 p3}
        in
        (header, (nopatch ver >= (2, 1)), (nopatch ver > version))
    | _ ->
        (* Default is [opam-version: "2.0"] *)
        let pos = {filename = ""; start = (0, 0); stop = (0, 0)} in
        ({pelem = Variable ({pelem = ""; pos}, {pelem = Int 42; pos}); pos}, false, false)
  in
  (* The parser will use position information from the lexbuf, so replay the
     positions, even if we're not actually reading anything. *)
  restore_pos initial_pos;
  (* Wrap the lexer to simulate reading those three tokens a second time *)
  let lexer =
    let tokens = ref [t1, pos1; t2, pos2; t3, pos3] in
    fun lexbuf ->
      match tokens with
      | {contents = (t, p)::rest} ->
          tokens := rest;
          restore_pos p;
          t
      | {contents = []} ->
          lexer lexbuf
  in
  let result =
    try main lexer lexbuf file_name
    with e when trap_exceptions && not_fatal e ->
      (* Append a syntactically invalid sentinel section "#" to the version
         header which was manually parsed. That is then sufficient
         information for a client to determine that the file was invalid.
         If OpamBaseParser.version = (2, 1), this would allow
         `opam-version: "2.2"`, containing no lexer or parser changes, still to
         report syntax errors in opam 2.2, by using this sentinel group to
         detect the parsing error. *)
      let sentinel =
        let pos =
          Lexing.(get_pos lexbuf.lex_start_p lexbuf.lex_curr_p)
        in
        let section =
          {section_kind = {pelem = "#"; pos};
           section_name = None;
           section_items = {pelem = []; pos}}
        in
          {pelem = Section section; pos}
      in
      {file_contents = [header; sentinel]; file_name}
  in
  begin
    match result with
    | {file_contents = _::items; _} ->
        (* Ensure that there are no `opam-version` fields with a value >= "2.1"
           further down the file. *)
        List.iter (scan_opam_version_variable format_2_1_or_greater) items
    | _ -> ()
  end;
  result

let main t l fn =
  try main t l fn with
  | Error -> raise Parsing.Parse_error

let value t l =
  try value t l with
  | Error -> raise Parsing.Parse_error

# 1506 "src/opamBaseParser.ml"
