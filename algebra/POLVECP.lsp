
(SDEFUN |POLVECP;degree;PaI;1|
        ((|v| (|PrimitiveArray| (|PrimeField| |p|))) (% (|Integer|)))
        (SPROG
         ((#1=#:G8 NIL) (#2=#:G9 NIL) (|i| NIL) (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (QVSIZE |v|))
                (SEQ
                 (EXIT
                  (SEQ (LETT |i| (- |n| 1)) G190 (COND ((< |i| 0) (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL
                            (SPADCALL (QAREF1 |v| |i|) (|spadConstant| % 8)
                                      (QREFELT % 10)))
                           (PROGN
                            (LETT #1# (PROGN (LETT #2# |i|) (GO #3=#:G7)))
                            (GO #4=#:G5))))))
                       (LETT |i| (+ |i| -1)) (GO G190) G191 (EXIT NIL)))
                 #4# (EXIT #1#))
                (EXIT -1)))
          #3# (EXIT #2#)))) 

(SDEFUN |POLVECP;to_mod_pa;SupPa;2|
        ((|s| (|SparseUnivariatePolynomial| (|Integer|)))
         (% (|PrimitiveArray| (|PrimeField| |p|))))
        (SPROG
         ((|n| (|NonNegativeInteger|))
          (|ncoeffs| (|PrimitiveArray| (|PrimeField| |p|)))
          (|n0| (|SingleInteger|)))
         (SEQ
          (COND
           ((SPADCALL |s| (QREFELT % 15)) (MAKEARR1 1 (|spadConstant| % 8)))
           ('T
            (SEQ (LETT |n0| (SPADCALL |s| (QREFELT % 17)))
                 (LETT |ncoeffs|
                       (MAKEARR1 (|add_SI| |n0| 1) (|spadConstant| % 8)))
                 (SEQ G190
                      (COND
                       ((NULL (NULL (SPADCALL |s| (QREFELT % 15)))) (GO G191)))
                      (SEQ (LETT |n| (SPADCALL |s| (QREFELT % 17)))
                           (QSETAREF1 |ncoeffs| |n|
                                      (SPADCALL (SPADCALL |s| (QREFELT % 18))
                                                (QREFELT % 19)))
                           (EXIT (LETT |s| (SPADCALL |s| (QREFELT % 20)))))
                      NIL (GO G190) G191 (EXIT NIL))
                 (EXIT |ncoeffs|))))))) 

(SDEFUN |POLVECP;pa_to_sup;PaSup;3|
        ((|v| (|PrimitiveArray| (|PrimeField| |p|)))
         (% (|SparseUnivariatePolynomial| (|Integer|))))
        (SPROG
         ((|res| (|SparseUnivariatePolynomial| (|Integer|))) (#1=#:G21 NIL)
          (|i| NIL) (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (QVSIZE |v|)) (LETT |res| (|spadConstant| % 22))
              (SEQ (LETT |i| 0) (LETT #1# (- |n| 1)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |res|
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (QAREF1 |v| |i|) (QREFELT % 23)) |i|
                             (QREFELT % 24))
                            |res| (QREFELT % 25)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(DECLAIM (NOTINLINE |VectorPolynomialOperationsP;|)) 

(DEFUN |VectorPolynomialOperationsP;| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 |#1|)
          (LETT |dv$| (LIST '|VectorPolynomialOperationsP| DV$1))
          (LETT % (GETREFV 27))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|VectorPolynomialOperationsP|
                      (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |VectorPolynomialOperationsP| (#1=#:G22)
  (SPROG NIL
         (PROG (#2=#:G23)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST #1#)
                                               (HGET |$ConstructorCache|
                                                     '|VectorPolynomialOperationsP|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|VectorPolynomialOperationsP;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|VectorPolynomialOperationsP|)))))))))) 

(MAKEPROP '|VectorPolynomialOperationsP| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|)
              (|PrimeField| (NRTEVAL (QREFELT % 6))) (0 . |Zero|) (|Boolean|)
              (4 . =) (|Integer|) (|PrimitiveArray| 7) |POLVECP;degree;PaI;1|
              (|SparseUnivariatePolynomial| 11) (10 . |zero?|)
              (|NonNegativeInteger|) (15 . |degree|)
              (20 . |leadingCoefficient|) (25 . |coerce|) (30 . |reductum|)
              |POLVECP;to_mod_pa;SupPa;2| (35 . |Zero|) (39 . |convert|)
              (44 . |monomial|) (50 . +) |POLVECP;pa_to_sup;PaSup;3|)
           '#(|to_mod_pa| 56 |pa_to_sup| 61 |degree| 66) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|degree|
                                 ((|Integer|)
                                  (|PrimitiveArray| (|PrimeField| |#1|))))
                                T)
                              '((|to_mod_pa|
                                 ((|PrimitiveArray| (|PrimeField| |#1|))
                                  (|SparseUnivariatePolynomial| (|Integer|))))
                                T)
                              '((|pa_to_sup|
                                 ((|SparseUnivariatePolynomial| (|Integer|))
                                  (|PrimitiveArray| (|PrimeField| |#1|))))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 26
                                            '(0 7 0 8 2 7 9 0 0 10 1 14 9 0 15
                                              1 14 16 0 17 1 14 11 0 18 1 7 0
                                              11 19 1 14 0 0 20 0 14 0 22 1 7
                                              11 0 23 2 14 0 11 16 24 2 14 0 0
                                              0 25 1 0 12 14 21 1 0 14 12 26 1
                                              0 11 12 13)))))
           '|lookupComplete|)) 
