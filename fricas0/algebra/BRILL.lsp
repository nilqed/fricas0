
(SDEFUN |BRILL;squaredPolynomial| ((|p| UP) ($ |Boolean|))
        (SPROG ((|d| (|NonNegativeInteger|)))
               (SEQ
                (LETT |d| (SPADCALL |p| (QREFELT $ 8))
                      |BRILL;squaredPolynomial|)
                (EXIT
                 (COND ((EQL |d| 0) 'T) ((ODDP |d|) NIL)
                       ('T
                        (|BRILL;squaredPolynomial|
                         (SPADCALL |p| (QREFELT $ 10)) $))))))) 

(SDEFUN |BRILL;primeEnough?| ((|n| |Integer|) (|b| |Integer|) ($ |Boolean|))
        (SPROG
         ((#1=#:G717 NIL) (#2=#:G718 NIL) (|bb| (|Float|)) (#3=#:G710 NIL)
          (|d| (|Union| (|Integer|) #4="failed")) (#5=#:G719 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |bb| (SPADCALL |b| (QREFELT $ 13))
                  . #6=(|BRILL;primeEnough?|))
            (SEQ (LETT |i| 2 . #6#) (LETT #5# |b| . #6#) G190
                 (COND ((|greater_SI| |i| #5#) (GO G191)))
                 (SEQ
                  (EXIT
                   (SEQ G190
                        (COND
                         ((NULL
                           (QEQCAR
                            (LETT |d| (SPADCALL |n| |i| (QREFELT $ 15)) . #6#)
                            0))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (SEQ
                           (LETT |n|
                                 (PROG2 (LETT #3# |d| . #6#)
                                     (QCDR #3#)
                                   (|check_union2| (QEQCAR #3# 0) (|Integer|)
                                                   (|Union| (|Integer|) #4#)
                                                   #3#))
                                 . #6#)
                           (LETT |bb|
                                 (SPADCALL |bb| (SPADCALL |i| (QREFELT $ 13))
                                           (QREFELT $ 16))
                                 . #6#)
                           (EXIT
                            (COND
                             ((SPADCALL |bb| (|spadConstant| $ 17)
                                        (QREFELT $ 19))
                              (PROGN
                               (LETT #1#
                                     (PROGN
                                      (LETT #2# NIL . #6#)
                                      (GO #7=#:G716))
                                     . #6#)
                               (GO #8=#:G712)))))))
                         #8# (EXIT #1#))
                        NIL (GO G190) G191 (EXIT NIL))))
                 (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
            (EXIT (SPADCALL |n| (QREFELT $ 20)))))
          #7# (EXIT #2#)))) 

(SDEFUN |BRILL;brillhartTrials;Nni;3| (($ |NonNegativeInteger|)) (QREFELT $ 21)) 

(SDEFUN |BRILL;brillhartTrials;2Nni;4|
        ((|n| |NonNegativeInteger|) ($ |NonNegativeInteger|))
        (SPROG ((|#G9| (|NonNegativeInteger|)) (|#G8| (|NonNegativeInteger|)))
               (SEQ
                (PROGN
                 (LETT |#G8| |n| . #1=(|BRILL;brillhartTrials;2Nni;4|))
                 (LETT |#G9| (QREFELT $ 21) . #1#)
                 (SETELT $ 21 |#G8|)
                 (LETT |n| |#G9| . #1#))
                (EXIT |n|)))) 

(SDEFUN |BRILL;brillhartIrreducible?;UPB;5| ((|p| UP) ($ |Boolean|))
        (SPADCALL |p| (SPADCALL |p| (QREFELT $ 24)) (QREFELT $ 25))) 

(SDEFUN |BRILL;brillhartIrreducible?;UP2B;6|
        ((|p| UP) (|noLinears| |Boolean|) ($ |Boolean|))
        (SPROG
         ((#1=#:G739 NIL) (#2=#:G740 NIL) (|small| (|Integer|)) (#3=#:G741 NIL)
          (|i| NIL) (|count| #4=(|Integer|)) (|largeEnough| #4#)
          (|polyx2| (|Boolean|)) (|even1| #5=(|Boolean|)) (|even0| #5#)
          (|origBound| #4#))
         (SEQ
          (EXIT
           (COND ((ZEROP (QREFELT $ 21)) NIL)
                 (#6='T
                  (SEQ
                   (LETT |origBound|
                         (LETT |largeEnough|
                               (+ (SPADCALL |p| (QREFELT $ 28)) 1)
                               . #7=(|BRILL;brillhartIrreducible?;UP2B;6|))
                         . #7#)
                   (LETT |even0|
                         (SPADCALL (SPADCALL |p| 0 (QREFELT $ 29))
                                   (QREFELT $ 30))
                         . #7#)
                   (LETT |even1|
                         (SPADCALL (SPADCALL |p| 1 (QREFELT $ 32))
                                   (QREFELT $ 30))
                         . #7#)
                   (LETT |polyx2| (|BRILL;squaredPolynomial| |p| $) . #7#)
                   (EXIT
                    (COND
                     ((SPADCALL (SPADCALL |p| |largeEnough| (QREFELT $ 32))
                                (QREFELT $ 20))
                      'T)
                     (#6#
                      (SEQ
                       (COND
                        ((NULL |polyx2|)
                         (COND
                          ((SPADCALL
                            (SPADCALL |p| (- |largeEnough|) (QREFELT $ 32))
                            (QREFELT $ 20))
                           (EXIT 'T)))))
                       (EXIT
                        (COND ((EQL (QREFELT $ 21) 1) NIL)
                              (#6#
                               (SEQ
                                (LETT |largeEnough| (+ |largeEnough| 1) . #7#)
                                (EXIT
                                 (COND
                                  ((|BRILL;primeEnough?|
                                    (SPADCALL |p| |largeEnough| (QREFELT $ 32))
                                    (COND (|noLinears| 4) (#6# 2)) $)
                                   'T)
                                  (#6#
                                   (SEQ
                                    (COND
                                     ((NULL |polyx2|)
                                      (COND
                                       ((|BRILL;primeEnough?|
                                         (SPADCALL |p| (- |largeEnough|)
                                                   (QREFELT $ 32))
                                         (COND (|noLinears| 4) (#6# 2)) $)
                                        (EXIT 'T)))))
                                    (COND
                                     ((ODDP |largeEnough|)
                                      (COND
                                       (|even0|
                                        (LETT |largeEnough| (+ |largeEnough| 1)
                                              . #7#))))
                                     (|even1|
                                      (LETT |largeEnough| (+ |largeEnough| 1)
                                            . #7#)))
                                    (LETT |count|
                                          (+
                                           (* (COND (|polyx2| 2) (#6# 1))
                                              (- (QREFELT $ 21) 2))
                                           |largeEnough|)
                                          . #7#)
                                    (SEQ (LETT |i| (+ |largeEnough| 1) . #7#)
                                         (LETT #3# |count| . #7#) G190
                                         (COND ((> |i| #3#) (GO G191)))
                                         (SEQ
                                          (LETT |small|
                                                (COND
                                                 (|noLinears|
                                                  (EXPT (- |i| |origBound|) 2))
                                                 ('T (- |i| |origBound|)))
                                                . #7#)
                                          (EXIT
                                           (COND
                                            ((|BRILL;primeEnough?|
                                              (SPADCALL |p| |i| (QREFELT $ 32))
                                              |small| $)
                                             (PROGN
                                              (LETT #2# 'T . #7#)
                                              (GO #8=#:G738)))
                                            ((NULL |polyx2|)
                                             (SEQ
                                              (EXIT
                                               (COND
                                                ((|BRILL;primeEnough?|
                                                  (SPADCALL |p| (- |i|)
                                                            (QREFELT $ 32))
                                                  |small| $)
                                                 (PROGN
                                                  (LETT #1#
                                                        (PROGN
                                                         (LETT #2# 'T . #7#)
                                                         (GO #8#))
                                                        . #7#)
                                                  (GO #9=#:G730)))))
                                              #9# (EXIT #1#))))))
                                         (LETT |i| (+ |i| 1) . #7#) (GO G190)
                                         G191 (EXIT NIL))
                                    (EXIT NIL)))))))))))))))))
          #8# (EXIT #2#)))) 

(SDEFUN |BRILL;noLinearFactor?;UPB;7| ((|p| UP) ($ |Boolean|))
        (COND
         ((ODDP (SPADCALL |p| (QREFELT $ 33)))
          (COND
           ((ODDP (SPADCALL |p| 0 (QREFELT $ 29)))
            (ODDP (SPADCALL |p| 1 (QREFELT $ 32))))
           (#1='T NIL)))
         (#1# NIL))) 

(DECLAIM (NOTINLINE |BrillhartTests;|)) 

(DEFUN |BrillhartTests| (#1=#:G745)
  (SPROG NIL
         (PROG (#2=#:G746)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|BrillhartTests|)
                                               '|domainEqualList|)
                    . #3=(|BrillhartTests|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|BrillhartTests;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|BrillhartTests|)))))))))) 

(DEFUN |BrillhartTests;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|BrillhartTests|))
          (LETT |dv$| (LIST '|BrillhartTests| DV$1) . #1#)
          (LETT $ (GETREFV 34) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|BrillhartTests| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 21 6)
          $))) 

(MAKEPROP '|BrillhartTests| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|NonNegativeInteger|)
              (0 . |degree|) (5 . |Zero|) (9 . |reductum|) (|Integer|)
              (|Float|) (14 . |coerce|) (|Union| $ '"failed") (19 . |exquo|)
              (25 . /) (31 . |One|) (|Boolean|) (35 . <) (41 . |prime?|)
              '|brillharttrials| |BRILL;brillhartTrials;Nni;3|
              |BRILL;brillhartTrials;2Nni;4| |BRILL;noLinearFactor?;UPB;7|
              |BRILL;brillhartIrreducible?;UP2B;6|
              |BRILL;brillhartIrreducible?;UPB;5|
              (|GaloisGroupFactorizationUtilities| 11 6 12) (46 . |rootBound|)
              (51 . |coefficient|) (57 . |even?|) (62 . |One|) (66 . |elt|)
              (72 . |leadingCoefficient|))
           '#(|noLinearFactor?| 77 |brillhartTrials| 82 |brillhartIrreducible?|
              91)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 33
                                                 '(1 6 7 0 8 0 6 0 9 1 6 0 0 10
                                                   1 12 0 11 13 2 11 14 0 0 15
                                                   2 12 0 0 0 16 0 12 0 17 2 12
                                                   18 0 0 19 1 11 18 0 20 1 27
                                                   11 6 28 2 6 11 0 7 29 1 11
                                                   18 0 30 0 6 0 31 2 6 11 0 11
                                                   32 1 6 11 0 33 1 0 18 6 24 0
                                                   0 7 22 1 0 7 7 23 2 0 18 6
                                                   18 25 1 0 18 6 26)))))
           '|lookupComplete|)) 
