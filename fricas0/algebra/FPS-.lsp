
(SDEFUN |FPS-;float;2IS;1| ((|ma| |Integer|) (|ex| |Integer|) ($ S))
        (SPADCALL |ma| |ex| (SPADCALL (QREFELT $ 8)) (QREFELT $ 10))) 

(SDEFUN |FPS-;digits;Pi;2| (($ |PositiveInteger|))
        (SPROG ((#1=#:G718 NIL))
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

(SDEFUN |FPS-;toString;SS;3| ((|x| S) ($ |String|))
        (SPADCALL |x| (QREFELT $ 18))) 

(SDEFUN |FPS-;toString;SNniS;4|
        ((|x| S) (|n| |NonNegativeInteger|) ($ |String|))
        (SPROG
         ((|res| (|List| (|String|))) (|x2| (S)) (|tenn| (S)) (|x0| (S))
          (|x1| (S)))
         (SEQ
          (LETT |x1| (SPADCALL |x| (QREFELT $ 20))
                . #1=(|FPS-;toString;SNniS;4|))
          (LETT |x0|
                (SPADCALL (SPADCALL |x| |x1| (QREFELT $ 21)) (QREFELT $ 22))
                . #1#)
          (LETT |tenn| (SPADCALL 1 |n| 10 (QREFELT $ 10)) . #1#)
          (LETT |x2|
                (SPADCALL (SPADCALL |tenn| |x0| (QREFELT $ 23)) (QREFELT $ 20))
                . #1#)
          (LETT |res|
                (LIST (STRINGIMAGE (SPADCALL |x1| (QREFELT $ 24))) "."
                      (STRINGIMAGE (SPADCALL |x2| (QREFELT $ 24))))
                . #1#)
          (EXIT (SPADCALL (ELT $ 25) |res| (QREFELT $ 28)))))) 

(DECLAIM (NOTINLINE |FloatingPointSystem&;|)) 

(DEFUN |FloatingPointSystem&| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FloatingPointSystem&|))
          (LETT |dv$| (LIST '|FloatingPointSystem&| DV$1) . #1#)
          (LETT $ (GETREFV 31) . #1#)
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
              |FPS-;digits;Pi;2| (|String|) (29 . |convert|)
              |FPS-;toString;SS;3| (34 . |round|) (39 . -) (45 . |abs|)
              (50 . *) (56 . |retract|) (61 . |concat|) (|Mapping| 17 17 17)
              (|List| 17) (67 . |reduce|) (|NonNegativeInteger|)
              |FPS-;toString;SNniS;4|)
           '#(|toString| 73 |float| 84 |digits| 90) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 30
                                                 '(0 6 7 8 3 6 0 9 9 7 10 0 6 0
                                                   12 0 6 7 13 2 9 0 7 0 14 0 6
                                                   0 15 1 6 17 0 18 1 6 0 0 20
                                                   2 6 0 0 0 21 1 6 0 0 22 2 6
                                                   0 0 0 23 1 6 9 0 24 2 17 0 0
                                                   0 25 2 27 17 26 0 28 2 0 17
                                                   0 29 30 1 0 17 0 19 2 0 0 9
                                                   9 11 0 0 7 16)))))
           '|lookupComplete|)) 
