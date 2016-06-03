
open HolKernel boolLib Parse bossLib



val _ = new_theory "parity"

val PARITY_def = Define `(PARITY 0 input = T) /\ (PARITY (SUC t) input = if input (SUC t) then ~ (PARITY t input) else PARITY t input)`;

(* SPECIFICATION *)

val SPECIFICATION = ``!t. out t = PARITY t input``;

(* lemma *)

val UNIQUENESS_LEMMA = store_thm(
  "UNIQUENESS_LEMMA",
  ``!inp out.
      (out 0 = T) /\
      (!t. out (SUC t) = if inp (SUC t) then ~out t else out t)
         ==>
      !t. out t = PARITY t inp``,
  REPEAT GEN_TAC THEN STRIP_TAC THEN Induct THENL [
    ASM_REWRITE_TAC [PARITY_def],
    ASM_REWRITE_TAC [PARITY_def]
  ]);


(* Definition of circuit components *)
val ONE_def = Define `ONE (out:num->bool) = !t. out t = T`;
val NOT_def = Define `NOT (inp,out:num->bool) = !t. out t = ~ (inp t)`;
val MUX_def = Define `MUX (sw,in1,in2, out:num->bool) = !t. out t = if sw t then in1 t else in2 t`;
val REG_def = Define `REG (inp,out:num->bool) = !t. out t = if t = 0 then F else inp (t-1)`;

(* Parity Implementation *)
val PARITY_IMP_def = Define `PARITY_IMP (inp, out) = ?l1 l2 l3 l4 l5. NOT(l2,l1) /\ MUX(inp,l1,l2,l3) /\ MUX(l5,l3,l4,out) /\ ONE(l4) /\ REG(l4,l5) /\ REG(out,l2)`;

(* Verification *)

val PARITY_LEMMA = store_thm("PARITY_LEMMA",
  ``!inp out.
        PARITY_IMP(inp,out)
           ==>
        (out 0 = T) /\
        !t. out(SUC t) = if inp(SUC t) then ~(out t) else out t``,
  PURE_REWRITE_TAC [PARITY_IMP_def, ONE_def, NOT_def, MUX_def, REG_def] THEN
  REPEAT STRIP_TAC THENL [
    PROVE_TAC [],
    PAT_ASSUM ``!t. out t = X t``
              (fn th => REWRITE_TAC [SPEC ``SUC t`` th]) THEN
    RW_TAC arith_ss []
  ]);

val PARITY_CORRECT = store_thm(
  "PARITY_CORRECT",
    ``!inp out. PARITY_IMP(inp,out)
                   ==>
                !t. out t = PARITY t inp``,
    RW_TAC std_ss []
      THEN MATCH_MP_TAC UNIQUENESS_LEMMA
      THEN PROVE_TAC [PARITY_LEMMA]);

val _ = export_theory()
