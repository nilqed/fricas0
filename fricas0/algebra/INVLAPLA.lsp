
(SDEFUN |INVLAPLA;inverseLaplace;F2SU;1|
        ((|expr| F) (|ivar| |Symbol|) (|ovar| |Symbol|) ($ |Union| F "failed"))
        (|INVLAPLA;ilt| |expr| |ivar| |ovar| $)) 

(SDEFUN |INVLAPLA;freeOf?|
        ((|p| |SparseUnivariatePolynomial| F) (|v| |Symbol|) ($ |Boolean|))
        (SPROG
         ((#1=#:G710 NIL) (#2=#:G709 #3=(|Boolean|)) (#4=#:G711 #3#)
          (#5=#:G713 NIL) (|c| NIL))
         (SEQ
          (PROGN
           (LETT #1# NIL . #6=(|INVLAPLA;freeOf?|))
           (SEQ (LETT |c| NIL . #6#)
                (LETT #5# (SPADCALL |p| (QREFELT $ 13)) . #6#) G190
                (COND
                 ((OR (ATOM #5#) (PROGN (LETT |c| (CAR #5#) . #6#) NIL))
                  (GO G191)))
                (SEQ
                 (EXIT
                  (PROGN
                   (LETT #4# (SPADCALL |c| |v| (QREFELT $ 15)) . #6#)
                   (COND (#1# (LETT #2# (COND (#2# #4#) ('T NIL)) . #6#))
                         ('T
                          (PROGN (LETT #2# #4# . #6#) (LETT #1# 'T . #6#)))))))
                (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
           (COND (#1# #2#) ('T 'T)))))) 

(SDEFUN |INVLAPLA;ilt|
        ((|expr| F) (|var| |Symbol|) (|t| |Symbol|) ($ |Union| F "failed"))
        (SPROG ((|r| (|Fraction| (|SparseUnivariatePolynomial| F))))
               (SEQ
                (COND
                 ((SPADCALL |expr| (|spadConstant| $ 17) (QREFELT $ 18))
                  (CONS 0 (|spadConstant| $ 17)))
                 (#1='T
                  (SEQ
                   (LETT |r|
                         (SPADCALL |expr| (SPADCALL |var| (QREFELT $ 20))
                                   (QREFELT $ 23))
                         |INVLAPLA;ilt|)
                   (COND
                    ((NULL
                      (SPADCALL
                       (SPADCALL (SPADCALL |r| (QREFELT $ 25))
                                 (SPADCALL |r| (QREFELT $ 26)) (QREFELT $ 27))
                       (|spadConstant| $ 28) (QREFELT $ 29)))
                     (EXIT (CONS 1 "failed"))))
                   (COND
                    ((|INVLAPLA;freeOf?| (SPADCALL |r| (QREFELT $ 25)) |var| $)
                     (COND
                      ((NULL
                        (|INVLAPLA;freeOf?| (SPADCALL |r| (QREFELT $ 26)) |var|
                         $))
                       (EXIT (CONS 1 #2="failed")))))
                    (#1# (EXIT (CONS 1 #2#))))
                   (EXIT
                    (CONS 0
                          (|INVLAPLA;ilt1| |r| (SPADCALL |t| (QREFELT $ 30))
                           $))))))))) 

(SDEFUN |INVLAPLA;ilt1|
        ((|r| |Fraction| (|SparseUnivariatePolynomial| F)) (|t| F) ($ F))
        (SPROG
         ((|rsplit|
           (|Record|
            (|:| |answer| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |logpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |specpart| (|Fraction| (|SparseUnivariatePolynomial| F)))
            (|:| |polypart| (|SparseUnivariatePolynomial| F)))))
         (SEQ
          (COND
           ((SPADCALL |r| (|spadConstant| $ 32) (QREFELT $ 33))
            (|spadConstant| $ 17))
           ('T
            (SEQ
             (LETT |rsplit| (SPADCALL |r| (ELT $ 34) (QREFELT $ 37))
                   |INVLAPLA;ilt1|)
             (EXIT
              (SPADCALL
               (SPADCALL
                (SPADCALL |t| (|INVLAPLA;ilt1| (QVELT |rsplit| 0) |t| $)
                          (QREFELT $ 38))
                (QREFELT $ 39))
               (|INVLAPLA;iltsqfr| (QVELT |rsplit| 1) |t| $)
               (QREFELT $ 40))))))))) 

(SDEFUN |INVLAPLA;iltsqfr|
        ((|r| |Fraction| (|SparseUnivariatePolynomial| F)) (|t| F) ($ F))
        (SPROG
         ((#1=#:G753 NIL) (#2=#:G752 (F)) (#3=#:G754 (F)) (#4=#:G760 NIL)
          (|a| NIL) (#5=#:G761 NIL) (|b| NIL)
          (|nl| (|List| (|SparseUnivariatePolynomial| F))) (#6=#:G750 NIL)
          (|ql| (|List| (|SparseUnivariatePolynomial| F))) (#7=#:G759 NIL)
          (|qq| NIL) (#8=#:G758 NIL) (|q| (|SparseUnivariatePolynomial| F))
          (|p| (|SparseUnivariatePolynomial| F)))
         (SEQ
          (COND
           ((SPADCALL |r| (|spadConstant| $ 32) (QREFELT $ 33))
            (|spadConstant| $ 17))
           (#9='T
            (SEQ
             (LETT |p| (SPADCALL |r| (QREFELT $ 25))
                   . #10=(|INVLAPLA;iltsqfr|))
             (LETT |q| (SPADCALL |r| (QREFELT $ 26)) . #10#)
             (LETT |ql|
                   (PROGN
                    (LETT #8# NIL . #10#)
                    (SEQ (LETT |qq| NIL . #10#)
                         (LETT #7#
                               (SPADCALL (SPADCALL |q| (QREFELT $ 42))
                                         (QREFELT $ 46))
                               . #10#)
                         G190
                         (COND
                          ((OR (ATOM #7#)
                               (PROGN (LETT |qq| (CAR #7#) . #10#) NIL))
                           (GO G191)))
                         (SEQ (EXIT (LETT #8# (CONS (QCAR |qq|) #8#) . #10#)))
                         (LETT #7# (CDR #7#) . #10#) (GO G190) G191
                         (EXIT (NREVERSE #8#))))
                   . #10#)
             (EXIT
              (COND ((EQL (LENGTH |ql|) 1) (|INVLAPLA;iltirred| |p| |q| |t| $))
                    (#9#
                     (SEQ
                      (LETT |nl|
                            (PROG2
                                (LETT #6# (SPADCALL |ql| |p| (QREFELT $ 50))
                                      . #10#)
                                (QCDR #6#)
                              (|check_union2| (QEQCAR #6# 0)
                                              (|List|
                                               (|SparseUnivariatePolynomial|
                                                (QREFELT $ 7)))
                                              (|Union|
                                               (|List|
                                                (|SparseUnivariatePolynomial|
                                                 (QREFELT $ 7)))
                                               "failed")
                                              #6#))
                            . #10#)
                      (EXIT
                       (PROGN
                        (LETT #1# NIL . #10#)
                        (SEQ (LETT |b| NIL . #10#) (LETT #5# |ql| . #10#)
                             (LETT |a| NIL . #10#) (LETT #4# |nl| . #10#) G190
                             (COND
                              ((OR (ATOM #4#)
                                   (PROGN (LETT |a| (CAR #4#) . #10#) NIL)
                                   (ATOM #5#)
                                   (PROGN (LETT |b| (CAR #5#) . #10#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (PROGN
                                (LETT #3# (|INVLAPLA;iltirred| |a| |b| |t| $)
                                      . #10#)
                                (COND
                                 (#1#
                                  (LETT #2# (SPADCALL #2# #3# (QREFELT $ 40))
                                        . #10#))
                                 ('T
                                  (PROGN
                                   (LETT #2# #3# . #10#)
                                   (LETT #1# 'T . #10#)))))))
                             (LETT #4#
                                   (PROG1 (CDR #4#)
                                     (LETT #5# (CDR #5#) . #10#))
                                   . #10#)
                             (GO G190) G191 (EXIT NIL))
                        (COND (#1# #2#) (#9# (|spadConstant| $ 17))))))))))))))) 

(SDEFUN |INVLAPLA;iltirred|
        ((|p| |SparseUnivariatePolynomial| F)
         (|q| |SparseUnivariatePolynomial| F) (|t| F) ($ F))
        (SPROG
         ((#1=#:G771 NIL) (#2=#:G770 (F)) (#3=#:G772 (F)) (#4=#:G777 NIL)
          (|root| NIL) (|q1| (|SparseUnivariatePolynomial| F))
          (|roots| (|List| F)) (|alpha| (F)) (|d| (F)) (|b| (F)) (|e| (F))
          (|c| (F)) (|a| (F)) (|cp| (F)))
         (SEQ
          (COND
           ((EQL (SPADCALL |q| (QREFELT $ 52)) 1)
            (SEQ
             (LETT |cp| (SPADCALL |p| 0 (QREFELT $ 53))
                   . #5=(|INVLAPLA;iltirred|))
             (LETT |c| (SPADCALL |q| 0 (QREFELT $ 53)) . #5#)
             (EXIT
              (COND ((SPADCALL |c| (|spadConstant| $ 17) (QREFELT $ 18)) |cp|)
                    (#6='T
                     (SPADCALL |cp|
                               (SPADCALL
                                (SPADCALL (SPADCALL |c| |t| (QREFELT $ 38))
                                          (QREFELT $ 39))
                                (QREFELT $ 54))
                               (QREFELT $ 38)))))))
           ((EQL (SPADCALL |q| (QREFELT $ 52)) 2)
            (SEQ (LETT |a| (SPADCALL |p| 1 (QREFELT $ 53)) . #5#)
                 (LETT |b| (SPADCALL |p| 0 (QREFELT $ 53)) . #5#)
                 (LETT |c|
                       (SPADCALL
                        (SPADCALL (SPADCALL 1 2 (QREFELT $ 61)) (QREFELT $ 62))
                        (SPADCALL |q| 1 (QREFELT $ 53)) (QREFELT $ 63))
                       . #5#)
                 (LETT |d| (SPADCALL |q| 0 (QREFELT $ 53)) . #5#)
                 (LETT |e|
                       (SPADCALL (SPADCALL |c| |t| (QREFELT $ 38))
                                 (QREFELT $ 54))
                       . #5#)
                 (LETT |b|
                       (SPADCALL |b| (SPADCALL |a| |c| (QREFELT $ 38))
                                 (QREFELT $ 40))
                       . #5#)
                 (LETT |d|
                       (SPADCALL |d| (SPADCALL |c| 2 (QREFELT $ 65))
                                 (QREFELT $ 66))
                       . #5#)
                 (EXIT
                  (COND
                   ((SPADCALL (|spadConstant| $ 17) |d| (QREFELT $ 67))
                    (SEQ (LETT |alpha| (SPADCALL |d| (QREFELT $ 68)) . #5#)
                         (EXIT
                          (SPADCALL |e|
                                    (SPADCALL
                                     (SPADCALL |a|
                                               (SPADCALL
                                                (SPADCALL |t| |alpha|
                                                          (QREFELT $ 38))
                                                (QREFELT $ 69))
                                               (QREFELT $ 38))
                                     (SPADCALL
                                      (SPADCALL |b|
                                                (SPADCALL
                                                 (SPADCALL |t| |alpha|
                                                           (QREFELT $ 38))
                                                 (QREFELT $ 70))
                                                (QREFELT $ 38))
                                      |alpha| (QREFELT $ 71))
                                     (QREFELT $ 40))
                                    (QREFELT $ 38)))))
                   (#6#
                    (SEQ
                     (LETT |alpha|
                           (SPADCALL (SPADCALL |d| (QREFELT $ 39))
                                     (QREFELT $ 68))
                           . #5#)
                     (EXIT
                      (SPADCALL |e|
                                (SPADCALL
                                 (SPADCALL |a|
                                           (SPADCALL
                                            (SPADCALL |t| |alpha|
                                                      (QREFELT $ 38))
                                            (QREFELT $ 72))
                                           (QREFELT $ 38))
                                 (SPADCALL
                                  (SPADCALL |b|
                                            (SPADCALL
                                             (SPADCALL |t| |alpha|
                                                       (QREFELT $ 38))
                                             (QREFELT $ 73))
                                            (QREFELT $ 38))
                                  |alpha| (QREFELT $ 71))
                                 (QREFELT $ 40))
                                (QREFELT $ 38)))))))))
           (#6#
            (SEQ (LETT |roots| (SPADCALL |q| (QREFELT $ 75)) . #5#)
                 (LETT |q1| (SPADCALL |q| (QREFELT $ 34)) . #5#)
                 (EXIT
                  (PROGN
                   (LETT #1# NIL . #5#)
                   (SEQ (LETT |root| NIL . #5#) (LETT #4# |roots| . #5#) G190
                        (COND
                         ((OR (ATOM #4#)
                              (PROGN (LETT |root| (CAR #4#) . #5#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (PROGN
                           (LETT #3#
                                 (SPADCALL
                                  (SPADCALL
                                   (SPADCALL |p| |root| (QREFELT $ 76))
                                   (SPADCALL |q1| |root| (QREFELT $ 76))
                                   (QREFELT $ 71))
                                  (SPADCALL
                                   (SPADCALL |root| |t| (QREFELT $ 38))
                                   (QREFELT $ 54))
                                  (QREFELT $ 38))
                                 . #5#)
                           (COND
                            (#1#
                             (LETT #2# (SPADCALL #2# #3# (QREFELT $ 40))
                                   . #5#))
                            ('T
                             (PROGN
                              (LETT #2# #3# . #5#)
                              (LETT #1# 'T . #5#)))))))
                        (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                   (COND (#1# #2#) (#6# (|spadConstant| $ 17))))))))))) 

(DECLAIM (NOTINLINE |InverseLaplaceTransform;|)) 

(DEFUN |InverseLaplaceTransform| (&REST #1=#:G778)
  (SPROG NIL
         (PROG (#2=#:G779)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|InverseLaplaceTransform|)
                                               '|domainEqualList|)
                    . #3=(|InverseLaplaceTransform|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |InverseLaplaceTransform;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|InverseLaplaceTransform|)))))))))) 

(DEFUN |InverseLaplaceTransform;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|InverseLaplaceTransform|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|InverseLaplaceTransform| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 77) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|InverseLaplaceTransform|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 31
                    (|TranscendentalHermiteIntegration| |#2|
                                                        (|SparseUnivariatePolynomial|
                                                         |#2|)))
          $))) 

(MAKEPROP '|InverseLaplaceTransform| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|Union| 7 '"failed") (|Symbol|) |INVLAPLA;inverseLaplace;F2SU;1|
              (|List| 7) (|SparseUnivariatePolynomial| 7) (0 . |coefficients|)
              (|Boolean|) (5 . |freeOf?|) (11 . |Zero|) (15 . |Zero|) (19 . =)
              (|Kernel| 7) (25 . |kernel|) (|Fraction| 74) (|Kernel| $)
              (30 . |univariate|) (|Fraction| 12) (36 . |numer|) (41 . |denom|)
              (46 . |quo|) (52 . |Zero|) (56 . =) (62 . |coerce|) '|hintpac|
              (67 . |Zero|) (71 . =) (77 . |differentiate|)
              (|Record| (|:| |answer| 24) (|:| |logpart| 24)
                        (|:| |specpart| 24) (|:| |polypart| 12))
              (|Mapping| 12 12) (82 . |HermiteIntegrate|) (88 . *) (94 . -)
              (99 . +) (|Factored| $) (105 . |squareFree|)
              (|Record| (|:| |factor| 12) (|:| |exponent| 59)) (|List| 43)
              (|Factored| 12) (110 . |factors|) (115 . |One|)
              (|Union| 49 '"failed") (|List| $) (119 . |multiEuclidean|)
              (|NonNegativeInteger|) (125 . |degree|) (130 . |coefficient|)
              (136 . |exp|) (141 . |One|) (|SparseMultivariatePolynomial| 6 19)
              (145 . |One|) (149 . |One|) (|Integer|) (|Fraction| 59) (153 . /)
              (159 . -) (164 . *) (|PositiveInteger|) (170 . ^) (176 . -)
              (182 . |smaller?|) (188 . |sqrt|) (193 . |cos|) (198 . |sin|)
              (203 . /) (209 . |cosh|) (214 . |sinh|)
              (|SparseUnivariatePolynomial| $) (219 . |zerosOf|) (224 . |elt|))
           '#(|inverseLaplace| 230) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 76
                                                 '(1 12 11 0 13 2 7 14 0 9 15 0
                                                   6 0 16 0 7 0 17 2 7 14 0 0
                                                   18 1 19 0 9 20 2 7 21 0 22
                                                   23 1 24 12 0 25 1 24 12 0 26
                                                   2 12 0 0 0 27 0 12 0 28 2 12
                                                   14 0 0 29 1 7 0 9 30 0 24 0
                                                   32 2 24 14 0 0 33 1 12 0 0
                                                   34 2 31 35 24 36 37 2 7 0 0
                                                   0 38 1 7 0 0 39 2 7 0 0 0 40
                                                   1 12 41 0 42 1 45 44 0 46 0
                                                   6 0 47 2 12 48 49 0 50 1 12
                                                   51 0 52 2 12 7 0 51 53 1 7 0
                                                   0 54 0 7 0 55 0 56 0 57 0 12
                                                   0 58 2 60 0 59 59 61 1 60 0
                                                   0 62 2 7 0 60 0 63 2 7 0 0
                                                   64 65 2 7 0 0 0 66 2 7 14 0
                                                   0 67 1 7 0 0 68 1 7 0 0 69 1
                                                   7 0 0 70 2 7 0 0 0 71 1 7 0
                                                   0 72 1 7 0 0 73 1 7 49 74 75
                                                   2 12 7 0 7 76 3 0 8 7 9 9
                                                   10)))))
           '|lookupComplete|)) 
