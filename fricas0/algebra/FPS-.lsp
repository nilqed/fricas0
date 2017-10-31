
(SDEFUN |FPS-;float;2IS;1| ((|ma| |Integer|) (|ex| |Integer|) ($ S))
        (SPADCALL |ma| |ex| (SPADCALL (QREFELT $ 8)) (QREFELT $ 10))) 

(SDEFUN |FPS-;digits;Pi;2| (($ |PositiveInteger|))
        (SPROG ((#1=#:G713 NIL))
               (PROG1
                   (LETT #1#
                         (MAX 1
                              (QUOTIENT2
                               (SPADCALL 4004 (- (SPADCALL (QREFELT $ 13)) 1)
                                         (QREFELT $ 14))
                               13301))
                         |FPS-;digits;Pi;2|)
                 (|check_subtype2| (> #1# 0) '(|PositiveInteger|) '(|Integer|)
                                   #1#)))) 

(SDEFUN |FPS-;toString;SNniS;3|
        ((|x| S) (|n| |NonNegativeInteger|) ($ |String|))
        (SPROG
         ((|res| (|List| (|String|))) (|x2| (S)) (|tenn| (S)) (|x0| (S))
          (|x1| (S)))
         (SEQ
          (LETT |x1| (SPADCALL |x| (QREFELT $ 17))
                . #1=(|FPS-;toString;SNniS;3|))
          (LETT |x0|
                (SPADCALL (SPADCALL |x| |x1| (QREFELT $ 18)) (QREFELT $ 19))
                . #1#)
          (LETT |tenn| (SPADCALL 1 |n| 10 (QREFELT $ 10)) . #1#)
          (LETT |x2|
                (SPADCALL (SPADCALL |tenn| |x0| (QREFELT $ 20)) (QREFELT $ 17))
                . #1#)
          (LETT |res|
                (LIST (STRINGIMAGE (SPADCALL |x1| (QREFELT $ 21))) "."
                      (STRINGIMAGE (SPADCALL |x2| (QREFELT $ 21))))
                . #1#)
          (EXIT (SPADCALL (ELT $ 23) |res| (QREFELT $ 26)))))) 

(DECLAIM (NOTINLINE |FloatingPointSystem&;|)) 

(DEFUN |FloatingPointSystem&| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FloatingPointSystem&|))
          (LETT |dv$| (LIST '|FloatingPointSystem&| DV$1) . #1#)
          (LETT $ (GETREFV 29) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|arbitraryExponent|))
                                              (|HasCategory| |#1|
                                                             '(|arbitraryPrecision|))))
                          . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|FloatingPointSystem&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|PositiveInteger|)
              (0 . |base|) (|Integer|) (4 . |float|) |FPS-;float;2IS;1|
              (11 . |One|) (15 . |bits|) (19 . *) (25 . |max|)
              |FPS-;digits;Pi;2| (29 . |round|) (34 . -) (40 . |abs|) (45 . *)
              (51 . |retract|) (|String|) (56 . |concat|) (|Mapping| 22 22 22)
              (|List| 22) (62 . |reduce|) (|NonNegativeInteger|)
              |FPS-;toString;SNniS;3|)
           '#(|toString| 68 |float| 74 |digits| 80) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 28
                                                 '(0 6 7 8 3 6 0 9 9 7 10 0 6 0
                                                   12 0 6 7 13 2 9 0 7 0 14 0 6
                                                   0 15 1 6 0 0 17 2 6 0 0 0 18
                                                   1 6 0 0 19 2 6 0 0 0 20 1 6
                                                   9 0 21 2 22 0 0 0 23 2 25 22
                                                   24 0 26 2 0 22 0 27 28 2 0 0
                                                   9 9 11 0 0 7 16)))))
           '|lookupComplete|)) 
