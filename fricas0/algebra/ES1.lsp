
(SDEFUN |ES1;map;MSKS;1|
        ((F2S |Mapping| S F) (|prop| |Symbol|) (|k| |Kernel| F) ($ S))
        (SPROG
         ((|p| (|Union| (|None|) "failed")) (|args| (|List| S)) (#1=#:G703 NIL)
          (|x| NIL) (#2=#:G702 NIL))
         (SEQ
          (LETT |args|
                (PROGN
                 (LETT #2# NIL . #3=(|ES1;map;MSKS;1|))
                 (SEQ (LETT |x| NIL . #3#)
                      (LETT #1# (SPADCALL |k| (QREFELT $ 10)) . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT (LETT #2# (CONS (SPADCALL |x| F2S) #2#) . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (LETT |p|
                (SPADCALL (SPADCALL |k| (QREFELT $ 12)) |prop| (QREFELT $ 15))
                . #3#)
          (EXIT
           (COND ((QEQCAR |p| 0) (SPADCALL |args| (QCDR |p|)))
                 ('T (|error| "Operator does not have required property"))))))) 

(DECLAIM (NOTINLINE |ExpressionSpaceFunctions1;|)) 

(DEFUN |ExpressionSpaceFunctions1| (&REST #1=#:G704)
  (SPROG NIL
         (PROG (#2=#:G705)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ExpressionSpaceFunctions1|)
                                               '|domainEqualList|)
                    . #3=(|ExpressionSpaceFunctions1|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |ExpressionSpaceFunctions1;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|ExpressionSpaceFunctions1|)))))))))) 

(DEFUN |ExpressionSpaceFunctions1;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|ExpressionSpaceFunctions1|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|ExpressionSpaceFunctions1| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 18) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ExpressionSpaceFunctions1|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|ExpressionSpaceFunctions1| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) (|List| 6)
              (|Kernel| 6) (0 . |argument|) (|BasicOperator|) (5 . |operator|)
              (|Union| (|None|) '"failed") (|Symbol|) (10 . |property|)
              (|Mapping| 7 6) |ES1;map;MSKS;1|)
           '#(|map| 16) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 17
                                                 '(1 9 8 0 10 1 9 11 0 12 2 11
                                                   13 0 14 15 3 0 7 16 14 9
                                                   17)))))
           '|lookupComplete|)) 
