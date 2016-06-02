structure euclidTheory :> euclidTheory =
struct
  val _ = if !Globals.print_thy_loads then print "Loading euclidTheory ... " else ()
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
          ("euclid",
          Arbnum.fromString "1464907822",
          Arbnum.fromString "365015")
          [("rich_list",
           Arbnum.fromString "1463056303",
           Arbnum.fromString "112681"),
           ("quantHeuristics",
           Arbnum.fromString "1463056338",
           Arbnum.fromString "468332")];
  val _ = Theory.incorporate_types "euclid" [];

  val idvector = 
    let fun ID(thy,oth) = {Thy = thy, Other = oth}
    in Vector.fromList
  [ID("min", "fun"), ID("min", "bool"), ID("num", "num"), ID("bool", "!"),
   ID("arithmetic", "*"), ID("arithmetic", "+"), ID("arithmetic", "-"),
   ID("bool", "/\\"), ID("num", "0"), ID("prim_rec", "<"),
   ID("arithmetic", "<="), ID("min", "="), ID("min", "==>"),
   ID("arithmetic", ">"), ID("bool", "?"), ID("arithmetic", "BIT1"),
   ID("arithmetic", "BIT2"), ID("arithmetic", "FACT"),
   ID("arithmetic", "NUMERAL"), ID("num", "SUC"), ID("arithmetic", "ZERO"),
   ID("bool", "\\/"), ID("euclid", "divides"), ID("euclid", "prime"),
   ID("bool", "~")]
  end;
  local open SharingTables
  in
  val tyvector = build_type_vector idvector
  [TYOP [1], TYOP [2], TYOP [0, 1, 0], TYOP [0, 1, 2], TYOP [0, 2, 0],
   TYOP [0, 1, 1], TYOP [0, 1, 5], TYOP [0, 0, 0], TYOP [0, 0, 7]]
  end
  val _ = Theory.incorporate_consts "euclid" tyvector
     [("prime", 2), ("divides", 3)];

  local open SharingTables
  in
  val tmvector = build_term_vector idvector tyvector
  [TMV("a", 1), TMV("b", 1), TMV("c", 1), TMV("d", 1), TMV("k", 1),
   TMV("m", 1), TMV("n", 1), TMV("p", 1), TMV("x", 1), TMC(3, 4),
   TMC(4, 6), TMC(5, 6), TMC(6, 6), TMC(7, 8), TMC(8, 1), TMC(9, 3),
   TMC(10, 3), TMC(11, 8), TMC(11, 3), TMC(12, 8), TMC(13, 3), TMC(14, 4),
   TMC(15, 5), TMC(16, 5), TMC(17, 5), TMC(18, 5), TMC(19, 5), TMC(20, 1),
   TMC(21, 8), TMC(22, 3), TMC(23, 2), TMC(24, 7)]
  end
  local
  val DT = Thm.disk_thm val read = Term.read_raw tmvector
  in
  fun op divides_def x = x
    val op divides_def =
    DT(((("euclid",0),[]),[]),
       [read"%9%0%9%1%17%29$1@$0@@%21%8%18%10$2@$0@@$1@|@@|@|@"])
  fun op prime_def x = x
    val op prime_def =
    DT(((("euclid",15),[]),[]),
       [read"%9%7%17%30$0@@%13%31%18$0@%25%22%27@@@@@%9%8%19%29$0@$1@@%28%18$0@%25%22%27@@@@%18$0@$1@@@|@@@|@"])
  fun op lemma x = x
    val op lemma =
    DT(((("euclid",13),
        [("arithmetic",[28]),("bool",[25,26,27,52,57,62,104,123,139]),
         ("prim_rec",[1,6,7])]),["DISK_THM"]),
       [read"%9%5%19%15%14@$0@@%21%4%18$1@%26$0@@|@@|@"])
  fun op DIVIDES_0 x = x
    val op DIVIDES_0 =
    DT(((("euclid",1),
        [("arithmetic",[152]),("bool",[25,51,55]),
         ("euclid",[0])]),["DISK_THM"]), [read"%9%8%29$0@%14@|@"])
  fun op DIVIDES_ZERO x = x
    val op DIVIDES_ZERO =
    DT(((("euclid",2),
        [("arithmetic",[46,69,73,75,95,174,175,179,182]),
         ("bool",[25,35,36,51,53,62,92,95,103,104,106]),("euclid",[0]),
         ("numeral",[3,8]),("sat",[1,3,5,6,7,11,12,13,15])]),["DISK_THM"]),
       [read"%9%8%17%29%14@$0@@%18$0@%14@@|@"])
  fun op DIVIDES_ONE x = x
    val op DIVIDES_ONE =
    DT(((("euclid",3),
        [("arithmetic",[153]),("bool",[25,26,55,142]),
         ("euclid",[0])]),["DISK_THM"]),
       [read"%9%8%17%29$0@%25%22%27@@@@%18$0@%25%22%27@@@@|@"])
  fun op DIVIDES_REFL x = x
    val op DIVIDES_REFL =
    DT(((("euclid",4),
        [("arithmetic",[73]),("bool",[25,55]),
         ("euclid",[0])]),["DISK_THM"]), [read"%9%8%29$0@$0@|@"])
  fun op DIVIDES_TRANS x = x
    val op DIVIDES_TRANS =
    DT(((("euclid",5),
        [("arithmetic",[78]),("bool",[25,55]),
         ("euclid",[0])]),["DISK_THM"]),
       [read"%9%0%9%1%9%2%19%13%29$2@$1@@%29$1@$0@@@%29$2@$0@@|@|@|@"])
  fun op DIVIDES_ADD x = x
    val op DIVIDES_ADD =
    DT(((("euclid",6),
        [("arithmetic",[77,93]),("bool",[25,55,57,104,123]),
         ("euclid",[0])]),["DISK_THM"]),
       [read"%9%0%9%1%9%2%19%13%29$2@$1@@%29$2@$0@@@%29$2@%11$1@$0@@@|@|@|@"])
  fun op DIVIDES_SUB x = x
    val op DIVIDES_SUB =
    DT(((("euclid",7),
        [("arithmetic",[104]),("bool",[25,55,57,104,123]),
         ("euclid",[0])]),["DISK_THM"]),
       [read"%9%0%9%1%9%2%19%13%29$2@$1@@%29$2@$0@@@%29$2@%12$1@$0@@@|@|@|@"])
  fun op DIVIDES_ADDL x = x
    val op DIVIDES_ADDL =
    DT(((("euclid",8),
        [("arithmetic",[26,104,132]),("bool",[25,55,57,104,123]),
         ("euclid",[0])]),["DISK_THM"]),
       [read"%9%3%9%0%9%1%19%13%29$2@$1@@%29$2@%11$1@$0@@@@%29$2@$0@@|@|@|@"])
  fun op DIVIDES_LMUL x = x
    val op DIVIDES_LMUL =
    DT(((("euclid",9),
        [("arithmetic",[75,78]),("bool",[25,55,57,104,123]),
         ("euclid",[0])]),["DISK_THM"]),
       [read"%9%3%9%0%9%8%19%29$2@$1@@%29$2@%10$0@$1@@@|@|@|@"])
  fun op DIVIDES_RMUL x = x
    val op DIVIDES_RMUL =
    DT(((("euclid",10),
        [("arithmetic",[75,78]),("bool",[25,55,57,104,123]),
         ("euclid",[0])]),["DISK_THM"]),
       [read"%9%3%9%0%9%8%19%29$2@$1@@%29$2@%10$1@$0@@@|@|@|@"])
  fun op DIVIDES_LE x = x
    val op DIVIDES_LE =
    DT(((("euclid",11),
        [("arithmetic",[28,152,192]),
         ("bool",[25,26,27,51,55,57,62,104,123]),("euclid",[0]),
         ("num",[7]),("prim_rec",[6,7])]),["DISK_THM"]),
       [read"%9%5%9%6%19%29$1@$0@@%28%16$1@$0@@%18$0@%14@@@|@|@"])
  fun op DIVIDES_FACT x = x
    val op DIVIDES_FACT =
    DT(((("euclid",14),
        [("arithmetic",
         [24,25,27,41,46,59,73,75,95,99,158,174,175,178,179,182,207,271]),
         ("bool",
         [14,25,26,35,42,46,47,50,51,52,53,57,62,71,77,92,93,95,100,103,
          104,145]),("euclid",[4,9,10,13]),("num",[9]),("numeral",[3,5,8]),
         ("sat",[1,3,5,6,7,11,12,13,14,15])]),["DISK_THM"]),
       [read"%9%5%9%6%19%13%15%14@$1@@%16$1@$0@@@%29$1@%24$0@@@|@|@"])
  fun op NOT_PRIME_0 x = x
    val op NOT_PRIME_0 =
    DT(((("euclid",16),
        [("bool",[25,26,27,35,50,51,52,53,55,57,62,104,123]),
         ("euclid",[1,15]),("numeral",[3,6])]),["DISK_THM"]),
       [read"%31%30%14@@"])
  fun op NOT_PRIME_1 x = x
    val op NOT_PRIME_1 =
    DT(((("euclid",17),
        [("bool",[25,50,51,53,55,57,104,123]),
         ("euclid",[15])]),["DISK_THM"]), [read"%31%30%25%22%27@@@@"])
  fun op PRIME_2 x = x
    val op PRIME_2 =
    DT(((("euclid",18),
        [("arithmetic",[46,73,95,174,175,178,179,182]),
         ("bool",
         [13,25,26,27,29,35,42,46,47,50,51,52,53,55,57,62,92,93,95,103,104,
          106]),("euclid",[2,11,15]),("numeral",[0,3,5,6,8]),
         ("sat",[1,3,5,6,7,11,12,13,14,15,17,18,19,20,23])]),["DISK_THM"]),
       [read"%30%25%23%27@@@"])
  fun op PRIME_POS x = x
    val op PRIME_POS =
    DT(((("euclid",19),
        [("arithmetic",[28]),("bool",[25,26,27,52,57,62,104,123]),
         ("euclid",[16]),("prim_rec",[6,7])]),["DISK_THM"]),
       [read"%9%7%19%30$0@@%15%14@$0@@|@"])
  fun op PRIME_FACTOR x = x
    val op PRIME_FACTOR =
    DT(((("euclid",20),
        [("arithmetic",[10,114]),
         ("bool",
         [13,14,25,26,27,29,42,46,47,50,51,52,53,55,57,62,70,71,74,77,79,
          83,92,93,95,145]),("euclid",[1,4,5,11,15,18]),
         ("sat",[1,3,5,6,7,11,12,13,14,15,17,18,19,20,23])]),["DISK_THM"]),
       [read"%9%6%19%31%18$0@%25%22%27@@@@@%21%7%13%30$0@@%29$0@$1@@|@@|@"])
  fun op PRIME_INFINITE x = x
    val op PRIME_INFINITE =
    DT(((("euclid",21),
        [("arithmetic",[25,41,46,59,73,83,95,159,174,175,179,180,182]),
         ("bool",
         [25,26,35,42,46,47,51,52,53,57,62,70,71,77,92,93,95,103,104,106,
          145]),("euclid",[3,8,14,17,19,20]),("numeral",[3,8]),
         ("sat",[1,3,5,6,7,11,12,13,14,15,17,18,19,20,23])]),["DISK_THM"]),
       [read"%9%6%21%7%13%30$0@@%20$0@$1@@|@|@"])
  end
  val _ = DB.bindl "euclid"
  [("divides_def",divides_def,DB.Def), ("prime_def",prime_def,DB.Def),
   ("lemma",lemma,DB.Thm), ("DIVIDES_0",DIVIDES_0,DB.Thm),
   ("DIVIDES_ZERO",DIVIDES_ZERO,DB.Thm),
   ("DIVIDES_ONE",DIVIDES_ONE,DB.Thm),
   ("DIVIDES_REFL",DIVIDES_REFL,DB.Thm),
   ("DIVIDES_TRANS",DIVIDES_TRANS,DB.Thm),
   ("DIVIDES_ADD",DIVIDES_ADD,DB.Thm), ("DIVIDES_SUB",DIVIDES_SUB,DB.Thm),
   ("DIVIDES_ADDL",DIVIDES_ADDL,DB.Thm),
   ("DIVIDES_LMUL",DIVIDES_LMUL,DB.Thm),
   ("DIVIDES_RMUL",DIVIDES_RMUL,DB.Thm), ("DIVIDES_LE",DIVIDES_LE,DB.Thm),
   ("DIVIDES_FACT",DIVIDES_FACT,DB.Thm),
   ("NOT_PRIME_0",NOT_PRIME_0,DB.Thm), ("NOT_PRIME_1",NOT_PRIME_1,DB.Thm),
   ("PRIME_2",PRIME_2,DB.Thm), ("PRIME_POS",PRIME_POS,DB.Thm),
   ("PRIME_FACTOR",PRIME_FACTOR,DB.Thm),
   ("PRIME_INFINITE",PRIME_INFINITE,DB.Thm)]

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
       ("divides", (Term.prim_mk_const { Name = "divides", Thy = "euclid"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("divides", (Term.prim_mk_const { Name = "divides", Thy = "euclid"}))
  val _ = update_grms
       (UTOFF (temp_set_fixity "divides"))
       (Infix(HOLgrammars.RIGHT, 451))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("prime", (Term.prim_mk_const { Name = "prime", Thy = "euclid"}))
  val _ = update_grms
       (UTOFF temp_overload_on)
       ("prime", (Term.prim_mk_const { Name = "prime", Thy = "euclid"}))
  val euclid_grammars = Parse.current_lgrms()
  end
  val _ = Theory.LoadableThyData.temp_encoded_update {
    thy = "euclid",
    thydataty = "compute",
    data = "euclid.divides_def euclid.prime_def"
  }

val _ = if !Globals.print_thy_loads then print "done\n" else ()
val _ = Theory.load_complete "euclid"
end
