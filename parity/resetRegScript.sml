open HolKernel boolLib Parse bossLib



val _ = new_theory "resetReg"


(* Definition of circuit components *)
val ONE_def = Define `ONE (out:num->bool) = !t. out t = T`;
val NOT_def = Define `NOT (inp,out:num->bool) = !t. out t = ~ (inp t)`;
val MUX_def = Define `MUX (sw,in1,in2, out:num->bool) = !t. out t = if sw t then in1 t else in2 t`;
val REG_def = Define `REG (inp,out:num->bool) = !t. out t = if t = 0 then F else inp (t-1)`;

(* Version 1 -- missing out REG for buffering input signal. Without this register, out t = input t - 1 would not be satisfied. *)
(* val RESET_REG_SPEC_def = Define `RESET_REG_SPEC(reset,input,out) = (!t. reset t ==> (out t = T)) /\  !t. out (SUC t) = if (reset t \/ reset(SUC t)) then T else input t`; *)
(* val RESET_REG_IMP_def = Define `RESET_REG_IMP(reset,input,out) = ?l1 l2 l3. MUX(l2,l3,input,out) /\ ONE l3 /\ REG(reset,l1) /\ MUX(l1,l1,reset,l2)`;  *)
(* val RESET_REG_CORRECT = store_thm("RESET_REG_CORRECT", ``!reset input out. RESET_REG_IMP(reset,input,out) ==> RESET_REG_SPEC(reset,input,out)``, *)
(* 				  PURE_REWRITE_TAC[ONE_def, NOT_def, MUX_def, REG_def,RESET_REG_SPEC_def,RESET_REG_IMP_def] *)
(* 						  THEN REPEAT STRIP_TAC *)
(* 						  THEN PROVE_TAC[] *)
(* 						  THEN PAT_ASSUM ``!t. out t = X t``  (fn th => REWRITE_TAC [SPEC ``SUC t`` th]) *)
(* 						  THEN RW_TAC arith_ss [] *)
(* 				 ); *)

(* Version 2 - ONE is redundant *) 
val RESET_REG_SPEC_def = Define `RESET_REG_SPEC(reset,input,out) = (!t. reset t ==> (out t = T)) /\  !t. out (SUC t) = if (reset t \/ reset(SUC t)) then T else input t`;
val RESET_REG_IMP_def = Define `RESET_REG_IMP(reset,input,out) = ?l1 l2 l3 l4. MUX(l2,l3,l4,out) /\ ONE l3 /\ REG(reset,l1) /\ MUX(l1,l1,reset,l2) /\ REG(input,l4)`; 
val RESET_REG_CORRECT = store_thm("RESET_REG_CORRECT", ``!reset input out. RESET_REG_IMP(reset,input,out) ==> RESET_REG_SPEC(reset,input,out)``,
				  PURE_REWRITE_TAC[ONE_def, NOT_def, MUX_def, REG_def,RESET_REG_SPEC_def,RESET_REG_IMP_def]
						  THEN REPEAT STRIP_TAC
						  THENL [PROVE_TAC[],ALL_TAC]
						  THEN RW_TAC arith_ss []				 );

(* TODO remove ONE *)

(* TODO A more stringent specification that version 2 does not satisfy *)
(* val RESET_REG_SPEC_def = Define `RESET_REG_SPEC(reset,input,out) = (out 0 = T) /\ (!t. reset t ==> (out t = T)) /\  !t. out (t+1) = if (reset t \/ reset(t+1)) then T else input t`; *)
val _ = export_theory()
