
(SDEFUN |FMCAT-;smaller?;2AB;1| ((|p| A) (|q| A) ($ |Boolean|))
        (SPROG ((#1=#:G396 NIL))
               (SEQ
                (EXIT
                 (SEQ G190 NIL
                      (SEQ
                       (EXIT
                        (COND
                         ((SPADCALL |q| (QREFELT $ 10))
                          (PROGN (LETT #1# NIL) (GO #2=#:G395)))
                         ((SPADCALL |p| (QREFELT $ 10))
                          (PROGN (LETT #1# 'T) (GO #2#)))
                         ((SPADCALL (SPADCALL |p| (QREFELT $ 11))
                                    (SPADCALL |q| (QREFELT $ 11))
                                    (QREFELT $ 12))
                          (COND
                           ((SPADCALL (SPADCALL |p| (QREFELT $ 13))
                                      (SPADCALL |q| (QREFELT $ 13))
                                      (QREFELT $ 14))
                            (SEQ (LETT |p| (SPADCALL |p| (QREFELT $ 15)))
                                 (EXIT
                                  (LETT |q| (SPADCALL |q| (QREFELT $ 15))))))
                           ('T
                            (PROGN
                             (LETT #1#
                                   (SPADCALL (SPADCALL |p| (QREFELT $ 13))
                                             (SPADCALL |q| (QREFELT $ 13))
                                             (QREFELT $ 16)))
                             (GO #2#)))))
                         ('T
                          (PROGN
                           (LETT #1#
                                 (SPADCALL (SPADCALL |p| (QREFELT $ 11))
                                           (SPADCALL |q| (QREFELT $ 11))
                                           (QREFELT $ 17)))
                           (GO #2#))))))
                      NIL (GO G190) G191 (EXIT NIL)))
                #2# (EXIT #1#)))) 

(DECLAIM (NOTINLINE |FreeModuleCategory&;|)) 

(DEFUN |FreeModuleCategory&| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT DV$3 (|devaluate| |#3|))
          (LETT |dv$| (LIST '|FreeModuleCategory&| DV$1 DV$2 DV$3))
          (LETT $ (GETREFV 19))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#3|
                                                             '(|Comparable|))
                                              (|HasCategory| |#2|
                                                             '(|Comparable|))
                                              (|HasCategory| |#2|
                                                             '(|CommutativeRing|))
                                              (|HasCategory| |#2|
                                                             '(|SemiRing|))))))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (QSETREFV $ 8 |#3|)
          (SETF |pv$| (QREFELT $ 3))
          (COND
           ((|testBitVector| |pv$| 2)
            (COND
             ((|testBitVector| |pv$| 1)
              (QSETREFV $ 18
                        (CONS (|dispatchFunction| |FMCAT-;smaller?;2AB;1|)
                              $))))))
          $))) 

(MAKEPROP '|FreeModuleCategory&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|Boolean|) (0 . |zero?|) (5 . |leadingSupport|)
              (10 . =) (16 . |leadingCoefficient|) (21 . =) (27 . |reductum|)
              (32 . |smaller?|) (38 . |smaller?|) (44 . |smaller?|))
           '#(|smaller?| 50) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|smaller?| ((|Boolean|) |#1| |#1|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 18
                                            '(1 6 9 0 10 1 6 8 0 11 2 8 9 0 0
                                              12 1 6 7 0 13 2 7 9 0 0 14 1 6 0
                                              0 15 2 7 9 0 0 16 2 8 9 0 0 17 2
                                              0 9 0 0 18 2 0 9 0 0 18)))))
           '|lookupComplete|)) 
