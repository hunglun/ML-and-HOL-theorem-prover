open arithmeticTheory;

val divides = Define `divides a b = ?x. a * x = b`;
set_fixity "divides" (Infixr 451);
val ARW_TAC = RW_TAC arith_ss;

g `!x. x divides 0`;
e (ARW_TAC [divides] THEN EXISTS_TAC ``0`` THEN ARW_TAC[]);
val DIVIDES_0 = top_thm();

val DIVIDES_ZERO = store_thm("DIVIDES_ZERO",``!x. 0 divides x = (x=0)``,ARW_TAC [divides]);

g `!x. x divides 1 = (x=1)`;
e (ARW_TAC [divides]);
val DIVIDES_ONE = top_thm();

g `!x. x divides x`;
e(ARW_TAC [divides] THEN EXISTS_TAC ``1`` THEN ARW_TAC [MULT_CLAUSES]);
val DIVIDES_REFL = top_thm();

g `!a b c. a divides b /\ b divides c ==> a divides c`;
e(REPEAT GEN_TAC THEN DISCH_TAC THEN ARW_TAC [divides] THEN EXISTS_TAC ``x*x'`` THEN ARW_TAC [MULT_ASSOC]);
val DIVIDES_TRANS = top_thm();

g `!a b c. a divides b /\ a divides c ==> a divides (b+c)`; 
e(ARW_TAC[divides] THEN EXISTS_TAC ``x+x'`` THEN ARW_TAC [LEFT_ADD_DISTRIB]);
val DIVIDES_ADD=top_thm();

g `!a b c. a divides b /\ a divides c ==> a divides (b-c)`; 
e(ARW_TAC[divides] THEN EXISTS_TAC ``x-x'`` THEN ARW_TAC [LEFT_SUB_DISTRIB]);
val DIVIDES_SUB=top_thm();

g `!d a b. d divides a /\ d divides (a+b) ==> d divides b`;
e (ARW_TAC[divides] THEN EXISTS_TAC ``x'-x`` THEN ARW_TAC [LEFT_SUB_DISTRIB]);
val DIVIDES_ADDL=top_thm();

g `!d a x. d divides a ==> d divides (x * a)`;
e (ARW_TAC[divides] THEN EXISTS_TAC ``x'*x`` THEN ARW_TAC [MULT_ASSOC]);
val DIVIDES_LMUL=top_thm();

g `!d a x. d divides a ==> d divides (a * x)`;
e (ARW_TAC[divides] THEN EXISTS_TAC ``x'*x`` THEN ARW_TAC [MULT_ASSOC]);
val DIVIDES_RMUL=top_thm();


g `!m n. m divides n ==> (m <= n) \/ (n = 0 )`;
e (ARW_TAC[divides] THEN Cases_on `x` THEN ARW_TAC [] THEN ARW_TAC []);
val DIVIDES_LE=store_thm ( "DIVIDES_LE", ``!m n. m divides n ==> (m <= n) \/ (n = 0 )``,ARW_TAC[divides] THEN Cases_on `x` THEN ARW_TAC [] THEN ARW_TAC []);

val DIVIDES_FACT = store_thm ("DIVIDES_FACT", ``!m n. 0 < m /\ m <=n ==> m divides (FACT n)``, ARW_TAC [LESS_EQ_EXISTS] THEN Induct_on `p`
           THENL
	    [ARW_TAC [divides] THEN  Cases_on `m` THENL [PROVE_TAC [DECIDE ``!x. ~(x<x)``],
                  ARW_TAC [FACT,DIVIDES_RMUL, DIVIDES_REFL]],
	     ARW_TAC [FACT, ADD_CLAUSES] THEN PROVE_TAC [DIVIDES_RMUL]]);

(* alternative proof using induction on `n-m` *)
val lemma=store_thm ( "lemma", ``!m. 0 < m ==> ?k. m = SUC k``, Cases THEN ARW_TAC []);

val DIVIDES_FACT = store_thm ("DIVIDES_FACT", ``!m n. 0 < m /\ m <=n ==> m divides (FACT n)``, Induct_on `n-m` THEN REPEAT STRIP_TAC THENL [`m=n` by DECIDE_TAC, ALL_TAC] THEN ARW_TAC [] THENL [ `?k. m = SUC k` by PROVE_TAC [lemma] THEN ARW_TAC [FACT,DIVIDES_LMUL, DIVIDES_REFL], ALL_TAC] THEN `0 < n` by DECIDE_TAC THEN `?k. n = SUC k` by PROVE_TAC [lemma] THEN ARW_TAC [FACT,DIVIDES_RMUL,DIVIDES_REFL]);

(* Prime Number Lemma *)
val prime = Define `prime p = ~(p=1) /\ !x. x divides p ==> (x=1) \/ (x=p)`;

val NOT_PRIME_0 = store_thm("NOT_PRIME_0", ``~prime 0``, ARW_TAC [prime,DIVIDES_0]);

val NOT_PRIME_1 = store_thm("NOT_PRIME_1", ``~prime 1``, ARW_TAC [prime]);

val PRIME_2 = store_thm("PRIME_2", ``prime 2``, ARW_TAC [prime] THEN PROVE_TAC [ DIVIDES_LE , DIVIDES_ZERO, DECIDE ``~(2=1)``, DECIDE ``~(2=0)``, DECIDE `` x<=2 = (x=0) \/ (x=1) \/ (x=2)``]);

val PRIME_POS = store_thm("PRIME_POS", ``!p. prime p ==> 0<p``, Cases THEN ARW_TAC[NOT_PRIME_0]);
