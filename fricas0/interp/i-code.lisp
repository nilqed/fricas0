 
; )package "BOOT"
 
(IN-PACKAGE "BOOT")
 
; intCodeGenCOERCE(triple,t2) ==
;   -- NOTE: returns a triple
;   t1 := objMode triple
;   t1 = $EmptyMode => NIL
;   t1 = t2 => triple
;   val := objVal triple
; 
;   val is ['THROW,label,code] =>
;     if label is ['QUOTE, l] then label := l
;     null($compilingMap) or (label ~= mapCatchName($mapName)) =>
;       objNew(['THROW,label,wrapped2Quote objVal
;         intCodeGenCOERCE(objNew(code,t1),t2)],t2)
;     -- we have a return statement. just send it back as is
;     objNew(val,t2)
; 
;   val is ['PROGN,:code,lastCode] =>
;     objNew(['PROGN,:code,wrapped2Quote objVal
;       intCodeGenCOERCE(objNew(lastCode,t1),t2)],t2)
; 
;   val is ['COND,:conds] =>
;     objNew(['COND,
;       :[[p,wrapped2Quote objVal intCodeGenCOERCE(objNew(v,t1),t2)]
;         for [p,v] in conds]],t2)
; 
;   -- specially handle subdomain
;   absolutelyCanCoerceByCheating(t1,t2) => objNew(val,t2)
; 
;   -- specially handle coerce to Any
;   t2 = '(Any) => objNew(['CONS,MKQ t1,val],t2)
; 
;   -- optimize coerces from Any
;   (t1 = '(Any)) and (val is [ ='CONS,t1',val']) =>
;     intCodeGenCOERCE(objNew(val',removeQuote t1'),t2)
; 
;   -- specially handle coerce from Equation to Boolean
;   (t1 is ['Equation,:.]) and (t2 = $Boolean) =>
;     coerceByFunction(triple,t2)
; 
;   -- next is hack for if-then-elses
;   (t1 = '$NoValueMode) and (val is ['COND,pred]) =>
;     code :=
;       ['COND,pred,
;         [MKQ true,['throwKeyedMsg,MKQ "S2IM0016",MKQ $mapName]]]
;     objNew(code,t2)
; 
;   -- optimize coerces to OutputForm
;   t2 = $OutputForm =>
;     coerceByFunction(triple,t2)
; 
;   isSubDomain(t1, $Integer) =>
;     intCodeGenCOERCE(objNew(val, $Integer), t2)
; 
;   -- generate code
;   -- 1. See if the coercion will go through (absolutely)
;   --    Must be careful about variables or else things like
;   --    P I --> P[x] P I might not have the x in the original polynomial
;   --    put in the correct place
; 
;   (not containsVariables(t2)) and canCoerceByFunction(t1,t2) =>
;     -- try coerceByFunction
;     (not canCoerceByMap(t1,t2)) and
;       (code := coerceByFunction(triple,t2)) => code
;     intCodeGenCoerce1(val,t1,t2)
; 
;   -- 2. Set up a failure point otherwise
; 
;   intCodeGenCoerce1(val,t1,t2)
 
(DEFUN |intCodeGenCOERCE| (|triple| |t2|)
  (PROG (|t1| |val| |ISTMP#1| |label| |ISTMP#2| |code| |l| |lastCode| |conds|
         |p| |v| |t1'| |val'| |pred|)
    (RETURN
     (PROGN
      (SETQ |t1| (|objMode| |triple|))
      (COND ((EQUAL |t1| |$EmptyMode|) NIL) ((EQUAL |t1| |t2|) |triple|)
            (#1='T
             (PROGN
              (SETQ |val| (|objVal| |triple|))
              (COND
               ((AND (CONSP |val|) (EQ (CAR |val|) 'THROW)
                     (PROGN
                      (SETQ |ISTMP#1| (CDR |val|))
                      (AND (CONSP |ISTMP#1|)
                           (PROGN
                            (SETQ |label| (CAR |ISTMP#1|))
                            (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                            (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                                 (PROGN (SETQ |code| (CAR |ISTMP#2|)) #1#))))))
                (PROGN
                 (COND
                  ((AND (CONSP |label|) (EQ (CAR |label|) 'QUOTE)
                        (PROGN
                         (SETQ |ISTMP#1| (CDR |label|))
                         (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                              (PROGN (SETQ |l| (CAR |ISTMP#1|)) #1#))))
                   (SETQ |label| |l|)))
                 (COND
                  ((OR (NULL |$compilingMap|)
                       (NOT (EQUAL |label| (|mapCatchName| |$mapName|))))
                   (|objNew|
                    (LIST 'THROW |label|
                          (|wrapped2Quote|
                           (|objVal|
                            (|intCodeGenCOERCE| (|objNew| |code| |t1|) |t2|))))
                    |t2|))
                  (#1# (|objNew| |val| |t2|)))))
               ((AND (CONSP |val|) (EQ (CAR |val|) 'PROGN)
                     (PROGN
                      (SETQ |ISTMP#1| (CDR |val|))
                      (AND (CONSP |ISTMP#1|)
                           (PROGN (SETQ |ISTMP#2| (REVERSE |ISTMP#1|)) #1#)
                           (CONSP |ISTMP#2|)
                           (PROGN
                            (SETQ |lastCode| (CAR |ISTMP#2|))
                            (SETQ |code| (CDR |ISTMP#2|))
                            #1#)
                           (PROGN (SETQ |code| (NREVERSE |code|)) #1#))))
                (|objNew|
                 (CONS 'PROGN
                       (APPEND |code|
                               (CONS
                                (|wrapped2Quote|
                                 (|objVal|
                                  (|intCodeGenCOERCE|
                                   (|objNew| |lastCode| |t1|) |t2|)))
                                NIL)))
                 |t2|))
               ((AND (CONSP |val|) (EQ (CAR |val|) 'COND)
                     (PROGN (SETQ |conds| (CDR |val|)) #1#))
                (|objNew|
                 (CONS 'COND
                       ((LAMBDA (|bfVar#3| |bfVar#2| |bfVar#1|)
                          (LOOP
                           (COND
                            ((OR (ATOM |bfVar#2|)
                                 (PROGN (SETQ |bfVar#1| (CAR |bfVar#2|)) NIL))
                             (RETURN (NREVERSE |bfVar#3|)))
                            (#1#
                             (AND (CONSP |bfVar#1|)
                                  (PROGN
                                   (SETQ |p| (CAR |bfVar#1|))
                                   (SETQ |ISTMP#1| (CDR |bfVar#1|))
                                   (AND (CONSP |ISTMP#1|)
                                        (EQ (CDR |ISTMP#1|) NIL)
                                        (PROGN
                                         (SETQ |v| (CAR |ISTMP#1|))
                                         #1#)))
                                  (SETQ |bfVar#3|
                                          (CONS
                                           (LIST |p|
                                                 (|wrapped2Quote|
                                                  (|objVal|
                                                   (|intCodeGenCOERCE|
                                                    (|objNew| |v| |t1|)
                                                    |t2|))))
                                           |bfVar#3|)))))
                           (SETQ |bfVar#2| (CDR |bfVar#2|))))
                        NIL |conds| NIL))
                 |t2|))
               ((|absolutelyCanCoerceByCheating| |t1| |t2|)
                (|objNew| |val| |t2|))
               ((EQUAL |t2| '(|Any|))
                (|objNew| (LIST 'CONS (MKQ |t1|) |val|) |t2|))
               ((AND (EQUAL |t1| '(|Any|)) (CONSP |val|)
                     (EQUAL (CAR |val|) 'CONS)
                     (PROGN
                      (SETQ |ISTMP#1| (CDR |val|))
                      (AND (CONSP |ISTMP#1|)
                           (PROGN
                            (SETQ |t1'| (CAR |ISTMP#1|))
                            (SETQ |ISTMP#2| (CDR |ISTMP#1|))
                            (AND (CONSP |ISTMP#2|) (EQ (CDR |ISTMP#2|) NIL)
                                 (PROGN (SETQ |val'| (CAR |ISTMP#2|)) #1#))))))
                (|intCodeGenCOERCE| (|objNew| |val'| (|removeQuote| |t1'|))
                 |t2|))
               ((AND (CONSP |t1|) (EQ (CAR |t1|) '|Equation|)
                     (EQUAL |t2| |$Boolean|))
                (|coerceByFunction| |triple| |t2|))
               ((AND (EQ |t1| '|$NoValueMode|) (CONSP |val|)
                     (EQ (CAR |val|) 'COND)
                     (PROGN
                      (SETQ |ISTMP#1| (CDR |val|))
                      (AND (CONSP |ISTMP#1|) (EQ (CDR |ISTMP#1|) NIL)
                           (PROGN (SETQ |pred| (CAR |ISTMP#1|)) #1#))))
                (PROGN
                 (SETQ |code|
                         (LIST 'COND |pred|
                               (LIST (MKQ T)
                                     (LIST '|throwKeyedMsg| (MKQ 'S2IM0016)
                                           (MKQ |$mapName|)))))
                 (|objNew| |code| |t2|)))
               ((EQUAL |t2| |$OutputForm|) (|coerceByFunction| |triple| |t2|))
               ((|isSubDomain| |t1| |$Integer|)
                (|intCodeGenCOERCE| (|objNew| |val| |$Integer|) |t2|))
               ((AND (NULL (|containsVariables| |t2|))
                     (|canCoerceByFunction| |t1| |t2|))
                (COND
                 ((AND (NULL (|canCoerceByMap| |t1| |t2|))
                       (SETQ |code| (|coerceByFunction| |triple| |t2|)))
                  |code|)
                 (#1# (|intCodeGenCoerce1| |val| |t1| |t2|))))
               (#1# (|intCodeGenCoerce1| |val| |t1| |t2|))))))))))
 
; intCodeGenCoerce1(val,t1,t2) ==
;   -- Internal function to previous one
;   -- designed to ensure that we don't use coerceOrCroak on mappings
; --(t2 is ['Mapping,:.]) => THROW('coerceOrCroaker, 'croaked)
;   objNew(['coerceOrCroak,mkObjCode(['wrap,val],t1),
;         MKQ t2, MKQ $mapName],t2)
 
(DEFUN |intCodeGenCoerce1| (|val| |t1| |t2|)
  (PROG ()
    (RETURN
     (|objNew|
      (LIST '|coerceOrCroak| (|mkObjCode| (LIST '|wrap| |val|) |t1|) (MKQ |t2|)
            (MKQ |$mapName|))
      |t2|))))
 
; wrapMapBodyWithCatch body ==
;   -- places a CATCH around the map body
;   -- note that we will someday have to fix up the catch identifier
;   -- to use the generated internal map name
;   $mapThrowCount = 0 => body
;   ['CATCH, MKQ mapCatchName $mapName, body]
 
(DEFUN |wrapMapBodyWithCatch| (|body|)
  (PROG ()
    (RETURN
     (COND ((EQL |$mapThrowCount| 0) |body|)
           ('T (LIST 'CATCH (MKQ (|mapCatchName| |$mapName|)) |body|))))))
