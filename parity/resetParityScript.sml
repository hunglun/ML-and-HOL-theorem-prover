open HolKernel boolLib Parse bossLib



val _ = new_theory "resetParity"

val PARITY_def = Define `(PARITY 0 reset input = T) /\ (PARITY (SUC t) reset input =  if reset (SUC t ) then T  else (if input(SUC t) then ~(PARITY t reset input) else (PARITY t reset  input)))`;

val UNIQUENESS_LEMMA = store_thm(
  "UNIQUENESS_LEMMA",
  ``!reset inp out.
      (out 0 = T) /\
      (!t. out (SUC t) = if reset (SUC t) then T else if inp (SUC t) then ~out t else out t)
         ==>
      !t. out t = PARITY t reset inp``,
  REPEAT GEN_TAC THEN STRIP_TAC THEN Induct THENL [
    ASM_REWRITE_TAC [PARITY_def],
    ASM_REWRITE_TAC [PARITY_def]
  ]);

val parity0 = store_thm("parity0",``!t reset input. PARITY 0 reset input``,PROVE_TAC[PARITY_def]);


val ONE_def = Define `ONE (out:num->bool) = !t. out t = T`;
val NOT_def = Define `NOT (inp,out:num->bool) = !t. out t = ~ (inp t)`;
val MUX_def = Define `MUX (sw,in1,in2, out:num->bool) = !t. out t = if sw t then in1 t else in2 t`;
val REG_def = Define `REG (inp,out:num->bool) = !t. out t = if t = 0 then F else inp (t-1)`;


(* incomplete -- having problem replacing t with SUC t in the assumption. *)
(* val parityReset = store_thm("parityReset", ``!reset input out. reset t , *)
(* 			   REPEAT GEN_TAC THEN STRIP_TAC THEN Induct_on `t` THENL [PROVE_TAC[PARITY_def],ALL_TAC]); *)


(* FIRST_ASSUM (fn th => REWRITE_TAC [SPEC ``SUC t`` th]) *)
(* PAT_ASSUM ``reset t ==>  X t b c`` *)
(*               (fn th => REWRITE_TAC [SPEC ``SUC t`` th]) *)
(* RW_TAC arith_ss [] *)


(* Design *)
val PARITY_IMP_def = Define `PARITY_IMP (res,inp,out)= ?l1 l2 l3 l4 l5 l6 l7. NOT(l2,l1) /\
MUX(inp,l1,l2,l4) /\
MUX(res,l3,l4,l6) /\
ONE(l3) /\
ONE(l7) /\
REG(l7,l5) /\
MUX(l5,l6,l7,out) /\
REG(out,l2)`;

val PARITY_LEMMA = store_thm("PARITY_LEMMA", ``!res inp out. PARITY_IMP(res,inp,out) ==> (out 0 = T) /\
      (!t. out (SUC t) = if res (SUC t) then T else if inp (SUC t) then ~out t else out t)``,   PURE_REWRITE_TAC [PARITY_IMP_def, ONE_def, NOT_def, MUX_def, REG_def] THEN
  REPEAT STRIP_TAC THENL [
    PROVE_TAC [],
    PAT_ASSUM ``!t. out t = X t``
              (fn th => REWRITE_TAC [SPEC ``SUC t`` th]) THEN
    RW_TAC arith_ss []
  ]);

val PARITY_CORRECT = store_thm("PARITY_CORRECT", ``!inp out. PARITY_IMP(res, inp,out) ==> !t. out t = PARITY t res inp``,
			           RW_TAC std_ss []
      THEN MATCH_MP_TAC UNIQUENESS_LEMMA
      THEN PROVE_TAC [PARITY_LEMMA]);

val _ = export_theory()
