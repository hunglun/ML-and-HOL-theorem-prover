signature euclidTheory =
sig
  type thm = Thm.thm

  (*  Definitions  *)
    val divides_def : thm
    val prime_def : thm

  (*  Theorems  *)
    val DIVIDES_0 : thm
    val DIVIDES_ADD : thm
    val DIVIDES_ADDL : thm
    val DIVIDES_FACT : thm
    val DIVIDES_LE : thm
    val DIVIDES_LMUL : thm
    val DIVIDES_ONE : thm
    val DIVIDES_REFL : thm
    val DIVIDES_RMUL : thm
    val DIVIDES_SUB : thm
    val DIVIDES_TRANS : thm
    val DIVIDES_ZERO : thm
    val NOT_PRIME_0 : thm
    val NOT_PRIME_1 : thm
    val PRIME_2 : thm
    val PRIME_FACTOR : thm
    val PRIME_INFINITE : thm
    val PRIME_POS : thm
    val lemma : thm

  val euclid_grammars : type_grammar.grammar * term_grammar.grammar
(*
   [quantHeuristics] Parent theory of "euclid"

   [rich_list] Parent theory of "euclid"

   [divides_def]  Definition

      |- ∀a b. a divides b ⇔ ∃x. a * x = b

   [prime_def]  Definition

      |- ∀p. prime p ⇔ p ≠ 1 ∧ ∀x. x divides p ⇒ (x = 1) ∨ (x = p)

   [DIVIDES_0]  Theorem

      |- ∀x. x divides 0

   [DIVIDES_ADD]  Theorem

      |- ∀a b c. a divides b ∧ a divides c ⇒ a divides b + c

   [DIVIDES_ADDL]  Theorem

      |- ∀d a b. d divides a ∧ d divides a + b ⇒ d divides b

   [DIVIDES_FACT]  Theorem

      |- ∀m n. 0 < m ∧ m ≤ n ⇒ m divides FACT n

   [DIVIDES_LE]  Theorem

      |- ∀m n. m divides n ⇒ m ≤ n ∨ (n = 0)

   [DIVIDES_LMUL]  Theorem

      |- ∀d a x. d divides a ⇒ d divides x * a

   [DIVIDES_ONE]  Theorem

      |- ∀x. x divides 1 ⇔ (x = 1)

   [DIVIDES_REFL]  Theorem

      |- ∀x. x divides x

   [DIVIDES_RMUL]  Theorem

      |- ∀d a x. d divides a ⇒ d divides a * x

   [DIVIDES_SUB]  Theorem

      |- ∀a b c. a divides b ∧ a divides c ⇒ a divides b − c

   [DIVIDES_TRANS]  Theorem

      |- ∀a b c. a divides b ∧ b divides c ⇒ a divides c

   [DIVIDES_ZERO]  Theorem

      |- ∀x. 0 divides x ⇔ (x = 0)

   [NOT_PRIME_0]  Theorem

      |- ¬prime 0

   [NOT_PRIME_1]  Theorem

      |- ¬prime 1

   [PRIME_2]  Theorem

      |- prime 2

   [PRIME_FACTOR]  Theorem

      |- ∀n. n ≠ 1 ⇒ ∃p. prime p ∧ p divides n

   [PRIME_INFINITE]  Theorem

      |- ∀n. ∃p. prime p ∧ p > n

   [PRIME_POS]  Theorem

      |- ∀p. prime p ⇒ 0 < p

   [lemma]  Theorem

      |- ∀m. 0 < m ⇒ ∃k. m = SUC k


*)
end
