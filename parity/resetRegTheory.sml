structure resetRegTheory :> resetRegTheory =
struct
  val _ = if !Globals.print_thy_loads then print "Loading resetRegTheory ... " else ()
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
          ("resetReg",
          Arbnum.fromString "1465040313",
          Arbnum.fromString "636937")
          [("rich_list",
           Arbnum.fromString "1463056303",
           Arbnum.fromString "112681"),
           ("quantHeuristics",
           Arbnum.fromString "1463056338",
           Arbnum.fromString "468332")];
  val _ = Theory.incorporate_types "resetReg" [];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("min", "bool"), ID("pair", "prod"),
   ID("num", "num"), ID("bool", "!"), ID("pair", ","),
   ID("arithmetic", "-"), ID("bool", "/\\"), ID("num", "0"),
   ID("min", "="), ID("min", "==>"), ID("bool", "?"),
   ID("arithmetic", "BIT1"), ID("bool", "COND"), ID("bool", "F"),
   ID("resetReg", "MUX"), ID("resetReg", "NOT"),
   ID("arithmetic", "NUMERAL"), ID("resetReg", "ONE"),
   ID("resetReg", "REG"), ID("resetReg", "RESET_REG_IMP"),
   ID("resetReg", "RESET_REG_SPEC"), ID("num", "SUC"), ID("bool", "T"),
   ID("arithmetic", "ZERO"), ID("bool", "\\/"), ID("bool", "~")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [1], TYOP [3], TYOP [0, 1, 0], TYOP [2, 2, 2], TYOP [2, 2, 3],
   TYOP [0, 4, 0], TYOP [0, 3, 0], TYOP [0, 2, 0], TYOP [2, 2, 4],
   TYOP [0, 8, 0], TYOP [0, 7, 0], TYOP [0, 2, 3], TYOP [0, 2, 11],
   TYOP [0, 3, 4], TYOP [0, 2, 13], TYOP [0, 4, 8], TYOP [0, 2, 15],
   TYOP [0, 1, 1], TYOP [0, 1, 17], TYOP [0, 0, 0], TYOP [0, 0, 19],
   TYOP [0, 1, 2], TYOP [0, 0, 20]]
  end
  val _ = Theory.incorporate_consts "resetReg" tyvector
     [("RESET_REG_SPEC", 5), ("RESET_REG_IMP", 5), ("REG", 6), ("ONE", 7),
      ("NOT", 6), ("MUX", 9)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("in1", 2), TMV("in2", 2), TMV("inp", 2), TMV("input", 2),
   TMV("l1", 2), TMV("l2", 2), TMV("l3", 2), TMV("l4", 2), TMV("out", 2),
   TMV("reset", 2), TMV("sw", 2), TMV("t", 1), TMC(4, 10), TMC(4, 7),
   TMC(5, 12), TMC(5, 14), TMC(5, 16), TMC(6, 18), TMC(7, 20), TMC(8, 1),
   TMC(9, 20), TMC(9, 21), TMC(10, 20), TMC(11, 10), TMC(12, 17),
   TMC(13, 22), TMC(14, 0), TMC(15, 9), TMC(16, 6), TMC(17, 17),
   TMC(18, 7), TMC(19, 6), TMC(20, 5), TMC(21, 5), TMC(22, 17), TMC(23, 0),
   TMC(24, 1), TMC(25, 20), TMC(26, 19)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op ONE_def x = x
    val op ONE_def =
    DT(((("resetReg",0),[]),[]),
       [read"%12%8%20%30$0@@%13%11%20$1$0@@%35@|@@|@"])
  fun op NOT_def x = x
    val op NOT_def =
    DT(((("resetReg",1),[("pair",[16])]),["DISK_THM"]),
       [read"%12%2%12%8%20%28%14$1@$0@@@%13%11%20$1$0@@%38$2$0@@@|@@|@|@"])
  fun op MUX_def x = x
    val op MUX_def =
    DT(((("resetReg",2),[("pair",[16])]),["DISK_THM"]),
       [read"%12%10%12%0%12%1%12%8%20%27%16$3@%15$2@%14$1@$0@@@@@%13%11%20$1$0@@%25$4$0@@$3$0@@$2$0@@@|@@|@|@|@|@"])
  fun op REG_def x = x
    val op REG_def =
    DT(((("resetReg",3),[("pair",[16])]),["DISK_THM"]),
       [read"%12%2%12%8%20%31%14$1@$0@@@%13%11%20$1$0@@%25%21$0@%19@@%26@$2%17$0@%29%24%36@@@@@@|@@|@|@"])
  fun op RESET_REG_SPEC_def x = x
    val op RESET_REG_SPEC_def =
    DT(((("resetReg",4),[("pair",[16])]),["DISK_THM"]),
       [read"%12%9%12%3%12%8%20%33%15$2@%14$1@$0@@@@%18%13%11%22$3$0@@%20$1$0@@%35@@|@@%13%11%20$1%34$0@@@%25%37$3$0@@$3%34$0@@@@%35@$2$0@@@|@@@|@|@|@"])
  fun op RESET_REG_IMP_def x = x
    val op RESET_REG_IMP_def =
    DT(((("resetReg",5),[("pair",[16])]),["DISK_THM"]),
       [read"%12%9%12%3%12%8%20%32%15$2@%14$1@$0@@@@%23%4%23%5%23%6%23%7%18%27%16$2@%15$1@%14$0@$4@@@@@%18%30$1@@%18%31%14$6@$3@@@%18%27%16$3@%15$3@%14$6@$2@@@@@%31%14$5@$0@@@@@@|@|@|@|@@|@|@|@"])
  fun op RESET_REG_CORRECT x = x
    val op RESET_REG_CORRECT =
    DT(((("resetReg",6),
        [("arithmetic",[67]),
         ("bool",
         [5,25,26,27,29,46,47,50,51,52,53,55,57,62,63,72,92,93,95,104,108,
          110,128]),("num",[7]),("resetReg",[0,2,3,4,5]),
         ("sat",[1,3,5,6,7,11,12,13,14,15])]),["DISK_THM"]),
       [read"%12%9%12%3%12%8%22%32%15$2@%14$1@$0@@@@%33%15$2@%14$1@$0@@@@|@|@|@"])
  end
  val _ = DB.bindl "resetReg"
  [("ONE_def",ONE_def,DB.Def), ("NOT_def",NOT_def,DB.Def),
   ("MUX_def",MUX_def,DB.Def), ("REG_def",REG_def,DB.Def),
   ("RESET_REG_SPEC_def",RESET_REG_SPEC_def,DB.Def),
   ("RESET_REG_IMP_def",RESET_REG_IMP_def,DB.Def),
   ("RESET_REG_CORRECT",RESET_REG_CORRECT,DB.Thm)]

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
       ("ONE", (Term.prim_mk_const { Name = "ONE", Thy = "resetReg"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("ONE", (Term.prim_mk_const { Name = "ONE", Thy = "resetReg"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("NOT", (Term.prim_mk_const { Name = "NOT", Thy = "resetReg"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("NOT", (Term.prim_mk_const { Name = "NOT", Thy = "resetReg"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("MUX", (Term.prim_mk_const { Name = "MUX", Thy = "resetReg"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("MUX", (Term.prim_mk_const { Name = "MUX", Thy = "resetReg"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("REG", (Term.prim_mk_const { Name = "REG", Thy = "resetReg"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("REG", (Term.prim_mk_const { Name = "REG", Thy = "resetReg"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("RESET_REG_SPEC", (Term.prim_mk_const { Name = "RESET_REG_SPEC", Thy = "resetReg"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("RESET_REG_SPEC", (Term.prim_mk_const { Name = "RESET_REG_SPEC", Thy = "resetReg"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("RESET_REG_IMP", (Term.prim_mk_const { Name = "RESET_REG_IMP", Thy = "resetReg"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("RESET_REG_IMP", (Term.prim_mk_const { Name = "RESET_REG_IMP", Thy = "resetReg"}))
  val resetReg_grammars = Parse.current_lgrms()
  end
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "resetReg",
    thydataty = "compute",
    data =
        "resetReg.ONE_def resetReg.REG_def resetReg.RESET_REG_IMP_def resetReg.RESET_REG_SPEC_def resetReg.MUX_def resetReg.NOT_def"
  }

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "resetReg"
end
