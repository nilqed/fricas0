
(PUT '|NONE;coerce;$Of;1| '|SPADreplace| '(XLAM (|none|) "NONE")) 

(SDEFUN |NONE;coerce;$Of;1| ((|none| $) ($ |OutputForm|)) "NONE") 

(PUT '|NONE;=;2$B;2| '|SPADreplace| 'EQ) 

(SDEFUN |NONE;=;2$B;2| ((|x| $) (|y| $) ($ |Boolean|)) (EQ |x| |y|)) 

(DECLAIM (NOTINLINE |None;|)) 

(DEFUN |None| ()
  (SPROG NIL
         (PROG (#1=#:G694)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|None|) . #2=(|None|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|None|
                             (LIST (CONS NIL (CONS 1 (|None;|))))))
                    (LETT #1# T . #2#))
                (COND ((NOT #1#) (HREM |$ConstructorCache| '|None|)))))))))) 

(DEFUN |None;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|None|) . #1=(|None|))
          (LETT $ (GETREFV 13) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|None| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|None| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|OutputForm|) |NONE;coerce;$Of;1|
              (|Boolean|) |NONE;=;2$B;2| (|String|) (|SingleInteger|)
              (|HashState|))
           '#(~= 0 |latex| 6 |hashUpdate!| 11 |hash| 17 |coerce| 22 = 27) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|) (|CoercibleTo| 6))
                        (|makeByteWordVec2| 12
                                            '(2 0 8 0 0 1 1 0 10 0 1 2 0 12 12
                                              0 1 1 0 11 0 1 1 0 6 0 7 2 0 8 0
                                              0 9)))))
           '|lookupComplete|)) 

(MAKEPROP '|None| 'NILADIC T) 
