
(DECLAIM (NOTINLINE |FreeAbelianMonoid;|)) 

(DEFUN |FreeAbelianMonoid| (#1=#:G713)
  (SPROG NIL
         (PROG (#2=#:G714)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|FreeAbelianMonoid|)
                                               '|domainEqualList|)
                    . #3=(|FreeAbelianMonoid|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|FreeAbelianMonoid;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|FreeAbelianMonoid|)))))))))) 

(DEFUN |FreeAbelianMonoid;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FreeAbelianMonoid|))
          (LETT |dv$| (LIST '|FreeAbelianMonoid| DV$1) . #1#)
          (LETT $ (GETREFV 21) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory|
                                               (|NonNegativeInteger|)
                                               '(|OrderedAbelianMonoid|))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|FreeAbelianMonoid| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|FreeAbelianMonoid| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|InnerFreeAbelianMonoid| 6 9 (NRTEVAL 1))
              (|local| |#1|) (|Mapping| 9 9) (|Mapping| 6 6)
              (|NonNegativeInteger|) (|Integer|)
              (|Record| (|:| |gen| 6) (|:| |exp| 9)) (|List| 11)
              (|Union| 6 '"failed") (|Union| $ '"failed") (|Boolean|)
              (|PositiveInteger|) (|HashState|) (|String|) (|OutputForm|)
              (|SingleInteger|))
           '#() 'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 0 0 0))
                 (CONS
                  '#(NIL NIL |AbelianMonoid&| |AbelianSemiGroup&|
                     |SetCategory&| |BasicType&| |RetractableTo&| NIL)
                  (CONS
                   '#((|FreeAbelianMonoidCategory| 6 9)
                      (|CancellationAbelianMonoid|) (|AbelianMonoid|)
                      (|AbelianSemiGroup|) (|SetCategory|) (|BasicType|)
                      (|RetractableTo| 6) (|CoercibleTo| 19))
                   (|makeByteWordVec2| -999999 'NIL))))
           '|lookupIncomplete|)) 
