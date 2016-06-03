open arithmeticTheory;

val PARITY_def = Define `(PARITY 0 input = T) /\ (PARITY (SUC t) input = if input (SUC t) then ~ (PARITY t input) else PARITY t input)`;

(* SPECIFICATION *)

val SPECIFICATION = ``!t. out t = PARITY t input``;

(* lemma *)

val lemma = store_thm("lemma",
 `` !input out. (out 0 = T) /\ (!t. out (SUC t) = (if input (SUC t) then ~(out t) else out t) ) ==> !t. out t = PARITY t input ``,
 REPEAT GEN_TAC THEN STRIP_TAC THEN Induct THEN  ASM_REWRITE_TAC [PARITY_def] THEN  ASM_REWRITE_TAC [PARITY_def]);
