
(SDEFUN |FUNCTION;name;%S;1| ((|r| (%)) (% (|Symbol|))) (QREFELT % 6)) 

(SDEFUN |FUNCTION;coerce;%Of;2| ((|r| (%)) (% (|OutputForm|)))
        (|outputMapTran| (QREFELT % 6) |r|)) 

(PUT '|FUNCTION;=;2%B;3| '|SPADreplace| '(XLAM (|x| |y|) 'T)) 

(SDEFUN |FUNCTION;=;2%B;3| ((|x| (%)) (|y| (%)) (% (|Boolean|))) 'T) 

(DECLAIM (NOTINLINE |FunctionCalled;|)) 

(DEFUN |FunctionCalled;| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 |#1|)
          (LETT |dv$| (LIST '|FunctionCalled| DV$1))
          (LETT % (GETREFV 14))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|FunctionCalled| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |FunctionCalled| (#1=#:G3)
  (SPROG NIL
         (PROG (#2=#:G4)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FunctionCalled|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|FunctionCalled;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|FunctionCalled|)))))))))) 

(MAKEPROP '|FunctionCalled| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Symbol|)
              |FUNCTION;name;%S;1| (|OutputForm|) |FUNCTION;coerce;%Of;2|
              (|Boolean|) |FUNCTION;=;2%B;3| (|String|))
           '#(~= 0 |name| 6 |latex| 11 |coerce| 16 = 21) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| NIL |BasicType&|)
                       (CONS
                        '#((|SetCategory|) (|CoercibleTo| 9) (|BasicType|))
                        (|makeByteWordVec2| 13
                                            '(2 0 11 0 0 1 1 0 7 0 8 1 0 13 0 1
                                              1 0 9 0 10 2 0 11 0 0 12)))))
           '|lookupComplete|)) 
