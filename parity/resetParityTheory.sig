signature resetParityTheory =
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
    val parity0 : thm

  val resetParity_grammars : type_grammar.grammar * term_grammar.grammar
(*
   [quantHeuristics] Parent theory of "resetParity"

   [rich_list] Parent theory of "resetParity"

   [MUX_def]  Definition

      |- ∀sw in1 in2 out.
           MUX (sw,in1,in2,out) ⇔ ∀t. out t ⇔ if sw t then in1 t else in2 t

   [NOT_def]  Definition

      |- ∀inp out. NOT (inp,out) ⇔ ∀t. out t ⇔ ¬inp t

   [ONE_def]  Definition

      |- ∀out. ONE out ⇔ ∀t. out t ⇔ T

   [PARITY_IMP_def]  Definition

      |- ∀res inp out.
           PARITY_IMP (res,inp,out) ⇔
           ∃l1 l2 l3 l4 l5 l6 l7.
             NOT (l2,l1) ∧ MUX (inp,l1,l2,l4) ∧ MUX (res,l3,l4,l6) ∧
             ONE l3 ∧ ONE l7 ∧ REG (l7,l5) ∧ MUX (l5,l6,l7,out) ∧
             REG (out,l2)

   [PARITY_def]  Definition

      |- (∀reset input. PARITY 0 reset input ⇔ T) ∧
         ∀t reset input.
           PARITY (SUC t) reset input ⇔
           if reset (SUC t) then T
           else if input (SUC t) then ¬PARITY t reset input
           else PARITY t reset input

   [REG_def]  Definition

      |- ∀inp out.
           REG (inp,out) ⇔ ∀t. out t ⇔ if t = 0 then F else inp (t − 1)

   [PARITY_CORRECT]  Theorem

      |- ∀inp out. PARITY_IMP (res,inp,out) ⇒ ∀t. out t ⇔ PARITY t res inp

   [PARITY_LEMMA]  Theorem

      |- ∀res inp out.
           PARITY_IMP (res,inp,out) ⇒
           (out 0 ⇔ T) ∧
           ∀t.
             out (SUC t) ⇔
             if res (SUC t) then T
             else if inp (SUC t) then ¬out t
             else out t

   [PARITY_def_compute]  Theorem

      |- (∀reset input. PARITY 0 reset input ⇔ T) ∧
         (∀t reset input.
            PARITY (NUMERAL (BIT1 t)) reset input ⇔
            if reset (NUMERAL (BIT1 t)) then T
            else if input (NUMERAL (BIT1 t)) then
              ¬PARITY (NUMERAL (BIT1 t) − 1) reset input
            else PARITY (NUMERAL (BIT1 t) − 1) reset input) ∧
         ∀t reset input.
           PARITY (NUMERAL (BIT2 t)) reset input ⇔
           if reset (NUMERAL (BIT2 t)) then T
           else if input (NUMERAL (BIT2 t)) then
             ¬PARITY (NUMERAL (BIT1 t)) reset input
           else PARITY (NUMERAL (BIT1 t)) reset input

   [UNIQUENESS_LEMMA]  Theorem

      |- ∀reset inp out.
           (out 0 ⇔ T) ∧
           (∀t.
              out (SUC t) ⇔
              if reset (SUC t) then T
              else if inp (SUC t) then ¬out t
              else out t) ⇒
           ∀t. out t ⇔ PARITY t reset inp

   [parity0]  Theorem

      |- ∀t reset input. PARITY 0 reset input


*)
end
