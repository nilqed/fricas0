 
; )package "BOOT"
 
(IN-PACKAGE "BOOT")
 
; NRTevalDomain form ==
;   form is ['SETELT,:.] =>
;       BREAK()
;       eval form
;   evalDomain form
 
(DEFUN |NRTevalDomain| (|form|)
  (PROG ()
    (RETURN
     (COND
      ((AND (CONSP |form|) (EQ (CAR |form|) 'SETELT))
       (PROGN (BREAK) (|eval| |form|)))
      ('T (|evalDomain| |form|))))))
 
; compiledLookupCheck(op,sig,dollar) ==
;   fn := compiledLookup(op,sig,dollar)
; 
;   fn = nil =>
;     keyedSystemError("S2NR0001",[op,formatSignature sig,dollar.0])
;   fn
 
(DEFUN |compiledLookupCheck| (|op| |sig| |dollar|)
  (PROG (|fn|)
    (RETURN
     (PROGN
      (SETQ |fn| (|compiledLookup| |op| |sig| |dollar|))
      (COND
       ((NULL |fn|)
        (|keyedSystemError| 'S2NR0001
         (LIST |op| (|formatSignature| |sig|) (ELT |dollar| 0))))
       ('T |fn|))))))
 
; NRTreplaceLocalTypes(t,dom) ==
;    atom t =>
;      not INTEGERP t => t
;      t:= dom.t
;      if PAIRP t then t:= NRTevalDomain t
;      t.0
;    MEMQ(first t, '(Mapping Union Record _:)) =>
;       [first t, :[NRTreplaceLocalTypes(x, dom) for x in rest t]]
;    t
 
(DEFUN |NRTreplaceLocalTypes| (|t| |dom|)
  (PROG ()
    (RETURN
     (COND
      ((ATOM |t|)
       (COND ((NULL (INTEGERP |t|)) |t|)
             (#1='T
              (PROGN
               (SETQ |t| (ELT |dom| |t|))
               (COND ((CONSP |t|) (SETQ |t| (|NRTevalDomain| |t|))))
               (ELT |t| 0)))))
      ((MEMQ (CAR |t|) '(|Mapping| |Union| |Record| |:|))
       (CONS (CAR |t|)
             ((LAMBDA (|bfVar#2| |bfVar#1| |x|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#1|) (PROGN (SETQ |x| (CAR |bfVar#1|)) NIL))
                   (RETURN (NREVERSE |bfVar#2|)))
                  (#1#
                   (SETQ |bfVar#2|
                           (CONS (|NRTreplaceLocalTypes| |x| |dom|)
                                 |bfVar#2|))))
                 (SETQ |bfVar#1| (CDR |bfVar#1|))))
              NIL (CDR |t|) NIL)))
      (#1# |t|)))))
 
; substDomainArgs(domain,object) ==
;     form := devaluate domain
;     SUBLISLIS([form,:rest form],["$$",:$FormalMapVariableList],object)
 
(DEFUN |substDomainArgs| (|domain| |object|)
  (PROG (|form|)
    (RETURN
     (PROGN
      (SETQ |form| (|devaluate| |domain|))
      (SUBLISLIS (CONS |form| (CDR |form|)) (CONS '$$ |$FormalMapVariableList|)
       |object|)))))
 
; lookupInTable(op,sig,dollar,[domain,table]) ==
;   success := false
;   someMatch := false
;   while not success for [sig1, :code] in QLASSQ(op, table) repeat
;     success :=
;       null compareSig(sig,sig1,dollar.0,domain) => false
;       loc := code
;       loc = 0 => BREAK()
;       slot := domain.loc
;       lookupDisplay(op,sig,domain,'" !! found in NEW table!!")
;       slot
;   success
 
(DEFUN |lookupInTable| (|op| |sig| |dollar| |bfVar#5|)
  (PROG (|domain| |table| |success| |someMatch| |sig1| |code| |loc| |slot|)
    (RETURN
     (PROGN
      (SETQ |domain| (CAR |bfVar#5|))
      (SETQ |table| (CADR |bfVar#5|))
      (SETQ |success| NIL)
      (SETQ |someMatch| NIL)
      ((LAMBDA (|bfVar#4| |bfVar#3|)
         (LOOP
          (COND
           ((OR |success| (ATOM |bfVar#4|)
                (PROGN (SETQ |bfVar#3| (CAR |bfVar#4|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |bfVar#3|)
                 (PROGN
                  (SETQ |sig1| (CAR |bfVar#3|))
                  (SETQ |code| (CDR |bfVar#3|))
                  #1#)
                 (SETQ |success|
                         (COND
                          ((NULL
                            (|compareSig| |sig| |sig1| (ELT |dollar| 0)
                             |domain|))
                           NIL)
                          (#1#
                           (PROGN
                            (SETQ |loc| |code|)
                            (COND ((EQL |loc| 0) (BREAK))
                                  (#1#
                                   (PROGN
                                    (SETQ |slot| (ELT |domain| |loc|))
                                    (|lookupDisplay| |op| |sig| |domain|
                                     " !! found in NEW table!!")
                                    |slot|))))))))))
          (SETQ |bfVar#4| (CDR |bfVar#4|))))
       (QLASSQ |op| |table|) NIL)
      |success|))))
 
; compareSig(sig,tableSig,dollar,domain) ==
;   not (#sig = #tableSig) => false
;   null (target := first sig)
;    or lazyCompareSigEqual(target,first tableSig,dollar,domain) =>
;      and/[lazyCompareSigEqual(s,t,dollar,domain)
;               for s in rest sig for t in rest tableSig]
 
(DEFUN |compareSig| (|sig| |tableSig| |dollar| |domain|)
  (PROG (|target|)
    (RETURN
     (COND ((NULL (EQL (LENGTH |sig|) (LENGTH |tableSig|))) NIL)
           ((OR (NULL (SETQ |target| (CAR |sig|)))
                (|lazyCompareSigEqual| |target| (CAR |tableSig|) |dollar|
                 |domain|))
            ((LAMBDA (|bfVar#8| |bfVar#6| |s| |bfVar#7| |t|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#6|) (PROGN (SETQ |s| (CAR |bfVar#6|)) NIL)
                      (ATOM |bfVar#7|) (PROGN (SETQ |t| (CAR |bfVar#7|)) NIL))
                  (RETURN |bfVar#8|))
                 ('T
                  (PROGN
                   (SETQ |bfVar#8|
                           (|lazyCompareSigEqual| |s| |t| |dollar| |domain|))
                   (COND ((NOT |bfVar#8|) (RETURN NIL))))))
                (SETQ |bfVar#6| (CDR |bfVar#6|))
                (SETQ |bfVar#7| (CDR |bfVar#7|))))
             T (CDR |sig|) NIL (CDR |tableSig|) NIL))))))
 
; lazyCompareSigEqual(s,tslot,dollar,domain) ==
;   tslot = '$ => s = tslot
;   INTEGERP tslot and PAIRP(lazyt:=domain.tslot) and PAIRP s =>
;       lazyt is [.,.,.,[.,item,.]] and
;         item is [., [functorName, :.]] and functorName = first s =>
;           compareSigEqual(s,(NRTevalDomain lazyt).0,dollar,domain)
;       nil
;   compareSigEqual(s,NRTreplaceLocalTypes(tslot,domain),dollar,domain)
 
(DEFUN |lazyCompareSigEqual| (|s| |tslot| |dollar| |domain|)
  (PROG (|lazyt| |ISTMP#1| |ISTMP#2| |ISTMP#3| |ISTMP#4| |ISTMP#5| |item|
         |ISTMP#6| |functorName|)
    (RETURN
     (COND ((EQ |tslot| '$) (EQUAL |s| |tslot|))
           ((AND (INTEGERP |tslot|)
                 (CONSP (SETQ |lazyt| (ELT |domain| |tslot|))) (CONSP |s|))
            (COND
             ((AND (CONSP |lazyt|)
                   (PROGN
                    (SETQ |ISTMP#1| (CDR |lazyt|))
                    (AND (CONSP |ISTMP#1|)
                         (PROGN
                          (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                          (AND (CONSP |ISTMP#2|)
                               (PROGN
                                (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                                (AND (CONSP |ISTMP#3|) (EQ (CDR |ISTMP#3|) NIL)
                                     (PROGN
                                      (SETQ |ISTMP#4| (CAR |ISTMP#3|))
                                      (AND (CONSP |ISTMP#4|)
                                           (PROGN
                                            (SETQ |ISTMP#5| (CDR |ISTMP#4|))
                                            (AND (CONSP |ISTMP#5|)
                                                 (PROGN
                                                  (SETQ |item| (CAR |ISTMP#5|))
                                                  (SETQ |ISTMP#6|
                                                          (CDR |ISTMP#5|))
                                                  (AND (CONSP |ISTMP#6|)
                                                       (EQ (CDR |ISTMP#6|)
                                                           NIL)))))))))))))
                   (CONSP |item|)
                   (PROGN
                    (SETQ |ISTMP#1| (CDR |item|))
                    (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                         (PROGN
                          (SETQ |ISTMP#2| (CAR |ISTMP#1|))
                          (AND (CONSP |ISTMP#2|)
                               (PROGN
                                (SETQ |functorName| (CAR |ISTMP#2|))
                                #1='T)))))
                   (EQUAL |functorName| (CAR |s|)))
              (|compareSigEqual| |s| (ELT (|NRTevalDomain| |lazyt|) 0) |dollar|
               |domain|))
             (#1# NIL)))
           (#1#
            (|compareSigEqual| |s| (|NRTreplaceLocalTypes| |tslot| |domain|)
             |dollar| |domain|))))))
 
; compareSigEqual(s,t,dollar,domain) ==
;   EQUAL(s,t) => true
;   ATOM t =>
;     u :=
;       EQ(t,'$) => dollar
;       isSharpVar t =>
;         VECP domain => ELT(rest domain.0,POSN1(t,$FormalMapVariableList))
;         ELT(rest domain,POSN1(t,$FormalMapVariableList))
;       STRINGP t and IDENTP s => (s := PNAME s; t)
;       nil
;     s = '$ => compareSigEqual(dollar,u,dollar,domain)
;     u => compareSigEqual(s,u,dollar,domain)
;     EQUAL(s,u)
;   EQ(s,'$) => compareSigEqual(dollar,t,dollar,domain)
;   ATOM s => nil
;   #s ~= #t => nil
;   match := true
;   for u in s for v in t repeat
;     not compareSigEqual(u,v,dollar,domain) => return(match:=false)
;   match
 
(DEFUN |compareSigEqual| (|s| |t| |dollar| |domain|)
  (PROG (|u| |match|)
    (RETURN
     (COND ((EQUAL |s| |t|) T)
           ((ATOM |t|)
            (PROGN
             (SETQ |u|
                     (COND ((EQ |t| '$) |dollar|)
                           ((|isSharpVar| |t|)
                            (COND
                             ((VECP |domain|)
                              (ELT (CDR (ELT |domain| 0))
                                   (POSN1 |t| |$FormalMapVariableList|)))
                             (#1='T
                              (ELT (CDR |domain|)
                                   (POSN1 |t| |$FormalMapVariableList|)))))
                           ((AND (STRINGP |t|) (IDENTP |s|))
                            (PROGN (SETQ |s| (PNAME |s|)) |t|))
                           (#1# NIL)))
             (COND
              ((EQ |s| '$) (|compareSigEqual| |dollar| |u| |dollar| |domain|))
              (|u| (|compareSigEqual| |s| |u| |dollar| |domain|))
              (#1# (EQUAL |s| |u|)))))
           ((EQ |s| '$) (|compareSigEqual| |dollar| |t| |dollar| |domain|))
           ((ATOM |s|) NIL) ((NOT (EQL (LENGTH |s|) (LENGTH |t|))) NIL)
           (#1#
            (PROGN
             (SETQ |match| T)
             ((LAMBDA (|bfVar#9| |u| |bfVar#10| |v|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#9|) (PROGN (SETQ |u| (CAR |bfVar#9|)) NIL)
                       (ATOM |bfVar#10|)
                       (PROGN (SETQ |v| (CAR |bfVar#10|)) NIL))
                   (RETURN NIL))
                  (#1#
                   (COND
                    ((NULL (|compareSigEqual| |u| |v| |dollar| |domain|))
                     (IDENTITY (RETURN (SETQ |match| NIL)))))))
                 (SETQ |bfVar#9| (CDR |bfVar#9|))
                 (SETQ |bfVar#10| (CDR |bfVar#10|))))
              |s| NIL |t| NIL)
             |match|))))))
 
; NRTcompileEvalForm(opName,sigTail,dcVector) ==
;   u := NRTcompiledLookup(opName,sigTail,dcVector)
;   not ($insideCompileBodyIfTrue = true) => MKQ u
;   k := NRTgetMinivectorIndex(u,opName,sigTail,dcVector)
;   ['ELT,"$$$",k]  --$$$ denotes minivector
 
(DEFUN |NRTcompileEvalForm| (|opName| |sigTail| |dcVector|)
  (PROG (|u| |k|)
    (RETURN
     (PROGN
      (SETQ |u| (|NRTcompiledLookup| |opName| |sigTail| |dcVector|))
      (COND ((NULL (EQUAL |$insideCompileBodyIfTrue| T)) (MKQ |u|))
            ('T
             (PROGN
              (SETQ |k|
                      (|NRTgetMinivectorIndex| |u| |opName| |sigTail|
                       |dcVector|))
              (LIST 'ELT '$$$ |k|))))))))
 
; NRTtypeHack t ==
;   ATOM t => t
;   first t = '_# => # CADR t
;   [first t, :[NRTtypeHack tt for tt in rest t]]
 
(DEFUN |NRTtypeHack| (|t|)
  (PROG ()
    (RETURN
     (COND ((ATOM |t|) |t|) ((EQ (CAR |t|) '|#|) (LENGTH (CADR |t|)))
           (#1='T
            (CONS (CAR |t|)
                  ((LAMBDA (|bfVar#12| |bfVar#11| |tt|)
                     (LOOP
                      (COND
                       ((OR (ATOM |bfVar#11|)
                            (PROGN (SETQ |tt| (CAR |bfVar#11|)) NIL))
                        (RETURN (NREVERSE |bfVar#12|)))
                       (#1#
                        (SETQ |bfVar#12|
                                (CONS (|NRTtypeHack| |tt|) |bfVar#12|))))
                      (SETQ |bfVar#11| (CDR |bfVar#11|))))
                   NIL (CDR |t|) NIL)))))))
 
; NRTgetMinivectorIndex(u,op,sig,domVector) ==
;   s := # $minivector
;   k := or/[k for k in 0..(s-1)
;         for x in $minivector | EQ(x,u)] => k
;   $minivector := [:$minivector,u]
;   if $compilingInputFile then
;     $minivectorCode := [:$minivectorCode,[op,sig,devaluate domVector]]
; --  pp '"-- minivectorCode -->"
; --  pp $minivectorCode
;   s
 
(DEFUN |NRTgetMinivectorIndex| (|u| |op| |sig| |domVector|)
  (PROG (|s| |k|)
    (RETURN
     (PROGN
      (SETQ |s| (LENGTH |$minivector|))
      (COND
       ((SETQ |k|
                ((LAMBDA (|bfVar#15| |bfVar#13| |k| |bfVar#14| |x|)
                   (LOOP
                    (COND
                     ((OR (> |k| |bfVar#13|) (ATOM |bfVar#14|)
                          (PROGN (SETQ |x| (CAR |bfVar#14|)) NIL))
                      (RETURN |bfVar#15|))
                     (#1='T
                      (AND (EQ |x| |u|)
                           (PROGN
                            (SETQ |bfVar#15| |k|)
                            (COND (|bfVar#15| (RETURN |bfVar#15|)))))))
                    (SETQ |k| (+ |k| 1))
                    (SETQ |bfVar#14| (CDR |bfVar#14|))))
                 NIL (- |s| 1) 0 |$minivector| NIL))
        |k|)
       (#1#
        (PROGN
         (SETQ |$minivector| (APPEND |$minivector| (CONS |u| NIL)))
         (COND
          (|$compilingInputFile|
           (SETQ |$minivectorCode|
                   (APPEND |$minivectorCode|
                           (CONS (LIST |op| |sig| (|devaluate| |domVector|))
                                 NIL)))))
         |s|)))))))
 
; NRTisRecurrenceRelation(op,body,minivectorName) ==
;   -- returns [body p1 p2 ... pk] for a k-term recurrence relation
;   -- where the n-th term is computed using the (n-1)st,...,(n-k)th
;   -- whose values are initially computed using the expressions
;   -- p1,...,pk respectively; body has #2,#3,... in place of
;   -- f(k-1),f(k-2),...
; 
;   body isnt ['COND,:pcl] => false
;   -- body should have a conditional expression which
;   -- gives k boundary values, one general term plus possibly an
;   -- "out of domain" condition
; --pcl is [:.,[ ''T,:mess]] and not (CONTAINED('throwMessage,mess) or
; --  CONTAINED('throwKeyedMsg,mess)) => NIL
;   pcl := [x for x in pcl | not (x is [''T,:mess] and
;     (CONTAINED('throwMessage,mess) or
;       CONTAINED('throwKeyedMsg,mess)))]
;   integer := EVAL $Integer
;   iequalSlot:=compiledLookupCheck("=",'((Boolean) $ $),integer)
;   lt_slot:=compiledLookupCheck("<",'((Boolean) $ $),integer)
;   le_slot := compiledLookupCheck("<=", '((Boolean) $ $), integer)
;   gt_slot := compiledLookupCheck(">", '((Boolean) $ $), integer)
;   ge_slot := compiledLookupCheck(">=", '((Boolean) $ $), integer)
;   bf := '(Boolean)
;   notpSlot := compiledLookupCheck("not", '((Boolean)(Boolean)), EVAL bf)
;   for [p,c] in pcl repeat
;     p is ['SPADCALL,sharpVar,n1,['ELT,=minivectorName,slot]]
;       and EQ(iequalSlot,$minivector.slot) =>
;         initList:= [[n1,:c],:initList]
;         sharpList := insert(sharpVar,sharpList)
;         n:=n1
;     miscList:= [[p,c],:miscList]
;   miscList isnt [[generalPred,generalTerm]] or sharpList isnt [sharpArg] =>
;       return false
;     --first general term starts at n
; 
;   --Must have at least one special value; insist that they be consecutive
;   null initList => false
;   specialValues:= MSORT ASSOCLEFT initList
;   or/[null INTEGERP n for n in specialValues] => false
;   minIndex:= "MIN"/specialValues
;   not (and/[i=x for i in minIndex..(minIndex+n-1) for x in specialValues]) =>
;     sayKeyedMsg("S2IX0005",
;       ["append"/[['" ",sv]  for sv in specialValues]])
;     return nil
; 
;   --Determine the order k of the recurrence and index n of first general term
;   k:= #specialValues
;   n:= k+minIndex
;   --Check general predicate
;   predOk :=
;     generalPred is '(QUOTE T) => true
;     generalPred is ['SPADCALL, m1, m2,['ELT, =minivectorName, slot]] =>
;         m2 = sharpArg and EQ(lt_slot, $minivector.slot) => m1 + 1
;         m2 = sharpArg and EQ(le_slot, $minivector.slot) => m1
;         m1 = sharpArg and EQ(gt_slot, $minivector.slot) => m2 + 1
;         m1 = sharpArg and EQ(ge_slot, $minivector.slot) => m2
;     generalPred is ['SPADCALL, ['SPADCALL, =sharpArg, m,
;       ['ELT, =minivectorName, slot]], ['ELT, =minivectorName, notSlot]]
;         and EQ(lt_slot, $minivector.slot)
;           and EQ(notpSlot,$minivector.notSlot) => m
;     generalPred is ['NOT, ['SPADCALL, =sharpArg, m,
;        ['ELT, =minivectorName, slot]]] and EQ(lt_slot, $minivector.slot) => m
;     return nil
;   INTEGERP predOk and predOk ~= n =>
;     sayKeyedMsg("S2IX0006",[n,m])
;     return nil
; 
;   --Check general term for references to just the k previous values
;   diffCell:=compiledLookupCheck("-",'($ $ $),integer)
;   diffSlot := or/[i for i in 0.. for x in $minivector | EQ(x,diffCell)]
;                 or return nil
;   --Check general term for references to just the k previous values
;   sharpPosition := PARSE_-INTEGER SUBSTRING(sharpArg,1,nil)
;   al:= mkDiffAssoc(op,generalTerm,k,sharpPosition,sharpArg,diffSlot,minivectorName)
;   null al => false
;   '$failed in al => false
;   body:= generalTerm
;   for [a,:b] in al repeat
;     body:= substitute(b,a,body)
;   result:= [body,sharpArg,n-1,:NREVERSE [LASSOC(i,initList) or
;       systemErrorHere('"NRTisRecurrenceRelation")
;         for i in minIndex..(n-1)]]
 
(DEFUN |NRTisRecurrenceRelation| (|op| |body| |minivectorName|)
  (PROG (|pcl| |mess| |integer| |iequalSlot| |lt_slot| |le_slot| |gt_slot|
         |ge_slot| |bf| |notpSlot| |p| |ISTMP#1| |c| |sharpVar| |ISTMP#2| |n1|
         |ISTMP#3| |ISTMP#4| |ISTMP#5| |ISTMP#6| |slot| |initList| |sharpList|
         |n| |miscList| |generalPred| |generalTerm| |sharpArg| |specialValues|
         |minIndex| |k| |m1| |m2| |m| |ISTMP#7| |ISTMP#8| |ISTMP#9| |ISTMP#10|
         |ISTMP#11| |ISTMP#12| |notSlot| |predOk| |diffCell| |diffSlot|
         |sharpPosition| |al| |a| |b| |result|)
    (RETURN
     (COND
      ((NOT
        (AND (CONSP |body|) (EQ (CAR |body|) 'COND)
             (PROGN (SETQ |pcl| (CDR |body|)) #1='T)))
       NIL)
      (#1#
       (PROGN
        (SETQ |pcl|
                ((LAMBDA (|bfVar#17| |bfVar#16| |x|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#16|)
                          (PROGN (SETQ |x| (CAR |bfVar#16|)) NIL))
                      (RETURN (NREVERSE |bfVar#17|)))
                     (#1#
                      (AND
                       (NULL
                        (AND (CONSP |x|) (EQUAL (CAR |x|) ''T)
                             (PROGN (SETQ |mess| (CDR |x|)) #1#)
                             (OR (CONTAINED '|throwMessage| |mess|)
                                 (CONTAINED '|throwKeyedMsg| |mess|))))
                       (SETQ |bfVar#17| (CONS |x| |bfVar#17|)))))
                    (SETQ |bfVar#16| (CDR |bfVar#16|))))
                 NIL |pcl| NIL))
        (SETQ |integer| (EVAL |$Integer|))
        (SETQ |iequalSlot|
                (|compiledLookupCheck| '= '((|Boolean|) $ $) |integer|))
        (SETQ |lt_slot|
                (|compiledLookupCheck| '< '((|Boolean|) $ $) |integer|))
        (SETQ |le_slot|
                (|compiledLookupCheck| '<= '((|Boolean|) $ $) |integer|))
        (SETQ |gt_slot|
                (|compiledLookupCheck| '> '((|Boolean|) $ $) |integer|))
        (SETQ |ge_slot|
                (|compiledLookupCheck| '>= '((|Boolean|) $ $) |integer|))
        (SETQ |bf| '(|Boolean|))
        (SETQ |notpSlot|
                (|compiledLookupCheck| '|not| '((|Boolean|) (|Boolean|))
                 (EVAL |bf|)))
        ((LAMBDA (|bfVar#19| |bfVar#18|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#19|)
                  (PROGN (SETQ |bfVar#18| (CAR |bfVar#19|)) NIL))
              (RETURN NIL))
             (#1#
              (AND (CONSP |bfVar#18|)
                   (PROGN
                    (SETQ |p| (CAR |bfVar#18|))
                    (SETQ |ISTMP#1| (CDR |bfVar#18|))
                    (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                         (PROGN (SETQ |c| (CAR |ISTMP#1|)) #1#)))
                   (COND
                    ((AND (CONSP |p|) (EQ (CAR |p|) 'SPADCALL)
                          (PROGN
                           (SETQ |ISTMP#1| (CDR |p|))
                           (AND (CONSP |ISTMP#1|)
                                (PROGN
                                 (SETQ |sharpVar| (CAR |ISTMP#1|))
                                 (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                 (AND (CONSP |ISTMP#2|)
                                      (PROGN
                                       (SETQ |n1| (CAR |ISTMP#2|))
                                       (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                                       (AND (CONSP |ISTMP#3|)
                                            (EQ (CDR |ISTMP#3|) NIL)
                                            (PROGN
                                             (SETQ |ISTMP#4| (CAR |ISTMP#3|))
                                             (AND (CONSP |ISTMP#4|)
                                                  (EQ (CAR |ISTMP#4|) 'ELT)
                                                  (PROGN
                                                   (SETQ |ISTMP#5|
                                                           (CDR |ISTMP#4|))
                                                   (AND (CONSP |ISTMP#5|)
                                                        (EQUAL (CAR |ISTMP#5|)
                                                               |minivectorName|)
                                                        (PROGN
                                                         (SETQ |ISTMP#6|
                                                                 (CDR
                                                                  |ISTMP#5|))
                                                         (AND (CONSP |ISTMP#6|)
                                                              (EQ
                                                               (CDR |ISTMP#6|)
                                                               NIL)
                                                              (PROGN
                                                               (SETQ |slot|
                                                                       (CAR
                                                                        |ISTMP#6|))
                                                               #1#)))))))))))))
                          (EQ |iequalSlot| (ELT |$minivector| |slot|)))
                     (PROGN
                      (SETQ |initList| (CONS (CONS |n1| |c|) |initList|))
                      (SETQ |sharpList| (|insert| |sharpVar| |sharpList|))
                      (SETQ |n| |n1|)))
                    (#1#
                     (SETQ |miscList| (CONS (LIST |p| |c|) |miscList|)))))))
            (SETQ |bfVar#19| (CDR |bfVar#19|))))
         |pcl| NIL)
        (COND
         ((OR
           (NOT
            (AND (CONSP |miscList|) (EQ (CDR |miscList|) NIL)
                 (PROGN
                  (SETQ |ISTMP#1| (CAR |miscList|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN
                        (SETQ |generalPred| (CAR |ISTMP#1|))
                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                        (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                             (PROGN
                              (SETQ |generalTerm| (CAR |ISTMP#2|))
                              #1#)))))))
           (NOT
            (AND (CONSP |sharpList|) (EQ (CDR |sharpList|) NIL)
                 (PROGN (SETQ |sharpArg| (CAR |sharpList|)) #1#))))
          (RETURN NIL))
         ((NULL |initList|) NIL)
         (#1#
          (PROGN
           (SETQ |specialValues| (MSORT (ASSOCLEFT |initList|)))
           (COND
            (((LAMBDA (|bfVar#21| |bfVar#20| |n|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#20|)
                       (PROGN (SETQ |n| (CAR |bfVar#20|)) NIL))
                   (RETURN |bfVar#21|))
                  (#1#
                   (PROGN
                    (SETQ |bfVar#21| (NULL (INTEGERP |n|)))
                    (COND (|bfVar#21| (RETURN |bfVar#21|))))))
                 (SETQ |bfVar#20| (CDR |bfVar#20|))))
              NIL |specialValues| NIL)
             NIL)
            (#1#
             (PROGN
              (SETQ |minIndex|
                      ((LAMBDA (|bfVar#22| |bfVar#24| |bfVar#23|)
                         (LOOP
                          (COND
                           ((OR (ATOM |bfVar#24|)
                                (PROGN (SETQ |bfVar#23| (CAR |bfVar#24|)) NIL))
                            (RETURN |bfVar#22|))
                           (#1# (SETQ |bfVar#22| (MIN |bfVar#22| |bfVar#23|))))
                          (SETQ |bfVar#24| (CDR |bfVar#24|))))
                       999999 |specialValues| NIL))
              (COND
               ((NULL
                 ((LAMBDA (|bfVar#27| |bfVar#25| |i| |bfVar#26| |x|)
                    (LOOP
                     (COND
                      ((OR (> |i| |bfVar#25|) (ATOM |bfVar#26|)
                           (PROGN (SETQ |x| (CAR |bfVar#26|)) NIL))
                       (RETURN |bfVar#27|))
                      (#1#
                       (PROGN
                        (SETQ |bfVar#27| (EQUAL |i| |x|))
                        (COND ((NOT |bfVar#27|) (RETURN NIL))))))
                     (SETQ |i| (+ |i| 1))
                     (SETQ |bfVar#26| (CDR |bfVar#26|))))
                  T (- (+ |minIndex| |n|) 1) |minIndex| |specialValues| NIL))
                (PROGN
                 (|sayKeyedMsg| 'S2IX0005
                  (LIST
                   ((LAMBDA (|bfVar#29| |bfVar#28| |sv|)
                      (LOOP
                       (COND
                        ((OR (ATOM |bfVar#28|)
                             (PROGN (SETQ |sv| (CAR |bfVar#28|)) NIL))
                         (RETURN |bfVar#29|))
                        (#1#
                         (SETQ |bfVar#29|
                                 (APPEND |bfVar#29| (LIST " " |sv|)))))
                       (SETQ |bfVar#28| (CDR |bfVar#28|))))
                    NIL |specialValues| NIL)))
                 (RETURN NIL)))
               (#1#
                (PROGN
                 (SETQ |k| (LENGTH |specialValues|))
                 (SETQ |n| (+ |k| |minIndex|))
                 (SETQ |predOk|
                         (COND ((EQUAL |generalPred| ''T) T)
                               ((AND (CONSP |generalPred|)
                                     (EQ (CAR |generalPred|) 'SPADCALL)
                                     (PROGN
                                      (SETQ |ISTMP#1| (CDR |generalPred|))
                                      (AND (CONSP |ISTMP#1|)
                                           (PROGN
                                            (SETQ |m1| (CAR |ISTMP#1|))
                                            (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                            (AND (CONSP |ISTMP#2|)
                                                 (PROGN
                                                  (SETQ |m2| (CAR |ISTMP#2|))
                                                  (SETQ |ISTMP#3|
                                                          (CDR |ISTMP#2|))
                                                  (AND (CONSP |ISTMP#3|)
                                                       (EQ (CDR |ISTMP#3|) NIL)
                                                       (PROGN
                                                        (SETQ |ISTMP#4|
                                                                (CAR
                                                                 |ISTMP#3|))
                                                        (AND (CONSP |ISTMP#4|)
                                                             (EQ
                                                              (CAR |ISTMP#4|)
                                                              'ELT)
                                                             (PROGN
                                                              (SETQ |ISTMP#5|
                                                                      (CDR
                                                                       |ISTMP#4|))
                                                              (AND
                                                               (CONSP
                                                                |ISTMP#5|)
                                                               (EQUAL
                                                                (CAR |ISTMP#5|)
                                                                |minivectorName|)
                                                               (PROGN
                                                                (SETQ |ISTMP#6|
                                                                        (CDR
                                                                         |ISTMP#5|))
                                                                (AND
                                                                 (CONSP
                                                                  |ISTMP#6|)
                                                                 (EQ
                                                                  (CDR
                                                                   |ISTMP#6|)
                                                                  NIL)
                                                                 (PROGN
                                                                  (SETQ |slot|
                                                                          (CAR
                                                                           |ISTMP#6|))
                                                                  #1#))))))))))))))
                                (COND
                                 ((AND (EQUAL |m2| |sharpArg|)
                                       (EQ |lt_slot|
                                           (ELT |$minivector| |slot|)))
                                  (+ |m1| 1))
                                 ((AND (EQUAL |m2| |sharpArg|)
                                       (EQ |le_slot|
                                           (ELT |$minivector| |slot|)))
                                  |m1|)
                                 ((AND (EQUAL |m1| |sharpArg|)
                                       (EQ |gt_slot|
                                           (ELT |$minivector| |slot|)))
                                  (+ |m2| 1))
                                 ((AND (EQUAL |m1| |sharpArg|)
                                       (EQ |ge_slot|
                                           (ELT |$minivector| |slot|)))
                                  |m2|)))
                               ((AND (CONSP |generalPred|)
                                     (EQ (CAR |generalPred|) 'SPADCALL)
                                     (PROGN
                                      (SETQ |ISTMP#1| (CDR |generalPred|))
                                      (AND (CONSP |ISTMP#1|)
                                           (PROGN
                                            (SETQ |ISTMP#2| (CAR |ISTMP#1|))
                                            (AND (CONSP |ISTMP#2|)
                                                 (EQ (CAR |ISTMP#2|) 'SPADCALL)
                                                 (PROGN
                                                  (SETQ |ISTMP#3|
                                                          (CDR |ISTMP#2|))
                                                  (AND (CONSP |ISTMP#3|)
                                                       (EQUAL (CAR |ISTMP#3|)
                                                              |sharpArg|)
                                                       (PROGN
                                                        (SETQ |ISTMP#4|
                                                                (CDR
                                                                 |ISTMP#3|))
                                                        (AND (CONSP |ISTMP#4|)
                                                             (PROGN
                                                              (SETQ |m|
                                                                      (CAR
                                                                       |ISTMP#4|))
                                                              (SETQ |ISTMP#5|
                                                                      (CDR
                                                                       |ISTMP#4|))
                                                              (AND
                                                               (CONSP
                                                                |ISTMP#5|)
                                                               (EQ
                                                                (CDR |ISTMP#5|)
                                                                NIL)
                                                               (PROGN
                                                                (SETQ |ISTMP#6|
                                                                        (CAR
                                                                         |ISTMP#5|))
                                                                (AND
                                                                 (CONSP
                                                                  |ISTMP#6|)
                                                                 (EQ
                                                                  (CAR
                                                                   |ISTMP#6|)
                                                                  'ELT)
                                                                 (PROGN
                                                                  (SETQ |ISTMP#7|
                                                                          (CDR
                                                                           |ISTMP#6|))
                                                                  (AND
                                                                   (CONSP
                                                                    |ISTMP#7|)
                                                                   (EQUAL
                                                                    (CAR
                                                                     |ISTMP#7|)
                                                                    |minivectorName|)
                                                                   (PROGN
                                                                    (SETQ |ISTMP#8|
                                                                            (CDR
                                                                             |ISTMP#7|))
                                                                    (AND
                                                                     (CONSP
                                                                      |ISTMP#8|)
                                                                     (EQ
                                                                      (CDR
                                                                       |ISTMP#8|)
                                                                      NIL)
                                                                     (PROGN
                                                                      (SETQ |slot|
                                                                              (CAR
                                                                               |ISTMP#8|))
                                                                      #1#)))))))))))))))
                                           (PROGN
                                            (SETQ |ISTMP#9| (CDR |ISTMP#1|))
                                            (AND (CONSP |ISTMP#9|)
                                                 (EQ (CDR |ISTMP#9|) NIL)
                                                 (PROGN
                                                  (SETQ |ISTMP#10|
                                                          (CAR |ISTMP#9|))
                                                  (AND (CONSP |ISTMP#10|)
                                                       (EQ (CAR |ISTMP#10|)
                                                           'ELT)
                                                       (PROGN
                                                        (SETQ |ISTMP#11|
                                                                (CDR
                                                                 |ISTMP#10|))
                                                        (AND (CONSP |ISTMP#11|)
                                                             (EQUAL
                                                              (CAR |ISTMP#11|)
                                                              |minivectorName|)
                                                             (PROGN
                                                              (SETQ |ISTMP#12|
                                                                      (CDR
                                                                       |ISTMP#11|))
                                                              (AND
                                                               (CONSP
                                                                |ISTMP#12|)
                                                               (EQ
                                                                (CDR
                                                                 |ISTMP#12|)
                                                                NIL)
                                                               (PROGN
                                                                (SETQ |notSlot|
                                                                        (CAR
                                                                         |ISTMP#12|))
                                                                #1#)))))))))))
                                     (EQ |lt_slot| (ELT |$minivector| |slot|))
                                     (EQ |notpSlot|
                                         (ELT |$minivector| |notSlot|)))
                                |m|)
                               ((AND (CONSP |generalPred|)
                                     (EQ (CAR |generalPred|) 'NOT)
                                     (PROGN
                                      (SETQ |ISTMP#1| (CDR |generalPred|))
                                      (AND (CONSP |ISTMP#1|)
                                           (EQ (CDR |ISTMP#1|) NIL)
                                           (PROGN
                                            (SETQ |ISTMP#2| (CAR |ISTMP#1|))
                                            (AND (CONSP |ISTMP#2|)
                                                 (EQ (CAR |ISTMP#2|) 'SPADCALL)
                                                 (PROGN
                                                  (SETQ |ISTMP#3|
                                                          (CDR |ISTMP#2|))
                                                  (AND (CONSP |ISTMP#3|)
                                                       (EQUAL (CAR |ISTMP#3|)
                                                              |sharpArg|)
                                                       (PROGN
                                                        (SETQ |ISTMP#4|
                                                                (CDR
                                                                 |ISTMP#3|))
                                                        (AND (CONSP |ISTMP#4|)
                                                             (PROGN
                                                              (SETQ |m|
                                                                      (CAR
                                                                       |ISTMP#4|))
                                                              (SETQ |ISTMP#5|
                                                                      (CDR
                                                                       |ISTMP#4|))
                                                              (AND
                                                               (CONSP
                                                                |ISTMP#5|)
                                                               (EQ
                                                                (CDR |ISTMP#5|)
                                                                NIL)
                                                               (PROGN
                                                                (SETQ |ISTMP#6|
                                                                        (CAR
                                                                         |ISTMP#5|))
                                                                (AND
                                                                 (CONSP
                                                                  |ISTMP#6|)
                                                                 (EQ
                                                                  (CAR
                                                                   |ISTMP#6|)
                                                                  'ELT)
                                                                 (PROGN
                                                                  (SETQ |ISTMP#7|
                                                                          (CDR
                                                                           |ISTMP#6|))
                                                                  (AND
                                                                   (CONSP
                                                                    |ISTMP#7|)
                                                                   (EQUAL
                                                                    (CAR
                                                                     |ISTMP#7|)
                                                                    |minivectorName|)
                                                                   (PROGN
                                                                    (SETQ |ISTMP#8|
                                                                            (CDR
                                                                             |ISTMP#7|))
                                                                    (AND
                                                                     (CONSP
                                                                      |ISTMP#8|)
                                                                     (EQ
                                                                      (CDR
                                                                       |ISTMP#8|)
                                                                      NIL)
                                                                     (PROGN
                                                                      (SETQ |slot|
                                                                              (CAR
                                                                               |ISTMP#8|))
                                                                      #1#)))))))))))))))))
                                     (EQ |lt_slot| (ELT |$minivector| |slot|)))
                                |m|)
                               (#1# (RETURN NIL))))
                 (COND
                  ((AND (INTEGERP |predOk|) (NOT (EQUAL |predOk| |n|)))
                   (PROGN
                    (|sayKeyedMsg| 'S2IX0006 (LIST |n| |m|))
                    (RETURN NIL)))
                  (#1#
                   (PROGN
                    (SETQ |diffCell|
                            (|compiledLookupCheck| '- '($ $ $) |integer|))
                    (SETQ |diffSlot|
                            (OR
                             ((LAMBDA (|bfVar#31| |i| |bfVar#30| |x|)
                                (LOOP
                                 (COND
                                  ((OR (ATOM |bfVar#30|)
                                       (PROGN (SETQ |x| (CAR |bfVar#30|)) NIL))
                                   (RETURN |bfVar#31|))
                                  (#1#
                                   (AND (EQ |x| |diffCell|)
                                        (PROGN
                                         (SETQ |bfVar#31| |i|)
                                         (COND
                                          (|bfVar#31| (RETURN |bfVar#31|)))))))
                                 (SETQ |i| (+ |i| 1))
                                 (SETQ |bfVar#30| (CDR |bfVar#30|))))
                              NIL 0 |$minivector| NIL)
                             (RETURN NIL)))
                    (SETQ |sharpPosition|
                            (PARSE-INTEGER (SUBSTRING |sharpArg| 1 NIL)))
                    (SETQ |al|
                            (|mkDiffAssoc| |op| |generalTerm| |k|
                             |sharpPosition| |sharpArg| |diffSlot|
                             |minivectorName|))
                    (COND ((NULL |al|) NIL) ((|member| '|$failed| |al|) NIL)
                          (#1#
                           (PROGN
                            (SETQ |body| |generalTerm|)
                            ((LAMBDA (|bfVar#33| |bfVar#32|)
                               (LOOP
                                (COND
                                 ((OR (ATOM |bfVar#33|)
                                      (PROGN
                                       (SETQ |bfVar#32| (CAR |bfVar#33|))
                                       NIL))
                                  (RETURN NIL))
                                 (#1#
                                  (AND (CONSP |bfVar#32|)
                                       (PROGN
                                        (SETQ |a| (CAR |bfVar#32|))
                                        (SETQ |b| (CDR |bfVar#32|))
                                        #1#)
                                       (SETQ |body|
                                               (|substitute| |b| |a|
                                                |body|)))))
                                (SETQ |bfVar#33| (CDR |bfVar#33|))))
                             |al| NIL)
                            (SETQ |result|
                                    (CONS |body|
                                          (CONS |sharpArg|
                                                (CONS (- |n| 1)
                                                      (NREVERSE
                                                       ((LAMBDA
                                                            (|bfVar#35|
                                                             |bfVar#34| |i|)
                                                          (LOOP
                                                           (COND
                                                            ((> |i| |bfVar#34|)
                                                             (RETURN
                                                              (NREVERSE
                                                               |bfVar#35|)))
                                                            (#1#
                                                             (SETQ |bfVar#35|
                                                                     (CONS
                                                                      (OR
                                                                       (LASSOC
                                                                        |i|
                                                                        |initList|)
                                                                       (|systemErrorHere|
                                                                        "NRTisRecurrenceRelation"))
                                                                      |bfVar#35|))))
                                                           (SETQ |i|
                                                                   (+ |i| 1))))
                                                        NIL (- |n| 1)
                                                        |minIndex|)))))))))))))))))))))))))))
 
; mkDiffAssoc(op,body,k,sharpPosition,sharpArg,diffSlot,vecname) ==
;   -- returns alist which should not have any entries = $failed
;   -- form substitution list of the form:
;   -- ( ((f (,DIFFERENCE #1 1)) . #2) ((f (,DIFFERENCE #1 2)) . #3) ...)
;   --   but also checking that all difference values lie in 1..k
;   atom body => nil
;   body is ['COND,:pl] =>
;     "union"/[mkDiffAssoc(op,c,k,sharpPosition,sharpArg,diffSlot,vecname) for [p,c] in pl]
;   body is [fn,:argl] =>
;     (fn = op) and argl.(sharpPosition-1) is
;       ['SPADCALL,=sharpArg,n,['ELT,=vecname,=diffSlot]] =>
;           NUMBERP n and n > 0 and n <= k =>
;             [[body,:$TriangleVariableList.n]]
;           ['$failed]
;     "union"/[mkDiffAssoc(op,x,k,sharpPosition,sharpArg,diffSlot,vecname) for x in argl]
;   systemErrorHere '"mkDiffAssoc"
 
(DEFUN |mkDiffAssoc|
       (|op| |body| |k| |sharpPosition| |sharpArg| |diffSlot| |vecname|)
  (PROG (|pl| |p| |ISTMP#1| |c| |fn| |argl| |ISTMP#2| |ISTMP#3| |n| |ISTMP#4|
         |ISTMP#5| |ISTMP#6| |ISTMP#7|)
    (RETURN
     (COND ((ATOM |body|) NIL)
           ((AND (CONSP |body|) (EQ (CAR |body|) 'COND)
                 (PROGN (SETQ |pl| (CDR |body|)) #1='T))
            ((LAMBDA (|bfVar#38| |bfVar#37| |bfVar#36|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#37|)
                      (PROGN (SETQ |bfVar#36| (CAR |bfVar#37|)) NIL))
                  (RETURN |bfVar#38|))
                 (#1#
                  (AND (CONSP |bfVar#36|)
                       (PROGN
                        (SETQ |p| (CAR |bfVar#36|))
                        (SETQ |ISTMP#1| (CDR |bfVar#36|))
                        (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                             (PROGN (SETQ |c| (CAR |ISTMP#1|)) #1#)))
                       (SETQ |bfVar#38|
                               (|union| |bfVar#38|
                                (|mkDiffAssoc| |op| |c| |k| |sharpPosition|
                                 |sharpArg| |diffSlot| |vecname|))))))
                (SETQ |bfVar#37| (CDR |bfVar#37|))))
             NIL |pl| NIL))
           ((AND (CONSP |body|)
                 (PROGN
                  (SETQ |fn| (CAR |body|))
                  (SETQ |argl| (CDR |body|))
                  #1#))
            (COND
             ((AND (EQUAL |fn| |op|)
                   (PROGN
                    (SETQ |ISTMP#1| (ELT |argl| (- |sharpPosition| 1)))
                    (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) 'SPADCALL)
                         (PROGN
                          (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                          (AND (CONSP |ISTMP#2|)
                               (EQUAL (CAR |ISTMP#2|) |sharpArg|)
                               (PROGN
                                (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                                (AND (CONSP |ISTMP#3|)
                                     (PROGN
                                      (SETQ |n| (CAR |ISTMP#3|))
                                      (SETQ |ISTMP#4| (CDR |ISTMP#3|))
                                      (AND (CONSP |ISTMP#4|)
                                           (EQ (CDR |ISTMP#4|) NIL)
                                           (PROGN
                                            (SETQ |ISTMP#5| (CAR |ISTMP#4|))
                                            (AND (CONSP |ISTMP#5|)
                                                 (EQ (CAR |ISTMP#5|) 'ELT)
                                                 (PROGN
                                                  (SETQ |ISTMP#6|
                                                          (CDR |ISTMP#5|))
                                                  (AND (CONSP |ISTMP#6|)
                                                       (EQUAL (CAR |ISTMP#6|)
                                                              |vecname|)
                                                       (PROGN
                                                        (SETQ |ISTMP#7|
                                                                (CDR
                                                                 |ISTMP#6|))
                                                        (AND (CONSP |ISTMP#7|)
                                                             (EQ
                                                              (CDR |ISTMP#7|)
                                                              NIL)
                                                             (EQUAL
                                                              (CAR |ISTMP#7|)
                                                              |diffSlot|))))))))))))))))
              (COND
               ((AND (NUMBERP |n|) (< 0 |n|) (NOT (< |k| |n|)))
                (LIST (CONS |body| (ELT |$TriangleVariableList| |n|))))
               (#1# (LIST '|$failed|))))
             (#1#
              ((LAMBDA (|bfVar#40| |bfVar#39| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#39|)
                        (PROGN (SETQ |x| (CAR |bfVar#39|)) NIL))
                    (RETURN |bfVar#40|))
                   (#1#
                    (SETQ |bfVar#40|
                            (|union| |bfVar#40|
                             (|mkDiffAssoc| |op| |x| |k| |sharpPosition|
                              |sharpArg| |diffSlot| |vecname|)))))
                  (SETQ |bfVar#39| (CDR |bfVar#39|))))
               NIL |argl| NIL))))
           (#1# (|systemErrorHere| "mkDiffAssoc"))))))
