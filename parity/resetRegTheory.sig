signature resetRegTheory =
sig
  type thm = Thm.thm

  (*  Definitions  *)
    val MUX_def : thm
    val NOT_def : thm
    val ONE_def : thm
    val REG_def : thm
    val RESET_REG_IMP_def : thm
    val RESET_REG_SPEC_def : thm

  (*  Theorems  *)
    val RESET_REG_CORRECT : thm

  val resetReg_grammars : type_grammar.grammar * term_grammar.grammar
(*
   [quantHeuristics] Parent theory of "resetReg"

   [rich_list] Parent theory of "resetReg"

   [MUX_def]  Definition

      |- ∀sw in1 in2 out.
           MUX (sw,in1,in2,out) ⇔ ∀t. out t ⇔ if sw t then in1 t else in2 t

   [NOT_def]  Definition

      |- ∀inp out. NOT (inp,out) ⇔ ∀t. out t ⇔ ¬inp t

   [ONE_def]  Definition

      |- ∀out. ONE out ⇔ ∀t. out t ⇔ T

   [REG_def]  Definition

      |- ∀inp out.
           REG (inp,out) ⇔ ∀t. out t ⇔ if t = 0 then F else inp (t − 1)

   [RESET_REG_IMP_def]  Definition

      |- ∀reset input out.
           RESET_REG_IMP (reset,input,out) ⇔
           ∃l1 l2 l3 l4.
             MUX (l2,l3,l4,out) ∧ ONE l3 ∧ REG (reset,l1) ∧
             MUX (l1,l1,reset,l2) ∧ REG (input,l4)

   [RESET_REG_SPEC_def]  Definition

      |- ∀reset input out.
           RESET_REG_SPEC (reset,input,out) ⇔
           (∀t. reset t ⇒ (out t ⇔ T)) ∧
           ∀t. out (SUC t) ⇔ if reset t ∨ reset (SUC t) then T else input t

   [RESET_REG_CORRECT]  Theorem

      |- ∀reset input out.
           RESET_REG_IMP (reset,input,out) ⇒
           RESET_REG_SPEC (reset,input,out)


*)
end
