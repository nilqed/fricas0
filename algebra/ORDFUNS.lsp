
(SDEFUN |ORDFUNS;pureLex;2VB;1|
        ((|v1| |Vector| S) (|v2| |Vector| S) ($ |Boolean|))
        (SPROG ((#1=#:G707 NIL) (#2=#:G708 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ (LETT |i| 1 . #3=(|ORDFUNS;pureLex;2VB;1|))
                       (LETT #2# (QREFELT $ 8) . #3#) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ
                        (COND
                         ((SPADCALL (QAREF1O |v1| |i| 1) (QAREF1O |v2| |i| 1)
                                    (QREFELT $ 10))
                          (PROGN (LETT #1# 'T . #3#) (GO #4=#:G706))))
                        (EXIT
                         (COND
                          ((SPADCALL (QAREF1O |v2| |i| 1) (QAREF1O |v1| |i| 1)
                                     (QREFELT $ 10))
                           (PROGN (LETT #1# NIL . #3#) (GO #4#))))))
                       (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT NIL)))
                #4# (EXIT #1#)))) 

(SDEFUN |ORDFUNS;totalLex;2VB;2|
        ((|v1| |Vector| S) (|v2| |Vector| S) ($ |Boolean|))
        (SPROG
         ((#1=#:G717 NIL) (#2=#:G719 NIL) (|i| NIL) (|n2| (S)) (|n1| (S))
          (#3=#:G718 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |n1| (|spadConstant| $ 13) . #4=(|ORDFUNS;totalLex;2VB;2|))
            (LETT |n2| (|spadConstant| $ 13) . #4#)
            (SEQ (LETT |i| 1 . #4#) (LETT #3# (QREFELT $ 8) . #4#) G190
                 (COND ((|greater_SI| |i| #3#) (GO G191)))
                 (SEQ
                  (LETT |n1|
                        (SPADCALL |n1| (QAREF1O |v1| |i| 1) (QREFELT $ 14))
                        . #4#)
                  (EXIT
                   (LETT |n2|
                         (SPADCALL |n2| (QAREF1O |v2| |i| 1) (QREFELT $ 14))
                         . #4#)))
                 (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
            (EXIT
             (COND ((SPADCALL |n1| |n2| (QREFELT $ 10)) 'T)
                   ((SPADCALL |n2| |n1| (QREFELT $ 10)) NIL)
                   ('T
                    (SEQ
                     (SEQ (LETT |i| 1 . #4#) (LETT #2# (QREFELT $ 8) . #4#)
                          G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
                          (SEQ
                           (COND
                            ((SPADCALL (QAREF1O |v1| |i| 1)
                                       (QAREF1O |v2| |i| 1) (QREFELT $ 10))
                             (PROGN (LETT #1# 'T . #4#) (GO #5=#:G716))))
                           (EXIT
                            (COND
                             ((SPADCALL (QAREF1O |v2| |i| 1)
                                        (QAREF1O |v1| |i| 1) (QREFELT $ 10))
                              (PROGN (LETT #1# NIL . #4#) (GO #5#))))))
                          (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                          (EXIT NIL))
                     (EXIT NIL)))))))
          #5# (EXIT #1#)))) 

(SDEFUN |ORDFUNS;reverseLex;2VB;3|
        ((|v1| |Vector| S) (|v2| |Vector| S) ($ |Boolean|))
        (SPROG
         ((#1=#:G728 NIL) (|i| NIL) (|n2| (S)) (|n1| (S)) (#2=#:G729 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |n1| (|spadConstant| $ 13) . #3=(|ORDFUNS;reverseLex;2VB;3|))
            (LETT |n2| (|spadConstant| $ 13) . #3#)
            (SEQ (LETT |i| 1 . #3#) (LETT #2# (QREFELT $ 8) . #3#) G190
                 (COND ((|greater_SI| |i| #2#) (GO G191)))
                 (SEQ
                  (LETT |n1|
                        (SPADCALL |n1| (QAREF1O |v1| |i| 1) (QREFELT $ 14))
                        . #3#)
                  (EXIT
                   (LETT |n2|
                         (SPADCALL |n2| (QAREF1O |v2| |i| 1) (QREFELT $ 14))
                         . #3#)))
                 (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
            (EXIT
             (COND ((SPADCALL |n1| |n2| (QREFELT $ 10)) 'T)
                   ((SPADCALL |n2| |n1| (QREFELT $ 10)) NIL)
                   ('T
                    (SEQ
                     (SEQ (LETT |i| (QREFELT $ 8) . #3#) G190
                          (COND ((< |i| 1) (GO G191)))
                          (SEQ
                           (COND
                            ((SPADCALL (QAREF1O |v2| |i| 1)
                                       (QAREF1O |v1| |i| 1) (QREFELT $ 10))
                             (PROGN (LETT #1# 'T . #3#) (GO #4=#:G727))))
                           (EXIT
                            (COND
                             ((SPADCALL (QAREF1O |v1| |i| 1)
                                        (QAREF1O |v2| |i| 1) (QREFELT $ 10))
                              (PROGN (LETT #1# NIL . #3#) (GO #4#))))))
                          (LETT |i| (+ |i| -1) . #3#) (GO G190) G191
                          (EXIT NIL))
                     (EXIT NIL)))))))
          #4# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |OrderingFunctions;|)) 

(DEFUN |OrderingFunctions| (&REST #1=#:G730)
  (SPROG NIL
         (PROG (#2=#:G731)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|OrderingFunctions|)
                                               '|domainEqualList|)
                    . #3=(|OrderingFunctions|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |OrderingFunctions;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|OrderingFunctions|)))))))))) 

(DEFUN |OrderingFunctions;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|OrderingFunctions|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|OrderingFunctions| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 17) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|OrderingFunctions| (LIST DV$1 DV$2)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8 |#1|)
          $))) 

(MAKEPROP '|OrderingFunctions| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|n|
              (|Boolean|) (0 . <) (|Vector| 7) |ORDFUNS;pureLex;2VB;1|
              (6 . |Zero|) (10 . +) |ORDFUNS;totalLex;2VB;2|
              |ORDFUNS;reverseLex;2VB;3|)
           '#(|totalLex| 16 |reverseLex| 22 |pureLex| 28) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 16
                                                 '(2 7 9 0 0 10 0 7 0 13 2 7 0
                                                   0 0 14 2 0 9 11 11 15 2 0 9
                                                   11 11 16 2 0 9 11 11 12)))))
           '|lookupComplete|)) 
