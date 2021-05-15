
(SDEFUN |FORMULA1;coerce;SSff;1| ((|s| S) ($ |ScriptFormulaFormat|))
        (SPADCALL (SPADCALL |s| (QREFELT $ 8)) (QREFELT $ 10))) 

(DECLAIM (NOTINLINE |ScriptFormulaFormat1;|)) 

(DEFUN |ScriptFormulaFormat1| (#1=#:G379)
  (SPROG NIL
         (PROG (#2=#:G380)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|ScriptFormulaFormat1|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|ScriptFormulaFormat1;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|ScriptFormulaFormat1|)))))))))) 

(DEFUN |ScriptFormulaFormat1;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|ScriptFormulaFormat1| DV$1))
          (LETT $ (GETREFV 12))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|ScriptFormulaFormat1| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|ScriptFormulaFormat1| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|OutputForm|)
              (0 . |coerce|) (|ScriptFormulaFormat|) (5 . |coerce|)
              |FORMULA1;coerce;SSff;1|)
           '#(|coerce| 10) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|coerce| ((|ScriptFormulaFormat|) |#1|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 11
                                            '(1 6 7 0 8 1 9 0 7 10 1 0 9 6
                                              11)))))
           '|lookupComplete|)) 
