structure resetParityTheory :> resetParityTheory =
struct
  val _ = if !Globals.print_thy_loads then print "Loading resetParityTheory ... " else ()
  open Type Term Thm
  infixr -->

  fun C s t ty = mk_thy_const{Name=s,Thy=t,Ty=ty}
  fun T s t A = mk_thy_type{Tyop=s, Thy=t,Args=A}
  fun V s q = mk_var(s,q)
  val U     = mk_vartype
  (*  Parents *)
  local open quantHeuristicsTheory rich_listTheory
  in end;
  val _ = Theory.link_parents
          ("resetParity",
          Arbnum.fromString "1465040210",
          Arbnum.fromString "568674")
          [("rich_list",
           Arbnum.fromString "1463056303",
           Arbnum.fromString "112681"),
           ("quantHeuristics",
           Arbnum.fromString "1463056338",
           Arbnum.fromString "468332")];
  val _ = Theory.incorporate_types "resetParity" [];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("min", "bool"), ID("pair", "prod"),
   ID("num", "num"), ID("bool", "!"), ID("pair", ","),
   ID("arithmetic", "-"), ID("bool", "/\\"), ID("num", "0"),
   ID("min", "="), ID("min", "==>"), ID("bool", "?"),
   ID("arithmetic", "BIT1"), ID("arithmetic", "BIT2"), ID("bool", "COND"),
   ID("bool", "F"), ID("resetParity", "MUX"), ID("resetParity", "NOT"),
   ID("arithmetic", "NUMERAL"), ID("resetParity", "ONE"),
   ID("resetParity", "PARITY"), ID("resetParity", "PARITY_IMP"),
   ID("resetParity", "REG"), ID("num", "SUC"), ID("bool", "T"),
   ID("arithmetic", "ZERO"), ID("bool", "~")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [1], TYOP [3], TYOP [0, 1, 0], TYOP [2, 2, 2], TYOP [0, 3, 0],
   TYOP [2, 2, 3], TYOP [0, 5, 0], TYOP [0, 2, 0], TYOP [0, 2, 7],
   TYOP [0, 1, 8], TYOP [2, 2, 5], TYOP [0, 10, 0], TYV "'a",
   TYOP [0, 12, 0], TYOP [0, 13, 0], TYOP [0, 7, 0], TYOP [0, 2, 3],
   TYOP [0, 2, 16], TYOP [0, 3, 5], TYOP [0, 2, 18], TYOP [0, 5, 10],
   TYOP [0, 2, 20], TYOP [0, 1, 1], TYOP [0, 1, 22], TYOP [0, 0, 0],
   TYOP [0, 0, 24], TYOP [0, 1, 2], TYOP [0, 0, 25]]
  end
  val _ = Theory.incorporate_consts "resetParity" tyvector
     [("REG", 4), ("PARITY_IMP", 6), ("PARITY", 9), ("ONE", 7), ("NOT", 4),
      ("MUX", 11)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("in1", 2), TMV("in2", 2), TMV("inp", 2), TMV("input", 2),
   TMV("l1", 2), TMV("l2", 2), TMV("l3", 2), TMV("l4", 2), TMV("l5", 2),
   TMV("l6", 2), TMV("l7", 2), TMV("out", 2), TMV("res", 2),
   TMV("reset", 2), TMV("sw", 2), TMV("t", 12), TMV("t", 1), TMC(4, 14),
   TMC(4, 15), TMC(4, 7), TMC(5, 17), TMC(5, 19), TMC(5, 21), TMC(6, 23),
   TMC(7, 25), TMC(8, 1), TMC(9, 25), TMC(9, 26), TMC(10, 25), TMC(11, 15),
   TMC(12, 22), TMC(13, 22), TMC(14, 27), TMC(15, 0), TMC(16, 11),
   TMC(17, 4), TMC(18, 22), TMC(19, 7), TMC(20, 9), TMC(21, 6), TMC(22, 4),
   TMC(23, 22), TMC(24, 0), TMC(25, 1), TMC(26, 24)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op PARITY_def x = x
    val op PARITY_def =
    DT(((("resetParity",0),[("prim_rec",[38])]),["DISK_THM"]),
       [read"%24%18%13%18%3%26%38%25@$1@$0@@%42@|@|@@%19%16%18%13%18%3%26%38%41$2@@$1@$0@@%32$1%41$2@@@%42@%32$0%41$2@@@%44%38$2@$1@$0@@@%38$2@$1@$0@@@@|@|@|@@"])
  fun op ONE_def x = x
    val op ONE_def =
    DT(((("resetParity",4),[]),[]),
       [read"%18%11%26%37$0@@%19%16%26$1$0@@%42@|@@|@"])
  fun op NOT_def x = x
    val op NOT_def =
    DT(((("resetParity",5),[("pair",[16])]),["DISK_THM"]),
       [read"%18%2%18%11%26%35%20$1@$0@@@%19%16%26$1$0@@%44$2$0@@@|@@|@|@"])
  fun op MUX_def x = x
    val op MUX_def =
    DT(((("resetParity",6),[("pair",[16])]),["DISK_THM"]),
       [read"%18%14%18%0%18%1%18%11%26%34%22$3@%21$2@%20$1@$0@@@@@%19%16%26$1$0@@%32$4$0@@$3$0@@$2$0@@@|@@|@|@|@|@"])
  fun op REG_def x = x
    val op REG_def =
    DT(((("resetParity",7),[("pair",[16])]),["DISK_THM"]),
       [read"%18%2%18%11%26%40%20$1@$0@@@%19%16%26$1$0@@%32%27$0@%25@@%33@$2%23$0@%36%30%43@@@@@@|@@|@|@"])
  fun op PARITY_IMP_def x = x
    val op PARITY_IMP_def =
    DT(((("resetParity",8),[("pair",[16])]),["DISK_THM"]),
       [read"%18%12%18%2%18%11%26%39%21$2@%20$1@$0@@@@%29%4%29%5%29%6%29%7%29%8%29%9%29%10%24%35%20$5@$6@@@%24%34%22$8@%21$6@%20$5@$3@@@@@%24%34%22$9@%21$4@%20$3@$1@@@@@%24%37$4@@%24%37$0@@%24%40%20$0@$2@@@%24%34%22$2@%21$1@%20$0@$7@@@@@%40%20$7@$5@@@@@@@@@|@|@|@|@|@|@|@@|@|@|@"])
  fun op PARITY_def_compute x = x
    val op PARITY_def_compute =
    DT(((("resetParity",1),
        [("arithmetic",[270]),("bool",[26]),
         ("resetParity",[0])]),["DISK_THM"]),
       [read"%24%18%13%18%3%26%38%25@$1@$0@@%42@|@|@@%24%19%16%18%13%18%3%26%38%36%30$2@@@$1@$0@@%32$1%36%30$2@@@@%42@%32$0%36%30$2@@@@%44%38%23%36%30$2@@@%36%30%43@@@@$1@$0@@@%38%23%36%30$2@@@%36%30%43@@@@$1@$0@@@@|@|@|@@%19%16%18%13%18%3%26%38%36%31$2@@@$1@$0@@%32$1%36%31$2@@@@%42@%32$0%36%31$2@@@@%44%38%36%30$2@@@$1@$0@@@%38%36%30$2@@@$1@$0@@@@|@|@|@@@"])
  fun op UNIQUENESS_LEMMA x = x
    val op UNIQUENESS_LEMMA =
    DT(((("resetParity",2),
        [("bool",[14,25,55,62]),("num",[9]),
         ("resetParity",[0])]),["DISK_THM"]),
       [read"%18%13%18%2%18%11%28%24%26$0%25@@%42@@%19%16%26$1%41$0@@@%32$3%41$0@@@%42@%32$2%41$0@@@%44$1$0@@@$1$0@@@@|@@@%19%16%26$1$0@@%38$0@$3@$2@@|@@|@|@|@"])
  fun op parity0 x = x
    val op parity0 =
    DT(((("resetParity",3),
        [("bool",[25,26,35,42,46,47,52,53,55,57,62,70,72,108,110]),
         ("combin",[19]),("resetParity",[0]),
         ("sat",[1,3,5,6,7,11,12,13,14,15])]),["DISK_THM"]),
       [read"%17%15%18%13%18%3%38%25@$1@$0@|@|@|@"])
  fun op PARITY_LEMMA x = x
    val op PARITY_LEMMA =
    DT(((("resetParity",9),
        [("arithmetic",[67]),
         ("bool",
         [5,13,25,26,27,29,46,47,50,51,52,53,55,57,62,63,72,92,93,95,104,
          108,110,128,146]),("num",[7]),("resetParity",[4,5,6,7,8]),
         ("sat",[1,3,5,6,7,11,12,13,14,15])]),["DISK_THM"]),
       [read"%18%12%18%2%18%11%28%39%21$2@%20$1@$0@@@@%24%26$0%25@@%42@@%19%16%26$1%41$0@@@%32$3%41$0@@@%42@%32$2%41$0@@@%44$1$0@@@$1$0@@@@|@@@|@|@|@"])
  fun op PARITY_CORRECT x = x
    val op PARITY_CORRECT =
    DT(((("resetParity",10),
        [("bool",
         [25,26,35,42,46,47,52,53,55,57,62,70,72,74,75,77,83,92,93,95,108,
          110]),("combin",[19]),("resetParity",[2,9]),
         ("sat",[1,3,5,6,7,11,12,13,14,15])]),["DISK_THM"]),
       [read"%18%2%18%11%28%39%21%12@%20$1@$0@@@@%19%16%26$1$0@@%38$0@%12@$2@@|@@|@|@"])
  end
  val _ = DB.bindl "resetParity"
  [("PARITY_def",PARITY_def,DB.Def), ("ONE_def",ONE_def,DB.Def),
   ("NOT_def",NOT_def,DB.Def), ("MUX_def",MUX_def,DB.Def),
   ("REG_def",REG_def,DB.Def), ("PARITY_IMP_def",PARITY_IMP_def,DB.Def),
   ("PARITY_def_compute",PARITY_def_compute,DB.Thm),
   ("UNIQUENESS_LEMMA",UNIQUENESS_LEMMA,DB.Thm),
   ("parity0",parity0,DB.Thm), ("PARITY_LEMMA",PARITY_LEMMA,DB.Thm),
   ("PARITY_CORRECT",PARITY_CORRECT,DB.Thm)]

  local open GrammarSpecials Parse
    fun UTOFF f = Feedback.trace("Parse.unicode_trace_off_complaints",0)f
  in
  val _ = mk_local_grms [("rich_listTheory.rich_list_grammars",
                          rich_listTheory.rich_list_grammars),
                         ("quantHeuristicsTheory.quantHeuristics_grammars",
                          quantHeuristicsTheory.quantHeuristics_grammars)]
  val _ = List.app (update_grms reveal) []
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("PARITY", (Term.prim_mk_const { Name = "PARITY", Thy = "resetParity"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("ONE", (Term.prim_mk_const { Name = "ONE", Thy = "resetParity"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("ONE", (Term.prim_mk_const { Name = "ONE", Thy = "resetParity"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("NOT", (Term.prim_mk_const { Name = "NOT", Thy = "resetParity"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("NOT", (Term.prim_mk_const { Name = "NOT", Thy = "resetParity"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("MUX", (Term.prim_mk_const { Name = "MUX", Thy = "resetParity"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("MUX", (Term.prim_mk_const { Name = "MUX", Thy = "resetParity"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("REG", (Term.prim_mk_const { Name = "REG", Thy = "resetParity"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("REG", (Term.prim_mk_const { Name = "REG", Thy = "resetParity"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("PARITY_IMP", (Term.prim_mk_const { Name = "PARITY_IMP", Thy = "resetParity"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("PARITY_IMP", (Term.prim_mk_const { Name = "PARITY_IMP", Thy = "resetParity"}))
  val resetParity_grammars = Parse.current_lgrms()
  end
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "resetParity",
    thydataty = "compute",
    data =
        "resetParity.PARITY_def resetParity.PARITY_def_compute resetParity.PARITY_IMP_def resetParity.REG_def resetParity.MUX_def resetParity.NOT_def resetParity.ONE_def"
  }

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "resetParity"
end
