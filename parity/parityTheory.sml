structure parityTheory :> parityTheory =
struct
  val _ = if !Globals.print_thy_loads then print "Loading parityTheory ... " else ()
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
          ("parity",
          Arbnum.fromString "1464984724",
          Arbnum.fromString "290122")
          [("rich_list",
           Arbnum.fromString "1463056303",
           Arbnum.fromString "112681"),
           ("quantHeuristics",
           Arbnum.fromString "1463056338",
           Arbnum.fromString "468332")];
  val _ = Theory.incorporate_types "parity" [];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("min", "bool"), ID("pair", "prod"),
   ID("num", "num"), ID("bool", "!"), ID("pair", ","),
   ID("arithmetic", "-"), ID("bool", "/\\"), ID("num", "0"),
   ID("min", "="), ID("min", "==>"), ID("bool", "?"),
   ID("arithmetic", "BIT1"), ID("arithmetic", "BIT2"), ID("bool", "COND"),
   ID("bool", "F"), ID("parity", "MUX"), ID("parity", "NOT"),
   ID("arithmetic", "NUMERAL"), ID("parity", "ONE"),
   ID("parity", "PARITY"), ID("parity", "PARITY_IMP"), ID("parity", "REG"),
   ID("num", "SUC"), ID("bool", "T"), ID("arithmetic", "ZERO"),
   ID("bool", "~")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [1], TYOP [3], TYOP [0, 1, 0], TYOP [2, 2, 2], TYOP [0, 3, 0],
   TYOP [0, 2, 0], TYOP [0, 1, 5], TYOP [2, 2, 3], TYOP [2, 2, 7],
   TYOP [0, 8, 0], TYOP [0, 5, 0], TYOP [0, 2, 3], TYOP [0, 2, 11],
   TYOP [0, 3, 7], TYOP [0, 2, 13], TYOP [0, 7, 8], TYOP [0, 2, 15],
   TYOP [0, 1, 1], TYOP [0, 1, 17], TYOP [0, 0, 0], TYOP [0, 0, 19],
   TYOP [0, 1, 2], TYOP [0, 0, 20]]
  end
  val _ = Theory.incorporate_consts "parity" tyvector
     [("REG", 4), ("PARITY_IMP", 4), ("PARITY", 6), ("ONE", 5), ("NOT", 4),
      ("MUX", 9)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("in1", 2), TMV("in2", 2), TMV("inp", 2), TMV("input", 2),
   TMV("l1", 2), TMV("l2", 2), TMV("l3", 2), TMV("l4", 2), TMV("l5", 2),
   TMV("out", 2), TMV("sw", 2), TMV("t", 1), TMC(4, 10), TMC(4, 5),
   TMC(5, 12), TMC(5, 14), TMC(5, 16), TMC(6, 18), TMC(7, 20), TMC(8, 1),
   TMC(9, 20), TMC(9, 21), TMC(10, 20), TMC(11, 10), TMC(12, 17),
   TMC(13, 17), TMC(14, 22), TMC(15, 0), TMC(16, 9), TMC(17, 4),
   TMC(18, 17), TMC(19, 5), TMC(20, 6), TMC(21, 4), TMC(22, 4),
   TMC(23, 17), TMC(24, 0), TMC(25, 1), TMC(26, 19)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op PARITY_def x = x
    val op PARITY_def =
    DT(((("parity",0),[("prim_rec",[38])]),["DISK_THM"]),
       [read"%18%12%3%20%32%19@$0@@%36@|@@%13%11%12%3%20%32%35$1@@$0@@%26$0%35$1@@@%38%32$1@$0@@@%32$1@$0@@@|@|@@"])
  fun op ONE_def x = x
    val op ONE_def =
    DT(((("parity",3),[]),[]),
       [read"%12%9%20%31$0@@%13%11%20$1$0@@%36@|@@|@"])
  fun op NOT_def x = x
    val op NOT_def =
    DT(((("parity",4),[("pair",[16])]),["DISK_THM"]),
       [read"%12%2%12%9%20%29%14$1@$0@@@%13%11%20$1$0@@%38$2$0@@@|@@|@|@"])
  fun op MUX_def x = x
    val op MUX_def =
    DT(((("parity",5),[("pair",[16])]),["DISK_THM"]),
       [read"%12%10%12%0%12%1%12%9%20%28%16$3@%15$2@%14$1@$0@@@@@%13%11%20$1$0@@%26$4$0@@$3$0@@$2$0@@@|@@|@|@|@|@"])
  fun op REG_def x = x
    val op REG_def =
    DT(((("parity",6),[("pair",[16])]),["DISK_THM"]),
       [read"%12%2%12%9%20%34%14$1@$0@@@%13%11%20$1$0@@%26%21$0@%19@@%27@$2%17$0@%30%24%37@@@@@@|@@|@|@"])
  fun op PARITY_IMP_def x = x
    val op PARITY_IMP_def =
    DT(((("parity",7),[("pair",[16])]),["DISK_THM"]),
       [read"%12%2%12%9%20%33%14$1@$0@@@%23%4%23%5%23%6%23%7%23%8%18%29%14$3@$4@@@%18%28%16$6@%15$4@%14$3@$2@@@@@%18%28%16$0@%15$2@%14$1@$5@@@@@%18%31$1@@%18%34%14$1@$0@@@%34%14$5@$3@@@@@@@|@|@|@|@|@@|@|@"])
  fun op PARITY_def_compute x = x
    val op PARITY_def_compute =
    DT(((("parity",1),
        [("arithmetic",[270]),("bool",[26]),("parity",[0])]),["DISK_THM"]),
       [read"%18%12%3%20%32%19@$0@@%36@|@@%18%13%11%12%3%20%32%30%24$1@@@$0@@%26$0%30%24$1@@@@%38%32%17%30%24$1@@@%30%24%37@@@@$0@@@%32%17%30%24$1@@@%30%24%37@@@@$0@@@|@|@@%13%11%12%3%20%32%30%25$1@@@$0@@%26$0%30%25$1@@@@%38%32%30%24$1@@@$0@@@%32%30%24$1@@@$0@@@|@|@@@"])
  fun op UNIQUENESS_LEMMA x = x
    val op UNIQUENESS_LEMMA =
    DT(((("parity",2),
        [("bool",[14,25,55,62]),("num",[9]),("parity",[0])]),["DISK_THM"]),
       [read"%12%2%12%9%22%18%20$0%19@@%36@@%13%11%20$1%35$0@@@%26$2%35$0@@@%38$1$0@@@$1$0@@@|@@@%13%11%20$1$0@@%32$0@$2@@|@@|@|@"])
  fun op PARITY_LEMMA x = x
    val op PARITY_LEMMA =
    DT(((("parity",8),
        [("arithmetic",[67]),
         ("bool",
         [5,13,25,26,27,29,46,47,50,51,52,53,55,57,62,63,72,92,93,95,104,
          108,110,128,146]),("num",[7]),("parity",[3,4,5,6,7]),
         ("sat",[1,3,5,6,7,11,12,13,14,15])]),["DISK_THM"]),
       [read"%12%2%12%9%22%33%14$1@$0@@@%18%20$0%19@@%36@@%13%11%20$1%35$0@@@%26$2%35$0@@@%38$1$0@@@$1$0@@@|@@@|@|@"])
  fun op PARITY_CORRECT x = x
    val op PARITY_CORRECT =
    DT(((("parity",9),
        [("bool",
         [25,26,35,42,46,47,52,53,55,57,62,70,72,74,75,77,83,92,93,95,108,
          110]),("combin",[19]),("parity",[2,8]),
         ("sat",[1,3,5,6,7,11,12,13,14,15])]),["DISK_THM"]),
       [read"%12%2%12%9%22%33%14$1@$0@@@%13%11%20$1$0@@%32$0@$2@@|@@|@|@"])
  end
  val _ = DB.bindl "parity"
  [("PARITY_def",PARITY_def,DB.Def), ("ONE_def",ONE_def,DB.Def),
   ("NOT_def",NOT_def,DB.Def), ("MUX_def",MUX_def,DB.Def),
   ("REG_def",REG_def,DB.Def), ("PARITY_IMP_def",PARITY_IMP_def,DB.Def),
   ("PARITY_def_compute",PARITY_def_compute,DB.Thm),
   ("UNIQUENESS_LEMMA",UNIQUENESS_LEMMA,DB.Thm),
   ("PARITY_LEMMA",PARITY_LEMMA,DB.Thm),
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
       ("PARITY", (Term.prim_mk_const { Name = "PARITY", Thy = "parity"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("ONE", (Term.prim_mk_const { Name = "ONE", Thy = "parity"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("ONE", (Term.prim_mk_const { Name = "ONE", Thy = "parity"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("NOT", (Term.prim_mk_const { Name = "NOT", Thy = "parity"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("NOT", (Term.prim_mk_const { Name = "NOT", Thy = "parity"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("MUX", (Term.prim_mk_const { Name = "MUX", Thy = "parity"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("MUX", (Term.prim_mk_const { Name = "MUX", Thy = "parity"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("REG", (Term.prim_mk_const { Name = "REG", Thy = "parity"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("REG", (Term.prim_mk_const { Name = "REG", Thy = "parity"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("PARITY_IMP", (Term.prim_mk_const { Name = "PARITY_IMP", Thy = "parity"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("PARITY_IMP", (Term.prim_mk_const { Name = "PARITY_IMP", Thy = "parity"}))
  val parity_grammars = Parse.current_lgrms()
  end
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "parity",
    thydataty = "compute",
    data =
        "parity.PARITY_def parity.PARITY_def_compute parity.PARITY_IMP_def parity.REG_def parity.MUX_def parity.NOT_def parity.ONE_def"
  }

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "parity"
end
