
(SDEFUN |GAUSSFAC;reduction| ((|u| |Integer|) (|p| |Integer|) ($ |Integer|))
        (COND ((EQL |p| 0) |u|) ('T (SPADCALL |u| |p| (QREFELT $ 7))))) 

(SDEFUN |GAUSSFAC;merge|
        ((|p| |Integer|) (|q| |Integer|) ($ |Union| (|Integer|) "failed"))
        (COND ((EQL |p| |q|) (CONS 0 |p|)) ((EQL |p| 0) (CONS 0 |q|))
              ((EQL |q| 0) (CONS 0 |p|)) ('T (CONS 1 "failed")))) 

(SDEFUN |GAUSSFAC;exactquo|
        ((|u| |Integer|) (|v| |Integer|) (|p| |Integer|)
         ($ |Union| (|Integer|) "failed"))
        (SPROG ((#1=#:G710 NIL))
               (COND ((EQL |p| 0) (SPADCALL |u| |v| (QREFELT $ 9)))
                     ((EQL (REM |v| |p|) 0) (CONS 1 "failed"))
                     ('T
                      (CONS 0
                            (SPADCALL
                             (QCAR
                              (PROG2
                                  (LETT #1#
                                        (SPADCALL |v| |p| |u| (QREFELT $ 12))
                                        |GAUSSFAC;exactquo|)
                                  (QCDR #1#)
                                (|check_union2| (QEQCAR #1# 0)
                                                (|Record|
                                                 (|:| |coef1| (|Integer|))
                                                 (|:| |coef2| (|Integer|)))
                                                (|Union|
                                                 (|Record|
                                                  (|:| |coef1| (|Integer|))
                                                  (|:| |coef2| (|Integer|)))
                                                 "failed")
                                                #1#)))
                             |p| (QREFELT $ 7))))))) 

(SDEFUN |GAUSSFAC;findelt| ((|q| |Integer|) ($ |Integer|))
        (SPROG
         ((|t| (|FMod|)) (|s| (|FMod|)) (#1=#:G739 NIL) (|i| NIL)
          (|qq1| (|FMod|)) (|r1| (|Union| (|Integer|) "failed"))
          (|r| #2=(|Integer|)) (#3=#:G705 NIL) (|q1| #2#))
         (SEQ (LETT |q1| (- |q| 1) . #4=(|GAUSSFAC;findelt|))
              (LETT |r| |q1| . #4#)
              (LETT |r1| (SPADCALL |r| 4 (QREFELT $ 9)) . #4#)
              (SEQ G190 (COND ((NULL (NULL (QEQCAR |r1| 1))) (GO G191)))
                   (SEQ
                    (LETT |r|
                          (PROG2 (LETT #3# |r1| . #4#)
                              (QCDR #3#)
                            (|check_union2| (QEQCAR #3# 0) (|Integer|)
                                            (|Union| (|Integer|) "failed")
                                            #3#))
                          . #4#)
                    (EXIT (LETT |r1| (SPADCALL |r| 2 (QREFELT $ 9)) . #4#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |s| (SPADCALL 1 |q| (QREFELT $ 18)) . #4#)
              (LETT |qq1| (SPADCALL |q1| |q| (QREFELT $ 18)) . #4#)
              (SEQ (LETT |i| 2 . #4#) G190
                   (COND
                    ((NULL
                      (COND
                       ((SPADCALL |s| (|spadConstant| $ 14) (QREFELT $ 20)) 'T)
                       ('T (SPADCALL |s| |qq1| (QREFELT $ 20)))))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |s|
                           (SPADCALL (SPADCALL |i| |q| (QREFELT $ 18))
                                     (PROG1 (LETT #1# |r| . #4#)
                                       (|check_subtype2| (>= #1# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #1#))
                                     (QREFELT $ 22))
                           . #4#)))
                   (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
              (LETT |t| |s| . #4#)
              (SEQ G190
                   (COND
                    ((NULL (SPADCALL |t| |qq1| (QREFELT $ 23))) (GO G191)))
                   (SEQ (LETT |s| |t| . #4#)
                        (EXIT
                         (LETT |t| (SPADCALL |t| 2 (QREFELT $ 25)) . #4#)))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT (SPADCALL |s| (QREFELT $ 26)))))) 

(SDEFUN |GAUSSFAC;sumsq1| ((|p| . #1=(|Integer|)) ($ |List| (|Integer|)))
        (SPROG ((|s| (|Integer|)) (|u| #1#) (|w| (|Integer|)))
               (SEQ
                (LETT |s| (|GAUSSFAC;findelt| |p| $) . #2=(|GAUSSFAC;sumsq1|))
                (LETT |u| |p| . #2#)
                (SEQ G190
                     (COND
                      ((NULL
                        (SPADCALL (SPADCALL |u| 2 (QREFELT $ 27)) |p|
                                  (QREFELT $ 28)))
                       (GO G191)))
                     (SEQ (LETT |w| (REM |u| |s|) . #2#) (LETT |u| |s| . #2#)
                          (EXIT (LETT |s| |w| . #2#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT (LIST |u| |s|))))) 

(SDEFUN |GAUSSFAC;intfactor|
        ((|n| |Integer|) ($ |Factored| (|Complex| (|Integer|))))
        (SPROG
         ((|r|
           (|List|
            (|Record| (|:| |flg| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |fctr| (|Complex| (|Integer|)))
                      (|:| |xpnt| (|Integer|)))))
          (|z| #1=(|Complex| (|Integer|))) (|sz| (|List| (|Integer|)))
          (|unity| #1#) (#2=#:G782 NIL) (|exp| (|Integer|)) (#3=#:G798 NIL)
          (|term| NIL) (|lfn| (|Factored| (|Integer|))))
         (SEQ
          (LETT |lfn| (SPADCALL |n| (QREFELT $ 31))
                . #4=(|GAUSSFAC;intfactor|))
          (LETT |r| NIL . #4#)
          (LETT |unity|
                (SPADCALL (SPADCALL |lfn| (QREFELT $ 32)) 0 (QREFELT $ 16))
                . #4#)
          (SEQ (LETT |term| NIL . #4#)
               (LETT #3# (SPADCALL |lfn| (QREFELT $ 36)) . #4#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |term| (CAR #3#) . #4#) NIL))
                 (GO G191)))
               (SEQ (LETT |n| (QVELT |term| 1) . #4#)
                    (LETT |exp| (QVELT |term| 2) . #4#)
                    (EXIT
                     (COND
                      ((EQL |n| 2)
                       (SEQ
                        (LETT |r|
                              (CONS
                               (VECTOR (CONS 3 "prime") (QREFELT $ 17)
                                       (SPADCALL 2 |exp| (QREFELT $ 37)))
                               |r|)
                              . #4#)
                        (EXIT
                         (LETT |unity|
                               (SPADCALL |unity|
                                         (SPADCALL
                                          (SPADCALL 0 -1 (QREFELT $ 16))
                                          (PROG1 (LETT #2# (REM |exp| 4) . #4#)
                                            (|check_subtype2| (>= #2# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #2#))
                                          (QREFELT $ 38))
                                         (QREFELT $ 39))
                               . #4#))))
                      ((EQL (REM |n| 4) 3)
                       (LETT |r|
                             (CONS
                              (VECTOR (CONS 3 "prime")
                                      (SPADCALL |n| 0 (QREFELT $ 16)) |exp|)
                              |r|)
                             . #4#))
                      ('T
                       (SEQ (LETT |sz| (|GAUSSFAC;sumsq1| |n| $) . #4#)
                            (LETT |z|
                                  (SPADCALL (SPADCALL |sz| 1 (QREFELT $ 41))
                                            (SPADCALL |sz| 2 (QREFELT $ 41))
                                            (QREFELT $ 16))
                                  . #4#)
                            (EXIT
                             (LETT |r|
                                   (CONS (VECTOR (CONS 3 "prime") |z| |exp|)
                                         (CONS
                                          (VECTOR (CONS 3 "prime")
                                                  (SPADCALL |z| (QREFELT $ 42))
                                                  |exp|)
                                          |r|))
                                   . #4#)))))))
               (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |unity| |r| (QREFELT $ 46)))))) 

(SDEFUN |GAUSSFAC;factor;CF;7|
        ((|m| |Complex| (|Integer|)) ($ |Factored| (|Complex| (|Integer|))))
        (SPROG
         ((|unity| (|Complex| (|Integer|)))
          (|result|
           (|List|
            (|Record| (|:| |flg| (|Union| "nil" "sqfr" "irred" "prime"))
                      (|:| |fctr| (|Complex| (|Integer|)))
                      (|:| |xpnt| (|Integer|)))))
          (|z| (|Complex| (|Integer|))) (#1=#:G814 NIL)
          (|part|
           (|Record|
            (|:| |flg| (|Union| #2="nil" #3="sqfr" #4="irred" #5="prime"))
            (|:| |fctr| (|Complex| (|Integer|))) (|:| |xpnt| (|Integer|))))
          (|g0| (|Complex| (|Integer|))) (#6=#:G810 NIL) (|exp| #7=(|Integer|))
          (|n| (|Integer|)) (#8=#:G823 NIL) (|term| NIL)
          (|factn|
           (|List|
            (|Record| (|:| |flg| (|Union| #2# #3# #4# #5#))
                      (|:| |fctr| (|Integer|)) (|:| |xpnt| #7#))))
          (|r| #9=(|Factored| (|Complex| (|Integer|)))) (|b| (|Integer|))
          (#10=#:G705 NIL) (|a| (|Integer|)) (|d| (|Integer|)) (|ris| #9#))
         (SEQ
          (COND
           ((SPADCALL |m| (|spadConstant| $ 48) (QREFELT $ 49))
            (SPADCALL (|spadConstant| $ 48) 1 (QREFELT $ 50)))
           (#11='T
            (SEQ
             (LETT |a| (SPADCALL |m| (QREFELT $ 51))
                   . #12=(|GAUSSFAC;factor;CF;7|))
             (LETT |b| (SPADCALL |m| (QREFELT $ 52)) . #12#)
             (EXIT
              (COND ((EQL |b| 0) (|GAUSSFAC;intfactor| |a| $))
                    ((EQL |a| 0)
                     (SEQ (LETT |ris| (|GAUSSFAC;intfactor| |b| $) . #12#)
                          (LETT |unity|
                                (SPADCALL (SPADCALL |ris| (QREFELT $ 53))
                                          (SPADCALL 0 1 (QREFELT $ 16))
                                          (QREFELT $ 39))
                                . #12#)
                          (EXIT
                           (SPADCALL |unity| (SPADCALL |ris| (QREFELT $ 54))
                                     (QREFELT $ 46)))))
                    (#11#
                     (SEQ (LETT |d| (GCD |a| |b|) . #12#)
                          (LETT |result| NIL . #12#)
                          (LETT |unity| (|spadConstant| $ 55) . #12#)
                          (COND
                           ((SPADCALL |d| 1 (QREFELT $ 56))
                            (SEQ
                             (LETT |a|
                                   (PROG2
                                       (LETT #10#
                                             (SPADCALL |a| |d| (QREFELT $ 9))
                                             . #12#)
                                       (QCDR #10#)
                                     (|check_union2| (QEQCAR #10# 0)
                                                     (|Integer|)
                                                     (|Union| (|Integer|)
                                                              #13="failed")
                                                     #10#))
                                   . #12#)
                             (LETT |b|
                                   (PROG2
                                       (LETT #10#
                                             (SPADCALL |b| |d| (QREFELT $ 9))
                                             . #12#)
                                       (QCDR #10#)
                                     (|check_union2| (QEQCAR #10# 0)
                                                     (|Integer|)
                                                     (|Union| (|Integer|) #13#)
                                                     #10#))
                                   . #12#)
                             (LETT |r| (|GAUSSFAC;intfactor| |d| $) . #12#)
                             (LETT |result| (SPADCALL |r| (QREFELT $ 54))
                                   . #12#)
                             (LETT |unity| (SPADCALL |r| (QREFELT $ 53))
                                   . #12#)
                             (EXIT
                              (LETT |m| (SPADCALL |a| |b| (QREFELT $ 16))
                                    . #12#)))))
                          (LETT |n|
                                (+ (SPADCALL |a| 2 (QREFELT $ 27))
                                   (SPADCALL |b| 2 (QREFELT $ 27)))
                                . #12#)
                          (LETT |factn|
                                (SPADCALL (SPADCALL |n| (QREFELT $ 31))
                                          (QREFELT $ 36))
                                . #12#)
                          (LETT |part|
                                (VECTOR (CONS 3 "prime") (|spadConstant| $ 48)
                                        0)
                                . #12#)
                          (SEQ (LETT |term| NIL . #12#)
                               (LETT #8# |factn| . #12#) G190
                               (COND
                                ((OR (ATOM #8#)
                                     (PROGN
                                      (LETT |term| (CAR #8#) . #12#)
                                      NIL))
                                 (GO G191)))
                               (SEQ (LETT |n| (QVELT |term| 1) . #12#)
                                    (LETT |exp| (QVELT |term| 2) . #12#)
                                    (EXIT
                                     (COND
                                      ((EQL |n| 2)
                                       (SEQ
                                        (LETT |part|
                                              (VECTOR (CONS 3 "prime")
                                                      (QREFELT $ 17) |exp|)
                                              . #12#)
                                        (LETT |m|
                                              (SPADCALL |m|
                                                        (SPADCALL
                                                         (QREFELT $ 17)
                                                         (PROG1
                                                             (LETT #6# |exp|
                                                                   . #12#)
                                                           (|check_subtype2|
                                                            (>= #6# 0)
                                                            '(|NonNegativeInteger|)
                                                            '(|Integer|) #6#))
                                                         (QREFELT $ 38))
                                                        (QREFELT $ 57))
                                              . #12#)
                                        (EXIT
                                         (LETT |result| (CONS |part| |result|)
                                               . #12#))))
                                      ((EQL (REM |n| 4) 3)
                                       (SEQ
                                        (LETT |g0|
                                              (SPADCALL |n| 0 (QREFELT $ 16))
                                              . #12#)
                                        (LETT |part|
                                              (VECTOR (CONS 3 "prime") |g0|
                                                      (QUOTIENT2 |exp| 2))
                                              . #12#)
                                        (LETT |m|
                                              (SPADCALL |m| |g0|
                                                        (QREFELT $ 57))
                                              . #12#)
                                        (EXIT
                                         (LETT |result| (CONS |part| |result|)
                                               . #12#))))
                                      ('T
                                       (SEQ
                                        (LETT |z|
                                              (SPADCALL |m|
                                                        (SPADCALL |n| 0
                                                                  (QREFELT $
                                                                           16))
                                                        (QREFELT $ 58))
                                              . #12#)
                                        (LETT |part|
                                              (VECTOR (CONS 3 "prime") |z|
                                                      |exp|)
                                              . #12#)
                                        (LETT |z|
                                              (SPADCALL |z|
                                                        (PROG1
                                                            (LETT #1# |exp|
                                                                  . #12#)
                                                          (|check_subtype2|
                                                           (>= #1# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #1#))
                                                        (QREFELT $ 38))
                                              . #12#)
                                        (LETT |m|
                                              (SPADCALL |m| |z| (QREFELT $ 57))
                                              . #12#)
                                        (EXIT
                                         (LETT |result| (CONS |part| |result|)
                                               . #12#)))))))
                               (LETT #8# (CDR #8#) . #12#) (GO G190) G191
                               (EXIT NIL))
                          (COND
                           ((SPADCALL |m| (|spadConstant| $ 55) (QREFELT $ 59))
                            (LETT |unity| (SPADCALL |unity| |m| (QREFELT $ 39))
                                  . #12#)))
                          (EXIT
                           (SPADCALL |unity| |result| (QREFELT $ 46))))))))))))) 

(SDEFUN |GAUSSFAC;sumSquares;IL;8| ((|p| |Integer|) ($ |List| (|Integer|)))
        (COND ((EQL |p| 2) (LIST 1 1))
              ((SPADCALL (REM |p| 4) 1 (QREFELT $ 56))
               (|error| "no solutions"))
              ('T (|GAUSSFAC;sumsq1| |p| $)))) 

(SDEFUN |GAUSSFAC;prime?;CB;9| ((|a| |Complex| (|Integer|)) ($ |Boolean|))
        (SPROG
         ((|p| (|Integer|)) (|im| (|Integer|)) (|re| (|Integer|))
          (|n| (|Integer|)))
         (SEQ
          (LETT |n| (SPADCALL |a| (QREFELT $ 62))
                . #1=(|GAUSSFAC;prime?;CB;9|))
          (EXIT
           (COND ((OR (EQL |n| 0) (EQL |n| 1)) NIL)
                 ((SPADCALL |n| (QREFELT $ 64)) 'T)
                 (#2='T
                  (SEQ (LETT |re| (SPADCALL |a| (QREFELT $ 51)) . #1#)
                       (LETT |im| (SPADCALL |a| (QREFELT $ 52)) . #1#)
                       (COND
                        ((SPADCALL |re| 0 (QREFELT $ 56))
                         (COND ((SPADCALL |im| 0 (QREFELT $ 56)) (EXIT NIL)))))
                       (LETT |p| (ABS (+ |re| |im|)) . #1#)
                       (EXIT
                        (COND ((SPADCALL (REM |p| 4) 3 (QREFELT $ 56)) NIL)
                              (#2# (SPADCALL |p| (QREFELT $ 64)))))))))))) 

(DECLAIM (NOTINLINE |GaussianFactorizationPackage;|)) 

(DEFUN |GaussianFactorizationPackage| ()
  (SPROG NIL
         (PROG (#1=#:G833)
           (RETURN
            (COND
             ((LETT #1#
                    (HGET |$ConstructorCache| '|GaussianFactorizationPackage|)
                    . #2=(|GaussianFactorizationPackage|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache|
                             '|GaussianFactorizationPackage|
                             (LIST
                              (CONS NIL
                                    (CONS 1
                                          (|GaussianFactorizationPackage;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache|
                        '|GaussianFactorizationPackage|)))))))))) 

(DEFUN |GaussianFactorizationPackage;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|GaussianFactorizationPackage|)
                . #1=(|GaussianFactorizationPackage|))
          (LETT $ (GETREFV 66) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|GaussianFactorizationPackage| NIL
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 13
                    (|ModularRing| (|Integer|) (|Integer|)
                                   (CONS (|function| |GAUSSFAC;reduction|) $)
                                   (CONS (|function| |GAUSSFAC;merge|) $)
                                   (CONS (|function| |GAUSSFAC;exactquo|) $)))
          (QSETREFV $ 17 (SPADCALL 1 1 (QREFELT $ 16)))
          $))) 

(MAKEPROP '|GaussianFactorizationPackage| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|Integer|) (0 . |positiveRemainder|)
              (|Union| $ '"failed") (6 . |exquo|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 10 '"failed")
              (12 . |extendedEuclidean|) '|FMod| (19 . |One|) (|Complex| 6)
              (23 . |complex|) '|fact2| (29 . |reduce|) (|Boolean|) (35 . =)
              (|NonNegativeInteger|) (41 . ^) (47 . ~=) (|PositiveInteger|)
              (53 . ^) (59 . |coerce|) (64 . ^) (70 . >) (|Factored| 6)
              (|IntegerFactorizationPackage| 6) (76 . |factor|) (81 . |unit|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flg| 33) (|:| |fctr| 6) (|:| |xpnt| 6))
              (|List| 34) (86 . |factorList|) (91 . *) (97 . ^) (103 . *)
              (|List| 6) (109 . |elt|) (115 . |conjugate|)
              (|Record| (|:| |flg| 33) (|:| |fctr| 15) (|:| |xpnt| 6))
              (|List| 43) (|Factored| 15) (120 . |makeFR|) (126 . |Zero|)
              (130 . |Zero|) (134 . =) (140 . |primeFactor|) (146 . |real|)
              (151 . |imag|) (156 . |unit|) (161 . |factorList|) (166 . |One|)
              (170 . ~=) (176 . |quo|) (182 . |gcd|) (188 . ~=)
              |GAUSSFAC;factor;CF;7| |GAUSSFAC;sumSquares;IL;8| (194 . |norm|)
              (|IntegerPrimesPackage| 6) (199 . |prime?|)
              |GAUSSFAC;prime?;CB;9|)
           '#(|sumSquares| 204 |prime?| 209 |factor| 214) 'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 65
                                                 '(2 6 0 0 0 7 2 6 8 0 0 9 3 6
                                                   11 0 0 0 12 0 13 0 14 2 15 0
                                                   6 6 16 2 13 0 6 6 18 2 13 19
                                                   0 0 20 2 13 0 0 21 22 2 13
                                                   19 0 0 23 2 13 0 0 24 25 1
                                                   13 6 0 26 2 6 0 0 24 27 2 6
                                                   19 0 0 28 1 30 29 6 31 1 29
                                                   6 0 32 1 29 35 0 36 2 6 0 24
                                                   0 37 2 15 0 0 21 38 2 15 0 0
                                                   0 39 2 40 6 0 6 41 1 15 0 0
                                                   42 2 45 0 15 44 46 0 13 0 47
                                                   0 15 0 48 2 15 19 0 0 49 2
                                                   45 0 15 6 50 1 15 6 0 51 1
                                                   15 6 0 52 1 45 15 0 53 1 45
                                                   44 0 54 0 15 0 55 2 6 19 0 0
                                                   56 2 15 0 0 0 57 2 15 0 0 0
                                                   58 2 15 19 0 0 59 1 15 6 0
                                                   62 1 63 19 6 64 1 0 40 6 61
                                                   1 0 19 15 65 1 0 45 15
                                                   60)))))
           '|lookupComplete|)) 

(MAKEPROP '|GaussianFactorizationPackage| 'NILADIC T) 
