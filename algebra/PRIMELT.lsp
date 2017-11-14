
(SDEFUN |PRIMELT;multi|
        ((|p| |SparseUnivariatePolynomial| F) (|v| |Symbol|)
         ($ |Polynomial| F))
        (SPADCALL (SPADCALL (LIST #'|PRIMELT;multi!0|) |p| (QREFELT $ 9)) |v|
                  (QREFELT $ 12))) 

(SDEFUN |PRIMELT;multi!0| ((|f1| NIL) ($$ NIL)) |f1|) 

(SDEFUN |PRIMELT;randomInts|
        ((|n| |NonNegativeInteger|) (|m| |NonNegativeInteger|)
         ($ |List| (|Integer|)))
        (SPROG ((#1=#:G720 NIL) (|i| NIL) (#2=#:G719 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|PRIMELT;randomInts|))
                 (SEQ (LETT |i| 1 . #3#) (LETT #1# |n| . #3#) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (SPADCALL (RANDOM |m|) |m| (QREFELT $ 14))
                                    #2#)
                              . #3#)))
                      (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |PRIMELT;incl?|
        ((|a| |List| (|Symbol|)) (|b| |List| (|Symbol|)) ($ |Boolean|))
        (SPROG NIL
               (SPADCALL (CONS #'|PRIMELT;incl?!0| (VECTOR $ |b|)) |a|
                         (QREFELT $ 19)))) 

(SDEFUN |PRIMELT;incl?!0| ((|s1| NIL) ($$ NIL))
        (PROG (|b| $)
          (LETT |b| (QREFELT $$ 1) . #1=(|PRIMELT;incl?|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |s1| |b| (QREFELT $ 17)))))) 

(SDEFUN |PRIMELT;primitiveElement;LLR;4|
        ((|l| |List| (|Polynomial| F)) (|v| |List| (|Symbol|))
         ($ |Record| (|:| |coef| (|List| (|Integer|)))
          (|:| |poly| (|List| (|SparseUnivariatePolynomial| F)))
          (|:| |prim| (|SparseUnivariatePolynomial| F))))
        (SPADCALL |l| |v| (SPADCALL (QREFELT $ 20)) (QREFELT $ 23))) 

(SDEFUN |PRIMELT;primitiveElement;PSPSR;5|
        ((|p1| |Polynomial| F) (|a1| |Symbol|) (|p2| |Polynomial| F)
         (|a2| |Symbol|)
         ($ |Record| (|:| |coef1| (|Integer|)) (|:| |coef2| (|Integer|))
          (|:| |prim| (|SparseUnivariatePolynomial| F))))
        (SPROG
         ((#1=#:G742 NIL) (#2=#:G743 NIL)
          (|r| (|SparseUnivariatePolynomial| F)) (|w| (|Polynomial| F))
          (|c| (|Integer|)) (|i| NIL) (|b| (|Polynomial| F))
          (|u| (|Polynomial| F)))
         (SEQ
          (EXIT
           (COND
            ((EQL (SPADCALL |p2| |a1| (QREFELT $ 26)) 1)
             (VECTOR 0 1
                     (SPADCALL (SPADCALL |p1| |p2| |a1| (QREFELT $ 30))
                               (QREFELT $ 31))))
            ('T
             (SEQ
              (LETT |u| (SPADCALL (SPADCALL (QREFELT $ 20)) (QREFELT $ 32))
                    . #3=(|PRIMELT;primitiveElement;PSPSR;5|))
              (LETT |b| (SPADCALL |a2| (QREFELT $ 32)) . #3#)
              (EXIT
               (SEQ (LETT |i| 10 . #3#) G190 NIL
                    (SEQ
                     (EXIT
                      (SEQ
                       (LETT |c| (SPADCALL (RANDOM |i|) |i| (QREFELT $ 14))
                             . #3#)
                       (LETT |w|
                             (SPADCALL |u| (SPADCALL |c| |b| (QREFELT $ 33))
                                       (QREFELT $ 34))
                             . #3#)
                       (LETT |r|
                             (SPADCALL
                              (SPADCALL (SPADCALL |p1| |a1| |w| (QREFELT $ 35))
                                        (SPADCALL |p2| |a1| |w| (QREFELT $ 35))
                                        |a2| (QREFELT $ 30))
                              (QREFELT $ 31))
                             . #3#)
                       (EXIT
                        (COND
                         ((NULL (SPADCALL |r| (QREFELT $ 36)))
                          (COND
                           ((SPADCALL |r| (SPADCALL |r| (QREFELT $ 37))
                                      (QREFELT $ 38))
                            (PROGN
                             (LETT #1#
                                   (PROGN
                                    (LETT #2# (VECTOR 1 |c| |r|) . #3#)
                                    (GO #4=#:G741))
                                   . #3#)
                             (GO #5=#:G736)))))))))
                     #5# (EXIT #1#))
                    (LETT |i| (+ |i| 1) . #3#) (GO G190) G191 (EXIT NIL)))))))
          #4# (EXIT #2#)))) 

(SDEFUN |PRIMELT;findUniv|
        ((|l| |List| (|Polynomial| F)) (|v| |Symbol|) (|opt| |Symbol|)
         ($ |Union| (|Polynomial| F) "failed"))
        (SPROG ((#1=#:G752 NIL) (#2=#:G753 NIL) (#3=#:G754 NIL) (|p| NIL))
               (SEQ
                (EXIT
                 (SEQ
                  (SEQ
                   (EXIT
                    (SEQ (LETT |p| NIL . #4=(|PRIMELT;findUniv|))
                         (LETT #3# |l| . #4#) G190
                         (COND
                          ((OR (ATOM #3#)
                               (PROGN (LETT |p| (CAR #3#) . #4#) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL (SPADCALL |p| |v| (QREFELT $ 26)) 0
                                       (QREFELT $ 42))
                             (COND
                              ((|PRIMELT;incl?| (SPADCALL |p| (QREFELT $ 43))
                                (LIST |v| |opt|) $)
                               (PROGN
                                (LETT #1#
                                      (PROGN
                                       (LETT #2# (CONS 0 |p|) . #4#)
                                       (GO #5=#:G751))
                                      . #4#)
                                (GO #6=#:G749))))))))
                         (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
                   #6# (EXIT #1#))
                  (EXIT (CONS 1 "failed"))))
                #5# (EXIT #2#)))) 

(SDEFUN |PRIMELT;triangularLinearIfCan|
        ((|l| |List| (|Polynomial| F)) (|lv| |List| (|Symbol|)) (|w| |Symbol|)
         ($ |Union| (|List| (|SparseUnivariatePolynomial| F)) "failed"))
        (SPROG
         ((|ll| (|List| (|SparseUnivariatePolynomial| F)))
          (|bc|
           (|Union|
            (|Record| (|:| |coef1| (|SparseUnivariatePolynomial| F))
                      (|:| |coef2| (|SparseUnivariatePolynomial| F)))
            "failed"))
          (#1=#:G789 NIL) (#2=#:G790 NIL)
          (|p| (|SparseUnivariatePolynomial| (|Polynomial| F)))
          (|u| (|Union| (|Polynomial| F) "failed")) (#3=#:G791 NIL) (|v| NIL)
          (|pw| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |u| (|PRIMELT;findUniv| |l| |w| |w| $)
                  . #4=(|PRIMELT;triangularLinearIfCan|))
            (EXIT
             (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                   ('T
                    (SEQ (LETT |pw| (SPADCALL (QCDR |u|) (QREFELT $ 31)) . #4#)
                         (LETT |ll| NIL . #4#)
                         (SEQ (LETT |v| NIL . #4#) (LETT #3# |lv| . #4#) G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |v| (CAR #3#) . #4#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (SEQ
                                 (SEQ
                                  (LETT |u| (|PRIMELT;findUniv| |l| |v| |w| $)
                                        . #4#)
                                  (EXIT
                                   (COND
                                    ((OR (QEQCAR |u| 1)
                                         (SPADCALL
                                          (SPADCALL
                                           (LETT |p|
                                                 (SPADCALL (QCDR |u|) |v|
                                                           (QREFELT $ 45))
                                                 . #4#)
                                           (QREFELT $ 47))
                                          1 (QREFELT $ 48)))
                                     (PROGN
                                      (LETT #1#
                                            (PROGN
                                             (LETT #2# (CONS 1 "failed") . #4#)
                                             (GO #5=#:G788))
                                            . #4#)
                                      (GO #6=#:G778))))))
                                 (LETT |bc|
                                       (SPADCALL
                                        (SPADCALL (SPADCALL |p| (QREFELT $ 49))
                                                  (QREFELT $ 31))
                                        |pw| (|spadConstant| $ 50)
                                        (QREFELT $ 53))
                                       . #4#)
                                 (EXIT
                                  (COND
                                   ((QEQCAR |bc| 1)
                                    (|error| "Should not happen"))
                                   ('T
                                    (LETT |ll|
                                          (CONS
                                           (SPADCALL
                                            (LIST
                                             #'|PRIMELT;triangularLinearIfCan!0|)
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL
                                                (SPADCALL |p| 0 (QREFELT $ 55))
                                                (QREFELT $ 31))
                                               (QCAR (QCDR |bc|))
                                               (QREFELT $ 56))
                                              (QREFELT $ 57))
                                             |pw| (QREFELT $ 58))
                                            (QREFELT $ 9))
                                           |ll|)
                                          . #4#))))))
                               #6# (EXIT #1#))
                              (LETT #3# (CDR #3#) . #4#) (GO G190) G191
                              (EXIT NIL))
                         (EXIT
                          (CONS 0
                                (CONS
                                 (SPADCALL
                                  (LIST #'|PRIMELT;triangularLinearIfCan!1|)
                                  |pw| (QREFELT $ 9))
                                 (NREVERSE |ll|))))))))))
          #5# (EXIT #2#)))) 

(SDEFUN |PRIMELT;triangularLinearIfCan!1| ((|f1| NIL) ($$ NIL)) |f1|) 

(SDEFUN |PRIMELT;triangularLinearIfCan!0| ((|z1| NIL) ($$ NIL)) |z1|) 

(SDEFUN |PRIMELT;primitiveElement;LLSR;8|
        ((|l| |List| (|Polynomial| F)) (|vars| |List| (|Symbol|))
         (|uu| |Symbol|)
         ($ |Record| (|:| |coef| (|List| (|Integer|)))
          (|:| |poly| (|List| (|SparseUnivariatePolynomial| F)))
          (|:| |prim| (|SparseUnivariatePolynomial| F))))
        (SPROG
         ((#1=#:G816 NIL) (#2=#:G817 NIL)
          (|ltt| (|List| (|SparseUnivariatePolynomial| F)))
          (|tt| (|Union| (|List| (|SparseUnivariatePolynomial| F)) "failed"))
          (#3=#:G806 NIL) (#4=#:G805 #5=(|Polynomial| F)) (#6=#:G807 #5#)
          (#7=#:G820 NIL) (|c| NIL) (#8=#:G821 NIL) (|t| NIL)
          (|cf| (|List| (|Integer|))) (|i| NIL) (|n| (|NonNegativeInteger|))
          (|w| (|Polynomial| F)) (|elim| (|List| (|Symbol|)))
          (|vv| (|List| (|Polynomial| F))) (#9=#:G819 NIL) (|v| NIL)
          (#10=#:G818 NIL) (|u| (|Polynomial| F)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |u| (SPADCALL |uu| (QREFELT $ 32))
                  . #11=(|PRIMELT;primitiveElement;LLSR;8|))
            (LETT |vv|
                  (PROGN
                   (LETT #10# NIL . #11#)
                   (SEQ (LETT |v| NIL . #11#) (LETT #9# |vars| . #11#) G190
                        (COND
                         ((OR (ATOM #9#)
                              (PROGN (LETT |v| (CAR #9#) . #11#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #10# (CONS (SPADCALL |v| (QREFELT $ 32)) #10#)
                                . #11#)))
                        (LETT #9# (CDR #9#) . #11#) (GO G190) G191
                        (EXIT (NREVERSE #10#))))
                  . #11#)
            (LETT |elim| (SPADCALL |vars| |uu| (QREFELT $ 59)) . #11#)
            (LETT |w| (SPADCALL |uu| (QREFELT $ 32)) . #11#)
            (LETT |n| (LENGTH |l|) . #11#)
            (EXIT
             (SEQ (LETT |i| 10 . #11#) G190 NIL
                  (SEQ
                   (EXIT
                    (SEQ (LETT |cf| (|PRIMELT;randomInts| |n| |i| $) . #11#)
                         (LETT |tt|
                               (|PRIMELT;triangularLinearIfCan|
                                (SPADCALL
                                 (CONS
                                  (SPADCALL |w|
                                            (PROGN
                                             (LETT #3# NIL . #11#)
                                             (SEQ (LETT |t| NIL . #11#)
                                                  (LETT #8# |vv| . #11#)
                                                  (LETT |c| NIL . #11#)
                                                  (LETT #7# |cf| . #11#) G190
                                                  (COND
                                                   ((OR (ATOM #7#)
                                                        (PROGN
                                                         (LETT |c| (CAR #7#)
                                                               . #11#)
                                                         NIL)
                                                        (ATOM #8#)
                                                        (PROGN
                                                         (LETT |t| (CAR #8#)
                                                               . #11#)
                                                         NIL))
                                                    (GO G191)))
                                                  (SEQ
                                                   (EXIT
                                                    (PROGN
                                                     (LETT #6#
                                                           (SPADCALL |c| |t|
                                                                     (QREFELT $
                                                                              33))
                                                           . #11#)
                                                     (COND
                                                      (#3#
                                                       (LETT #4#
                                                             (SPADCALL #4# #6#
                                                                       (QREFELT
                                                                        $ 60))
                                                             . #11#))
                                                      ('T
                                                       (PROGN
                                                        (LETT #4# #6# . #11#)
                                                        (LETT #3# 'T
                                                              . #11#)))))))
                                                  (LETT #7#
                                                        (PROG1 (CDR #7#)
                                                          (LETT #8# (CDR #8#)
                                                                . #11#))
                                                        . #11#)
                                                  (GO G190) G191 (EXIT NIL))
                                             (COND (#3# #4#)
                                                   ('T (|spadConstant| $ 29))))
                                            (QREFELT $ 34))
                                  |l|)
                                 |elim| (QREFELT $ 62))
                                |vars| |uu| $)
                               . #11#)
                         (EXIT
                          (COND
                           ((QEQCAR |tt| 0)
                            (PROGN
                             (LETT #1#
                                   (SEQ (LETT |ltt| (QCDR |tt|) . #11#)
                                        (EXIT
                                         (PROGN
                                          (LETT #2#
                                                (VECTOR |cf| (CDR |ltt|)
                                                        (|SPADfirst| |ltt|))
                                                . #11#)
                                          (GO #12=#:G815))))
                                   . #11#)
                             (GO #13=#:G812)))))))
                   #13# (EXIT #1#))
                  (LETT |i| (+ |i| 1) . #11#) (GO G190) G191 (EXIT NIL)))))
          #12# (EXIT #2#)))) 

(DECLAIM (NOTINLINE |PrimitiveElement;|)) 

(DEFUN |PrimitiveElement| (#1=#:G822)
  (SPROG NIL
         (PROG (#2=#:G823)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|PrimitiveElement|)
                                               '|domainEqualList|)
                    . #3=(|PrimitiveElement|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|PrimitiveElement;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|PrimitiveElement|)))))))))) 

(DEFUN |PrimitiveElement;| (|#1|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|PrimitiveElement|))
          (LETT |dv$| (LIST '|PrimitiveElement| DV$1) . #1#)
          (LETT $ (GETREFV 63) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|PrimitiveElement| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|PrimitiveElement| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|Mapping| 6 6)
              (|SparseUnivariatePolynomial| 6) (0 . |map|) (|Symbol|)
              (|Polynomial| 6) (6 . |multivariate|) (|Integer|)
              (12 . |symmetricRemainder|) (|Boolean|) (|List| 10)
              (18 . |member?|) (|Mapping| 15 10) (24 . |every?|) (30 . |new|)
              (|Record| (|:| |coef| (|List| 13)) (|:| |poly| (|List| 8))
                        (|:| |prim| 8))
              (|List| 11) |PRIMELT;primitiveElement;LLSR;8|
              |PRIMELT;primitiveElement;LLR;4| (|NonNegativeInteger|)
              (34 . |degree|) (40 . |One|) (44 . |Zero|) (48 . |Zero|)
              (52 . |resultant|) (59 . |univariate|) (64 . |coerce|) (69 . *)
              (75 . -) (81 . |eval|) (88 . |zero?|) (93 . |squareFreePart|)
              (98 . =) (104 . |One|)
              (|Record| (|:| |coef1| 13) (|:| |coef2| 13) (|:| |prim| 8))
              |PRIMELT;primitiveElement;PSPSR;5| (108 . >) (114 . |variables|)
              (|SparseUnivariatePolynomial| $) (119 . |univariate|)
              (|SparseUnivariatePolynomial| 11) (125 . |degree|) (130 . ~=)
              (136 . |leadingCoefficient|) (141 . |One|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 51 '"failed")
              (145 . |extendedEuclidean|) (152 . |Zero|) (156 . |coefficient|)
              (162 . *) (168 . -) (173 . |rem|) (179 . |concat|) (185 . +)
              (|PolyGroebner| 6) (191 . |lexGroebner|))
           '#(|primitiveElement| 197) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 62
                                                 '(2 8 0 7 0 9 2 11 0 8 10 12 2
                                                   13 0 0 0 14 2 16 15 10 0 17
                                                   2 16 15 18 0 19 0 10 0 20 2
                                                   11 25 0 10 26 0 6 0 27 0 6 0
                                                   28 0 11 0 29 3 11 0 0 0 10
                                                   30 1 11 8 0 31 1 11 0 10 32
                                                   2 11 0 13 0 33 2 11 0 0 0 34
                                                   3 11 0 0 10 0 35 1 8 15 0 36
                                                   1 8 0 0 37 2 8 15 0 0 38 0
                                                   11 0 39 2 25 15 0 0 42 1 11
                                                   16 0 43 2 11 44 0 10 45 1 46
                                                   25 0 47 2 25 15 0 0 48 1 46
                                                   11 0 49 0 8 0 50 3 8 52 0 0
                                                   0 53 0 8 0 54 2 46 11 0 25
                                                   55 2 8 0 0 0 56 1 8 0 0 57 2
                                                   8 0 0 0 58 2 16 0 0 10 59 2
                                                   11 0 0 0 60 2 61 22 22 16 62
                                                   4 0 40 11 10 11 10 41 3 0 21
                                                   22 16 10 23 2 0 21 22 16
                                                   24)))))
           '|lookupComplete|)) 
