
(SDEFUN |FPS-;float;2IS;1| ((|ma| (|Integer|)) (|ex| (|Integer|)) (% (S)))
        (SPADCALL |ma| |ex| (SPADCALL (QREFELT % 8)) (QREFELT % 10))) 

(SDEFUN |FPS-;digits;Pi;2| ((% (|PositiveInteger|)))
        (SPROG ((#1=#:G15 NIL))
               (PROG1
                   (LETT #1#
                         (MAX 1
                              (QUOTIENT2
                               (* 4004 (- (SPADCALL (QREFELT % 13)) 1))
                               13301)))
                 (|check_subtype2| (> #1# 0) '(|PositiveInteger|) '(|Integer|)
                                   #1#)))) 

(SDEFUN |FPS-;toString;SS;3| ((|x| (S)) (% (|String|)))
        (SPADCALL |x| (QREFELT % 17))) 

(SDEFUN |FPS-;toString;SNniS;4|
        ((|x| (S)) (|n| (|NonNegativeInteger|)) (% (|String|)))
        (SPADCALL
         (CONS (SPADCALL |x| (QREFELT % 19)) (SPADCALL |x| (QREFELT % 20))) |n|
         (VECTOR NIL NIL "fixed" 0 (SPADCALL (QREFELT % 23))) (QREFELT % 27))) 

(DECLAIM (NOTINLINE |FloatingPointSystem&;|)) 

(DEFUN |FloatingPointSystem&| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|FloatingPointSystem&| DV$1))
          (LETT % (GETREFV 30))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#1|
                                                             '(|arbitraryExponent|))
                                              (|HasCategory| |#1|
                                                             '(|arbitraryPrecision|))))))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(MAKEPROP '|FloatingPointSystem&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|PositiveInteger|)
              (0 . |base|) (|Integer|) (4 . |float|) |FPS-;float;2IS;1|
              (11 . |One|) (15 . |bits|) (19 . |max|) |FPS-;digits;Pi;2|
              (|String|) (23 . |convert|) |FPS-;toString;SS;3|
              (28 . |mantissa|) (33 . |exponent|) (38 . |Zero|) (|Character|)
              (42 . |underscore|)
              (|Record| (|:| |mantissa| 9) (|:| |exponent| 9))
              (|Record| (|:| |default?| (|Boolean|))
                        (|:| |trim_trailing_zeros?| (|Boolean|))
                        (|:| |out_mode| 16) (|:| |spacing| 9)
                        (|:| |separator| 22))
              (|FloatingPointConvertion|) (46 . |fixed_mr|)
              (|NonNegativeInteger|) |FPS-;toString;SNniS;4|)
           '#(|toString| 53 |float| 64 |digits| 70) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|digits|
                                 ((|PositiveInteger|) (|PositiveInteger|)))
                                T)
                              '((|digits| ((|PositiveInteger|))) T)
                              '((|toString|
                                 ((|String|) |#1| (|NonNegativeInteger|)))
                                T)
                              '((|toString| ((|String|) |#1|)) T)
                              '((|float|
                                 (|#1| (|Integer|) (|Integer|)
                                  (|PositiveInteger|)))
                                T)
                              '((|float| (|#1| (|Integer|) (|Integer|))) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 29
                                            '(0 6 7 8 3 6 0 9 9 7 10 0 6 0 12 0
                                              6 7 13 0 6 0 14 1 6 16 0 17 1 6 9
                                              0 19 1 6 9 0 20 0 6 0 21 0 22 0
                                              23 3 26 16 24 9 25 27 1 0 16 0 18
                                              2 0 16 0 28 29 2 0 0 9 9 11 0 0 7
                                              15)))))
           '|lookupComplete|)) 
