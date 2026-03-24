
(SDEFUN |FINITE-;random;S;1| ((% (S)))
        (SPROG ((#1=#:G6 NIL))
               (SPADCALL
                (PROG1 (LETT #1# (+ 1 (RANDOM (SPADCALL (QREFELT % 9)))))
                  (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                    '(|NonNegativeInteger|) #1#))
                (QREFELT % 11)))) 

(SDEFUN |FINITE-;enumerate;L;2| ((% (|List| S)))
        (SPROG ((#1=#:G10 NIL) (#2=#:G14 NIL) (|i| NIL) (#3=#:G13 NIL))
               (SEQ
                (PROGN
                 (LETT #3# NIL)
                 (SEQ (LETT |i| 1) (LETT #2# (SPADCALL (QREFELT % 9))) G190
                      (COND ((|greater_SI| |i| #2#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #3#
                              (CONS
                               (SPADCALL
                                (PROG1 (LETT #1# |i|)
                                  (|check_subtype2| (> #1# 0)
                                                    '(|PositiveInteger|)
                                                    '(|NonNegativeInteger|)
                                                    #1#))
                                (QREFELT % 11))
                               #3#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #3#))))))) 

(SDEFUN |FINITE-;convert;SIf;3| ((|x| (S)) (% (|InputForm|)))
        (SPADCALL '|index|
                  (LIST
                   (SPADCALL (SPADCALL |x| (QREFELT % 15)) (QREFELT % 18)))
                  (QREFELT % 22))) 

(SDEFUN |FINITE-;hashUpdate!;HsSHs;4|
        ((|s| (|HashState|)) (|x| (S)) (% (|HashState|)))
        (SPADCALL |s| (SPADCALL |x| (QREFELT % 15)) (QREFELT % 25))) 

(SDEFUN |FINITE-;smaller?;2SB;5| ((|x| (S)) (|y| (S)) (% (|Boolean|)))
        (< (SPADCALL |x| (QREFELT % 15)) (SPADCALL |y| (QREFELT % 15)))) 

(DECLAIM (NOTINLINE |Finite&;|)) 

(DEFUN |Finite&| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|Finite&| DV$1))
          (LETT % (GETREFV 29))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          (COND ((|HasCategory| |#1| '(|OrderedSet|)))
                ('T
                 (QSETREFV % 28
                           (CONS (|dispatchFunction| |FINITE-;smaller?;2SB;5|)
                                 %))))
          %))) 

(MAKEPROP '|Finite&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . |random|)
              (|NonNegativeInteger|) (4 . |size|) (|PositiveInteger|)
              (8 . |index|) |FINITE-;random;S;1| (|List| %)
              |FINITE-;enumerate;L;2| (13 . |lookup|) (|Integer|) (|InputForm|)
              (18 . |convert|) (|Symbol|) (|List| 17) (|InputFormFunctions1| 6)
              (23 . |packageCall|) |FINITE-;convert;SIf;3| (|HashState|)
              (29 . |hashUpdate!|) |FINITE-;hashUpdate!;HsSHs;4| (|Boolean|)
              (35 . |smaller?|))
           '#(|smaller?| 41 |random| 47 |hashUpdate!| 51 |enumerate| 57
              |convert| 61)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|enumerate| ((|List| |#1|))) T)
                                   '((|random| (|#1|)) T)
                                   '((|hashUpdate!|
                                      ((|HashState|) (|HashState|) |#1|))
                                     T)
                                   '((|smaller?| ((|Boolean|) |#1| |#1|)) T)
                                   '((|convert| ((|InputForm|) |#1|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 28
                                            '(0 6 0 7 0 6 8 9 1 6 0 10 11 1 6
                                              10 0 15 1 17 0 16 18 2 21 17 19
                                              20 22 2 16 24 24 0 25 2 0 27 0 0
                                              28 2 0 27 0 0 28 0 0 0 12 2 0 24
                                              24 0 26 0 0 13 14 1 0 17 0
                                              23)))))
           '|lookupComplete|)) 
