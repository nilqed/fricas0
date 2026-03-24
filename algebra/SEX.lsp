
(DECLAIM (NOTINLINE |SExpression;|)) 

(DEFUN |SExpression;| ()
  (SPROG ((|dv$| NIL) (% NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|SExpression|))
          (LETT % (GETREFV 16))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|SExpression| NIL (CONS 1 %))
          (|stuffDomainSlots| %)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |SExpression| ()
  (SPROG NIL
         (PROG (#1=#:G1785)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|SExpression|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|SExpression|
                             (LIST (CONS NIL (CONS 1 (|SExpression;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#) (HREM |$ConstructorCache| '|SExpression|)))))))))) 

(MAKEPROP '|SExpression| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|SExpressionOf| 7 13 12 14) (|Boolean|)
              (|String|) (|OutputForm|) (|SingleInteger|) (|HashState|)
              (|List| %) (|Integer|) (|Symbol|) (|DoubleFloat|) (|List| 12))
           '#() 'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0))
                 (CONS '#(NIL |Hashable&| |SetCategory&| NIL |BasicType&|)
                       (CONS
                        '#((|SExpressionCategory| 7 13 12 14) (|Hashable|)
                           (|SetCategory|) (|CoercibleTo| 8) (|BasicType|))
                        (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
