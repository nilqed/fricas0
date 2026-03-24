
(PUT '|ANON;coerce;%Of;1| '|SPADreplace| '|outputTranAnon|) 

(SDEFUN |ANON;coerce;%Of;1| ((|x| (%)) (% (|OutputForm|)))
        (|outputTranAnon| |x|)) 

(DECLAIM (NOTINLINE |AnonymousFunction;|)) 

(DEFUN |AnonymousFunction;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|AnonymousFunction|))
          (LETT % (GETREFV 10))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|AnonymousFunction| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |AnonymousFunction| ()
  (SPROG NIL
         (PROG (#1=#:G2)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|AnonymousFunction|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|AnonymousFunction|
                             (LIST
                              (CONS NIL (CONS 1 (|AnonymousFunction;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|AnonymousFunction|)))))))))) 

(MAKEPROP '|AnonymousFunction| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|OutputForm|) |ANON;coerce;%Of;1|
              (|Boolean|) (|String|))
           '#(~= 0 |latex| 6 |coerce| 11 = 16) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0))
                 (CONS '#(|SetCategory&| NIL |BasicType&|)
                       (CONS
                        '#((|SetCategory|) (|CoercibleTo| 6) (|BasicType|))
                        (|makeByteWordVec2| 9
                                            '(2 0 8 0 0 1 1 0 9 0 1 1 0 6 0 7 2
                                              0 8 0 0 1)))))
           '|lookupComplete|)) 
