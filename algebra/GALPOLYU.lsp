
(SDEFUN |GALPOLYU;factorsOfDegree;PiFL;1|
        ((|d| |PositiveInteger|) (|r| |Factored| UP) ($ |List| UP))
        (SPROG
         ((|lfact| (|List| UP)) (#1=#:G722 NIL) (|i| NIL) (#2=#:G721 NIL)
          (|fr| NIL))
         (SEQ (LETT |lfact| NIL . #3=(|GALPOLYU;factorsOfDegree;PiFL;1|))
              (SEQ (LETT |fr| NIL . #3#)
                   (LETT #2# (SPADCALL |r| (QREFELT $ 11)) . #3#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |fr| (CAR #2#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((EQL (SPADCALL (QCAR |fr|) (QREFELT $ 13)) |d|)
                       (SEQ (LETT |i| 1 . #3#) (LETT #1# (QCDR |fr|) . #3#)
                            G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT |lfact| (CONS (QCAR |fr|) |lfact|) . #3#)))
                            (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                            (EXIT NIL))))))
                   (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |lfact|)))) 

(SDEFUN |GALPOLYU;factorOfDegree;PiFUP;2|
        ((|d| |PositiveInteger|) (|r| |Factored| UP) ($ UP))
        (SPROG ((#1=#:G727 NIL) (|factor| (UP)) (#2=#:G728 NIL) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |factor| (|spadConstant| $ 17)
                        . #3=(|GALPOLYU;factorOfDegree;PiFUP;2|))
                  (SEQ (LETT |i| 1 . #3#)
                       (LETT #2# (SPADCALL |r| (QREFELT $ 18)) . #3#) G190
                       (COND ((|greater_SI| |i| #2#) (GO G191)))
                       (SEQ
                        (LETT |factor| (SPADCALL |r| |i| (QREFELT $ 20)) . #3#)
                        (EXIT
                         (COND
                          ((EQL (SPADCALL |factor| (QREFELT $ 13)) |d|)
                           (PROGN (LETT #1# |factor| . #3#) (GO #4=#:G726))))))
                       (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT (|error| "factorOfDegree: Bad arguments"))))
                #4# (EXIT #1#)))) 

(SDEFUN |GALPOLYU;degreePartition;FM;3|
        ((|r| |Factored| UP) ($ |Multiset| (|NonNegativeInteger|)))
        (SPROG ((#1=#:G732 NIL) (|i| NIL) (#2=#:G731 NIL))
               (SEQ
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL . #3=(|GALPOLYU;degreePartition;FM;3|))
                  (SEQ (LETT |i| 1 . #3#)
                       (LETT #1# (SPADCALL |r| (QREFELT $ 18)) . #3#) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2#
                               (CONS
                                (SPADCALL (SPADCALL |r| |i| (QREFELT $ 20))
                                          (QREFELT $ 13))
                                #2#)
                               . #3#)))
                       (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 24))))) 

(SDEFUN |GALPOLYU;monic?;UPB;4| ((|p| UP) ($ |Boolean|))
        (SPADCALL (SPADCALL |p| (QREFELT $ 26)) (|spadConstant| $ 27)
                  (QREFELT $ 29))) 

(SDEFUN |GALPOLYU;reverse;2UP;5| ((|p| UP) ($ UP))
        (SPROG
         ((|r| (UP)) (#1=#:G734 NIL) (#2=#:G738 NIL) (|i| NIL)
          (|n| (|NonNegativeInteger|)))
         (SEQ (LETT |r| (|spadConstant| $ 17) . #3=(|GALPOLYU;reverse;2UP;5|))
              (LETT |n| (SPADCALL |p| (QREFELT $ 13)) . #3#)
              (SEQ (LETT |i| 0 . #3#) (LETT #2# |n| . #3#) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |r|
                           (SPADCALL |r|
                                     (SPADCALL
                                      (SPADCALL |p|
                                                (PROG1
                                                    (LETT #1# (- |n| |i|)
                                                          . #3#)
                                                  (|check_subtype2| (>= #1# 0)
                                                                    '(|NonNegativeInteger|)
                                                                    '(|Integer|)
                                                                    #1#))
                                                (QREFELT $ 31))
                                      |i| (QREFELT $ 32))
                                     (QREFELT $ 33))
                           . #3#)))
                   (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
              (EXIT |r|)))) 

(SDEFUN |GALPOLYU;scaleRoots;UPRUP;6| ((|p| UP) (|c| R) ($ UP))
        (SPROG ((|mc| (R)) (|r| (UP)) (|i| NIL) (|n| (|NonNegativeInteger|)))
               (SEQ
                (COND ((SPADCALL |c| (|spadConstant| $ 27) (QREFELT $ 29)) |p|)
                      (#1='T
                       (SEQ
                        (LETT |n| (SPADCALL |p| (QREFELT $ 13))
                              . #2=(|GALPOLYU;scaleRoots;UPRUP;6|))
                        (EXIT
                         (COND
                          ((SPADCALL |c| (QREFELT $ 36))
                           (SPADCALL (SPADCALL |p| (QREFELT $ 26)) |n|
                                     (QREFELT $ 32)))
                          (#1#
                           (SEQ (LETT |r| (|spadConstant| $ 17) . #2#)
                                (LETT |mc| (|spadConstant| $ 27) . #2#)
                                (SEQ (LETT |i| |n| . #2#) G190
                                     (COND ((< |i| 0) (GO G191)))
                                     (SEQ
                                      (LETT |r|
                                            (SPADCALL |r|
                                                      (SPADCALL
                                                       (SPADCALL |mc|
                                                                 (SPADCALL |p|
                                                                           |i|
                                                                           (QREFELT
                                                                            $
                                                                            31))
                                                                 (QREFELT $
                                                                          37))
                                                       |i| (QREFELT $ 32))
                                                      (QREFELT $ 33))
                                            . #2#)
                                      (EXIT
                                       (LETT |mc|
                                             (SPADCALL |mc| |c| (QREFELT $ 37))
                                             . #2#)))
                                     (LETT |i| (+ |i| -1) . #2#) (GO G190) G191
                                     (EXIT NIL))
                                (EXIT |r|))))))))))) 

(SDEFUN |GALPOLYU;shiftRoots;UPRUP;7| ((|p| UP) (|c| R) ($ UP))
        (SPADCALL (SPADCALL (ELT $ 39) |p| (QREFELT $ 43))
                  (SPADCALL (SPADCALL (|spadConstant| $ 27) 1 (QREFELT $ 32))
                            (SPADCALL |c| (QREFELT $ 39)) (QREFELT $ 44))
                  (QREFELT $ 45))) 

(DECLAIM (NOTINLINE |GaloisGroupPolynomialUtilities;|)) 

(DEFUN |GaloisGroupPolynomialUtilities| (&REST #1=#:G759)
  (SPROG NIL
         (PROG (#2=#:G760)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|GaloisGroupPolynomialUtilities|)
                                               '|domainEqualList|)
                    . #3=(|GaloisGroupPolynomialUtilities|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |GaloisGroupPolynomialUtilities;|)
                             #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|GaloisGroupPolynomialUtilities|)))))))))) 

(DEFUN |GaloisGroupPolynomialUtilities;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|)
                . #1=(|GaloisGroupPolynomialUtilities|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|GaloisGroupPolynomialUtilities| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 47) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|GaloisGroupPolynomialUtilities|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|GaloisGroupPolynomialUtilities| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Record| (|:| |factor| 7) (|:| |exponent| 19)) (|List| 8)
              (|Factored| 7) (0 . |factors|) (|NonNegativeInteger|)
              (5 . |degree|) (|List| 7) (|PositiveInteger|)
              |GALPOLYU;factorsOfDegree;PiFL;1| (10 . |Zero|)
              (14 . |numberOfFactors|) (|Integer|) (19 . |nthFactor|)
              |GALPOLYU;factorOfDegree;PiFUP;2| (|List| 12) (|Multiset| 12)
              (25 . |multiset|) |GALPOLYU;degreePartition;FM;3|
              (30 . |leadingCoefficient|) (35 . |One|) (|Boolean|) (39 . =)
              |GALPOLYU;monic?;UPB;4| (45 . |coefficient|) (51 . |monomial|)
              (57 . +) |GALPOLYU;reverse;2UP;5| (63 . |One|) (67 . |zero?|)
              (72 . *) |GALPOLYU;scaleRoots;UPRUP;6| (78 . |coerce|)
              (|SparseUnivariatePolynomial| 7) (|Mapping| 7 6)
              (|UnivariatePolynomialCategoryFunctions2| 6 7 7 40) (83 . |map|)
              (89 . -) (95 . |elt|) |GALPOLYU;shiftRoots;UPRUP;7|)
           '#(|shiftRoots| 101 |scaleRoots| 107 |reverse| 113 |monic?| 118
              |factorsOfDegree| 123 |factorOfDegree| 129 |degreePartition| 135)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 46
                                                 '(1 10 9 0 11 1 7 12 0 13 0 7
                                                   0 17 1 10 12 0 18 2 10 7 0
                                                   19 20 1 23 0 22 24 1 7 6 0
                                                   26 0 6 0 27 2 6 28 0 0 29 2
                                                   7 6 0 12 31 2 7 0 6 12 32 2
                                                   7 0 0 0 33 0 7 0 35 1 6 28 0
                                                   36 2 6 0 0 0 37 1 7 0 6 39 2
                                                   42 40 41 7 43 2 7 0 0 0 44 2
                                                   40 7 0 7 45 2 0 7 7 6 46 2 0
                                                   7 7 6 38 1 0 7 7 34 1 0 28 7
                                                   30 2 0 14 15 10 16 2 0 7 15
                                                   10 21 1 0 23 10 25)))))
           '|lookupComplete|)) 
