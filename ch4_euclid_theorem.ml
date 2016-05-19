open arithmeticTheory;

val divides = Define `divides a b = ?x. a * x = b`;
set_fixity "divides" (Infixr 451)
val ARW_TAC = RW_TAC arithm_ss;

g `!x. x divides 0`;
e (ARW_TAC [divides] THEN EXISTS_TAC ``0`` THEN ARW_TAC[]);
val DIVIDES_0 = top_thm();

g `!x. 0 divides x = (x=0)`;
e (ARW_TAC [divides]);
val DIVIDES_ZERO = top_thm();

g `!x. x divides 1 = (x=1)`;
e (ARW_TAC [divides]);
val DIVIDES_ONE = top_thm();

g `!a b c. a divides b /\ b divides c ==> a divides c`;
e(REPEAT GEN_TAC THEN DISCH_TAC THEN ARW_TAC [divides] THEN EXISTS_TAC ``x*x'`` THEN ARW_TAC [MULT_ASSOC]);
val DIVIDES_REFL = top_thm()
