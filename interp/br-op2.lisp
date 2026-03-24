
; )package "BOOT"

(IN-PACKAGE "BOOT")

; htSayConstructor(key, u) ==
;   u is ['CATEGORY,kind,:r] =>
;     htSayList(['"a ", kind, '" "])
;     htSayExplicitExports(r)
;   key = 'is =>
;     htSay '"the domain "
;     bcConform(u,true)
;   htSay
;     key = 'is => '"the domain "
;     kind := get_database(opOf(u), 'CONSTRUCTORKIND)
;     kind = 'domain => '"an element of "
;     '"a domain of "
;   u is ['Join,:middle,r] =>
;     rest middle =>
;       htSay '"categories "
;       bcConform(first middle,true)
;       for x in rest middle repeat
;         htSay '", "
;         bcConform(x,true)
;       r is ['CATEGORY,.,:r] =>
;         htSay '" and "
;         htSayExplicitExports(r)
;       htSay '" and "
;       bcConform(r,true)
;     htSay '"category "
;     bcConform(first middle,true)
;     r is ['CATEGORY,.,:r] =>
;      htSay '" "
;      htSayExplicitExports(r)
;     htSay '" and "
;     bcConform(r,true)
;   htSayList([kind, '" "])
;   bcConform(u, true)

(DEFUN |htSayConstructor| (|key| |u|)
  (PROG (|ISTMP#1| |kind| |r| |ISTMP#2| |middle|)
    (RETURN
     (COND
      ((AND (CONSP |u|) (EQ (CAR |u|) 'CATEGORY)
            (PROGN
             (SETQ |ISTMP#1| (CDR |u|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |kind| (CAR |ISTMP#1|))
                   (SETQ |r| (CDR |ISTMP#1|))
                   #1='T))))
       (PROGN
        (|htSayList| (LIST "a " |kind| " "))
        (|htSayExplicitExports| |r|)))
      ((EQ |key| '|is|) (PROGN (|htSay| "the domain ") (|bcConform| |u| T)))
      (#1#
       (PROGN
        (|htSay|
         (COND ((EQ |key| '|is|) "the domain ")
               (#1#
                (PROGN
                 (SETQ |kind| (|get_database| (|opOf| |u|) 'CONSTRUCTORKIND))
                 (COND ((EQ |kind| '|domain|) "an element of ")
                       (#1# "a domain of "))))))
        (COND
         ((AND (CONSP |u|) (EQ (CAR |u|) '|Join|)
               (PROGN
                (SETQ |ISTMP#1| (CDR |u|))
                (AND (CONSP |ISTMP#1|)
                     (PROGN (SETQ |ISTMP#2| (REVERSE |ISTMP#1|)) #1#)
                     (CONSP |ISTMP#2|)
                     (PROGN
                      (SETQ |r| (CAR |ISTMP#2|))
                      (SETQ |middle| (CDR |ISTMP#2|))
                      #1#)
                     (PROGN (SETQ |middle| (NREVERSE |middle|)) #1#))))
          (COND
           ((CDR |middle|)
            (PROGN
             (|htSay| "categories ")
             (|bcConform| (CAR |middle|) T)
             ((LAMBDA (|bfVar#1| |x|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#1|) (PROGN (SETQ |x| (CAR |bfVar#1|)) NIL))
                   (RETURN NIL))
                  (#1# (PROGN (|htSay| ", ") (|bcConform| |x| T))))
                 (SETQ |bfVar#1| (CDR |bfVar#1|))))
              (CDR |middle|) NIL)
             (COND
              ((AND (CONSP |r|) (EQ (CAR |r|) 'CATEGORY)
                    (PROGN
                     (SETQ |ISTMP#1| (CDR |r|))
                     (AND (CONSP |ISTMP#1|)
                          (PROGN (SETQ |r| (CDR |ISTMP#1|)) #1#))))
               (PROGN (|htSay| " and ") (|htSayExplicitExports| |r|)))
              (#1# (PROGN (|htSay| " and ") (|bcConform| |r| T))))))
           (#1#
            (PROGN
             (|htSay| "category ")
             (|bcConform| (CAR |middle|) T)
             (COND
              ((AND (CONSP |r|) (EQ (CAR |r|) 'CATEGORY)
                    (PROGN
                     (SETQ |ISTMP#1| (CDR |r|))
                     (AND (CONSP |ISTMP#1|)
                          (PROGN (SETQ |r| (CDR |ISTMP#1|)) #1#))))
               (PROGN (|htSay| " ") (|htSayExplicitExports| |r|)))
              (#1# (PROGN (|htSay| " and ") (|bcConform| |r| T))))))))
         (#1#
          (PROGN (|htSayList| (LIST |kind| " ")) (|bcConform| |u| T))))))))))

; htSayExplicitExports r ==
;   htSay '"with explicit exports"
;   $displayReturnValue => nil
;   htSay '":"
;   for x in r repeat
;     htSay '"\newline "
;     x is ['SIGNATURE,op,sig] =>
;       ops := escapeSpecialChars STRINGIMAGE op
;       htMakePage [['bcLinks,[ops,'"",'oPage,ops]]]
;       htSay '": "
;       bcConform ['Mapping,:sig]
;     x is ['ATTRIBUTE, a] => BREAK()
;     x is ['IF,:.] =>
;       htSay('"{\em if ...}")
;     systemError()

(DEFUN |htSayExplicitExports| (|r|)
  (PROG (|ISTMP#1| |op| |ISTMP#2| |sig| |ops| |a|)
    (RETURN
     (PROGN
      (|htSay| "with explicit exports")
      (COND (|$displayReturnValue| NIL)
            (#1='T
             (PROGN
              (|htSay| ":")
              ((LAMBDA (|bfVar#2| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#2|)
                        (PROGN (SETQ |x| (CAR |bfVar#2|)) NIL))
                    (RETURN NIL))
                   (#1#
                    (PROGN
                     (|htSay| "\\newline ")
                     (COND
                      ((AND (CONSP |x|) (EQ (CAR |x|) 'SIGNATURE)
                            (PROGN
                             (SETQ |ISTMP#1| (CDR |x|))
                             (AND (CONSP |ISTMP#1|)
                                  (PROGN
                                   (SETQ |op| (CAR |ISTMP#1|))
                                   (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                   (AND (CONSP |ISTMP#2|)
                                        (EQ (CDR |ISTMP#2|) NIL)
                                        (PROGN
                                         (SETQ |sig| (CAR |ISTMP#2|))
                                         #1#))))))
                       (PROGN
                        (SETQ |ops| (|escapeSpecialChars| (STRINGIMAGE |op|)))
                        (|htMakePage|
                         (LIST
                          (LIST '|bcLinks| (LIST |ops| "" '|oPage| |ops|))))
                        (|htSay| ": ")
                        (|bcConform| (CONS '|Mapping| |sig|))))
                      ((AND (CONSP |x|) (EQ (CAR |x|) 'ATTRIBUTE)
                            (PROGN
                             (SETQ |ISTMP#1| (CDR |x|))
                             (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                                  (PROGN (SETQ |a| (CAR |ISTMP#1|)) #1#))))
                       (BREAK))
                      ((AND (CONSP |x|) (EQ (CAR |x|) 'IF))
                       (|htSay| "{\\em if ...}"))
                      (#1# (|systemError|))))))
                  (SETQ |bfVar#2| (CDR |bfVar#2|))))
               |r| NIL))))))))

; displayBreakIntoAnds pred ==
;   pred is [op,:u] and member(op,'(and AND)) => u
;   [pred]

(DEFUN |displayBreakIntoAnds| (|pred|)
  (PROG (|op| |u|)
    (RETURN
     (COND
      ((AND (CONSP |pred|)
            (PROGN (SETQ |op| (CAR |pred|)) (SETQ |u| (CDR |pred|)) #1='T)
            (|member| |op| '(|and| AND)))
       |u|)
      (#1# (LIST |pred|))))))

; htSayValue t ==
;   t is ['Mapping,target,:source] =>
;       htSay('"a function from ")
;       htSayTuple source
;       htSay '" to "
;       htSayArgument target
;   t = '(Category) => htSay('"a category")
;   t is [op,:.] and MEMQ(op,'(Join CATEGORY)) or constructor? opOf t =>
;     htSayConstructor(nil,t)
;   htSay('"an element of domain ")
;   htSayArgument t                            --continue for operations

(DEFUN |htSayValue| (|t|)
  (PROG (|ISTMP#1| |target| |source| |op|)
    (RETURN
     (COND
      ((AND (CONSP |t|) (EQ (CAR |t|) '|Mapping|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |t|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN
                   (SETQ |target| (CAR |ISTMP#1|))
                   (SETQ |source| (CDR |ISTMP#1|))
                   #1='T))))
       (PROGN
        (|htSay| "a function from ")
        (|htSayTuple| |source|)
        (|htSay| " to ")
        (|htSayArgument| |target|)))
      ((EQUAL |t| '(|Category|)) (|htSay| "a category"))
      ((OR
        (AND (CONSP |t|) (PROGN (SETQ |op| (CAR |t|)) #1#)
             (MEMQ |op| '(|Join| CATEGORY)))
        (|constructor?| (|opOf| |t|)))
       (|htSayConstructor| NIL |t|))
      (#1# (PROGN (|htSay| "an element of domain ") (|htSayArgument| |t|)))))))

; htSayArgument t == --called only for operations not for constructors
;   null $signature => htSay ['"{\em ",t,'"}"]
;   MEMQ(t, '(_%)) =>
;     $conkind = '"category" and $conlength > 20 =>
;       $generalSearch? => htSay '"{\em D} of the origin category"
;       addWhereList("%", 'is, nil)
;       htSayStandard '"{\em %}"
;     htSayStandard '"{\em %}"
;   not IDENTP t => bcConform(t,true)
;   k := position(t,$conargs)
;   if k > -1 then
;     typeOfArg := (rest $signature).k
;     addWhereList(t,'member,typeOfArg)
;   htSayList(['"{\em ", t, '"}"])

(DEFUN |htSayArgument| (|t|)
  (PROG (|k| |typeOfArg|)
    (RETURN
     (COND ((NULL |$signature|) (|htSay| (LIST "{\\em " |t| "}")))
           ((MEMQ |t| '(%))
            (COND
             ((AND (EQUAL |$conkind| "category") (< 20 |$conlength|))
              (COND
               (|$generalSearch?| (|htSay| "{\\em D} of the origin category"))
               (#1='T
                (PROGN
                 (|addWhereList| '% '|is| NIL)
                 (|htSayStandard| "{\\em %}")))))
             (#1# (|htSayStandard| "{\\em %}"))))
           ((NULL (IDENTP |t|)) (|bcConform| |t| T))
           (#1#
            (PROGN
             (SETQ |k| (|position| |t| |$conargs|))
             (COND
              ((< (- 1) |k|) (SETQ |typeOfArg| (ELT (CDR |$signature|) |k|))
               (|addWhereList| |t| '|member| |typeOfArg|)))
             (|htSayList| (LIST "{\\em " |t| "}"))))))))

; addWhereList(id,kind,typ) ==
;   $whereList := insert([id,kind,:typ],$whereList)

(DEFUN |addWhereList| (|id| |kind| |typ|)
  (PROG ()
    (RETURN
     (SETQ |$whereList|
             (|insert| (CONS |id| (CONS |kind| |typ|)) |$whereList|)))))

; htSayTuple t ==
;   null t => htSay '"()"
;   null rest t => htSayArgument first t
;   htSay '"("
;   htSayArgument first t
;   for d in rest t repeat
;     htSay '","
;     htSayArgument d
;   htSay '")"

(DEFUN |htSayTuple| (|t|)
  (PROG ()
    (RETURN
     (COND ((NULL |t|) (|htSay| "()"))
           ((NULL (CDR |t|)) (|htSayArgument| (CAR |t|)))
           (#1='T
            (PROGN
             (|htSay| "(")
             (|htSayArgument| (CAR |t|))
             ((LAMBDA (|bfVar#3| |d|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#3|) (PROGN (SETQ |d| (CAR |bfVar#3|)) NIL))
                   (RETURN NIL))
                  (#1# (PROGN (|htSay| ",") (|htSayArgument| |d|))))
                 (SETQ |bfVar#3| (CDR |bfVar#3|))))
              (CDR |t|) NIL)
             (|htSay| ")")))))))

; dbGetDisplayFormForOp(op,sig,doc) ==
;   dbGetFormFromDocumentation(op,sig,doc) or dbGetContrivedForm(op,sig)

(DEFUN |dbGetDisplayFormForOp| (|op| |sig| |doc|)
  (PROG ()
    (RETURN
     (OR (|dbGetFormFromDocumentation| |op| |sig| |doc|)
         (|dbGetContrivedForm| |op| |sig|)))))

; dbGetFormFromDocumentation(op,sig,x) ==
;   $ncMsgList : local := nil
;   $newcompErrorCount : local := 0
;   doc := (STRINGP x => x; first x)
;   STRINGP doc and
;      (stringPrefix?('"\spad{",doc) and (k := 6) or
;        stringPrefix?('"\s{",doc) and (k := 3)) =>
;     n := charPosition($charRbrace,doc,k)
;     s := SUBSTRING(doc,k,n - k)
;     parse := ncParseFromString s
;     parse is [=op,:.] and #parse = #sig => parse
;   nil

(DEFUN |dbGetFormFromDocumentation| (|op| |sig| |x|)
  (PROG (|$newcompErrorCount| |$ncMsgList| |parse| |s| |n| |k| |doc|)
    (DECLARE (SPECIAL |$newcompErrorCount| |$ncMsgList|))
    (RETURN
     (PROGN
      (SETQ |$ncMsgList| NIL)
      (SETQ |$newcompErrorCount| 0)
      (SETQ |doc| (COND ((STRINGP |x|) |x|) (#1='T (CAR |x|))))
      (COND
       ((AND (STRINGP |doc|)
             (OR (AND (|stringPrefix?| "\\spad{" |doc|) (SETQ |k| 6))
                 (AND (|stringPrefix?| "\\s{" |doc|) (SETQ |k| 3))))
        (PROGN
         (SETQ |n| (|charPosition| |$charRbrace| |doc| |k|))
         (SETQ |s| (SUBSTRING |doc| |k| (- |n| |k|)))
         (SETQ |parse| (|ncParseFromString| |s|))
         (COND
          ((AND (CONSP |parse|) (EQUAL (CAR |parse|) |op|)
                (EQL (LENGTH |parse|) (LENGTH |sig|)))
           |parse|))))
       (#1# NIL))))))

; dbMakeContrivedForm(op, sig) ==
;   $chooseDownCaseOfType : local := false
;   $NumberList : local := '(i j k l m n i1 j1 k1 l1 m1 n1 i2 j2 k2 l2 m2 n2 i3 j3 k3 l3 m3 n3 i4 j4 k4 l4 m4 n4 )
;   $ElementList: local := '(x y z u v w x1 y1 z1 u1 v1 w1 x2 y2 z2 u2 v2 w2 x3 y3 z3 u3 v3 w3 x4 y4 z4 u4 v4 w4 )
;   $FunctionList:local := '(f g h d e F G H)
;   $DomainList:  local := '(R S D E T A B C M N P Q U V W)
;   dbGetContrivedForm(op,sig)

(DEFUN |dbMakeContrivedForm| (|op| |sig|)
  (PROG (|$DomainList| |$FunctionList| |$ElementList| |$NumberList|
         |$chooseDownCaseOfType|)
    (DECLARE
     (SPECIAL |$DomainList| |$FunctionList| |$ElementList| |$NumberList|
      |$chooseDownCaseOfType|))
    (RETURN
     (PROGN
      (SETQ |$chooseDownCaseOfType| NIL)
      (SETQ |$NumberList|
              '(|i| |j| |k| |l| |m| |n| |i1| |j1| |k1| |l1| |m1| |n1| |i2| |j2|
                |k2| |l2| |m2| |n2| |i3| |j3| |k3| |l3| |m3| |n3| |i4| |j4|
                |k4| |l4| |m4| |n4|))
      (SETQ |$ElementList|
              '(|x| |y| |z| |u| |v| |w| |x1| |y1| |z1| |u1| |v1| |w1| |x2| |y2|
                |z2| |u2| |v2| |w2| |x3| |y3| |z3| |u3| |v3| |w3| |x4| |y4|
                |z4| |u4| |v4| |w4|))
      (SETQ |$FunctionList| '(|f| |g| |h| |d| |e| F G H))
      (SETQ |$DomainList| '(R S D E T A B C M N P Q U V W))
      (|dbGetContrivedForm| |op| |sig|)))))

; dbGetContrivedForm(op,sig) ==
;   op = '"0" => [0]
;   op = '"1" => [1]
;   [op,:[dbChooseOperandName s for s in rest sig]]

(DEFUN |dbGetContrivedForm| (|op| |sig|)
  (PROG ()
    (RETURN
     (COND ((EQUAL |op| "0") (LIST 0)) ((EQUAL |op| "1") (LIST 1))
           (#1='T
            (CONS |op|
                  ((LAMBDA (|bfVar#5| |bfVar#4| |s|)
                     (LOOP
                      (COND
                       ((OR (ATOM |bfVar#4|)
                            (PROGN (SETQ |s| (CAR |bfVar#4|)) NIL))
                        (RETURN (NREVERSE |bfVar#5|)))
                       (#1#
                        (SETQ |bfVar#5|
                                (CONS (|dbChooseOperandName| |s|) |bfVar#5|))))
                      (SETQ |bfVar#4| (CDR |bfVar#4|))))
                   NIL (CDR |sig|) NIL)))))))

; dbChooseOperandName(typ) ==
;   typ is ['Mapping,:.] =>
;     x := first $FunctionList
;     $FunctionList := rest $FunctionList
;     x
;   name := opOf typ
;   kind :=
;         name = "%" => 'domain
;         get_database(name, 'CONSTRUCTORKIND)
;   s := PNAME opOf typ
;   kind ~= 'category =>
;     anySubstring?('"Integer",s,0) or anySubstring?('"Number",s,0) =>
;       x := first $NumberList
;       $NumberList := rest $NumberList
;       x
;     x :=
;       $chooseDownCaseOfType =>
;         y := DOWNCASE typ
;         x :=
;           member(y,$ElementList) => y
;           first $ElementList
;       first $ElementList
;     $ElementList := delete(x,$ElementList)
;     x
;   x := first $DomainList
;   $DomainList := rest $DomainList
;   x

(DEFUN |dbChooseOperandName| (|typ|)
  (PROG (|x| |name| |kind| |s| |y|)
    (RETURN
     (COND
      ((AND (CONSP |typ|) (EQ (CAR |typ|) '|Mapping|))
       (PROGN
        (SETQ |x| (CAR |$FunctionList|))
        (SETQ |$FunctionList| (CDR |$FunctionList|))
        |x|))
      (#1='T
       (PROGN
        (SETQ |name| (|opOf| |typ|))
        (SETQ |kind|
                (COND ((EQ |name| '%) '|domain|)
                      (#1# (|get_database| |name| 'CONSTRUCTORKIND))))
        (SETQ |s| (PNAME (|opOf| |typ|)))
        (COND
         ((NOT (EQ |kind| '|category|))
          (COND
           ((OR (|anySubstring?| "Integer" |s| 0)
                (|anySubstring?| "Number" |s| 0))
            (PROGN
             (SETQ |x| (CAR |$NumberList|))
             (SETQ |$NumberList| (CDR |$NumberList|))
             |x|))
           (#1#
            (PROGN
             (SETQ |x|
                     (COND
                      (|$chooseDownCaseOfType|
                       (PROGN
                        (SETQ |y| (DOWNCASE |typ|))
                        (SETQ |x|
                                (COND ((|member| |y| |$ElementList|) |y|)
                                      (#1# (CAR |$ElementList|))))))
                      (#1# (CAR |$ElementList|))))
             (SETQ |$ElementList| (|delete| |x| |$ElementList|))
             |x|))))
         (#1#
          (PROGN
           (SETQ |x| (CAR |$DomainList|))
           (SETQ |$DomainList| (CDR |$DomainList|))
           |x|)))))))))

; getSubstSigIfPossible sig ==
;   getSubstSignature sig or sig

(DEFUN |getSubstSigIfPossible| (|sig|)
  (PROG () (RETURN (OR (|getSubstSignature| |sig|) |sig|))))

; fullSubstitute(x,y,z) ==  --substitutes deeply: x for y in list z
;   z = y => x
;   atom z => z
;   [fullSubstitute(x,y,u) for u in z]

(DEFUN |fullSubstitute| (|x| |y| |z|)
  (PROG ()
    (RETURN
     (COND ((EQUAL |z| |y|) |x|) ((ATOM |z|) |z|)
           (#1='T
            ((LAMBDA (|bfVar#7| |bfVar#6| |u|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#6|) (PROGN (SETQ |u| (CAR |bfVar#6|)) NIL))
                  (RETURN (NREVERSE |bfVar#7|)))
                 (#1#
                  (SETQ |bfVar#7|
                          (CONS (|fullSubstitute| |x| |y| |u|) |bfVar#7|))))
                (SETQ |bfVar#6| (CDR |bfVar#6|))))
             NIL |z| NIL))))))

; getSubstCandidates sig ==
;   candidates := nil
;   for x in sig for i in 1.. | x is [.,.,:.] repeat
;     getSubstQualify(x,i,sig) => candidates := getSubstInsert(x,candidates)
;     y := or/[getSubstQualify(y,i,sig) for y in rest x | y is [.,.,:.]] =>
;       candidates := insert(y,candidates)
;   candidates

(DEFUN |getSubstCandidates| (|sig|)
  (PROG (|candidates| |ISTMP#1| DOT |y|)
    (RETURN
     (PROGN
      (SETQ |candidates| NIL)
      ((LAMBDA (|bfVar#8| |x| |i|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#8|) (PROGN (SETQ |x| (CAR |bfVar#8|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |x|)
                 (PROGN
                  (SETQ |ISTMP#1| (CDR |x|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN (SETQ DOT (CDR |ISTMP#1|)) #1#)))
                 (COND
                  ((|getSubstQualify| |x| |i| |sig|)
                   (SETQ |candidates| (|getSubstInsert| |x| |candidates|)))
                  ((SETQ |y|
                           ((LAMBDA (|bfVar#10| |bfVar#9| |y|)
                              (LOOP
                               (COND
                                ((OR (ATOM |bfVar#9|)
                                     (PROGN (SETQ |y| (CAR |bfVar#9|)) NIL))
                                 (RETURN |bfVar#10|))
                                (#1#
                                 (AND (CONSP |y|)
                                      (PROGN
                                       (SETQ |ISTMP#1| (CDR |y|))
                                       (AND (CONSP |ISTMP#1|)
                                            (PROGN
                                             (SETQ DOT (CDR |ISTMP#1|))
                                             #1#)))
                                      (PROGN
                                       (SETQ |bfVar#10|
                                               (|getSubstQualify| |y| |i|
                                                |sig|))
                                       (COND
                                        (|bfVar#10| (RETURN |bfVar#10|)))))))
                               (SETQ |bfVar#9| (CDR |bfVar#9|))))
                            NIL (CDR |x|) NIL))
                   (SETQ |candidates| (|insert| |y| |candidates|)))))))
          (SETQ |bfVar#8| (CDR |bfVar#8|))
          (SETQ |i| (+ |i| 1))))
       |sig| NIL 1)
      |candidates|))))

; getSubstSignature sig ==
;     candidates := getSubstCandidates sig
;     null candidates => nil
;     D := first $DomainList
;     $DomainList := rest $DomainList
;     winner := first candidates
;     newsig := fullSubstitute(D,winner,sig)
;     sig :=
;       null rest candidates => newsig
;       count := NUMOFNODES newsig
;       for x in rest candidates repeat
;         trial := fullSubstitute(D,x,sig)
;         trialCount := NUMOFNODES trial
;         trialCount < count =>
;           newsig := trial
;           count  := trialCount
;           winner := x
;       newsig
;     addWhereList(D,'is,winner)
;     newsig

(DEFUN |getSubstSignature| (|sig|)
  (PROG (|candidates| D |winner| |newsig| |count| |trial| |trialCount|)
    (RETURN
     (PROGN
      (SETQ |candidates| (|getSubstCandidates| |sig|))
      (COND ((NULL |candidates|) NIL)
            (#1='T
             (PROGN
              (SETQ D (CAR |$DomainList|))
              (SETQ |$DomainList| (CDR |$DomainList|))
              (SETQ |winner| (CAR |candidates|))
              (SETQ |newsig| (|fullSubstitute| D |winner| |sig|))
              (SETQ |sig|
                      (COND ((NULL (CDR |candidates|)) |newsig|)
                            (#1#
                             (PROGN
                              (SETQ |count| (NUMOFNODES |newsig|))
                              ((LAMBDA (|bfVar#11| |x|)
                                 (LOOP
                                  (COND
                                   ((OR (ATOM |bfVar#11|)
                                        (PROGN
                                         (SETQ |x| (CAR |bfVar#11|))
                                         NIL))
                                    (RETURN NIL))
                                   (#1#
                                    (PROGN
                                     (SETQ |trial|
                                             (|fullSubstitute| D |x| |sig|))
                                     (SETQ |trialCount| (NUMOFNODES |trial|))
                                     (COND
                                      ((< |trialCount| |count|)
                                       (PROGN
                                        (SETQ |newsig| |trial|)
                                        (SETQ |count| |trialCount|)
                                        (SETQ |winner| |x|)))))))
                                  (SETQ |bfVar#11| (CDR |bfVar#11|))))
                               (CDR |candidates|) NIL)
                              |newsig|))))
              (|addWhereList| D '|is| |winner|)
              |newsig|)))))))

; getSubstQualify(x,i,sig) ==
;     or/[CONTAINED(x,y) for y in sig for j in 1.. | j ~= i] => x
;     false

(DEFUN |getSubstQualify| (|x| |i| |sig|)
  (PROG ()
    (RETURN
     (COND
      (((LAMBDA (|bfVar#13| |bfVar#12| |y| |j|)
          (LOOP
           (COND
            ((OR (ATOM |bfVar#12|) (PROGN (SETQ |y| (CAR |bfVar#12|)) NIL))
             (RETURN |bfVar#13|))
            (#1='T
             (AND (NOT (EQUAL |j| |i|))
                  (PROGN
                   (SETQ |bfVar#13| (CONTAINED |x| |y|))
                   (COND (|bfVar#13| (RETURN |bfVar#13|)))))))
           (SETQ |bfVar#12| (CDR |bfVar#12|))
           (SETQ |j| (+ |j| 1))))
        NIL |sig| NIL 1)
       |x|)
      (#1# NIL)))))

; getSubstInsert(x,candidates) ==
;     return insert(x,candidates)
;     null candidates => [x]
;     or/[CONTAINED(x,y) for y in candidates] => candidates
;     y := or/[CONTAINED(y, x) for y in candidates] =>
;         substitute(x, y, candidates)
;     candidates

(DEFUN |getSubstInsert| (|x| |candidates|)
  (PROG (|y|)
    (RETURN
     (PROGN
      (RETURN (|insert| |x| |candidates|))
      (COND ((NULL |candidates|) (LIST |x|))
            (((LAMBDA (|bfVar#15| |bfVar#14| |y|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#14|)
                       (PROGN (SETQ |y| (CAR |bfVar#14|)) NIL))
                   (RETURN |bfVar#15|))
                  (#1='T
                   (PROGN
                    (SETQ |bfVar#15| (CONTAINED |x| |y|))
                    (COND (|bfVar#15| (RETURN |bfVar#15|))))))
                 (SETQ |bfVar#14| (CDR |bfVar#14|))))
              NIL |candidates| NIL)
             |candidates|)
            ((SETQ |y|
                     ((LAMBDA (|bfVar#17| |bfVar#16| |y|)
                        (LOOP
                         (COND
                          ((OR (ATOM |bfVar#16|)
                               (PROGN (SETQ |y| (CAR |bfVar#16|)) NIL))
                           (RETURN |bfVar#17|))
                          (#1#
                           (PROGN
                            (SETQ |bfVar#17| (CONTAINED |y| |x|))
                            (COND (|bfVar#17| (RETURN |bfVar#17|))))))
                         (SETQ |bfVar#16| (CDR |bfVar#16|))))
                      NIL |candidates| NIL))
             (|substitute| |x| |y| |candidates|))
            (#1# |candidates|))))))

; try_eval(pred, ancestors) ==
;     pred is [op, :args] =>
;         op = "OR" =>
;             nargs := [v for arg in args | (v := try_eval(arg, ancestors))]
;             NULL(nargs) => false
;             member('T, nargs) => 'T
;             #nargs = 1 => first(nargs)
;             [op, :nargs]
;         op = "AND" =>
;             nargs := [v for arg in args |
;                       not((v := try_eval(arg, ancestors)) = 'T)]
;             NULL(nargs) => 'T
;             member(false, nargs) => false
;             #nargs = 1 => first(nargs)
;             [op, :nargs]
;         op = "has" and args is [="%", cat] =>
;             av := assoc(cat, ancestors)
;             NULL(av) => false
;             av is [cat, :'T] => 'T
;             pred
;         pred
;     pred

(DEFUN |try_eval| (|pred| |ancestors|)
  (PROG (|op| |args| |v| |nargs| |ISTMP#1| |cat| |av|)
    (RETURN
     (COND
      ((AND (CONSP |pred|)
            (PROGN (SETQ |op| (CAR |pred|)) (SETQ |args| (CDR |pred|)) #1='T))
       (COND
        ((EQ |op| 'OR)
         (PROGN
          (SETQ |nargs|
                  ((LAMBDA (|bfVar#19| |bfVar#18| |arg|)
                     (LOOP
                      (COND
                       ((OR (ATOM |bfVar#18|)
                            (PROGN (SETQ |arg| (CAR |bfVar#18|)) NIL))
                        (RETURN (NREVERSE |bfVar#19|)))
                       (#1#
                        (AND (SETQ |v| (|try_eval| |arg| |ancestors|))
                             (SETQ |bfVar#19| (CONS |v| |bfVar#19|)))))
                      (SETQ |bfVar#18| (CDR |bfVar#18|))))
                   NIL |args| NIL))
          (COND ((NULL |nargs|) NIL) ((|member| 'T |nargs|) 'T)
                ((EQL (LENGTH |nargs|) 1) (CAR |nargs|))
                (#1# (CONS |op| |nargs|)))))
        ((EQ |op| 'AND)
         (PROGN
          (SETQ |nargs|
                  ((LAMBDA (|bfVar#21| |bfVar#20| |arg|)
                     (LOOP
                      (COND
                       ((OR (ATOM |bfVar#20|)
                            (PROGN (SETQ |arg| (CAR |bfVar#20|)) NIL))
                        (RETURN (NREVERSE |bfVar#21|)))
                       (#1#
                        (AND
                         (NULL
                          (EQ (SETQ |v| (|try_eval| |arg| |ancestors|)) 'T))
                         (SETQ |bfVar#21| (CONS |v| |bfVar#21|)))))
                      (SETQ |bfVar#20| (CDR |bfVar#20|))))
                   NIL |args| NIL))
          (COND ((NULL |nargs|) 'T) ((|member| NIL |nargs|) NIL)
                ((EQL (LENGTH |nargs|) 1) (CAR |nargs|))
                (#1# (CONS |op| |nargs|)))))
        ((AND (EQ |op| '|has|) (CONSP |args|) (EQUAL (CAR |args|) '%)
              (PROGN
               (SETQ |ISTMP#1| (CDR |args|))
               (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                    (PROGN (SETQ |cat| (CAR |ISTMP#1|)) #1#))))
         (PROGN
          (SETQ |av| (|assoc| |cat| |ancestors|))
          (COND ((NULL |av|) NIL)
                ((AND (CONSP |av|) (PROGN (SETQ |cat| (CAR |av|)) #1#)
                      (EQ (CDR |av|) 'T))
                 'T)
                (#1# |pred|))))
        (#1# |pred|)))
      (#1# |pred|)))))

; simp_pred(pred, ancestors) ==
;     npred := simpHasPred(pred)
;     NULL(ancestors) => npred
;     NULL(npred) => npred
;     npred = 'T => npred
;     try_eval(npred, ancestors)

(DEFUN |simp_pred| (|pred| |ancestors|)
  (PROG (|npred|)
    (RETURN
     (PROGN
      (SETQ |npred| (|simpHasPred| |pred|))
      (COND ((NULL |ancestors|) |npred|) ((NULL |npred|) |npred|)
            ((EQ |npred| 'T) |npred|) ('T (|try_eval| |npred| |ancestors|)))))))

; koOps(conform, domname) ==
;     conform0 := conform
;     conform := domname or conform
;     [conname,:args] := conform
;     kind := get_database(conname, 'CONSTRUCTORKIND)
;     ancestors :=
;         kind = "domain" or kind = "package" =>
;             ancestorsOf(conform0, domname)
;         []
;     res := koCatOps(conform, domname, ancestors)
;     listSort(function GLESSEQP, res)

(DEFUN |koOps| (|conform| |domname|)
  (PROG (|conform0| |conname| |args| |kind| |ancestors| |res|)
    (RETURN
     (PROGN
      (SETQ |conform0| |conform|)
      (SETQ |conform| (OR |domname| |conform|))
      (SETQ |conname| (CAR |conform|))
      (SETQ |args| (CDR |conform|))
      (SETQ |kind| (|get_database| |conname| 'CONSTRUCTORKIND))
      (SETQ |ancestors|
              (COND
               ((OR (EQ |kind| '|domain|) (EQ |kind| '|package|))
                (|ancestorsOf| |conform0| |domname|))
               ('T NIL)))
      (SETQ |res| (|koCatOps| |conform| |domname| |ancestors|))
      (|listSort| #'GLESSEQP |res|)))))

; zeroOneConvert x ==
;   x = 'Zero => 0
;   x = 'One  => 1
;   x

(DEFUN |zeroOneConvert| (|x|)
  (PROG () (RETURN (COND ((EQ |x| '|Zero|) 0) ((EQ |x| '|One|) 1) ('T |x|)))))

; kFormatSlotDomain1(x, infovec) ==
;               fn formatSlotDomain1(x, infovec) where fn x ==
;   atom x => x
;   (op := first x) = '_% => '_%
;   op = 'local => CADR x
;   op = ":" => [":",CADR x,fn CADDR x]
;   MEMQ(op,$Primitives) or constructor? op =>
;     [fn y for y in x]
;   INTEGERP op => op
;   op = 'QUOTE and atom CADR x => CADR x
;   x

(DEFUN |kFormatSlotDomain1| (|x| |infovec|)
  (PROG ()
    (RETURN (|kFormatSlotDomain1,fn| (|formatSlotDomain1| |x| |infovec|)))))
(DEFUN |kFormatSlotDomain1,fn| (|x|)
  (PROG (|op|)
    (RETURN
     (COND ((ATOM |x|) |x|) ((EQ (SETQ |op| (CAR |x|)) '%) '%)
           ((EQ |op| '|local|) (CADR |x|))
           ((EQ |op| '|:|)
            (LIST '|:| (CADR |x|) (|kFormatSlotDomain1,fn| (CADDR |x|))))
           ((OR (MEMQ |op| |$Primitives|) (|constructor?| |op|))
            ((LAMBDA (|bfVar#23| |bfVar#22| |y|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#22|)
                      (PROGN (SETQ |y| (CAR |bfVar#22|)) NIL))
                  (RETURN (NREVERSE |bfVar#23|)))
                 (#1='T
                  (SETQ |bfVar#23|
                          (CONS (|kFormatSlotDomain1,fn| |y|) |bfVar#23|))))
                (SETQ |bfVar#22| (CDR |bfVar#22|))))
             NIL |x| NIL))
           ((INTEGERP |op|) |op|)
           ((AND (EQ |op| 'QUOTE) (ATOM (CADR |x|))) (CADR |x|)) (#1# |x|)))))

; koCatOps(conform, domname, ancestors) ==
;   conname := opOf conform
;   oplist := REVERSE(get_database(conname, 'OPERATIONALIST))
;   oplist := sublisFormal(IFCDR domname or IFCDR conform ,oplist)
;   --check below for INTEGERP key to avoid subsumed signatures
;   [[zeroOneConvert op,:nalist] for [op,:alist] in oplist
;       | nalist := koCatOps1(alist, ancestors)]

(DEFUN |koCatOps| (|conform| |domname| |ancestors|)
  (PROG (|conname| |oplist| |op| |alist| |nalist|)
    (RETURN
     (PROGN
      (SETQ |conname| (|opOf| |conform|))
      (SETQ |oplist| (REVERSE (|get_database| |conname| 'OPERATIONALIST)))
      (SETQ |oplist|
              (|sublisFormal| (OR (IFCDR |domname|) (IFCDR |conform|))
               |oplist|))
      ((LAMBDA (|bfVar#26| |bfVar#25| |bfVar#24|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#25|)
                (PROGN (SETQ |bfVar#24| (CAR |bfVar#25|)) NIL))
            (RETURN (NREVERSE |bfVar#26|)))
           (#1='T
            (AND (CONSP |bfVar#24|)
                 (PROGN
                  (SETQ |op| (CAR |bfVar#24|))
                  (SETQ |alist| (CDR |bfVar#24|))
                  #1#)
                 (SETQ |nalist| (|koCatOps1| |alist| |ancestors|))
                 (SETQ |bfVar#26|
                         (CONS (CONS (|zeroOneConvert| |op|) |nalist|)
                               |bfVar#26|)))))
          (SETQ |bfVar#25| (CDR |bfVar#25|))))
       NIL |oplist| NIL)))))

; koCatOps1(alist, ancestors) == [x for item in alist | x := pair] where
;   pair ==
;     [sig,:r] := item
;     null r => [sig,true]
;     [key,:options] := r
;     null (pred := IFCAR options) =>
;       IFCAR IFCDR options = 'ASCONST => [sig,'ASCONST]
;       [sig,true]
;     npred := simp_pred(pred, ancestors) => [sig, npred]
;     false

(DEFUN |koCatOps1| (|alist| |ancestors|)
  (PROG (|sig| |r| |key| |options| |pred| |npred| |x|)
    (RETURN
     ((LAMBDA (|bfVar#28| |bfVar#27| |item|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#27|) (PROGN (SETQ |item| (CAR |bfVar#27|)) NIL))
           (RETURN (NREVERSE |bfVar#28|)))
          (#1='T
           (AND
            (SETQ |x|
                    (PROGN
                     (SETQ |sig| (CAR |item|))
                     (SETQ |r| (CDR |item|))
                     (COND ((NULL |r|) (LIST |sig| T))
                           (#1#
                            (PROGN
                             (SETQ |key| (CAR |r|))
                             (SETQ |options| (CDR |r|))
                             (COND
                              ((NULL (SETQ |pred| (IFCAR |options|)))
                               (COND
                                ((EQ (IFCAR (IFCDR |options|)) 'ASCONST)
                                 (LIST |sig| 'ASCONST))
                                (#1# (LIST |sig| T))))
                              ((SETQ |npred| (|simp_pred| |pred| |ancestors|))
                               (LIST |sig| |npred|))
                              (#1# NIL)))))))
            (SETQ |bfVar#28| (CONS |x| |bfVar#28|)))))
         (SETQ |bfVar#27| (CDR |bfVar#27|))))
      NIL |alist| NIL))))

; opPageFast opAlist == --called by oSearch
;   htPage := htInitPage(nil,nil)
;   htpSetProperty(htPage,'opAlist,opAlist)
;   htpSetProperty(htPage,'expandOperations,'lists)
;   dbShowOp1(htPage, opAlist, 'names)

(DEFUN |opPageFast| (|opAlist|)
  (PROG (|htPage|)
    (RETURN
     (PROGN
      (SETQ |htPage| (|htInitPage| NIL NIL))
      (|htpSetProperty| |htPage| '|opAlist| |opAlist|)
      (|htpSetProperty| |htPage| '|expandOperations| '|lists|)
      (|dbShowOp1| |htPage| |opAlist| '|names|)))))

; opPageFastPath opstring ==
; --return nil
;   x := STRINGIMAGE opstring
;   charPosition(char '_*,x,0) < #x => nil     --quit if name has * in it
;   op := (STRINGP x => INTERN x; x)
;   mmList := getAllModemapsFromDatabase(op,nil) or return nil
;   opAlist := [[op,:[item for mm in mmList]]] where item ==
;     [predList, origin, sig] := modemap2Sig(op, mm)
;     predicate := predList and MKPF(predList,'AND)
;     exposed? := isExposedConstructor opOf origin
;     [sig, predicate, origin, exposed?]
;   opAlist

(DEFUN |opPageFastPath| (|opstring|)
  (PROG (|x| |op| |mmList| |LETTMP#1| |predList| |origin| |sig| |predicate|
         |exposed?| |opAlist|)
    (RETURN
     (PROGN
      (SETQ |x| (STRINGIMAGE |opstring|))
      (COND ((< (|charPosition| (|char| '*) |x| 0) (LENGTH |x|)) NIL)
            (#1='T
             (PROGN
              (SETQ |op| (COND ((STRINGP |x|) (INTERN |x|)) (#1# |x|)))
              (SETQ |mmList|
                      (OR (|getAllModemapsFromDatabase| |op| NIL)
                          (RETURN NIL)))
              (SETQ |opAlist|
                      (LIST
                       (CONS |op|
                             ((LAMBDA (|bfVar#30| |bfVar#29| |mm|)
                                (LOOP
                                 (COND
                                  ((OR (ATOM |bfVar#29|)
                                       (PROGN
                                        (SETQ |mm| (CAR |bfVar#29|))
                                        NIL))
                                   (RETURN (NREVERSE |bfVar#30|)))
                                  (#1#
                                   (SETQ |bfVar#30|
                                           (CONS
                                            (PROGN
                                             (SETQ |LETTMP#1|
                                                     (|modemap2Sig| |op| |mm|))
                                             (SETQ |predList| (CAR |LETTMP#1|))
                                             (SETQ |origin| (CADR |LETTMP#1|))
                                             (SETQ |sig| (CADDR |LETTMP#1|))
                                             (SETQ |predicate|
                                                     (AND |predList|
                                                          (MKPF |predList|
                                                           'AND)))
                                             (SETQ |exposed?|
                                                     (|isExposedConstructor|
                                                      (|opOf| |origin|)))
                                             (LIST |sig| |predicate| |origin|
                                                   |exposed?|))
                                            |bfVar#30|))))
                                 (SETQ |bfVar#29| (CDR |bfVar#29|))))
                              NIL |mmList| NIL))))
              |opAlist|)))))))

; modemap2Sig(op,mm) ==
;   [dcSig, conds] := mm
;   [dc, :sig] := dcSig
;   partial? :=
;     conds is ['partial,:r] => conds := r
;     false
;   condlist := modemap2SigConds conds
;   [origin, vlist, flist] := getDcForm(dc, condlist) or return nil
;   subcondlist := SUBLISLIS(flist, vlist, condlist)
;   [predList,vlist, flist] := getSigSubst(subcondlist, nil, vlist, flist)
;   if partial? then
;       target := sig.0
;       ntarget := ['Union, target, '"failed"]
;       sig := substitute(ntarget, target, sig)
;   alist := findSubstitutionOrder? pairlis(vlist, flist) or systemError()
;   predList := substInOrder(alist, predList)
;   nsig := substInOrder(alist, sig)
;   if hasPatternVar nsig or hasPatternVar predList then
;     pp '"--------------"
;     pp op
;     pp predList
;     pp nsig
;     pp mm
; --pause nsig
;   [predList, origin, substitute("%", origin, nsig)]

(DEFUN |modemap2Sig| (|op| |mm|)
  (PROG (|dcSig| |conds| |dc| |sig| |r| |partial?| |condlist| |LETTMP#1|
         |origin| |vlist| |flist| |subcondlist| |predList| |target| |ntarget|
         |alist| |nsig|)
    (RETURN
     (PROGN
      (SETQ |dcSig| (CAR |mm|))
      (SETQ |conds| (CADR |mm|))
      (SETQ |dc| (CAR |dcSig|))
      (SETQ |sig| (CDR |dcSig|))
      (SETQ |partial?|
              (COND
               ((AND (CONSP |conds|) (EQ (CAR |conds|) '|partial|)
                     (PROGN (SETQ |r| (CDR |conds|)) #1='T))
                (SETQ |conds| |r|))
               (#1# NIL)))
      (SETQ |condlist| (|modemap2SigConds| |conds|))
      (SETQ |LETTMP#1| (OR (|getDcForm| |dc| |condlist|) (RETURN NIL)))
      (SETQ |origin| (CAR |LETTMP#1|))
      (SETQ |vlist| (CADR . #2=(|LETTMP#1|)))
      (SETQ |flist| (CADDR . #2#))
      (SETQ |subcondlist| (SUBLISLIS |flist| |vlist| |condlist|))
      (SETQ |LETTMP#1| (|getSigSubst| |subcondlist| NIL |vlist| |flist|))
      (SETQ |predList| (CAR |LETTMP#1|))
      (SETQ |vlist| (CADR . #3=(|LETTMP#1|)))
      (SETQ |flist| (CADDR . #3#))
      (COND
       (|partial?| (SETQ |target| (ELT |sig| 0))
        (SETQ |ntarget| (LIST '|Union| |target| "failed"))
        (SETQ |sig| (|substitute| |ntarget| |target| |sig|))))
      (SETQ |alist|
              (OR (|findSubstitutionOrder?| (|pairlis| |vlist| |flist|))
                  (|systemError|)))
      (SETQ |predList| (|substInOrder| |alist| |predList|))
      (SETQ |nsig| (|substInOrder| |alist| |sig|))
      (COND
       ((OR (|hasPatternVar| |nsig|) (|hasPatternVar| |predList|))
        (|pp| "--------------") (|pp| |op|) (|pp| |predList|) (|pp| |nsig|)
        (|pp| |mm|)))
      (LIST |predList| |origin| (|substitute| '% |origin| |nsig|))))))

; modemap2SigConds conds ==
;   conds is ['OR,:r] => modemap2SigConds first r
;   conds is ['AND,:r] => r
;   [conds]

(DEFUN |modemap2SigConds| (|conds|)
  (PROG (|r|)
    (RETURN
     (COND
      ((AND (CONSP |conds|) (EQ (CAR |conds|) 'OR)
            (PROGN (SETQ |r| (CDR |conds|)) #1='T))
       (|modemap2SigConds| (CAR |r|)))
      ((AND (CONSP |conds|) (EQ (CAR |conds|) 'AND)
            (PROGN (SETQ |r| (CDR |conds|)) #1#))
       |r|)
      (#1# (LIST |conds|))))))

; hasPatternVar x ==
;   IDENTP x and (x ~= "**") => isPatternVar x
;   atom x => false
;   or/[hasPatternVar y for y in x]

(DEFUN |hasPatternVar| (|x|)
  (PROG ()
    (RETURN
     (COND ((AND (IDENTP |x|) (NOT (EQ |x| '**))) (|isPatternVar| |x|))
           ((ATOM |x|) NIL)
           (#1='T
            ((LAMBDA (|bfVar#32| |bfVar#31| |y|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#31|)
                      (PROGN (SETQ |y| (CAR |bfVar#31|)) NIL))
                  (RETURN |bfVar#32|))
                 (#1#
                  (PROGN
                   (SETQ |bfVar#32| (|hasPatternVar| |y|))
                   (COND (|bfVar#32| (RETURN |bfVar#32|))))))
                (SETQ |bfVar#31| (CDR |bfVar#31|))))
             NIL |x| NIL))))))

; getDcForm(dc, condlist) ==
;   -- FIXME: normally first condition on *1 gives origin, but not
;   -- always.  In particular, if we get category with no operations
;   -- than this is clearly wrong, so try next (happens with attributes).
;   -- We should make this reliable.
;   candidates := [x for x in condlist | x is [k,=dc,:.]
;                  and MEMQ(k, '(ofCategory isDomain))]
;   null(candidates) => nil
;   [ofWord,id,cform] := first(candidates)
;   if #candidates > 1 and ofWord = 'ofCategory and _
;        null(get_database(opOf(cform), 'MODEMAPS)) then
;      [ofWord,id,cform] := first(rest(candidates))
;   conform := getConstructorForm opOf cform
;   ofWord = 'ofCategory =>
;     [conform, ["*1", :rest cform], ["%", :rest conform]]
;   ofWord = 'isDomain =>
;     [conform, ["*1", :rest cform], ["%", :rest conform]]
;   systemError()

(DEFUN |getDcForm| (|dc| |condlist|)
  (PROG (|k| |ISTMP#1| |candidates| |LETTMP#1| |ofWord| |id| |cform| |conform|)
    (RETURN
     (PROGN
      (SETQ |candidates|
              ((LAMBDA (|bfVar#34| |bfVar#33| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#33|)
                        (PROGN (SETQ |x| (CAR |bfVar#33|)) NIL))
                    (RETURN (NREVERSE |bfVar#34|)))
                   (#1='T
                    (AND (CONSP |x|)
                         (PROGN
                          (SETQ |k| (CAR |x|))
                          (SETQ |ISTMP#1| (CDR |x|))
                          (AND (CONSP |ISTMP#1|) (EQUAL (CAR |ISTMP#1|) |dc|)))
                         (MEMQ |k| '(|ofCategory| |isDomain|))
                         (SETQ |bfVar#34| (CONS |x| |bfVar#34|)))))
                  (SETQ |bfVar#33| (CDR |bfVar#33|))))
               NIL |condlist| NIL))
      (COND ((NULL |candidates|) NIL)
            (#1#
             (PROGN
              (SETQ |LETTMP#1| (CAR |candidates|))
              (SETQ |ofWord| (CAR |LETTMP#1|))
              (SETQ |id| (CADR . #2=(|LETTMP#1|)))
              (SETQ |cform| (CADDR . #2#))
              (COND
               ((AND (< 1 (LENGTH |candidates|)) (EQ |ofWord| '|ofCategory|)
                     (NULL (|get_database| (|opOf| |cform|) 'MODEMAPS)))
                (SETQ |LETTMP#1| (CAR (CDR |candidates|)))
                (SETQ |ofWord| (CAR |LETTMP#1|))
                (SETQ |id| (CADR . #3=(|LETTMP#1|)))
                (SETQ |cform| (CADDR . #3#)) |LETTMP#1|))
              (SETQ |conform| (|getConstructorForm| (|opOf| |cform|)))
              (COND
               ((EQ |ofWord| '|ofCategory|)
                (LIST |conform| (CONS '*1 (CDR |cform|))
                      (CONS '% (CDR |conform|))))
               ((EQ |ofWord| '|isDomain|)
                (LIST |conform| (CONS '*1 (CDR |cform|))
                      (CONS '% (CDR |conform|))))
               (#1# (|systemError|))))))))))

; getSigSubst(u, pl, vl, fl) ==
;   u is [item, :r] =>
;     item is ['AND,:s] =>
;        [pl, vl, fl] := getSigSubst(s, pl, vl, fl)
;        getSigSubst(r, pl, vl, fl)
;     [key, v, f] := item
;     key = 'isDomain => getSigSubst(r, pl, [v, :vl], [f, :fl])
;     key = 'ofCategory => getSigSubst(r, pl, [$Dmarker, :vl], [f, :fl])
;     key = 'ofType    => getSigSubst(r, pl, vl, fl)
;     key = 'has => getSigSubst(r, [item, :pl], vl, fl)
;     key = 'not => getSigSubst(r, [item, :pl], vl, fl)
;     systemError()
;   [pl, vl, fl]

(DEFUN |getSigSubst| (|u| |pl| |vl| |fl|)
  (PROG (|item| |r| |s| |LETTMP#1| |key| |v| |f|)
    (RETURN
     (COND
      ((AND (CONSP |u|)
            (PROGN (SETQ |item| (CAR |u|)) (SETQ |r| (CDR |u|)) #1='T))
       (COND
        ((AND (CONSP |item|) (EQ (CAR |item|) 'AND)
              (PROGN (SETQ |s| (CDR |item|)) #1#))
         (PROGN
          (SETQ |LETTMP#1| (|getSigSubst| |s| |pl| |vl| |fl|))
          (SETQ |pl| (CAR |LETTMP#1|))
          (SETQ |vl| (CADR . #2=(|LETTMP#1|)))
          (SETQ |fl| (CADDR . #2#))
          (|getSigSubst| |r| |pl| |vl| |fl|)))
        (#1#
         (PROGN
          (SETQ |key| (CAR |item|))
          (SETQ |v| (CADR . #3=(|item|)))
          (SETQ |f| (CADDR . #3#))
          (COND
           ((EQ |key| '|isDomain|)
            (|getSigSubst| |r| |pl| (CONS |v| |vl|) (CONS |f| |fl|)))
           ((EQ |key| '|ofCategory|)
            (|getSigSubst| |r| |pl| (CONS |$Dmarker| |vl|) (CONS |f| |fl|)))
           ((EQ |key| '|ofType|) (|getSigSubst| |r| |pl| |vl| |fl|))
           ((EQ |key| '|has|) (|getSigSubst| |r| (CONS |item| |pl|) |vl| |fl|))
           ((EQ |key| '|not|) (|getSigSubst| |r| (CONS |item| |pl|) |vl| |fl|))
           (#1# (|systemError|)))))))
      (#1# (LIST |pl| |vl| |fl|))))))

; pairlis(u,v) ==
;   null u or null v => nil
;   [[first u,:first v],:pairlis(rest u, rest v)]

(DEFUN |pairlis| (|u| |v|)
  (PROG ()
    (RETURN
     (COND ((OR (NULL |u|) (NULL |v|)) NIL)
           ('T
            (CONS (CONS (CAR |u|) (CAR |v|))
                  (|pairlis| (CDR |u|) (CDR |v|))))))))
