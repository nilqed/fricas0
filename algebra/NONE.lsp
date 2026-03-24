
(SDEFUN |NONE;coerce;%Of;1| ((|none| (%)) (% (|OutputForm|)))
        (SPADCALL "NONE" (QREFELT % 8))) 

(PUT '|NONE;=;2%B;2| '|SPADreplace| 'EQ) 

(SDEFUN |NONE;=;2%B;2| ((|x| (%)) (|y| (%)) (% (|Boolean|))) (EQ |x| |y|)) 

(DECLAIM (NOTINLINE |None;|)) 

(DEFUN |None;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|None|))
          (LETT % (GETREFV 12))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|None| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |None| ()
  (SPROG NIL
         (PROG (#1=#:G3)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|None|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|None|
                             (LIST (CONS NIL (CONS 1 (|None;|))))))
                    (LETT #1# T))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|None|)))))))))) 

(MAKEPROP '|None| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|String|) (|OutputForm|) (0 . |message|)
              |NONE;coerce;%Of;1| (|Boolean|) |NONE;=;2%B;2|)
           '#(~= 5 |latex| 11 |coerce| 16 = 21) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| NIL |BasicType&|)
                       (CONS
                        '#((|SetCategory|) (|CoercibleTo| 7) (|BasicType|))
                        (|makeByteWordVec2| 11
                                            '(1 7 0 6 8 2 0 10 0 0 1 1 0 6 0 1
                                              1 0 7 0 9 2 0 10 0 0 11)))))
           '|lookupComplete|)) 
