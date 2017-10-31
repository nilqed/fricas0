
(SDEFUN |POLYLIFT;map;MMPS;1|
        ((|fv| |Mapping| S |Vars|) (|fc| |Mapping| S R) (|p| P) ($ S))
        (SPROG
         ((|up| (|SparseUnivariatePolynomial| P)) (|ans| (S)) (|t| (S))
          (|x1| (|Union| |Vars| "failed")))
         (SEQ
          (LETT |x1| (SPADCALL |p| (QREFELT $ 12))
                . #1=(|POLYLIFT;map;MMPS;1|))
          (EXIT
           (COND
            ((QEQCAR |x1| 1) (SPADCALL (SPADCALL |p| (QREFELT $ 13)) |fc|))
            ('T
             (SEQ (LETT |up| (SPADCALL |p| (QCDR |x1|) (QREFELT $ 15)) . #1#)
                  (LETT |t| (SPADCALL (QCDR |x1|) |fv|) . #1#)
                  (LETT |ans|
                        (SPADCALL
                         (SPADCALL |fv| |fc| (SPADCALL |up| (QREFELT $ 17))
                                   (QREFELT $ 20))
                         (SPADCALL |t| (SPADCALL |up| (QREFELT $ 22))
                                   (QREFELT $ 23))
                         (QREFELT $ 24))
                        . #1#)
                  (LETT |up| (SPADCALL |up| (QREFELT $ 25)) . #1#)
                  (SEQ G190
                       (COND
                        ((NULL (NULL (SPADCALL |up| (QREFELT $ 27))))
                         (GO G191)))
                       (SEQ
                        (LETT |ans|
                              (SPADCALL |ans|
                                        (SPADCALL
                                         (SPADCALL |fv| |fc|
                                                   (SPADCALL |up|
                                                             (QREFELT $ 17))
                                                   (QREFELT $ 20))
                                         (SPADCALL |t|
                                                   (SPADCALL |up|
                                                             (QREFELT $ 22))
                                                   (QREFELT $ 23))
                                         (QREFELT $ 24))
                                        (QREFELT $ 28))
                              . #1#)
                        (EXIT
                         (LETT |up| (SPADCALL |up| (QREFELT $ 25)) . #1#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |ans|)))))))) 

(DECLAIM (NOTINLINE |PolynomialCategoryLifting;|)) 

(DEFUN |PolynomialCategoryLifting| (&REST #1=#:G710)
  (SPROG NIL
         (PROG (#2=#:G711)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|PolynomialCategoryLifting|)
                                               '|domainEqualList|)
                    . #3=(|PolynomialCategoryLifting|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |PolynomialCategoryLifting;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|PolynomialCategoryLifting|)))))))))) 

(DEFUN |PolynomialCategoryLifting;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$5 NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|PolynomialCategoryLifting|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT DV$5 (|devaluate| |#5|) . #1#)
    (LETT |dv$| (LIST '|PolynomialCategoryLifting| DV$1 DV$2 DV$3 DV$4 DV$5)
          . #1#)
    (LETT $ (GETREFV 29) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|PolynomialCategoryLifting|
                (LIST DV$1 DV$2 DV$3 DV$4 DV$5) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (QSETREFV $ 10 |#5|)
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|PolynomialCategoryLifting| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|)
              (|Union| 7 '"failed") (0 . |mainVariable|)
              (5 . |leadingCoefficient|) (|SparseUnivariatePolynomial| $)
              (10 . |univariate|) (|SparseUnivariatePolynomial| 9)
              (16 . |leadingCoefficient|) (|Mapping| 10 7) (|Mapping| 10 8)
              |POLYLIFT;map;MMPS;1| (|NonNegativeInteger|) (21 . |degree|)
              (26 . ^) (32 . *) (38 . |reductum|) (|Boolean|) (43 . |zero?|)
              (48 . +))
           '#(|map| 54) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 28
                                                 '(1 9 11 0 12 1 9 8 0 13 2 9
                                                   14 0 7 15 1 16 9 0 17 1 16
                                                   21 0 22 2 10 0 0 21 23 2 10
                                                   0 0 0 24 1 16 0 0 25 1 16 26
                                                   0 27 2 10 0 0 0 28 3 0 10 18
                                                   19 9 20)))))
           '|lookupComplete|)) 
