
(SDEFUN |GALUTIL;safeFloor;RI;1| ((|x| R) ($ |Integer|))
        (SPROG ((|shift| (|Integer|)))
               (SEQ
                (SEQ
                 (LETT |shift|
                       (+
                        (- (SPADCALL |x| (QREFELT $ 9))
                           (SPADCALL (QREFELT $ 11)))
                        (QREFELT $ 7))
                       . #1=(|GALUTIL;safeFloor;RI;1|))
                 (EXIT
                  (COND
                   ((>= |shift| 0)
                    (LETT |x|
                          (SPADCALL |x| (SPADCALL 1 |shift| (QREFELT $ 14))
                                    (QREFELT $ 15))
                          . #1#)))))
                (EXIT
                 (SPADCALL (SPADCALL |x| (QREFELT $ 16)) (QREFELT $ 17)))))) 

(SDEFUN |GALUTIL;safeCeiling;RI;2| ((|x| R) ($ |Integer|))
        (SPROG ((|shift| (|Integer|)))
               (SEQ
                (SEQ
                 (LETT |shift|
                       (+
                        (- (SPADCALL |x| (QREFELT $ 9))
                           (SPADCALL (QREFELT $ 11)))
                        (QREFELT $ 7))
                       . #1=(|GALUTIL;safeCeiling;RI;2|))
                 (EXIT
                  (COND
                   ((>= |shift| 0)
                    (LETT |x|
                          (SPADCALL |x| (SPADCALL 1 |shift| (QREFELT $ 14))
                                    (QREFELT $ 15))
                          . #1#)))))
                (EXIT
                 (SPADCALL (SPADCALL |x| (QREFELT $ 19)) (QREFELT $ 17)))))) 

(SDEFUN |GALUTIL;safetyMargin;2Nni;3|
        ((|n| |NonNegativeInteger|) ($ |NonNegativeInteger|))
        (SPROG ((|#G7| (|NonNegativeInteger|)) (|#G6| (|NonNegativeInteger|)))
               (SEQ
                (PROGN
                 (LETT |#G6| |n| . #1=(|GALUTIL;safetyMargin;2Nni;3|))
                 (LETT |#G7| (QREFELT $ 7) . #1#)
                 (SETELT $ 7 |#G6|)
                 (LETT |n| |#G7| . #1#))
                (EXIT |n|)))) 

(SDEFUN |GALUTIL;safetyMargin;Nni;4| (($ |NonNegativeInteger|)) (QREFELT $ 7)) 

(SDEFUN |GALUTIL;pascalTriangle;NniIR;5|
        ((|n| |NonNegativeInteger|) (|r| |Integer|) ($ R))
        (SPROG
         ((#1=#:G711 NIL) (#2=#:G710 NIL) (#3=#:G721 NIL) (|j| NIL)
          (#4=#:G720 NIL) (|i| NIL) (|mq| #5=(|Integer|))
          (|m| (|Record| (|:| |quotient| #5#) (|:| |remainder| (|Integer|))))
          (|d| (|Integer|)))
         (SEQ
          (COND ((MINUSP |r|) (|spadConstant| $ 12))
                (#6='T
                 (SEQ
                  (LETT |d| (- |n| |r|)
                        . #7=(|GALUTIL;pascalTriangle;NniIR;5|))
                  (EXIT
                   (COND ((< |d| |r|) (SPADCALL |n| |d| (QREFELT $ 29)))
                         ((ZEROP |r|) (|spadConstant| $ 13))
                         ((EQL |r| 1) (SPADCALL |n| (QREFELT $ 30)))
                         ((SPADCALL |n| (QREFELT $ 28) (QREFELT $ 32))
                          (SPADCALL (SPADCALL |n| |r| (QREFELT $ 34))
                                    (QREFELT $ 30)))
                         ((SPADCALL |n| (QREFELT $ 27) (QREFELT $ 35))
                          (SEQ (LETT |m| (DIVIDE2 (- |n| 4) 2) . #7#)
                               (LETT |mq| (QCAR |m|) . #7#)
                               (EXIT
                                (SPADCALL (QREFELT $ 26)
                                          (-
                                           (+
                                            (* (+ |mq| 1) (+ |mq| (QCDR |m|)))
                                            |r|)
                                           1)
                                          (QREFELT $ 36)))))
                         (#6#
                          (SEQ
                           (SEQ (LETT |i| (+ (QREFELT $ 27) 1) . #7#)
                                (LETT #4# |n| . #7#) G190
                                (COND ((> |i| #4#) (GO G191)))
                                (SEQ
                                 (SEQ (LETT |j| 2 . #7#)
                                      (LETT #3# (QUOTIENT2 |i| 2) . #7#) G190
                                      (COND ((|greater_SI| |j| #3#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (SETELT $ 26
                                                (SPADCALL (QREFELT $ 26)
                                                          (SPADCALL
                                                           (SPADCALL
                                                            (PROG1
                                                                (LETT #2#
                                                                      (- |i| 1)
                                                                      . #7#)
                                                              (|check_subtype2|
                                                               (>= #2# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #2#))
                                                            (- |j| 1)
                                                            (QREFELT $ 29))
                                                           (SPADCALL
                                                            (PROG1
                                                                (LETT #1#
                                                                      (- |i| 1)
                                                                      . #7#)
                                                              (|check_subtype2|
                                                               (>= #1# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #1#))
                                                            |j| (QREFELT $ 29))
                                                           (QREFELT $ 15))
                                                          (QREFELT $ 37)))))
                                      (LETT |j| (|inc_SI| |j|) . #7#) (GO G190)
                                      G191 (EXIT NIL))
                                 (EXIT (SETELT $ 27 |i|)))
                                (LETT |i| (+ |i| 1) . #7#) (GO G190) G191
                                (EXIT NIL))
                           (EXIT (SPADCALL |n| |r| (QREFELT $ 29))))))))))))) 

(SDEFUN |GALUTIL;rangePascalTriangle;2Nni;6|
        ((|n| |NonNegativeInteger|) ($ |NonNegativeInteger|))
        (SPROG
         ((|#G18| (|NonNegativeInteger|)) (|#G17| (|NonNegativeInteger|))
          (|dq| #1=(|Integer|))
          (|d| (|Record| (|:| |quotient| #1#) (|:| |remainder| (|Integer|)))))
         (SEQ
          (COND
           ((< |n| (QREFELT $ 27))
            (COND
             ((< |n| 3)
              (SEQ
               (SETELT $ 26
                       (SPADCALL (QREFELT $ 26)
                                 (SPADCALL 1
                                           (SPADCALL (QREFELT $ 26)
                                                     (QREFELT $ 38))
                                           (QREFELT $ 40))
                                 (QREFELT $ 41)))
               (EXIT (SETELT $ 27 3))))
             ('T
              (SEQ
               (LETT |d| (DIVIDE2 (- |n| 3) 2)
                     . #2=(|GALUTIL;rangePascalTriangle;2Nni;6|))
               (LETT |dq| (QCAR |d|) . #2#)
               (SETELT $ 26
                       (SPADCALL (QREFELT $ 26)
                                 (SPADCALL
                                  (+ (* (+ |dq| 1) (+ |dq| (QCDR |d|))) 1)
                                  (SPADCALL (QREFELT $ 26) (QREFELT $ 38))
                                  (QREFELT $ 40))
                                 (QREFELT $ 41)))
               (EXIT (SETELT $ 27 |n|)))))))
          (PROGN
           (LETT |#G17| |n| . #2#)
           (LETT |#G18| (QREFELT $ 28) . #2#)
           (SETELT $ 28 |#G17|)
           (LETT |n| |#G18| . #2#))
          (EXIT |n|)))) 

(SDEFUN |GALUTIL;rangePascalTriangle;Nni;7| (($ |NonNegativeInteger|))
        (QREFELT $ 28)) 

(SDEFUN |GALUTIL;sizePascalTriangle;Nni;8| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 26) (QREFELT $ 38))) 

(SDEFUN |GALUTIL;fillPascalTriangle;V;9| (($ |Void|))
        (SPADCALL (QREFELT $ 28) 2 (QREFELT $ 29))) 

(DECLAIM (NOTINLINE |GaloisGroupUtilities;|)) 

(DEFUN |GaloisGroupUtilities| (#1=#:G730)
  (SPROG NIL
         (PROG (#2=#:G731)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|GaloisGroupUtilities|)
                                               '|domainEqualList|)
                    . #3=(|GaloisGroupUtilities|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|GaloisGroupUtilities;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|GaloisGroupUtilities|)))))))))) 

(DEFUN |GaloisGroupUtilities;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|GaloisGroupUtilities|))
          (LETT |dv$| (LIST '|GaloisGroupUtilities| DV$1) . #1#)
          (LETT $ (GETREFV 47) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|FloatingPointSystem|))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|GaloisGroupUtilities| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|testBitVector| |pv$| 1)
            (PROGN
             (QSETREFV $ 7 6)
             (QSETREFV $ 18
                       (CONS (|dispatchFunction| |GALUTIL;safeFloor;RI;1|) $))
             (QSETREFV $ 20
                       (CONS (|dispatchFunction| |GALUTIL;safeCeiling;RI;2|)
                             $))
             (QSETREFV $ 22
                       (CONS (|dispatchFunction| |GALUTIL;safetyMargin;2Nni;3|)
                             $))
             (QSETREFV $ 23
                       (CONS (|dispatchFunction| |GALUTIL;safetyMargin;Nni;4|)
                             $)))))
          (QSETREFV $ 26 (SPADCALL (QREFELT $ 25)))
          (QSETREFV $ 27 3)
          (QSETREFV $ 28 216)
          $))) 

(MAKEPROP '|GaloisGroupUtilities| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) '|safetymargin|
              (|Integer|) (0 . |order|) (|PositiveInteger|) (5 . |precision|)
              (9 . |Zero|) (13 . |One|) (17 . |float|) (23 . +) (29 . |floor|)
              (34 . |retract|) (39 . |safeFloor|) (44 . |ceiling|)
              (49 . |safeCeiling|) (|NonNegativeInteger|) (54 . |safetyMargin|)
              (59 . |safetyMargin|) (|FlexibleArray| 6) (63 . |empty|)
              '|pascaltriangle| '|ncomputed| '|rangepascaltriangle|
              |GALUTIL;pascalTriangle;NniIR;5| (67 . |coerce|) (|Boolean|)
              (72 . >) (|IntegerCombinatoricFunctions| 8) (78 . |binomial|)
              (84 . <=) (90 . |elt|) (96 . |concat!|) (102 . |#|)
              (|UniversalSegment| 8) (107 . SEGMENT) (113 . |delete!|)
              |GALUTIL;rangePascalTriangle;2Nni;6|
              |GALUTIL;rangePascalTriangle;Nni;7|
              |GALUTIL;sizePascalTriangle;Nni;8| (|Void|)
              |GALUTIL;fillPascalTriangle;V;9|)
           '#(|sizePascalTriangle| 119 |safetyMargin| 123 |safeFloor| 132
              |safeCeiling| 137 |rangePascalTriangle| 142 |pascalTriangle| 151
              |fillPascalTriangle| 157)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 46
                                                 '(1 6 8 0 9 0 6 10 11 0 6 0 12
                                                   0 6 0 13 2 6 0 8 8 14 2 6 0
                                                   0 0 15 1 6 0 0 16 1 6 8 0 17
                                                   1 0 8 6 18 1 6 0 0 19 1 0 8
                                                   6 20 1 0 21 21 22 0 0 21 23
                                                   0 24 0 25 1 6 0 8 30 2 21 31
                                                   0 0 32 2 33 8 8 8 34 2 21 31
                                                   0 0 35 2 24 6 0 8 36 2 24 0
                                                   0 6 37 1 24 21 0 38 2 39 0 8
                                                   8 40 2 24 0 0 39 41 0 0 21
                                                   44 0 1 21 23 1 1 21 21 22 1
                                                   1 8 6 18 1 1 8 6 20 1 0 21
                                                   21 42 0 0 21 43 2 0 6 21 8
                                                   29 0 0 45 46)))))
           '|lookupComplete|)) 
