
(SDEFUN |POLVECF;degree;PaI;1| ((|v| (|PrimitiveArray| K)) (% (|Integer|)))
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

(SDEFUN |POLVECF;to_mod_pa;SupPa;2|
        ((|s| (|SparseUnivariatePolynomial| K)) (% (|PrimitiveArray| K)))
        (SPROG
         ((|n| (|NonNegativeInteger|)) (|ncoeffs| (|PrimitiveArray| K))
          (|n0| (|SingleInteger|)))
         (SEQ
          (COND
           ((SPADCALL |s| (QREFELT % 15)) (MAKEARR1 1 (|spadConstant| % 8)))
           ('T
            (SEQ (LETT |n0| (SPADCALL |s| (QREFELT % 18)))
                 (LETT |ncoeffs|
                       (MAKEARR1 (|add_SI| |n0| 1) (|spadConstant| % 8)))
                 (SEQ G190
                      (COND
                       ((NULL (NULL (SPADCALL |s| (QREFELT % 15)))) (GO G191)))
                      (SEQ (LETT |n| (SPADCALL |s| (QREFELT % 18)))
                           (QSETAREF1 |ncoeffs| |n|
                                      (SPADCALL |s| (QREFELT % 19)))
                           (EXIT (LETT |s| (SPADCALL |s| (QREFELT % 20)))))
                      NIL (GO G190) G191 (EXIT NIL))
                 (EXIT |ncoeffs|))))))) 

(SDEFUN |POLVECF;pa_to_sup;PaSup;3|
        ((|v| (|PrimitiveArray| K)) (% (|SparseUnivariatePolynomial| K)))
        (SPROG
         ((|res| (|SparseUnivariatePolynomial| K)) (#1=#:G21 NIL) (|i| NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |n| (QVSIZE |v|)) (LETT |res| (|spadConstant| % 22))
              (SEQ (LETT |i| 0) (LETT #1# (- |n| 1)) G190
                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |res|
                           (SPADCALL
                            (SPADCALL (QAREF1 |v| |i|) |i| (QREFELT % 23))
                            |res| (QREFELT % 24)))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(DECLAIM (NOTINLINE |VectorPolynomialOperationsF;|)) 

(DEFUN |VectorPolynomialOperationsF;| (|#1|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|VectorPolynomialOperationsF| DV$1))
          (LETT % (GETREFV 26))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|VectorPolynomialOperationsF|
                      (LIST DV$1) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (SETF |pv$| (QREFELT % 3))
          %))) 

(DEFUN |VectorPolynomialOperationsF| (#1=#:G22)
  (SPROG NIL
         (PROG (#2=#:G23)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|VectorPolynomialOperationsF|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|VectorPolynomialOperationsF;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|VectorPolynomialOperationsF|)))))))))) 

(MAKEPROP '|VectorPolynomialOperationsF| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (0 . |One|) (4 . |Zero|)
              (|Boolean|) (8 . =) (|Integer|) (|PrimitiveArray| 6)
              |POLVECF;degree;PaI;1| (|SparseUnivariatePolynomial| 6)
              (14 . |zero?|) (19 . |One|) (|NonNegativeInteger|)
              (23 . |degree|) (28 . |leadingCoefficient|) (33 . |reductum|)
              |POLVECF;to_mod_pa;SupPa;2| (38 . |Zero|) (42 . |monomial|)
              (48 . +) |POLVECF;pa_to_sup;PaSup;3|)
           '#(|to_mod_pa| 54 |pa_to_sup| 59 |degree| 64) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|degree|
                                 ((|Integer|) (|PrimitiveArray| |#1|)))
                                T)
                              '((|to_mod_pa|
                                 ((|PrimitiveArray| |#1|)
                                  (|SparseUnivariatePolynomial| |#1|)))
                                T)
                              '((|pa_to_sup|
                                 ((|SparseUnivariatePolynomial| |#1|)
                                  (|PrimitiveArray| |#1|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 25
                                            '(0 6 0 7 0 6 0 8 2 6 9 0 0 10 1 14
                                              9 0 15 0 14 0 16 1 14 17 0 18 1
                                              14 6 0 19 1 14 0 0 20 0 14 0 22 2
                                              14 0 6 17 23 2 14 0 0 0 24 1 0 12
                                              14 21 1 0 14 12 25 1 0 11 12
                                              13)))))
           '|lookupComplete|)) 
