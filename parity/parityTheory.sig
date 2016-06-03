signature parityTheory =
sig
  type thm = Thm.thm

  (*  Definitions  *)
    val MUX_def : thm
    val NOT_def : thm
    val ONE_def : thm
    val PARITY_IMP_def : thm
    val PARITY_def : thm
    val REG_def : thm

  (*  Theorems  *)
    val PARITY_CORRECT : thm
    val PARITY_LEMMA : thm
    val PARITY_def_compute : thm
    val UNIQUENESS_LEMMA : thm

  val parity_grammars : type_grammar.grammar * term_grammar.grammar
(*
   [quantHeuristics] Parent theory of "parity"

   [rich_list] Parent theory of "parity"

   [MUX_def]  Definition

      |- ∀sw in1 in2 out.
           MUX (sw,in1,in2,out) ⇔ ∀t. out t ⇔ if sw t then in1 t else in2 t

   [NOT_def]  Definition

      |- ∀inp out. NOT (inp,out) ⇔ ∀t. out t ⇔ ¬inp t

   [ONE_def]  Definition

      |- ∀out. ONE out ⇔ ∀t. out t ⇔ T

   [PARITY_IMP_def]  Definition

      |- ∀inp out.
           PARITY_IMP (inp,out) ⇔
           ∃l1 l2 l3 l4 l5.
             NOT (l2,l1) ∧ MUX (inp,l1,l2,l3) ∧ MUX (l5,l3,l4,out) ∧
             ONE l4 ∧ REG (l4,l5) ∧ REG (out,l2)

   [PARITY_def]  Definition

      |- (∀input. PARITY 0 input ⇔ T) ∧
         ∀t input.
           PARITY (SUC t) input ⇔
           if input (SUC t) then ¬PARITY t input else PARITY t input

   [REG_def]  Definition

      |- ∀inp out.
           REG (inp,out) ⇔ ∀t. out t ⇔ if t = 0 then F else inp (t − 1)

   [PARITY_CORRECT]  Theorem

      |- ∀inp out. PARITY_IMP (inp,out) ⇒ ∀t. out t ⇔ PARITY t inp

   [PARITY_LEMMA]  Theorem

      |- ∀inp out.
           PARITY_IMP (inp,out) ⇒
           (out 0 ⇔ T) ∧
           ∀t. out (SUC t) ⇔ if inp (SUC t) then ¬out t else out t

   [PARITY_def_compute]  Theorem

      |- (∀input. PARITY 0 input ⇔ T) ∧
         (∀t input.
            PARITY (NUMERAL (BIT1 t)) input ⇔
            if input (NUMERAL (BIT1 t)) then
              ¬PARITY (NUMERAL (BIT1 t) − 1) input
            else PARITY (NUMERAL (BIT1 t) − 1) input) ∧
         ∀t input.
           PARITY (NUMERAL (BIT2 t)) input ⇔
           if input (NUMERAL (BIT2 t)) then
             ¬PARITY (NUMERAL (BIT1 t)) input
           else PARITY (NUMERAL (BIT1 t)) input

   [UNIQUENESS_LEMMA]  Theorem

      |- ∀inp out.
           (out 0 ⇔ T) ∧
           (∀t. out (SUC t) ⇔ if inp (SUC t) then ¬out t else out t) ⇒
           ∀t. out t ⇔ PARITY t inp


*)
end
