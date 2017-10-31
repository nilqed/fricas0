
(PUT '|NONE1;coerce;SN;1| '|SPADreplace| '(XLAM (|s|) |s|)) 

(SDEFUN |NONE1;coerce;SN;1| ((|s| S) ($ |None|)) |s|) 

(DECLAIM (NOTINLINE |NoneFunctions1;|)) 

(DEFUN |NoneFunctions1| (#1=#:G691)
  (SPROG NIL
         (PROG (#2=#:G692)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|NoneFunctions1|)
                                               '|domainEqualList|)
                    . #3=(|NoneFunctions1|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|NoneFunctions1;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|NoneFunctions1|)))))))))) 

(DEFUN |NoneFunctions1;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|NoneFunctions1|))
          (LETT |dv$| (LIST '|NoneFunctions1| DV$1) . #1#)
          (LETT $ (GETREFV 9) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|NoneFunctions1| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|NoneFunctions1| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|None|)
              |NONE1;coerce;SN;1|)
           '#(|coerce| 0) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#() (CONS '#() (|makeByteWordVec2| 8 '(1 0 7 6 8)))))
           '|lookupComplete|)) 
