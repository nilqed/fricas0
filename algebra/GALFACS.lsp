
(SDEFUN |GALFACS;separate_factors;LIL;1|
        ((|sfl|
          (|List| (|Mapping| (|List| (|PrimitiveArray| (|PrimeField| |p|))))))
         (|c| (|Integer|)) (% (|List| UP)))
        (SPROG
         ((|res| (|List| UP)) (#1=#:G10 NIL) (|v| NIL)
          (|vl| (|List| (|PrimitiveArray| (|PrimeField| |p|)))) (#2=#:G9 NIL)
          (|sf| NIL))
         (SEQ (LETT |res| NIL)
              (SEQ (LETT |sf| NIL) (LETT #2# |sfl|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |sf| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |vl| (SPADCALL |sf|))
                        (EXIT
                         (SEQ (LETT |v| NIL) (LETT #1# |vl|) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |v| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT |res|
                                      (CONS
                                       (SPADCALL (SPADCALL |v| (QREFELT % 11))
                                                 (QREFELT % 12))
                                       |res|))))
                              (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
              (EXIT (CONS (SPADCALL |c| (QREFELT % 14)) |res|))))) 

(DECLAIM (NOTINLINE |GaloisGroupFactorizerSeparate;|)) 

(DEFUN |GaloisGroupFactorizerSeparate;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 |#1|)
          (LETT DV$2 (|devaluate| |#2|))
          (LETT |dv$| (LIST '|GaloisGroupFactorizerSeparate| DV$1 DV$2))
          (LETT % (GETREFV 19))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|GaloisGroupFactorizerSeparate|
                      (LIST DV$1 DV$2) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |GaloisGroupFactorizerSeparate| (&REST #1=#:G11)
  (SPROG NIL
         (PROG (#2=#:G12)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluate_sig| #1# '(NIL T))
                                               (HGET |$ConstructorCache|
                                                     '|GaloisGroupFactorizerSeparate|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |GaloisGroupFactorizerSeparate;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|GaloisGroupFactorizerSeparate|)))))))))) 

(MAKEPROP '|GaloisGroupFactorizerSeparate| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|SparseUnivariatePolynomial| 13)
              (|PrimitiveArray| (|PrimeField| (NRTEVAL (QREFELT % 6))))
              (|VectorPolynomialOperationsP| (NRTEVAL (QREFELT % 6)))
              (0 . |pa_to_sup|) (5 . |unmakeSUP|) (|Integer|) (10 . |coerce|)
              (|List| 7) (|Mapping| (|List| 9)) (|List| 16)
              |GALFACS;separate_factors;LIL;1|)
           '#(|separate_factors| 15) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|separate_factors|
                                 ((|List| |#2|)
                                  (|List|
                                   (|Mapping|
                                    (|List|
                                     (|PrimitiveArray| (|PrimeField| |#1|)))))
                                  (|Integer|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 18
                                            '(1 10 8 9 11 1 7 0 8 12 1 7 0 13
                                              14 2 0 15 17 13 18)))))
           '|lookupComplete|)) 
