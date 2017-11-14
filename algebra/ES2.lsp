
(SDEFUN |ES2;map;MKF;1| ((|f| |Mapping| F E) (|k| |Kernel| E) ($ F))
        (SPROG ((#1=#:G698 NIL) (|x| NIL) (#2=#:G697 NIL))
               (SEQ
                (SPADCALL
                 (SPADCALL (SPADCALL |k| (QREFELT $ 10)) (QREFELT $ 11))
                 (PROGN
                  (LETT #2# NIL . #3=(|ES2;map;MKF;1|))
                  (SEQ (LETT |x| NIL . #3#)
                       (LETT #1# (SPADCALL |k| (QREFELT $ 13)) . #3#) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT (LETT #2# (CONS (SPADCALL |x| |f|) #2#) . #3#)))
                       (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 15))))) 

(DECLAIM (NOTINLINE |ExpressionSpaceFunctions2;|)) 

(DEFUN |ExpressionSpaceFunctions2| (&REST #1=#:G699)
  (SPROG NIL
         (PROG (#2=#:G700)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ExpressionSpaceFunctions2|)
                                               '|domainEqualList|)
                    . #3=(|ExpressionSpaceFunctions2|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ExpressionSpaceFunctions2;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|ExpressionSpaceFunctions2|)))))))))) 

(DEFUN |ExpressionSpaceFunctions2;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|ExpressionSpaceFunctions2|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|ExpressionSpaceFunctions2| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 18) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ExpressionSpaceFunctions2|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|ExpressionSpaceFunctions2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|BasicOperator|) (|Kernel| 6) (0 . |operator|) (5 . |operator|)
              (|List| 6) (10 . |argument|) (|List| $) (15 . |elt|)
              (|Mapping| 7 6) |ES2;map;MKF;1|)
           '#(|map| 21) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 17
                                                 '(1 9 8 0 10 1 7 8 8 11 1 9 12
                                                   0 13 2 7 0 8 14 15 2 0 7 16
                                                   9 17)))))
           '|lookupComplete|)) 
