
(SDEFUN |VARIABLE;coerce;%S;1| ((|x| (%)) (% (|Symbol|))) (QREFELT % 6)) 

(SDEFUN |VARIABLE;coerce;%Of;2| ((|x| (%)) (% (|OutputForm|)))
        (SPADCALL (QREFELT % 6) (QREFELT % 10))) 

(SDEFUN |VARIABLE;variable;S;3| ((% (|Symbol|))) (QREFELT % 6)) 

(PUT '|VARIABLE;=;2%B;4| '|SPADreplace| '(XLAM (|x| |y|) 'T)) 

(SDEFUN |VARIABLE;=;2%B;4| ((|x| (%)) (|y| (%)) (% (|Boolean|))) 'T) 

(DECLAIM (NOTINLINE |Variable;|)) 

(DEFUN |Variable;| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 |#1|)
          (LETT |dv$| (LIST '|Variable| DV$1))
          (LETT % (GETREFV 16))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|Variable| (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |Variable| (#1=#:G4)
  (SPROG NIL
         (PROG (#2=#:G5)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST #1#)
                                               (HGET |$ConstructorCache|
                                                     '|Variable|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|Variable;| #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Variable|)))))))))) 

(MAKEPROP '|Variable| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Symbol|)
              |VARIABLE;coerce;%S;1| (|OutputForm|) (0 . |coerce|)
              |VARIABLE;coerce;%Of;2| |VARIABLE;variable;S;3| (|Boolean|)
              |VARIABLE;=;2%B;4| (|String|))
           '#(~= 5 |variable| 11 |latex| 15 |coerce| 20 = 30) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(|SetCategory&| NIL NIL |BasicType&|)
                       (CONS
                        '#((|SetCategory|) (|CoercibleTo| 9) (|CoercibleTo| 7)
                           (|BasicType|))
                        (|makeByteWordVec2| 15
                                            '(1 7 9 0 10 2 0 13 0 0 1 0 0 7 12
                                              1 0 15 0 1 1 0 9 0 11 1 0 7 0 8 2
                                              0 13 0 0 14)))))
           '|lookupComplete|)) 
