 
; )package "BOOT"
 
(IN-PACKAGE "BOOT")
 
; NRTaddDeltaCode() ==
; --NOTES: This function is called from NRTbuildFunctor to initially
; --  fill slots in $template. The $template so created is stored in the
; --  NRLIB. On load, makeDomainTemplate is called on this $template to
; --  create a template which becomes slot 0 of the infovec for the constructor.
; --The template has 6 kinds of entries:
; --  (1) formal arguments and local variables, represented by (QUOTE <entry>)
; --      this conflicts by (5) but is ok since each is explicitly set by
; --      instantiator code;
; --  (2) domains, represented by lazy forms, e.g. (Foo 12 17 6)
; --  (3) latch slots, represented SPADCALLable forms which goGet an operation
; --      from a domain then cache the operation in the same slot
; --  (4) functions, represented by identifiers which are names of functions
; --  (5) identifiers/strings, parts of signatures (now parts of signatures
; --      now must all have slot numbers, represented by (QUOTE <entry>)
; --  (6) constants, like 0 and 1, represented by (CONS .. ) form
;   kvec := first $catvecList
;   for i in $NRTbase.. for item in REVERSE $NRTdeltaList
;     for compItem in REVERSE $NRTdeltaListComp
;       |null (s:=kvec.i) repeat
;         $template.i:= deltaTran(item,compItem)
;   $template.5 :=
;     $NRTaddForm =>
;       $NRTaddForm is ["@Tuple", :y] => NREVERSE y
;       NRTencode($NRTaddForm,$addForm)
;     nil
 
(DEFUN |NRTaddDeltaCode| ()
  (PROG (|y| |s| |kvec|)
    (RETURN
     (PROGN
      (SETQ |kvec| (CAR |$catvecList|))
      ((LAMBDA (|i| |bfVar#1| |item| |bfVar#2| |compItem|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#1|) (PROGN (SETQ |item| (CAR |bfVar#1|)) NIL)
                (ATOM |bfVar#2|) (PROGN (SETQ |compItem| (CAR |bfVar#2|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (NULL (SETQ |s| (ELT |kvec| |i|)))
                 (SETF (ELT |$template| |i|)
                         (|deltaTran| |item| |compItem|)))))
          (SETQ |i| (+ |i| 1))
          (SETQ |bfVar#1| (CDR |bfVar#1|))
          (SETQ |bfVar#2| (CDR |bfVar#2|))))
       |$NRTbase| (REVERSE |$NRTdeltaList|) NIL (REVERSE |$NRTdeltaListComp|)
       NIL)
      (SETF (ELT |$template| 5)
              (COND
               (|$NRTaddForm|
                (COND
                 ((AND (CONSP |$NRTaddForm|) (EQ (CAR |$NRTaddForm|) '|@Tuple|)
                       (PROGN (SETQ |y| (CDR |$NRTaddForm|)) #1#))
                  (NREVERSE |y|))
                 (#1# (|NRTencode| |$NRTaddForm| |$addForm|))))
               (#1# NIL)))))))
 
; deltaTran(item,compItem) ==
;   item is ['domain,lhs,:.] => NRTencode(lhs,compItem)
;   --NOTE: all items but signatures are wrapped with domain forms
;   [op,:modemap] := item
;   [dcSig,[.,[kind,:.]]] := modemap
;   [dc,:sig] := dcSig
;   sig := substitute('$,dc,substitute("$$",'$,sig))
;   dcCode :=
;     dc = '$ => 0
;     NRTassocIndex dc or keyedSystemError("S2NR0004",[dc])
;   formalSig:= SUBLISLIS($FormalMapVariableList,$formalArgList,sig)
;   kindFlag:= (kind = 'CONST => 'CONST; nil)
;   newSig := [NRTassocIndex x or x for x in formalSig]
;   [newSig,dcCode,op,:kindFlag]
 
(DEFUN |deltaTran| (|item| |compItem|)
  (PROG (|ISTMP#1| |lhs| |op| |modemap| |dcSig| |kind| |dc| |sig| |dcCode|
         |formalSig| |kindFlag| |newSig|)
    (RETURN
     (COND
      ((AND (CONSP |item|) (EQ (CAR |item|) '|domain|)
            (PROGN
             (SETQ |ISTMP#1| (CDR |item|))
             (AND (CONSP |ISTMP#1|)
                  (PROGN (SETQ |lhs| (CAR |ISTMP#1|)) #1='T))))
       (|NRTencode| |lhs| |compItem|))
      (#1#
       (PROGN
        (SETQ |op| (CAR |item|))
        (SETQ |modemap| (CDR |item|))
        (SETQ |dcSig| (CAR |modemap|))
        (SETQ |kind| (CAR (CADADR |modemap|)))
        (SETQ |dc| (CAR |dcSig|))
        (SETQ |sig| (CDR |dcSig|))
        (SETQ |sig| (|substitute| '$ |dc| (|substitute| '$$ '$ |sig|)))
        (SETQ |dcCode|
                (COND ((EQ |dc| '$) 0)
                      (#1#
                       (OR (|NRTassocIndex| |dc|)
                           (|keyedSystemError| 'S2NR0004 (LIST |dc|))))))
        (SETQ |formalSig|
                (SUBLISLIS |$FormalMapVariableList| |$formalArgList| |sig|))
        (SETQ |kindFlag| (COND ((EQ |kind| 'CONST) 'CONST) (#1# NIL)))
        (SETQ |newSig|
                ((LAMBDA (|bfVar#4| |bfVar#3| |x|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#3|)
                          (PROGN (SETQ |x| (CAR |bfVar#3|)) NIL))
                      (RETURN (NREVERSE |bfVar#4|)))
                     (#1#
                      (SETQ |bfVar#4|
                              (CONS (OR (|NRTassocIndex| |x|) |x|)
                                    |bfVar#4|))))
                    (SETQ |bfVar#3| (CDR |bfVar#3|))))
                 NIL |formalSig| NIL))
        (CONS |newSig| (CONS |dcCode| (CONS |op| |kindFlag|)))))))))
 
; NRTreplaceAllLocalReferences(form) ==
;   $devaluateList :local := []
;   NRTputInLocalReferences form
 
(DEFUN |NRTreplaceAllLocalReferences| (|form|)
  (PROG (|$devaluateList|)
    (DECLARE (SPECIAL |$devaluateList|))
    (RETURN
     (PROGN (SETQ |$devaluateList| NIL) (|NRTputInLocalReferences| |form|)))))
 
; NRTencode(x,y) == encode(x,y,true) where encode(x,compForm,firstTime) ==
;   --converts a domain form to a lazy domain form; everything other than
;   --the operation name should be assigned a slot
;   null firstTime and (k:= NRTassocIndex x) => k
;   VECP x => systemErrorHere '"NRTencode"
;   PAIRP x =>
;     QCAR x='Record or x is ['Union,['_:,a,b],:.] =>
;       [QCAR x,:[['_:,a,encode(b,c,false)]
;         for [., a, b] in QCDR x for [., =a, c] in rest compForm]]
;     constructor? QCAR x or MEMQ(QCAR x,'(Union Mapping)) =>
;       [QCAR x, :[encode(y, z, false) for y in QCDR x for z in rest compForm]]
;     ['NRTEVAL,NRTreplaceAllLocalReferences COPY_-TREE lispize compForm]
;   MEMQ(x,$formalArgList) =>
;     v := $FormalMapVariableList.(POSN1(x,$formalArgList))
;     firstTime => ['local,v]
;     v
;   x = '$ => x
;   x = "$$" => x
;   ['QUOTE,x]
 
(DEFUN |NRTencode| (|x| |y|) (PROG () (RETURN (|NRTencode,encode| |x| |y| T))))
(DEFUN |NRTencode,encode| (|x| |compForm| |firstTime|)
  (PROG (|k| |ISTMP#1| |ISTMP#2| |ISTMP#3| |a| |ISTMP#4| |b| |c| |v|)
    (RETURN
     (COND ((AND (NULL |firstTime|) (SETQ |k| (|NRTassocIndex| |x|))) |k|)
           ((VECP |x|) (|systemErrorHere| "NRTencode"))
           ((CONSP |x|)
            (COND
             ((OR (EQ (QCAR |x|) '|Record|)
                  (AND (CONSP |x|) (EQ (CAR |x|) '|Union|)
                       (PROGN
                        (SETQ |ISTMP#1| (CDR |x|))
                        (AND (CONSP |ISTMP#1|)
                             (PROGN
                              (SETQ |ISTMP#2| (CAR |ISTMP#1|))
                              (AND (CONSP |ISTMP#2|) (EQ (CAR |ISTMP#2|) '|:|)
                                   (PROGN
                                    (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                                    (AND (CONSP |ISTMP#3|)
                                         (PROGN
                                          (SETQ |a| (CAR |ISTMP#3|))
                                          (SETQ |ISTMP#4| (CDR |ISTMP#3|))
                                          (AND (CONSP |ISTMP#4|)
                                               (EQ (CDR |ISTMP#4|) NIL)
                                               (PROGN
                                                (SETQ |b| (CAR |ISTMP#4|))
                                                #1='T)))))))))))
              (CONS (QCAR |x|)
                    ((LAMBDA
                         (|bfVar#9| |bfVar#6| |bfVar#5| |bfVar#8| |bfVar#7|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#6|)
                              (PROGN (SETQ |bfVar#5| (CAR |bfVar#6|)) NIL)
                              (ATOM |bfVar#8|)
                              (PROGN (SETQ |bfVar#7| (CAR |bfVar#8|)) NIL))
                          (RETURN (NREVERSE |bfVar#9|)))
                         (#1#
                          (AND (CONSP |bfVar#5|)
                               (PROGN
                                (SETQ |ISTMP#1| (CDR |bfVar#5|))
                                (AND (CONSP |ISTMP#1|)
                                     (PROGN
                                      (SETQ |a| (CAR |ISTMP#1|))
                                      (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                      (AND (CONSP |ISTMP#2|)
                                           (EQ (CDR |ISTMP#2|) NIL)
                                           (PROGN
                                            (SETQ |b| (CAR |ISTMP#2|))
                                            #1#)))))
                               (CONSP |bfVar#7|)
                               (PROGN
                                (SETQ |ISTMP#1| (CDR |bfVar#7|))
                                (AND (CONSP |ISTMP#1|)
                                     (EQUAL (CAR |ISTMP#1|) |a|)
                                     (PROGN
                                      (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                      (AND (CONSP |ISTMP#2|)
                                           (EQ (CDR |ISTMP#2|) NIL)
                                           (PROGN
                                            (SETQ |c| (CAR |ISTMP#2|))
                                            #1#)))))
                               (SETQ |bfVar#9|
                                       (CONS
                                        (LIST '|:| |a|
                                              (|NRTencode,encode| |b| |c| NIL))
                                        |bfVar#9|)))))
                        (SETQ |bfVar#6| (CDR |bfVar#6|))
                        (SETQ |bfVar#8| (CDR |bfVar#8|))))
                     NIL (QCDR |x|) NIL (CDR |compForm|) NIL)))
             ((OR (|constructor?| (QCAR |x|))
                  (MEMQ (QCAR |x|) '(|Union| |Mapping|)))
              (CONS (QCAR |x|)
                    ((LAMBDA (|bfVar#12| |bfVar#10| |y| |bfVar#11| |z|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#10|)
                              (PROGN (SETQ |y| (CAR |bfVar#10|)) NIL)
                              (ATOM |bfVar#11|)
                              (PROGN (SETQ |z| (CAR |bfVar#11|)) NIL))
                          (RETURN (NREVERSE |bfVar#12|)))
                         (#1#
                          (SETQ |bfVar#12|
                                  (CONS (|NRTencode,encode| |y| |z| NIL)
                                        |bfVar#12|))))
                        (SETQ |bfVar#10| (CDR |bfVar#10|))
                        (SETQ |bfVar#11| (CDR |bfVar#11|))))
                     NIL (QCDR |x|) NIL (CDR |compForm|) NIL)))
             (#1#
              (LIST 'NRTEVAL
                    (|NRTreplaceAllLocalReferences|
                     (COPY-TREE (|lispize| |compForm|)))))))
           ((MEMQ |x| |$formalArgList|)
            (PROGN
             (SETQ |v|
                     (ELT |$FormalMapVariableList|
                          (POSN1 |x| |$formalArgList|)))
             (COND (|firstTime| (LIST '|local| |v|)) (#1# |v|))))
           ((EQ |x| '$) |x|) ((EQ |x| '$$) |x|) (#1# (LIST 'QUOTE |x|))))))
 
; listOfBoundVars form ==
; -- Only called from the function genDeltaEntry below
;   form = '$ => []
;   IDENTP form and (u:=get(form,'value,$e)) =>
;     u:=u.expr
;     MEMQ(IFCAR u, '(Union Record)) => listOfBoundVars u
;     [form]
;   atom form => []
;   first form = 'QUOTE => []
;   EQ(first form, ":") => listOfBoundVars CADDR form
;   -- We don't want to pick up the tag, only the domain
;   "union"/[listOfBoundVars x for x in rest form]
 
(DEFUN |listOfBoundVars| (|form|)
  (PROG (|u|)
    (RETURN
     (COND ((EQ |form| '$) NIL)
           ((AND (IDENTP |form|) (SETQ |u| (|get| |form| '|value| |$e|)))
            (PROGN
             (SETQ |u| (CAR |u|))
             (COND
              ((MEMQ (IFCAR |u|) '(|Union| |Record|)) (|listOfBoundVars| |u|))
              (#1='T (LIST |form|)))))
           ((ATOM |form|) NIL) ((EQ (CAR |form|) 'QUOTE) NIL)
           ((EQ (CAR |form|) '|:|) (|listOfBoundVars| (CADDR |form|)))
           (#1#
            ((LAMBDA (|bfVar#14| |bfVar#13| |x|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#13|)
                      (PROGN (SETQ |x| (CAR |bfVar#13|)) NIL))
                  (RETURN |bfVar#14|))
                 (#1#
                  (SETQ |bfVar#14|
                          (|union| |bfVar#14| (|listOfBoundVars| |x|)))))
                (SETQ |bfVar#13| (CDR |bfVar#13|))))
             NIL (CDR |form|) NIL))))))
 
; optDeltaEntry(op,sig,dc,eltOrConst) ==
;   $killOptimizeIfTrue = true => nil
;   $bootstrapDomains = true =>
;     nil
;   ndc :=
;     dc = '$ => $functorForm
;     atom dc and (dcval := get(dc,'value,$e)) => dcval.expr
;     dc
;   sig := substitute(ndc, dc, sig)
;   not MEMQ(IFCAR ndc, $optimizableConstructorNames) => nil
;   dcval := optCallEval ndc
;   -- substitute guarantees to use EQUAL testing
;   sig := substitute(devaluate dcval, ndc, sig)
;   if rest ndc then
;      for new in rest devaluate dcval for old in rest ndc repeat
;        sig := substitute(new, old, sig)
;      -- optCallEval sends (List X) to (List (Integer)) etc,
;      -- so we should make the same transformation
;   fn := compiledLookup(op,sig,dcval)
;   if null fn then
;     -- following code is to handle selectors like first, rest
;      nsig := [quoteSelector tt for tt in sig] where
;        quoteSelector(x) ==
;          not(IDENTP x) => x
;          get(x,'value,$e) => x
;          x='$ => x
;          MKQ x
;      fn := compiledLookup(op,nsig,dcval)
;      if null fn then return nil
;   eltOrConst="CONST" => ['XLAM,'ignore,MKQ SPADCALL fn]
;   GETL(compileTimeBindingOf first fn,'SPADreplace)
 
(DEFUN |optDeltaEntry| (|op| |sig| |dc| |eltOrConst|)
  (PROG (|dcval| |ndc| |fn| |nsig|)
    (RETURN
     (COND ((EQUAL |$killOptimizeIfTrue| T) NIL)
           ((EQUAL |$bootstrapDomains| T) NIL)
           (#1='T
            (PROGN
             (SETQ |ndc|
                     (COND ((EQ |dc| '$) |$functorForm|)
                           ((AND (ATOM |dc|)
                                 (SETQ |dcval| (|get| |dc| '|value| |$e|)))
                            (CAR |dcval|))
                           (#1# |dc|)))
             (SETQ |sig| (|substitute| |ndc| |dc| |sig|))
             (COND
              ((NULL (MEMQ (IFCAR |ndc|) |$optimizableConstructorNames|)) NIL)
              (#1#
               (PROGN
                (SETQ |dcval| (|optCallEval| |ndc|))
                (SETQ |sig| (|substitute| (|devaluate| |dcval|) |ndc| |sig|))
                (COND
                 ((CDR |ndc|)
                  ((LAMBDA (|bfVar#15| |new| |bfVar#16| |old|)
                     (LOOP
                      (COND
                       ((OR (ATOM |bfVar#15|)
                            (PROGN (SETQ |new| (CAR |bfVar#15|)) NIL)
                            (ATOM |bfVar#16|)
                            (PROGN (SETQ |old| (CAR |bfVar#16|)) NIL))
                        (RETURN NIL))
                       (#1# (SETQ |sig| (|substitute| |new| |old| |sig|))))
                      (SETQ |bfVar#15| (CDR |bfVar#15|))
                      (SETQ |bfVar#16| (CDR |bfVar#16|))))
                   (CDR (|devaluate| |dcval|)) NIL (CDR |ndc|) NIL)))
                (SETQ |fn| (|compiledLookup| |op| |sig| |dcval|))
                (COND
                 ((NULL |fn|)
                  (SETQ |nsig|
                          ((LAMBDA (|bfVar#18| |bfVar#17| |tt|)
                             (LOOP
                              (COND
                               ((OR (ATOM |bfVar#17|)
                                    (PROGN (SETQ |tt| (CAR |bfVar#17|)) NIL))
                                (RETURN (NREVERSE |bfVar#18|)))
                               (#1#
                                (SETQ |bfVar#18|
                                        (CONS
                                         (|optDeltaEntry,quoteSelector| |tt|)
                                         |bfVar#18|))))
                              (SETQ |bfVar#17| (CDR |bfVar#17|))))
                           NIL |sig| NIL))
                  (SETQ |fn| (|compiledLookup| |op| |nsig| |dcval|))
                  (COND ((NULL |fn|) (RETURN NIL)))))
                (COND
                 ((EQ |eltOrConst| 'CONST)
                  (LIST 'XLAM '|ignore| (MKQ (SPADCALL |fn|))))
                 (#1#
                  (GETL (|compileTimeBindingOf| (CAR |fn|))
                   '|SPADreplace|))))))))))))
(DEFUN |optDeltaEntry,quoteSelector| (|x|)
  (PROG ()
    (RETURN
     (COND ((NULL (IDENTP |x|)) |x|) ((|get| |x| '|value| |$e|) |x|)
           ((EQ |x| '$) |x|) ('T (MKQ |x|))))))
 
; genDeltaEntry opMmPair ==
; --called from compApplyModemap
; --$NRTdeltaLength=0.. always equals length of $NRTdeltaList
;   [op,[dc,:sig],[.,cform:=[eltOrConst,.,nsig]]] := opMmPair
;   if $profileCompiler = true then profileRecord(dc,op,sig)
;   eltOrConst = 'XLAM => cform
;   if eltOrConst = 'Subsumed then eltOrConst := 'ELT
;   if atom dc then
;     dc = "$" => nsig := sig
;     if NUMBERP nsig then nsig := substitute('$,dc,substitute("$$","$",sig))
;     -- following hack needed to invert Rep to $ substitution
; --  if odc = 'Rep and cform is [.,.,osig] then sig:=osig
;   newimp := optDeltaEntry(op,nsig,dc,eltOrConst) => newimp
;   setDifference(listOfBoundVars dc,$functorLocalParameters) ~= [] =>
;     ['applyFun,['compiledLookupCheck,MKQ op,
;          mkList consSig(nsig,dc),consDomainForm(dc,nil)]]
;   odc := dc
;   if null atom dc then dc := substitute("$$",'$,dc)
;  --   sig := substitute('$,dc,sig)
;  --   cform := substitute('$,dc,cform)
;   opModemapPair :=
;     [op,[dc,:[genDeltaSig x for x in nsig]],['T,cform]] -- force pred to T
;   if null NRTassocIndex dc and dc ~= $NRTaddForm and
;     (member(dc,$functorLocalParameters) or null atom dc) then
;     --create "domain" entry to $NRTdeltaList
;       $NRTdeltaList:= [['domain,NRTaddInner dc,:dc],:$NRTdeltaList]
;       saveNRTdeltaListComp:= $NRTdeltaListComp:=[nil,:$NRTdeltaListComp]
;       $NRTdeltaLength := $NRTdeltaLength+1
;       compEntry := (compOrCroak(odc, $EmptyMode, $e)).expr
;       RPLACA(saveNRTdeltaListComp,compEntry)
;   u :=
;     [eltOrConst,'$,$NRTbase+$NRTdeltaLength-index] where index ==
;       (n:= POSN1(opModemapPair,$NRTdeltaList)) => n + 1
;         --n + 1 since $NRTdeltaLength is 1 too large
;       $NRTdeltaList:= [opModemapPair,:$NRTdeltaList]
;       $NRTdeltaListComp:=[nil,:$NRTdeltaListComp]
;       $NRTdeltaLength := $NRTdeltaLength+1
;       0
;   u
 
(DEFUN |genDeltaEntry| (|opMmPair|)
  (PROG (|op| |dc| |sig| |cform| |eltOrConst| |nsig| |newimp| |odc|
         |opModemapPair| |saveNRTdeltaListComp| |compEntry| |n| |u|)
    (RETURN
     (PROGN
      (SETQ |op| (CAR |opMmPair|))
      (SETQ |dc| (CAADR . #1=(|opMmPair|)))
      (SETQ |sig| (CDADR . #1#))
      (SETQ |cform| (CAR . #2=((CDADDR . #1#))))
      (SETQ |eltOrConst| (CAAR . #2#))
      (SETQ |nsig| (CADDAR . #2#))
      (COND ((EQUAL |$profileCompiler| T) (|profileRecord| |dc| |op| |sig|)))
      (COND ((EQ |eltOrConst| 'XLAM) |cform|)
            (#3='T
             (PROGN
              (COND ((EQ |eltOrConst| '|Subsumed|) (SETQ |eltOrConst| 'ELT)))
              (COND
               ((ATOM |dc|)
                (COND ((EQ |dc| '$) (SETQ |nsig| |sig|))
                      (#3#
                       (COND
                        ((NUMBERP |nsig|)
                         (SETQ |nsig|
                                 (|substitute| '$ |dc|
                                  (|substitute| '$$ '$ |sig|)))))))))
              (COND
               ((SETQ |newimp| (|optDeltaEntry| |op| |nsig| |dc| |eltOrConst|))
                |newimp|)
               ((SETDIFFERENCE (|listOfBoundVars| |dc|)
                               |$functorLocalParameters|)
                (LIST '|applyFun|
                      (LIST '|compiledLookupCheck| (MKQ |op|)
                            (|mkList| (|consSig| |nsig| |dc|))
                            (|consDomainForm| |dc| NIL))))
               (#3#
                (PROGN
                 (SETQ |odc| |dc|)
                 (COND
                  ((NULL (ATOM |dc|)) (SETQ |dc| (|substitute| '$$ '$ |dc|))))
                 (SETQ |opModemapPair|
                         (LIST |op|
                               (CONS |dc|
                                     ((LAMBDA (|bfVar#20| |bfVar#19| |x|)
                                        (LOOP
                                         (COND
                                          ((OR (ATOM |bfVar#19|)
                                               (PROGN
                                                (SETQ |x| (CAR |bfVar#19|))
                                                NIL))
                                           (RETURN (NREVERSE |bfVar#20|)))
                                          (#3#
                                           (SETQ |bfVar#20|
                                                   (CONS (|genDeltaSig| |x|)
                                                         |bfVar#20|))))
                                         (SETQ |bfVar#19| (CDR |bfVar#19|))))
                                      NIL |nsig| NIL))
                               (LIST 'T |cform|)))
                 (COND
                  ((AND (NULL (|NRTassocIndex| |dc|))
                        (NOT (EQUAL |dc| |$NRTaddForm|))
                        (OR (|member| |dc| |$functorLocalParameters|)
                            (NULL (ATOM |dc|))))
                   (SETQ |$NRTdeltaList|
                           (CONS
                            (CONS '|domain| (CONS (|NRTaddInner| |dc|) |dc|))
                            |$NRTdeltaList|))
                   (SETQ |saveNRTdeltaListComp|
                           (SETQ |$NRTdeltaListComp|
                                   (CONS NIL |$NRTdeltaListComp|)))
                   (SETQ |$NRTdeltaLength| (+ |$NRTdeltaLength| 1))
                   (SETQ |compEntry|
                           (CAR (|compOrCroak| |odc| |$EmptyMode| |$e|)))
                   (RPLACA |saveNRTdeltaListComp| |compEntry|)))
                 (SETQ |u|
                         (LIST |eltOrConst| '$
                               (- (+ |$NRTbase| |$NRTdeltaLength|)
                                  (COND
                                   ((SETQ |n|
                                            (POSN1 |opModemapPair|
                                             |$NRTdeltaList|))
                                    (+ |n| 1))
                                   (#3#
                                    (PROGN
                                     (SETQ |$NRTdeltaList|
                                             (CONS |opModemapPair|
                                                   |$NRTdeltaList|))
                                     (SETQ |$NRTdeltaListComp|
                                             (CONS NIL |$NRTdeltaListComp|))
                                     (SETQ |$NRTdeltaLength|
                                             (+ |$NRTdeltaLength| 1))
                                     0))))))
                 |u|))))))))))
 
; genDeltaSig x ==
;   NRTgetLocalIndex x
 
(DEFUN |genDeltaSig| (|x|) (PROG () (RETURN (|NRTgetLocalIndex| |x|))))
 
; NRTassocIndex x == --returns index of "domain" entry x in al
;   NULL x => x
;   x = $NRTaddForm => 5
;   k := or/[i for i in 1.. for y in $NRTdeltaList
;             | first(y) = 'domain and NTH(1, y) = x] =>
;     $NRTbase + $NRTdeltaLength - k
;   nil
 
(DEFUN |NRTassocIndex| (|x|)
  (PROG (|k|)
    (RETURN
     (COND ((NULL |x|) |x|) ((EQUAL |x| |$NRTaddForm|) 5)
           ((SETQ |k|
                    ((LAMBDA (|bfVar#22| |i| |bfVar#21| |y|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#21|)
                              (PROGN (SETQ |y| (CAR |bfVar#21|)) NIL))
                          (RETURN |bfVar#22|))
                         (#1='T
                          (AND (EQ (CAR |y|) '|domain|) (EQUAL (NTH 1 |y|) |x|)
                               (PROGN
                                (SETQ |bfVar#22| |i|)
                                (COND (|bfVar#22| (RETURN |bfVar#22|)))))))
                        (SETQ |i| (+ |i| 1))
                        (SETQ |bfVar#21| (CDR |bfVar#21|))))
                     NIL 1 |$NRTdeltaList| NIL))
            (- (+ |$NRTbase| |$NRTdeltaLength|) |k|))
           (#1# NIL)))))
 
; NRTgetLocalIndex(item) ==
;   k := NRTassocIndex item => k
;   item = $NRTaddForm => 5
;   item = '$ => 0
;   item = '_$_$ => 2
;   value:=
;     MEMQ(item,$formalArgList) => item
;     nil
;   atom item and null MEMQ(item,'($ _$_$))
;    and null value =>  --give slots to atoms
;     $NRTdeltaList:= [['domain,NRTaddInner item,:value],:$NRTdeltaList]
;     $NRTdeltaListComp:=[item,:$NRTdeltaListComp]
;     $NRTdeltaLength := $NRTdeltaLength+1
;     $NRTbase + $NRTdeltaLength - 1
;   $NRTdeltaList:= [['domain,NRTaddInner item,:value],:$NRTdeltaList]
;   saveNRTdeltaListComp:= $NRTdeltaListComp:=[nil,:$NRTdeltaListComp]
;   saveIndex := $NRTbase + $NRTdeltaLength
;   $NRTdeltaLength := $NRTdeltaLength+1
;   compEntry := comp_delta_entry(item)
;   RPLACA(saveNRTdeltaListComp,compEntry)
;   saveIndex
 
(DEFUN |NRTgetLocalIndex| (|item|)
  (PROG (|k| |value| |saveNRTdeltaListComp| |saveIndex| |compEntry|)
    (RETURN
     (COND ((SETQ |k| (|NRTassocIndex| |item|)) |k|)
           ((EQUAL |item| |$NRTaddForm|) 5) ((EQ |item| '$) 0)
           ((EQ |item| '$$) 2)
           (#1='T
            (PROGN
             (SETQ |value|
                     (COND ((MEMQ |item| |$formalArgList|) |item|) (#1# NIL)))
             (COND
              ((AND (ATOM |item|) (NULL (MEMQ |item| '($ $$))) (NULL |value|))
               (PROGN
                (SETQ |$NRTdeltaList|
                        (CONS
                         (CONS '|domain| (CONS (|NRTaddInner| |item|) |value|))
                         |$NRTdeltaList|))
                (SETQ |$NRTdeltaListComp| (CONS |item| |$NRTdeltaListComp|))
                (SETQ |$NRTdeltaLength| (+ |$NRTdeltaLength| 1))
                (- (+ |$NRTbase| |$NRTdeltaLength|) 1)))
              (#1#
               (PROGN
                (SETQ |$NRTdeltaList|
                        (CONS
                         (CONS '|domain| (CONS (|NRTaddInner| |item|) |value|))
                         |$NRTdeltaList|))
                (SETQ |saveNRTdeltaListComp|
                        (SETQ |$NRTdeltaListComp|
                                (CONS NIL |$NRTdeltaListComp|)))
                (SETQ |saveIndex| (+ |$NRTbase| |$NRTdeltaLength|))
                (SETQ |$NRTdeltaLength| (+ |$NRTdeltaLength| 1))
                (SETQ |compEntry| (|comp_delta_entry| |item|))
                (RPLACA |saveNRTdeltaListComp| |compEntry|)
                |saveIndex|)))))))))
 
; DEFVAR($generatingCall, nil)
 
(DEFVAR |$generatingCall| NIL)
 
; comp_delta_entry(item) ==
;     $generatingCall and cheap_comp_delta_entry(item) => item
;     (compOrCroak(item, $EmptyMode, $e)).expr
 
(DEFUN |comp_delta_entry| (|item|)
  (PROG ()
    (RETURN
     (COND ((AND |$generatingCall| (|cheap_comp_delta_entry| |item|)) |item|)
           ('T (CAR (|compOrCroak| |item| |$EmptyMode| |$e|)))))))
 
; cheap_comp_delta_entry(item) ==
;     item is [op, :args] =>
;         not(ATOM(op)) => false
;         null(cosig := GETDATABASE(op, 'COSIG)) => false
;         ok := true
;         for arg in args for tp in rest(cosig) while ok repeat
;             ok :=
;                 not(tp) => false
;                 arg = '$ => true
;                 MEMBER(arg, $functorLocalParameters) => true
;                 cheap_comp_delta_entry(arg)
;         ok
;     false
 
(DEFUN |cheap_comp_delta_entry| (|item|)
  (PROG (|op| |args| |cosig| |ok|)
    (RETURN
     (COND
      ((AND (CONSP |item|)
            (PROGN (SETQ |op| (CAR |item|)) (SETQ |args| (CDR |item|)) #1='T))
       (COND ((NULL (ATOM |op|)) NIL)
             ((NULL (SETQ |cosig| (GETDATABASE |op| 'COSIG))) NIL)
             (#1#
              (PROGN
               (SETQ |ok| T)
               ((LAMBDA (|bfVar#23| |arg| |bfVar#24| |tp|)
                  (LOOP
                   (COND
                    ((OR (ATOM |bfVar#23|)
                         (PROGN (SETQ |arg| (CAR |bfVar#23|)) NIL)
                         (ATOM |bfVar#24|)
                         (PROGN (SETQ |tp| (CAR |bfVar#24|)) NIL) (NOT |ok|))
                     (RETURN NIL))
                    (#1#
                     (SETQ |ok|
                             (COND ((NULL |tp|) NIL) ((EQ |arg| '$) T)
                                   ((MEMBER |arg| |$functorLocalParameters|) T)
                                   (#1# (|cheap_comp_delta_entry| |arg|))))))
                   (SETQ |bfVar#23| (CDR |bfVar#23|))
                   (SETQ |bfVar#24| (CDR |bfVar#24|))))
                |args| NIL (CDR |cosig|) NIL)
               |ok|))))
      (#1# NIL)))))
 
; NRTassignCapsuleFunctionSlot(op,sig) ==
; --called from compDefineCapsuleFunction
;   opSig := [op,sig]
;   [.,.,implementation] := NRTisExported? opSig or return nil
;     --if opSig is not exported, it is local and need not be assigned
;   if $insideCategoryPackageIfTrue then
;       sig := substitute('$,CADR($functorForm),sig)
;   sig := [genDeltaSig x for x in sig]
;   opModemapPair := [op,['_$,:sig],['T,implementation]]
;   POSN1(opModemapPair,$NRTdeltaList) => nil   --already there
;   $NRTdeltaList:= [opModemapPair,:$NRTdeltaList]
;   $NRTdeltaListComp := [nil,:$NRTdeltaListComp]
;   $NRTdeltaLength := $NRTdeltaLength+1
 
(DEFUN |NRTassignCapsuleFunctionSlot| (|op| |sig|)
  (PROG (|opSig| |LETTMP#1| |implementation| |opModemapPair|)
    (RETURN
     (PROGN
      (SETQ |opSig| (LIST |op| |sig|))
      (SETQ |LETTMP#1| (OR (|NRTisExported?| |opSig|) (RETURN NIL)))
      (SETQ |implementation| (CADDR |LETTMP#1|))
      (COND
       (|$insideCategoryPackageIfTrue|
        (SETQ |sig| (|substitute| '$ (CADR |$functorForm|) |sig|))))
      (SETQ |sig|
              ((LAMBDA (|bfVar#26| |bfVar#25| |x|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#25|)
                        (PROGN (SETQ |x| (CAR |bfVar#25|)) NIL))
                    (RETURN (NREVERSE |bfVar#26|)))
                   (#1='T
                    (SETQ |bfVar#26| (CONS (|genDeltaSig| |x|) |bfVar#26|))))
                  (SETQ |bfVar#25| (CDR |bfVar#25|))))
               NIL |sig| NIL))
      (SETQ |opModemapPair|
              (LIST |op| (CONS '$ |sig|) (LIST 'T |implementation|)))
      (COND ((POSN1 |opModemapPair| |$NRTdeltaList|) NIL)
            (#1#
             (PROGN
              (SETQ |$NRTdeltaList| (CONS |opModemapPair| |$NRTdeltaList|))
              (SETQ |$NRTdeltaListComp| (CONS NIL |$NRTdeltaListComp|))
              (SETQ |$NRTdeltaLength| (+ |$NRTdeltaLength| 1)))))))))
 
; NRTisExported? opSig ==
;   or/[u for u in $domainShell.1 | u.0 = opSig]
 
(DEFUN |NRTisExported?| (|opSig|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#28| |bfVar#27| |u|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#27|) (PROGN (SETQ |u| (CAR |bfVar#27|)) NIL))
           (RETURN |bfVar#28|))
          ('T
           (AND (EQUAL (ELT |u| 0) |opSig|)
                (PROGN
                 (SETQ |bfVar#28| |u|)
                 (COND (|bfVar#28| (RETURN |bfVar#28|)))))))
         (SETQ |bfVar#27| (CDR |bfVar#27|))))
      NIL (ELT |$domainShell| 1) NIL))))
 
; consOpSig(op,sig,dc) ==
;   if null atom op then
;     keyedSystemError("S2GE0016",['"consOpSig",'"bad operator in table"])
;   mkList [MKQ op,mkList consSig(sig,dc)]
 
(DEFUN |consOpSig| (|op| |sig| |dc|)
  (PROG ()
    (RETURN
     (PROGN
      (COND
       ((NULL (ATOM |op|))
        (|keyedSystemError| 'S2GE0016
         (LIST "consOpSig" "bad operator in table"))))
      (|mkList| (LIST (MKQ |op|) (|mkList| (|consSig| |sig| |dc|))))))))
 
; consSig(sig,dc) == [consDomainName(sigpart,dc) for sigpart in sig]
 
(DEFUN |consSig| (|sig| |dc|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#30| |bfVar#29| |sigpart|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#29|) (PROGN (SETQ |sigpart| (CAR |bfVar#29|)) NIL))
           (RETURN (NREVERSE |bfVar#30|)))
          ('T
           (SETQ |bfVar#30|
                   (CONS (|consDomainName| |sigpart| |dc|) |bfVar#30|))))
         (SETQ |bfVar#29| (CDR |bfVar#29|))))
      NIL |sig| NIL))))
 
; consDomainName(x,dc) ==
;   x = dc => ''$
;   x = '$ => ''$
;   x = "$$" => ['devaluate,'$]
;   x is [op,:argl] =>
;     (op = 'Record) or (op = 'Union and argl is [[":",:.],:.])  =>
;        mkList [MKQ op,
;          :[['LIST,MKQ '_:,MKQ tag,consDomainName(dom,dc)]
;                    for [.,tag,dom] in argl]]
;     isFunctor op or op = 'Mapping or constructor? op =>
;          -- call to constructor? needed if op was compiled in $bootStrapMode
;         mkList [MKQ op,:[consDomainName(y,dc) for y in argl]]
;     substitute('$,"$$",x)
;   x = [] => x
;   (y := LASSOC(x,$devaluateList)) => y
;   k:=NRTassocIndex x =>
;     ['devaluate,['ELT,'$,k]]
;   get(x,'value,$e) =>
;     isDomainForm(x,$e) => ['devaluate,x]
;     x
;   MKQ x
 
(DEFUN |consDomainName| (|x| |dc|)
  (PROG (|op| |argl| |ISTMP#1| |tag| |ISTMP#2| |dom| |y| |k|)
    (RETURN
     (COND ((EQUAL |x| |dc|) ''$) ((EQ |x| '$) ''$)
           ((EQ |x| '$$) (LIST '|devaluate| '$))
           ((AND (CONSP |x|)
                 (PROGN (SETQ |op| (CAR |x|)) (SETQ |argl| (CDR |x|)) #1='T))
            (COND
             ((OR (EQ |op| '|Record|)
                  (AND (EQ |op| '|Union|) (CONSP |argl|)
                       (PROGN
                        (SETQ |ISTMP#1| (CAR |argl|))
                        (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) '|:|)))))
              (|mkList|
               (CONS (MKQ |op|)
                     ((LAMBDA (|bfVar#33| |bfVar#32| |bfVar#31|)
                        (LOOP
                         (COND
                          ((OR (ATOM |bfVar#32|)
                               (PROGN (SETQ |bfVar#31| (CAR |bfVar#32|)) NIL))
                           (RETURN (NREVERSE |bfVar#33|)))
                          (#1#
                           (AND (CONSP |bfVar#31|)
                                (PROGN
                                 (SETQ |ISTMP#1| (CDR |bfVar#31|))
                                 (AND (CONSP |ISTMP#1|)
                                      (PROGN
                                       (SETQ |tag| (CAR |ISTMP#1|))
                                       (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                       (AND (CONSP |ISTMP#2|)
                                            (EQ (CDR |ISTMP#2|) NIL)
                                            (PROGN
                                             (SETQ |dom| (CAR |ISTMP#2|))
                                             #1#)))))
                                (SETQ |bfVar#33|
                                        (CONS
                                         (LIST 'LIST (MKQ '|:|) (MKQ |tag|)
                                               (|consDomainName| |dom| |dc|))
                                         |bfVar#33|)))))
                         (SETQ |bfVar#32| (CDR |bfVar#32|))))
                      NIL |argl| NIL))))
             ((OR (|isFunctor| |op|) (EQ |op| '|Mapping|)
                  (|constructor?| |op|))
              (|mkList|
               (CONS (MKQ |op|)
                     ((LAMBDA (|bfVar#35| |bfVar#34| |y|)
                        (LOOP
                         (COND
                          ((OR (ATOM |bfVar#34|)
                               (PROGN (SETQ |y| (CAR |bfVar#34|)) NIL))
                           (RETURN (NREVERSE |bfVar#35|)))
                          (#1#
                           (SETQ |bfVar#35|
                                   (CONS (|consDomainName| |y| |dc|)
                                         |bfVar#35|))))
                         (SETQ |bfVar#34| (CDR |bfVar#34|))))
                      NIL |argl| NIL))))
             (#1# (|substitute| '$ '$$ |x|))))
           ((NULL |x|) |x|) ((SETQ |y| (LASSOC |x| |$devaluateList|)) |y|)
           ((SETQ |k| (|NRTassocIndex| |x|))
            (LIST '|devaluate| (LIST 'ELT '$ |k|)))
           ((|get| |x| '|value| |$e|)
            (COND ((|isDomainForm| |x| |$e|) (LIST '|devaluate| |x|))
                  (#1# |x|)))
           (#1# (MKQ |x|))))))
 
; consDomainForm(x,dc) ==
;   x = '$ => '$
;   x is [op,:argl] =>
;      op = ":" and argl is [tag, value] => [op, tag, consDomainForm(value,dc)]
;      [op,:[consDomainForm(y,dc) for y in argl]]
;   x = [] => x
;   (y := LASSOC(x,$devaluateList)) => y
;   k:=NRTassocIndex x => ['ELT,'$,k]
;   get(x,'value,$e) or get(x,'mode,$e) => x
;   MKQ x
 
(DEFUN |consDomainForm| (|x| |dc|)
  (PROG (|op| |argl| |tag| |ISTMP#1| |value| |y| |k|)
    (RETURN
     (COND ((EQ |x| '$) '$)
           ((AND (CONSP |x|)
                 (PROGN (SETQ |op| (CAR |x|)) (SETQ |argl| (CDR |x|)) #1='T))
            (COND
             ((AND (EQ |op| '|:|) (CONSP |argl|)
                   (PROGN
                    (SETQ |tag| (CAR |argl|))
                    (SETQ |ISTMP#1| (CDR |argl|))
                    (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                         (PROGN (SETQ |value| (CAR |ISTMP#1|)) #1#))))
              (LIST |op| |tag| (|consDomainForm| |value| |dc|)))
             (#1#
              (CONS |op|
                    ((LAMBDA (|bfVar#37| |bfVar#36| |y|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#36|)
                              (PROGN (SETQ |y| (CAR |bfVar#36|)) NIL))
                          (RETURN (NREVERSE |bfVar#37|)))
                         (#1#
                          (SETQ |bfVar#37|
                                  (CONS (|consDomainForm| |y| |dc|)
                                        |bfVar#37|))))
                        (SETQ |bfVar#36| (CDR |bfVar#36|))))
                     NIL |argl| NIL)))))
           ((NULL |x|) |x|) ((SETQ |y| (LASSOC |x| |$devaluateList|)) |y|)
           ((SETQ |k| (|NRTassocIndex| |x|)) (LIST 'ELT '$ |k|))
           ((OR (|get| |x| '|value| |$e|) (|get| |x| '|mode| |$e|)) |x|)
           (#1# (MKQ |x|))))))
 
; get_self_preds2(p, acc) ==
;     p is [op, :l] =>
;         MEMQ(op, '(AND and OR or NOT not)) => get_self_preds1(l, acc)
;         op is "HasCategory" =>
;             first(l) = "$" => CONS(CADR(l), acc)
;             acc
;         acc
;     acc
 
(DEFUN |get_self_preds2| (|p| |acc|)
  (PROG (|op| |l|)
    (RETURN
     (COND
      ((AND (CONSP |p|)
            (PROGN (SETQ |op| (CAR |p|)) (SETQ |l| (CDR |p|)) #1='T))
       (COND
        ((MEMQ |op| '(AND |and| OR |or| NOT |not|))
         (|get_self_preds1| |l| |acc|))
        ((EQ |op| '|HasCategory|)
         (COND ((EQ (CAR |l|) '$) (CONS (CADR |l|) |acc|)) (#1# |acc|)))
        (#1# |acc|)))
      (#1# |acc|)))))
 
; get_self_preds1(pl, acc) ==
;     for p in pl repeat
;         acc := get_self_preds2(p, acc)
;     acc
 
(DEFUN |get_self_preds1| (|pl| |acc|)
  (PROG ()
    (RETURN
     (PROGN
      ((LAMBDA (|bfVar#38| |p|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#38|) (PROGN (SETQ |p| (CAR |bfVar#38|)) NIL))
            (RETURN NIL))
           ('T (SETQ |acc| (|get_self_preds2| |p| |acc|))))
          (SETQ |bfVar#38| (CDR |bfVar#38|))))
       |pl| NIL)
      |acc|))))
 
; get_self_preds(pl) == REMDUP get_self_preds1(pl, nil)
 
(DEFUN |get_self_preds| (|pl|)
  (PROG () (RETURN (REMDUP (|get_self_preds1| |pl| NIL)))))
 
; boolean_subst_and(l, good_preds) ==
;     res := []
;     for cond in l repeat
;         nc := boolean_subst1(cond, good_preds)
;         nc = true => "iterate"
;         not(nc) => nc
;         res := cons(nc, res)
;     res = [] => true
;     #res = 1 => first(res)
;     ["AND", :nreverse(res)]
 
(DEFUN |boolean_subst_and| (|l| |good_preds|)
  (PROG (|res| |nc|)
    (RETURN
     (PROGN
      (SETQ |res| NIL)
      ((LAMBDA (|bfVar#39| |cond|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#39|) (PROGN (SETQ |cond| (CAR |bfVar#39|)) NIL))
            (RETURN NIL))
           (#1='T
            (PROGN
             (SETQ |nc| (|boolean_subst1| |cond| |good_preds|))
             (COND ((EQUAL |nc| T) '|iterate|) ((NULL |nc|) |nc|)
                   (#1# (SETQ |res| (CONS |nc| |res|)))))))
          (SETQ |bfVar#39| (CDR |bfVar#39|))))
       |l| NIL)
      (COND ((NULL |res|) T) ((EQL (LENGTH |res|) 1) (CAR |res|))
            (#1# (CONS 'AND (NREVERSE |res|))))))))
 
; boolean_subst_or(l, good_preds) ==
;     res := []
;     for cond in l repeat
;         nc := boolean_subst1(cond, good_preds)
;         nc = true => nc
;         not(nc) => "iterate"
;         res := cons(nc, res)
;     res = [] => false
;     #res = 1 => first(res)
;     ["OR", :nreverse(res)]
 
(DEFUN |boolean_subst_or| (|l| |good_preds|)
  (PROG (|res| |nc|)
    (RETURN
     (PROGN
      (SETQ |res| NIL)
      ((LAMBDA (|bfVar#40| |cond|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#40|) (PROGN (SETQ |cond| (CAR |bfVar#40|)) NIL))
            (RETURN NIL))
           (#1='T
            (PROGN
             (SETQ |nc| (|boolean_subst1| |cond| |good_preds|))
             (COND ((EQUAL |nc| T) |nc|) ((NULL |nc|) '|iterate|)
                   (#1# (SETQ |res| (CONS |nc| |res|)))))))
          (SETQ |bfVar#40| (CDR |bfVar#40|))))
       |l| NIL)
      (COND ((NULL |res|) NIL) ((EQL (LENGTH |res|) 1) (CAR |res|))
            (#1# (CONS 'OR (NREVERSE |res|))))))))
 
; boolean_subst_not(cond, good_preds) ==
;    nc := boolean_subst1(cond, good_preds)
;    nc = true => false
;    not(nc) => true
;    ["NOT", nc]
 
(DEFUN |boolean_subst_not| (|cond| |good_preds|)
  (PROG (|nc|)
    (RETURN
     (PROGN
      (SETQ |nc| (|boolean_subst1| |cond| |good_preds|))
      (COND ((EQUAL |nc| T) NIL) ((NULL |nc|) T) ('T (LIST 'NOT |nc|)))))))
 
; boolean_subst1(cond, good_preds) ==
;     cond = true => cond
;     cond is [op, :l] =>
;         MEMQ(op, '(AND and)) => boolean_subst_and(l, good_preds)
;         MEMQ(op, '(OR or)) => boolean_subst_or(l, good_preds)
;         MEMQ(op, '(NOT not)) => boolean_subst_not(first(l), good_preds)
;         nc := LASSOC(cond, good_preds)
;         nc => first(nc)
;         cond
;     cond
 
(DEFUN |boolean_subst1| (|cond| |good_preds|)
  (PROG (|op| |l| |nc|)
    (RETURN
     (COND ((EQUAL |cond| T) |cond|)
           ((AND (CONSP |cond|)
                 (PROGN
                  (SETQ |op| (CAR |cond|))
                  (SETQ |l| (CDR |cond|))
                  #1='T))
            (COND
             ((MEMQ |op| '(AND |and|)) (|boolean_subst_and| |l| |good_preds|))
             ((MEMQ |op| '(OR |or|)) (|boolean_subst_or| |l| |good_preds|))
             ((MEMQ |op| '(NOT |not|))
              (|boolean_subst_not| (CAR |l|) |good_preds|))
             (#1#
              (PROGN
               (SETQ |nc| (LASSOC |cond| |good_preds|))
               (COND (|nc| (CAR |nc|)) (#1# |cond|))))))
           (#1# |cond|)))))
 
; boolean_subst(condCats, good_preds) ==
;     [boolean_subst1(cond, good_preds) for cond in condCats]
 
(DEFUN |boolean_subst| (|condCats| |good_preds|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#42| |bfVar#41| |cond|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#41|) (PROGN (SETQ |cond| (CAR |bfVar#41|)) NIL))
           (RETURN (NREVERSE |bfVar#42|)))
          ('T
           (SETQ |bfVar#42|
                   (CONS (|boolean_subst1| |cond| |good_preds|) |bfVar#42|))))
         (SETQ |bfVar#41| (CDR |bfVar#41|))))
      NIL |condCats| NIL))))
 
; mk_has_dollar_quote(cat) ==
;     ["HasCategory", "$", ["QUOTE", cat]]
 
(DEFUN |mk_has_dollar_quote| (|cat|)
  (PROG () (RETURN (LIST '|HasCategory| '$ (LIST 'QUOTE |cat|)))))
 
; simplify_self_preds1(catvecListMaker, condCats) ==
;     self_preds := get_self_preds(condCats)
;     self_preds := [cat for p in self_preds | p is ["QUOTE", cat]]
;     self_preds = [] => [condCats, false]
;     false_preds := []
;     for c1 in self_preds repeat
;         op1 := opOf(c1)
;         hl := []
;         found := false
;         for c2 in catvecListMaker for cond in condCats repeat
;             c1 = c2 =>
;                 found_preds := CONS([c1, cond], found_preds)
;                 found := true
;             if op1 = opOf(c2) then
;                 hl := CONS([c2, cond], hl)
;         if not(found) and not(hl) then
;             false_preds := CONS(c1, false_preds)
;     good_preds := [cc for cc in found_preds |
;                      cc is [cat, cond] and not(isHasDollarPred(cond))]
;     good_preds := [:[[mk_has_dollar_quote(cat), false] for cat in false_preds],
;                    :[[mk_has_dollar_quote(cat), cond] for cc in good_preds
;                       | cc is [cat, cond]]]
;     good_preds = [] => [condCats, false]
;     condCats := boolean_subst(condCats, good_preds)
;     [condCats, true]
 
(DEFUN |simplify_self_preds1| (|catvecListMaker| |condCats|)
  (PROG (|self_preds| |ISTMP#1| |cat| |false_preds| |op1| |hl| |found|
         |found_preds| |cond| |good_preds|)
    (RETURN
     (PROGN
      (SETQ |self_preds| (|get_self_preds| |condCats|))
      (SETQ |self_preds|
              ((LAMBDA (|bfVar#44| |bfVar#43| |p|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#43|)
                        (PROGN (SETQ |p| (CAR |bfVar#43|)) NIL))
                    (RETURN (NREVERSE |bfVar#44|)))
                   (#1='T
                    (AND (CONSP |p|) (EQ (CAR |p|) 'QUOTE)
                         (PROGN
                          (SETQ |ISTMP#1| (CDR |p|))
                          (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                               (PROGN (SETQ |cat| (CAR |ISTMP#1|)) #1#)))
                         (SETQ |bfVar#44| (CONS |cat| |bfVar#44|)))))
                  (SETQ |bfVar#43| (CDR |bfVar#43|))))
               NIL |self_preds| NIL))
      (COND ((NULL |self_preds|) (LIST |condCats| NIL))
            (#1#
             (PROGN
              (SETQ |false_preds| NIL)
              ((LAMBDA (|bfVar#45| |c1|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#45|)
                        (PROGN (SETQ |c1| (CAR |bfVar#45|)) NIL))
                    (RETURN NIL))
                   (#1#
                    (PROGN
                     (SETQ |op1| (|opOf| |c1|))
                     (SETQ |hl| NIL)
                     (SETQ |found| NIL)
                     ((LAMBDA (|bfVar#46| |c2| |bfVar#47| |cond|)
                        (LOOP
                         (COND
                          ((OR (ATOM |bfVar#46|)
                               (PROGN (SETQ |c2| (CAR |bfVar#46|)) NIL)
                               (ATOM |bfVar#47|)
                               (PROGN (SETQ |cond| (CAR |bfVar#47|)) NIL))
                           (RETURN NIL))
                          (#1#
                           (COND
                            ((EQUAL |c1| |c2|)
                             (PROGN
                              (SETQ |found_preds|
                                      (CONS (LIST |c1| |cond|) |found_preds|))
                              (SETQ |found| T)))
                            (#1#
                             (COND
                              ((EQUAL |op1| (|opOf| |c2|))
                               (SETQ |hl| (CONS (LIST |c2| |cond|) |hl|))))))))
                         (SETQ |bfVar#46| (CDR |bfVar#46|))
                         (SETQ |bfVar#47| (CDR |bfVar#47|))))
                      |catvecListMaker| NIL |condCats| NIL)
                     (COND
                      ((AND (NULL |found|) (NULL |hl|))
                       (SETQ |false_preds| (CONS |c1| |false_preds|)))))))
                  (SETQ |bfVar#45| (CDR |bfVar#45|))))
               |self_preds| NIL)
              (SETQ |good_preds|
                      ((LAMBDA (|bfVar#49| |bfVar#48| |cc|)
                         (LOOP
                          (COND
                           ((OR (ATOM |bfVar#48|)
                                (PROGN (SETQ |cc| (CAR |bfVar#48|)) NIL))
                            (RETURN (NREVERSE |bfVar#49|)))
                           (#1#
                            (AND (CONSP |cc|)
                                 (PROGN
                                  (SETQ |cat| (CAR |cc|))
                                  (SETQ |ISTMP#1| (CDR |cc|))
                                  (AND (CONSP |ISTMP#1|)
                                       (EQ (CDR |ISTMP#1|) NIL)
                                       (PROGN
                                        (SETQ |cond| (CAR |ISTMP#1|))
                                        #1#)))
                                 (NULL (|isHasDollarPred| |cond|))
                                 (SETQ |bfVar#49| (CONS |cc| |bfVar#49|)))))
                          (SETQ |bfVar#48| (CDR |bfVar#48|))))
                       NIL |found_preds| NIL))
              (SETQ |good_preds|
                      (APPEND
                       ((LAMBDA (|bfVar#51| |bfVar#50| |cat|)
                          (LOOP
                           (COND
                            ((OR (ATOM |bfVar#50|)
                                 (PROGN (SETQ |cat| (CAR |bfVar#50|)) NIL))
                             (RETURN (NREVERSE |bfVar#51|)))
                            (#1#
                             (SETQ |bfVar#51|
                                     (CONS
                                      (LIST (|mk_has_dollar_quote| |cat|) NIL)
                                      |bfVar#51|))))
                           (SETQ |bfVar#50| (CDR |bfVar#50|))))
                        NIL |false_preds| NIL)
                       ((LAMBDA (|bfVar#53| |bfVar#52| |cc|)
                          (LOOP
                           (COND
                            ((OR (ATOM |bfVar#52|)
                                 (PROGN (SETQ |cc| (CAR |bfVar#52|)) NIL))
                             (RETURN (NREVERSE |bfVar#53|)))
                            (#1#
                             (AND (CONSP |cc|)
                                  (PROGN
                                   (SETQ |cat| (CAR |cc|))
                                   (SETQ |ISTMP#1| (CDR |cc|))
                                   (AND (CONSP |ISTMP#1|)
                                        (EQ (CDR |ISTMP#1|) NIL)
                                        (PROGN
                                         (SETQ |cond| (CAR |ISTMP#1|))
                                         #1#)))
                                  (SETQ |bfVar#53|
                                          (CONS
                                           (LIST (|mk_has_dollar_quote| |cat|)
                                                 |cond|)
                                           |bfVar#53|)))))
                           (SETQ |bfVar#52| (CDR |bfVar#52|))))
                        NIL |good_preds| NIL)))
              (COND ((NULL |good_preds|) (LIST |condCats| NIL))
                    (#1#
                     (PROGN
                      (SETQ |condCats|
                              (|boolean_subst| |condCats| |good_preds|))
                      (LIST |condCats| T)))))))))))
 
; simplify_self_preds(catvecListMaker, condCats) ==
;     progress := true
;     while progress repeat
;         [condCats, progress] := simplify_self_preds1(catvecListMaker, condCats)
;     condCats
 
(DEFUN |simplify_self_preds| (|catvecListMaker| |condCats|)
  (PROG (|progress| |LETTMP#1|)
    (RETURN
     (PROGN
      (SETQ |progress| T)
      ((LAMBDA ()
         (LOOP
          (COND ((NOT |progress|) (RETURN NIL))
                ('T
                 (PROGN
                  (SETQ |LETTMP#1|
                          (|simplify_self_preds1| |catvecListMaker|
                           |condCats|))
                  (SETQ |condCats| (CAR |LETTMP#1|))
                  (SETQ |progress| (CADR |LETTMP#1|))
                  |LETTMP#1|))))))
      |condCats|))))
 
; buildFunctor($definition is [name,:args],sig,code,$locals,$e) ==
; --PARAMETERS
; --  $definition: constructor form, e.g. (SquareMatrix 10 (RationalNumber))
; --  sig: signature of constructor form
; --  code: result of "doIt", converting body of capsule to CodeDefine forms, e.g.
; --       (PROGN (LET Rep ...)
; --              (: (ListOf x y) $)
; --              (CodeDefine (<op> <signature> <functionName>))
; --              (COND ((HasCategory $ ...) (PROGN ...))) ..)
; --  $locals: list of variables to go into slot 5, e.g. (R Rep R,1 R,2 R,3 R,4)
; --           same as $functorLocalParameters
; --           this list is not augmented by this function
; --  $e: environment
; --GLOBAL VARIABLES REFERENCED:
; --  $domainShell: passed in from compDefineFunctor1
; --  $QuickCode: compilation flag
; 
;   if code is ['add,.,newstuff] then code := newstuff
; 
;   changeDirectoryInSlot1()  --this extends $NRTslot1PredicateList
; 
;   --pp '"=================="
;   --for item in $NRTdeltaList repeat pp item
; 
; --LOCAL BOUND FLUID VARIABLES:
;   $GENNO: local:= 0     --bound in compDefineFunctor1, then as parameter here
;   $catvecList: local    --list of vectors v1..vn for each view
;   $hasCategoryAlist: local  --list of GENSYMs bound to (HasCategory ..) items
;   $SetFunctions: local  --copy of p view with preds telling when fnct defined
;   $MissingFunctionInfo: local --vector marking which functions are assigned
;   $ConstantAssignments: local --code for creation of constants
;   $epilogue: local := nil     --code to set slot 5, things to be done last
;   $extraParms:local  --Set in DomainSubstitutionFunction, used in setVector12
;   $devaluateList: local --Bound to ((#1 . dv$1)..) where &1 := devaluate #1 later
;   $devaluateList:= [[arg,:b] for arg in args for b in $ModeVariableList]
; ------------------------
;   oldtime := get_run_time()
;   [catsig, :argsig] := sig
;   catvecListMaker:=REMDUP
;     [(comp(catsig, $EmptyMode, $e)).expr,
;       :[compCategories first u for u in CADR $domainShell.4]]
;   condCats:= InvestigateConditions [catsig, :rest catvecListMaker]
;   -- a list, one for each element of catvecListMaker
;   -- indicating under what conditions this
;   -- category should be present.  true => always
;   makeCatvecCode:= first catvecListMaker
;   emptyVector := VECTOR()
;   domainShell := GETREFV (6 + $NRTdeltaLength)
;   for i in 0..4 repeat domainShell.i := $domainShell.i
;     --we will clobber elements; copy since $domainShell may be a cached vector
;   $template := GETREFV (6 + $NRTdeltaLength)
;   $catvecList:= [domainShell,:[emptyVector for u in CADR domainShell.4]]
;   $SetFunctions:= GETREFV SIZE domainShell
;   $MissingFunctionInfo:= GETREFV SIZE domainShell
;   catNames := ['$, :[GENVAR() for u in rest catvecListMaker]]
;   domname:='dv_$
; 
;   condCats := [simpBool(cc) for cc in condCats]
;   condCats := simplify_self_preds(catvecListMaker, condCats)
; -->  Do this now to create predicate vector; then DescendCode can refer
; -->  to predicate vector if it can
;   [$uncondAlist,:$condAlist] :=    --bound in compDefineFunctor1
;       NRTsetVector4Part1(catNames, catvecListMaker, condCats)
;   [$NRTslot1PredicateList,predBitVectorCode1,:predBitVectorCode2] :=
;       makePredicateBitVector [:ASSOCRIGHT $condAlist,:$NRTslot1PredicateList]
; 
;   storeOperationCode := DescendCode(code, true, nil, first catNames)
;   outsideFunctionCode:= NRTaddDeltaCode()
;   storeOperationCode:= NRTputInLocalReferences storeOperationCode
;   NRTdescendCodeTran(storeOperationCode,nil) --side effects storeOperationCode
;   codePart2:=
;       argStuffCode :=
;         [[$setelt,'$,i,v] for i in 6.. for v in $FormalMapVariableList
;           for arg in rest $definition]
;       if MEMQ($NRTaddForm,$locals) then
;          addargname := $FormalMapVariableList.(POSN1($NRTaddForm,$locals))
;          argStuffCode := [[$setelt,'$,5,addargname],:argStuffCode]
;       [['stuffDomainSlots,'$],:argStuffCode,
;          :predBitVectorCode2, ['SETF, 'pv_$, ['QREFELT, '$, 3]],
;             storeOperationCode]
; 
;   $CheckVectorList := NRTcheckVector domainShell
; --CODE: part 1
;   codePart1:= [:devaluateCode, createDomainCode,
;                 createViewCode,setVector0Code, slot3Code,:slamCode] where
;     devaluateCode:= [['LET,b,['devaluate,a]] for [a,:b] in $devaluateList]
;     createDomainCode:=
;         ['LET, domname, ['LIST, MKQ first $definition,
;                          :ASSOCRIGHT $devaluateList]]
;     createViewCode:= ['LET,'$,['GETREFV, 6+$NRTdeltaLength]]
;     setVector0Code:=[$setelt,'$,0,'dv_$]
;     slot3Code := ['QSETREFV,'$,3,['LET,'pv_$,predBitVectorCode1]]
;     slamCode:=
;       isCategoryPackageName opOf $definition => nil
;       [NRTaddToSlam($definition,'$)]
; 
; --CODE: part 3
;   $ConstantAssignments :=
;       [NRTputInLocalReferences code for code in $ConstantAssignments]
;   codePart3:= [:$ConstantAssignments,:$epilogue]
;   ans :=
;     ['PROGN,:optFunctorPROGN [:codePart1,:codePart2,:codePart3], '$]
;   ans:= minimalise ans
;   SAY ['"time taken in buildFunctor: ", get_run_time() - oldtime]
;   --sayBrightly '"------------------functor code: -------------------"
;   --pp ans
;   ans
 
(DEFUN |buildFunctor| (|$definition| |sig| |code| |$locals| |$e|)
  (DECLARE (SPECIAL |$definition| |$locals| |$e|))
  (PROG (|$devaluateList| |$extraParms| |$epilogue| |$ConstantAssignments|
         |$MissingFunctionInfo| |$SetFunctions| |$hasCategoryAlist|
         |$catvecList| $GENNO |ans| |codePart3| |codePart1| |slamCode|
         |slot3Code| |setVector0Code| |createViewCode| |createDomainCode|
         |devaluateCode| |b| |a| |codePart2| |addargname| |argStuffCode|
         |outsideFunctionCode| |storeOperationCode| |predBitVectorCode2|
         |predBitVectorCode1| |LETTMP#1| |domname| |catNames| |domainShell|
         |emptyVector| |makeCatvecCode| |condCats| |catvecListMaker| |argsig|
         |catsig| |oldtime| |newstuff| |ISTMP#2| |ISTMP#1| |args| |name|)
    (DECLARE
     (SPECIAL |$devaluateList| |$extraParms| |$epilogue| |$ConstantAssignments|
      |$MissingFunctionInfo| |$SetFunctions| |$hasCategoryAlist| |$catvecList|
      $GENNO))
    (RETURN
     (PROGN
      (SETQ |name| (CAR |$definition|))
      (SETQ |args| (CDR |$definition|))
      (COND
       ((AND (CONSP |code|) (EQ (CAR |code|) '|add|)
             (PROGN
              (SETQ |ISTMP#1| (CDR |code|))
              (AND (CONSP |ISTMP#1|)
                   (PROGN
                    (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                    (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                         (PROGN (SETQ |newstuff| (CAR |ISTMP#2|)) #1='T))))))
        (SETQ |code| |newstuff|)))
      (|changeDirectoryInSlot1|)
      (SETQ $GENNO 0)
      (SETQ |$catvecList| NIL)
      (SETQ |$hasCategoryAlist| NIL)
      (SETQ |$SetFunctions| NIL)
      (SETQ |$MissingFunctionInfo| NIL)
      (SETQ |$ConstantAssignments| NIL)
      (SETQ |$epilogue| NIL)
      (SETQ |$extraParms| NIL)
      (SETQ |$devaluateList| NIL)
      (SETQ |$devaluateList|
              ((LAMBDA (|bfVar#56| |bfVar#54| |arg| |bfVar#55| |b|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#54|)
                        (PROGN (SETQ |arg| (CAR |bfVar#54|)) NIL)
                        (ATOM |bfVar#55|)
                        (PROGN (SETQ |b| (CAR |bfVar#55|)) NIL))
                    (RETURN (NREVERSE |bfVar#56|)))
                   (#1# (SETQ |bfVar#56| (CONS (CONS |arg| |b|) |bfVar#56|))))
                  (SETQ |bfVar#54| (CDR |bfVar#54|))
                  (SETQ |bfVar#55| (CDR |bfVar#55|))))
               NIL |args| NIL |$ModeVariableList| NIL))
      (SETQ |oldtime| (|get_run_time|))
      (SETQ |catsig| (CAR |sig|))
      (SETQ |argsig| (CDR |sig|))
      (SETQ |catvecListMaker|
              (REMDUP
               (CONS (CAR (|comp| |catsig| |$EmptyMode| |$e|))
                     ((LAMBDA (|bfVar#58| |bfVar#57| |u|)
                        (LOOP
                         (COND
                          ((OR (ATOM |bfVar#57|)
                               (PROGN (SETQ |u| (CAR |bfVar#57|)) NIL))
                           (RETURN (NREVERSE |bfVar#58|)))
                          (#1#
                           (SETQ |bfVar#58|
                                   (CONS (|compCategories| (CAR |u|))
                                         |bfVar#58|))))
                         (SETQ |bfVar#57| (CDR |bfVar#57|))))
                      NIL (CADR (ELT |$domainShell| 4)) NIL))))
      (SETQ |condCats|
              (|InvestigateConditions|
               (CONS |catsig| (CDR |catvecListMaker|))))
      (SETQ |makeCatvecCode| (CAR |catvecListMaker|))
      (SETQ |emptyVector| (VECTOR))
      (SETQ |domainShell| (GETREFV (+ 6 |$NRTdeltaLength|)))
      ((LAMBDA (|i|)
         (LOOP
          (COND ((> |i| 4) (RETURN NIL))
                (#1# (SETF (ELT |domainShell| |i|) (ELT |$domainShell| |i|))))
          (SETQ |i| (+ |i| 1))))
       0)
      (SETQ |$template| (GETREFV (+ 6 |$NRTdeltaLength|)))
      (SETQ |$catvecList|
              (CONS |domainShell|
                    ((LAMBDA (|bfVar#60| |bfVar#59| |u|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#59|)
                              (PROGN (SETQ |u| (CAR |bfVar#59|)) NIL))
                          (RETURN (NREVERSE |bfVar#60|)))
                         (#1#
                          (SETQ |bfVar#60| (CONS |emptyVector| |bfVar#60|))))
                        (SETQ |bfVar#59| (CDR |bfVar#59|))))
                     NIL (CADR (ELT |domainShell| 4)) NIL)))
      (SETQ |$SetFunctions| (GETREFV (SIZE |domainShell|)))
      (SETQ |$MissingFunctionInfo| (GETREFV (SIZE |domainShell|)))
      (SETQ |catNames|
              (CONS '$
                    ((LAMBDA (|bfVar#62| |bfVar#61| |u|)
                       (LOOP
                        (COND
                         ((OR (ATOM |bfVar#61|)
                              (PROGN (SETQ |u| (CAR |bfVar#61|)) NIL))
                          (RETURN (NREVERSE |bfVar#62|)))
                         (#1# (SETQ |bfVar#62| (CONS (GENVAR) |bfVar#62|))))
                        (SETQ |bfVar#61| (CDR |bfVar#61|))))
                     NIL (CDR |catvecListMaker|) NIL)))
      (SETQ |domname| '|dv$|)
      (SETQ |condCats|
              ((LAMBDA (|bfVar#64| |bfVar#63| |cc|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#63|)
                        (PROGN (SETQ |cc| (CAR |bfVar#63|)) NIL))
                    (RETURN (NREVERSE |bfVar#64|)))
                   (#1# (SETQ |bfVar#64| (CONS (|simpBool| |cc|) |bfVar#64|))))
                  (SETQ |bfVar#63| (CDR |bfVar#63|))))
               NIL |condCats| NIL))
      (SETQ |condCats| (|simplify_self_preds| |catvecListMaker| |condCats|))
      (SETQ |LETTMP#1|
              (|NRTsetVector4Part1| |catNames| |catvecListMaker| |condCats|))
      (SETQ |$uncondAlist| (CAR |LETTMP#1|))
      (SETQ |$condAlist| (CDR |LETTMP#1|))
      (SETQ |LETTMP#1|
              (|makePredicateBitVector|
               (APPEND (ASSOCRIGHT |$condAlist|) |$NRTslot1PredicateList|)))
      (SETQ |$NRTslot1PredicateList| (CAR |LETTMP#1|))
      (SETQ |predBitVectorCode1| (CADR . #2=(|LETTMP#1|)))
      (SETQ |predBitVectorCode2| (CDDR . #2#))
      (SETQ |storeOperationCode| (|DescendCode| |code| T NIL (CAR |catNames|)))
      (SETQ |outsideFunctionCode| (|NRTaddDeltaCode|))
      (SETQ |storeOperationCode|
              (|NRTputInLocalReferences| |storeOperationCode|))
      (|NRTdescendCodeTran| |storeOperationCode| NIL)
      (SETQ |codePart2|
              (PROGN
               (SETQ |argStuffCode|
                       ((LAMBDA
                            (|bfVar#67| |i| |bfVar#65| |v| |bfVar#66| |arg|)
                          (LOOP
                           (COND
                            ((OR (ATOM |bfVar#65|)
                                 (PROGN (SETQ |v| (CAR |bfVar#65|)) NIL)
                                 (ATOM |bfVar#66|)
                                 (PROGN (SETQ |arg| (CAR |bfVar#66|)) NIL))
                             (RETURN (NREVERSE |bfVar#67|)))
                            (#1#
                             (SETQ |bfVar#67|
                                     (CONS (LIST |$setelt| '$ |i| |v|)
                                           |bfVar#67|))))
                           (SETQ |i| (+ |i| 1))
                           (SETQ |bfVar#65| (CDR |bfVar#65|))
                           (SETQ |bfVar#66| (CDR |bfVar#66|))))
                        NIL 6 |$FormalMapVariableList| NIL (CDR |$definition|)
                        NIL))
               (COND
                ((MEMQ |$NRTaddForm| |$locals|)
                 (SETQ |addargname|
                         (ELT |$FormalMapVariableList|
                              (POSN1 |$NRTaddForm| |$locals|)))
                 (SETQ |argStuffCode|
                         (CONS (LIST |$setelt| '$ 5 |addargname|)
                               |argStuffCode|))))
               (CONS (LIST '|stuffDomainSlots| '$)
                     (APPEND |argStuffCode|
                             (APPEND |predBitVectorCode2|
                                     (CONS
                                      (LIST 'SETF '|pv$| (LIST 'QREFELT '$ 3))
                                      (CONS |storeOperationCode| NIL)))))))
      (SETQ |$CheckVectorList| (|NRTcheckVector| |domainShell|))
      (SETQ |devaluateCode|
              ((LAMBDA (|bfVar#70| |bfVar#69| |bfVar#68|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#69|)
                        (PROGN (SETQ |bfVar#68| (CAR |bfVar#69|)) NIL))
                    (RETURN (NREVERSE |bfVar#70|)))
                   (#1#
                    (AND (CONSP |bfVar#68|)
                         (PROGN
                          (SETQ |a| (CAR |bfVar#68|))
                          (SETQ |b| (CDR |bfVar#68|))
                          #1#)
                         (SETQ |bfVar#70|
                                 (CONS (LIST 'LET |b| (LIST '|devaluate| |a|))
                                       |bfVar#70|)))))
                  (SETQ |bfVar#69| (CDR |bfVar#69|))))
               NIL |$devaluateList| NIL))
      (SETQ |createDomainCode|
              (LIST 'LET |domname|
                    (CONS 'LIST
                          (CONS (MKQ (CAR |$definition|))
                                (ASSOCRIGHT |$devaluateList|)))))
      (SETQ |createViewCode|
              (LIST 'LET '$ (LIST 'GETREFV (+ 6 |$NRTdeltaLength|))))
      (SETQ |setVector0Code| (LIST |$setelt| '$ 0 '|dv$|))
      (SETQ |slot3Code|
              (LIST 'QSETREFV '$ 3 (LIST 'LET '|pv$| |predBitVectorCode1|)))
      (SETQ |slamCode|
              (COND ((|isCategoryPackageName| (|opOf| |$definition|)) NIL)
                    (#1# (LIST (|NRTaddToSlam| |$definition| '$)))))
      (SETQ |codePart1|
              (APPEND |devaluateCode|
                      (CONS |createDomainCode|
                            (CONS |createViewCode|
                                  (CONS |setVector0Code|
                                        (CONS |slot3Code| |slamCode|))))))
      (SETQ |$ConstantAssignments|
              ((LAMBDA (|bfVar#72| |bfVar#71| |code|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#71|)
                        (PROGN (SETQ |code| (CAR |bfVar#71|)) NIL))
                    (RETURN (NREVERSE |bfVar#72|)))
                   (#1#
                    (SETQ |bfVar#72|
                            (CONS (|NRTputInLocalReferences| |code|)
                                  |bfVar#72|))))
                  (SETQ |bfVar#71| (CDR |bfVar#71|))))
               NIL |$ConstantAssignments| NIL))
      (SETQ |codePart3| (APPEND |$ConstantAssignments| |$epilogue|))
      (SETQ |ans|
              (CONS 'PROGN
                    (APPEND
                     (|optFunctorPROGN|
                      (APPEND |codePart1| (APPEND |codePart2| |codePart3|)))
                     (CONS '$ NIL))))
      (SETQ |ans| (|minimalise| |ans|))
      (SAY
       (LIST "time taken in buildFunctor: " (- (|get_run_time|) |oldtime|)))
      |ans|))))
 
; NRTcheckVector domainShell ==
; --RETURNS: an alist (((op,sig),:pred) ...) of missing functions
;   alist := nil
;   for i in 6..MAXINDEX domainShell repeat
; --Vector elements can be one of
; -- (a) T           -- item was marked
; -- (b) NIL         -- item is a domain; will be filled in by setVector4part3
; -- (c) categoryForm-- it was a domain view; now irrelevant
; -- (d) op-signature-- store missing function info in $CheckVectorList
;     v:= domainShell.i
;     v=true => nil  --item is marked; ignore
;     null v => nil  --a domain, which setVector4part3 will fill in
;     atom v => systemErrorHere '"CheckVector"
;     atom first v => nil  --category form; ignore
;     assoc(first v,alist) => nil
;     alist:=
;       [[first v,:$SetFunctions.i],:alist]
;   alist
 
(DEFUN |NRTcheckVector| (|domainShell|)
  (PROG (|alist| |v|)
    (RETURN
     (PROGN
      (SETQ |alist| NIL)
      ((LAMBDA (|bfVar#73| |i|)
         (LOOP
          (COND ((> |i| |bfVar#73|) (RETURN NIL))
                (#1='T
                 (PROGN
                  (SETQ |v| (ELT |domainShell| |i|))
                  (COND ((EQUAL |v| T) NIL) ((NULL |v|) NIL)
                        ((ATOM |v|) (|systemErrorHere| "CheckVector"))
                        ((ATOM (CAR |v|)) NIL)
                        ((|assoc| (CAR |v|) |alist|) NIL)
                        (#1#
                         (SETQ |alist|
                                 (CONS
                                  (CONS (CAR |v|) (ELT |$SetFunctions| |i|))
                                  |alist|)))))))
          (SETQ |i| (+ |i| 1))))
       (MAXINDEX |domainShell|) 6)
      |alist|))))
 
; NRTsetVector4Part1(siglist,formlist,condlist) ==
;   $uncondList: local := nil
;   $condList: local := nil
;   for sig in reverse siglist for form in reverse formlist
;          for cond in reverse condlist repeat
;                   NRTsetVector4a(sig,form,cond)
;   reducedUncondlist := REMDUP $uncondList
;   reducedConlist :=
;     [[x,:y] for [x,z] in $condList| y := SETDIFFERENCE(z,reducedUncondlist)]
;   revCondlist := reverseCondlist reducedConlist
;   orCondlist := [[x,:MKPF(y,'OR)] for [x,:y] in revCondlist]
;   [reducedUncondlist,:orCondlist]
 
(DEFUN |NRTsetVector4Part1| (|siglist| |formlist| |condlist|)
  (PROG (|$condList| |$uncondList| |orCondlist| |revCondlist| |reducedConlist|
         |y| |z| |ISTMP#1| |x| |reducedUncondlist|)
    (DECLARE (SPECIAL |$condList| |$uncondList|))
    (RETURN
     (PROGN
      (SETQ |$uncondList| NIL)
      (SETQ |$condList| NIL)
      ((LAMBDA (|bfVar#74| |sig| |bfVar#75| |form| |bfVar#76| |cond|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#74|) (PROGN (SETQ |sig| (CAR |bfVar#74|)) NIL)
                (ATOM |bfVar#75|) (PROGN (SETQ |form| (CAR |bfVar#75|)) NIL)
                (ATOM |bfVar#76|) (PROGN (SETQ |cond| (CAR |bfVar#76|)) NIL))
            (RETURN NIL))
           (#1='T (|NRTsetVector4a| |sig| |form| |cond|)))
          (SETQ |bfVar#74| (CDR |bfVar#74|))
          (SETQ |bfVar#75| (CDR |bfVar#75|))
          (SETQ |bfVar#76| (CDR |bfVar#76|))))
       (REVERSE |siglist|) NIL (REVERSE |formlist|) NIL (REVERSE |condlist|)
       NIL)
      (SETQ |reducedUncondlist| (REMDUP |$uncondList|))
      (SETQ |reducedConlist|
              ((LAMBDA (|bfVar#79| |bfVar#78| |bfVar#77|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#78|)
                        (PROGN (SETQ |bfVar#77| (CAR |bfVar#78|)) NIL))
                    (RETURN (NREVERSE |bfVar#79|)))
                   (#1#
                    (AND (CONSP |bfVar#77|)
                         (PROGN
                          (SETQ |x| (CAR |bfVar#77|))
                          (SETQ |ISTMP#1| (CDR |bfVar#77|))
                          (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                               (PROGN (SETQ |z| (CAR |ISTMP#1|)) #1#)))
                         (SETQ |y| (SETDIFFERENCE |z| |reducedUncondlist|))
                         (SETQ |bfVar#79| (CONS (CONS |x| |y|) |bfVar#79|)))))
                  (SETQ |bfVar#78| (CDR |bfVar#78|))))
               NIL |$condList| NIL))
      (SETQ |revCondlist| (|reverseCondlist| |reducedConlist|))
      (SETQ |orCondlist|
              ((LAMBDA (|bfVar#82| |bfVar#81| |bfVar#80|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#81|)
                        (PROGN (SETQ |bfVar#80| (CAR |bfVar#81|)) NIL))
                    (RETURN (NREVERSE |bfVar#82|)))
                   (#1#
                    (AND (CONSP |bfVar#80|)
                         (PROGN
                          (SETQ |x| (CAR |bfVar#80|))
                          (SETQ |y| (CDR |bfVar#80|))
                          #1#)
                         (SETQ |bfVar#82|
                                 (CONS (CONS |x| (MKPF |y| 'OR))
                                       |bfVar#82|)))))
                  (SETQ |bfVar#81| (CDR |bfVar#81|))))
               NIL |revCondlist| NIL))
      (CONS |reducedUncondlist| |orCondlist|)))))
 
; reverseCondlist cl ==
;   alist := nil
;   for [x,:y] in cl repeat
;     for z in y repeat
;       u := assoc(z,alist)
;       null u => alist := [[z,x],:alist]
;       member(x, rest u) => nil
;       RPLACD(u, [x, :rest u])
;   alist
 
(DEFUN |reverseCondlist| (|cl|)
  (PROG (|alist| |x| |y| |u|)
    (RETURN
     (PROGN
      (SETQ |alist| NIL)
      ((LAMBDA (|bfVar#84| |bfVar#83|)
         (LOOP
          (COND
           ((OR (ATOM |bfVar#84|)
                (PROGN (SETQ |bfVar#83| (CAR |bfVar#84|)) NIL))
            (RETURN NIL))
           (#1='T
            (AND (CONSP |bfVar#83|)
                 (PROGN
                  (SETQ |x| (CAR |bfVar#83|))
                  (SETQ |y| (CDR |bfVar#83|))
                  #1#)
                 ((LAMBDA (|bfVar#85| |z|)
                    (LOOP
                     (COND
                      ((OR (ATOM |bfVar#85|)
                           (PROGN (SETQ |z| (CAR |bfVar#85|)) NIL))
                       (RETURN NIL))
                      (#1#
                       (PROGN
                        (SETQ |u| (|assoc| |z| |alist|))
                        (COND
                         ((NULL |u|)
                          (SETQ |alist| (CONS (LIST |z| |x|) |alist|)))
                         ((|member| |x| (CDR |u|)) NIL)
                         (#1# (RPLACD |u| (CONS |x| (CDR |u|))))))))
                     (SETQ |bfVar#85| (CDR |bfVar#85|))))
                  |y| NIL))))
          (SETQ |bfVar#84| (CDR |bfVar#84|))))
       |cl| NIL)
      |alist|))))
 
; NRTsetVector4a(sig,form,cond) ==
;   sig = '$ =>
;      domainList :=
;          [optimize COPY IFCAR comp(d, $EmptyMode, $e) or
;              d for d in $domainShell.4.0]
;      $uncondList := APPEND(domainList,$uncondList)
;      if isCategoryForm(form,$e) then $uncondList := [form,:$uncondList]
;      $uncondList
;   evalform := eval mkEvalableCategoryForm form
;   cond = true => $uncondList := [form,:APPEND(evalform.4.0,$uncondList)]
;   $condList := [[cond,[form,:evalform.4.0]],:$condList]
 
(DEFUN |NRTsetVector4a| (|sig| |form| |cond|)
  (PROG (|domainList| |evalform|)
    (RETURN
     (COND
      ((EQ |sig| '$)
       (PROGN
        (SETQ |domainList|
                ((LAMBDA (|bfVar#87| |bfVar#86| |d|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#86|)
                          (PROGN (SETQ |d| (CAR |bfVar#86|)) NIL))
                      (RETURN (NREVERSE |bfVar#87|)))
                     (#1='T
                      (SETQ |bfVar#87|
                              (CONS
                               (OR
                                (|optimize|
                                 (COPY (IFCAR (|comp| |d| |$EmptyMode| |$e|))))
                                |d|)
                               |bfVar#87|))))
                    (SETQ |bfVar#86| (CDR |bfVar#86|))))
                 NIL (ELT (ELT |$domainShell| 4) 0) NIL))
        (SETQ |$uncondList| (APPEND |domainList| |$uncondList|))
        (COND
         ((|isCategoryForm| |form| |$e|)
          (SETQ |$uncondList| (CONS |form| |$uncondList|))))
        |$uncondList|))
      (#1#
       (PROGN
        (SETQ |evalform| (|eval| (|mkEvalableCategoryForm| |form|)))
        (COND
         ((EQUAL |cond| T)
          (SETQ |$uncondList|
                  (CONS |form|
                        (APPEND (ELT (ELT |evalform| 4) 0) |$uncondList|))))
         (#1#
          (SETQ |$condList|
                  (CONS (LIST |cond| (CONS |form| (ELT (ELT |evalform| 4) 0)))
                        |$condList|))))))))))
 
; NRTmakeSlot1Info() ==
; -- 4 cases:
; -- a:T == b add c  --- slot1 directory has #s for entries defined in c
; -- a:T == b        --- slot1 has all slot #s = NIL (see compFunctorBody)
; -- a == b add c    --- not allowed (line 7 of getTargetFromRhs)
;   pairlis :=
;     $insideCategoryPackageIfTrue = true =>
;       [:argl,dollarName] := rest $form
;       [[dollarName,:'_$],:mkSlot1sublis argl]
;     mkSlot1sublis rest $form
;   lisplibOpAlist := transformOperationAlist SUBLIS(pairlis, $domainShell.1)
;   opList :=
;     $insideCategoryPackageIfTrue = true => slot1Filter lisplibOpAlist
;     lisplibOpAlist
;   addList := SUBLIS(pairlis,$NRTaddForm)
;   [first $form,[addList,:opList]]
 
(DEFUN |NRTmakeSlot1Info| ()
  (PROG (|addList| |opList| |lisplibOpAlist| |pairlis| |argl| |dollarName|
         |LETTMP#2| |LETTMP#1|)
    (RETURN
     (PROGN
      (SETQ |pairlis|
              (COND
               ((EQUAL |$insideCategoryPackageIfTrue| T)
                (PROGN
                 (SETQ |LETTMP#1| (CDR |$form|))
                 (SETQ |LETTMP#2| (REVERSE |LETTMP#1|))
                 (SETQ |dollarName| (CAR |LETTMP#2|))
                 (SETQ |argl| (NREVERSE (CDR |LETTMP#2|)))
                 (CONS (CONS |dollarName| '$) (|mkSlot1sublis| |argl|))))
               (#1='T (|mkSlot1sublis| (CDR |$form|)))))
      (SETQ |lisplibOpAlist|
              (|transformOperationAlist|
               (SUBLIS |pairlis| (ELT |$domainShell| 1))))
      (SETQ |opList|
              (COND
               ((EQUAL |$insideCategoryPackageIfTrue| T)
                (|slot1Filter| |lisplibOpAlist|))
               (#1# |lisplibOpAlist|)))
      (SETQ |addList| (SUBLIS |pairlis| |$NRTaddForm|))
      (LIST (CAR |$form|) (CONS |addList| |opList|))))))
 
; mkSlot1sublis argl ==
;   [[a,:b] for a in argl for b in $FormalMapVariableList]
 
(DEFUN |mkSlot1sublis| (|argl|)
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#90| |bfVar#88| |a| |bfVar#89| |b|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#88|) (PROGN (SETQ |a| (CAR |bfVar#88|)) NIL)
               (ATOM |bfVar#89|) (PROGN (SETQ |b| (CAR |bfVar#89|)) NIL))
           (RETURN (NREVERSE |bfVar#90|)))
          ('T (SETQ |bfVar#90| (CONS (CONS |a| |b|) |bfVar#90|))))
         (SETQ |bfVar#88| (CDR |bfVar#88|))
         (SETQ |bfVar#89| (CDR |bfVar#89|))))
      NIL |argl| NIL |$FormalMapVariableList| NIL))))
 
; slot1Filter opList ==
; --include only those ops which are defined within the capsule
;   [u for x in opList | u := fn x] where
;     fn [op,:l] ==
;       u := [entry for entry in l | INTEGERP CADR entry] => [op,:u]
;       nil
 
(DEFUN |slot1Filter| (|opList|)
  (PROG (|u|)
    (RETURN
     ((LAMBDA (|bfVar#92| |bfVar#91| |x|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#91|) (PROGN (SETQ |x| (CAR |bfVar#91|)) NIL))
           (RETURN (NREVERSE |bfVar#92|)))
          ('T
           (AND (SETQ |u| (|slot1Filter,fn| |x|))
                (SETQ |bfVar#92| (CONS |u| |bfVar#92|)))))
         (SETQ |bfVar#91| (CDR |bfVar#91|))))
      NIL |opList| NIL))))
(DEFUN |slot1Filter,fn| (|bfVar#95|)
  (PROG (|op| |l| |u|)
    (RETURN
     (PROGN
      (SETQ |op| (CAR |bfVar#95|))
      (SETQ |l| (CDR |bfVar#95|))
      (COND
       ((SETQ |u|
                ((LAMBDA (|bfVar#94| |bfVar#93| |entry|)
                   (LOOP
                    (COND
                     ((OR (ATOM |bfVar#93|)
                          (PROGN (SETQ |entry| (CAR |bfVar#93|)) NIL))
                      (RETURN (NREVERSE |bfVar#94|)))
                     (#1='T
                      (AND (INTEGERP (CADR |entry|))
                           (SETQ |bfVar#94| (CONS |entry| |bfVar#94|)))))
                    (SETQ |bfVar#93| (CDR |bfVar#93|))))
                 NIL |l| NIL))
        (CONS |op| |u|))
       (#1# NIL))))))
 
; NRToptimizeHas u ==
; --u is a list ((pred cond)...) -- see optFunctorBody
; --produces an alist: (((HasCategory a b) . GENSYM)...)
;   u is [a,:b] =>
;     a='HasCategory => LASSOC(u,$hasCategoryAlist) or
;       $hasCategoryAlist := [[u,:(y:=GENSYM())],:$hasCategoryAlist]
;       y
;     a='has => NRToptimizeHas ['HasCategory,first b,MKQ first rest b]
;     a = 'QUOTE => u
;     [NRToptimizeHas a,:NRToptimizeHas b]
;   u
 
(DEFUN |NRToptimizeHas| (|u|)
  (PROG (|a| |b| |y|)
    (RETURN
     (COND
      ((AND (CONSP |u|)
            (PROGN (SETQ |a| (CAR |u|)) (SETQ |b| (CDR |u|)) #1='T))
       (COND
        ((EQ |a| '|HasCategory|)
         (OR (LASSOC |u| |$hasCategoryAlist|)
             (PROGN
              (SETQ |$hasCategoryAlist|
                      (CONS (CONS |u| (SETQ |y| (GENSYM)))
                            |$hasCategoryAlist|))
              |y|)))
        ((EQ |a| '|has|)
         (|NRToptimizeHas|
          (LIST '|HasCategory| (CAR |b|) (MKQ (CAR (CDR |b|))))))
        ((EQ |a| 'QUOTE) |u|)
        (#1# (CONS (|NRToptimizeHas| |a|) (|NRToptimizeHas| |b|)))))
      (#1# |u|)))))
 
; NRTaddToSlam([name,:argnames],shell) ==
;   $mutableDomain => return nil
;   null argnames => addToConstructorCache(name,nil,shell)
;   args:= ['LIST,:ASSOCRIGHT $devaluateList]
;   addToConstructorCache(name,args,shell)
 
(DEFUN |NRTaddToSlam| (|bfVar#96| |shell|)
  (PROG (|name| |argnames| |args|)
    (RETURN
     (PROGN
      (SETQ |name| (CAR |bfVar#96|))
      (SETQ |argnames| (CDR |bfVar#96|))
      (COND (|$mutableDomain| (RETURN NIL))
            ((NULL |argnames|) (|addToConstructorCache| |name| NIL |shell|))
            ('T
             (PROGN
              (SETQ |args| (CONS 'LIST (ASSOCRIGHT |$devaluateList|)))
              (|addToConstructorCache| |name| |args| |shell|))))))))
 
; genOperationAlist() ==
;   $lisplibOperationAlist := [sigloc entry for entry in $domainShell.1] where
;     sigloc [opsig,pred,fnsel] ==
;         if pred ~= 'T then
;           pred := simpBool pred
;           $NRTslot1PredicateList := insert(pred,$NRTslot1PredicateList)
;         fnsel is [op,a,:.] and (op = 'ELT or op = 'CONST) =>
;           if $insideCategoryPackageIfTrue then
;               opsig := substitute('$,CADR($functorForm),opsig)
;           [opsig,pred,[op,a,vectorLocation(first opsig,CADR opsig)]]
;         [opsig,pred,fnsel]
 
(DEFUN |genOperationAlist| #1=()
  (PROG #1#
    (RETURN
     (SETQ |$lisplibOperationAlist|
             ((LAMBDA (|bfVar#98| |bfVar#97| |entry|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#97|)
                       (PROGN (SETQ |entry| (CAR |bfVar#97|)) NIL))
                   (RETURN (NREVERSE |bfVar#98|)))
                  ('T
                   (SETQ |bfVar#98|
                           (CONS (|genOperationAlist,sigloc| |entry|)
                                 |bfVar#98|))))
                 (SETQ |bfVar#97| (CDR |bfVar#97|))))
              NIL (ELT |$domainShell| 1) NIL)))))
(DEFUN |genOperationAlist,sigloc| (|bfVar#99|)
  (PROG (|opsig| |pred| |fnsel| |op| |ISTMP#1| |a|)
    (RETURN
     (PROGN
      (SETQ |opsig| (CAR |bfVar#99|))
      (SETQ |pred| (CADR . #1=(|bfVar#99|)))
      (SETQ |fnsel| (CADDR . #1#))
      (COND
       ((NOT (EQ |pred| 'T)) (SETQ |pred| (|simpBool| |pred|))
        (SETQ |$NRTslot1PredicateList|
                (|insert| |pred| |$NRTslot1PredicateList|))))
      (COND
       ((AND (CONSP |fnsel|)
             (PROGN
              (SETQ |op| (CAR |fnsel|))
              (SETQ |ISTMP#1| (CDR |fnsel|))
              (AND (CONSP |ISTMP#1|) (PROGN (SETQ |a| (CAR |ISTMP#1|)) #2='T)))
             (OR (EQ |op| 'ELT) (EQ |op| 'CONST)))
        (PROGN
         (COND
          (|$insideCategoryPackageIfTrue|
           (SETQ |opsig| (|substitute| '$ (CADR |$functorForm|) |opsig|))))
         (LIST |opsig| |pred|
               (LIST |op| |a|
                     (|vectorLocation| (CAR |opsig|) (CADR |opsig|))))))
       (#2# (LIST |opsig| |pred| |fnsel|)))))))
 
; changeDirectoryInSlot1() ==  --called by buildFunctor
;   genOperationAlist()
;   sortedOplist := listSort(function GLESSEQP,
;                            COPY_-LIST $lisplibOperationAlist,function CADR)
;   $lastPred :local := nil
;   $newEnv :local := $e
;   $domainShell.1 := [fn entry for entry in sortedOplist] where
;     fn [[op,sig],pred,fnsel] ==
;        if $lastPred ~= pred then
;             $newEnv := deepChaseInferences(pred,$e)
;             $lastPred := pred
;        newfnsel :=
;          fnsel is ['Subsumed,op1,sig1] =>
;            ['Subsumed, op1, genSlotSig(sig1, $newEnv)]
;          fnsel
;        [[op, genSlotSig(sig, $newEnv)], pred, newfnsel]
 
(DEFUN |changeDirectoryInSlot1| ()
  (PROG (|$newEnv| |$lastPred| |sortedOplist|)
    (DECLARE (SPECIAL |$newEnv| |$lastPred|))
    (RETURN
     (PROGN
      (|genOperationAlist|)
      (SETQ |sortedOplist|
              (|listSort| #'GLESSEQP (COPY-LIST |$lisplibOperationAlist|)
               #'CADR))
      (SETQ |$lastPred| NIL)
      (SETQ |$newEnv| |$e|)
      (SETF (ELT |$domainShell| 1)
              ((LAMBDA (|bfVar#101| |bfVar#100| |entry|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#100|)
                        (PROGN (SETQ |entry| (CAR |bfVar#100|)) NIL))
                    (RETURN (NREVERSE |bfVar#101|)))
                   ('T
                    (SETQ |bfVar#101|
                            (CONS (|changeDirectoryInSlot1,fn| |entry|)
                                  |bfVar#101|))))
                  (SETQ |bfVar#100| (CDR |bfVar#100|))))
               NIL |sortedOplist| NIL))))))
(DEFUN |changeDirectoryInSlot1,fn| (|bfVar#102|)
  (PROG (|op| |sig| |pred| |fnsel| |ISTMP#1| |op1| |ISTMP#2| |sig1| |newfnsel|)
    (RETURN
     (PROGN
      (SETQ |op| (CAAR . #1=(|bfVar#102|)))
      (SETQ |sig| (CADAR . #1#))
      (SETQ |pred| (CADR . #2=(|bfVar#102|)))
      (SETQ |fnsel| (CADDR . #2#))
      (COND
       ((NOT (EQUAL |$lastPred| |pred|))
        (SETQ |$newEnv| (|deepChaseInferences| |pred| |$e|))
        (SETQ |$lastPred| |pred|)))
      (SETQ |newfnsel|
              (COND
               ((AND (CONSP |fnsel|) (EQ (CAR |fnsel|) '|Subsumed|)
                     (PROGN
                      (SETQ |ISTMP#1| (CDR |fnsel|))
                      (AND (CONSP |ISTMP#1|)
                           (PROGN
                            (SETQ |op1| (CAR |ISTMP#1|))
                            (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                            (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                                 (PROGN
                                  (SETQ |sig1| (CAR |ISTMP#2|))
                                  #3='T))))))
                (LIST '|Subsumed| |op1| (|genSlotSig| |sig1| |$newEnv|)))
               (#3# |fnsel|)))
      (LIST (LIST |op| (|genSlotSig| |sig| |$newEnv|)) |pred| |newfnsel|)))))
 
; genSlotSig(sig, $e) ==
;    [genDeltaSig t for t in sig]
 
(DEFUN |genSlotSig| (|sig| |$e|)
  (DECLARE (SPECIAL |$e|))
  (PROG ()
    (RETURN
     ((LAMBDA (|bfVar#104| |bfVar#103| |t|)
        (LOOP
         (COND
          ((OR (ATOM |bfVar#103|) (PROGN (SETQ |t| (CAR |bfVar#103|)) NIL))
           (RETURN (NREVERSE |bfVar#104|)))
          ('T (SETQ |bfVar#104| (CONS (|genDeltaSig| |t|) |bfVar#104|))))
         (SETQ |bfVar#103| (CDR |bfVar#103|))))
      NIL |sig| NIL))))
 
; DEFPARAMETER($infoHash, nil)
 
(DEFPARAMETER |$infoHash| NIL)
 
; deepChaseInferences(pred,$e) ==
;     $infoHash : local := MAKE_-HASHTABLE 'EQUAL
;     deepChaseInferences1(pred,$e)
 
(DEFUN |deepChaseInferences| (|pred| |$e|)
  (DECLARE (SPECIAL |$e|))
  (PROG (|$infoHash|)
    (DECLARE (SPECIAL |$infoHash|))
    (RETURN
     (PROGN
      (SETQ |$infoHash| (MAKE-HASHTABLE 'EQUAL))
      (|deepChaseInferences1| |pred| |$e|)))))
 
; deepChaseInferences1(pred,$e) ==
;     pred is ['AND,:preds] or pred is ['and,:preds] =>
;         for p in preds repeat $e := deepChaseInferences1(p,$e)
;         $e
;     pred is ['OR,pred1,:.] or pred is ['or,pred1,:.] => $e
;     --    deepChaseInferences1(pred1,$e)
;     pred is 'T or pred is ['NOT,:.] or pred is ['not,:.] => $e
;     chaseInferences(pred,$e)
 
(DEFUN |deepChaseInferences1| (|pred| |$e|)
  (DECLARE (SPECIAL |$e|))
  (PROG (|preds| |ISTMP#1| |pred1|)
    (RETURN
     (COND
      ((OR
        (AND (CONSP |pred|) (EQ (CAR |pred|) 'AND)
             (PROGN (SETQ |preds| (CDR |pred|)) #1='T))
        (AND (CONSP |pred|) (EQ (CAR |pred|) '|and|)
             (PROGN (SETQ |preds| (CDR |pred|)) #1#)))
       (PROGN
        ((LAMBDA (|bfVar#105| |p|)
           (LOOP
            (COND
             ((OR (ATOM |bfVar#105|) (PROGN (SETQ |p| (CAR |bfVar#105|)) NIL))
              (RETURN NIL))
             (#1# (SETQ |$e| (|deepChaseInferences1| |p| |$e|))))
            (SETQ |bfVar#105| (CDR |bfVar#105|))))
         |preds| NIL)
        |$e|))
      ((OR
        (AND (CONSP |pred|) (EQ (CAR |pred|) 'OR)
             (PROGN
              (SETQ |ISTMP#1| (CDR |pred|))
              (AND (CONSP |ISTMP#1|)
                   (PROGN (SETQ |pred1| (CAR |ISTMP#1|)) #1#))))
        (AND (CONSP |pred|) (EQ (CAR |pred|) '|or|)
             (PROGN
              (SETQ |ISTMP#1| (CDR |pred|))
              (AND (CONSP |ISTMP#1|)
                   (PROGN (SETQ |pred1| (CAR |ISTMP#1|)) #1#)))))
       |$e|)
      ((OR (EQ |pred| 'T) (AND (CONSP |pred|) (EQ (CAR |pred|) 'NOT))
           (AND (CONSP |pred|) (EQ (CAR |pred|) '|not|)))
       |$e|)
      (#1# (|chaseInferences| |pred| |$e|))))))
 
; vectorLocation(op,sig) ==
;   u := or/[i for i in 1.. for u in $NRTdeltaList
;         | u is [=op,[='$,: xsig],:.] and sig=NRTsubstDelta(xsig) ]
;   u => $NRTdeltaLength - u + 6
;   nil    -- this signals that calls should be forwarded
 
(DEFUN |vectorLocation| (|op| |sig|)
  (PROG (|ISTMP#1| |ISTMP#2| |xsig| |u|)
    (RETURN
     (PROGN
      (SETQ |u|
              ((LAMBDA (|bfVar#107| |i| |bfVar#106| |u|)
                 (LOOP
                  (COND
                   ((OR (ATOM |bfVar#106|)
                        (PROGN (SETQ |u| (CAR |bfVar#106|)) NIL))
                    (RETURN |bfVar#107|))
                   (#1='T
                    (AND (CONSP |u|) (EQUAL (CAR |u|) |op|)
                         (PROGN
                          (SETQ |ISTMP#1| (CDR |u|))
                          (AND (CONSP |ISTMP#1|)
                               (PROGN
                                (SETQ |ISTMP#2| (CAR |ISTMP#1|))
                                (AND (CONSP |ISTMP#2|)
                                     (EQUAL (CAR |ISTMP#2|) '$)
                                     (PROGN
                                      (SETQ |xsig| (CDR |ISTMP#2|))
                                      #1#)))))
                         (EQUAL |sig| (|NRTsubstDelta| |xsig|))
                         (PROGN
                          (SETQ |bfVar#107| |i|)
                          (COND (|bfVar#107| (RETURN |bfVar#107|)))))))
                  (SETQ |i| (+ |i| 1))
                  (SETQ |bfVar#106| (CDR |bfVar#106|))))
               NIL 1 |$NRTdeltaList| NIL))
      (COND (|u| (+ (- |$NRTdeltaLength| |u|) 6)) (#1# NIL))))))
 
; NRTsubstDelta(initSig) ==
;   sig := [replaceSlotTypes s for s in initSig] where
;      replaceSlotTypes(t) ==
;         atom t =>
;           not INTEGERP t => t
;           t = 0 => '$
;           t = 2 => '_$_$
;           t = 5 => $NRTaddForm
;           u:= $NRTdeltaList.($NRTdeltaLength+5-t)
;           first u = 'domain => CADR u
;           error "bad $NRTdeltaList entry"
;         MEMQ(first t, '(Mapping Union Record _:)) =>
;            [first t, :[replaceSlotTypes(x) for x in rest t]]
;         t
 
(DEFUN |NRTsubstDelta| (|initSig|)
  (PROG (|sig|)
    (RETURN
     (SETQ |sig|
             ((LAMBDA (|bfVar#109| |bfVar#108| |s|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#108|)
                       (PROGN (SETQ |s| (CAR |bfVar#108|)) NIL))
                   (RETURN (NREVERSE |bfVar#109|)))
                  ('T
                   (SETQ |bfVar#109|
                           (CONS (|NRTsubstDelta,replaceSlotTypes| |s|)
                                 |bfVar#109|))))
                 (SETQ |bfVar#108| (CDR |bfVar#108|))))
              NIL |initSig| NIL)))))
(DEFUN |NRTsubstDelta,replaceSlotTypes| (|t|)
  (PROG (|u|)
    (RETURN
     (COND
      ((ATOM |t|)
       (COND ((NULL (INTEGERP |t|)) |t|) ((EQL |t| 0) '$) ((EQL |t| 2) '$$)
             ((EQL |t| 5) |$NRTaddForm|)
             (#1='T
              (PROGN
               (SETQ |u| (ELT |$NRTdeltaList| (- (+ |$NRTdeltaLength| 5) |t|)))
               (COND ((EQ (CAR |u|) '|domain|) (CADR |u|))
                     (#1# (|error| '|bad $NRTdeltaList entry|)))))))
      ((MEMQ (CAR |t|) '(|Mapping| |Union| |Record| |:|))
       (CONS (CAR |t|)
             ((LAMBDA (|bfVar#111| |bfVar#110| |x|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#110|)
                       (PROGN (SETQ |x| (CAR |bfVar#110|)) NIL))
                   (RETURN (NREVERSE |bfVar#111|)))
                  (#1#
                   (SETQ |bfVar#111|
                           (CONS (|NRTsubstDelta,replaceSlotTypes| |x|)
                                 |bfVar#111|))))
                 (SETQ |bfVar#110| (CDR |bfVar#110|))))
              NIL (CDR |t|) NIL)))
      (#1# |t|)))))
 
; NRTputInLocalReferences bod ==
;   $elt: local := ($QuickCode => 'QREFELT; 'ELT)
;   NRTputInHead bod
 
(DEFUN |NRTputInLocalReferences| (|bod|)
  (PROG (|$elt|)
    (DECLARE (SPECIAL |$elt|))
    (RETURN
     (PROGN
      (SETQ |$elt| (COND (|$QuickCode| 'QREFELT) ('T 'ELT)))
      (|NRTputInHead| |bod|)))))
 
; NRTputInHead bod ==
;   atom bod => bod
;   bod is ['SPADCALL,:args,fn] =>
;     NRTputInTail rest bod --NOTE: args = COPY of rest bod
;     -- The following test allows function-returning expressions
;     fn is [elt,dom,ind] and not (dom='$) and MEMQ(elt,'(ELT QREFELT CONST)) =>
;       k:= NRTassocIndex dom => RPLACA(LASTNODE bod,[$elt,'_$,k])
;       nil
;     NRTputInHead fn
;     bod
;   bod is ["COND",:clauses] =>
;     for cc in clauses repeat NRTputInTail cc
;     bod
;   bod is ["QUOTE",:.] => bod
;   bod is ["CLOSEDFN",:.] => bod
;   bod is ["SPADCONST",dom,ind] =>
;     BREAK()
;     RPLACA(bod,$elt)
;     dom = '_$ => nil
;     k:= NRTassocIndex dom =>
;       RPLACA(LASTNODE bod,[$elt,'_$,k])
;       bod
;     keyedSystemError("S2GE0016",['"NRTputInHead",
;        '"unexpected SPADCONST form"])
;   NRTputInHead first bod
;   NRTputInTail rest bod
;   bod
 
(DEFUN |NRTputInHead| (|bod|)
  (PROG (|ISTMP#1| |ISTMP#2| |fn| |args| |elt| |dom| |ind| |k| |clauses|)
    (RETURN
     (COND ((ATOM |bod|) |bod|)
           ((AND (CONSP |bod|) (EQ (CAR |bod|) 'SPADCALL)
                 (PROGN
                  (SETQ |ISTMP#1| (CDR |bod|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN (SETQ |ISTMP#2| (REVERSE |ISTMP#1|)) #1='T)
                       (CONSP |ISTMP#2|)
                       (PROGN
                        (SETQ |fn| (CAR |ISTMP#2|))
                        (SETQ |args| (CDR |ISTMP#2|))
                        #1#)
                       (PROGN (SETQ |args| (NREVERSE |args|)) #1#))))
            (PROGN
             (|NRTputInTail| (CDR |bod|))
             (COND
              ((AND (CONSP |fn|)
                    (PROGN
                     (SETQ |elt| (CAR |fn|))
                     (SETQ |ISTMP#1| (CDR |fn|))
                     (AND (CONSP |ISTMP#1|)
                          (PROGN
                           (SETQ |dom| (CAR |ISTMP#1|))
                           (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                           (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                                (PROGN (SETQ |ind| (CAR |ISTMP#2|)) #1#)))))
                    (NULL (EQ |dom| '$)) (MEMQ |elt| '(ELT QREFELT CONST)))
               (COND
                ((SETQ |k| (|NRTassocIndex| |dom|))
                 (RPLACA (LASTNODE |bod|) (LIST |$elt| '$ |k|)))
                (#1# NIL)))
              (#1# (PROGN (|NRTputInHead| |fn|) |bod|)))))
           ((AND (CONSP |bod|) (EQ (CAR |bod|) 'COND)
                 (PROGN (SETQ |clauses| (CDR |bod|)) #1#))
            (PROGN
             ((LAMBDA (|bfVar#112| |cc|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#112|)
                       (PROGN (SETQ |cc| (CAR |bfVar#112|)) NIL))
                   (RETURN NIL))
                  (#1# (|NRTputInTail| |cc|)))
                 (SETQ |bfVar#112| (CDR |bfVar#112|))))
              |clauses| NIL)
             |bod|))
           ((AND (CONSP |bod|) (EQ (CAR |bod|) 'QUOTE)) |bod|)
           ((AND (CONSP |bod|) (EQ (CAR |bod|) 'CLOSEDFN)) |bod|)
           ((AND (CONSP |bod|) (EQ (CAR |bod|) 'SPADCONST)
                 (PROGN
                  (SETQ |ISTMP#1| (CDR |bod|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN
                        (SETQ |dom| (CAR |ISTMP#1|))
                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                        (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                             (PROGN (SETQ |ind| (CAR |ISTMP#2|)) #1#))))))
            (PROGN
             (BREAK)
             (RPLACA |bod| |$elt|)
             (COND ((EQ |dom| '$) NIL)
                   ((SETQ |k| (|NRTassocIndex| |dom|))
                    (PROGN
                     (RPLACA (LASTNODE |bod|) (LIST |$elt| '$ |k|))
                     |bod|))
                   (#1#
                    (|keyedSystemError| 'S2GE0016
                     (LIST "NRTputInHead" "unexpected SPADCONST form"))))))
           (#1#
            (PROGN
             (|NRTputInHead| (CAR |bod|))
             (|NRTputInTail| (CDR |bod|))
             |bod|))))))
 
; NRTputInTail x ==
;   for y in tails x repeat
;     atom (u := first y) =>
;       EQ(u,'$) or LASSOC(u,$devaluateList) => nil
;       k:= NRTassocIndex u =>
;         atom u => RPLACA(y,[$elt,'_$,k])
;         -- u atomic means that the slot will always contain a vector
;         BREAK()
;       --this reference must check that slot is a vector
;       nil
;     NRTputInHead u
;   x
 
(DEFUN |NRTputInTail| (|x|)
  (PROG (|u| |k|)
    (RETURN
     (PROGN
      ((LAMBDA (|y|)
         (LOOP
          (COND ((ATOM |y|) (RETURN NIL))
                (#1='T
                 (COND
                  ((ATOM (SETQ |u| (CAR |y|)))
                   (COND ((OR (EQ |u| '$) (LASSOC |u| |$devaluateList|)) NIL)
                         ((SETQ |k| (|NRTassocIndex| |u|))
                          (COND ((ATOM |u|) (RPLACA |y| (LIST |$elt| '$ |k|)))
                                (#1# (BREAK))))
                         (#1# NIL)))
                  (#1# (|NRTputInHead| |u|)))))
          (SETQ |y| (CDR |y|))))
       |x|)
      |x|))))
 
; NRTdescendCodeTran(u, condList) ==
;     -- NRTbuildFunctor calls to fill $template slots with names of
;     -- compiled functions
;     null u => nil
;     u is ['LIST] => nil
;     u is [op, ., i, a] and MEMQ(op, '(SETELT QSETREFV)) =>
;         null condList and a is ['CONS, fn, :.] =>
;             RPLACA(u, 'LIST)
;             RPLACD(u, nil)
;             $template.i :=
;                 fn = 'IDENTITY => a
;                 fn is ['dispatchFunction, fn'] => fn'
;                 fn
;         a is ['CONS, 'IDENTITY, ['FUNCALL, fn, "$"]] =>
;             na := [['FUNCTION, 'makeSpadConstant], ["LIST", fn, "$", i]]
;             RPLACD(a, na)
;             nil
;         nil   --code for this will be generated by the instantiator
;     u is ['COND, :c] =>
;         for [pred, :y] in c|y repeat
;             NRTdescendCodeTran(first y, [pred, :condList])
;     u is ['PROGN, :c] => for x in c repeat NRTdescendCodeTran(x, condList)
;     nil
 
(DEFUN |NRTdescendCodeTran| (|u| |condList|)
  (PROG (|op| |ISTMP#1| |ISTMP#2| |i| |ISTMP#3| |a| |fn| |fn'| |ISTMP#4|
         |ISTMP#5| |na| |c| |pred| |y|)
    (RETURN
     (COND ((NULL |u|) NIL)
           ((AND (CONSP |u|) (EQ (CDR |u|) NIL) (EQ (CAR |u|) 'LIST)) NIL)
           ((AND (CONSP |u|)
                 (PROGN
                  (SETQ |op| (CAR |u|))
                  (SETQ |ISTMP#1| (CDR |u|))
                  (AND (CONSP |ISTMP#1|)
                       (PROGN
                        (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                        (AND (CONSP |ISTMP#2|)
                             (PROGN
                              (SETQ |i| (CAR |ISTMP#2|))
                              (SETQ |ISTMP#3| (CDR |ISTMP#2|))
                              (AND (CONSP |ISTMP#3|) (EQ (CDR |ISTMP#3|) NIL)
                                   (PROGN
                                    (SETQ |a| (CAR |ISTMP#3|))
                                    #1='T)))))))
                 (MEMQ |op| '(SETELT QSETREFV)))
            (COND
             ((AND (NULL |condList|) (CONSP |a|) (EQ (CAR |a|) 'CONS)
                   (PROGN
                    (SETQ |ISTMP#1| (CDR |a|))
                    (AND (CONSP |ISTMP#1|)
                         (PROGN (SETQ |fn| (CAR |ISTMP#1|)) #1#))))
              (PROGN
               (RPLACA |u| 'LIST)
               (RPLACD |u| NIL)
               (SETF (ELT |$template| |i|)
                       (COND ((EQ |fn| 'IDENTITY) |a|)
                             ((AND (CONSP |fn|)
                                   (EQ (CAR |fn|) '|dispatchFunction|)
                                   (PROGN
                                    (SETQ |ISTMP#1| (CDR |fn|))
                                    (AND (CONSP |ISTMP#1|)
                                         (EQ (CDR |ISTMP#1|) NIL)
                                         (PROGN
                                          (SETQ |fn'| (CAR |ISTMP#1|))
                                          #1#))))
                              |fn'|)
                             (#1# |fn|)))))
             ((AND (CONSP |a|) (EQ (CAR |a|) 'CONS)
                   (PROGN
                    (SETQ |ISTMP#1| (CDR |a|))
                    (AND (CONSP |ISTMP#1|) (EQ (CAR |ISTMP#1|) 'IDENTITY)
                         (PROGN
                          (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                          (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                               (PROGN
                                (SETQ |ISTMP#3| (CAR |ISTMP#2|))
                                (AND (CONSP |ISTMP#3|)
                                     (EQ (CAR |ISTMP#3|) 'FUNCALL)
                                     (PROGN
                                      (SETQ |ISTMP#4| (CDR |ISTMP#3|))
                                      (AND (CONSP |ISTMP#4|)
                                           (PROGN
                                            (SETQ |fn| (CAR |ISTMP#4|))
                                            (SETQ |ISTMP#5| (CDR |ISTMP#4|))
                                            (AND (CONSP |ISTMP#5|)
                                                 (EQ (CDR |ISTMP#5|) NIL)
                                                 (EQ (CAR |ISTMP#5|)
                                                     '$))))))))))))
              (PROGN
               (SETQ |na|
                       (LIST (LIST 'FUNCTION '|makeSpadConstant|)
                             (LIST 'LIST |fn| '$ |i|)))
               (RPLACD |a| |na|)
               NIL))
             (#1# NIL)))
           ((AND (CONSP |u|) (EQ (CAR |u|) 'COND)
                 (PROGN (SETQ |c| (CDR |u|)) #1#))
            ((LAMBDA (|bfVar#114| |bfVar#113|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#114|)
                      (PROGN (SETQ |bfVar#113| (CAR |bfVar#114|)) NIL))
                  (RETURN NIL))
                 (#1#
                  (AND (CONSP |bfVar#113|)
                       (PROGN
                        (SETQ |pred| (CAR |bfVar#113|))
                        (SETQ |y| (CDR |bfVar#113|))
                        #1#)
                       |y|
                       (|NRTdescendCodeTran| (CAR |y|)
                        (CONS |pred| |condList|)))))
                (SETQ |bfVar#114| (CDR |bfVar#114|))))
             |c| NIL))
           ((AND (CONSP |u|) (EQ (CAR |u|) 'PROGN)
                 (PROGN (SETQ |c| (CDR |u|)) #1#))
            ((LAMBDA (|bfVar#115| |x|)
               (LOOP
                (COND
                 ((OR (ATOM |bfVar#115|)
                      (PROGN (SETQ |x| (CAR |bfVar#115|)) NIL))
                  (RETURN NIL))
                 (#1# (|NRTdescendCodeTran| |x| |condList|)))
                (SETQ |bfVar#115| (CDR |bfVar#115|))))
             |c| NIL))
           (#1# NIL)))))
 
; NRTaddInner x ==
; --called by genDeltaEntry and others that affect $NRTdeltaList
;   PROGN
;     atom x => nil
;     x is ['Record, :l] =>
;         for [., ., y] in l repeat NRTinnerGetLocalIndex y
;     first x in '(Union Mapping) =>
;         for y in rest x repeat
;             y is [":", ., z] => NRTinnerGetLocalIndex z
;             NRTinnerGetLocalIndex y
;     x is ['SubDomain, y, :.] => NRTinnerGetLocalIndex y
;     getConstructorSignature x is [., :ml] =>
;         for y in rest x for m in ml | not (y = '$) repeat
;             isCategoryForm(m, $CategoryFrame) => NRTinnerGetLocalIndex y
;     keyedSystemError("S2NR0003", [x])
;   x
 
(DEFUN |NRTaddInner| (|x|)
  (PROG (|l| |ISTMP#1| |ISTMP#2| |y| |z| |ml|)
    (RETURN
     (PROGN
      (COND ((ATOM |x|) NIL)
            ((AND (CONSP |x|) (EQ (CAR |x|) '|Record|)
                  (PROGN (SETQ |l| (CDR |x|)) #1='T))
             ((LAMBDA (|bfVar#117| |bfVar#116|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#117|)
                       (PROGN (SETQ |bfVar#116| (CAR |bfVar#117|)) NIL))
                   (RETURN NIL))
                  (#1#
                   (AND (CONSP |bfVar#116|)
                        (PROGN
                         (SETQ |ISTMP#1| (CDR |bfVar#116|))
                         (AND (CONSP |ISTMP#1|)
                              (PROGN
                               (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                               (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                                    (PROGN (SETQ |y| (CAR |ISTMP#2|)) #1#)))))
                        (|NRTinnerGetLocalIndex| |y|))))
                 (SETQ |bfVar#117| (CDR |bfVar#117|))))
              |l| NIL))
            ((|member| (CAR |x|) '(|Union| |Mapping|))
             ((LAMBDA (|bfVar#118| |y|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#118|)
                       (PROGN (SETQ |y| (CAR |bfVar#118|)) NIL))
                   (RETURN NIL))
                  (#1#
                   (COND
                    ((AND (CONSP |y|) (EQ (CAR |y|) '|:|)
                          (PROGN
                           (SETQ |ISTMP#1| (CDR |y|))
                           (AND (CONSP |ISTMP#1|)
                                (PROGN
                                 (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                                 (AND (CONSP |ISTMP#2|)
                                      (EQ (CDR |ISTMP#2|) NIL)
                                      (PROGN
                                       (SETQ |z| (CAR |ISTMP#2|))
                                       #1#))))))
                     (|NRTinnerGetLocalIndex| |z|))
                    (#1# (|NRTinnerGetLocalIndex| |y|)))))
                 (SETQ |bfVar#118| (CDR |bfVar#118|))))
              (CDR |x|) NIL))
            ((AND (CONSP |x|) (EQ (CAR |x|) '|SubDomain|)
                  (PROGN
                   (SETQ |ISTMP#1| (CDR |x|))
                   (AND (CONSP |ISTMP#1|)
                        (PROGN (SETQ |y| (CAR |ISTMP#1|)) #1#))))
             (|NRTinnerGetLocalIndex| |y|))
            ((PROGN
              (SETQ |ISTMP#1| (|getConstructorSignature| |x|))
              (AND (CONSP |ISTMP#1|) (PROGN (SETQ |ml| (CDR |ISTMP#1|)) #1#)))
             ((LAMBDA (|bfVar#119| |y| |bfVar#120| |m|)
                (LOOP
                 (COND
                  ((OR (ATOM |bfVar#119|)
                       (PROGN (SETQ |y| (CAR |bfVar#119|)) NIL)
                       (ATOM |bfVar#120|)
                       (PROGN (SETQ |m| (CAR |bfVar#120|)) NIL))
                   (RETURN NIL))
                  (#1#
                   (AND (NULL (EQ |y| '$))
                        (COND
                         ((|isCategoryForm| |m| |$CategoryFrame|)
                          (IDENTITY (|NRTinnerGetLocalIndex| |y|)))))))
                 (SETQ |bfVar#119| (CDR |bfVar#119|))
                 (SETQ |bfVar#120| (CDR |bfVar#120|))))
              (CDR |x|) NIL |ml| NIL))
            (#1# (|keyedSystemError| 'S2NR0003 (LIST |x|))))
      |x|))))
 
; NRTinnerGetLocalIndex x ==
;     atom x => x
;     -- following test should skip Unions, Records, Mapping
;     MEMQ(opOf x, '(Union Record Mapping)) => NRTgetLocalIndex x
;     constructor?(x) => NRTgetLocalIndex x
;     NRTaddInner x
 
(DEFUN |NRTinnerGetLocalIndex| (|x|)
  (PROG ()
    (RETURN
     (COND ((ATOM |x|) |x|)
           ((MEMQ (|opOf| |x|) '(|Union| |Record| |Mapping|))
            (|NRTgetLocalIndex| |x|))
           ((|constructor?| |x|) (|NRTgetLocalIndex| |x|))
           ('T (|NRTaddInner| |x|))))))
