
(SDEFUN |LEADCDET;polCase;ZNniLB;1|
        ((|d| Z) (|nk| |NonNegativeInteger|) (|lval| |List| Z) ($ |Boolean|))
        (SPROG
         ((|distlist| (|List| Z)) (#1=#:G727 NIL) (|q| (Z)) (|y| (Z))
          (#2=#:G718 NIL) (#3=#:G729 NIL) (#4=#:G717 NIL) (|j| NIL)
          (#5=#:G728 NIL) (|i| NIL))
         (SEQ
          (EXIT
           (SEQ (LETT |distlist| (LIST |d|) . #6=(|LEADCDET;polCase;ZNniLB;1|))
                (SEQ (LETT |i| 1 . #6#) (LETT #5# |nk| . #6#) G190
                     (COND ((|greater_SI| |i| #5#) (GO G191)))
                     (SEQ
                      (LETT |q|
                            (QVELT
                             (SPADCALL (SPADCALL |lval| |i| (QREFELT $ 12))
                                       (QREFELT $ 14))
                             1)
                            . #6#)
                      (SEQ (LETT |j| 0 . #6#)
                           (LETT #3#
                                 (PROG1 (LETT #4# (- |i| 1) . #6#)
                                   (|check_subtype2| (>= #4# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #4#))
                                 . #6#)
                           G190 (COND ((|greater_SI| |j| #3#) (GO G191)))
                           (SEQ
                            (LETT |y|
                                  (SPADCALL |distlist|
                                            (PROG1 (LETT #2# (- |i| |j|) . #6#)
                                              (|check_subtype2| (>= #2# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #2#))
                                            (QREFELT $ 12))
                                  . #6#)
                            (SEQ G190
                                 (COND
                                  ((NULL
                                    (SPADCALL |y| (|spadConstant| $ 15)
                                              (QREFELT $ 18)))
                                   (GO G191)))
                                 (SEQ
                                  (LETT |y| (SPADCALL |y| |q| (QREFELT $ 19))
                                        . #6#)
                                  (EXIT
                                   (LETT |q| (SPADCALL |q| |y| (QREFELT $ 20))
                                         . #6#)))
                                 NIL (GO G190) G191 (EXIT NIL))
                            (EXIT
                             (COND
                              ((SPADCALL |q| (|spadConstant| $ 15)
                                         (QREFELT $ 21))
                               (PROGN (LETT #1# NIL . #6#) (GO #7=#:G726))))))
                           (LETT |j| (|inc_SI| |j|) . #6#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT
                       (LETT |distlist|
                             (SPADCALL |distlist| (LIST |q|) (QREFELT $ 22))
                             . #6#)))
                     (LETT |i| (|inc_SI| |i|) . #6#) (GO G190) G191 (EXIT NIL))
                (EXIT 'T)))
          #7# (EXIT #1#)))) 

(SDEFUN |LEADCDET;checkpow| ((|a| Z) (|b| Z) ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G737 NIL) (|qt| (|Union| Z "failed")) (|i| NIL))
               (SEQ
                (EXIT
                 (SEQ (LETT |i| 0 . #2=(|LEADCDET;checkpow|)) G190 NIL
                      (SEQ (LETT |qt| (SPADCALL |b| |a| (QREFELT $ 26)) . #2#)
                           (COND
                            ((QEQCAR |qt| 1)
                             (PROGN (LETT #1# |i| . #2#) (GO #3=#:G736))))
                           (EXIT (LETT |b| (QCDR |qt|) . #2#)))
                      (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191
                      (EXIT NIL)))
                #3# (EXIT #1#)))) 

(SDEFUN |LEADCDET;distribute|
        ((|contm| Z) (|unilist| |List| (|SparseUnivariatePolynomial| Z))
         (|pl| |List| P) (|vl| |List| Z) (|lvar| |List| OV) (|lval| |List| Z)
         ($ |Record| (|:| |polfac| (|List| P)) (|:| |correct| Z)
          (|:| |corrfact| (|List| (|SparseUnivariatePolynomial| Z)))))
        (SPROG
         ((#1=#:G747 NIL) (|i| NIL) (|d| (Z)) (|lcp| (Z)) (#2=#:G746 NIL)
          (|nf| (|NonNegativeInteger|)))
         (SEQ (LETT |nf| (LENGTH |unilist|) . #3=(|LEADCDET;distribute|))
              (SEQ (LETT |i| 1 . #3#) (LETT #2# |nf| . #3#) G190
                   (COND ((|greater_SI| |i| #2#) (GO G191)))
                   (SEQ
                    (LETT |lcp|
                          (SPADCALL (SPADCALL |unilist| |i| (QREFELT $ 29))
                                    (QREFELT $ 30))
                          . #3#)
                    (LETT |d|
                          (SPADCALL |lcp| (SPADCALL |vl| |i| (QREFELT $ 12))
                                    (QREFELT $ 19))
                          . #3#)
                    (SPADCALL |pl| |i|
                              (SPADCALL (SPADCALL |lcp| |d| (QREFELT $ 20))
                                        (SPADCALL |pl| |i| (QREFELT $ 32))
                                        (QREFELT $ 33))
                              (QREFELT $ 34))
                    (LETT |d|
                          (SPADCALL (SPADCALL |vl| |i| (QREFELT $ 12)) |d|
                                    (QREFELT $ 20))
                          . #3#)
                    (SPADCALL |unilist| |i|
                              (SPADCALL |d|
                                        (SPADCALL |unilist| |i| (QREFELT $ 29))
                                        (QREFELT $ 35))
                              (QREFELT $ 36))
                    (EXIT
                     (LETT |contm| (SPADCALL |contm| |d| (QREFELT $ 20))
                           . #3#)))
                   (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191 (EXIT NIL))
              (COND
               ((SPADCALL |contm| (|spadConstant| $ 15) (QREFELT $ 18))
                (SEQ (LETT |i| 1 . #3#) (LETT #1# |nf| . #3#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (SPADCALL |pl| |i|
                                 (SPADCALL |contm|
                                           (SPADCALL |pl| |i| (QREFELT $ 32))
                                           (QREFELT $ 33))
                                 (QREFELT $ 34))))
                     (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                     (EXIT NIL))))
              (EXIT (VECTOR |pl| |contm| |unilist|))))) 

(SDEFUN |LEADCDET;distFact;ZLRLLLU;4|
        ((|contm| Z) (|unilist| |List| (|SparseUnivariatePolynomial| Z))
         (|plead| |Record| (|:| |contp| Z)
          (|:| |factors|
               (|List| (|Record| (|:| |irr| P) (|:| |pow| (|Integer|))))))
         (|vl| |List| Z) (|lvar| |List| OV) (|lval| |List| Z)
         ($ |Union|
          (|Record| (|:| |polfac| (|List| P)) (|:| |correct| Z)
                    (|:| |corrfact| (|List| (|SparseUnivariatePolynomial| Z))))
          "failed"))
        (SPROG
         ((#1=#:G789 NIL) (|i| NIL) (#2=#:G788 NIL) (#3=#:G779 NIL)
          (#4=#:G787 NIL) (|k| NIL) (|c| (Z)) (|d| (Z))
          (|h| (|NonNegativeInteger|)) (#5=#:G786 NIL) (#6=#:G785 NIL)
          (|aux| (|List| P)) (#7=#:G784 NIL) (#8=#:G783 NIL) (|vlp| (|List| Z))
          (#9=#:G782 NIL) (#10=#:G781 NIL) (|lexp| (|List| (|Integer|)))
          (|lpol| (|List| P)) (#11=#:G780 NIL) (|fpl| NIL)
          (|nf| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |lpol| NIL . #12=(|LEADCDET;distFact;ZLRLLLU;4|))
                (LETT |lexp| NIL . #12#) (LETT |nf| (LENGTH |unilist|) . #12#)
                (LETT |vl| (REVERSE |vl|) . #12#)
                (SEQ (LETT |fpl| NIL . #12#) (LETT #11# (QCDR |plead|) . #12#)
                     G190
                     (COND
                      ((OR (ATOM #11#)
                           (PROGN (LETT |fpl| (CAR #11#) . #12#) NIL))
                       (GO G191)))
                     (SEQ (LETT |lpol| (CONS (QCAR |fpl|) |lpol|) . #12#)
                          (EXIT
                           (LETT |lexp| (CONS (QCDR |fpl|) |lexp|) . #12#)))
                     (LETT #11# (CDR #11#) . #12#) (GO G190) G191 (EXIT NIL))
                (LETT |vlp|
                      (PROGN
                       (LETT #10# NIL . #12#)
                       (SEQ (LETT |i| 1 . #12#) (LETT #9# |nf| . #12#) G190
                            (COND ((|greater_SI| |i| #9#) (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #10# (CONS (|spadConstant| $ 15) #10#)
                                    . #12#)))
                            (LETT |i| (|inc_SI| |i|) . #12#) (GO G190) G191
                            (EXIT (NREVERSE #10#))))
                      . #12#)
                (LETT |aux|
                      (PROGN
                       (LETT #8# NIL . #12#)
                       (SEQ (LETT |i| 1 . #12#) (LETT #7# |nf| . #12#) G190
                            (COND ((|greater_SI| |i| #7#) (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #8# (CONS (|spadConstant| $ 16) #8#)
                                    . #12#)))
                            (LETT |i| (|inc_SI| |i|) . #12#) (GO G190) G191
                            (EXIT (NREVERSE #8#))))
                      . #12#)
                (SEQ (LETT |i| 1 . #12#) (LETT #6# |nf| . #12#) G190
                     (COND ((|greater_SI| |i| #6#) (GO G191)))
                     (SEQ
                      (LETT |c|
                            (SPADCALL |contm|
                                      (SPADCALL
                                       (SPADCALL |unilist| |i| (QREFELT $ 29))
                                       (QREFELT $ 30))
                                      (QREFELT $ 37))
                            . #12#)
                      (COND
                       ((OR (SPADCALL |c| (|spadConstant| $ 15) (QREFELT $ 21))
                            (SPADCALL |c|
                                      (SPADCALL (|spadConstant| $ 15)
                                                (QREFELT $ 38))
                                      (QREFELT $ 21)))
                        (EXIT "next i")))
                      (SEQ (LETT |k| 1 . #12#)
                           (LETT #5# (LENGTH |lpol|) . #12#) G190
                           (COND ((|greater_SI| |k| #5#) (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((EQL (SPADCALL |lexp| |k| (QREFELT $ 40)) 0)
                               "next factor")
                              ('T
                               (SEQ
                                (LETT |h|
                                      (|LEADCDET;checkpow|
                                       (SPADCALL |vl| |k| (QREFELT $ 12)) |c|
                                       $)
                                      . #12#)
                                (EXIT
                                 (COND
                                  ((SPADCALL |h| 0 (QREFELT $ 43))
                                   (SEQ
                                    (COND
                                     ((SPADCALL |h|
                                                (SPADCALL |lexp| |k|
                                                          (QREFELT $ 40))
                                                (QREFELT $ 44))
                                      (PROGN
                                       (LETT #3# (CONS 1 "failed") . #12#)
                                       (GO #13=#:G778))))
                                    (SPADCALL |lexp| |k|
                                              (-
                                               (SPADCALL |lexp| |k|
                                                         (QREFELT $ 40))
                                               |h|)
                                              (QREFELT $ 45))
                                    (SPADCALL |aux| |i|
                                              (SPADCALL
                                               (SPADCALL |aux| |i|
                                                         (QREFELT $ 32))
                                               (SPADCALL
                                                (SPADCALL |lpol| |k|
                                                          (QREFELT $ 32))
                                                |h| (QREFELT $ 46))
                                               (QREFELT $ 47))
                                              (QREFELT $ 34))
                                    (LETT |d|
                                          (SPADCALL
                                           (SPADCALL |vl| |k| (QREFELT $ 12))
                                           |h| (QREFELT $ 48))
                                          . #12#)
                                    (SPADCALL |vlp| |i|
                                              (SPADCALL
                                               (SPADCALL |vlp| |i|
                                                         (QREFELT $ 12))
                                               |d| (QREFELT $ 37))
                                              (QREFELT $ 49))
                                    (EXIT
                                     (LETT |c|
                                           (SPADCALL |c| |d| (QREFELT $ 20))
                                           . #12#)))))))))))
                           (LETT |k| (|inc_SI| |k|) . #12#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT
                       (COND
                        ((SPADCALL |contm| (|spadConstant| $ 15)
                                   (QREFELT $ 21))
                         (SPADCALL |vlp| |i| |c| (QREFELT $ 49))))))
                     (LETT |i| (|inc_SI| |i|) . #12#) (GO G190) G191
                     (EXIT NIL))
                (SEQ (LETT |k| 1 . #12#) (LETT #4# (LENGTH |lpol|) . #12#) G190
                     (COND ((|greater_SI| |k| #4#) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |lexp| |k| (QREFELT $ 40)) 0
                                   (QREFELT $ 50))
                         (PROGN
                          (LETT #3# (CONS 1 "failed") . #12#)
                          (GO #13#))))))
                     (LETT |k| (|inc_SI| |k|) . #12#) (GO G190) G191
                     (EXIT NIL))
                (EXIT
                 (COND
                  ((SPADCALL |contm| (|spadConstant| $ 15) (QREFELT $ 21))
                   (CONS 0
                         (VECTOR
                          (PROGN
                           (LETT #2# NIL . #12#)
                           (SEQ (LETT |i| 1 . #12#) (LETT #1# |nf| . #12#) G190
                                (COND ((|greater_SI| |i| #1#) (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS
                                         (SPADCALL
                                          (SPADCALL |vlp| |i| (QREFELT $ 12))
                                          (SPADCALL |aux| |i| (QREFELT $ 32))
                                          (QREFELT $ 33))
                                         #2#)
                                        . #12#)))
                                (LETT |i| (|inc_SI| |i|) . #12#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (|spadConstant| $ 15) |unilist|)))
                  ('T
                   (CONS 0
                         (|LEADCDET;distribute| |contm| |unilist| |aux| |vlp|
                          |lvar| |lval| $)))))))
          #13# (EXIT #3#)))) 

(DECLAIM (NOTINLINE |LeadingCoefDetermination;|)) 

(DEFUN |LeadingCoefDetermination| (&REST #1=#:G790)
  (SPROG NIL
         (PROG (#2=#:G791)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|LeadingCoefDetermination|)
                                               '|domainEqualList|)
                    . #3=(|LeadingCoefDetermination|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |LeadingCoefDetermination;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|LeadingCoefDetermination|)))))))))) 

(DEFUN |LeadingCoefDetermination;| (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #1=(|LeadingCoefDetermination|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$| (LIST '|LeadingCoefDetermination| DV$1 DV$2 DV$3 DV$4) . #1#)
    (LETT $ (GETREFV 57) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
    (|haddProp| |$ConstructorCache| '|LeadingCoefDetermination|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|LeadingCoefDetermination| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|Integer|) (|List| 8) (0 . |elt|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (6 . |unitNormal|) (11 . |One|) (15 . |One|) (|Boolean|)
              (19 . ~=) (25 . |gcd|) (31 . |quo|) (37 . =) (43 . |append|)
              (|NonNegativeInteger|) |LEADCDET;polCase;ZNniLB;1|
              (|Union| $ '"failed") (49 . |exquo|)
              (|SparseUnivariatePolynomial| 8) (|List| 27) (55 . |elt|)
              (61 . |leadingCoefficient|) (|List| 9) (66 . |elt|) (72 . *)
              (78 . |setelt!|) (85 . *) (91 . |setelt!|) (98 . *) (104 . -)
              (|List| 10) (109 . |elt|) (115 . |Zero|) (119 . |Zero|)
              (123 . ~=) (129 . >) (135 . |setelt!|) (142 . ^) (148 . *)
              (154 . ^) (160 . |setelt!|) (167 . ~=)
              (|Record| (|:| |polfac| 31) (|:| |correct| 8)
                        (|:| |corrfact| 28))
              (|Union| 51 '"failed") (|Record| (|:| |irr| 9) (|:| |pow| 10))
              (|Record| (|:| |contp| 8) (|:| |factors| (|List| 53))) (|List| 6)
              |LEADCDET;distFact;ZLRLLLU;4|)
           '#(|polCase| 173 |distFact| 180) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 56
                                                 '(2 11 8 0 10 12 1 8 13 0 14 0
                                                   8 0 15 0 9 0 16 2 8 17 0 0
                                                   18 2 8 0 0 0 19 2 8 0 0 0 20
                                                   2 8 17 0 0 21 2 11 0 0 0 22
                                                   2 8 25 0 0 26 2 28 27 0 10
                                                   29 1 27 8 0 30 2 31 9 0 10
                                                   32 2 9 0 8 0 33 3 31 9 0 10
                                                   9 34 2 27 0 8 0 35 3 28 27 0
                                                   10 27 36 2 8 0 0 0 37 1 8 0
                                                   0 38 2 39 10 0 10 40 0 7 0
                                                   41 0 8 0 42 2 23 17 0 0 43 2
                                                   10 17 0 0 44 3 39 10 0 10 10
                                                   45 2 9 0 0 23 46 2 9 0 0 0
                                                   47 2 8 0 0 23 48 3 11 8 0 10
                                                   8 49 2 10 17 0 0 50 3 0 17 8
                                                   23 11 24 6 0 52 8 28 54 11
                                                   55 11 56)))))
           '|lookupComplete|)) 
