
(PUT '|ONECOMP;coerce;R$;1| '|SPADreplace| '(XLAM (|r|) (CONS 0 |r|))) 

(SDEFUN |ONECOMP;coerce;R$;1| ((|r| R) ($ $)) (CONS 0 |r|)) 

(SDEFUN |ONECOMP;retract;$R;2| ((|x| $) ($ R))
        (COND ((QEQCAR |x| 0) (QCDR |x|)) ('T (|error| "Not finite")))) 

(PUT '|ONECOMP;finite?;$B;3| '|SPADreplace| '(XLAM (|x|) (QEQCAR |x| 0))) 

(SDEFUN |ONECOMP;finite?;$B;3| ((|x| $) ($ |Boolean|)) (QEQCAR |x| 0)) 

(PUT '|ONECOMP;infinite?;$B;4| '|SPADreplace| '(XLAM (|x|) (QEQCAR |x| 1))) 

(SDEFUN |ONECOMP;infinite?;$B;4| ((|x| $) ($ |Boolean|)) (QEQCAR |x| 1)) 

(PUT '|ONECOMP;infinity;$;5| '|SPADreplace| '(XLAM NIL (CONS 1 "infinity"))) 

(SDEFUN |ONECOMP;infinity;$;5| (($ $)) (CONS 1 "infinity")) 

(SDEFUN |ONECOMP;retractIfCan;$U;6| ((|x| $) ($ |Union| R "failed"))
        (COND ((QEQCAR |x| 0) (CONS 0 (QCDR |x|))) ('T (CONS 1 "failed")))) 

(SDEFUN |ONECOMP;coerce;$Of;7| ((|x| $) ($ |OutputForm|))
        (COND ((QEQCAR |x| 1) (SPADCALL '|infinity| (QREFELT $ 18)))
              ('T (SPADCALL (QCDR |x|) (QREFELT $ 19))))) 

(SDEFUN |ONECOMP;=;2$B;8| ((|x| $) (|y| $) ($ |Boolean|))
        (COND ((QEQCAR |x| 1) (QEQCAR |y| 1)) ((QEQCAR |y| 1) NIL)
              ('T (SPADCALL (QCDR |x|) (QCDR |y|) (QREFELT $ 21))))) 

(SDEFUN |ONECOMP;rational?;$B;9| ((|x| $) ($ |Boolean|))
        (SPADCALL |x| (QREFELT $ 11))) 

(SDEFUN |ONECOMP;rational;$F;10| ((|x| $) ($ |Fraction| (|Integer|)))
        (SPADCALL (CONS 0 (SPADCALL |x| (QREFELT $ 9))) (QREFELT $ 25))) 

(SDEFUN |ONECOMP;rationalIfCan;$U;11|
        ((|x| $) ($ |Union| (|Fraction| (|Integer|)) "failed"))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ
                (LETT |r| (SPADCALL |x| (QREFELT $ 15))
                      |ONECOMP;rationalIfCan;$U;11|)
                (EXIT
                 (COND ((QEQCAR |r| 1) (CONS 1 "failed"))
                       ('T (CONS 0 (SPADCALL (QCDR |r|) (QREFELT $ 26))))))))) 

(DECLAIM (NOTINLINE |OnePointCompletion;|)) 

(DEFUN |OnePointCompletion| (#1=#:G748)
  (SPROG NIL
         (PROG (#2=#:G749)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|OnePointCompletion|)
                                               '|domainEqualList|)
                    . #3=(|OnePointCompletion|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|OnePointCompletion;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|OnePointCompletion|)))))))))) 

(DEFUN |OnePointCompletion;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|OnePointCompletion|))
          (LETT |dv$| (LIST '|OnePointCompletion| DV$1) . #1#)
          (LETT $ (GETREFV 34) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|RetractableTo|
                                                               (|Fraction|
                                                                (|Integer|))))
                                              (|HasCategory| |#1|
                                                             '(|RetractableTo|
                                                               (|Integer|)))
                                              (|HasCategory| |#1|
                                                             '(|IntegerNumberSystem|))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|OnePointCompletion| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7 (|Union| |#1| "infinity"))
          (COND
           ((|testBitVector| |pv$| 3)
            (PROGN
             (QSETREFV $ 23
                       (CONS (|dispatchFunction| |ONECOMP;rational?;$B;9|) $))
             (QSETREFV $ 25
                       (CONS (|dispatchFunction| |ONECOMP;rational;$F;10|) $))
             (QSETREFV $ 28
                       (CONS (|dispatchFunction| |ONECOMP;rationalIfCan;$U;11|)
                             $)))))
          $))) 

(MAKEPROP '|OnePointCompletion| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|Rep|
              |ONECOMP;coerce;R$;1| |ONECOMP;retract;$R;2| (|Boolean|)
              |ONECOMP;finite?;$B;3| |ONECOMP;infinite?;$B;4|
              |ONECOMP;infinity;$;5| (|Union| 6 '"failed")
              |ONECOMP;retractIfCan;$U;6| (|OutputForm|) (|Symbol|)
              (0 . |coerce|) (5 . |coerce|) |ONECOMP;coerce;$Of;7| (10 . =)
              |ONECOMP;=;2$B;8| (16 . |rational?|) (|Fraction| 29)
              (21 . |rational|) (26 . |rational|) (|Union| 24 '"failed")
              (31 . |rationalIfCan|) (|Integer|) (|Union| 29 '"failed")
              (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 36 |retractIfCan| 42 |retract| 57 |rationalIfCan| 72
              |rational?| 77 |rational| 82 |latex| 87 |infinity| 92 |infinite?|
              96 |hashUpdate!| 101 |hash| 107 |finite?| 112 |coerce| 117 = 137)
           'NIL
           (CONS (|makeByteWordVec2| 2 '(0 0 0 0 0 1 2))
                 (CONS
                  '#(|SetCategory&| |FullyRetractableTo&| |BasicType&|
                     |RetractableTo&| NIL |RetractableTo&| |RetractableTo&|)
                  (CONS
                   '#((|SetCategory|) (|FullyRetractableTo| 6) (|BasicType|)
                      (|RetractableTo| 6) (|CoercibleTo| 16)
                      (|RetractableTo| 24) (|RetractableTo| 29))
                   (|makeByteWordVec2| 33
                                       '(1 17 16 0 18 1 6 16 0 19 2 6 10 0 0 21
                                         1 0 10 0 23 1 0 24 0 25 1 6 24 0 26 1
                                         0 27 0 28 2 0 10 0 0 1 1 1 27 0 1 1 2
                                         30 0 1 1 0 14 0 15 1 1 24 0 1 1 2 29 0
                                         1 1 0 6 0 9 1 3 27 0 28 1 3 10 0 23 1
                                         3 24 0 25 1 0 31 0 1 0 0 0 13 1 0 10 0
                                         12 2 0 33 33 0 1 1 0 32 0 1 1 0 10 0
                                         11 1 1 0 24 1 1 2 0 29 1 1 0 0 6 8 1 0
                                         16 0 20 2 0 10 0 0 22)))))
           '|lookupComplete|)) 
