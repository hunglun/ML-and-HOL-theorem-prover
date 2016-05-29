bash-3.2$ ~/Github/HOL/bin/hol

---------------------------------------------------------------------
       HOL-4 [Kananaskis 11 (stdknl, built Thu May 12 20:48:28 2016)]

       For introductory HOL help, type: help "hol";
       To exit type <Control>-D
---------------------------------------------------------------------
> BOOL_CASES_AX;
val it = |- ∀t. (t ⇔ T) ∨ (t ⇔ F): thm
> SPEC
# ;
val it = fn: term -> thm -> thm
> fun zip l r = if null l orelse null r then [] else (hd l ,hd r) :: zip (tl l) (tl r);
val zip = fn: 'a list -> 'b list -> ('a * 'b) list
> val a = ``T``;
val a = ``T``: term
> SPEC a BOOL_CASES_AX;
val it = |- (T ⇔ T) ∨ (T ⇔ F): thm
> val a= ``1``;
val a = ``1``: term
> SPEC a BOOL_CASES_AX;
Exception-
   HOL_ERR
     {message = "Term argument's type not equal to bound variable's",
      origin_function = "SPEC", origin_structure = "Thm"} raised
> ASSUME;
val it = fn: term -> thm
> ASSUME a;
Exception-
   HOL_ERR
     {message = "not a proposition", origin_function = "ASSUME",
      origin_structure = "Thm"} raised
> ASSUME ``F``;
val it =  [.] |- F: thm
> ``1``;
val it = ``1``: term
> dest_thm;
val it = fn: thm -> term list * term
> disch;
val it = fn: term * term list -> term list
> DISCH;
val it = fn: term -> thm -> thm
> dest_thm (ASSUME ``F``);
val it = ([``F``], ``F``): term list * term
> DISCH (ASSUME ``F``);
poly: : error: Type error in function application.
   Function: DISCH : term -> thm -> thm
   Argument: (ASSUME (Parse.Term [QUOTE " (*#loc 17 17*)F"])) : thm
   Reason:
      Can't unify term (*Created from opaque signature*) with
         thm (*Created from opaque signature*) (Different type constructors)
Found near DISCH (ASSUME (Parse.Term [QUOTE " (*#loc 17 17*)F"]))
Static Errors
> DISCH ``F`` (ASSUME ``F``);
val it = |- F ⇒ F: thm
> dest_thm it;
val it = ([], ``F ⇒ F``): term list * term
> MP
# ;
val it = fn: thm -> thm -> thm
> hyp;
val it = fn: thm -> term list
> it;
val it = fn: thm -> term list
> ASSUME ``F``;
val it =  [.] |- F: thm
> show_assums := true;
val it = (): unit
> ASSUME ``F``;
val it =  [F] |- F: thm
> ADD_ASSUM;
val it = fn: term -> thm -> thm
> ASSUME
# ;
val it = fn: term -> thm
> DISCH;
val it = fn: term -> thm -> thm
> MP;
val it = fn: thm -> thm -> thm
> REWRITE_RULE;
val it = fn: thm list -> thm -> thm
> ADD_CLAUSES;
poly: : error: Value or constructor (ADD_CLAUSES) has not been declared
Found near ADD_CLAUSES
Static Errors
> open arithmeticTheory;
