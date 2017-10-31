
(SDEFUN |INDE;coerceOF| ((|t| |Term|) ($ |OutputForm|))
        (COND ((EQL (QCDR |t|) 1) (SPADCALL (QCAR |t|) (QREFELT $ 10)))
              ('T
               (SPADCALL (SPADCALL (QCAR |t|) (QREFELT $ 10))
                         (SPADCALL (QCDR |t|) (QREFELT $ 12)) (QREFELT $ 13))))) 

(SDEFUN |INDE;coerce;$Of;2| ((|x| $) ($ |OutputForm|))
        (SPROG ((#1=#:G714 NIL) (|t| NIL) (#2=#:G713 NIL))
               (SEQ
                (COND ((NULL |x|) (SPADCALL 1 (QREFELT $ 15)))
                      ((NULL (CDR |x|)) (|INDE;coerceOF| (|SPADfirst| |x|) $))
                      ('T
                       (SPADCALL (ELT $ 16)
                                 (PROGN
                                  (LETT #2# NIL . #3=(|INDE;coerce;$Of;2|))
                                  (SEQ (LETT |t| NIL . #3#)
                                       (LETT #1# |x| . #3#) G190
                                       (COND
                                        ((OR (ATOM #1#)
                                             (PROGN
                                              (LETT |t| (CAR #1#) . #3#)
                                              NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #2#
                                               (CONS (|INDE;coerceOF| |t| $)
                                                     #2#)
                                               . #3#)))
                                       (LETT #1# (CDR #1#) . #3#) (GO G190)
                                       G191 (EXIT (NREVERSE #2#))))
                                 (QREFELT $ 19))))))) 

(DECLAIM (NOTINLINE |IndexedExponents;|)) 

(DEFUN |IndexedExponents| (#1=#:G722)
  (SPROG NIL
         (PROG (#2=#:G723)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|IndexedExponents|)
                                               '|domainEqualList|)
                    . #3=(|IndexedExponents|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|IndexedExponents;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|IndexedExponents|)))))))))) 

(DEFUN |IndexedExponents;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|IndexedExponents|))
          (LETT |dv$| (LIST '|IndexedExponents| DV$1) . #1#)
          (LETT $ (GETREFV 30) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory|
                                               (|NonNegativeInteger|)
                                               '(|AbelianGroup|))))
                          . #1#))
          (|haddProp| |$ConstructorCache| '|IndexedExponents| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7
                    (|Record| (|:| |k| |#1|) (|:| |c| (|NonNegativeInteger|))))
          (QSETREFV $ 8 (|List| (QREFELT $ 7)))
          $))) 

(MAKEPROP '|IndexedExponents| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|IndexedDirectProductObject| 11 6)
              (|local| |#1|) '|Term| '|Rep| (|OutputForm|) (0 . |coerce|)
              (|NonNegativeInteger|) (5 . |coerce|) (10 . ^) (|Integer|)
              (16 . |coerce|) (21 . *) (|Mapping| 9 9 9) (|List| 9)
              (27 . |reduce|) |INDE;coerce;$Of;2| (|Mapping| 11 11) (|Boolean|)
              (|Record| (|:| |k| 6) (|:| |c| 11)) (|List| 23)
              (|Union| $ '"failed") (|PositiveInteger|) (|String|)
              (|SingleInteger|) (|HashState|))
           '#(|coerce| 33) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0))
                 (CONS
                  '#(NIL NIL NIL NIL NIL |AbelianGroup&| NIL NIL |OrderedSet&|
                     |AbelianMonoid&| NIL |AbelianSemiGroup&| |SetCategory&|
                     |BasicType&| |PartialOrder&| NIL)
                  (CONS
                   '#((|IndexedDirectProductCategory| 11 6)
                      (|OrderedAbelianMonoidSup|)
                      (|OrderedCancellationAbelianMonoid|)
                      (|AbelianProductCategory| 11) (|OrderedAbelianMonoid|)
                      (|AbelianGroup|) (|OrderedAbelianSemiGroup|)
                      (|CancellationAbelianMonoid|) (|OrderedSet|)
                      (|AbelianMonoid|) (|Comparable|) (|AbelianSemiGroup|)
                      (|SetCategory|) (|BasicType|) (|PartialOrder|)
                      (|CoercibleTo| 9))
                   (|makeByteWordVec2| 20
                                       '(1 6 9 0 10 1 11 9 0 12 2 9 0 0 0 13 1
                                         14 9 0 15 2 9 0 0 0 16 2 18 9 17 0 19
                                         1 0 9 0 20)))))
           '|lookupIncomplete|)) 
