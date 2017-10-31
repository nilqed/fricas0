
(SDEFUN |FINITE-;random;S;1| (($ S))
        (SPROG ((#1=#:G702 NIL))
               (SPADCALL
                (PROG1
                    (LETT #1# (+ 1 (RANDOM (SPADCALL (QREFELT $ 9))))
                          |FINITE-;random;S;1|)
                  (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                    '(|NonNegativeInteger|) #1#))
                (QREFELT $ 11)))) 

(SDEFUN |FINITE-;enumerate;L;2| (($ |List| S))
        (SPROG ((#1=#:G710 NIL) (#2=#:G714 NIL) (|i| NIL) (#3=#:G713 NIL))
               (SEQ
                (PROGN
                 (LETT #3# NIL . #4=(|FINITE-;enumerate;L;2|))
                 (SEQ (LETT |i| 1 . #4#)
                      (LETT #2# (SPADCALL (QREFELT $ 9)) . #4#) G190
                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #3#
                              (CONS
                               (SPADCALL
                                (PROG1 (LETT #1# |i| . #4#)
                                  (|check_subtype2| (> #1# 0)
                                                    '(|PositiveInteger|)
                                                    '(|NonNegativeInteger|)
                                                    #1#))
                                (QREFELT $ 11))
                               #3#)
                              . #4#)))
                      (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                      (EXIT (NREVERSE #3#))))))) 

(SDEFUN |FINITE-;convert;SIf;3| ((|x| S) ($ |InputForm|))
        (SPADCALL '|index|
                  (LIST
                   (SPADCALL (SPADCALL |x| (QREFELT $ 15)) (QREFELT $ 18)))
                  (QREFELT $ 22))) 

(SDEFUN |FINITE-;smaller?;2SB;4| ((|x| S) (|y| S) ($ |Boolean|))
        (< (SPADCALL |x| (QREFELT $ 15)) (SPADCALL |y| (QREFELT $ 15)))) 

(DECLAIM (NOTINLINE |Finite&;|)) 

(DEFUN |Finite&| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|Finite&|))
          (LETT |dv$| (LIST '|Finite&| DV$1) . #1#)
          (LETT $ (GETREFV 26) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (COND ((|HasCategory| |#1| '(|OrderedSet|)))
                ('T
                 (QSETREFV $ 25
                           (CONS (|dispatchFunction| |FINITE-;smaller?;2SB;4|)
                                 $))))
          $))) 

(MAKEPROP '|Finite&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . |random|)
              (|NonNegativeInteger|) (4 . |size|) (|PositiveInteger|)
              (8 . |index|) |FINITE-;random;S;1| (|List| $)
              |FINITE-;enumerate;L;2| (13 . |lookup|) (|Integer|) (|InputForm|)
              (18 . |convert|) (|Symbol|) (|List| 17) (|InputFormFunctions1| 6)
              (23 . |packageCall|) |FINITE-;convert;SIf;3| (|Boolean|)
              (29 . |smaller?|))
           '#(|smaller?| 35 |random| 41 |enumerate| 45 |convert| 49) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 25
                                                 '(0 6 0 7 0 6 8 9 1 6 0 10 11
                                                   1 6 10 0 15 1 17 0 16 18 2
                                                   21 17 19 20 22 2 0 24 0 0 25
                                                   2 0 24 0 0 25 0 0 0 12 0 0
                                                   13 14 1 0 17 0 23)))))
           '|lookupComplete|)) 
