
(SDEFUN |GUESS;guessExpRat;LL;1| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| NIL (QREFELT $ 15))) 

(SDEFUN |GUESS;guessExpRat;LLL;2|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPADCALL |list| |options| (QREFELT $ 15))) 

(SDEFUN |GUESS;guessBinRat;LL;3| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| NIL (QREFELT $ 18))) 

(SDEFUN |GUESS;guessBinRat;LLL;4|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPADCALL |list| |options| (QREFELT $ 18))) 

(SDEFUN |GUESS;guessExpRat;SM;5|
        ((|q| |Symbol|)
         ($ |Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
        (SPADCALL |q| (QREFELT $ 23))) 

(SDEFUN |GUESS;guessBinRat;SM;6|
        ((|q| |Symbol|)
         ($ |Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
        (SPADCALL |q| (QREFELT $ 25))) 

(SDEFUN |GUESS;getVariables| ((|lF| |List| F) ($ |List| EXPRR))
        (SPROG
         ((|lvar| (|List| (|Symbol|))) (|ll| (|List| (|List| (|Symbol|)))))
         (SEQ (LETT |lvar| NIL)
              (COND
               ((|HasSignature| (QREFELT $ 7)
                                (LIST '|variables|
                                      (LIST (LIST '|List| '(|Symbol|))
                                            (|devaluate| (QREFELT $ 7)))))
                (SEQ
                 (COND
                  ((|domainEqual| (QREFELT $ 6) (QREFELT $ 7))
                   (LETT |ll| (SPADCALL (ELT $ 28) |lF| (QREFELT $ 33))))
                  ((|domainEqual| (QREFELT $ 6) (|Fraction| (QREFELT $ 7)))
                   (LETT |ll|
                         (SPADCALL (CONS #'|GUESS;getVariables!0| $) |lF|
                                   (QREFELT $ 40))))
                  (#1='T
                   (|error|
                    (SPADCALL "Guess: type parameter F should be either"
                              " equal to S or equal to Fraction S"
                              (QREFELT $ 42)))))
                 (EXIT
                  (LETT |lvar| (SPADCALL (ELT $ 37) |ll| (QREFELT $ 44))))))
               (#1# (LETT |lvar| NIL)))
              (EXIT (SPADCALL (ELT $ 45) |lvar| (QREFELT $ 48)))))) 

(SDEFUN |GUESS;getVariables!0| ((|g| NIL) ($ NIL))
        (SPADCALL (SPADCALL (SPADCALL |g| (QREFELT $ 35)) (QREFELT $ 28))
                  (SPADCALL (SPADCALL |g| (QREFELT $ 36)) (QREFELT $ 28))
                  (QREFELT $ 37))) 

(SDEFUN |GUESS;SUPS2SUPF|
        ((|p| |SparseUnivariatePolynomial| S)
         ($ |SparseUnivariatePolynomial| F))
        (COND ((|domainEqual| (QREFELT $ 6) (QREFELT $ 7)) |p|)
              ((|domainEqual| (QREFELT $ 6) (|Fraction| (QREFELT $ 7)))
               (SPADCALL (ELT $ 49) |p| (QREFELT $ 54)))
              ('T
               (|error|
                (SPADCALL "Guess: type parameter F should be either"
                          " equal to S or equal to Fraction S"
                          (QREFELT $ 42)))))) 

(SDEFUN |GUESS;FilteredPartitionStream|
        ((|options| |List| (|GuessOption|)) ($ |Stream| (|List| (|Integer|))))
        (SPROG
         ((|s| (|Stream| (|List| (|Integer|))))
          (|s3| (|Stream| (|List| (|Integer|))))
          (|s2| (|Stream| (|Stream| (|List| (|Integer|)))))
          (|s1| (|Stream| (|Integer|)))
          (|maxD| (|Union| (|NonNegativeInteger|) "arbitrary"))
          (|Somo| (|Union| (|PositiveInteger|) (|Boolean|)))
          (|maxP| (|Union| (|PositiveInteger|) "arbitrary"))
          (|homo| (|Union| (|PositiveInteger|) (|Boolean|))))
         (SEQ (LETT |maxP| (SPADCALL |options| (QREFELT $ 57)))
              (LETT |homo| (SPADCALL |options| (QREFELT $ 59)))
              (COND
               ((QEQCAR |homo| 1)
                (COND
                 ((QCDR |homo|)
                  (EXIT
                   (|error|
                    (SPADCALL "Guess: internal error - homogeneous should not"
                              " be true in FilteredPartitionStream"
                              (QREFELT $ 42)))))))
               (#1='T (LETT |maxP| (CONS 0 (QCDR |homo|)))))
              (LETT |maxD| (SPADCALL |options| (QREFELT $ 61)))
              (LETT |Somo| (SPADCALL |options| (QREFELT $ 62)))
              (COND
               ((QEQCAR |Somo| 1)
                (COND
                 ((QCDR |Somo|)
                  (EXIT
                   (|error|
                    (SPADCALL "Guess: internal error - Somos should not be"
                              " true in FilteredPartitionStream"
                              (QREFELT $ 42)))))))
               ((QEQCAR |maxD| 0)
                (LETT |maxD| (CONS 0 (MIN (QCDR |maxD|) (QCDR |Somo|)))))
               (#1# (LETT |maxD| (CONS 0 (QCDR |Somo|)))))
              (COND
               ((QEQCAR |maxD| 0)
                (COND
                 ((QEQCAR |maxP| 0)
                  (LETT |s|
                        (SPADCALL (+ (QCDR |maxD|) 1) (QCDR |maxP|)
                                  (QREFELT $ 68))))
                 (#1#
                  (SEQ (LETT |s1| (SPADCALL (ELT $ 69) 1 (QREFELT $ 72)))
                       (LETT |s2|
                             (COND
                              ((QEQCAR |maxD| 0)
                               (SPADCALL
                                (CONS #'|GUESS;FilteredPartitionStream!0|
                                      (VECTOR $ |maxD|))
                                |s1| (QREFELT $ 81)))
                              ((QEQCAR |maxP| 0)
                               (SPADCALL
                                (CONS #'|GUESS;FilteredPartitionStream!1|
                                      (VECTOR $ |maxP|))
                                |s1| (QREFELT $ 81)))
                              (#1# (SPADCALL (ELT $ 82) |s1| (QREFELT $ 81)))))
                       (LETT |s3| (SPADCALL |s2| (QREFELT $ 84)))
                       (EXIT (LETT |s| (SPADCALL NIL |s3| (QREFELT $ 86))))))))
               (#1#
                (SEQ (LETT |s1| (SPADCALL (ELT $ 69) 1 (QREFELT $ 72)))
                     (LETT |s2|
                           (COND
                            ((QEQCAR |maxD| 0)
                             (SPADCALL
                              (CONS #'|GUESS;FilteredPartitionStream!2|
                                    (VECTOR $ |maxD|))
                              |s1| (QREFELT $ 81)))
                            ((QEQCAR |maxP| 0)
                             (SPADCALL
                              (CONS #'|GUESS;FilteredPartitionStream!3|
                                    (VECTOR $ |maxP|))
                              |s1| (QREFELT $ 81)))
                            (#1# (SPADCALL (ELT $ 82) |s1| (QREFELT $ 81)))))
                     (LETT |s3| (SPADCALL |s2| (QREFELT $ 84)))
                     (EXIT (LETT |s| (SPADCALL NIL |s3| (QREFELT $ 86)))))))
              (LETT |s| (SPADCALL |s| (QREFELT $ 87)))
              (COND
               ((QEQCAR |homo| 0)
                (LETT |s|
                      (SPADCALL
                       (CONS #'|GUESS;FilteredPartitionStream!4|
                             (VECTOR |maxP| $))
                       |s| (QREFELT $ 92)))))
              (COND
               ((QEQCAR |Somo| 0)
                (LETT |s|
                      (SPADCALL
                       (CONS #'|GUESS;FilteredPartitionStream!5|
                             (VECTOR |Somo| $))
                       |s| (QREFELT $ 92)))))
              (EXIT |s|)))) 

(SDEFUN |GUESS;FilteredPartitionStream!5| ((|z1| NIL) ($$ NIL))
        (PROG ($ |Somo|)
          (LETT $ (QREFELT $$ 1))
          (LETT |Somo| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL (ELT $ 94) |z1| (|spadConstant| $ 95) (QREFELT $ 97))
             (SPADCALL (QCDR |Somo|) (SPADCALL |z1| (QREFELT $ 88))
                       (QREFELT $ 76))
             (QREFELT $ 98)))))) 

(SDEFUN |GUESS;FilteredPartitionStream!4| ((|z1| NIL) ($$ NIL))
        (PROG ($ |maxP|)
          (LETT $ (QREFELT $$ 1))
          (LETT |maxP| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G518 NIL))
                   (SPADCALL (SPADCALL |z1| (QREFELT $ 88))
                             (PROG2 (LETT #1# |maxP|)
                                 (QCDR #1#)
                               (|check_union2| (QEQCAR #1# 0)
                                               (|PositiveInteger|)
                                               (|Union| (|PositiveInteger|)
                                                        "arbitrary")
                                               #1#))
                             (QREFELT $ 90))))))) 

(SDEFUN |GUESS;FilteredPartitionStream!3| ((|z1| NIL) ($$ NIL))
        (PROG (|maxP| $)
          (LETT |maxP| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |z1| (QCDR |maxP|) |z1| (QREFELT $ 77)))))) 

(SDEFUN |GUESS;FilteredPartitionStream!2| ((|z1| NIL) ($$ NIL))
        (PROG (|maxD| $)
          (LETT |maxD| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL (QCDR |maxD|) (|spadConstant| $ 74) (QREFELT $ 76)) |z1|
             |z1| (QREFELT $ 77)))))) 

(SDEFUN |GUESS;FilteredPartitionStream!1| ((|z1| NIL) ($$ NIL))
        (PROG (|maxP| $)
          (LETT |maxP| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |z1| (QCDR |maxP|) |z1| (QREFELT $ 77)))))) 

(SDEFUN |GUESS;FilteredPartitionStream!0| ((|z1| NIL) ($$ NIL))
        (PROG (|maxD| $)
          (LETT |maxD| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL (QCDR |maxD|) (|spadConstant| $ 74) (QREFELT $ 76)) |z1|
             |z1| (QREFELT $ 77)))))) 

(SDEFUN |GUESS;termAsEXPRR|
        ((|f| EXPRR) (|xx| |Symbol|) (|partition| |List| (|Integer|))
         (DX |Mapping| EXPRR EXPRR (|Symbol|) (|NonNegativeInteger|))
         (D1X |Mapping| EXPRR (|Symbol|)) ($ EXPRR))
        (SPROG
         ((|fl| (|List| EXPRR)) (#1=#:G556 NIL) (#2=#:G555 NIL) (#3=#:G564 NIL)
          (|part| NIL) (#4=#:G563 NIL) (|ll| (|List| (|List| (|Integer|)))))
         (SEQ
          (COND ((NULL |partition|) (SPADCALL |xx| D1X))
                ('T
                 (SEQ (LETT |ll| (SPADCALL |partition| (QREFELT $ 101)))
                      (LETT |fl|
                            (PROGN
                             (LETT #4# NIL)
                             (SEQ (LETT |part| NIL) (LETT #3# |ll|) G190
                                  (COND
                                   ((OR (ATOM #3#)
                                        (PROGN (LETT |part| (CAR #3#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #4#
                                          (CONS
                                           (SPADCALL
                                            (SPADCALL |f| |xx|
                                                      (PROG1
                                                          (LETT #2#
                                                                (-
                                                                 (|SPADfirst|
                                                                  |part|)
                                                                 1))
                                                        (|check_subtype2|
                                                         (>= #2# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #2#))
                                                      DX)
                                            (PROG1
                                                (LETT #1#
                                                      (SPADCALL |part|
                                                                (QREFELT $
                                                                         102)))
                                              (|check_subtype2| (>= #1# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #1#))
                                            (QREFELT $ 103))
                                           #4#))))
                                  (LETT #3# (CDR #3#)) (GO G190) G191
                                  (EXIT (NREVERSE #4#)))))
                      (EXIT (SPADCALL (ELT $ 104) |fl| (QREFELT $ 106))))))))) 

(SDEFUN |GUESS;termAsU32VectorDiff|
        ((|f| |U32Vector|) (|partition| |List| (|Integer|)) (|prime| |Integer|)
         (|degreeLoss| |NonNegativeInteger|) ($ |U32Vector|))
        (SPROG
         ((|fl| (|List| (|U32Vector|))) (#1=#:G568 NIL) (#2=#:G567 NIL)
          (#3=#:G577 NIL) (|part| NIL) (#4=#:G576 NIL)
          (|ll| (|List| (|List| (|Integer|)))) (|d| (|NonNegativeInteger|))
          (#5=#:G566 NIL) (#6=#:G575 NIL) (|i| NIL) (#7=#:G574 NIL))
         (SEQ
          (COND
           ((NULL |partition|)
            (SPADCALL
             (CONS 1
                   (PROGN
                    (LETT #7# NIL)
                    (SEQ (LETT |i| (+ |degreeLoss| 2))
                         (LETT #6# (QV_LEN_U32 |f|)) G190
                         (COND ((> |i| #6#) (GO G191)))
                         (SEQ (EXIT (LETT #7# (CONS 0 #7#))))
                         (LETT |i| (+ |i| 1)) (GO G190) G191
                         (EXIT (NREVERSE #7#)))))
             (QREFELT $ 108)))
           ('T
            (SEQ
             (LETT |d|
                   (PROG1 (LETT #5# (- (- (QV_LEN_U32 |f|) |degreeLoss|) 1))
                     (|check_subtype2| (>= #5# 0) '(|NonNegativeInteger|)
                                       '(|Integer|) #5#)))
             (LETT |ll| (SPADCALL |partition| (QREFELT $ 101)))
             (LETT |fl|
                   (PROGN
                    (LETT #4# NIL)
                    (SEQ (LETT |part| NIL) (LETT #3# |ll|) G190
                         (COND
                          ((OR (ATOM #3#) (PROGN (LETT |part| (CAR #3#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #4#
                                 (CONS
                                  (SPADCALL
                                   (SPADCALL |f|
                                             (PROG1
                                                 (LETT #2#
                                                       (- (|SPADfirst| |part|)
                                                          1))
                                               (|check_subtype2| (>= #2# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #2#))
                                             |prime| (QREFELT $ 110))
                                   (PROG1
                                       (LETT #1#
                                             (SPADCALL |part| (QREFELT $ 102)))
                                     (|check_subtype2| (> #1# 0)
                                                       '(|PositiveInteger|)
                                                       '(|Integer|) #1#))
                                   |d| |prime| (QREFELT $ 111))
                                  #4#))))
                         (LETT #3# (CDR #3#)) (GO G190) G191
                         (EXIT (NREVERSE #4#)))))
             (EXIT
              (SPADCALL
               (CONS #'|GUESS;termAsU32VectorDiff!0| (VECTOR $ |prime| |d|))
               |fl| (QREFELT $ 115))))))))) 

(SDEFUN |GUESS;termAsU32VectorDiff!0| ((|f1| NIL) (|f2| NIL) ($$ NIL))
        (PROG (|d| |prime| $)
          (LETT |d| (QREFELT $$ 2))
          (LETT |prime| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |f1| |f2| |d| |prime| (QREFELT $ 112)))))) 

(SDEFUN |GUESS;termAsU32VectorShift|
        ((|f| |U32Vector|) (|partition| |List| (|Integer|)) (|prime| |Integer|)
         (|degreeLoss| |NonNegativeInteger|) ($ |U32Vector|))
        (SPROG
         ((#1=#:G595 NIL) (|e| NIL) (#2=#:G594 NIL) (|i| NIL)
          (|r| (|U32Vector|)) (|fl| (|List| (|U32Vector|))) (#3=#:G580 NIL)
          (#4=#:G593 NIL) (|j| NIL) (#5=#:G592 NIL) (#6=#:G591 NIL)
          (|part| NIL) (#7=#:G590 NIL) (|ll| (|List| (|List| (|Integer|))))
          (|d| (|NonNegativeInteger|)) (#8=#:G579 NIL) (#9=#:G589 NIL)
          (#10=#:G588 NIL))
         (SEQ
          (COND
           ((NULL |partition|)
            (SPADCALL
             (PROGN
              (LETT #10# NIL)
              (SEQ (LETT |i| (+ |degreeLoss| 1)) (LETT #9# (QV_LEN_U32 |f|))
                   G190 (COND ((> |i| #9#) (GO G191)))
                   (SEQ (EXIT (LETT #10# (CONS 1 #10#)))) (LETT |i| (+ |i| 1))
                   (GO G190) G191 (EXIT (NREVERSE #10#))))
             (QREFELT $ 108)))
           ('T
            (SEQ
             (LETT |d|
                   (PROG1 (LETT #8# (- (- (QV_LEN_U32 |f|) |degreeLoss|) 1))
                     (|check_subtype2| (>= #8# 0) '(|NonNegativeInteger|)
                                       '(|Integer|) #8#)))
             (LETT |ll| (SPADCALL |partition| (QREFELT $ 101)))
             (LETT |fl|
                   (PROGN
                    (LETT #7# NIL)
                    (SEQ (LETT |part| NIL) (LETT #6# |ll|) G190
                         (COND
                          ((OR (ATOM #6#) (PROGN (LETT |part| (CAR #6#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #7#
                                 (CONS
                                  (SPADCALL
                                   (PROGN
                                    (LETT #5# NIL)
                                    (SEQ (LETT |j| (- (|SPADfirst| |part|) 1))
                                         (LETT #4#
                                               (+ (- (|SPADfirst| |part|) 1)
                                                  |d|))
                                         G190 (COND ((> |j| #4#) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #5#
                                                 (CONS
                                                  (REM
                                                   (EXPT (ELT_U32 |f| |j|)
                                                         (PROG1
                                                             (LETT #3#
                                                                   (SPADCALL
                                                                    |part|
                                                                    (QREFELT $
                                                                             102)))
                                                           (|check_subtype2|
                                                            (> #3# 0)
                                                            '(|PositiveInteger|)
                                                            '(|Integer|) #3#)))
                                                   |prime|)
                                                  #5#))))
                                         (LETT |j| (+ |j| 1)) (GO G190) G191
                                         (EXIT (NREVERSE #5#))))
                                   (QREFELT $ 108))
                                  #7#))))
                         (LETT #6# (CDR #6#)) (GO G190) G191
                         (EXIT (NREVERSE #7#)))))
             (LETT |r| (GETREFV_U32 (+ |d| 1) 0))
             (SPADCALL |r| (|SPADfirst| |fl|) (+ |d| 1) (QREFELT $ 117))
             (SEQ (LETT |i| 0) (LETT #2# |d|) G190
                  (COND ((|greater_SI| |i| #2#) (GO G191)))
                  (SEQ
                   (EXIT
                    (SEQ (LETT |e| NIL) (LETT #1# (CDR |fl|)) G190
                         (COND
                          ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (SETELT_U32 |r| |i|
                                       (QSMULMOD32 (ELT_U32 |r| |i|)
                                                   (ELT_U32 |e| |i|)
                                                   |prime|))))
                         (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))))
                  (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
             (EXIT |r|))))))) 

(SDEFUN |GUESS;termAsUFPSF|
        ((|f| |UnivariateFormalPowerSeries| F) (|partition| |List| (|Integer|))
         (DS |Mapping| (|UnivariateFormalPowerSeries| F)
          (|UnivariateFormalPowerSeries| F) (|NonNegativeInteger|))
         (D1 |UnivariateFormalPowerSeries| F)
         ($ |UnivariateFormalPowerSeries| F))
        (SPROG
         ((|fl| (|List| (|UnivariateFormalPowerSeries| F))) (#1=#:G604 NIL)
          (#2=#:G603 NIL) (#3=#:G612 NIL) (|part| NIL) (#4=#:G611 NIL)
          (|ll| (|List| (|List| (|Integer|)))))
         (SEQ
          (COND ((NULL |partition|) D1)
                ('T
                 (SEQ (LETT |ll| (SPADCALL |partition| (QREFELT $ 101)))
                      (LETT |fl|
                            (PROGN
                             (LETT #4# NIL)
                             (SEQ (LETT |part| NIL) (LETT #3# |ll|) G190
                                  (COND
                                   ((OR (ATOM #3#)
                                        (PROGN (LETT |part| (CAR #3#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #4#
                                          (CONS
                                           (SPADCALL
                                            (SPADCALL |f|
                                                      (PROG1
                                                          (LETT #2#
                                                                (-
                                                                 (|SPADfirst|
                                                                  |part|)
                                                                 1))
                                                        (|check_subtype2|
                                                         (>= #2# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #2#))
                                                      DS)
                                            (PROG1
                                                (LETT #1#
                                                      (SPADCALL |part|
                                                                (QREFELT $
                                                                         102)))
                                              (|check_subtype2| (>= #1# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #1#))
                                            (QREFELT $ 119))
                                           #4#))))
                                  (LETT #3# (CDR #3#)) (GO G190) G191
                                  (EXIT (NREVERSE #4#)))))
                      (EXIT (SPADCALL (ELT $ 120) |fl| (QREFELT $ 123))))))))) 

(SDEFUN |GUESS;termAsUFPSF2|
        ((|f| |UnivariateFormalPowerSeries| F) (|partition| |List| (|Integer|))
         (DS |Mapping| (|UnivariateFormalPowerSeries| F)
          (|UnivariateFormalPowerSeries| F) (|NonNegativeInteger|))
         (D1 |UnivariateFormalPowerSeries| F)
         ($ |UnivariateFormalPowerSeries| F))
        (SPROG
         ((|fl| (|List| (|UnivariateFormalPowerSeries| F))) (#1=#:G616 NIL)
          (#2=#:G624 NIL) (|part| NIL) (#3=#:G623 NIL)
          (|ll| (|List| (|List| (|Integer|)))))
         (SEQ
          (COND ((NULL |partition|) D1)
                ('T
                 (SEQ (LETT |ll| (SPADCALL |partition| (QREFELT $ 101)))
                      (LETT |fl|
                            (PROGN
                             (LETT #3# NIL)
                             (SEQ (LETT |part| NIL) (LETT #2# |ll|) G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN (LETT |part| (CAR #2#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #3#
                                          (CONS
                                           (SPADCALL
                                            (CONS #'|GUESS;termAsUFPSF2!0|
                                                  (VECTOR $ |part|))
                                            (SPADCALL |f|
                                                      (PROG1
                                                          (LETT #1#
                                                                (-
                                                                 (|SPADfirst|
                                                                  |part|)
                                                                 1))
                                                        (|check_subtype2|
                                                         (>= #1# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #1#))
                                                      DS)
                                            (QREFELT $ 126))
                                           #3#))))
                                  (LETT #2# (CDR #2#)) (GO G190) G191
                                  (EXIT (NREVERSE #3#)))))
                      (EXIT (SPADCALL (ELT $ 128) |fl| (QREFELT $ 123))))))))) 

(SDEFUN |GUESS;termAsUFPSF2!0| ((|z1| NIL) ($$ NIL))
        (PROG (|part| $)
          (LETT |part| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G614 NIL))
                   (SPADCALL |z1|
                             (PROG1
                                 (LETT #1# (SPADCALL |part| (QREFELT $ 102)))
                               (|check_subtype2| (>= #1# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #1#))
                             (QREFELT $ 124))))))) 

(SDEFUN |GUESS;termAsUFPSSUPF2|
        ((|f| |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
         (|partition| |List| (|Integer|))
         (DSF |Mapping|
          (|UnivariateFormalPowerSeries|
           (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
          (|UnivariateFormalPowerSeries|
           (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
          (|NonNegativeInteger|))
         (D1F |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
         ($ |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
        (SPROG
         ((|fl|
           (|List|
            (|UnivariateFormalPowerSeries|
             (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
          (#1=#:G627 NIL) (#2=#:G635 NIL) (|part| NIL) (#3=#:G634 NIL)
          (|ll| (|List| (|List| (|Integer|)))))
         (SEQ
          (COND ((NULL |partition|) D1F)
                ('T
                 (SEQ (LETT |ll| (SPADCALL |partition| (QREFELT $ 101)))
                      (LETT |fl|
                            (PROGN
                             (LETT #3# NIL)
                             (SEQ (LETT |part| NIL) (LETT #2# |ll|) G190
                                  (COND
                                   ((OR (ATOM #2#)
                                        (PROGN (LETT |part| (CAR #2#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #3#
                                          (CONS
                                           (SPADCALL
                                            (CONS #'|GUESS;termAsUFPSSUPF2!0|
                                                  (VECTOR $ |part|))
                                            (SPADCALL |f|
                                                      (PROG1
                                                          (LETT #1#
                                                                (-
                                                                 (|SPADfirst|
                                                                  |part|)
                                                                 1))
                                                        (|check_subtype2|
                                                         (>= #1# 0)
                                                         '(|NonNegativeInteger|)
                                                         '(|Integer|) #1#))
                                                      DSF)
                                            (QREFELT $ 133))
                                           #3#))))
                                  (LETT #2# (CDR #2#)) (GO G190) G191
                                  (EXIT (NREVERSE #3#)))))
                      (EXIT (SPADCALL (ELT $ 135) |fl| (QREFELT $ 138))))))))) 

(SDEFUN |GUESS;termAsUFPSSUPF2!0| ((|z1| NIL) ($$ NIL))
        (PROG (|part| $)
          (LETT |part| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G625 NIL))
                   (SPADCALL |z1|
                             (PROG1
                                 (LETT #1# (SPADCALL |part| (QREFELT $ 102)))
                               (|check_subtype2| (>= #1# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #1#))
                             (QREFELT $ 130))))))) 

(SDEFUN |GUESS;ADEguessStream|
        ((|f| |UnivariateFormalPowerSeries| F)
         (|partitions| |Stream| (|List| (|Integer|)))
         (DS |Mapping| (|UnivariateFormalPowerSeries| F)
          (|UnivariateFormalPowerSeries| F) (|NonNegativeInteger|))
         (D1 |UnivariateFormalPowerSeries| F)
         ($ |Stream| (|UnivariateFormalPowerSeries| F)))
        (SPROG NIL
               (SPADCALL (CONS #'|GUESS;ADEguessStream!0| (VECTOR $ D1 DS |f|))
                         |partitions| (QREFELT $ 142)))) 

(SDEFUN |GUESS;ADEguessStream!0| ((|z1| NIL) ($$ NIL))
        (PROG (|f| DS D1 $)
          (LETT |f| (QREFELT $$ 3))
          (LETT DS (QREFELT $$ 2))
          (LETT D1 (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;termAsUFPSF| |f| |z1| DS D1 $))))) 

(SDEFUN |GUESS;ADEguessStream2|
        ((|f| |UnivariateFormalPowerSeries| F)
         (|partitions| |Stream| (|List| (|Integer|)))
         (DS |Mapping| (|UnivariateFormalPowerSeries| F)
          (|UnivariateFormalPowerSeries| F) (|NonNegativeInteger|))
         (D1 |UnivariateFormalPowerSeries| F)
         ($ |Stream| (|UnivariateFormalPowerSeries| F)))
        (SPROG NIL
               (SPADCALL
                (CONS #'|GUESS;ADEguessStream2!0| (VECTOR $ D1 DS |f|))
                |partitions| (QREFELT $ 142)))) 

(SDEFUN |GUESS;ADEguessStream2!0| ((|z1| NIL) ($$ NIL))
        (PROG (|f| DS D1 $)
          (LETT |f| (QREFELT $$ 3))
          (LETT DS (QREFELT $$ 2))
          (LETT D1 (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;termAsUFPSF2| |f| |z1| DS D1 $))))) 

(SDEFUN |GUESS;guessModGenCached|
        ((|cache| |PrimitiveArray| (|U32Vector|)) (|np| |NonNegativeInteger|)
         (|sigma| |Integer|) (|addOne| |Boolean|) (|maxD| |NonNegativeInteger|)
         (|prodl| |List| (|List| (|Integer|))) (|terml| |List| (|Integer|))
         (|prime| |Integer|) ($ |Vector| (|U32Vector|)))
        (SPROG
         ((#1=#:G657 NIL) (|i| NIL) (#2=#:G658 NIL) (|r| NIL)
          (|res| (|Vector| (|U32Vector|))) (#3=#:G655 NIL) (#4=#:G656 NIL)
          (|res1| (|U32Vector|)) (#5=#:G646 NIL) (|nt| (|NonNegativeInteger|))
          (#6=#:G653 NIL) (#7=#:G654 NIL) (|pp| NIL))
         (SEQ
          (SEQ (LETT |pp| NIL) (LETT #7# |prodl|) (LETT |i| (+ |maxD| 1))
               (LETT #6# (+ |maxD| |np|)) G190
               (COND
                ((OR (> |i| #6#) (ATOM #7#) (PROGN (LETT |pp| (CAR #7#)) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (QSETAREF1 |cache| |i|
                            (SPADCALL (QAREF1 |cache| (|SPADfirst| |pp|))
                                      (QAREF1 |cache|
                                              (SPADCALL |pp| (QREFELT $ 102)))
                                      (- |sigma| 1) |prime| (QREFELT $ 112)))))
               (LETT |i| (PROG1 (+ |i| 1) (LETT #7# (CDR #7#)))) (GO G190) G191
               (EXIT NIL))
          (LETT |nt| (LENGTH |terml|))
          (COND
           (|addOne|
            (SEQ (LETT |res| (MAKEARR1 (+ |nt| 1) (GETREFV_U32 0 0)))
                 (LETT |res1|
                       (GETREFV_U32
                        (PROG1 (LETT #5# |sigma|)
                          (|check_subtype2| (>= #5# 0) '(|NonNegativeInteger|)
                                            '(|Integer|) #5#))
                        0))
                 (SETELT_U32 |res1| 0 1)
                 (SPADCALL |res| 1 |res1| (QREFELT $ 146))
                 (EXIT
                  (SEQ (LETT |r| NIL) (LETT #4# |terml|) (LETT |i| 2)
                       (LETT #3# (+ |nt| 1)) G190
                       (COND
                        ((OR (|greater_SI| |i| #3#) (ATOM #4#)
                             (PROGN (LETT |r| (CAR #4#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |res| |i| (QAREF1 |cache| |r|)
                                   (QREFELT $ 146))))
                       (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #4# (CDR #4#))))
                       (GO G190) G191 (EXIT NIL)))))
           ('T
            (SEQ (LETT |res| (MAKEARR1 |nt| (GETREFV_U32 0 0)))
                 (EXIT
                  (SEQ (LETT |r| NIL) (LETT #2# |terml|) (LETT |i| 1)
                       (LETT #1# |nt|) G190
                       (COND
                        ((OR (|greater_SI| |i| #1#) (ATOM #2#)
                             (PROGN (LETT |r| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (SPADCALL |res| |i| (QAREF1 |cache| |r|)
                                   (QREFELT $ 146))))
                       (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#))))
                       (GO G190) G191 (EXIT NIL))))))
          (EXIT |res|)))) 

(SDEFUN |GUESS;DEPguessModGenCached|
        ((|fl| |List| (|U32Vector|)) (|addOne| |Boolean|)
         (|maxD| |NonNegativeInteger|) (|prodl| |List| (|List| (|Integer|)))
         (|terml| |List| (|Integer|)) (|prime| |Integer|)
         ($ |Vector| (|U32Vector|)))
        (SPROG
         ((#1=#:G663 NIL) (|i| NIL) (#2=#:G664 NIL) (|f| (|U32Vector|))
          (|cache| (|PrimitiveArray| (|U32Vector|)))
          (|np| (|NonNegativeInteger|)) (|sigma| (|NonNegativeInteger|)))
         (SEQ
          (COND
           ((< (LENGTH |fl|) (+ |maxD| 1))
            (|error| "DEPguessModGenCached: #fl < maxD + 1"))
           ('T
            (SEQ (LETT |f| (|SPADfirst| |fl|)) (LETT |sigma| (QV_LEN_U32 |f|))
                 (LETT |np| (LENGTH |prodl|))
                 (LETT |cache|
                       (MAKEARR1 (+ (+ |maxD| 1) |np|) (GETREFV_U32 0 0)))
                 (SEQ (LETT |f| NIL) (LETT #2# |fl|) (LETT |i| 0)
                      (LETT #1# |maxD|) G190
                      (COND
                       ((OR (|greater_SI| |i| #1#) (ATOM #2#)
                            (PROGN (LETT |f| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (QSETAREF1 |cache| |i| |f|)))
                      (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#))))
                      (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (|GUESS;guessModGenCached| |cache| |np| |sigma| |addOne|
                   |maxD| |prodl| |terml| |prime| $)))))))) 

(SDEFUN |GUESS;ADEguessModGenCached|
        ((|fl| |List| (|U32Vector|)) (|addOne| |Boolean|)
         (|maxD| |NonNegativeInteger|) (|prodl| |List| (|List| (|Integer|)))
         (|terml| |List| (|Integer|)) (|prime| |Integer|)
         ($ |Vector| (|U32Vector|)))
        (SPROG
         ((#1=#:G669 NIL) (|i| NIL) (|cache| (|PrimitiveArray| (|U32Vector|)))
          (|np| (|NonNegativeInteger|)) (|sigma| (|Integer|))
          (|f| (|U32Vector|)))
         (SEQ
          (COND
           ((SPADCALL (LENGTH |fl|) 1 (QREFELT $ 147))
            (|error| "ADEguessModGenCached: #fl ~= 1"))
           ('T
            (SEQ (LETT |f| (|SPADfirst| |fl|))
                 (LETT |sigma| (- (QV_LEN_U32 |f|) |maxD|))
                 (LETT |np| (LENGTH |prodl|))
                 (LETT |cache|
                       (MAKEARR1 (+ (+ |maxD| 1) |np|) (GETREFV_U32 0 0)))
                 (QSETAREF1 |cache| 0 |f|)
                 (SEQ (LETT |i| 1) (LETT #1# |maxD|) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (QSETAREF1 |cache| |i|
                                   (SPADCALL (QAREF1 |cache| (- |i| 1)) |prime|
                                             (QREFELT $ 148)))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (|GUESS;guessModGenCached| |cache| |np| |sigma| |addOne|
                   |maxD| |prodl| |terml| |prime| $)))))))) 

(SDEFUN |GUESS;ADEtestGenCached|
        ((|f| |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
         (|addOne| |Boolean|) (|maxD| |NonNegativeInteger|)
         (|prodl| |List| (|List| (|Integer|))) (|terml| |List| (|Integer|))
         (DSF |Mapping|
          (|UnivariateFormalPowerSeries|
           (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
          (|UnivariateFormalPowerSeries|
           (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
          (|NonNegativeInteger|))
         (D1F |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
         ($ |Vector|
          (|UnivariateFormalPowerSeries|
           (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
        (SPROG
         ((#1=#:G683 NIL) (|i| NIL) (#2=#:G684 NIL) (|r| NIL)
          (|res|
           (|Vector|
            (|UnivariateFormalPowerSeries|
             (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
          (#3=#:G681 NIL) (#4=#:G682 NIL) (|nt| (|NonNegativeInteger|))
          (#5=#:G679 NIL) (#6=#:G680 NIL) (|pp| NIL) (#7=#:G678 NIL)
          (|cache|
           (|PrimitiveArray|
            (|UnivariateFormalPowerSeries|
             (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
          (|np| (|NonNegativeInteger|)))
         (SEQ (LETT |np| (LENGTH |prodl|))
              (LETT |cache|
                    (MAKEARR1 (+ (+ |maxD| 1) |np|) (|spadConstant| $ 149)))
              (QSETAREF1 |cache| 0 |f|)
              (SEQ (LETT |i| 1) (LETT #7# |maxD|) G190
                   (COND ((|greater_SI| |i| #7#) (GO G191)))
                   (SEQ
                    (EXIT
                     (QSETAREF1 |cache| |i|
                                (SPADCALL (QAREF1 |cache| 0) |i| DSF))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (SEQ (LETT |pp| NIL) (LETT #6# |prodl|) (LETT |i| (+ |maxD| 1))
                   (LETT #5# (+ |maxD| |np|)) G190
                   (COND
                    ((OR (> |i| #5#) (ATOM #6#)
                         (PROGN (LETT |pp| (CAR #6#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (QSETAREF1 |cache| |i|
                                (SPADCALL (QAREF1 |cache| (|SPADfirst| |pp|))
                                          (QAREF1 |cache|
                                                  (SPADCALL |pp|
                                                            (QREFELT $ 102)))
                                          (QREFELT $ 150)))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT #6# (CDR #6#)))) (GO G190)
                   G191 (EXIT NIL))
              (LETT |nt| (LENGTH |terml|))
              (COND
               (|addOne|
                (SEQ (LETT |res| (MAKEARR1 (+ |nt| 1) (|spadConstant| $ 149)))
                     (SPADCALL |res| 1 D1F (QREFELT $ 152))
                     (EXIT
                      (SEQ (LETT |r| NIL) (LETT #4# |terml|) (LETT |i| 2)
                           (LETT #3# (+ |nt| 1)) G190
                           (COND
                            ((OR (|greater_SI| |i| #3#) (ATOM #4#)
                                 (PROGN (LETT |r| (CAR #4#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (SPADCALL |res| |i| (QAREF1 |cache| |r|)
                                       (QREFELT $ 152))))
                           (LETT |i|
                                 (PROG1 (|inc_SI| |i|) (LETT #4# (CDR #4#))))
                           (GO G190) G191 (EXIT NIL)))))
               ('T
                (SEQ (LETT |res| (MAKEARR1 |nt| (|spadConstant| $ 149)))
                     (EXIT
                      (SEQ (LETT |r| NIL) (LETT #2# |terml|) (LETT |i| 1)
                           (LETT #1# |nt|) G190
                           (COND
                            ((OR (|greater_SI| |i| #1#) (ATOM #2#)
                                 (PROGN (LETT |r| (CAR #2#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (SPADCALL |res| |i| (QAREF1 |cache| |r|)
                                       (QREFELT $ 152))))
                           (LETT |i|
                                 (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#))))
                           (GO G190) G191 (EXIT NIL))))))
              (EXIT |res|)))) 

(SDEFUN |GUESS;multiplyExponents|
        ((|f| |U32Vector|) (|n| |NonNegativeInteger|) ($ |U32Vector|))
        (SPROG
         ((#1=#:G688 NIL) (|i| NIL) (|deg| (|Integer|)) (|f0| (|U32Vector|))
          (|nn| (|NonNegativeInteger|)))
         (SEQ (LETT |nn| (QV_LEN_U32 |f|)) (LETT |f0| (GETREFV_U32 |nn| 0))
              (LETT |deg| (- |nn| 1))
              (SEQ (LETT |i| 0) (LETT #1# |deg|) G190
                   (COND
                    ((OR (|greater_SI| |i| #1#) (NULL (<= (* |n| |i|) |deg|)))
                     (GO G191)))
                   (SEQ (EXIT (SETELT_U32 |f0| (* |n| |i|) (ELT_U32 |f| |i|))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT |f0|)))) 

(SDEFUN |GUESS;FEguessModGenCached|
        ((|fl| |List| (|U32Vector|)) (|addOne| |Boolean|)
         (|maxD| |NonNegativeInteger|) (|prodl| |List| (|List| (|Integer|)))
         (|terml| |List| (|Integer|)) (|prime| |Integer|)
         ($ |Vector| (|U32Vector|)))
        (SPROG
         ((#1=#:G693 NIL) (|i| NIL) (|cache| (|PrimitiveArray| (|U32Vector|)))
          (|np| (|NonNegativeInteger|)) (|sigma| (|NonNegativeInteger|))
          (|f| (|U32Vector|)))
         (SEQ
          (COND
           ((SPADCALL (LENGTH |fl|) 1 (QREFELT $ 147))
            (|error| "FEguessModGenCached: #fl ~= 1"))
           ('T
            (SEQ (LETT |f| (|SPADfirst| |fl|)) (LETT |sigma| (QV_LEN_U32 |f|))
                 (LETT |np| (LENGTH |prodl|))
                 (LETT |cache|
                       (MAKEARR1 (+ (+ |maxD| 1) |np|) (GETREFV_U32 0 0)))
                 (QSETAREF1 |cache| 0 |f|)
                 (SEQ (LETT |i| 1) (LETT #1# |maxD|) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (QSETAREF1 |cache| |i|
                                   (|GUESS;multiplyExponents|
                                    (QAREF1 |cache| 0) (+ |i| 1) $))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                 (EXIT
                  (|GUESS;guessModGenCached| |cache| |np| |sigma| |addOne|
                   |maxD| |prodl| |terml| |prime| $)))))))) 

(SDEFUN |GUESS;optimiseFactor|
        ((|partition| |Partition|) (|partitions| |List| (|Partition|))
         ($ |Union| (|List| (|Integer|)) "failed"))
        (SPROG
         ((#1=#:G713 NIL) (|j| (|Integer|))
          (|r| (|Union| (|Partition|) "failed")) (#2=#:G714 NIL) (|p| NIL)
          (#3=#:G715 NIL) (|i| NIL) (|n| (|NonNegativeInteger|)))
         (SEQ
          (EXIT
           (SEQ (LETT |n| (LENGTH |partitions|))
                (SEQ (LETT |i| 1) (LETT #3# |n|) (LETT |p| NIL)
                     (LETT #2# |partitions|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#)) NIL)
                           (|greater_SI| |i| #3#))
                       (GO G191)))
                     (SEQ (LETT |r| (SPADCALL |partition| |p| (QREFELT $ 154)))
                          (EXIT
                           (COND
                            ((QEQCAR |r| 0)
                             (SEQ
                              (LETT |j|
                                    (SPADCALL (QCDR |r|) |partitions|
                                              (QREFELT $ 156)))
                              (EXIT
                               (COND
                                ((> |j| 0)
                                 (PROGN
                                  (LETT #1# (CONS 0 (LIST |i| |j|)))
                                  (GO #4=#:G712))))))))))
                     (LETT #2# (PROG1 (CDR #2#) (LETT |i| (|inc_SI| |i|))))
                     (GO G190) G191 (EXIT NIL))
                (EXIT (CONS 1 "failed"))))
          #4# (EXIT #1#)))) 

(SDEFUN |GUESS;optimiseProducts1|
        ((|p| |Partition|) (|prods0| |Reference| (|List| (|List| (|Integer|))))
         (|parts0| |Reference| (|List| (|Partition|))) ($ |Void|))
        (SPROG
         ((|lp0| (|NonNegativeInteger|))
          (|r| (|Union| (|List| (|Integer|)) "failed")))
         (SEQ
          (SEQ
           (LETT |r|
                 (|GUESS;optimiseFactor| |p|
                  (SPADCALL |parts0| (QREFELT $ 158)) $))
           (EXIT
            (COND
             ((QEQCAR |r| 1)
              (SEQ
               (|GUESS;optimiseProducts1|
                (SPADCALL (CDR (SPADCALL |p| (QREFELT $ 159))) (QREFELT $ 160))
                |prods0| |parts0| $)
               (EXIT
                (LETT |r|
                      (|GUESS;optimiseFactor| |p|
                       (SPADCALL |parts0| (QREFELT $ 158)) $))))))))
          (EXIT
           (COND
            ((QEQCAR |r| 1)
             (|error| "Internal error: failed adding intermediate partition"))
            ('T
             (SEQ (LETT |lp0| (LENGTH (SPADCALL |parts0| (QREFELT $ 158))))
                  (SPADCALL |prods0|
                            (CONS
                             (LIST (- |lp0| (|SPADfirst| (QCDR |r|)))
                                   (- |lp0|
                                      (SPADCALL (QCDR |r|) (QREFELT $ 102))))
                             (SPADCALL |prods0| (QREFELT $ 162)))
                            (QREFELT $ 163))
                  (EXIT
                   (SPADCALL |parts0|
                             (CONS |p| (SPADCALL |parts0| (QREFELT $ 158)))
                             (QREFELT $ 164)))))))))) 

(SDEFUN |GUESS;optimiseProducts|
        ((|partitions| |List| (|List| (|Integer|)))
         ($ |Record| (|:| |addOne| (|Boolean|))
          (|:| |maxDiff| (|NonNegativeInteger|))
          (|:| |prods| (|List| (|List| (|Integer|))))
          (|:| |terms| (|List| (|Integer|)))))
        (SPROG
         ((#1=#:G731 NIL) (|terms0| (|List| (|Integer|))) (#2=#:G736 NIL)
          (|p| NIL) (|parts0| (|Reference| (|List| (|Partition|)))) (|i| NIL)
          (#3=#:G735 NIL)
          (|prods0| (|Reference| (|List| (|List| (|Integer|)))))
          (|maxD0| (|Integer|)) (#4=#:G734 NIL) (|addOne0| (|Boolean|)))
         (SEQ
          (EXIT
           (SEQ (LETT |addOne0| (NULL (|SPADfirst| |partitions|)))
                (COND
                 (|addOne0|
                  (SEQ (LETT |partitions| (CDR |partitions|))
                       (EXIT
                        (COND
                         ((NULL |partitions|)
                          (PROGN
                           (LETT #4# (VECTOR |addOne0| 0 NIL NIL))
                           (GO #5=#:G733))))))))
                (LETT |maxD0|
                      (SPADCALL (ELT $ 165)
                                (SPADCALL (ELT $ 166) |partitions|
                                          (QREFELT $ 169))
                                (QREFELT $ 170)))
                (LETT |prods0| (SPADCALL NIL (QREFELT $ 171)))
                (LETT |terms0| NIL)
                (LETT |parts0|
                      (SPADCALL
                       (PROGN
                        (LETT #3# NIL)
                        (SEQ (LETT |i| |maxD0|) G190
                             (COND ((< |i| 1) (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #3#
                                     (CONS
                                      (SPADCALL (LIST |i|) (QREFELT $ 160))
                                      #3#))))
                             (LETT |i| (+ |i| -1)) (GO G190) G191
                             (EXIT (NREVERSE #3#))))
                       (QREFELT $ 172)))
                (SEQ (LETT |p| NIL) (LETT #2# |partitions|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |p| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((EQL (LENGTH |p|) 1)
                         (LETT |terms0|
                               (CONS (- (|SPADfirst| |p|) 1) |terms0|)))
                        ('T
                         (SEQ
                          (|GUESS;optimiseProducts1|
                           (SPADCALL |p| (QREFELT $ 160)) |prods0| |parts0| $)
                          (EXIT
                           (LETT |terms0|
                                 (CONS
                                  (-
                                   (LENGTH (SPADCALL |parts0| (QREFELT $ 158)))
                                   1)
                                  |terms0|))))))))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (EXIT
                 (VECTOR |addOne0|
                         (PROG1 (LETT #1# (- |maxD0| 1))
                           (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #1#))
                         (NREVERSE (SPADCALL |prods0| (QREFELT $ 162)))
                         (NREVERSE |terms0|)))))
          #5# (EXIT #4#)))) 

(SDEFUN |GUESS;ADEguessModOptimisedGen|
        ((|partitions| |List| (|List| (|Integer|)))
         ($ |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|)))
        (SPROG
         ((|r|
           (|Record| (|:| |addOne| (|Boolean|))
                     (|:| |maxDiff| (|NonNegativeInteger|))
                     (|:| |prods| (|List| (|List| (|Integer|))))
                     (|:| |terms| (|List| (|Integer|))))))
         (SEQ (LETT |r| (|GUESS;optimiseProducts| |partitions| $))
              (EXIT
               (CONS #'|GUESS;ADEguessModOptimisedGen!0| (VECTOR $ |r|)))))) 

(SDEFUN |GUESS;ADEguessModOptimisedGen!0|
        ((|fl| NIL) (|prime| NIL) (|q| NIL) ($$ NIL))
        (PROG (|r| $)
          (LETT |r| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEguessModGenCached| |fl| (QVELT |r| 0) (QVELT |r| 1)
             (QVELT |r| 2) (QVELT |r| 3) |prime| $))))) 

(SDEFUN |GUESS;FEguessModOptimisedGen|
        ((|partitions| |List| (|List| (|Integer|)))
         ($ |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|)))
        (SPROG
         ((|r|
           (|Record| (|:| |addOne| (|Boolean|))
                     (|:| |maxDiff| (|NonNegativeInteger|))
                     (|:| |prods| (|List| (|List| (|Integer|))))
                     (|:| |terms| (|List| (|Integer|))))))
         (SEQ (LETT |r| (|GUESS;optimiseProducts| |partitions| $))
              (EXIT (CONS #'|GUESS;FEguessModOptimisedGen!0| (VECTOR $ |r|)))))) 

(SDEFUN |GUESS;FEguessModOptimisedGen!0|
        ((|fl| NIL) (|prime| NIL) (|q| NIL) ($$ NIL))
        (PROG (|r| $)
          (LETT |r| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;FEguessModGenCached| |fl| (QVELT |r| 0) (QVELT |r| 1)
             (QVELT |r| 2) (QVELT |r| 3) |prime| $))))) 

(SDEFUN |GUESS;DEPguessModOptimisedGen|
        ((|partitions| |List| (|List| (|Integer|)))
         ($ |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|)))
        (SPROG
         ((|r|
           (|Record| (|:| |addOne| (|Boolean|))
                     (|:| |maxDiff| (|NonNegativeInteger|))
                     (|:| |prods| (|List| (|List| (|Integer|))))
                     (|:| |terms| (|List| (|Integer|))))))
         (SEQ (LETT |r| (|GUESS;optimiseProducts| |partitions| $))
              (EXIT
               (CONS #'|GUESS;DEPguessModOptimisedGen!0| (VECTOR $ |r|)))))) 

(SDEFUN |GUESS;DEPguessModOptimisedGen!0|
        ((|fl| NIL) (|prime| NIL) (|q| NIL) ($$ NIL))
        (PROG (|r| $)
          (LETT |r| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;DEPguessModGenCached| |fl| (QVELT |r| 0) (QVELT |r| 1)
             (QVELT |r| 2) (QVELT |r| 3) |prime| $))))) 

(SDEFUN |GUESS;ADEguessModGen2|
        ((|partitions| |List| (|List| (|Integer|))) (|d| |NonNegativeInteger|)
         ($ |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|)))
        (SPROG NIL
               (SEQ
                (CONS #'|GUESS;ADEguessModGen2!0|
                      (VECTOR |d| |partitions| $))))) 

(SDEFUN |GUESS;ADEguessModGen2!0| ((|fl| NIL) (|prime| NIL) (|q| NIL) ($$ NIL))
        (PROG ($ |partitions| |d|)
          (LETT $ (QREFELT $$ 2))
          (LETT |partitions| (QREFELT $$ 1))
          (LETT |d| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G760 NIL) (|p| NIL) (#2=#:G759 NIL) (|f| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL (SPADCALL |fl| (QREFELT $ 173))
                                (|spadConstant| $ 174) (QREFELT $ 147))
                      (|error| "ADEguessModGen2, lambda: #fl ~= 1"))
                     ('T
                      (SEQ (LETT |f| (SPADCALL |fl| (QREFELT $ 175)))
                           (EXIT
                            (SPADCALL
                             (PROGN
                              (LETT #2# NIL)
                              (SEQ (LETT |p| NIL) (LETT #1# |partitions|) G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN (LETT |p| (CAR #1#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #2#
                                           (CONS
                                            (|GUESS;termAsU32VectorShift| |f|
                                             |p| |prime| |d| $)
                                            #2#))))
                                   (LETT #1# (CDR #1#)) (GO G190) G191
                                   (EXIT (NREVERSE #2#))))
                             (QREFELT $ 176)))))))))))) 

(SDEFUN |GUESS;ADEtestOptimisedGen|
        ((|partitions| |List| (|List| (|Integer|)))
         (DSF |Mapping|
          (|UnivariateFormalPowerSeries|
           (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
          (|UnivariateFormalPowerSeries|
           (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
          (|NonNegativeInteger|))
         (D1F |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
         ($ |Mapping|
          (|Vector|
           (|UnivariateFormalPowerSeries|
            (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
          (|UnivariateFormalPowerSeries|
           (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
        (SPROG
         ((|r|
           (|Record| (|:| |addOne| (|Boolean|))
                     (|:| |maxDiff| (|NonNegativeInteger|))
                     (|:| |prods| (|List| (|List| (|Integer|))))
                     (|:| |terms| (|List| (|Integer|))))))
         (SEQ (LETT |r| (|GUESS;optimiseProducts| |partitions| $))
              (EXIT
               (CONS #'|GUESS;ADEtestOptimisedGen!0| (VECTOR $ D1F DSF |r|)))))) 

(SDEFUN |GUESS;ADEtestOptimisedGen!0| ((|f| NIL) ($$ NIL))
        (PROG (|r| DSF D1F $)
          (LETT |r| (QREFELT $$ 3))
          (LETT DSF (QREFELT $$ 2))
          (LETT D1F (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEtestGenCached| |f| (QVELT |r| 0) (QVELT |r| 1)
             (QVELT |r| 2) (QVELT |r| 3) DSF D1F $))))) 

(SDEFUN |GUESS;ADEtestGen2|
        ((|partitions| |List| (|List| (|Integer|)))
         (DSF |Mapping|
          (|UnivariateFormalPowerSeries|
           (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
          (|UnivariateFormalPowerSeries|
           (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
          (|NonNegativeInteger|))
         (D1F |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
         ($ |Mapping|
          (|Vector|
           (|UnivariateFormalPowerSeries|
            (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
          (|UnivariateFormalPowerSeries|
           (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
        (SPROG NIL
               (SEQ
                (CONS #'|GUESS;ADEtestGen2!0|
                      (VECTOR $ D1F DSF |partitions|))))) 

(SDEFUN |GUESS;ADEtestGen2!0| ((|f| NIL) ($$ NIL))
        (PROG (|partitions| DSF D1F $)
          (LETT |partitions| (QREFELT $$ 3))
          (LETT DSF (QREFELT $$ 2))
          (LETT D1F (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G773 NIL) (|p| NIL) (#2=#:G772 NIL))
                   (SEQ
                    (SPADCALL
                     (PROGN
                      (LETT #2# NIL)
                      (SEQ (LETT |p| NIL) (LETT #1# |partitions|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (|GUESS;termAsUFPSSUPF2| |f| |p| DSF D1F $)
                                    #2#))))
                           (LETT #1# (CDR #1#)) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (QREFELT $ 177)))))))) 

(SDEFUN |GUESS;ADEEXPRRStream|
        ((|f| EXPRR) (|xx| |Symbol|)
         (|partitions| |Stream| (|List| (|Integer|)))
         (DX |Mapping| EXPRR EXPRR (|Symbol|) (|NonNegativeInteger|))
         (D1X |Mapping| EXPRR (|Symbol|)) ($ |Stream| EXPRR))
        (SPROG NIL
               (SPADCALL
                (CONS #'|GUESS;ADEEXPRRStream!0| (VECTOR $ D1X DX |xx| |f|))
                |partitions| (QREFELT $ 181)))) 

(SDEFUN |GUESS;ADEEXPRRStream!0| ((|z1| NIL) ($$ NIL))
        (PROG (|f| |xx| DX D1X $)
          (LETT |f| (QREFELT $$ 4))
          (LETT |xx| (QREFELT $$ 3))
          (LETT DX (QREFELT $$ 2))
          (LETT D1X (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;termAsEXPRR| |f| |xx| |z1| DX D1X $))))) 

(SDEFUN |GUESS;ADEdegreeStream|
        ((|partitions| |Stream| (|List| (|Integer|)))
         ($ |Stream| (|NonNegativeInteger|)))
        (SPADCALL 0 (CONS #'|GUESS;ADEdegreeStream!0| $) |partitions|
                  (QREFELT $ 188))) 

(SDEFUN |GUESS;ADEdegreeStream!0| ((|z1| NIL) (|z2| NIL) ($ NIL))
        (SPROG ((#1=#:G781 NIL))
               (SPADCALL
                (COND ((SPADCALL |z1| (QREFELT $ 182)) (|spadConstant| $ 95))
                      ('T
                       (PROG1
                           (LETT #1#
                                 (SPADCALL (SPADCALL |z1| (QREFELT $ 166))
                                           (|spadConstant| $ 174)
                                           (QREFELT $ 183)))
                         (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                           '(|Integer|) #1#))))
                |z2| (QREFELT $ 184)))) 

(SDEFUN |GUESS;diffDX|
        ((|expr| EXPRR) (|x| |Symbol|) (|n| |NonNegativeInteger|) ($ EXPRR))
        (SPADCALL |expr| |x| |n| (QREFELT $ 189))) 

(SDEFUN |GUESS;diffDS|
        ((|s| |UnivariateFormalPowerSeries| F) (|n| |NonNegativeInteger|)
         ($ |UnivariateFormalPowerSeries| F))
        (SPADCALL |s| |n| (QREFELT $ 190))) 

(SDEFUN |GUESS;diffDSF|
        ((|s| |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
         (|n| |NonNegativeInteger|)
         ($ |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
        (COND
         ((|HasSignature|
           (|SparseMultivariatePolynomial| (QREFELT $ 6)
                                           (|NonNegativeInteger|))
           (LIST '*
                 (LIST
                  (LIST '|SparseMultivariatePolynomial|
                        (|devaluate| (QREFELT $ 6)) '(|NonNegativeInteger|))
                  '(|NonNegativeInteger|)
                  (LIST '|SparseMultivariatePolynomial|
                        (|devaluate| (QREFELT $ 6)) '(|NonNegativeInteger|)))))
          (SPADCALL |s| |n| (QREFELT $ 191))))) 

(SDEFUN |GUESS;diffAX|
        ((|l| |NonNegativeInteger|) (|x| |Symbol|) (|f| EXPRR) ($ EXPRR))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 45)) |l| (QREFELT $ 103))
                  |f| (QREFELT $ 104))) 

(SDEFUN |GUESS;diffA|
        ((|k| |NonNegativeInteger|) (|l| |NonNegativeInteger|)
         (|f| |SparseUnivariatePolynomial| S) ($ S))
        (SPADCALL |k| |l| |f| (QREFELT $ 193))) 

(SDEFUN |GUESS;diffAF|
        ((|k| |NonNegativeInteger|) (|l| |NonNegativeInteger|)
         (|f| |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
         ($ |SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
        (SPADCALL |k| |l| |f| (QREFELT $ 195))) 

(SDEFUN |GUESS;diffC| ((|total| |NonNegativeInteger|) ($ |List| S))
        (SPADCALL |total| (QREFELT $ 196))) 

(SDEFUN |GUESS;diff1X| ((|x| |Symbol|) ($ EXPRR)) (|spadConstant| $ 197)) 

(SDEFUN |GUESS;diffHP;LR;43|
        ((|options| |List| (|GuessOption|))
         ($ |Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
          (|:| |guessStream|
               (|Mapping| (|Stream| (|UnivariateFormalPowerSeries| F))
                          (|UnivariateFormalPowerSeries| F)))
          (|:| |guessModGen|
               (|Mapping|
                (|Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
                           (|Integer|) (|Integer|))
                (|NonNegativeInteger|)))
          (|:| |testGen|
               (|Mapping|
                (|Mapping|
                 (|Vector|
                  (|UnivariateFormalPowerSeries|
                   (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                 (|UnivariateFormalPowerSeries|
                  (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                (|List| (|PositiveInteger|))))
          (|:| |exprStream| (|Mapping| (|Stream| EXPRR) EXPRR (|Symbol|)))
          (|:| |kind| (|Symbol|)) (|:| |qvar| (|Symbol|))
          (|:| A
               (|Mapping| S (|NonNegativeInteger|) (|NonNegativeInteger|)
                          (|SparseUnivariatePolynomial| S)))
          (|:| AF
               (|Mapping|
                (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))
                (|NonNegativeInteger|) (|NonNegativeInteger|)
                (|UnivariateFormalPowerSeries|
                 (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
          (|:| AX (|Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|) EXPRR))
          (|:| C (|Mapping| (|List| S) (|NonNegativeInteger|)))))
        (SPROG
         ((|degrees| (|Stream| (|NonNegativeInteger|)))
          (|partitions| (|Stream| (|List| (|Integer|)))) (|dk| (|Symbol|)))
         (SEQ
          (COND
           ((NULL (ZEROP (SPADCALL |options| (QREFELT $ 198))))
            (|error|
             (SPADCALL "Guess: no support for mixed shifts in differential"
                       " equations" (QREFELT $ 42)))))
          (LETT |dk| (SPADCALL |options| (QREFELT $ 199)))
          (EXIT
           (COND
            ((EQUAL |dk| '|displayAsGF|)
             (SEQ
              (LETT |partitions| (|GUESS;FilteredPartitionStream| |options| $))
              (LETT |degrees| (|GUESS;ADEdegreeStream| |partitions| $))
              (EXIT
               (VECTOR |degrees|
                       (CONS #'|GUESS;diffHP;LR;43!0| (VECTOR $ |partitions|))
                       (CONS #'|GUESS;diffHP;LR;43!1| (VECTOR $ |partitions|))
                       (CONS #'|GUESS;diffHP;LR;43!2| (VECTOR $ |partitions|))
                       (CONS #'|GUESS;diffHP;LR;43!3| (VECTOR $ |partitions|))
                       '|diffHP| '|dummy| (CONS (|function| |GUESS;diffA|) $)
                       (CONS (|function| |GUESS;diffAF|) $)
                       (CONS (|function| |GUESS;diffAX|) $)
                       (CONS (|function| |GUESS;diffC|) $)))))
            ('T (|error| "Guess: guessADE supports only displayAsGF"))))))) 

(SDEFUN |GUESS;diffHP;LR;43!3| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEEXPRRStream| |z1| |z2| |partitions|
             (CONS (|function| |GUESS;diffDX|) $)
             (CONS (|function| |GUESS;diff1X|) $) $))))) 

(SDEFUN |GUESS;diffHP;LR;43!2| ((|l| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G808 NIL) (|i| NIL) (#2=#:G807 NIL))
                   (SEQ
                    (|GUESS;ADEtestOptimisedGen|
                     (PROGN
                      (LETT #2# NIL)
                      (SEQ (LETT |i| NIL) (LETT #1# |l|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (SPADCALL |partitions| |i| (QREFELT $ 204))
                                    #2#))))
                           (LETT #1# (CDR #1#)) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (CONS (|function| |GUESS;diffDSF|) $)
                     (|spadConstant| $ 205) $))))))) 

(SDEFUN |GUESS;diffHP;LR;43!1| ((|o| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEguessModOptimisedGen|
             (SPADCALL
              (SPADCALL (SPADCALL |partitions| |o| (QREFELT $ 201))
                        (QREFELT $ 202))
              (QREFELT $ 203))
             $))))) 

(SDEFUN |GUESS;diffHP;LR;43!0| ((|z1| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEguessStream| |z1| |partitions|
             (CONS (|function| |GUESS;diffDS|) $) (|spadConstant| $ 200) $))))) 

(SDEFUN |GUESS;monomialAsEXPRR|
        ((|fl0| |List| EXPRR) (|partition| |List| (|Integer|)) ($ EXPRR))
        (SPROG
         ((|fl| (|List| EXPRR)) (#1=#:G844 NIL) (#2=#:G843 NIL) (#3=#:G852 NIL)
          (|part| NIL) (#4=#:G851 NIL) (|ll| (|List| (|List| (|Integer|)))))
         (SEQ
          (COND ((NULL |partition|) (|spadConstant| $ 197))
                ('T
                 (SEQ (LETT |ll| (SPADCALL |partition| (QREFELT $ 101)))
                      (LETT |fl|
                            (PROGN
                             (LETT #4# NIL)
                             (SEQ (LETT |part| NIL) (LETT #3# |ll|) G190
                                  (COND
                                   ((OR (ATOM #3#)
                                        (PROGN (LETT |part| (CAR #3#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #4#
                                          (CONS
                                           (SPADCALL
                                            (SPADCALL |fl0|
                                                      (PROG1
                                                          (LETT #2#
                                                                (|SPADfirst|
                                                                 |part|))
                                                        (|check_subtype2|
                                                         (> #2# 0)
                                                         '(|PositiveInteger|)
                                                         '(|Integer|) #2#))
                                                      (QREFELT $ 218))
                                            (PROG1
                                                (LETT #1#
                                                      (SPADCALL |part|
                                                                (QREFELT $
                                                                         102)))
                                              (|check_subtype2| (>= #1# 0)
                                                                '(|NonNegativeInteger|)
                                                                '(|Integer|)
                                                                #1#))
                                            (QREFELT $ 103))
                                           #4#))))
                                  (LETT #3# (CDR #3#)) (GO G190) G191
                                  (EXIT (NREVERSE #4#)))))
                      (EXIT (SPADCALL (ELT $ 104) |fl| (QREFELT $ 106))))))))) 

(SDEFUN |GUESS;DEPEXPRRStream|
        ((|fl| |List| EXPRR) (|partitions| |Stream| (|List| (|Integer|)))
         ($ |Stream| EXPRR))
        (SPROG NIL
               (SPADCALL (CONS #'|GUESS;DEPEXPRRStream!0| (VECTOR $ |fl|))
                         |partitions| (QREFELT $ 181)))) 

(SDEFUN |GUESS;DEPEXPRRStream!0| ((|z1| NIL) ($$ NIL))
        (PROG (|fl| $)
          (LETT |fl| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;monomialAsEXPRR| |fl| |z1| $))))) 

(SDEFUN |GUESS;get_fnames|
        ((|n| |Integer|) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPROG
         ((#1=#:G867 NIL) (|sym| NIL) (#2=#:G866 NIL)
          (|syms| (|List| (|Symbol|))) (#3=#:G865 NIL) (|i| NIL)
          (#4=#:G864 NIL) (|snums| (|List| (|String|))) (#5=#:G863 NIL)
          (|q| NIL) (#6=#:G862 NIL) (|n1| (|NonNegativeInteger|)))
         (SEQ (LETT |syms| (SPADCALL |options| (QREFELT $ 219)))
              (LETT |n1| (LENGTH |syms|))
              (COND
               ((> |n1| 0)
                (COND
                 ((SPADCALL |n1| |n| (QREFELT $ 220))
                  (EXIT
                   (|error|
                    "numbers of sequences and names are different"))))))
              (COND
               ((EQL |n1| 0)
                (SEQ
                 (LETT |snums|
                       (PROGN
                        (LETT #6# NIL)
                        (SEQ (LETT |q| 1) (LETT #5# |n|) G190
                             (COND ((|greater_SI| |q| #5#) (GO G191)))
                             (SEQ
                              (EXIT (LETT #6# (CONS (STRINGIMAGE |q|) #6#))))
                             (LETT |q| (|inc_SI| |q|)) (GO G190) G191
                             (EXIT (NREVERSE #6#)))))
                 (EXIT
                  (LETT |syms|
                        (PROGN
                         (LETT #4# NIL)
                         (SEQ (LETT |i| NIL) (LETT #3# |snums|) G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |i| (CAR #3#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #4#
                                      (CONS
                                       (SPADCALL
                                        (STRCONC "%" (STRCONC "f" |i|))
                                        (QREFELT $ 221))
                                       #4#))))
                              (LETT #3# (CDR #3#)) (GO G190) G191
                              (EXIT (NREVERSE #4#)))))))))
              (EXIT
               (PROGN
                (LETT #2# NIL)
                (SEQ (LETT |sym| NIL) (LETT #1# |syms|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |sym| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT #2# (CONS (SPADCALL |sym| (QREFELT $ 45)) #2#))))
                     (LETT #1# (CDR #1#)) (GO G190) G191
                     (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |GUESS;algDepHP;LLR;47|
        ((|lists| |List| (|List| F)) (|options| |List| (|GuessOption|))
         ($ |Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
          (|:| |guessStream|
               (|Mapping| (|Stream| (|UnivariateFormalPowerSeries| F))
                          (|UnivariateFormalPowerSeries| F)))
          (|:| |guessModGen|
               (|Mapping|
                (|Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
                           (|Integer|) (|Integer|))
                (|NonNegativeInteger|)))
          (|:| |testGen|
               (|Mapping|
                (|Mapping|
                 (|Vector|
                  (|UnivariateFormalPowerSeries|
                   (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                 (|UnivariateFormalPowerSeries|
                  (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                (|List| (|PositiveInteger|))))
          (|:| |exprStream| (|Mapping| (|Stream| EXPRR) EXPRR (|Symbol|)))
          (|:| |kind| (|Symbol|)) (|:| |qvar| (|Symbol|))
          (|:| A
               (|Mapping| S (|NonNegativeInteger|) (|NonNegativeInteger|)
                          (|SparseUnivariatePolynomial| S)))
          (|:| AF
               (|Mapping|
                (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))
                (|NonNegativeInteger|) (|NonNegativeInteger|)
                (|UnivariateFormalPowerSeries|
                 (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
          (|:| AX (|Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|) EXPRR))
          (|:| C (|Mapping| (|List| S) (|NonNegativeInteger|)))))
        (SPROG
         ((|fakeDSF|
           (|Mapping|
            (|UnivariateFormalPowerSeries|
             (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
            (|UnivariateFormalPowerSeries|
             (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
            (|NonNegativeInteger|)))
          (|fakeDS|
           (|Mapping| (|UnivariateFormalPowerSeries| F)
                      (|UnivariateFormalPowerSeries| F)
                      (|NonNegativeInteger|)))
          (|fl| (|List| EXPRR)) (|degrees| (|Stream| (|NonNegativeInteger|)))
          (|partitions| (|Stream| (|List| (|Integer|)))) (|dk| (|Symbol|)))
         (SEQ
          (COND
           ((NULL (ZEROP (SPADCALL |options| (QREFELT $ 198))))
            (|error|
             (SPADCALL "Guess: no support for mixed shifts in algebraic"
                       " dependencies" (QREFELT $ 42)))))
          (LETT |dk| (SPADCALL |options| (QREFELT $ 199)))
          (EXIT
           (COND
            ((SPADCALL |dk| '|displayAsEQ| (QREFELT $ 222))
             (|error| "Guess: guessAlgDep supports only displayAsEQ"))
            ('T
             (SEQ
              (LETT |partitions| (|GUESS;FilteredPartitionStream| |options| $))
              (LETT |degrees| (|GUESS;ADEdegreeStream| |partitions| $))
              (LETT |fl| (|GUESS;get_fnames| (LENGTH |lists|) |options| $))
              (LETT |fakeDS|
                    (CONS #'|GUESS;algDepHP;LLR;47!0| (VECTOR $ |lists|)))
              (LETT |fakeDSF|
                    (CONS #'|GUESS;algDepHP;LLR;47!1| (VECTOR $ |lists|)))
              (EXIT
               (VECTOR
                (SPADCALL (CONS #'|GUESS;algDepHP;LLR;47!2| $) |partitions|
                          (QREFELT $ 226))
                (CONS #'|GUESS;algDepHP;LLR;47!3|
                      (VECTOR $ |fakeDS| |partitions|))
                (CONS #'|GUESS;algDepHP;LLR;47!4| (VECTOR $ |partitions|))
                (CONS #'|GUESS;algDepHP;LLR;47!5|
                      (VECTOR |fakeDSF| $ |partitions|))
                (CONS #'|GUESS;algDepHP;LLR;47!6| (VECTOR $ |partitions| |fl|))
                '|diffHP| '|dummy| (CONS (|function| |GUESS;diffA|) $)
                (CONS (|function| |GUESS;diffAF|) $)
                (CONS (|function| |GUESS;diffAX|) $)
                (CONS (|function| |GUESS;diffC|) $)))))))))) 

(SDEFUN |GUESS;algDepHP;LLR;47!6| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG (|fl| |partitions| $)
          (LETT |fl| (QREFELT $$ 2))
          (LETT |partitions| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;DEPEXPRRStream| |fl| |partitions| $))))) 

(SDEFUN |GUESS;algDepHP;LLR;47!5| ((|l| NIL) ($$ NIL))
        (PROG (|partitions| $ |fakeDSF|)
          (LETT |partitions| (QREFELT $$ 2))
          (LETT $ (QREFELT $$ 1))
          (LETT |fakeDSF| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G886 NIL) (|i| NIL) (#2=#:G885 NIL))
                   (SEQ
                    (|GUESS;ADEtestOptimisedGen|
                     (PROGN
                      (LETT #2# NIL)
                      (SEQ (LETT |i| NIL) (LETT #1# |l|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (SPADCALL |partitions| |i| (QREFELT $ 204))
                                    #2#))))
                           (LETT #1# (CDR #1#)) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     |fakeDSF| (|spadConstant| $ 205) $))))))) 

(SDEFUN |GUESS;algDepHP;LLR;47!4| ((|o| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;DEPguessModOptimisedGen|
             (SPADCALL
              (SPADCALL (SPADCALL |partitions| |o| (QREFELT $ 201))
                        (QREFELT $ 202))
              (QREFELT $ 203))
             $))))) 

(SDEFUN |GUESS;algDepHP;LLR;47!3| ((|z1| NIL) ($$ NIL))
        (PROG (|partitions| |fakeDS| $)
          (LETT |partitions| (QREFELT $$ 2))
          (LETT |fakeDS| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEguessStream| |z1| |partitions| |fakeDS|
             (|spadConstant| $ 200) $))))) 

(SDEFUN |GUESS;algDepHP;LLR;47!2| ((|c| NIL) ($ NIL)) (|spadConstant| $ 95)) 

(SDEFUN |GUESS;algDepHP;LLR;47!1| ((|w1| NIL) (|w2| NIL) ($$ NIL))
        (PROG (|lists| $)
          (LETT |lists| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;list2UFPSSUPF|
             (SPADCALL |lists|
                       (SPADCALL |w2| (|spadConstant| $ 174) (QREFELT $ 76))
                       (QREFELT $ 224))
             $))))) 

(SDEFUN |GUESS;algDepHP;LLR;47!0| ((|w1| NIL) (|w2| NIL) ($$ NIL))
        (PROG (|lists| $)
          (LETT |lists| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;list2UFPSF|
             (SPADCALL |lists|
                       (SPADCALL |w2| (|spadConstant| $ 174) (QREFELT $ 76))
                       (QREFELT $ 224))
             $))))) 

(SDEFUN |GUESS;substDX|
        ((|expr| EXPRR) (|x| |Symbol|) (|n| |NonNegativeInteger|) ($ EXPRR))
        (SPADCALL |expr| (SPADCALL |x| (QREFELT $ 45))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 45)) (+ |n| 1)
                            (QREFELT $ 103))
                  (QREFELT $ 228))) 

(SDEFUN |GUESS;substDS|
        ((|s| |UnivariateFormalPowerSeries| F) (|n| |NonNegativeInteger|)
         ($ |UnivariateFormalPowerSeries| F))
        (SPROG ((#1=#:G902 NIL))
               (SPADCALL |s|
                         (PROG1 (LETT #1# (+ |n| 1))
                           (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                             '(|NonNegativeInteger|) #1#))
                         (QREFELT $ 229)))) 

(SDEFUN |GUESS;substDSF|
        ((|s| |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
         (|n| |NonNegativeInteger|)
         ($ |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
        (SPROG ((#1=#:G904 NIL))
               (SPADCALL |s|
                         (PROG1 (LETT #1# (+ |n| 1))
                           (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                             '(|NonNegativeInteger|) #1#))
                         (QREFELT $ 230)))) 

(SDEFUN |GUESS;substHP;LR;51|
        ((|options| |List| (|GuessOption|))
         ($ |Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
          (|:| |guessStream|
               (|Mapping| (|Stream| (|UnivariateFormalPowerSeries| F))
                          (|UnivariateFormalPowerSeries| F)))
          (|:| |guessModGen|
               (|Mapping|
                (|Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
                           (|Integer|) (|Integer|))
                (|NonNegativeInteger|)))
          (|:| |testGen|
               (|Mapping|
                (|Mapping|
                 (|Vector|
                  (|UnivariateFormalPowerSeries|
                   (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                 (|UnivariateFormalPowerSeries|
                  (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                (|List| (|PositiveInteger|))))
          (|:| |exprStream| (|Mapping| (|Stream| EXPRR) EXPRR (|Symbol|)))
          (|:| |kind| (|Symbol|)) (|:| |qvar| (|Symbol|))
          (|:| A
               (|Mapping| S (|NonNegativeInteger|) (|NonNegativeInteger|)
                          (|SparseUnivariatePolynomial| S)))
          (|:| AF
               (|Mapping|
                (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))
                (|NonNegativeInteger|) (|NonNegativeInteger|)
                (|UnivariateFormalPowerSeries|
                 (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
          (|:| AX (|Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|) EXPRR))
          (|:| C (|Mapping| (|List| S) (|NonNegativeInteger|)))))
        (SPROG
         ((|partitions| (|Stream| (|List| (|Integer|)))) (|dk| (|Symbol|)))
         (SEQ
          (COND
           ((NULL (ZEROP (SPADCALL |options| (QREFELT $ 198))))
            (|error|
             "Guess: no support for mixed shifts in functional equations")))
          (LETT |dk| (SPADCALL |options| (QREFELT $ 199)))
          (EXIT
           (COND
            ((EQUAL |dk| '|displayAsGF|)
             (SEQ
              (LETT |partitions| (|GUESS;FilteredPartitionStream| |options| $))
              (EXIT
               (VECTOR
                (SPADCALL (CONS #'|GUESS;substHP;LR;51!0| $) |partitions|
                          (QREFELT $ 226))
                (CONS #'|GUESS;substHP;LR;51!1| (VECTOR $ |partitions|))
                (CONS #'|GUESS;substHP;LR;51!2| (VECTOR $ |partitions|))
                (CONS #'|GUESS;substHP;LR;51!3| (VECTOR $ |partitions|))
                (CONS #'|GUESS;substHP;LR;51!4| (VECTOR $ |partitions|))
                '|diffHP| '|dummy| (CONS (|function| |GUESS;diffA|) $)
                (CONS (|function| |GUESS;diffAF|) $)
                (CONS (|function| |GUESS;diffAX|) $)
                (CONS (|function| |GUESS;diffC|) $)))))
            ('T (|error| "Guess: guessSubst supports only displayAsGF"))))))) 

(SDEFUN |GUESS;substHP;LR;51!4| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEEXPRRStream| |z1| |z2| |partitions|
             (CONS (|function| |GUESS;substDX|) $)
             (CONS (|function| |GUESS;diff1X|) $) $))))) 

(SDEFUN |GUESS;substHP;LR;51!3| ((|l| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G922 NIL) (|i| NIL) (#2=#:G921 NIL))
                   (SEQ
                    (|GUESS;ADEtestOptimisedGen|
                     (PROGN
                      (LETT #2# NIL)
                      (SEQ (LETT |i| NIL) (LETT #1# |l|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (SPADCALL |partitions| |i| (QREFELT $ 204))
                                    #2#))))
                           (LETT #1# (CDR #1#)) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (CONS (|function| |GUESS;substDSF|) $)
                     (|spadConstant| $ 205) $))))))) 

(SDEFUN |GUESS;substHP;LR;51!2| ((|o| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;FEguessModOptimisedGen|
             (SPADCALL
              (SPADCALL (SPADCALL |partitions| |o| (QREFELT $ 201))
                        (QREFELT $ 202))
              (QREFELT $ 203))
             $))))) 

(SDEFUN |GUESS;substHP;LR;51!1| ((|z1| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEguessStream| |z1| |partitions|
             (CONS (|function| |GUESS;substDS|) $) (|spadConstant| $ 200) $))))) 

(SDEFUN |GUESS;substHP;LR;51!0| ((|c| NIL) ($ NIL)) (|spadConstant| $ 95)) 

(SDEFUN |GUESS;qDiffDX|
        ((|q| |Symbol|) (|expr| EXPRR) (|x| |Symbol|)
         (|n| |NonNegativeInteger|) ($ EXPRR))
        (SPADCALL |expr| (SPADCALL |x| (QREFELT $ 45))
                  (SPADCALL
                   (SPADCALL (SPADCALL |q| (QREFELT $ 45)) |n| (QREFELT $ 103))
                   (SPADCALL |x| (QREFELT $ 45)) (QREFELT $ 104))
                  (QREFELT $ 228))) 

(SDEFUN |GUESS;qDiffDS|
        ((|q| |Symbol|) (|s| |UnivariateFormalPowerSeries| F)
         (|n| |NonNegativeInteger|) ($ |UnivariateFormalPowerSeries| F))
        (SPROG NIL
               (SPADCALL (CONS #'|GUESS;qDiffDS!0| (VECTOR |n| $ |q|)) |s|
                         (QREFELT $ 235)))) 

(SDEFUN |GUESS;qDiffDS!0| ((|z1| NIL) ($$ NIL))
        (PROG (|q| $ |n|)
          (LETT |q| (QREFELT $$ 2))
          (LETT $ (QREFELT $$ 1))
          (LETT |n| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G943 NIL))
                   (SPADCALL (SPADCALL |q| (QREFELT $ 232))
                             (PROG1
                                 (LETT #1# (SPADCALL |n| |z1| (QREFELT $ 233)))
                               (|check_subtype2| (>= #1# 0)
                                                 '(|NonNegativeInteger|)
                                                 '(|Integer|) #1#))
                             (QREFELT $ 124))))))) 

(SDEFUN |GUESS;qDiffDSV|
        ((|f| |U32Vector|) (|n| |NonNegativeInteger|) (|prime| |Integer|)
         (|q| |Integer|) ($ |U32Vector|))
        (SPROG
         ((Q (|Integer|)) (#1=#:G954 NIL) (|i| NIL) (|qn| (|Integer|))
          (|r| (|U32Vector|)) (#2=#:G947 NIL) (|d| (|Integer|)))
         (SEQ
          (COND ((ZEROP |n|) |f|)
                ('T
                 (SEQ (LETT |d| (- (QV_LEN_U32 |f|) 1))
                      (LETT |r|
                            (GETREFV_U32
                             (+
                              (PROG1 (LETT #2# |d|)
                                (|check_subtype2| (>= #2# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #2#))
                              1)
                             0))
                      (SETELT_U32 |r| 0 (ELT_U32 |f| 0))
                      (COND
                       ((> |d| 0)
                        (SEQ (LETT Q 1)
                             (LETT |qn| (REM (EXPT |q| |n|) |prime|))
                             (EXIT
                              (SEQ (LETT |i| 1) (LETT #1# |d|) G190
                                   (COND ((|greater_SI| |i| #1#) (GO G191)))
                                   (SEQ (LETT Q (QSMULMOD32 |qn| Q |prime|))
                                        (EXIT
                                         (SETELT_U32 |r| |i|
                                                     (QSMULMOD32
                                                      (ELT_U32 |f| |i|) Q
                                                      |prime|))))
                                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                   (EXIT NIL))))))
                      (EXIT |r|))))))) 

(SDEFUN |GUESS;qDiffDSF|
        ((|q| |Symbol|)
         (|s| |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
         (|n| |NonNegativeInteger|)
         ($ |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
        (SPROG NIL
               (SPADCALL (CONS #'|GUESS;qDiffDSF!0| (VECTOR |n| $ |q|)) |s|
                         (QREFELT $ 238)))) 

(SDEFUN |GUESS;qDiffDSF!0| ((|z1| NIL) ($$ NIL))
        (PROG (|q| $ |n|)
          (LETT |q| (QREFELT $$ 2))
          (LETT $ (QREFELT $$ 1))
          (LETT |n| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G955 NIL))
                   (SPADCALL
                    (SPADCALL (SPADCALL |q| (QREFELT $ 232)) (QREFELT $ 236))
                    (PROG1 (LETT #1# (SPADCALL |n| |z1| (QREFELT $ 233)))
                      (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #1#))
                    (QREFELT $ 130))))))) 

(SDEFUN |GUESS;termAsU32VectorqDiff|
        ((|f| |U32Vector|) (|partition| |List| (|Integer|)) (|prime| |Integer|)
         (|q| |Integer|) (|dl| |NonNegativeInteger|) ($ |U32Vector|))
        (SPROG
         ((|fl| (|List| (|U32Vector|))) (#1=#:G961 NIL) (#2=#:G960 NIL)
          (#3=#:G971 NIL) (|part| NIL) (#4=#:G970 NIL)
          (|ll| (|List| (|List| (|Integer|)))) (|d| (|NonNegativeInteger|))
          (#5=#:G959 NIL) (#6=#:G969 NIL) (|i| NIL) (#7=#:G968 NIL))
         (SEQ
          (COND
           ((NULL |partition|)
            (SPADCALL
             (CONS 1
                   (PROGN
                    (LETT #7# NIL)
                    (SEQ (LETT |i| (+ |dl| 2)) (LETT #6# (QV_LEN_U32 |f|)) G190
                         (COND ((> |i| #6#) (GO G191)))
                         (SEQ (EXIT (LETT #7# (CONS 0 #7#))))
                         (LETT |i| (+ |i| 1)) (GO G190) G191
                         (EXIT (NREVERSE #7#)))))
             (QREFELT $ 108)))
           ('T
            (SEQ
             (LETT |d|
                   (PROG1 (LETT #5# (- (- (QV_LEN_U32 |f|) |dl|) 1))
                     (|check_subtype2| (>= #5# 0) '(|NonNegativeInteger|)
                                       '(|Integer|) #5#)))
             (LETT |ll| (SPADCALL |partition| (QREFELT $ 101)))
             (LETT |fl|
                   (PROGN
                    (LETT #4# NIL)
                    (SEQ (LETT |part| NIL) (LETT #3# |ll|) G190
                         (COND
                          ((OR (ATOM #3#) (PROGN (LETT |part| (CAR #3#)) NIL))
                           (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT #4#
                                 (CONS
                                  (SPADCALL
                                   (|GUESS;qDiffDSV| |f|
                                    (PROG1
                                        (LETT #2# (- (|SPADfirst| |part|) 1))
                                      (|check_subtype2| (>= #2# 0)
                                                        '(|NonNegativeInteger|)
                                                        '(|Integer|) #2#))
                                    |prime| |q| $)
                                   (PROG1
                                       (LETT #1#
                                             (SPADCALL |part| (QREFELT $ 102)))
                                     (|check_subtype2| (> #1# 0)
                                                       '(|PositiveInteger|)
                                                       '(|Integer|) #1#))
                                   |d| |prime| (QREFELT $ 111))
                                  #4#))))
                         (LETT #3# (CDR #3#)) (GO G190) G191
                         (EXIT (NREVERSE #4#)))))
             (EXIT
              (SPADCALL
               (CONS #'|GUESS;termAsU32VectorqDiff!0| (VECTOR $ |prime| |d|))
               |fl| (QREFELT $ 115))))))))) 

(SDEFUN |GUESS;termAsU32VectorqDiff!0| ((|f1| NIL) (|f2| NIL) ($$ NIL))
        (PROG (|d| |prime| $)
          (LETT |d| (QREFELT $$ 2))
          (LETT |prime| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |f1| |f2| |d| |prime| (QREFELT $ 112)))))) 

(SDEFUN |GUESS;ADEguessModGenq|
        ((|partitions| |List| (|List| (|Integer|))) (|d| |NonNegativeInteger|)
         ($ |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|)))
        (SPROG NIL
               (SEQ
                (CONS #'|GUESS;ADEguessModGenq!0|
                      (VECTOR |d| |partitions| $))))) 

(SDEFUN |GUESS;ADEguessModGenq!0| ((|fl| NIL) (|prime| NIL) (|q| NIL) ($$ NIL))
        (PROG ($ |partitions| |d|)
          (LETT $ (QREFELT $$ 2))
          (LETT |partitions| (QREFELT $$ 1))
          (LETT |d| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G977 NIL) (|p| NIL) (#2=#:G976 NIL) (|f| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL (SPADCALL |fl| (QREFELT $ 173))
                                (|spadConstant| $ 174) (QREFELT $ 147))
                      (|error| "ADEguessModGenq, lambda: #fl ~= 1"))
                     ('T
                      (SEQ (LETT |f| (SPADCALL |fl| (QREFELT $ 175)))
                           (EXIT
                            (SPADCALL
                             (PROGN
                              (LETT #2# NIL)
                              (SEQ (LETT |p| NIL) (LETT #1# |partitions|) G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN (LETT |p| (CAR #1#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #2#
                                           (CONS
                                            (|GUESS;termAsU32VectorqDiff| |f|
                                             |p| |prime| |q| |d| $)
                                            #2#))))
                                   (LETT #1# (CDR #1#)) (GO G190) G191
                                   (EXIT (NREVERSE #2#))))
                             (QREFELT $ 176)))))))))))) 

(SDEFUN |GUESS;diffHP;SM;58|
        ((|q| |Symbol|)
         ($ |Mapping|
          (|Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
                    (|:| |guessStream|
                         (|Mapping|
                          (|Stream| (|UnivariateFormalPowerSeries| F))
                          (|UnivariateFormalPowerSeries| F)))
                    (|:| |guessModGen|
                         (|Mapping|
                          (|Mapping| (|Vector| (|U32Vector|))
                                     (|List| (|U32Vector|)) (|Integer|)
                                     (|Integer|))
                          (|NonNegativeInteger|)))
                    (|:| |testGen|
                         (|Mapping|
                          (|Mapping|
                           (|Vector|
                            (|UnivariateFormalPowerSeries|
                             (|SparseMultivariatePolynomial| F
                                                             (|NonNegativeInteger|))))
                           (|UnivariateFormalPowerSeries|
                            (|SparseMultivariatePolynomial| F
                                                            (|NonNegativeInteger|))))
                          (|List| (|PositiveInteger|))))
                    (|:| |exprStream|
                         (|Mapping| (|Stream| EXPRR) EXPRR (|Symbol|)))
                    (|:| |kind| (|Symbol|)) (|:| |qvar| (|Symbol|))
                    (|:| A
                         (|Mapping| S (|NonNegativeInteger|)
                                    (|NonNegativeInteger|)
                                    (|SparseUnivariatePolynomial| S)))
                    (|:| AF
                         (|Mapping|
                          (|SparseMultivariatePolynomial| F
                                                          (|NonNegativeInteger|))
                          (|NonNegativeInteger|) (|NonNegativeInteger|)
                          (|UnivariateFormalPowerSeries|
                           (|SparseMultivariatePolynomial| F
                                                           (|NonNegativeInteger|)))))
                    (|:| AX
                         (|Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|)
                                    EXPRR))
                    (|:| C (|Mapping| (|List| S) (|NonNegativeInteger|))))
          (|List| (|GuessOption|))))
        (SPROG NIL (SEQ (CONS #'|GUESS;diffHP;SM;58!8| (VECTOR |q| $))))) 

(SDEFUN |GUESS;diffHP;SM;58!8| ((|l1| NIL) ($$ NIL))
        (PROG ($ |q|)
          (LETT $ (QREFELT $$ 1))
          (LETT |q| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|partitions| NIL))
                   (SEQ
                    (COND
                     ((NULL
                       (SPADCALL (SPADCALL |l1| (QREFELT $ 198))
                                 (QREFELT $ 239)))
                      (|error|
                       (SPADCALL "Guess: no support for mixed shifts in"
                                 " differential equations" (QREFELT $ 42)))))
                    (EXIT
                     (COND
                      ((SPADCALL (SPADCALL |l1| (QREFELT $ 199)) '|displayAsGF|
                                 (QREFELT $ 240))
                       (SEQ
                        (LETT |partitions|
                              (|GUESS;FilteredPartitionStream| |l1| $))
                        (EXIT
                         (VECTOR
                          (SPADCALL (CONS #'|GUESS;diffHP;SM;58!0| $)
                                    |partitions| (QREFELT $ 226))
                          (CONS #'|GUESS;diffHP;SM;58!2|
                                (VECTOR |q| $ |partitions|))
                          (CONS #'|GUESS;diffHP;SM;58!3|
                                (VECTOR $ |partitions|))
                          (CONS #'|GUESS;diffHP;SM;58!5|
                                (VECTOR |q| $ |partitions|))
                          (CONS #'|GUESS;diffHP;SM;58!7|
                                (VECTOR |q| $ |partitions|))
                          '|qdiffHP| |q| (CONS (|function| |GUESS;diffA|) $)
                          (CONS (|function| |GUESS;diffAF|) $)
                          (CONS (|function| |GUESS;diffAX|) $)
                          (CONS (|function| |GUESS;diffC|) $)))))
                      ('T
                       (|error|
                        "Guess: guessADE supports only displayAsGF")))))))))) 

(SDEFUN |GUESS;diffHP;SM;58!7| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG (|partitions| $ |q|)
          (LETT |partitions| (QREFELT $$ 2))
          (LETT $ (QREFELT $$ 1))
          (LETT |q| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (|GUESS;ADEEXPRRStream| |z1| |z2| |partitions|
                    (CONS #'|GUESS;diffHP;SM;58!6| (VECTOR $ |q|))
                    (CONS (|function| |GUESS;diff1X|) $) $)))))) 

(SDEFUN |GUESS;diffHP;SM;58!6| ((|w1| NIL) (|w2| NIL) (|w3| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;qDiffDX| |q| |w1| |w2| |w3| $))))) 

(SDEFUN |GUESS;diffHP;SM;58!5| ((|l| NIL) ($$ NIL))
        (PROG (|partitions| $ |q|)
          (LETT |partitions| (QREFELT $$ 2))
          (LETT $ (QREFELT $$ 1))
          (LETT |q| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G993 NIL) (|i| NIL) (#2=#:G992 NIL))
                   (SEQ
                    (|GUESS;ADEtestOptimisedGen|
                     (PROGN
                      (LETT #2# NIL)
                      (SEQ (LETT |i| NIL) (LETT #1# |l|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (SPADCALL |partitions| |i| (QREFELT $ 204))
                                    #2#))))
                           (LETT #1# (CDR #1#)) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (CONS #'|GUESS;diffHP;SM;58!4| (VECTOR $ |q|))
                     (|spadConstant| $ 205) $))))))) 

(SDEFUN |GUESS;diffHP;SM;58!4| ((|w1| NIL) (|w2| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;qDiffDSF| |q| |w1| |w2| $))))) 

(SDEFUN |GUESS;diffHP;SM;58!3| ((|o| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEguessModGenq|
             (SPADCALL
              (SPADCALL (SPADCALL |partitions| |o| (QREFELT $ 201))
                        (QREFELT $ 202))
              (QREFELT $ 203))
             (|spadConstant| $ 95) $))))) 

(SDEFUN |GUESS;diffHP;SM;58!2| ((|z1| NIL) ($$ NIL))
        (PROG (|partitions| $ |q|)
          (LETT |partitions| (QREFELT $$ 2))
          (LETT $ (QREFELT $$ 1))
          (LETT |q| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (|GUESS;ADEguessStream| |z1| |partitions|
                    (CONS #'|GUESS;diffHP;SM;58!1| (VECTOR $ |q|))
                    (|spadConstant| $ 200) $)))))) 

(SDEFUN |GUESS;diffHP;SM;58!1| ((|w1| NIL) (|w2| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;qDiffDS| |q| |w1| |w2| $))))) 

(SDEFUN |GUESS;diffHP;SM;58!0| ((|c| NIL) ($ NIL)) (|spadConstant| $ 95)) 

(SDEFUN |GUESS;ShiftSX|
        ((|expr| EXPRR) (|x| |Symbol|) (|n| |NonNegativeInteger|) ($ EXPRR))
        (SPADCALL |expr| (SPADCALL |x| (QREFELT $ 45))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 45))
                            (SPADCALL |n| (QREFELT $ 243)) (QREFELT $ 93))
                  (QREFELT $ 228))) 

(SDEFUN |GUESS;ShiftSXGF|
        ((|expr| EXPRR) (|x| |Symbol|) (|n| |NonNegativeInteger|) ($ EXPRR))
        (SPROG
         ((|l| (|List| EXPRR)) (#1=#:G1020 NIL) (|i| NIL) (#2=#:G1019 NIL))
         (SEQ
          (COND ((ZEROP |n|) |expr|)
                ('T
                 (SEQ
                  (LETT |l|
                        (PROGN
                         (LETT #2# NIL)
                         (SEQ (LETT |i| 0) (LETT #1# (- |n| 1)) G190
                              (COND ((|greater_SI| |i| #1#) (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |expr| |x| |i|
                                                    (QREFELT $ 189))
                                          (SPADCALL
                                           (SPADCALL |i| (QREFELT $ 244))
                                           (QREFELT $ 243))
                                          (QREFELT $ 245))
                                         (SPADCALL |x| (QREFELT $ 45))
                                         (|spadConstant| $ 246)
                                         (QREFELT $ 228))
                                        (SPADCALL (SPADCALL |x| (QREFELT $ 45))
                                                  |i| (QREFELT $ 103))
                                        (QREFELT $ 104))
                                       #2#))))
                              (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                              (EXIT (NREVERSE #2#)))))
                  (EXIT
                   (SPADCALL
                    (SPADCALL |expr| (SPADCALL (ELT $ 93) |l| (QREFELT $ 106))
                              (QREFELT $ 247))
                    (SPADCALL (SPADCALL |x| (QREFELT $ 45)) |n|
                              (QREFELT $ 103))
                    (QREFELT $ 245))))))))) 

(SDEFUN |GUESS;ShiftSS|
        ((|s| |UnivariateFormalPowerSeries| F) (|n| |NonNegativeInteger|)
         ($ |UnivariateFormalPowerSeries| F))
        (SPADCALL |s| (SPADCALL (ELT $ 248) |n| (QREFELT $ 251)))) 

(SDEFUN |GUESS;ShiftSF|
        ((|s| |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
         (|n| |NonNegativeInteger|)
         ($ |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
        (SPADCALL |s| (SPADCALL (ELT $ 252) |n| (QREFELT $ 255)))) 

(SDEFUN |GUESS;ShiftAX|
        ((|l| |NonNegativeInteger|) (|n| |Symbol|) (|f| EXPRR) ($ EXPRR))
        (SPADCALL (SPADCALL (SPADCALL |n| (QREFELT $ 45)) |l| (QREFELT $ 103))
                  |f| (QREFELT $ 104))) 

(SDEFUN |GUESS;ShiftAXGF|
        ((|l| |NonNegativeInteger|) (|x| |Symbol|) (|f| EXPRR) ($ EXPRR))
        (SPROG
         ((|s| (|List| EXPRR)) (#1=#:G1031 NIL) (|i| NIL) (#2=#:G1030 NIL))
         (SEQ
          (COND ((ZEROP |l|) |f|)
                ('T
                 (SEQ
                  (LETT |s|
                        (PROGN
                         (LETT #2# NIL)
                         (SEQ (LETT |i| 1) (LETT #1# |l|) G190
                              (COND ((|greater_SI| |i| #1#) (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL
                                          (SPADCALL |l| |i| (QREFELT $ 257))
                                          (QREFELT $ 243))
                                         (SPADCALL
                                          (SPADCALL |x| (QREFELT $ 45)) |i|
                                          (QREFELT $ 103))
                                         (QREFELT $ 104))
                                        (SPADCALL |f| |x| |i| (QREFELT $ 189))
                                        (QREFELT $ 104))
                                       #2#))))
                              (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                              (EXIT (NREVERSE #2#)))))
                  (EXIT (SPADCALL (ELT $ 93) |s| (QREFELT $ 106))))))))) 

(SDEFUN |GUESS;ShiftA|
        ((|k| |NonNegativeInteger|) (|l| |NonNegativeInteger|)
         (|f| |SparseUnivariatePolynomial| S) ($ S))
        (SPADCALL |k| |l| |f| (QREFELT $ 258))) 

(SDEFUN |GUESS;ShiftAF|
        ((|k| |NonNegativeInteger|) (|l| |NonNegativeInteger|)
         (|f| |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
         ($ |SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
        (SPADCALL |k| |l| |f| (QREFELT $ 259))) 

(SDEFUN |GUESS;ShiftC| ((|total| |NonNegativeInteger|) ($ |List| S))
        (SPADCALL |total| (QREFELT $ 260))) 

(SDEFUN |GUESS;shiftHP;LR;68|
        ((|options| |List| (|GuessOption|))
         ($ |Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
          (|:| |guessStream|
               (|Mapping| (|Stream| (|UnivariateFormalPowerSeries| F))
                          (|UnivariateFormalPowerSeries| F)))
          (|:| |guessModGen|
               (|Mapping|
                (|Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
                           (|Integer|) (|Integer|))
                (|NonNegativeInteger|)))
          (|:| |testGen|
               (|Mapping|
                (|Mapping|
                 (|Vector|
                  (|UnivariateFormalPowerSeries|
                   (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                 (|UnivariateFormalPowerSeries|
                  (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                (|List| (|PositiveInteger|))))
          (|:| |exprStream| (|Mapping| (|Stream| EXPRR) EXPRR (|Symbol|)))
          (|:| |kind| (|Symbol|)) (|:| |qvar| (|Symbol|))
          (|:| A
               (|Mapping| S (|NonNegativeInteger|) (|NonNegativeInteger|)
                          (|SparseUnivariatePolynomial| S)))
          (|:| AF
               (|Mapping|
                (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))
                (|NonNegativeInteger|) (|NonNegativeInteger|)
                (|UnivariateFormalPowerSeries|
                 (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
          (|:| AX (|Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|) EXPRR))
          (|:| C (|Mapping| (|List| S) (|NonNegativeInteger|)))))
        (SPROG
         ((|degrees| (|Stream| (|NonNegativeInteger|))) (|dk| (|Symbol|))
          (|partitions| (|Stream| (|List| (|Integer|)))))
         (SEQ
          (COND
           ((NULL (ZEROP (SPADCALL |options| (QREFELT $ 198))))
            (|error| "Guess: need a symbol for mixed Shifting")))
          (LETT |partitions| (|GUESS;FilteredPartitionStream| |options| $))
          (LETT |dk| (SPADCALL |options| (QREFELT $ 199)))
          (EXIT
           (COND
            ((SPADCALL |dk| '|displayAsRec| (QREFELT $ 222))
             (|error|
              "Guess: no support for the Shift operator with displayAsGF"))
            ('T
             (SEQ (LETT |degrees| (|GUESS;ADEdegreeStream| |partitions| $))
                  (EXIT
                   (VECTOR |degrees|
                           (CONS #'|GUESS;shiftHP;LR;68!0|
                                 (VECTOR $ |partitions|))
                           (CONS #'|GUESS;shiftHP;LR;68!1|
                                 (VECTOR |degrees| $ |partitions|))
                           (CONS #'|GUESS;shiftHP;LR;68!2|
                                 (VECTOR $ |partitions|))
                           (CONS #'|GUESS;shiftHP;LR;68!3|
                                 (VECTOR $ |partitions|))
                           '|shiftHP| '|dummy|
                           (CONS (|function| |GUESS;ShiftA|) $)
                           (CONS (|function| |GUESS;ShiftAF|) $)
                           (CONS (|function| |GUESS;ShiftAX|) $)
                           (CONS (|function| |GUESS;ShiftC|) $)))))))))) 

(SDEFUN |GUESS;shiftHP;LR;68!3| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEEXPRRStream| |z1| |z2| |partitions|
             (CONS (|function| |GUESS;ShiftSX|) $)
             (CONS (|function| |GUESS;diff1X|) $) $))))) 

(SDEFUN |GUESS;shiftHP;LR;68!2| ((|l| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G1050 NIL) (|i| NIL) (#2=#:G1049 NIL))
                   (SEQ
                    (|GUESS;ADEtestGen2|
                     (PROGN
                      (LETT #2# NIL)
                      (SEQ (LETT |i| NIL) (LETT #1# |l|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (SPADCALL |partitions| |i| (QREFELT $ 204))
                                    #2#))))
                           (LETT #1# (CDR #1#)) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (CONS (|function| |GUESS;ShiftSF|) $)
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 205)
                                (SPADCALL (|spadConstant| $ 268)
                                          (|spadConstant| $ 74)
                                          (QREFELT $ 269))
                                (QREFELT $ 270))
                      (SPADCALL (|spadConstant| $ 264) (QREFELT $ 265))
                      (QREFELT $ 271))
                     $))))))) 

(SDEFUN |GUESS;shiftHP;LR;68!1| ((|o| NIL) ($$ NIL))
        (PROG (|partitions| $ |degrees|)
          (LETT |partitions| (QREFELT $$ 2))
          (LETT $ (QREFELT $$ 1))
          (LETT |degrees| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEguessModGen2|
             (SPADCALL
              (SPADCALL (SPADCALL |partitions| |o| (QREFELT $ 201))
                        (QREFELT $ 202))
              (QREFELT $ 203))
             (SPADCALL |degrees| |o| (QREFELT $ 267)) $))))) 

(SDEFUN |GUESS;shiftHP;LR;68!0| ((|z1| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEguessStream2| |z1| |partitions|
             (CONS (|function| |GUESS;ShiftSS|) $)
             (SPADCALL
              (SPADCALL (|spadConstant| $ 200)
                        (SPADCALL (|spadConstant| $ 63) (|spadConstant| $ 174)
                                  (QREFELT $ 261))
                        (QREFELT $ 262))
              (SPADCALL (|spadConstant| $ 264) (QREFELT $ 265))
              (QREFELT $ 266))
             $))))) 

(SDEFUN |GUESS;qShiftAX|
        ((|q| |Symbol|) (|l| |NonNegativeInteger|) (|n| |Symbol|) (|f| EXPRR)
         ($ EXPRR))
        (SPADCALL
         (SPADCALL (SPADCALL |q| (QREFELT $ 45))
                   (SPADCALL |l| (SPADCALL |n| (QREFELT $ 45)) (QREFELT $ 273))
                   (QREFELT $ 274))
         |f| (QREFELT $ 104))) 

(SDEFUN |GUESS;qShiftA|
        ((|q| |Symbol|) (|k| |NonNegativeInteger|) (|l| |NonNegativeInteger|)
         (|f| |SparseUnivariatePolynomial| S) ($ S))
        (SPADCALL (SPADCALL |q| (QREFELT $ 275)) |k| |l| |f| (QREFELT $ 276))) 

(SDEFUN |GUESS;qShiftAF|
        ((|q| |Symbol|) (|k| |NonNegativeInteger|) (|l| |NonNegativeInteger|)
         (|f| |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
         ($ |SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
        (SPADCALL (SPADCALL (SPADCALL |q| (QREFELT $ 232)) (QREFELT $ 236)) |k|
                  |l| |f| (QREFELT $ 277))) 

(SDEFUN |GUESS;qShiftC|
        ((|q| |Symbol|) (|total| |NonNegativeInteger|) ($ |List| S))
        (SPADCALL (SPADCALL |q| (QREFELT $ 275)) |total| (QREFELT $ 278))) 

(SDEFUN |GUESS;qSubstUFPSF|
        ((|q| |Symbol|) (|s| |UnivariateFormalPowerSeries| F)
         (|maxMD| |NonNegativeInteger|)
         ($ |List| (|UnivariateFormalPowerSeries| F)))
        (SPROG ((#1=#:G1076 NIL) (|i| NIL) (#2=#:G1075 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |i| 0) (LETT #1# |maxMD|) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL |s|
                                         (SPADCALL
                                          (SPADCALL
                                           (SPADCALL |q| (QREFELT $ 232)) |i|
                                           (QREFELT $ 124))
                                          (SPADCALL (|spadConstant| $ 63) 1
                                                    (QREFELT $ 261))
                                          (QREFELT $ 279))
                                         (QREFELT $ 280))
                               #2#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |GUESS;qSubstEXPRR|
        ((|q| |Symbol|) (|xx| |Symbol|) (|s| EXPRR)
         (|maxMD| |NonNegativeInteger|) ($ |List| EXPRR))
        (SPROG ((#1=#:G1080 NIL) (|i| NIL) (#2=#:G1079 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |i| 0) (LETT #1# |maxMD|) G190
                      (COND ((|greater_SI| |i| #1#) (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS
                               (SPADCALL
                                (SPADCALL (SPADCALL |q| (QREFELT $ 45))
                                          (SPADCALL |i|
                                                    (SPADCALL |xx|
                                                              (QREFELT $ 45))
                                                    (QREFELT $ 273))
                                          (QREFELT $ 274))
                                |s| (QREFELT $ 104))
                               #2#))))
                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |GUESS;ADEguessStreamMixShift|
        ((|q| |Symbol|) (|f| |UnivariateFormalPowerSeries| F)
         (|partitions| |Stream| (|List| (|Integer|)))
         (|maxMD| |NonNegativeInteger|)
         ($ |Stream| (|UnivariateFormalPowerSeries| F)))
        (SPROG ((|s| (|Stream| (|UnivariateFormalPowerSeries| F))))
               (SEQ
                (LETT |s|
                      (|GUESS;ADEguessStream2| |f| |partitions|
                       (CONS (|function| |GUESS;ShiftSS|) $)
                       (SPADCALL
                        (SPADCALL (|spadConstant| $ 200)
                                  (SPADCALL (|spadConstant| $ 63) 1
                                            (QREFELT $ 261))
                                  (QREFELT $ 262))
                        (SPADCALL (|spadConstant| $ 264) (QREFELT $ 265))
                        (QREFELT $ 266))
                       $))
                (EXIT
                 (SPADCALL |s|
                           (CONS #'|GUESS;ADEguessStreamMixShift!0|
                                 (VECTOR $ |maxMD| |q|))
                           (QREFELT $ 283)))))) 

(SDEFUN |GUESS;ADEguessStreamMixShift!0| ((|z1| NIL) ($$ NIL))
        (PROG (|q| |maxMD| $)
          (LETT |q| (QREFELT $$ 2))
          (LETT |maxMD| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;qSubstUFPSF| |q| |z1| |maxMD| $))))) 

(SDEFUN |GUESS;ADEguessModGen2Mixed|
        ((|partitions| |Stream| (|List| (|Integer|)))
         (|dl| |NonNegativeInteger|) (|maxMD| |NonNegativeInteger|)
         (|o| |NonNegativeInteger|)
         ($ |Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
          (|Integer|) (|Integer|)))
        (SPROG NIL
               (SEQ
                (CONS #'|GUESS;ADEguessModGen2Mixed!0|
                      (VECTOR |partitions| |maxMD| |o| |dl| $))))) 

(SDEFUN |GUESS;ADEguessModGen2Mixed!0|
        ((|fl| NIL) (|prime| NIL) (|q| NIL) ($$ NIL))
        (PROG ($ |dl| |o| |maxMD| |partitions|)
          (LETT $ (QREFELT $$ 4))
          (LETT |dl| (QREFELT $$ 3))
          (LETT |o| (QREFELT $$ 2))
          (LETT |maxMD| (QREFELT $$ 1))
          (LETT |partitions| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG
             ((|l| NIL) (|vv| NIL) (#1=#:G1110 NIL) (|e| NIL) (|vn| NIL)
              (#2=#:G1109 NIL) (|i| NIL) (|r| NIL) (#3=#:G1108 NIL)
              (#4=#:G1107 NIL) (|lastv| NIL) (#5=#:G1105 NIL) (|v| NIL)
              (#6=#:G1106 NIL) (|w| NIL) (|vv1| NIL) (#7=#:G1104 NIL) (|p| NIL)
              (#8=#:G1103 NIL) (O NIL) (#9=#:G1088 NIL) (#10=#:G1102 NIL)
              (|qv| NIL) (|d| NIL) (#11=#:G1086 NIL) (|f| NIL))
             (SEQ
              (COND
               ((SPADCALL (SPADCALL |fl| (QREFELT $ 173))
                          (|spadConstant| $ 174) (QREFELT $ 147))
                (|error| "ADEguessModGen2Mixed: #fl ~= 1"))
               ('T
                (SEQ (LETT |f| (SPADCALL |fl| (QREFELT $ 175)))
                     (LETT |d|
                           (PROG1
                               (LETT #11#
                                     (SPADCALL
                                      (SPADCALL (SPADCALL |f| (QREFELT $ 284))
                                                |dl| (QREFELT $ 183))
                                      (|spadConstant| $ 174) (QREFELT $ 183)))
                             (|check_subtype2| (>= #11# 0)
                                               '(|NonNegativeInteger|)
                                               '(|Integer|) #11#)))
                     (LETT |qv|
                           (SPADCALL
                            (SPADCALL |d| (|spadConstant| $ 174)
                                      (QREFELT $ 76))
                            (|spadConstant| $ 174) (QREFELT $ 285)))
                     (SEQ (LETT |i| (|spadConstant| $ 174)) (LETT #10# |d|)
                          G190 (COND ((> |i| #10#) (GO G191)))
                          (SEQ
                           (EXIT
                            (SPADCALL |qv| |i|
                                      (SPADCALL
                                       (SPADCALL |q| |i| (QREFELT $ 288))
                                       |prime| (QREFELT $ 289))
                                      (QREFELT $ 290))))
                          (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                     (LETT O
                           (PROG1
                               (LETT #9#
                                     (SPADCALL
                                      (SPADCALL |o|
                                                (SPADCALL |maxMD|
                                                          (|spadConstant| $
                                                                          174)
                                                          (QREFELT $ 76))
                                                (QREFELT $ 291))
                                      (QREFELT $ 292)))
                             (|check_subtype2| (>= #9# 0)
                                               '(|NonNegativeInteger|)
                                               '(|Integer|) #9#)))
                     (LETT |vv1|
                           (PROGN
                            (LETT #8# NIL)
                            (SEQ (LETT |p| NIL)
                                 (LETT #7#
                                       (SPADCALL
                                        (SPADCALL
                                         (SPADCALL |partitions| O
                                                   (QREFELT $ 201))
                                         (QREFELT $ 202))
                                        (QREFELT $ 203)))
                                 G190
                                 (COND
                                  ((OR (ATOM #7#)
                                       (PROGN (LETT |p| (CAR #7#)) NIL))
                                   (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #8#
                                         (CONS
                                          (|GUESS;termAsU32VectorShift| |f| |p|
                                           |prime| |dl| $)
                                          #8#))))
                                 (LETT #7# (CDR #7#)) (GO G190) G191
                                 (EXIT (NREVERSE #8#)))))
                     (LETT |l| NIL)
                     (LETT |lastv| (SPADCALL |vv1| (QREFELT $ 175)))
                     (SEQ (LETT |w| NIL)
                          (LETT #6# (SPADCALL |vv1| (QREFELT $ 293)))
                          (LETT |v| NIL) (LETT #5# |vv1|) G190
                          (COND
                           ((OR (ATOM #5#) (PROGN (LETT |v| (CAR #5#)) NIL)
                                (ATOM #6#) (PROGN (LETT |w| (CAR #6#)) NIL))
                            (GO G191)))
                          (SEQ (LETT |lastv| |w|) (LETT |vv| (LIST |v|))
                               (LETT |vn| |v|)
                               (SEQ (LETT |i| (|spadConstant| $ 174))
                                    (LETT #4# |maxMD|) G190
                                    (COND ((> |i| #4#) (GO G191)))
                                    (SEQ
                                     (LETT |vn|
                                           (SPADCALL |vn| (QREFELT $ 294)))
                                     (SEQ (LETT |e| (|spadConstant| $ 174))
                                          (LETT #3# |d|) G190
                                          (COND ((> |e| #3#) (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (SPADCALL |vn| |e|
                                                      (QSMULMOD32
                                                       (SPADCALL |vn| |e|
                                                                 (QREFELT $
                                                                          295))
                                                       (SPADCALL |qv| |e|
                                                                 (QREFELT $
                                                                          295))
                                                       |prime|)
                                                      (QREFELT $ 290))))
                                          (LETT |e| (+ |e| 1)) (GO G190) G191
                                          (EXIT NIL))
                                     (EXIT
                                      (LETT |vv|
                                            (SPADCALL |vn| |vv|
                                                      (QREFELT $ 296)))))
                                    (LETT |i| (+ |i| 1)) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT
                                (LETT |l|
                                      (SPADCALL
                                       (SPADCALL
                                        (SPADCALL |vv| (QREFELT $ 297))
                                        (QREFELT $ 176))
                                       |l| (QREFELT $ 299)))))
                          (LETT #5# (PROG1 (CDR #5#) (LETT #6# (CDR #6#))))
                          (GO G190) G191 (EXIT NIL))
                     (LETT |vv| (LIST |lastv|)) (LETT |vn| |lastv|)
                     (LETT |r|
                           (SPADCALL
                            (SPADCALL |o|
                                      (SPADCALL |maxMD| (|spadConstant| $ 174)
                                                (QREFELT $ 76))
                                      (QREFELT $ 300))
                            (|spadConstant| $ 174) (QREFELT $ 183)))
                     (COND
                      ((SPADCALL |r|
                                 (SPADCALL (|spadConstant| $ 287)
                                           (QREFELT $ 301))
                                 (QREFELT $ 98))
                       (LETT |r| |maxMD|)))
                     (SEQ (LETT |i| (|spadConstant| $ 174)) (LETT #2# |r|) G190
                          (COND ((> |i| #2#) (GO G191)))
                          (SEQ (LETT |vn| (SPADCALL |vn| (QREFELT $ 294)))
                               (SEQ (LETT |e| (|spadConstant| $ 174))
                                    (LETT #1# |d|) G190
                                    (COND ((> |e| #1#) (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (SPADCALL |vn| |e|
                                                (QSMULMOD32
                                                 (SPADCALL |vn| |e|
                                                           (QREFELT $ 295))
                                                 (SPADCALL |qv| |e|
                                                           (QREFELT $ 295))
                                                 |prime|)
                                                (QREFELT $ 290))))
                                    (LETT |e| (+ |e| 1)) (GO G190) G191
                                    (EXIT NIL))
                               (EXIT
                                (LETT |vv|
                                      (SPADCALL |vn| |vv| (QREFELT $ 296)))))
                          (LETT |i| (+ |i| 1)) (GO G190) G191 (EXIT NIL))
                     (LETT |l|
                           (SPADCALL
                            (SPADCALL (SPADCALL |vv| (QREFELT $ 297))
                                      (QREFELT $ 176))
                            |l| (QREFELT $ 299)))
                     (EXIT
                      (SPADCALL (SPADCALL |l| (QREFELT $ 302))
                                (QREFELT $ 304)))))))))))) 

(SDEFUN |GUESS;ADEdegreeStreamMixShift|
        ((|partitions| |Stream| (|List| (|Integer|)))
         (|maxMD| |NonNegativeInteger|) ($ |Stream| (|NonNegativeInteger|)))
        (SPROG ((|s| (|Stream| (|NonNegativeInteger|))))
               (SEQ (LETT |s| (|GUESS;ADEdegreeStream| |partitions| $))
                    (EXIT
                     (SPADCALL |s|
                               (CONS #'|GUESS;ADEdegreeStreamMixShift!0|
                                     (VECTOR |maxMD| $))
                               (QREFELT $ 308)))))) 

(SDEFUN |GUESS;ADEdegreeStreamMixShift!0| ((|z1| NIL) ($$ NIL))
        (PROG ($ |maxMD|)
          (LETT $ (QREFELT $$ 1))
          (LETT |maxMD| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G1115 NIL) (|i| NIL) (#2=#:G1114 NIL))
                   (SEQ
                    (PROGN
                     (LETT #2# NIL)
                     (SEQ (LETT |i| (|spadConstant| $ 95)) (LETT #1# |maxMD|)
                          G190 (COND ((> |i| #1#) (GO G191)))
                          (SEQ (EXIT (LETT #2# (CONS |z1| #2#))))
                          (LETT |i| (+ |i| 1)) (GO G190) G191
                          (EXIT (NREVERSE #2#)))))))))) 

(SDEFUN |GUESS;ADEtestMixShiftGen|
        ((|q| |Symbol|) (|partitions| |Stream| (|List| (|Integer|)))
         (|maxMD| |NonNegativeInteger|) (|l| |List| (|PositiveInteger|))
         ($ |Mapping|
          (|Vector|
           (|UnivariateFormalPowerSeries|
            (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
          (|UnivariateFormalPowerSeries|
           (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
        (SPROG NIL
               (SEQ
                (CONS #'|GUESS;ADEtestMixShiftGen!0|
                      (VECTOR |q| |partitions| |maxMD| $ |l|))))) 

(SDEFUN |GUESS;ADEtestMixShiftGen!0| ((|f| NIL) ($$ NIL))
        (PROG (|l| $ |maxMD| |partitions| |q|)
          (LETT |l| (QREFELT $$ 4))
          (LETT $ (QREFELT $$ 3))
          (LETT |maxMD| (QREFELT $$ 2))
          (LETT |partitions| (QREFELT $$ 1))
          (LETT |q| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG
             ((|res| NIL) (#1=#:G1138 NIL) (|i| NIL) (#2=#:G1137 NIL)
              (|f0| NIL) (|exponents| NIL) (#3=#:G1125 NIL)
              (|oldPartition| NIL) (#4=#:G1136 NIL) (#5=#:G1135 NIL)
              (|newPartition| NIL) (#6=#:G1119 NIL) (#7=#:G1134 NIL) (|p| NIL)
              (#8=#:G1118 NIL))
             (SEQ (LETT |res| NIL) (LETT |exponents| NIL)
                  (LETT |oldPartition|
                        (PROG1
                            (LETT #8#
                                  (SPADCALL
                                   (SPADCALL (SPADCALL |l| (QREFELT $ 310))
                                             (SPADCALL |maxMD|
                                                       (|spadConstant| $ 74)
                                                       (QREFELT $ 76))
                                             (QREFELT $ 291))
                                   (QREFELT $ 292)))
                          (|check_subtype2| (> #8# 0) '(|PositiveInteger|)
                                            '(|Integer|) #8#)))
                  (SEQ (LETT |p| NIL) (LETT #7# |l|) G190
                       (COND
                        ((OR (ATOM #7#) (PROGN (LETT |p| (CAR #7#)) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |newPartition|
                              (PROG1
                                  (LETT #6#
                                        (SPADCALL
                                         (SPADCALL |p|
                                                   (SPADCALL |maxMD|
                                                             (|spadConstant| $
                                                                             74)
                                                             (QREFELT $ 76))
                                                   (QREFELT $ 291))
                                         (QREFELT $ 292)))
                                (|check_subtype2| (> #6# 0)
                                                  '(|PositiveInteger|)
                                                  '(|Integer|) #6#)))
                        (COND
                         ((SPADCALL |newPartition| |oldPartition|
                                    (QREFELT $ 311))
                          (SEQ
                           (LETT |f0|
                                 (|GUESS;termAsUFPSSUPF2| |f|
                                  (SPADCALL |partitions| |oldPartition|
                                            (QREFELT $ 204))
                                  (CONS (|function| |GUESS;ShiftSF|) $)
                                  (SPADCALL
                                   (SPADCALL (|spadConstant| $ 205)
                                             (SPADCALL (|spadConstant| $ 268)
                                                       (|spadConstant| $ 74)
                                                       (QREFELT $ 269))
                                             (QREFELT $ 270))
                                   (SPADCALL (|spadConstant| $ 264)
                                             (QREFELT $ 265))
                                   (QREFELT $ 271))
                                  $))
                           (LETT |res|
                                 (SPADCALL
                                  (PROGN
                                   (LETT #5# NIL)
                                   (SEQ (LETT |i| NIL) (LETT #4# |exponents|)
                                        G190
                                        (COND
                                         ((OR (ATOM #4#)
                                              (PROGN (LETT |i| (CAR #4#)) NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #5#
                                                (CONS
                                                 (SPADCALL |f0|
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL
                                                              (SPADCALL |q|
                                                                        (QREFELT
                                                                         $
                                                                         232))
                                                              |i|
                                                              (QREFELT $ 124))
                                                             (QREFELT $ 236))
                                                            (SPADCALL
                                                             (|spadConstant| $
                                                                             268)
                                                             (|spadConstant| $
                                                                             74)
                                                             (QREFELT $ 269))
                                                            (QREFELT $ 312))
                                                           (QREFELT $ 313))
                                                 #5#))))
                                        (LETT #4# (CDR #4#)) (GO G190) G191
                                        (EXIT (NREVERSE #5#))))
                                  |res| (QREFELT $ 314)))
                           (LETT |exponents| NIL)
                           (EXIT (LETT |oldPartition| |newPartition|)))))
                        (EXIT
                         (LETT |exponents|
                               (SPADCALL
                                (PROG1
                                    (LETT #3#
                                          (SPADCALL
                                           (SPADCALL |p| (|spadConstant| $ 74)
                                                     (QREFELT $ 183))
                                           (SPADCALL |maxMD|
                                                     (|spadConstant| $ 74)
                                                     (QREFELT $ 76))
                                           (QREFELT $ 289)))
                                  (|check_subtype2| (>= #3# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #3#))
                                |exponents| (QREFELT $ 316)))))
                       (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
                  (LETT |f0|
                        (|GUESS;termAsUFPSSUPF2| |f|
                         (SPADCALL |partitions| |oldPartition| (QREFELT $ 204))
                         (CONS (|function| |GUESS;ShiftSF|) $)
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 205)
                                    (SPADCALL (|spadConstant| $ 268)
                                              (|spadConstant| $ 74)
                                              (QREFELT $ 269))
                                    (QREFELT $ 270))
                          (SPADCALL (|spadConstant| $ 264) (QREFELT $ 265))
                          (QREFELT $ 271))
                         $))
                  (LETT |res|
                        (SPADCALL
                         (PROGN
                          (LETT #2# NIL)
                          (SEQ (LETT |i| NIL) (LETT #1# |exponents|) G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |i| (CAR #1#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #2#
                                       (CONS
                                        (SPADCALL |f0|
                                                  (SPADCALL
                                                   (SPADCALL
                                                    (SPADCALL
                                                     (SPADCALL |q|
                                                               (QREFELT $ 232))
                                                     |i| (QREFELT $ 124))
                                                    (QREFELT $ 236))
                                                   (SPADCALL
                                                    (|spadConstant| $ 268)
                                                    (|spadConstant| $ 74)
                                                    (QREFELT $ 269))
                                                   (QREFELT $ 312))
                                                  (QREFELT $ 313))
                                        #2#))))
                               (LETT #1# (CDR #1#)) (GO G190) G191
                               (EXIT (NREVERSE #2#))))
                         |res| (QREFELT $ 314)))
                  (EXIT
                   (SPADCALL (SPADCALL |res| (QREFELT $ 317))
                             (QREFELT $ 177))))))))) 

(SDEFUN |GUESS;ADEEXPRRStreamMixShift|
        ((|q| |Symbol|) (|f| EXPRR) (|xx| |Symbol|)
         (|partitions| |Stream| (|List| (|Integer|)))
         (|maxMD| |NonNegativeInteger|) ($ |Stream| EXPRR))
        (SPROG ((|s| (|Stream| EXPRR)))
               (SEQ
                (LETT |s|
                      (|GUESS;ADEEXPRRStream| |f| |xx| |partitions|
                       (CONS (|function| |GUESS;ShiftSX|) $)
                       (CONS (|function| |GUESS;diff1X|) $) $))
                (EXIT
                 (SPADCALL |s|
                           (CONS #'|GUESS;ADEEXPRRStreamMixShift!0|
                                 (VECTOR $ |maxMD| |xx| |q|))
                           (QREFELT $ 320)))))) 

(SDEFUN |GUESS;ADEEXPRRStreamMixShift!0| ((|z1| NIL) ($$ NIL))
        (PROG (|q| |xx| |maxMD| $)
          (LETT |q| (QREFELT $$ 3))
          (LETT |xx| (QREFELT $$ 2))
          (LETT |maxMD| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;qSubstEXPRR| |q| |xx| |z1| |maxMD| $))))) 

(SDEFUN |GUESS;shift_hp_aux|
        ((|q| |Symbol|) (|l1| |List| (|GuessOption|))
         ($ |Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
          (|:| |guessStream|
               (|Mapping| (|Stream| (|UnivariateFormalPowerSeries| F))
                          (|UnivariateFormalPowerSeries| F)))
          (|:| |guessModGen|
               (|Mapping|
                (|Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
                           (|Integer|) (|Integer|))
                (|NonNegativeInteger|)))
          (|:| |testGen|
               (|Mapping|
                (|Mapping|
                 (|Vector|
                  (|UnivariateFormalPowerSeries|
                   (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                 (|UnivariateFormalPowerSeries|
                  (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                (|List| (|PositiveInteger|))))
          (|:| |exprStream| (|Mapping| (|Stream| EXPRR) EXPRR (|Symbol|)))
          (|:| |kind| (|Symbol|)) (|:| |qvar| (|Symbol|))
          (|:| A
               (|Mapping| S (|NonNegativeInteger|) (|NonNegativeInteger|)
                          (|SparseUnivariatePolynomial| S)))
          (|:| AF
               (|Mapping|
                (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))
                (|NonNegativeInteger|) (|NonNegativeInteger|)
                (|UnivariateFormalPowerSeries|
                 (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
          (|:| AX (|Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|) EXPRR))
          (|:| C (|Mapping| (|List| S) (|NonNegativeInteger|)))))
        (SPROG
         ((|degrees| (|Stream| (|NonNegativeInteger|)))
          (|maxMD| (|NonNegativeInteger|))
          (|partitions| (|Stream| (|List| (|Integer|)))))
         (SEQ
          (COND
           ((SPADCALL (SPADCALL |l1| (QREFELT $ 199)) '|displayAsRec|
                      (QREFELT $ 222))
            (|error|
             (SPADCALL "Guess: no support for the qShift operator"
                       " with displayAsGF" (QREFELT $ 42))))
           (#1='T
            (SEQ (LETT |partitions| (|GUESS;FilteredPartitionStream| |l1| $))
                 (LETT |maxMD| (SPADCALL |l1| (QREFELT $ 198)))
                 (EXIT
                  (COND
                   ((ZEROP |maxMD|)
                    (SEQ
                     (LETT |degrees| (|GUESS;ADEdegreeStream| |partitions| $))
                     (EXIT
                      (VECTOR |degrees|
                              (CONS #'|GUESS;shift_hp_aux!0|
                                    (VECTOR $ |partitions|))
                              (CONS #'|GUESS;shift_hp_aux!1|
                                    (VECTOR |degrees| $ |partitions|))
                              (CONS #'|GUESS;shift_hp_aux!2|
                                    (VECTOR $ |partitions|))
                              (CONS #'|GUESS;shift_hp_aux!3|
                                    (VECTOR $ |partitions|))
                              '|qshiftHP| |q|
                              (CONS #'|GUESS;shift_hp_aux!4| (VECTOR $ |q|))
                              (CONS #'|GUESS;shift_hp_aux!5| (VECTOR $ |q|))
                              (CONS #'|GUESS;shift_hp_aux!6| (VECTOR $ |q|))
                              (CONS #'|GUESS;shift_hp_aux!7|
                                    (VECTOR $ |q|))))))
                   (#1#
                    (SEQ
                     (LETT |degrees|
                           (|GUESS;ADEdegreeStreamMixShift| |partitions|
                            |maxMD| $))
                     (EXIT
                      (VECTOR |degrees|
                              (CONS #'|GUESS;shift_hp_aux!8|
                                    (VECTOR $ |maxMD| |partitions| |q|))
                              (CONS #'|GUESS;shift_hp_aux!9|
                                    (VECTOR |maxMD| $ |degrees| |partitions|))
                              (CONS #'|GUESS;shift_hp_aux!10|
                                    (VECTOR $ |maxMD| |partitions| |q|))
                              (CONS #'|GUESS;shift_hp_aux!11|
                                    (VECTOR $ |maxMD| |partitions| |q|))
                              '|qmixed| |q|
                              (CONS (|function| |GUESS;ShiftA|) $)
                              (CONS (|function| |GUESS;ShiftAF|) $)
                              (CONS (|function| |GUESS;ShiftAX|) $)
                              (CONS (|function| |GUESS;ShiftC|) $))))))))))))) 

(SDEFUN |GUESS;shift_hp_aux!11| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG (|q| |partitions| |maxMD| $)
          (LETT |q| (QREFELT $$ 3))
          (LETT |partitions| (QREFELT $$ 2))
          (LETT |maxMD| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEEXPRRStreamMixShift| |q| |z1| |z2| |partitions| |maxMD|
             $))))) 

(SDEFUN |GUESS;shift_hp_aux!10| ((|l| NIL) ($$ NIL))
        (PROG (|q| |partitions| |maxMD| $)
          (LETT |q| (QREFELT $$ 3))
          (LETT |partitions| (QREFELT $$ 2))
          (LETT |maxMD| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEtestMixShiftGen| |q| |partitions| |maxMD| |l| $))))) 

(SDEFUN |GUESS;shift_hp_aux!9| ((|o| NIL) ($$ NIL))
        (PROG (|partitions| |degrees| $ |maxMD|)
          (LETT |partitions| (QREFELT $$ 3))
          (LETT |degrees| (QREFELT $$ 2))
          (LETT $ (QREFELT $$ 1))
          (LETT |maxMD| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEguessModGen2Mixed| |partitions|
             (SPADCALL |degrees| |o| (QREFELT $ 267)) |maxMD| |o| $))))) 

(SDEFUN |GUESS;shift_hp_aux!8| ((|z1| NIL) ($$ NIL))
        (PROG (|q| |partitions| |maxMD| $)
          (LETT |q| (QREFELT $$ 3))
          (LETT |partitions| (QREFELT $$ 2))
          (LETT |maxMD| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEguessStreamMixShift| |q| |z1| |partitions| |maxMD| $))))) 

(SDEFUN |GUESS;shift_hp_aux!7| ((|z1| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;qShiftC| |q| |z1| $))))) 

(SDEFUN |GUESS;shift_hp_aux!6| ((|z1| NIL) (|z2| NIL) (|z3| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;qShiftAX| |q| |z1| |z2| |z3| $))))) 

(SDEFUN |GUESS;shift_hp_aux!5| ((|z1| NIL) (|z2| NIL) (|z3| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;qShiftAF| |q| |z1| |z2| |z3| $))))) 

(SDEFUN |GUESS;shift_hp_aux!4| ((|z1| NIL) (|z2| NIL) (|z3| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;qShiftA| |q| |z1| |z2| |z3| $))))) 

(SDEFUN |GUESS;shift_hp_aux!3| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEEXPRRStream| |z1| |z2| |partitions|
             (CONS (|function| |GUESS;ShiftSX|) $)
             (CONS (|function| |GUESS;diff1X|) $) $))))) 

(SDEFUN |GUESS;shift_hp_aux!2| ((|l| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((#1=#:G1161 NIL) (|i| NIL) (#2=#:G1160 NIL))
                   (SEQ
                    (|GUESS;ADEtestGen2|
                     (PROGN
                      (LETT #2# NIL)
                      (SEQ (LETT |i| NIL) (LETT #1# |l|) G190
                           (COND
                            ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT #2#
                                   (CONS
                                    (SPADCALL |partitions| |i| (QREFELT $ 204))
                                    #2#))))
                           (LETT #1# (CDR #1#)) (GO G190) G191
                           (EXIT (NREVERSE #2#))))
                     (CONS (|function| |GUESS;ShiftSF|) $)
                     (SPADCALL
                      (SPADCALL (|spadConstant| $ 205)
                                (SPADCALL (|spadConstant| $ 268)
                                          (|spadConstant| $ 74)
                                          (QREFELT $ 269))
                                (QREFELT $ 270))
                      (SPADCALL (|spadConstant| $ 264) (QREFELT $ 265))
                      (QREFELT $ 271))
                     $))))))) 

(SDEFUN |GUESS;shift_hp_aux!1| ((|o| NIL) ($$ NIL))
        (PROG (|partitions| $ |degrees|)
          (LETT |partitions| (QREFELT $$ 2))
          (LETT $ (QREFELT $$ 1))
          (LETT |degrees| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEguessModGen2|
             (SPADCALL
              (SPADCALL (SPADCALL |partitions| |o| (QREFELT $ 201))
                        (QREFELT $ 202))
              (QREFELT $ 203))
             (SPADCALL |degrees| |o| (QREFELT $ 267)) $))))) 

(SDEFUN |GUESS;shift_hp_aux!0| ((|z1| NIL) ($$ NIL))
        (PROG (|partitions| $)
          (LETT |partitions| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;ADEguessStream2| |z1| |partitions|
             (CONS (|function| |GUESS;ShiftSS|) $)
             (SPADCALL
              (SPADCALL (|spadConstant| $ 200)
                        (SPADCALL (|spadConstant| $ 63) (|spadConstant| $ 174)
                                  (QREFELT $ 261))
                        (QREFELT $ 262))
              (SPADCALL (|spadConstant| $ 264) (QREFELT $ 265))
              (QREFELT $ 266))
             $))))) 

(SDEFUN |GUESS;shiftHP;SM;81|
        ((|q| |Symbol|)
         ($ |Mapping|
          (|Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
                    (|:| |guessStream|
                         (|Mapping|
                          (|Stream| (|UnivariateFormalPowerSeries| F))
                          (|UnivariateFormalPowerSeries| F)))
                    (|:| |guessModGen|
                         (|Mapping|
                          (|Mapping| (|Vector| (|U32Vector|))
                                     (|List| (|U32Vector|)) (|Integer|)
                                     (|Integer|))
                          (|NonNegativeInteger|)))
                    (|:| |testGen|
                         (|Mapping|
                          (|Mapping|
                           (|Vector|
                            (|UnivariateFormalPowerSeries|
                             (|SparseMultivariatePolynomial| F
                                                             (|NonNegativeInteger|))))
                           (|UnivariateFormalPowerSeries|
                            (|SparseMultivariatePolynomial| F
                                                            (|NonNegativeInteger|))))
                          (|List| (|PositiveInteger|))))
                    (|:| |exprStream|
                         (|Mapping| (|Stream| EXPRR) EXPRR (|Symbol|)))
                    (|:| |kind| (|Symbol|)) (|:| |qvar| (|Symbol|))
                    (|:| A
                         (|Mapping| S (|NonNegativeInteger|)
                                    (|NonNegativeInteger|)
                                    (|SparseUnivariatePolynomial| S)))
                    (|:| AF
                         (|Mapping|
                          (|SparseMultivariatePolynomial| F
                                                          (|NonNegativeInteger|))
                          (|NonNegativeInteger|) (|NonNegativeInteger|)
                          (|UnivariateFormalPowerSeries|
                           (|SparseMultivariatePolynomial| F
                                                           (|NonNegativeInteger|)))))
                    (|:| AX
                         (|Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|)
                                    EXPRR))
                    (|:| C (|Mapping| (|List| S) (|NonNegativeInteger|))))
          (|List| (|GuessOption|))))
        (SPROG NIL (CONS #'|GUESS;shiftHP;SM;81!0| (VECTOR $ |q|)))) 

(SDEFUN |GUESS;shiftHP;SM;81!0| ((|l1| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;shift_hp_aux| |q| |l1| $))))) 

(SDEFUN |GUESS;makeEXPRR|
        ((DAX |Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|) EXPRR)
         (|x| |Symbol|) (|p| |SparseUnivariatePolynomial| F) (|expr| EXPRR)
         ($ EXPRR))
        (COND ((SPADCALL |p| (QREFELT $ 322)) (|spadConstant| $ 246))
              ('T
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL |p| (QREFELT $ 323)) (QREFELT $ 10))
                 (SPADCALL (SPADCALL |p| (QREFELT $ 324)) |x| |expr| DAX)
                 (QREFELT $ 104))
                (|GUESS;makeEXPRR| DAX |x| (SPADCALL |p| (QREFELT $ 325))
                 |expr| $)
                (QREFELT $ 93))))) 

(SDEFUN |GUESS;list2UFPSF|
        ((|list| |List| F) ($ |UnivariateFormalPowerSeries| F))
        (SPADCALL (SPADCALL |list| (QREFELT $ 327)) (QREFELT $ 328))) 

(SDEFUN |GUESS;list2UFPSSUPF|
        ((|list| |List| F)
         ($ |UnivariateFormalPowerSeries|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
        (SPROG
         ((|l2|
           (|Stream|
            (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
          (|s1| (|Stream| (|Integer|)))
          (|l1|
           (|Stream|
            (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
          (#1=#:G1209 NIL) (|e| NIL) (#2=#:G1208 NIL))
         (SEQ
          (LETT |l1|
                (SPADCALL
                 (PROGN
                  (LETT #2# NIL)
                  (SEQ (LETT |e| NIL) (LETT #1# |list|) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (SPADCALL |e| (QREFELT $ 236)) #2#))))
                       (LETT #1# (CDR #1#)) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT $ 331)))
          (LETT |s1| (SPADCALL (ELT $ 69) 0 (QREFELT $ 72)))
          (LETT |l2|
                (SPADCALL (CONS #'|GUESS;list2UFPSSUPF!0| $) |s1|
                          (QREFELT $ 336)))
          (EXIT
           (SPADCALL (SPADCALL |l1| |l2| (QREFELT $ 337)) (QREFELT $ 338)))))) 

(SDEFUN |GUESS;list2UFPSSUPF!0| ((|i| NIL) ($ NIL))
        (SPROG ((#1=#:G1204 NIL))
               (SPADCALL (|spadConstant| $ 63)
                         (SPADCALL (|spadConstant| $ 174)
                                   (PROG1 (LETT #1# |i|)
                                     (|check_subtype2| (>= #1# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #1#))
                                   (QREFELT $ 333))
                         (QREFELT $ 334)))) 

(SDEFUN |GUESS;SUPF2SUPSUPF|
        ((|p| |SparseUnivariatePolynomial| F)
         ($ |SparseUnivariatePolynomial|
          (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
        (SPADCALL (ELT $ 236) |p| (QREFELT $ 342))) 

(SDEFUN |GUESS;UFPSF2SUPF|
        ((|f| |UnivariateFormalPowerSeries| F) (|deg| |NonNegativeInteger|)
         ($ |SparseUnivariatePolynomial| F))
        (SPADCALL (SPADCALL |f| |deg| (QREFELT $ 344)) (QREFELT $ 345))) 

(SDEFUN |GUESS;getListSUPF|
        ((|s| |List| (|UnivariateFormalPowerSeries| F))
         (|deg| |NonNegativeInteger|)
         ($ |List| (|SparseUnivariatePolynomial| F)))
        (SPROG NIL
               (SPADCALL (CONS #'|GUESS;getListSUPF!0| (VECTOR $ |deg|)) |s|
                         (QREFELT $ 349)))) 

(SDEFUN |GUESS;getListSUPF!0| ((|z1| NIL) ($$ NIL))
        (PROG (|deg| $)
          (LETT |deg| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN (PROGN (|GUESS;UFPSF2SUPF| |z1| |deg| $))))) 

(SDEFUN |GUESS;guessInterpolateModular|
        ((|lists| |List| (|List| F)) (|degs| |List| (|Integer|))
         (|o| |NonNegativeInteger|) (|degreeLoss| |Integer|)
         (|guessDegree| |NonNegativeInteger|)
         (D |Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
          (|:| |guessStream|
               (|Mapping| (|Stream| (|UnivariateFormalPowerSeries| F))
                          (|UnivariateFormalPowerSeries| F)))
          (|:| |guessModGen|
               (|Mapping|
                (|Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
                           (|Integer|) (|Integer|))
                (|NonNegativeInteger|)))
          (|:| |testGen|
               (|Mapping|
                (|Mapping|
                 (|Vector|
                  (|UnivariateFormalPowerSeries|
                   (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                 (|UnivariateFormalPowerSeries|
                  (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                (|List| (|PositiveInteger|))))
          (|:| |exprStream| (|Mapping| (|Stream| EXPRR) EXPRR (|Symbol|)))
          (|:| |kind| (|Symbol|)) (|:| |qvar| (|Symbol|))
          (|:| A
               (|Mapping| S (|NonNegativeInteger|) (|NonNegativeInteger|)
                          (|SparseUnivariatePolynomial| S)))
          (|:| AF
               (|Mapping|
                (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))
                (|NonNegativeInteger|) (|NonNegativeInteger|)
                (|UnivariateFormalPowerSeries|
                 (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
          (|:| AX (|Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|) EXPRR))
          (|:| C (|Mapping| (|List| S) (|NonNegativeInteger|))))
         (|options| |List| (|GuessOption|))
         ($ |Union| (|Matrix| (|SparseUnivariatePolynomial| S)) (|Boolean|)))
        (SPROG
         ((|check|
           (|Mapping| (|Union| "good" "reject" "no_solution")
                      (|List| (|SparseUnivariatePolynomial| S))))
          (#1=#:G1270 NIL) (|i| NIL) (#2=#:G1269 NIL)
          (|deg|
           (|Record| (|:| |quotient| (|NonNegativeInteger|))
                     (|:| |remainder| (|NonNegativeInteger|))))
          (#3=#:G1268 NIL) (#4=#:G1267 NIL) (#5=#:G1266 NIL) (#6=#:G1265 NIL)
          (|maxD| (|Union| (|NonNegativeInteger|) "arbitrary"))
          (#7=#:G1221 NIL) (#8=#:G1263 NIL) (|del| (|Integer|))
          (|leadingZeros| (|Integer|)) (#9=#:G1264 NIL) (|el| NIL)
          (|sigma| (|NonNegativeInteger|)) (#10=#:G1219 NIL)
          (|list| (|List| F)))
         (SEQ
          (EXIT
           (SEQ (LETT |list| (|SPADfirst| |lists|))
                (LETT |sigma|
                      (PROG1 (LETT #10# (- (LENGTH |list|) |degreeLoss|))
                        (|check_subtype2| (>= #10# 0) '(|NonNegativeInteger|)
                                          '(|Integer|) #10#)))
                (LETT |leadingZeros| 0)
                (SEQ (LETT |el| NIL) (LETT #9# |list|) G190
                     (COND
                      ((OR (ATOM #9#) (PROGN (LETT |el| (CAR #9#)) NIL)
                           (NULL (SPADCALL |el| (QREFELT $ 350))))
                       (GO G191)))
                     (SEQ (EXIT (LETT |leadingZeros| (+ |leadingZeros| 1))))
                     (LETT #9# (CDR #9#)) (GO G190) G191 (EXIT NIL))
                (COND
                 ((> |leadingZeros| |degreeLoss|)
                  (SEQ (LETT |del| (- |leadingZeros| |degreeLoss|))
                       (EXIT
                        (COND
                         ((> |del| |guessDegree|)
                          (PROGN (LETT #8# (CONS 1 NIL)) (GO #11=#:G1262)))
                         (#12='T
                          (LETT |guessDegree|
                                (PROG1 (LETT #7# (- |guessDegree| |del|))
                                  (|check_subtype2| (>= #7# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #7#)))))))))
                (COND
                 ((NULL (SPADCALL |options| (QREFELT $ 351)))
                  (SEQ (LETT |maxD| (SPADCALL |options| (QREFELT $ 352)))
                       (EXIT
                        (COND
                         ((QEQCAR |maxD| 0)
                          (COND
                           ((< (* (QCDR |maxD|) |o|) |guessDegree|)
                            (LETT |degs|
                                  (PROGN
                                   (LETT #6# NIL)
                                   (SEQ (LETT |i| 1) (LETT #5# |o|) G190
                                        (COND
                                         ((|greater_SI| |i| #5#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #6# (CONS (QCDR |maxD|) #6#))))
                                        (LETT |i| (|inc_SI| |i|)) (GO G190)
                                        G191 (EXIT (NREVERSE #6#))))))
                           (#12#
                            (SEQ (LETT |deg| (DIVIDE2 |guessDegree| |o|))
                                 (EXIT
                                  (LETT |degs|
                                        (PROGN
                                         (LETT #4# NIL)
                                         (SEQ (LETT |i| 1) (LETT #3# |o|) G190
                                              (COND
                                               ((|greater_SI| |i| #3#)
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #4#
                                                      (CONS
                                                       (COND
                                                        ((<= |i| (QCDR |deg|))
                                                         (+ (QCAR |deg|) 1))
                                                        ('T (QCAR |deg|)))
                                                       #4#))))
                                              (LETT |i| (|inc_SI| |i|))
                                              (GO G190) G191
                                              (EXIT (NREVERSE #4#))))))))))
                         (#12#
                          (SEQ (LETT |deg| (DIVIDE2 |guessDegree| |o|))
                               (EXIT
                                (LETT |degs|
                                      (PROGN
                                       (LETT #2# NIL)
                                       (SEQ (LETT |i| 1) (LETT #1# |o|) G190
                                            (COND
                                             ((|greater_SI| |i| #1#)
                                              (GO G191)))
                                            (SEQ
                                             (EXIT
                                              (LETT #2#
                                                    (CONS
                                                     (COND
                                                      ((<= |i| (QCDR |deg|))
                                                       (+ (QCAR |deg|) 1))
                                                      ('T (QCAR |deg|)))
                                                     #2#))))
                                            (LETT |i| (|inc_SI| |i|)) (GO G190)
                                            G191
                                            (EXIT (NREVERSE #2#)))))))))))))
                (LETT |check|
                      (CONS #'|GUESS;guessInterpolateModular!0|
                            (VECTOR $ |sigma| |options| D |o| |list|)))
                (COND
                 ((QEQCAR (SPADCALL |options| (QREFELT $ 354)) 1)
                  (LETT |check|
                        (SPADCALL |check| |lists| (QVELT D 5) (QVELT D 6)
                                  |sigma| (SPADCALL |o| (QVELT D 2))
                                  (QREFELT $ 358))))
                 ((QEQCAR (SPADCALL |options| (QREFELT $ 354)) 0)
                  (SEQ
                   (COND
                    ((SPADCALL |options| (QREFELT $ 359))
                     (SPADCALL "Guess: skipping checks" (QREFELT $ 361))))
                   (EXIT
                    (LETT |check|
                          (LIST #'|GUESS;guessInterpolateModular!1|)))))
                 (#12#
                  (LETT |check|
                        (CONS #'|GUESS;guessInterpolateModular!2|
                              (VECTOR $ |sigma| |options| D |o| |list|)))))
                (EXIT
                 (SPADCALL |lists| |degs| (QVELT D 5) (QVELT D 6) |sigma|
                           (SPADCALL |o| (QVELT D 2)) |check|
                           (QREFELT $ 363)))))
          #11# (EXIT #8#)))) 

(SDEFUN |GUESS;guessInterpolateModular!2| ((|x| NIL) ($$ NIL))
        (PROG (|list| |o| D |options| |sigma| $)
          (LETT |list| (QREFELT $$ 5))
          (LETT |o| (QREFELT $$ 4))
          (LETT D (QREFELT $$ 3))
          (LETT |options| (QREFELT $$ 2))
          (LETT |sigma| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;checkInterpolant| |list| |o| |x| D |options| |sigma| $))))) 

(SDEFUN |GUESS;guessInterpolateModular!1| ((|x| NIL) ($$ NIL)) (CONS 0 "good")) 

(SDEFUN |GUESS;guessInterpolateModular!0| ((|x| NIL) ($$ NIL))
        (PROG (|list| |o| D |options| |sigma| $)
          (LETT |list| (QREFELT $$ 5))
          (LETT |o| (QREFELT $$ 4))
          (LETT D (QREFELT $$ 3))
          (LETT |options| (QREFELT $$ 2))
          (LETT |sigma| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (|GUESS;checkInterpolant| |list| |o| |x| D |options| |sigma| $))))) 

(SDEFUN |GUESS;guessInterpolateFFFG|
        ((|lists| |List| (|List| F)) (|degs| |List| (|Integer|))
         (|o| |NonNegativeInteger|) (|guessDegree| |NonNegativeInteger|)
         (D |Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
          (|:| |guessStream|
               (|Mapping| #1=(|Stream| (|UnivariateFormalPowerSeries| F))
                          (|UnivariateFormalPowerSeries| F)))
          (|:| |guessModGen|
               (|Mapping|
                (|Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
                           (|Integer|) (|Integer|))
                (|NonNegativeInteger|)))
          (|:| |testGen|
               (|Mapping|
                (|Mapping|
                 (|Vector|
                  (|UnivariateFormalPowerSeries|
                   (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                 (|UnivariateFormalPowerSeries|
                  (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                (|List| (|PositiveInteger|))))
          (|:| |exprStream| (|Mapping| (|Stream| EXPRR) EXPRR (|Symbol|)))
          (|:| |kind| (|Symbol|)) (|:| |qvar| (|Symbol|))
          (|:| A
               (|Mapping| S (|NonNegativeInteger|) (|NonNegativeInteger|)
                          (|SparseUnivariatePolynomial| S)))
          (|:| AF
               (|Mapping|
                (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))
                (|NonNegativeInteger|) (|NonNegativeInteger|)
                (|UnivariateFormalPowerSeries|
                 (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
          (|:| AX (|Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|) EXPRR))
          (|:| C (|Mapping| (|List| S) (|NonNegativeInteger|))))
         (|options| |List| (|GuessOption|))
         ($ |Matrix| (|SparseUnivariatePolynomial| S)))
        (SPROG
         ((#2=#:G1354 NIL) (#3=#:G1376 NIL) (|j| NIL) (|c| (S))
          (|cl| (|List| S)) (#4=#:G1375 NIL) (#5=#:G1374 NIL) (#6=#:G1373 NIL)
          (#7=#:G1371 NIL) (|i1| NIL) (#8=#:G1372 NIL) (|i2| NIL)
          (|Mr| (|Matrix| (|SparseUnivariatePolynomial| S)))
          (|m| (|NonNegativeInteger|)) (|rl| (|List| (|Integer|)))
          (|ce| (|List| (|SparseUnivariatePolynomial| S))) (#9=#:G1370 NIL)
          (|i| NIL) (M (|Matrix| (|SparseUnivariatePolynomial| S)))
          (|vguessListF| (|Vector| (|SparseUnivariatePolynomial| F)))
          (|vguessList| (|Vector| (|SparseUnivariatePolynomial| S)))
          (|guessPolys| (|List| (|SparseUnivariatePolynomial| F)))
          (#10=#:G1334 NIL)
          (|guessList| (|List| (|UnivariateFormalPowerSeries| F)))
          (|guessS| #1#) (|sumEta| (|NonNegativeInteger|))
          (|eta| (|List| (|NonNegativeInteger|))) (#11=#:G1369 NIL)
          (#12=#:G1368 NIL)
          (|deg|
           (|Record| (|:| |quotient| (|NonNegativeInteger|))
                     (|:| |remainder| (|NonNegativeInteger|))))
          (#13=#:G1296 NIL) (#14=#:G1367 NIL) (#15=#:G1366 NIL)
          (#16=#:G1285 NIL) (#17=#:G1365 NIL) (#18=#:G1364 NIL)
          (|maxD| (|Union| (|NonNegativeInteger|) "arbitrary"))
          (#19=#:G1273 NIL) (#20=#:G1363 NIL) (|d| NIL) (#21=#:G1362 NIL)
          (|list| (|List| F)))
         (SEQ (LETT |list| (|SPADfirst| |lists|))
              (COND
               ((SPADCALL |options| (QREFELT $ 359))
                (SPADCALL "Guess: using FFFG" (QREFELT $ 361))))
              (COND
               ((SPADCALL |options| (QREFELT $ 351))
                (SEQ
                 (LETT |eta|
                       (PROGN
                        (LETT #21# NIL)
                        (SEQ (LETT |d| NIL) (LETT #20# |degs|) G190
                             (COND
                              ((OR (ATOM #20#)
                                   (PROGN (LETT |d| (CAR #20#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #21#
                                     (CONS
                                      (PROG1 (LETT #19# |d|)
                                        (|check_subtype2| (>= #19# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #19#))
                                      #21#))))
                             (LETT #20# (CDR #20#)) (GO G190) G191
                             (EXIT (NREVERSE #21#)))))
                 (EXIT
                  (SPADCALL |eta| 1 (+ (SPADCALL |eta| 1 (QREFELT $ 364)) 1)
                            (QREFELT $ 365)))))
               (#22='T
                (SEQ (LETT |maxD| (SPADCALL |options| (QREFELT $ 352)))
                     (EXIT
                      (COND
                       ((QEQCAR |maxD| 0)
                        (COND
                         ((< (* (QCDR |maxD|) |o|) |guessDegree|)
                          (LETT |eta|
                                (PROGN
                                 (LETT #18# NIL)
                                 (SEQ (LETT |i| 1) (LETT #17# |o|) G190
                                      (COND
                                       ((|greater_SI| |i| #17#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #18#
                                              (CONS
                                               (COND
                                                ((< |i| |o|)
                                                 (+ (QCDR |maxD|) 1))
                                                ('T (QCDR |maxD|)))
                                               #18#))))
                                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                      (EXIT (NREVERSE #18#))))))
                         (#22#
                          (SEQ
                           (LETT |deg|
                                 (DIVIDE2
                                  (PROG1
                                      (LETT #16# (- (+ |guessDegree| |o|) 1))
                                    (|check_subtype2| (>= #16# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #16#))
                                  |o|))
                           (EXIT
                            (LETT |eta|
                                  (PROGN
                                   (LETT #15# NIL)
                                   (SEQ (LETT |i| 1) (LETT #14# |o|) G190
                                        (COND
                                         ((|greater_SI| |i| #14#) (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #15#
                                                (CONS
                                                 (COND
                                                  ((<= |i| (QCDR |deg|))
                                                   (+ (QCAR |deg|) 1))
                                                  ('T (QCAR |deg|)))
                                                 #15#))))
                                        (LETT |i| (|inc_SI| |i|)) (GO G190)
                                        G191 (EXIT (NREVERSE #15#))))))))))
                       (#22#
                        (SEQ
                         (LETT |deg|
                               (DIVIDE2
                                (PROG1 (LETT #13# (- (+ |guessDegree| |o|) 1))
                                  (|check_subtype2| (>= #13# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #13#))
                                |o|))
                         (EXIT
                          (LETT |eta|
                                (PROGN
                                 (LETT #12# NIL)
                                 (SEQ (LETT |i| 1) (LETT #11# |o|) G190
                                      (COND
                                       ((|greater_SI| |i| #11#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #12#
                                              (CONS
                                               (COND
                                                ((<= |i| (QCDR |deg|))
                                                 (+ (QCAR |deg|) 1))
                                                ('T (QCAR |deg|)))
                                               #12#))))
                                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                      (EXIT (NREVERSE #12#)))))))))))))
              (LETT |sumEta| (SPADCALL (ELT $ 76) |eta| (QREFELT $ 372)))
              (LETT |guessS|
                    (SPADCALL (|GUESS;list2UFPSF| |list| $) (QVELT D 1)))
              (LETT |guessList|
                    (SPADCALL
                     (SPADCALL (SPADCALL |guessS| |o| (QREFELT $ 373))
                               (QREFELT $ 374))
                     (QREFELT $ 375)))
              (LETT |guessPolys|
                    (|GUESS;getListSUPF| |guessList|
                     (PROG1 (LETT #10# (- |sumEta| 1))
                       (|check_subtype2| (>= #10# 0) '(|NonNegativeInteger|)
                                         '(|Integer|) #10#))
                     $))
              (COND
               ((|domainEqual| (QREFELT $ 6) (QREFELT $ 7))
                (SEQ
                 (LETT |vguessList| (SPADCALL |guessPolys| (QREFELT $ 378)))
                 (EXIT
                  (LETT M
                        (SPADCALL (SPADCALL |sumEta| (QVELT D 10)) (QVELT D 7)
                                  |vguessList| |eta| (QREFELT $ 380))))))
               ((|domainEqual| (QREFELT $ 6) (|Fraction| (QREFELT $ 7)))
                (SEQ
                 (LETT |vguessListF| (SPADCALL |guessPolys| (QREFELT $ 382)))
                 (EXIT
                  (LETT M
                        (SPADCALL (SPADCALL |sumEta| (QVELT D 10)) (QVELT D 7)
                                  |vguessListF| |eta| (QREFELT $ 384))))))
               (#22#
                (|error|
                 (SPADCALL "Guess: type parameter F should be either equal to"
                           " S or equal to Fraction S" (QREFELT $ 42)))))
              (LETT |rl| NIL)
              (SEQ (LETT |i| 1) (LETT #9# (ANCOLS M)) G190
                   (COND ((|greater_SI| |i| #9#) (GO G191)))
                   (SEQ
                    (LETT |ce|
                          (SPADCALL (SPADCALL M |i| (QREFELT $ 385))
                                    (QREFELT $ 386)))
                    (EXIT
                     (COND
                      ((QEQCAR
                        (|GUESS;checkInterpolant| |list| |o|
                         (SPADCALL (SPADCALL M |i| (QREFELT $ 385))
                                   (QREFELT $ 386))
                         D |options| |guessDegree| $)
                        0)
                       (LETT |rl| (CONS |i| |rl|))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND ((NULL |rl|) (MAKE_MATRIX 0 0))
                     (#22#
                      (SEQ (LETT |rl| (NREVERSE |rl|)) (LETT |m| (ANROWS M))
                           (LETT |Mr|
                                 (MAKE_MATRIX1 |m| (LENGTH |rl|)
                                               (|spadConstant| $ 387)))
                           (SEQ (LETT |i2| NIL) (LETT #8# |rl|) (LETT |i1| 1)
                                (LETT #7# (LENGTH |rl|)) G190
                                (COND
                                 ((OR (|greater_SI| |i1| #7#) (ATOM #8#)
                                      (PROGN (LETT |i2| (CAR #8#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (COND
                                  ((|HasCategory| (QREFELT $ 7) '(|Field|))
                                   (SEQ (LETT |c| (|spadConstant| $ 144))
                                        (EXIT
                                         (SEQ (LETT |j| 1) (LETT #6# |m|) G190
                                              (COND
                                               ((OR (|greater_SI| |j| #6#)
                                                    (NULL
                                                     (SPADCALL |c|
                                                               (QREFELT $
                                                                        388))))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT |c|
                                                      (SPADCALL
                                                       (SPADCALL M |j| |i2|
                                                                 (QREFELT $
                                                                          389))
                                                       (QREFELT $ 390)))))
                                              (LETT |j| (|inc_SI| |j|))
                                              (GO G190) G191 (EXIT NIL)))))
                                  ('T
                                   (SEQ
                                    (LETT |cl|
                                          (PROGN
                                           (LETT #5# NIL)
                                           (SEQ (LETT |j| 1) (LETT #4# |m|)
                                                G190
                                                (COND
                                                 ((|greater_SI| |j| #4#)
                                                  (GO G191)))
                                                (SEQ
                                                 (EXIT
                                                  (LETT #5#
                                                        (CONS
                                                         (SPADCALL
                                                          (SPADCALL M |j| |i2|
                                                                    (QREFELT $
                                                                             389))
                                                          (QREFELT $ 391))
                                                         #5#))))
                                                (LETT |j| (|inc_SI| |j|))
                                                (GO G190) G191
                                                (EXIT (NREVERSE #5#)))))
                                    (EXIT
                                     (LETT |c|
                                           (SPADCALL |cl| (QREFELT $ 392)))))))
                                 (EXIT
                                  (SEQ (LETT |j| 1) (LETT #3# |m|) G190
                                       (COND
                                        ((|greater_SI| |j| #3#) (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (SPADCALL |Mr| |j| |i1|
                                                   (PROG2
                                                       (LETT #2#
                                                             (SPADCALL
                                                              (SPADCALL M |j|
                                                                        |i2|
                                                                        (QREFELT
                                                                         $
                                                                         389))
                                                              |c|
                                                              (QREFELT $ 393)))
                                                       (QCDR #2#)
                                                     (|check_union2|
                                                      (QEQCAR #2# 0)
                                                      (|SparseUnivariatePolynomial|
                                                       (QREFELT $ 7))
                                                      (|Union|
                                                       (|SparseUnivariatePolynomial|
                                                        (QREFELT $ 7))
                                                       "failed")
                                                      #2#))
                                                   (QREFELT $ 394))))
                                       (LETT |j| (|inc_SI| |j|)) (GO G190) G191
                                       (EXIT NIL))))
                                (LETT |i1|
                                      (PROG1 (|inc_SI| |i1|)
                                        (LETT #8# (CDR #8#))))
                                (GO G190) G191 (EXIT NIL))
                           (EXIT |Mr|)))))))) 

(SDEFUN |GUESS;guessInterpolate3|
        ((|lists| |List| (|List| F)) (|o| |NonNegativeInteger|)
         (|degreeLoss| |Integer|) (|guessDegree| |NonNegativeInteger|)
         (D |Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
          (|:| |guessStream|
               (|Mapping| (|Stream| (|UnivariateFormalPowerSeries| F))
                          (|UnivariateFormalPowerSeries| F)))
          (|:| |guessModGen|
               (|Mapping|
                (|Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
                           (|Integer|) (|Integer|))
                (|NonNegativeInteger|)))
          (|:| |testGen|
               (|Mapping|
                (|Mapping|
                 (|Vector|
                  (|UnivariateFormalPowerSeries|
                   (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                 (|UnivariateFormalPowerSeries|
                  (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                (|List| (|PositiveInteger|))))
          (|:| |exprStream| (|Mapping| (|Stream| EXPRR) EXPRR (|Symbol|)))
          (|:| |kind| (|Symbol|)) (|:| |qvar| (|Symbol|))
          (|:| A
               (|Mapping| S (|NonNegativeInteger|) (|NonNegativeInteger|)
                          (|SparseUnivariatePolynomial| S)))
          (|:| AF
               (|Mapping|
                (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))
                (|NonNegativeInteger|) (|NonNegativeInteger|)
                (|UnivariateFormalPowerSeries|
                 (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
          (|:| AX (|Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|) EXPRR))
          (|:| C (|Mapping| (|List| S) (|NonNegativeInteger|))))
         (|options| |List| (|GuessOption|))
         (|vs| |Stream| (|List| (|Integer|)))
         ($ |Stream| (|Matrix| (|SparseUnivariatePolynomial| S))))
        (SPROG NIL
               (SEQ
                (SPADCALL
                 (CONS #'|GUESS;guessInterpolate3!1|
                       (VECTOR |options| D |guessDegree| |degreeLoss| |o|
                               |lists| $ |vs|))
                 (QREFELT $ 406))))) 

(SDEFUN |GUESS;guessInterpolate3!1| (($$ NIL))
        (PROG (|vs| $ |lists| |o| |degreeLoss| |guessDegree| D |options|)
          (LETT |vs| (QREFELT $$ 7))
          (LETT $ (QREFELT $$ 6))
          (LETT |lists| (QREFELT $$ 5))
          (LETT |o| (QREFELT $$ 4))
          (LETT |degreeLoss| (QREFELT $$ 3))
          (LETT |guessDegree| (QREFELT $$ 2))
          (LETT D (QREFELT $$ 1))
          (LETT |options| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|degs| NIL) (M0 NIL) (#1=#:G1393 NIL) (M NIL))
                   (SEQ
                    (EXIT
                     (COND
                      ((OR (SPADCALL |vs| (QREFELT $ 395))
                           (SPADCALL |vs| (QREFELT $ 398)))
                       (SPADCALL (QREFELT $ 397)))
                      ('T
                       (SEQ (LETT |degs| (SPADCALL |vs| (QREFELT $ 399)))
                            (LETT M0
                                  (|GUESS;guessInterpolateModular| |lists|
                                   |degs| |o| |degreeLoss| |guessDegree| D
                                   |options| $))
                            (LETT M
                                  (COND
                                   ((QEQCAR M0 1)
                                    (SEQ
                                     (COND
                                      ((QCDR M0)
                                       (COND
                                        ((SPADCALL
                                          (CONS #'|GUESS;guessInterpolate3!0|
                                                $)
                                          |degs| (QREFELT $ 402))
                                         (EXIT
                                          (|GUESS;guessInterpolateFFFG| |lists|
                                           |degs| |o| |guessDegree| D |options|
                                           $))))))
                                     (EXIT
                                      (PROGN
                                       (LETT #1#
                                             (|GUESS;guessInterpolate3| |lists|
                                              |o| |degreeLoss| |guessDegree| D
                                              |options|
                                              (SPADCALL |vs| (QREFELT $ 403))
                                              $))
                                       (GO #2=#:G1392)))))
                                   ('T (QCDR M0))))
                            (EXIT
                             (SPADCALL M
                                       (|GUESS;guessInterpolate3| |lists| |o|
                                        |degreeLoss| |guessDegree| D |options|
                                        (SPADCALL |vs| (QREFELT $ 403)) $)
                                       (QREFELT $ 404)))))))
                    #2# (EXIT #1#))))))) 

(SDEFUN |GUESS;guessInterpolate3!0| ((|x| NIL) ($ NIL))
        (SPADCALL |x| (|spadConstant| $ 95) (QREFELT $ 400))) 

(SDEFUN |GUESS;listDecr|
        ((|l| |List| (|NonNegativeInteger|)) ($ |List| (|Integer|)))
        (SPADCALL (CONS #'|GUESS;listDecr!0| $) |l| (QREFELT $ 409))) 

(SDEFUN |GUESS;listDecr!0| ((|x| NIL) ($ NIL))
        (SPADCALL |x| (|spadConstant| $ 174) (QREFELT $ 183))) 

(SDEFUN |GUESS;guessInterpolate2|
        ((|lists| |List| (|List| F)) (|o| |NonNegativeInteger|)
         (|degreeLoss| |Integer|) (|guessDegree| |NonNegativeInteger|)
         (D |Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
          (|:| |guessStream|
               (|Mapping| (|Stream| (|UnivariateFormalPowerSeries| F))
                          (|UnivariateFormalPowerSeries| F)))
          (|:| |guessModGen|
               (|Mapping|
                (|Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
                           (|Integer|) (|Integer|))
                (|NonNegativeInteger|)))
          (|:| |testGen|
               (|Mapping|
                (|Mapping|
                 (|Vector|
                  (|UnivariateFormalPowerSeries|
                   (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                 (|UnivariateFormalPowerSeries|
                  (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                (|List| (|PositiveInteger|))))
          (|:| |exprStream| (|Mapping| (|Stream| EXPRR) EXPRR (|Symbol|)))
          (|:| |kind| (|Symbol|)) (|:| |qvar| (|Symbol|))
          (|:| A
               (|Mapping| S (|NonNegativeInteger|) (|NonNegativeInteger|)
                          (|SparseUnivariatePolynomial| S)))
          (|:| AF
               (|Mapping|
                (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))
                (|NonNegativeInteger|) (|NonNegativeInteger|)
                (|UnivariateFormalPowerSeries|
                 (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
          (|:| AX (|Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|) EXPRR))
          (|:| C (|Mapping| (|List| S) (|NonNegativeInteger|))))
         (|options| |List| (|GuessOption|))
         ($ |Stream| (|Matrix| (|SparseUnivariatePolynomial| S))))
        (SPROG
         ((|vs| (|Stream| (|List| (|Integer|))))
          (|vs0| (|Stream| (|List| (|NonNegativeInteger|))))
          (|maxD| (|NonNegativeInteger|))
          (|maxD0| (|Union| (|NonNegativeInteger|) "arbitrary")))
         (SEQ
          (LETT |vs|
                (COND
                 ((SPADCALL |options| (QREFELT $ 351))
                  (SEQ (LETT |maxD0| (SPADCALL |options| (QREFELT $ 352)))
                       (LETT |maxD|
                             (COND ((QEQCAR |maxD0| 0) (QCDR |maxD0|))
                                   (#1='T (- (+ |guessDegree| |o|) 2))))
                       (LETT |vs0|
                             (SPADCALL (+ |guessDegree| |o|) (+ |maxD| 1) |o|
                                       (QREFELT $ 411)))
                       (EXIT
                        (SPADCALL (CONS (|function| |GUESS;listDecr|) $) |vs0|
                                  (QREFELT $ 414)))))
                 (#1#
                  (SPADCALL NIL (SPADCALL (QREFELT $ 415)) (QREFELT $ 416)))))
          (EXIT
           (|GUESS;guessInterpolate3| |lists| |o| |degreeLoss| |guessDegree| D
            |options| |vs| $))))) 

(SDEFUN |GUESS;precCheck|
        ((|list| |List| F) (|resi| |List| (|SparseUnivariatePolynomial| S))
         (|options| |List| (|GuessOption|)) (|sigma| |Integer|)
         (|bad| |Boolean|) ($ |Union| "good" "reject" "no_solution"))
        (SPROG
         ((#1=#:G1451 NIL) (#2=#:G1449 NIL) (|res2| (S)) (|p2val| (S))
          (|p2| (|SparseUnivariatePolynomial| S)) (#3=#:G1461 NIL) (|j| NIL)
          (#4=#:G1448 NIL) (#5=#:G1460 NIL) (|si| (S)) (#6=#:G1459 NIL)
          (|i| NIL) (#7=#:G1450 NIL) (|res1| (S)) (#8=#:G1458 NIL)
          (#9=#:G1457 NIL) (|gl| (|Vector| S)) (#10=#:G1446 NIL)
          (#11=#:G1456 NIL) (#12=#:G1445 NIL) (#13=#:G1455 NIL)
          (#14=#:G1454 NIL) (#15=#:G1447 NIL) (|cden| (S)) (|c2| (S))
          (#16=#:G1415 NIL) (|c1| (S)) (|pp| (S)) (|vd| (S)) (|vi| (F))
          (#17=#:G1453 NIL) (#18=#:G1452 NIL) (|order| (|Integer|))
          (|j0| (|Integer|)) (|svar| (|SingletonAsOrderedSet|))
          (|max_ind| #19=(|Integer|)) (|degree_loss| #19#) (|gl0| (|Vector| F))
          (|m| (|NonNegativeInteger|))
          (|resv| (|Vector| (|SparseUnivariatePolynomial| S)))
          (|homo| (|Boolean|))
          (|homp| (|Union| (|PositiveInteger|) (|Boolean|))))
         (SEQ
          (EXIT
           (SEQ (LETT |homp| (SPADCALL |options| (QREFELT $ 59)))
                (LETT |homo|
                      (COND ((QEQCAR |homp| 1) (QCDR |homp|)) (#20='T 'T)))
                (LETT |resv| (SPADCALL |resi| (QREFELT $ 378)))
                (LETT |m| (QVSIZE |resv|))
                (LETT |gl0| (SPADCALL |list| (QREFELT $ 418)))
                (LETT |degree_loss| (COND (|homo| (- |m| 1)) (#20# (- |m| 2))))
                (COND
                 ((SPADCALL |options| (QREFELT $ 419))
                  (LETT |max_ind| (- (- (QVSIZE |gl0|) |degree_loss|) 1)))
                 (#20# (LETT |max_ind| (- |sigma| 1))))
                (LETT |svar| (SPADCALL (QREFELT $ 421)))
                (LETT |j0| (COND (|homo| 1) (#20# 2))) (LETT |order| 0)
                (EXIT
                 (COND
                  ((|domainEqual| (QREFELT $ 6) (|Fraction| (QREFELT $ 7)))
                   (SEQ (LETT |gl| |gl0|)
                        (SEQ (LETT |i| 0) (LETT #18# |max_ind|) G190
                             (COND ((|greater_SI| |i| #18#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ (LETT |res1| (|spadConstant| $ 144))
                                    (LETT |cden| (|spadConstant| $ 64))
                                    (LETT |si| (SPADCALL |i| (QREFELT $ 422)))
                                    (COND
                                     ((NULL |homo|)
                                      (LETT |res1|
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |resv| 1
                                                        (QREFELT $ 423))
                                              |svar| |si| (QREFELT $ 424))
                                             (QREFELT $ 425)))))
                                    (SEQ (LETT |j| |j0|) (LETT #17# |m|) G190
                                         (COND ((> |j| #17#) (GO G191)))
                                         (SEQ
                                          (LETT |p2|
                                                (SPADCALL |resv| |j|
                                                          (QREFELT $ 423)))
                                          (LETT |p2val|
                                                (SPADCALL
                                                 (SPADCALL |p2| |svar| |si|
                                                           (QREFELT $ 424))
                                                 (QREFELT $ 425)))
                                          (LETT |vi|
                                                (SPADCALL |gl|
                                                          (+
                                                           (- (+ |i| |j|) |j0|)
                                                           1)
                                                          (QREFELT $ 426)))
                                          (LETT |vd|
                                                (SPADCALL |vi| (QREFELT $ 36)))
                                          (LETT |pp|
                                                (SPADCALL |cden| |vd|
                                                          (QREFELT $ 427)))
                                          (LETT |c1|
                                                (PROG2
                                                    (LETT #16#
                                                          (SPADCALL |cden| |pp|
                                                                    (QREFELT $
                                                                             428)))
                                                    (QCDR #16#)
                                                  (|check_union2|
                                                   (QEQCAR #16# 0)
                                                   (QREFELT $ 7)
                                                   (|Union| (QREFELT $ 7)
                                                            #21="failed")
                                                   #16#)))
                                          (LETT |c2|
                                                (PROG2
                                                    (LETT #16#
                                                          (SPADCALL |vd| |pp|
                                                                    (QREFELT $
                                                                             428)))
                                                    (QCDR #16#)
                                                  (|check_union2|
                                                   (QEQCAR #16# 0)
                                                   (QREFELT $ 7)
                                                   (|Union| (QREFELT $ 7) #21#)
                                                   #16#)))
                                          (LETT |res1|
                                                (SPADCALL
                                                 (SPADCALL |c2| |res1|
                                                           (QREFELT $ 429))
                                                 (SPADCALL
                                                  (SPADCALL |p2val| |c1|
                                                            (QREFELT $ 429))
                                                  (SPADCALL |vi|
                                                            (QREFELT $ 35))
                                                  (QREFELT $ 429))
                                                 (QREFELT $ 368)))
                                          (EXIT
                                           (LETT |cden|
                                                 (SPADCALL |cden| |c2|
                                                           (QREFELT $ 429)))))
                                         (LETT |j| (+ |j| 1)) (GO G190) G191
                                         (EXIT NIL))
                                    (EXIT
                                     (COND
                                      ((SPADCALL |res1| (|spadConstant| $ 144)
                                                 (QREFELT $ 430))
                                       (PROGN
                                        (LETT #15#
                                              (COND
                                               ((< |i| |sigma|)
                                                (PROGN
                                                 (LETT #1#
                                                       (CONS 2 "no_solution"))
                                                 (GO #22=#:G1444)))
                                               ('T
                                                (PROGN
                                                 (LETT #1# (CONS 1 "reject"))
                                                 (GO #22#)))))
                                        (GO #23=#:G1419)))))))
                              #23# (EXIT #15#))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT NIL))
                        (COND
                         ((NULL (SPADCALL |options| (QREFELT $ 419)))
                          (PROGN (LETT #1# (CONS 0 "good")) (GO #22#))))
                        (EXIT
                         (COND
                          (|bad|
                           (PROGN (LETT #1# (CONS 1 "reject")) (GO #22#)))
                          (#20#
                           (SEQ
                            (SEQ (LETT |i| 1) (LETT #14# |degree_loss|) G190
                                 (COND ((|greater_SI| |i| #14#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SEQ
                                    (LETT |si|
                                          (SPADCALL (+ |i| |max_ind|)
                                                    (QREFELT $ 422)))
                                    (SEQ (LETT |j| (- |m| |i|)) (LETT #13# |m|)
                                         G190 (COND ((> |j| #13#) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (SEQ
                                            (LETT |p2|
                                                  (SPADCALL |resv| |j|
                                                            (QREFELT $ 423)))
                                            (LETT |p2val|
                                                  (SPADCALL
                                                   (SPADCALL |p2| |svar| |si|
                                                             (QREFELT $ 424))
                                                   (QREFELT $ 425)))
                                            (EXIT
                                             (COND
                                              ((SPADCALL |p2val|
                                                         (|spadConstant| $ 144)
                                                         (QREFELT $ 430))
                                               (PROGN
                                                (LETT #12#
                                                      (PROGN
                                                       (LETT #1#
                                                             (CONS 0 "good"))
                                                       (GO #22#)))
                                                (GO #24=#:G1422)))))))
                                          #24# (EXIT #12#))
                                         (LETT |j| (+ |j| 1)) (GO G190) G191
                                         (EXIT NIL))
                                    (LETT |res2| (|spadConstant| $ 143))
                                    (COND
                                     (|homo|
                                      (LETT |res2|
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |resv| 1
                                                         (QREFELT $ 423))
                                               |svar| |si| (QREFELT $ 424))
                                              (QREFELT $ 425))
                                             (QREFELT $ 49)))))
                                    (SEQ (LETT |j| |j0|)
                                         (LETT #11# (- |m| |i|)) G190
                                         (COND ((> |j| #11#) (GO G191)))
                                         (SEQ
                                          (LETT |p2|
                                                (SPADCALL |resv| |j|
                                                          (QREFELT $ 423)))
                                          (LETT |p2val|
                                                (SPADCALL
                                                 (SPADCALL |p2| |svar| |si|
                                                           (QREFELT $ 424))
                                                 (QREFELT $ 425)))
                                          (EXIT
                                           (LETT |res2|
                                                 (SPADCALL |res2|
                                                           (SPADCALL |p2val|
                                                                     (SPADCALL
                                                                      |gl|
                                                                      (+
                                                                       (-
                                                                        (+
                                                                         (+ |i|
                                                                            |max_ind|)
                                                                         |j|)
                                                                        |j0|)
                                                                       1)
                                                                      (QREFELT
                                                                       $ 426))
                                                                     (QREFELT $
                                                                              431))
                                                           (QREFELT $ 432)))))
                                         (LETT |j| (+ |j| 1)) (GO G190) G191
                                         (EXIT NIL))
                                    (EXIT
                                     (COND
                                      ((SPADCALL |res2| (|spadConstant| $ 143)
                                                 (QREFELT $ 433))
                                       (PROGN
                                        (LETT #10#
                                              (PROGN
                                               (LETT #1# (CONS 1 "reject"))
                                               (GO #22#)))
                                        (GO #25=#:G1426)))))))
                                  #25# (EXIT #10#))
                                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT
                             (PROGN
                              (LETT #1# (CONS 0 "good"))
                              (GO #22#)))))))))
                  ((|domainEqual| (QREFELT $ 6) (QREFELT $ 7))
                   (SEQ (LETT |gl| |gl0|)
                        (SEQ (LETT |i| 0) (LETT #9# |max_ind|) G190
                             (COND ((|greater_SI| |i| #9#) (GO G191)))
                             (SEQ
                              (EXIT
                               (SEQ (LETT |res1| (|spadConstant| $ 144))
                                    (LETT |si| (SPADCALL |i| (QREFELT $ 422)))
                                    (COND
                                     ((NULL |homo|)
                                      (LETT |res1|
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |resv| 1
                                                        (QREFELT $ 423))
                                              |svar| |si| (QREFELT $ 424))
                                             (QREFELT $ 425)))))
                                    (SEQ (LETT |j| |j0|) (LETT #8# |m|) G190
                                         (COND ((> |j| #8#) (GO G191)))
                                         (SEQ
                                          (LETT |p2|
                                                (SPADCALL |resv| |j|
                                                          (QREFELT $ 423)))
                                          (LETT |p2val|
                                                (SPADCALL
                                                 (SPADCALL |p2| |svar| |si|
                                                           (QREFELT $ 424))
                                                 (QREFELT $ 425)))
                                          (EXIT
                                           (LETT |res1|
                                                 (SPADCALL |res1|
                                                           (SPADCALL |p2val|
                                                                     (SPADCALL
                                                                      |gl|
                                                                      (+
                                                                       (-
                                                                        (+ |i|
                                                                           |j|)
                                                                        |j0|)
                                                                       1)
                                                                      (QREFELT
                                                                       $ 435))
                                                                     (QREFELT $
                                                                              429))
                                                           (QREFELT $ 368)))))
                                         (LETT |j| (+ |j| 1)) (GO G190) G191
                                         (EXIT NIL))
                                    (EXIT
                                     (COND
                                      ((SPADCALL |res1| (|spadConstant| $ 144)
                                                 (QREFELT $ 430))
                                       (PROGN
                                        (LETT #7#
                                              (COND
                                               ((< |i| |sigma|)
                                                (PROGN
                                                 (LETT #1#
                                                       (CONS 2 "no_solution"))
                                                 (GO #22#)))
                                               ('T
                                                (PROGN
                                                 (LETT #1# (CONS 1 "reject"))
                                                 (GO #22#)))))
                                        (GO #26=#:G1432)))))))
                              #26# (EXIT #7#))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT NIL))
                        (COND
                         ((NULL (SPADCALL |options| (QREFELT $ 419)))
                          (PROGN (LETT #1# (CONS 0 "good")) (GO #22#))))
                        (EXIT
                         (COND
                          (|bad|
                           (PROGN (LETT #1# (CONS 1 "reject")) (GO #22#)))
                          (#20#
                           (SEQ
                            (SEQ (LETT |i| 1) (LETT #6# |degree_loss|) G190
                                 (COND ((|greater_SI| |i| #6#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (SEQ
                                    (LETT |si|
                                          (SPADCALL (+ |i| |max_ind|)
                                                    (QREFELT $ 422)))
                                    (SEQ (LETT |j| (- |m| |i|)) (LETT #5# |m|)
                                         G190 (COND ((> |j| #5#) (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (SEQ
                                            (LETT |p2|
                                                  (SPADCALL |resv| |j|
                                                            (QREFELT $ 423)))
                                            (LETT |p2val|
                                                  (SPADCALL
                                                   (SPADCALL |p2| |svar| |si|
                                                             (QREFELT $ 424))
                                                   (QREFELT $ 425)))
                                            (EXIT
                                             (COND
                                              ((SPADCALL |p2val|
                                                         (|spadConstant| $ 144)
                                                         (QREFELT $ 430))
                                               (PROGN
                                                (LETT #4#
                                                      (PROGN
                                                       (LETT #1#
                                                             (CONS 0 "good"))
                                                       (GO #22#)))
                                                (GO #27=#:G1435)))))))
                                          #27# (EXIT #4#))
                                         (LETT |j| (+ |j| 1)) (GO G190) G191
                                         (EXIT NIL))
                                    (LETT |res2| (|spadConstant| $ 144))
                                    (COND
                                     (|homo|
                                      (LETT |res2|
                                            (SPADCALL
                                             (SPADCALL
                                              (SPADCALL |resv| 1
                                                        (QREFELT $ 423))
                                              |svar| |si| (QREFELT $ 424))
                                             (QREFELT $ 425)))))
                                    (SEQ (LETT |j| |j0|) (LETT #3# (- |m| |i|))
                                         G190 (COND ((> |j| #3#) (GO G191)))
                                         (SEQ
                                          (LETT |p2|
                                                (SPADCALL |resv| |j|
                                                          (QREFELT $ 423)))
                                          (LETT |p2val|
                                                (SPADCALL
                                                 (SPADCALL |p2| |svar| |si|
                                                           (QREFELT $ 424))
                                                 (QREFELT $ 425)))
                                          (EXIT
                                           (LETT |res2|
                                                 (SPADCALL |res2|
                                                           (SPADCALL |p2val|
                                                                     (SPADCALL
                                                                      |gl|
                                                                      (+
                                                                       (-
                                                                        (+
                                                                         (+ |i|
                                                                            |max_ind|)
                                                                         |j|)
                                                                        |j0|)
                                                                       1)
                                                                      (QREFELT
                                                                       $ 435))
                                                                     (QREFELT $
                                                                              429))
                                                           (QREFELT $ 368)))))
                                         (LETT |j| (+ |j| 1)) (GO G190) G191
                                         (EXIT NIL))
                                    (EXIT
                                     (COND
                                      ((SPADCALL |res2| (|spadConstant| $ 144)
                                                 (QREFELT $ 430))
                                       (PROGN
                                        (LETT #2#
                                              (PROGN
                                               (LETT #1# (CONS 1 "reject"))
                                               (GO #22#)))
                                        (GO #28=#:G1439)))))))
                                  #28# (EXIT #2#))
                                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                 (EXIT NIL))
                            (EXIT
                             (PROGN
                              (LETT #1# (CONS 0 "good"))
                              (GO #22#)))))))))
                  (#20# (|error| "F must be S or Fraction(S)"))))))
          #22# (EXIT #1#)))) 

(SDEFUN |GUESS;checkInterpolant|
        ((|list| |List| F) (|o| |NonNegativeInteger|)
         (|resi| |List| (|SparseUnivariatePolynomial| S))
         (D |Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
          (|:| |guessStream|
               (|Mapping| (|Stream| (|UnivariateFormalPowerSeries| F))
                          (|UnivariateFormalPowerSeries| F)))
          (|:| |guessModGen|
               (|Mapping|
                (|Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
                           (|Integer|) (|Integer|))
                (|NonNegativeInteger|)))
          (|:| |testGen|
               (|Mapping|
                (|Mapping|
                 #1=(|Vector|
                     (|UnivariateFormalPowerSeries|
                      (|SparseMultivariatePolynomial| F
                                                      (|NonNegativeInteger|))))
                 (|UnivariateFormalPowerSeries|
                  (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                (|List| (|PositiveInteger|))))
          (|:| |exprStream| (|Mapping| (|Stream| EXPRR) EXPRR (|Symbol|)))
          (|:| |kind| (|Symbol|)) (|:| |qvar| (|Symbol|))
          (|:| A
               (|Mapping| S (|NonNegativeInteger|) (|NonNegativeInteger|)
                          (|SparseUnivariatePolynomial| S)))
          (|:| AF
               (|Mapping|
                (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))
                (|NonNegativeInteger|) (|NonNegativeInteger|)
                (|UnivariateFormalPowerSeries|
                 (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
          (|:| AX (|Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|) EXPRR))
          (|:| C (|Mapping| (|List| S) (|NonNegativeInteger|))))
         (|options| |List| (|GuessOption|)) (|sigma| |Integer|)
         ($ |Union| "good" "reject" "no_solution"))
        (SPROG
         ((#2=#:G1514 NIL) (#3=#:G1512 NIL) (|order| (|Integer|))
          (|c| (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))
          (|d| NIL) (|dmax| (|NonNegativeInteger|))
          (|resiSUPF|
           (|List|
            (|SparseUnivariatePolynomial|
             (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
          (#4=#:G1519 NIL) (|i| NIL) (#5=#:G1518 NIL) (|testList| #1#)
          (|flist| (|List| (|PositiveInteger|))) (#6=#:G1493 NIL)
          (#7=#:G1517 NIL) (#8=#:G1516 NIL) (|maxPow| (|Integer|))
          (|maxP| (|Union| (|PositiveInteger|) "arbitrary"))
          (|len| (|NonNegativeInteger|)) (|reject_one_term| (|Boolean|))
          (#9=#:G1513 NIL)
          (|nonZeroCoefficients| (|Union| "one" "several" "none"))
          (#10=#:G1515 NIL))
         (SEQ
          (EXIT
           (SEQ
            (COND
             ((SPADCALL |options| (QREFELT $ 359))
              (SPADCALL "Guess: checking solution" (QREFELT $ 361))))
            (LETT |nonZeroCoefficients| (CONS 2 "none"))
            (LETT |reject_one_term| NIL)
            (SEQ
             (EXIT
              (SEQ (LETT |i| 1) (LETT #10# (LENGTH |resi|)) G190
                   (COND ((|greater_SI| |i| #10#) (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL
                        (SPADCALL (SPADCALL |resi| |i| (QREFELT $ 436))
                                  (QREFELT $ 437)))
                       (COND
                        ((QEQCAR |nonZeroCoefficients| 2)
                         (LETT |nonZeroCoefficients| (CONS 0 "one")))
                        ('T
                         (SEQ (LETT |nonZeroCoefficients| (CONS 1 "several"))
                              (EXIT
                               (PROGN
                                (LETT #9# |$NoValue|)
                                (GO #11=#:G1470))))))))))
                   (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL)))
             #11# (EXIT #9#))
            (COND
             ((NULL (QEQCAR |nonZeroCoefficients| 1))
              (COND
               ((NULL (SPADCALL (ELT $ 350) |list| (QREFELT $ 444)))
                (SEQ (LETT |reject_one_term| 'T)
                     (EXIT
                      (COND
                       ((SPADCALL |options| (QREFELT $ 359))
                        (SPADCALL "Guess: encountered single-term solution"
                                  (QREFELT $ 361))))))))))
            (LETT |len| (LENGTH |list|))
            (LETT |maxP| (SPADCALL |options| (QREFELT $ 57)))
            (COND ((QEQCAR |maxP| 0) (LETT |maxPow| (QCDR |maxP|)))
                  (#12='T (LETT |maxPow| (+ |len| 2))))
            (COND
             ((EQL |maxPow| 1)
              (COND
               ((EQUAL (QVELT D 5) '|shiftHP|)
                (EXIT
                 (|GUESS;precCheck| |list| |resi| |options| |sigma|
                  |reject_one_term| $))))))
            (LETT |flist|
                  (PROGN
                   (LETT #8# NIL)
                   (SEQ (LETT |i| 1) (LETT #7# |o|) G190
                        (COND ((|greater_SI| |i| #7#) (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((NULL
                             (SPADCALL (SPADCALL |resi| |i| (QREFELT $ 436))
                                       (QREFELT $ 437)))
                            (LETT #8#
                                  (CONS
                                   (PROG1 (LETT #6# |i|)
                                     (|check_subtype2| (> #6# 0)
                                                       '(|PositiveInteger|)
                                                       '(|NonNegativeInteger|)
                                                       #6#))
                                   #8#))))))
                        (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                        (EXIT (NREVERSE #8#)))))
            (LETT |testList|
                  (SPADCALL (|GUESS;list2UFPSSUPF| |list| $)
                            (SPADCALL |flist| (QVELT D 3))))
            (LETT |resiSUPF|
                  (PROGN
                   (LETT #5# NIL)
                   (SEQ (LETT |i| NIL) (LETT #4# |flist|) G190
                        (COND
                         ((OR (ATOM #4#) (PROGN (LETT |i| (CAR #4#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #5#
                                (CONS
                                 (|GUESS;SUPF2SUPSUPF|
                                  (|GUESS;SUPS2SUPF|
                                   (SPADCALL |resi| |i| (QREFELT $ 436)) $)
                                  $)
                                 #5#))))
                        (LETT #4# (CDR #4#)) (GO G190) G191
                        (EXIT (NREVERSE #5#)))))
            (LETT |order| 0) (LETT |dmax| (* 10 (LENGTH |list|)))
            (SEQ
             (EXIT
              (SEQ (LETT |d| 0) G190 NIL
                   (SEQ
                    (COND
                     ((NULL (SPADCALL |options| (QREFELT $ 419)))
                      (COND
                       ((EQL |d| |sigma|)
                        (PROGN (LETT #2# (CONS 0 "good")) (GO #13=#:G1511))))))
                    (COND
                     (|reject_one_term|
                      (COND
                       ((EQL |d| |sigma|)
                        (PROGN (LETT #2# (CONS 1 "reject")) (GO #13#))))))
                    (LETT |c|
                          (SPADCALL (QVELT D 8) |testList| |d|
                                    (SPADCALL |resiSUPF| (QREFELT $ 447))
                                    (QREFELT $ 448)))
                    (COND
                     ((NULL (SPADCALL |c| (QREFELT $ 449)))
                      (SEQ (LETT |order| |d|)
                           (EXIT
                            (PROGN (LETT #3# |$NoValue|) (GO #14=#:G1504))))))
                    (EXIT
                     (COND
                      ((> |d| |dmax|)
                       (SEQ
                        (SPADCALL
                         (SPADCALL "bailing out from checkInterpolant"
                                   (QREFELT $ 451))
                         (QREFELT $ 452))
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL "please report the input to "
                                    "fricas-devel@googlegroups.com"
                                    (QREFELT $ 42))
                          (QREFELT $ 451))
                         (QREFELT $ 452))
                        (LETT |order| |d|)
                        (EXIT (PROGN (LETT #3# |$NoValue|) (GO #14#))))))))
                   (LETT |d| (|inc_SI| |d|)) (GO G190) G191 (EXIT NIL)))
             #14# (EXIT #3#))
            (EXIT
             (COND
              ((< |order| |sigma|)
               (SEQ
                (SPADCALL
                 (SPADCALL (SPADCALL "Order too low: " (QREFELT $ 451))
                           (SPADCALL |order| (QREFELT $ 453)) (QREFELT $ 454))
                 (QREFELT $ 452))
                (SPADCALL
                 (SPADCALL (SPADCALL "sigma: " (QREFELT $ 451))
                           (SPADCALL |sigma| (QREFELT $ 453)) (QREFELT $ 454))
                 (QREFELT $ 452))
                (EXIT (PROGN (LETT #2# (CONS 2 "no_solution")) (GO #13#)))))
              ((SPADCALL |c| (QREFELT $ 455))
               (SEQ
                (COND
                 ((SPADCALL |options| (QREFELT $ 359))
                  (SEQ
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL "Proposed solution does not fit coefficient "
                               (QREFELT $ 451))
                     (SPADCALL |order| (QREFELT $ 453)) (QREFELT $ 454))
                    (QREFELT $ 452))
                   (EXIT
                    (SPADCALL
                     (SPADCALL (SPADCALL "sigma: " (QREFELT $ 451))
                               (SPADCALL |sigma| (QREFELT $ 453))
                               (QREFELT $ 454))
                     (QREFELT $ 452))))))
                (EXIT (PROGN (LETT #2# (CONS 1 "reject")) (GO #13#)))))
              (#12# (CONS 0 "good"))))))
          #13# (EXIT #2#)))) 

(SDEFUN |GUESS;wrapInterpolant|
        ((|resi| |List| (|SparseUnivariatePolynomial| S))
         (|exprList| |List| EXPRR) (|initials| |List| F)
         (D |Record| (|:| |degreeStream| (|Stream| (|NonNegativeInteger|)))
          (|:| |guessStream|
               (|Mapping| (|Stream| (|UnivariateFormalPowerSeries| F))
                          (|UnivariateFormalPowerSeries| F)))
          (|:| |guessModGen|
               (|Mapping|
                (|Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
                           (|Integer|) (|Integer|))
                (|NonNegativeInteger|)))
          (|:| |testGen|
               (|Mapping|
                (|Mapping|
                 (|Vector|
                  (|UnivariateFormalPowerSeries|
                   (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                 (|UnivariateFormalPowerSeries|
                  (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                (|List| (|PositiveInteger|))))
          (|:| |exprStream| (|Mapping| (|Stream| EXPRR) EXPRR (|Symbol|)))
          (|:| |kind| (|Symbol|)) (|:| |qvar| (|Symbol|))
          (|:| A
               (|Mapping| S (|NonNegativeInteger|) (|NonNegativeInteger|)
                          (|SparseUnivariatePolynomial| S)))
          (|:| AF
               (|Mapping|
                (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))
                (|NonNegativeInteger|) (|NonNegativeInteger|)
                (|UnivariateFormalPowerSeries|
                 (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
          (|:| AX (|Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|) EXPRR))
          (|:| C (|Mapping| (|List| S) (|NonNegativeInteger|))))
         (|op| |BasicOperator|) (|options| |List| (|GuessOption|)) ($ EXPRR))
        (SPROG
         ((|ex| (|List| EXPRR)) (#1=#:G1550 NIL) (|p| NIL) (#2=#:G1551 NIL)
          (|e| NIL) (#3=#:G1549 NIL) (|eq| (EXPRR)) (#4=#:G1547 NIL)
          (#5=#:G1548 NIL) (#6=#:G1546 NIL) (|dk| (|Symbol|)))
         (SEQ (LETT |dk| (SPADCALL |options| (QREFELT $ 199)))
              (COND
               ((OR (EQUAL |dk| '|displayAsGF|) (EQUAL |dk| '|displayAsEQ|))
                (EXIT
                 (SEQ
                  (LETT |ex|
                        (PROGN
                         (LETT #6# NIL)
                         (SEQ (LETT |e| NIL) (LETT #5# |exprList|)
                              (LETT |p| NIL) (LETT #4# |resi|) G190
                              (COND
                               ((OR (ATOM #4#) (PROGN (LETT |p| (CAR #4#)) NIL)
                                    (ATOM #5#)
                                    (PROGN (LETT |e| (CAR #5#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #6#
                                      (CONS
                                       (|GUESS;makeEXPRR| (QVELT D 9)
                                        (SPADCALL |options| (QREFELT $ 456))
                                        (|GUESS;SUPS2SUPF| |p| $) |e| $)
                                       #6#))))
                              (LETT #4# (PROG1 (CDR #4#) (LETT #5# (CDR #5#))))
                              (GO G190) G191 (EXIT (NREVERSE #6#)))))
                  (LETT |eq|
                        (SPADCALL (SPADCALL (ELT $ 93) |ex| (QREFELT $ 106))
                                  (QREFELT $ 457)))
                  (EXIT
                   (COND ((EQUAL |dk| '|displayAsEQ|) |eq|)
                         (#7='T
                          (SPADCALL |op| (SPADCALL |options| (QREFELT $ 456))
                                    (SPADCALL |options| (QREFELT $ 458)) |eq|
                                    (|GUESS;getVariables| |initials| $)
                                    (SPADCALL (QREFELT $ 10)
                                              (SPADCALL |initials|
                                                        (QREFELT $ 327))
                                              (QREFELT $ 461))
                                    (QREFELT $ 464)))))))))
              (EXIT
               (COND
                ((EQUAL |dk| '|displayAsRec|)
                 (SEQ
                  (LETT |ex|
                        (PROGN
                         (LETT #3# NIL)
                         (SEQ (LETT |e| NIL) (LETT #2# |exprList|)
                              (LETT |p| NIL) (LETT #1# |resi|) G190
                              (COND
                               ((OR (ATOM #1#) (PROGN (LETT |p| (CAR #1#)) NIL)
                                    (ATOM #2#)
                                    (PROGN (LETT |e| (CAR #2#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #3#
                                      (CONS
                                       (|GUESS;makeEXPRR| (QVELT D 9)
                                        (SPADCALL |options| (QREFELT $ 458))
                                        (|GUESS;SUPS2SUPF| |p| $) |e| $)
                                       #3#))))
                              (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#))))
                              (GO G190) G191 (EXIT (NREVERSE #3#)))))
                  (EXIT
                   (SPADCALL |op| (SPADCALL |options| (QREFELT $ 458))
                             (SPADCALL
                              (SPADCALL (ELT $ 93) |ex| (QREFELT $ 106))
                              (QREFELT $ 457))
                             (|GUESS;getVariables| |initials| $)
                             (SPADCALL (QREFELT $ 10)
                                       (SPADCALL |initials| (QREFELT $ 327))
                                       (QREFELT $ 461))
                             (QREFELT $ 465)))))
                (#7# (|error| "wrapInterpolant: unsupported display kind"))))))) 

(SDEFUN |GUESS;guessHPaux|
        ((|lists| |List| (|List| F))
         (D |Record| (|:| |degreeStream| #1=(|Stream| (|NonNegativeInteger|)))
          (|:| |guessStream|
               (|Mapping| (|Stream| (|UnivariateFormalPowerSeries| F))
                          (|UnivariateFormalPowerSeries| F)))
          (|:| |guessModGen|
               (|Mapping|
                (|Mapping| (|Vector| (|U32Vector|)) (|List| (|U32Vector|))
                           (|Integer|) (|Integer|))
                (|NonNegativeInteger|)))
          (|:| |testGen|
               (|Mapping|
                (|Mapping|
                 (|Vector|
                  (|UnivariateFormalPowerSeries|
                   (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                 (|UnivariateFormalPowerSeries|
                  (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))))
                (|List| (|PositiveInteger|))))
          (|:| |exprStream| (|Mapping| #2=(|Stream| EXPRR) EXPRR (|Symbol|)))
          (|:| |kind| (|Symbol|)) (|:| |qvar| (|Symbol|))
          (|:| A
               (|Mapping| S (|NonNegativeInteger|) (|NonNegativeInteger|)
                          (|SparseUnivariatePolynomial| S)))
          (|:| AF
               (|Mapping|
                (|SparseMultivariatePolynomial| F (|NonNegativeInteger|))
                (|NonNegativeInteger|) (|NonNegativeInteger|)
                (|UnivariateFormalPowerSeries|
                 (|SparseMultivariatePolynomial| F (|NonNegativeInteger|)))))
          (|:| AX (|Mapping| EXPRR (|NonNegativeInteger|) (|Symbol|) EXPRR))
          (|:| C (|Mapping| (|List| S) (|NonNegativeInteger|))))
         (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPROG
         ((#3=#:G1622 NIL) (|reslist| (|List| EXPRR)) (|res| (EXPRR))
          (#4=#:G1624 NIL) (|i| NIL) (|exprList| (|List| EXPRR))
          (MS (|Stream| (|Matrix| (|SparseUnivariatePolynomial| S))))
          (M (|Matrix| (|SparseUnivariatePolynomial| S))) (#5=#:G1620 NIL)
          (#6=#:G1602 NIL) (#7=#:G1623 NIL) (#8=#:G1617 NIL) (#9=#:G1565 NIL)
          (|maxD| (|Union| (|NonNegativeInteger|) "arbitrary"))
          (|guessDegree| #10=(|Integer|)) (|degreeLoss| (|Integer|))
          (#11=#:G1621 NIL) (#12=#:G1556 NIL) (|o| NIL) (|exprS| #2#)
          (#13=#:G1616 NIL) (|dk| (|Symbol|)) (|degreeS| #1#)
          (|op| (|BasicOperator|)) (|listDegree| #10#) (|list| (|List| F)))
         (SEQ
          (EXIT
           (SEQ (LETT |reslist| NIL) (LETT |list| (|SPADfirst| |lists|))
                (LETT |listDegree|
                      (- (- (LENGTH |list|) 1)
                         (SPADCALL |options| (QREFELT $ 466))))
                (COND
                 ((< |listDegree| 0)
                  (PROGN (LETT #3# |reslist|) (GO #14=#:G1615))))
                (LETT |op|
                      (SPADCALL (SPADCALL |options| (QREFELT $ 467))
                                (QREFELT $ 468)))
                (LETT |degreeS| (QVELT D 0))
                (LETT |dk| (SPADCALL |options| (QREFELT $ 199)))
                (LETT |exprS|
                      (SEQ
                       (EXIT
                        (COND
                         ((OR (EQUAL |dk| '|displayAsGF|)
                              (EQUAL |dk| '|displayAsEQ|))
                          (SPADCALL
                           (SPADCALL |op|
                                     (SPADCALL
                                      (SPADCALL |options| (QREFELT $ 456))
                                      (QREFELT $ 45))
                                     (QREFELT $ 469))
                           (SPADCALL |options| (QREFELT $ 456)) (QVELT D 4)))
                         ((EQUAL |dk| '|displayAsRec|)
                          (PROGN
                           (LETT #13#
                                 (SPADCALL
                                  (SPADCALL |op|
                                            (SPADCALL
                                             (SPADCALL |options|
                                                       (QREFELT $ 458))
                                             (QREFELT $ 45))
                                            (QREFELT $ 469))
                                  (SPADCALL |options| (QREFELT $ 458))
                                  (QVELT D 4)))
                           (GO #15=#:G1555)))))
                       #15# (EXIT #13#)))
                (SEQ
                 (EXIT
                  (SEQ (LETT |o| 2) G190 NIL
                       (SEQ
                        (EXIT
                         (COND
                          ((SPADCALL
                            (SPADCALL |degreeS|
                                      (PROG1 (LETT #12# (- |o| 1))
                                        (|check_subtype2| (>= #12# 0)
                                                          '(|NonNegativeInteger|)
                                                          '(|Integer|) #12#))
                                      (QREFELT $ 470))
                            (QREFELT $ 471))
                           (PROGN (LETT #11# |$NoValue|) (GO #16=#:G1613)))
                          ('T
                           (SEQ
                            (LETT |degreeLoss|
                                  (SPADCALL |degreeS| |o| (QREFELT $ 267)))
                            (LETT |guessDegree|
                                  (- (- (+ |listDegree| 2) |degreeLoss|) |o|))
                            (COND
                             ((< |guessDegree| 0)
                              (SEQ
                               (COND
                                ((SPADCALL |options| (QREFELT $ 359))
                                 (SPADCALL
                                  "Guess: not enough values for guessing"
                                  (QREFELT $ 361))))
                               (EXIT (PROGN (LETT #3# |reslist|) (GO #14#))))))
                            (COND
                             ((SPADCALL |options| (QREFELT $ 359))
                              (SPADCALL
                               (SPADCALL
                                (LIST
                                 (SPADCALL "Guess: trying order "
                                           (QREFELT $ 451))
                                 (SPADCALL |o| (QREFELT $ 472))
                                 (SPADCALL ", guessDegree is " (QREFELT $ 451))
                                 (SPADCALL |guessDegree| (QREFELT $ 453)))
                                (QREFELT $ 473))
                               (QREFELT $ 474))))
                            (LETT |maxD| (SPADCALL |options| (QREFELT $ 352)))
                            (EXIT
                             (COND
                              ((QEQCAR |maxD| 0)
                               (COND
                                ((OR
                                  (OR
                                   (SPADCALL
                                    (SPADCALL |degreeS| |o| (QREFELT $ 470))
                                    (QREFELT $ 471))
                                   (NULL
                                    (< (* (QCDR |maxD|) |o|) |guessDegree|)))
                                  (NULL
                                   (<= (* (QCDR |maxD|) (+ |o| 1))
                                       (-
                                        (- (+ |listDegree| 2)
                                           (SPADCALL |degreeS| (+ |o| 1)
                                                     (QREFELT $ 267)))
                                        (+ |o| 1)))))
                                 (SEQ (LETT |exprList| NIL)
                                      (COND
                                       ((SPADCALL |options| (QREFELT $ 359))
                                        (SEQ
                                         (LETT |exprList|
                                               (SPADCALL
                                                (SPADCALL
                                                 (SPADCALL |exprS| |o|
                                                           (QREFELT $ 475))
                                                 (QREFELT $ 476))
                                                (QREFELT $ 477)))
                                         (SPADCALL
                                          #17="Guess: The list of expressions is"
                                          (QREFELT $ 361))
                                         (EXIT
                                          (SPADCALL
                                           (SPADCALL |exprList|
                                                     (QREFELT $ 478))
                                           (QREFELT $ 474))))))
                                      (LETT MS
                                            (|GUESS;guessInterpolate2| |lists|
                                             |o| |degreeLoss|
                                             (PROG1 (LETT #9# |guessDegree|)
                                               (|check_subtype2| (>= #9# 0)
                                                                 '(|NonNegativeInteger|)
                                                                 '(|Integer|)
                                                                 #9#))
                                             D |options| $))
                                      (EXIT
                                       (SEQ
                                        (EXIT
                                         (SEQ G190 NIL
                                              (SEQ
                                               (EXIT
                                                (COND
                                                 ((SPADCALL MS (QREFELT $ 479))
                                                  (PROGN
                                                   (LETT #8# |$NoValue|)
                                                   (GO #18=#:G1572)))
                                                 ('T
                                                  (SEQ
                                                   (LETT M
                                                         (SPADCALL MS
                                                                   (QREFELT $
                                                                            480)))
                                                   (LETT MS
                                                         (SPADCALL MS
                                                                   (QREFELT $
                                                                            481)))
                                                   (COND
                                                    ((NULL |exprList|)
                                                     (LETT |exprList|
                                                           (SPADCALL
                                                            (SPADCALL
                                                             (SPADCALL |exprS|
                                                                       |o|
                                                                       (QREFELT
                                                                        $ 475))
                                                             (QREFELT $ 476))
                                                            (QREFELT $ 477)))))
                                                   (SEQ (LETT |i| 1)
                                                        (LETT #7# (ANCOLS M))
                                                        G190
                                                        (COND
                                                         ((|greater_SI| |i|
                                                                        #7#)
                                                          (GO G191)))
                                                        (SEQ
                                                         (LETT |res|
                                                               (|GUESS;wrapInterpolant|
                                                                (SPADCALL
                                                                 (SPADCALL M
                                                                           |i|
                                                                           (QREFELT
                                                                            $
                                                                            385))
                                                                 (QREFELT $
                                                                          386))
                                                                |exprList|
                                                                |list| D |op|
                                                                |options| $))
                                                         (EXIT
                                                          (COND
                                                           ((NULL
                                                             (SPADCALL |res|
                                                                       |reslist|
                                                                       (QREFELT
                                                                        $
                                                                        482)))
                                                            (LETT |reslist|
                                                                  (CONS |res|
                                                                        |reslist|))))))
                                                        (LETT |i|
                                                              (|inc_SI| |i|))
                                                        (GO G190) G191
                                                        (EXIT NIL))
                                                   (EXIT
                                                    (COND
                                                     ((NULL (NULL |reslist|))
                                                      (COND
                                                       ((SPADCALL |options|
                                                                  (QREFELT $
                                                                           483))
                                                        (PROGN
                                                         (LETT #3# |reslist|)
                                                         (GO #14#))))))))))))
                                              NIL (GO G190) G191 (EXIT NIL)))
                                        #18# (EXIT #8#)))))
                                ((SPADCALL |options| (QREFELT $ 359))
                                 (SPADCALL "Guess: iterating"
                                           (QREFELT $ 361)))))
                              ('T
                               (SEQ (LETT |exprList| NIL)
                                    (COND
                                     ((SPADCALL |options| (QREFELT $ 359))
                                      (SEQ
                                       (LETT |exprList|
                                             (SPADCALL
                                              (SPADCALL
                                               (SPADCALL |exprS| |o|
                                                         (QREFELT $ 475))
                                               (QREFELT $ 476))
                                              (QREFELT $ 477)))
                                       (SPADCALL #17# (QREFELT $ 361))
                                       (EXIT
                                        (SPADCALL
                                         (SPADCALL |exprList| (QREFELT $ 478))
                                         (QREFELT $ 474))))))
                                    (LETT MS
                                          (|GUESS;guessInterpolate2| |lists|
                                           |o| |degreeLoss|
                                           (PROG1 (LETT #6# |guessDegree|)
                                             (|check_subtype2| (>= #6# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #6#))
                                           D |options| $))
                                    (EXIT
                                     (SEQ
                                      (EXIT
                                       (SEQ G190 NIL
                                            (SEQ
                                             (EXIT
                                              (COND
                                               ((SPADCALL MS (QREFELT $ 479))
                                                (PROGN
                                                 (LETT #5# |$NoValue|)
                                                 (GO #19=#:G1609)))
                                               ('T
                                                (SEQ
                                                 (LETT M
                                                       (SPADCALL MS
                                                                 (QREFELT $
                                                                          480)))
                                                 (LETT MS
                                                       (SPADCALL MS
                                                                 (QREFELT $
                                                                          481)))
                                                 (COND
                                                  ((NULL |exprList|)
                                                   (LETT |exprList|
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (SPADCALL |exprS|
                                                                     |o|
                                                                     (QREFELT $
                                                                              475))
                                                           (QREFELT $ 476))
                                                          (QREFELT $ 477)))))
                                                 (SEQ (LETT |i| 1)
                                                      (LETT #4# (ANCOLS M))
                                                      G190
                                                      (COND
                                                       ((|greater_SI| |i| #4#)
                                                        (GO G191)))
                                                      (SEQ
                                                       (LETT |res|
                                                             (|GUESS;wrapInterpolant|
                                                              (SPADCALL
                                                               (SPADCALL M |i|
                                                                         (QREFELT
                                                                          $
                                                                          385))
                                                               (QREFELT $ 386))
                                                              |exprList| |list|
                                                              D |op| |options|
                                                              $))
                                                       (EXIT
                                                        (COND
                                                         ((NULL
                                                           (SPADCALL |res|
                                                                     |reslist|
                                                                     (QREFELT $
                                                                              482)))
                                                          (LETT |reslist|
                                                                (CONS |res|
                                                                      |reslist|))))))
                                                      (LETT |i| (|inc_SI| |i|))
                                                      (GO G190) G191
                                                      (EXIT NIL))
                                                 (EXIT
                                                  (COND
                                                   ((NULL (NULL |reslist|))
                                                    (COND
                                                     ((SPADCALL |options|
                                                                (QREFELT $
                                                                         483))
                                                      (PROGN
                                                       (LETT #3# |reslist|)
                                                       (GO #14#))))))))))))
                                            NIL (GO G190) G191 (EXIT NIL)))
                                      #19# (EXIT #5#))))))))))))
                       (LETT |o| (|inc_SI| |o|)) (GO G190) G191 (EXIT NIL)))
                 #16# (EXIT #11#))
                (EXIT |reslist|)))
          #14# (EXIT #3#)))) 

(SDEFUN |GUESS;processOptions|
        ((|options| |List| (|GuessOption|))
         ($ |List| (|List| (|GuessOption|))))
        (SPROG
         ((#1=#:G1674 NIL) (#2=#:G1668 NIL) (#3=#:G1666 NIL) (#4=#:G1678 NIL)
          (#5=#:G1632 NIL) (|i| NIL) (#6=#:G1677 NIL)
          (|minP| (|PositiveInteger|))
          (|hom?| (|Union| (|PositiveInteger|) (|Boolean|))) (#7=#:G1641 NIL)
          (#8=#:G1676 NIL) (#9=#:G1675 NIL) (|maxSomos| (|PositiveInteger|))
          (#10=#:G1626 NIL) (#11=#:G1637 NIL) (#12=#:G1635 NIL)
          (|maxD| (|NonNegativeInteger|)) (#13=#:G1629 NIL)
          (|Som?| (|Union| (|PositiveInteger|) (|Boolean|))))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |Som?| (SPADCALL |options| (QREFELT $ 62)))
                 (EXIT
                  (COND
                   ((QEQCAR |Som?| 1)
                    (COND
                     ((QCDR |Som?|)
                      (SEQ
                       (LETT |maxD|
                             (PROG2
                                 (LETT #13#
                                       (SPADCALL |options| (QREFELT $ 61)))
                                 (QCDR #13#)
                               (|check_union2| (QEQCAR #13# 0)
                                               (|NonNegativeInteger|)
                                               (|Union| (|NonNegativeInteger|)
                                                        "arbitrary")
                                               #13#)))
                       (COND
                        ((QEQCAR (SPADCALL |options| (QREFELT $ 57)) 0)
                         (LETT |maxSomos|
                               (*
                                (PROG1 (LETT #12# |maxD|)
                                  (|check_subtype2| (> #12# 0)
                                                    '(|PositiveInteger|)
                                                    '(|NonNegativeInteger|)
                                                    #12#))
                                (PROG2
                                    (LETT #5#
                                          (SPADCALL |options| (QREFELT $ 57)))
                                    (QCDR #5#)
                                  (|check_union2| (QEQCAR #5# 0)
                                                  (|PositiveInteger|)
                                                  (|Union| (|PositiveInteger|)
                                                           #14="arbitrary")
                                                  #5#)))))
                        ((QEQCAR (SPADCALL |options| (QREFELT $ 59)) 0)
                         (LETT |maxSomos|
                               (*
                                (PROG1 (LETT #11# |maxD|)
                                  (|check_subtype2| (> #11# 0)
                                                    '(|PositiveInteger|)
                                                    '(|NonNegativeInteger|)
                                                    #11#))
                                (PROG2
                                    (LETT #10#
                                          (SPADCALL |options| (QREFELT $ 59)))
                                    (QCDR #10#)
                                  (|check_union2| (QEQCAR #10# 0)
                                                  (|PositiveInteger|)
                                                  (|Union| (|PositiveInteger|)
                                                           (|Boolean|))
                                                  #10#)))))
                        (#15='T
                         (|error|
                          "Guess: internal error - inconsistent options")))
                       (EXIT
                        (PROGN
                         (LETT #1#
                               (SPADCALL
                                (PROGN
                                 (LETT #9# NIL)
                                 (SEQ (LETT |i| 2) (LETT #8# |maxSomos|) G190
                                      (COND ((|greater_SI| |i| #8#) (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #9#
                                              (CONS
                                               (|GUESS;processOptions|
                                                (CONS
                                                 (SPADCALL
                                                  (CONS 0
                                                        (PROG1 (LETT #7# |i|)
                                                          (|check_subtype2|
                                                           (> #7# 0)
                                                           '(|PositiveInteger|)
                                                           '(|NonNegativeInteger|)
                                                           #7#)))
                                                  (QREFELT $ 485))
                                                 |options|)
                                                $)
                                               #9#))))
                                      (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                      (EXIT (NREVERSE #9#))))
                                (QREFELT $ 487)))
                         (GO #16=#:G1673))))))))))
            (SEQ (LETT |hom?| (SPADCALL |options| (QREFELT $ 59)))
                 (EXIT
                  (COND
                   ((QEQCAR |hom?| 1)
                    (COND
                     ((QCDR |hom?|)
                      (SEQ
                       (COND
                        ((QEQCAR (SPADCALL |options| (QREFELT $ 62)) 0)
                         (LETT |minP| 2))
                        (#15# (LETT |minP| 1)))
                       (EXIT
                        (PROGN
                         (LETT #1#
                               (PROGN
                                (LETT #6# NIL)
                                (SEQ (LETT |i| |minP|)
                                     (LETT #4#
                                           (PROG2
                                               (LETT #5#
                                                     (SPADCALL |options|
                                                               (QREFELT $ 57)))
                                               (QCDR #5#)
                                             (|check_union2| (QEQCAR #5# 0)
                                                             (|PositiveInteger|)
                                                             (|Union|
                                                              (|PositiveInteger|)
                                                              #14#)
                                                             #5#)))
                                     G190 (COND ((> |i| #4#) (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT #6#
                                             (CONS
                                              (SPADCALL
                                               (LIST
                                                (SPADCALL
                                                 (CONS 0
                                                       (PROG1 (LETT #3# |i|)
                                                         (|check_subtype2|
                                                          (> #3# 0)
                                                          '(|PositiveInteger|)
                                                          '(|NonNegativeInteger|)
                                                          #3#)))
                                                 (QREFELT $ 488))
                                                (SPADCALL
                                                 (CONS 0
                                                       (PROG1 (LETT #2# |i|)
                                                         (|check_subtype2|
                                                          (> #2# 0)
                                                          '(|PositiveInteger|)
                                                          '(|NonNegativeInteger|)
                                                          #2#)))
                                                 (QREFELT $ 489)))
                                               |options| (QREFELT $ 490))
                                              #6#))))
                                     (LETT |i| (+ |i| 1)) (GO G190) G191
                                     (EXIT (NREVERSE #6#)))))
                         (GO #16#))))))))))
            (EXIT (LIST |options|))))
          #16# (EXIT #1#)))) 

(SDEFUN |GUESS;guessAlgDep;LLL;98|
        ((|lists| |List| (|List| F)) (|options| |List| (|GuessOption|))
         ($ |List| EXPRR))
        (SPROG
         ((|lres| (|List| EXPRR)) (#1=#:G1694 NIL) (|res| (|List| EXPRR))
          (#2=#:G1696 NIL) (|opts| NIL)
          (|lopts| (|List| (|List| (|GuessOption|)))) (#3=#:G1684 NIL)
          (#4=#:G1693 NIL) (#5=#:G1695 NIL) (|li| NIL)
          (|nn| (|NonNegativeInteger|)) (|rl| (|List| (|List| F)))
          (|l| (|List| F)))
         (SEQ
          (EXIT
           (SEQ (SPADCALL |options| (QREFELT $ 491))
                (EXIT
                 (COND
                  ((NULL |lists|)
                   (|error| "guessAlgDep: need at least one list"))
                  ('T
                   (SEQ (LETT |l| (|SPADfirst| |lists|))
                        (LETT |rl| (CDR |lists|)) (LETT |nn| (LENGTH |l|))
                        (SEQ
                         (EXIT
                          (SEQ (LETT |li| NIL) (LETT #5# |rl|) G190
                               (COND
                                ((OR (ATOM #5#)
                                     (PROGN (LETT |li| (CAR #5#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((SPADCALL (LENGTH |li|) |nn|
                                             (QREFELT $ 147))
                                   (PROGN
                                    (LETT #4#
                                          (|error|
                                           "guessAlgDep: lists must have equal length"))
                                    (GO #6=#:G1680))))))
                               (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL)))
                         #6# (EXIT #4#))
                        (LETT |lopts|
                              (|GUESS;processOptions|
                               (SPADCALL
                                (LIST (SPADCALL '|displayAsEQ| (QREFELT $ 492))
                                      (SPADCALL
                                       (CONS 0
                                             (PROG1 (LETT #3# (LENGTH |lists|))
                                               (|check_subtype2| (> #3# 0)
                                                                 '(|PositiveInteger|)
                                                                 '(|NonNegativeInteger|)
                                                                 #3#)))
                                       (QREFELT $ 493)))
                                |options| (QREFELT $ 494))
                               $))
                        (LETT |lres| NIL) (LETT |res| NIL)
                        (SEQ (LETT |opts| NIL) (LETT #2# |lopts|) G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |opts| (CAR #2#)) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |res|
                                    (|GUESS;guessHPaux| |lists|
                                     (SPADCALL |lists| |opts| (QREFELT $ 227))
                                     |opts| $))
                              (COND
                               ((NULL (NULL |res|))
                                (COND
                                 ((SPADCALL |options| (QREFELT $ 483))
                                  (PROGN (LETT #1# |res|) (GO #7=#:G1692))))))
                              (EXIT
                               (LETT |lres|
                                     (SPADCALL |res| |lres| (QREFELT $ 495)))))
                             (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                        (EXIT (NREVERSE |lres|))))))))
          #7# (EXIT #1#)))) 

(SDEFUN |GUESS;guessAlgDep;LL;99|
        ((|lists| |List| (|List| F)) ($ |List| EXPRR))
        (SPADCALL |lists| NIL (QREFELT $ 496))) 

(SDEFUN |GUESS;guessADE;LLL;100|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPROG
         ((|lres| (|List| EXPRR)) (#1=#:G1705 NIL) (|res| (|List| EXPRR))
          (#2=#:G1706 NIL) (|opts| NIL)
          (|lopts| (|List| (|List| (|GuessOption|)))))
         (SEQ
          (EXIT
           (SEQ (SPADCALL |options| (QREFELT $ 491))
                (LETT |lopts|
                      (|GUESS;processOptions|
                       (CONS (SPADCALL '|displayAsGF| (QREFELT $ 492))
                             |options|)
                       $))
                (LETT |lres| NIL) (LETT |res| NIL)
                (SEQ (LETT |opts| NIL) (LETT #2# |lopts|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |opts| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |res|
                            (|GUESS;guessHPaux| (LIST |list|)
                             (SPADCALL |opts| (QREFELT $ 217)) |opts| $))
                      (COND
                       ((NULL (NULL |res|))
                        (COND
                         ((SPADCALL |options| (QREFELT $ 483))
                          (PROGN (LETT #1# |res|) (GO #3=#:G1704))))))
                      (EXIT
                       (LETT |lres| (SPADCALL |res| |lres| (QREFELT $ 495)))))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (EXIT (NREVERSE |lres|))))
          #3# (EXIT #1#)))) 

(SDEFUN |GUESS;guessADE;LL;101| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| NIL (QREFELT $ 498))) 

(SDEFUN |GUESS;guessAlg;LLL;102|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPADCALL |list| (CONS (SPADCALL (CONS 0 0) (QREFELT $ 500)) |options|)
                  (QREFELT $ 498))) 

(SDEFUN |GUESS;guessAlg;LL;103| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| NIL (QREFELT $ 501))) 

(SDEFUN |GUESS;guessHolo;LLL;104|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPADCALL |list| (CONS (SPADCALL (CONS 0 1) (QREFELT $ 489)) |options|)
                  (QREFELT $ 498))) 

(SDEFUN |GUESS;guessHolo;LL;105| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| NIL (QREFELT $ 503))) 

(SDEFUN |GUESS;guessPade;LLL;106|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPROG ((|opts| (|List| (|GuessOption|))))
               (SEQ
                (LETT |opts|
                      (SPADCALL
                       (LIST
                        (LIST (SPADCALL (CONS 0 0) (QREFELT $ 500))
                              (SPADCALL (CONS 0 1) (QREFELT $ 489)))
                        |options| (LIST (SPADCALL 'T (QREFELT $ 505))))
                       (QREFELT $ 506)))
                (EXIT (SPADCALL |list| |opts| (QREFELT $ 498)))))) 

(SDEFUN |GUESS;guessPade;LL;107| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| NIL (QREFELT $ 507))) 

(SDEFUN |GUESS;guessFE;LLL;108|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPROG
         ((|lres| (|List| EXPRR)) (#1=#:G1734 NIL) (|res| (|List| EXPRR))
          (#2=#:G1735 NIL) (|opts| NIL)
          (|lopts| (|List| (|List| (|GuessOption|)))))
         (SEQ
          (EXIT
           (SEQ (SPADCALL |options| (QREFELT $ 491))
                (LETT |lopts|
                      (|GUESS;processOptions|
                       (CONS (SPADCALL '|displayAsGF| (QREFELT $ 492))
                             |options|)
                       $))
                (LETT |lres| NIL) (LETT |res| NIL)
                (SEQ (LETT |opts| NIL) (LETT #2# |lopts|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |opts| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |res|
                            (|GUESS;guessHPaux| (LIST |list|)
                             (SPADCALL |opts| (QREFELT $ 231)) |opts| $))
                      (COND
                       ((NULL (NULL |res|))
                        (COND
                         ((SPADCALL |options| (QREFELT $ 483))
                          (PROGN (LETT #1# |res|) (GO #3=#:G1733))))))
                      (EXIT
                       (LETT |lres| (SPADCALL |res| |lres| (QREFELT $ 495)))))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (EXIT (NREVERSE |lres|))))
          #3# (EXIT #1#)))) 

(SDEFUN |GUESS;guessFE;LL;109| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| NIL (QREFELT $ 509))) 

(SDEFUN |GUESS;guessADE;SM;110|
        ((|q| |Symbol|)
         ($ |Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
        (SPROG NIL (SEQ (CONS #'|GUESS;guessADE;SM;110!0| (VECTOR |q| $))))) 

(SDEFUN |GUESS;guessADE;SM;110!0| ((|list| NIL) (|options| NIL) ($$ NIL))
        (PROG ($ |q|)
          (LETT $ (QREFELT $$ 1))
          (LETT |q| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG
             ((|lres| NIL) (#1=#:G1744 NIL) (|res| NIL) (#2=#:G1745 NIL)
              (|opts| NIL) (|lopts| NIL))
             (SEQ
              (EXIT
               (SEQ (SPADCALL |options| (QREFELT $ 491))
                    (LETT |lopts|
                          (|GUESS;processOptions|
                           (SPADCALL (SPADCALL '|displayAsGF| (QREFELT $ 492))
                                     |options| (QREFELT $ 511))
                           $))
                    (LETT |lres| NIL) (LETT |res| NIL)
                    (SEQ (LETT |opts| NIL) (LETT #2# |lopts|) G190
                         (COND
                          ((OR (ATOM #2#) (PROGN (LETT |opts| (CAR #2#)) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |res|
                                (|GUESS;guessHPaux| (LIST |list|)
                                 (SPADCALL |opts|
                                           (SPADCALL |q| (QREFELT $ 242)))
                                 |opts| $))
                          (COND
                           ((NULL (SPADCALL |res| (QREFELT $ 512)))
                            (COND
                             ((SPADCALL |options| (QREFELT $ 483))
                              (PROGN (LETT #1# |res|) (GO #3=#:G1743))))))
                          (EXIT
                           (LETT |lres|
                                 (SPADCALL |res| |lres| (QREFELT $ 495)))))
                         (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                    (EXIT (SPADCALL |lres| (QREFELT $ 513)))))
              #3# (EXIT #1#))))))) 

(SDEFUN |GUESS;guessHolo;SM;111|
        ((|q| |Symbol|)
         ($ |Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
        (SPROG NIL (CONS #'|GUESS;guessHolo;SM;111!0| (VECTOR |q| $)))) 

(SDEFUN |GUESS;guessHolo;SM;111!0| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG ($ |q|)
          (LETT $ (QREFELT $$ 1))
          (LETT |q| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |z1|
                      (SPADCALL
                       (SPADCALL (CONS 0 (|spadConstant| $ 74))
                                 (QREFELT $ 489))
                       |z2| (QREFELT $ 511))
                      (SPADCALL |q| (QREFELT $ 514))))))) 

(SDEFUN |GUESS;guessRec;LLL;112|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPROG
         ((|lres| (|List| EXPRR)) (#1=#:G1759 NIL) (|res| (|List| EXPRR))
          (#2=#:G1760 NIL) (|opts| NIL)
          (|lopts| (|List| (|List| (|GuessOption|)))))
         (SEQ
          (EXIT
           (SEQ (SPADCALL |options| (QREFELT $ 491))
                (LETT |lopts|
                      (|GUESS;processOptions|
                       (CONS (SPADCALL '|displayAsRec| (QREFELT $ 492))
                             |options|)
                       $))
                (LETT |lres| NIL) (LETT |res| NIL)
                (SEQ (LETT |opts| NIL) (LETT #2# |lopts|) G190
                     (COND
                      ((OR (ATOM #2#) (PROGN (LETT |opts| (CAR #2#)) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |res|
                            (|GUESS;guessHPaux| (LIST |list|)
                             (SPADCALL |opts| (QREFELT $ 272)) |opts| $))
                      (COND
                       ((NULL (NULL |res|))
                        (COND
                         ((SPADCALL |options| (QREFELT $ 483))
                          (PROGN (LETT #1# |res|) (GO #3=#:G1758))))))
                      (EXIT
                       (LETT |lres| (SPADCALL |res| |lres| (QREFELT $ 495)))))
                     (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                (EXIT (NREVERSE |lres|))))
          #3# (EXIT #1#)))) 

(SDEFUN |GUESS;guessRec;LL;113| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| NIL (QREFELT $ 516))) 

(SDEFUN |GUESS;guessPRec;LLL;114|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPADCALL |list| (CONS (SPADCALL (CONS 0 1) (QREFELT $ 489)) |options|)
                  (QREFELT $ 516))) 

(SDEFUN |GUESS;guessPRec;LL;115| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| NIL (QREFELT $ 518))) 

(SDEFUN |GUESS;guessRat;LLL;116|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPROG ((|opts| (|List| (|GuessOption|))))
               (SEQ
                (LETT |opts|
                      (SPADCALL
                       (LIST
                        (LIST (SPADCALL (CONS 0 0) (QREFELT $ 520))
                              (SPADCALL (CONS 0 1) (QREFELT $ 489)))
                        |options| (LIST (SPADCALL 'T (QREFELT $ 505))))
                       (QREFELT $ 506)))
                (EXIT (SPADCALL |list| |opts| (QREFELT $ 516)))))) 

(SDEFUN |GUESS;guessRat;LL;117| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| NIL (QREFELT $ 521))) 

(SDEFUN |GUESS;guessRec;SM;118|
        ((|q| |Symbol|)
         ($ |Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
        (SPROG NIL (SEQ (CONS #'|GUESS;guessRec;SM;118!0| (VECTOR |q| $))))) 

(SDEFUN |GUESS;guessRec;SM;118!0| ((|list| NIL) (|options| NIL) ($$ NIL))
        (PROG ($ |q|)
          (LETT $ (QREFELT $$ 1))
          (LETT |q| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG
             ((|lres| NIL) (#1=#:G1783 NIL) (|res| NIL) (#2=#:G1784 NIL)
              (|opts| NIL) (|lopts| NIL))
             (SEQ
              (EXIT
               (SEQ (SPADCALL |options| (QREFELT $ 491))
                    (LETT |lopts|
                          (|GUESS;processOptions|
                           (SPADCALL (SPADCALL '|displayAsRec| (QREFELT $ 492))
                                     |options| (QREFELT $ 511))
                           $))
                    (LETT |lres| NIL) (LETT |res| NIL)
                    (SEQ (LETT |opts| NIL) (LETT #2# |lopts|) G190
                         (COND
                          ((OR (ATOM #2#) (PROGN (LETT |opts| (CAR #2#)) NIL))
                           (GO G191)))
                         (SEQ
                          (LETT |res|
                                (|GUESS;guessHPaux| (LIST |list|)
                                 (SPADCALL |opts|
                                           (SPADCALL |q| (QREFELT $ 321)))
                                 |opts| $))
                          (COND
                           ((NULL (SPADCALL |res| (QREFELT $ 512)))
                            (COND
                             ((SPADCALL |options| (QREFELT $ 483))
                              (PROGN (LETT #1# |res|) (GO #3=#:G1782))))))
                          (EXIT
                           (LETT |lres|
                                 (SPADCALL |res| |lres| (QREFELT $ 495)))))
                         (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                    (EXIT (SPADCALL |lres| (QREFELT $ 513)))))
              #3# (EXIT #1#))))))) 

(SDEFUN |GUESS;guessPRec;SM;119|
        ((|q| |Symbol|)
         ($ |Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
        (SPROG NIL (CONS #'|GUESS;guessPRec;SM;119!0| (VECTOR |q| $)))) 

(SDEFUN |GUESS;guessPRec;SM;119!0| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG ($ |q|)
          (LETT $ (QREFELT $$ 1))
          (LETT |q| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |z1|
                      (SPADCALL
                       (SPADCALL (CONS 0 (|spadConstant| $ 74))
                                 (QREFELT $ 489))
                       |z2| (QREFELT $ 511))
                      (SPADCALL |q| (QREFELT $ 523))))))) 

(SDEFUN |GUESS;guessRat;SM;120|
        ((|q| |Symbol|)
         ($ |Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
        (SPROG NIL (CONS #'|GUESS;guessRat;SM;120!0| (VECTOR |q| $)))) 

(SDEFUN |GUESS;guessRat;SM;120!0| ((|z1| NIL) (|z2| NIL) ($$ NIL))
        (PROG ($ |q|)
          (LETT $ (QREFELT $$ 1))
          (LETT |q| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |z1|
                      (SPADCALL
                       (LIST
                        (LIST
                         (SPADCALL (CONS 0 (|spadConstant| $ 95))
                                   (QREFELT $ 520))
                         (SPADCALL (CONS 0 (|spadConstant| $ 74))
                                   (QREFELT $ 489)))
                        |z2| (LIST (SPADCALL 'T (QREFELT $ 505))))
                       (QREFELT $ 506))
                      (SPADCALL |q| (QREFELT $ 523))))))) 

(SDEFUN |GUESS;guess;LLLLL;121|
        ((|list| |List| F)
         (|guessers| |List|
          (|Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
         (|ops| |List| (|Symbol|)) (|options| |List| (|GuessOption|))
         ($ |List| EXPRR))
        (SPROG
         ((|res| (|List| EXPRR)) (#1=#:G1895 NIL) (|guess| NIL)
          (|sumGuess| (|List| EXPRR)) (|summ| (EXPRR)) (|init| (EXPRR))
          (#2=#:G1894 NIL) (|var| (|Symbol|)) (|sumList| (|List| F))
          (#3=#:G1893 NIL) (|i| NIL) (#4=#:G1892 NIL) (#5=#:G1886 NIL)
          (#6=#:G1891 NIL) (|prodGuess| (|List| EXPRR)) (|prod| (EXPRR))
          (#7=#:G1890 NIL) (|prodList| (|List| F)) (#8=#:G1889 NIL)
          (#9=#:G1888 NIL)
          (|newMaxLevel| (|Union| (|NonNegativeInteger|) "arbitrary"))
          (#10=#:G1807 NIL) (#11=#:G1887 NIL) (|guesser| NIL)
          (|len| (|PositiveInteger|)) (#12=#:G1803 NIL) (|xx| (EXPRR)))
         (SEQ
          (EXIT
           (SEQ (LETT |newMaxLevel| (SPADCALL |options| (QREFELT $ 526)))
                (LETT |xx|
                      (SPADCALL (SPADCALL |options| (QREFELT $ 458))
                                (QREFELT $ 45)))
                (COND
                 ((SPADCALL |options| (QREFELT $ 359))
                  (COND
                   ((QEQCAR |newMaxLevel| 0)
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL "Guess: guessing level " (QREFELT $ 451))
                      (SPADCALL |newMaxLevel| (QREFELT $ 527)) (QREFELT $ 454))
                     (QREFELT $ 474))))))
                (LETT |res| NIL)
                (LETT |len|
                      (PROG1 (LETT #12# (LENGTH |list|))
                        (|check_subtype2| (> #12# 0) '(|PositiveInteger|)
                                          '(|NonNegativeInteger|) #12#)))
                (COND ((<= |len| 1) (PROGN (LETT #5# |res|) (GO #13=#:G1885))))
                (SEQ (LETT |guesser| NIL) (LETT #11# |guessers|) G190
                     (COND
                      ((OR (ATOM #11#) (PROGN (LETT |guesser| (CAR #11#)) NIL))
                       (GO G191)))
                     (SEQ
                      (LETT |res|
                            (SPADCALL (SPADCALL |list| |options| |guesser|)
                                      |res| (QREFELT $ 495)))
                      (EXIT
                       (COND
                        ((SPADCALL |options| (QREFELT $ 483))
                         (COND
                          ((NULL (NULL |res|))
                           (PROGN (LETT #5# |res|) (GO #13#))))))))
                     (LETT #11# (CDR #11#)) (GO G190) G191 (EXIT NIL))
                (COND
                 ((QEQCAR |newMaxLevel| 0)
                  (COND
                   ((ZEROP (QCDR |newMaxLevel|))
                    (PROGN (LETT #5# |res|) (GO #13#)))
                   (#14='T
                    (LETT |newMaxLevel|
                          (CONS 0
                                (PROG1 (LETT #10# (- (QCDR |newMaxLevel|) 1))
                                  (|check_subtype2| (>= #10# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #10#))))))))
                (COND
                 ((SPADCALL '|guessProduct| |ops| (QREFELT $ 528))
                  (COND
                   ((SPADCALL (|spadConstant| $ 143) |list| (QREFELT $ 529))
                    (SEQ (|spadConstant| $ 143)
                         (EXIT
                          (COND
                           ((SPADCALL |options| (QREFELT $ 359))
                            (SPADCALL
                             "Guess: cannot use guessProduct because of zeros"
                             (QREFELT $ 361)))))))
                   (#14#
                    (SEQ
                     (LETT |prodList|
                           (PROGN
                            (LETT #9# NIL)
                            (SEQ (LETT |i| 1) (LETT #8# (- |len| 1)) G190
                                 (COND ((|greater_SI| |i| #8#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT #9#
                                         (CONS
                                          (SPADCALL
                                           (SPADCALL |list| (+ |i| 1)
                                                     (QREFELT $ 530))
                                           (SPADCALL |list| |i|
                                                     (QREFELT $ 530))
                                           (QREFELT $ 531))
                                          #9#))))
                                 (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                                 (EXIT (NREVERSE #9#)))))
                     (EXIT
                      (COND
                       ((NULL
                         (SPADCALL (ELT $ 540) |prodList| (QREFELT $ 444)))
                        (SEQ
                         (LETT |var|
                               (SPADCALL '|p|
                                         (LIST
                                          (SPADCALL |len| (QREFELT $ 541)))
                                         (QREFELT $ 543)))
                         (LETT |prodGuess| NIL)
                         (SEQ (LETT |guess| NIL)
                              (LETT #7#
                                    (SPADCALL |prodList| |guessers| |ops|
                                              (SPADCALL
                                               (LIST
                                                (SPADCALL |var|
                                                          (QREFELT $ 544))
                                                (SPADCALL |newMaxLevel|
                                                          (QREFELT $ 545)))
                                               |options| (QREFELT $ 494))
                                              (QREFELT $ 547)))
                              G190
                              (COND
                               ((OR (ATOM #7#)
                                    (PROGN (LETT |guess| (CAR #7#)) NIL))
                                (GO G191)))
                              (SEQ
                               (LETT |init|
                                     (SPADCALL
                                      (SPADCALL |list| 1 (QREFELT $ 530))
                                      (QREFELT $ 10)))
                               (LETT |prod|
                                     (SPADCALL |guess|
                                               (SPADCALL |var|
                                                         (SPADCALL
                                                          (|spadConstant| $
                                                                          246)
                                                          (SPADCALL |xx|
                                                                    (|spadConstant|
                                                                     $ 197)
                                                                    (QREFELT $
                                                                             247))
                                                          (QREFELT $ 549))
                                                         (QREFELT $ 551))
                                               (QREFELT $ 553)))
                               (EXIT
                                (LETT |prodGuess|
                                      (CONS
                                       (SPADCALL |init| |prod| (QREFELT $ 104))
                                       |prodGuess|))))
                              (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))
                         (EXIT
                          (SEQ (LETT |guess| NIL) (LETT #6# |prodGuess|) G190
                               (COND
                                ((OR (ATOM #6#)
                                     (PROGN (LETT |guess| (CAR #6#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (COND
                                  ((NULL
                                    (SPADCALL |guess| |res| (QREFELT $ 482)))
                                   (LETT |res| (CONS |guess| |res|))))))
                               (LETT #6# (CDR #6#)) (GO G190) G191
                               (EXIT NIL))))))))))))
                (COND
                 ((SPADCALL |options| (QREFELT $ 483))
                  (COND
                   ((NULL (NULL |res|)) (PROGN (LETT #5# |res|) (GO #13#))))))
                (COND
                 ((SPADCALL '|guessSum| |ops| (QREFELT $ 528))
                  (SEQ
                   (LETT |sumList|
                         (PROGN
                          (LETT #4# NIL)
                          (SEQ (LETT |i| 1) (LETT #3# (- |len| 1)) G190
                               (COND ((|greater_SI| |i| #3#) (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #4#
                                       (CONS
                                        (SPADCALL
                                         (SPADCALL |list| (+ |i| 1)
                                                   (QREFELT $ 530))
                                         (SPADCALL |list| |i| (QREFELT $ 530))
                                         (QREFELT $ 554))
                                        #4#))))
                               (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                               (EXIT (NREVERSE #4#)))))
                   (EXIT
                    (COND
                     ((NULL
                       (SPADCALL
                        (CONS #'|GUESS;guess;LLLLL;121!0| (VECTOR $ |sumList|))
                        |sumList| (QREFELT $ 444)))
                      (SEQ
                       (LETT |var|
                             (SPADCALL '|s|
                                       (LIST (SPADCALL |len| (QREFELT $ 541)))
                                       (QREFELT $ 543)))
                       (LETT |sumGuess| NIL)
                       (SEQ (LETT |guess| NIL)
                            (LETT #2#
                                  (SPADCALL |sumList| |guessers| |ops|
                                            (SPADCALL
                                             (LIST
                                              (SPADCALL |var| (QREFELT $ 544))
                                              (SPADCALL |newMaxLevel|
                                                        (QREFELT $ 545)))
                                             |options| (QREFELT $ 494))
                                            (QREFELT $ 547)))
                            G190
                            (COND
                             ((OR (ATOM #2#)
                                  (PROGN (LETT |guess| (CAR #2#)) NIL))
                              (GO G191)))
                            (SEQ
                             (LETT |init|
                                   (SPADCALL
                                    (SPADCALL |list| 1 (QREFELT $ 530))
                                    (QREFELT $ 10)))
                             (LETT |summ|
                                   (SPADCALL |guess|
                                             (SPADCALL |var|
                                                       (SPADCALL
                                                        (|spadConstant| $ 246)
                                                        (SPADCALL |xx|
                                                                  (|spadConstant|
                                                                   $ 197)
                                                                  (QREFELT $
                                                                           247))
                                                        (QREFELT $ 549))
                                                       (QREFELT $ 551))
                                             (QREFELT $ 556)))
                             (EXIT
                              (LETT |sumGuess|
                                    (CONS
                                     (SPADCALL |init| |summ| (QREFELT $ 93))
                                     |sumGuess|))))
                            (LETT #2# (CDR #2#)) (GO G190) G191 (EXIT NIL))
                       (EXIT
                        (SEQ (LETT |guess| NIL) (LETT #1# |sumGuess|) G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |guess| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (COND
                                ((NULL
                                  (SPADCALL |guess| |res| (QREFELT $ 482)))
                                 (LETT |res| (CONS |guess| |res|))))))
                             (LETT #1# (CDR #1#)) (GO G190) G191
                             (EXIT NIL))))))))))
                (EXIT |res|)))
          #13# (EXIT #5#)))) 

(SDEFUN |GUESS;guess;LLLLL;121!0| ((|z1| NIL) ($$ NIL))
        (PROG (|sumList| $)
          (LETT |sumList| (QREFELT $$ 1))
          (LETT $ (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |z1|
                      (SPADCALL |sumList| (|spadConstant| $ 74)
                                (QREFELT $ 530))
                      (QREFELT $ 555)))))) 

(SDEFUN |GUESS;guess;LL;122| ((|list| |List| F) ($ |List| EXPRR))
        (SPADCALL |list| (LIST (ELT $ 521)) (LIST '|guessProduct| '|guessSum|)
                  NIL (QREFELT $ 547))) 

(SDEFUN |GUESS;guess;LLL;123|
        ((|list| |List| F) (|options| |List| (|GuessOption|)) ($ |List| EXPRR))
        (SPADCALL |list| (LIST (ELT $ 521)) (LIST '|guessProduct| '|guessSum|)
                  |options| (QREFELT $ 547))) 

(SDEFUN |GUESS;guess;LLLL;124|
        ((|list| |List| F)
         (|guessers| |List|
          (|Mapping| (|List| EXPRR) (|List| F) (|List| (|GuessOption|))))
         (|ops| |List| (|Symbol|)) ($ |List| EXPRR))
        (SPADCALL |list| |guessers| |ops| NIL (QREFELT $ 547))) 

(DECLAIM (NOTINLINE |Guess;|)) 

(DEFUN |Guess| (&REST #1=#:G1903)
  (SPROG NIL
         (PROG (#2=#:G1904)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|Guess|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |Guess;|) #1#) (LETT #2# T))
                (COND ((NOT #2#) (HREM |$ConstructorCache| '|Guess|)))))))))) 

(DEFUN |Guess;| (|#1| |#2| |#3| |#4| |#5|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$5 NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|))
    (LETT DV$2 (|devaluate| |#2|))
    (LETT DV$3 (|devaluate| |#3|))
    (LETT DV$4 (|devaluate| |#4|))
    (LETT DV$5 (|devaluate| |#5|))
    (LETT |dv$| (LIST '|Guess| DV$1 DV$2 DV$3 DV$4 DV$5))
    (LETT $ (GETREFV 560))
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Symbol|)))
                                         (|HasCategory| |#2|
                                                        '(|RetractableTo|
                                                          (|Symbol|))))))))
    (|haddProp| |$ConstructorCache| '|Guess| (LIST DV$1 DV$2 DV$3 DV$4 DV$5)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (QSETREFV $ 10 |#5|)
    (SETF |pv$| (QREFELT $ 3))
    (COND
     ((|HasCategory| |#1| '(|RetractableTo| (|Symbol|)))
      (COND
       ((|HasCategory| |#2| '(|RetractableTo| (|Symbol|)))
        (PROGN
         (QSETREFV $ 24 (CONS (|dispatchFunction| |GUESS;guessExpRat;SM;5|) $))
         (QSETREFV $ 26
                   (CONS (|dispatchFunction| |GUESS;guessBinRat;SM;6|) $)))))))
    (COND
     ((|HasCategory| |#1| '(|RetractableTo| (|Symbol|)))
      (COND
       ((|HasCategory| |#2| '(|RetractableTo| (|Symbol|)))
        (PROGN
         (QSETREFV $ 242
                   (CONS (|dispatchFunction| |GUESS;diffHP;SM;58|) $)))))))
    (COND
     ((|HasCategory| |#1| '(|RetractableTo| (|Symbol|)))
      (COND
       ((|HasCategory| |#2| '(|RetractableTo| (|Symbol|)))
        (PROGN
         (QSETREFV $ 321
                   (CONS (|dispatchFunction| |GUESS;shiftHP;SM;81|) $)))))))
    (COND
     ((|HasCategory| |#1| '(|RetractableTo| (|Symbol|)))
      (COND
       ((|HasCategory| |#2| '(|RetractableTo| (|Symbol|)))
        (PROGN
         (QSETREFV $ 514 (CONS (|dispatchFunction| |GUESS;guessADE;SM;110|) $))
         (QSETREFV $ 515
                   (CONS (|dispatchFunction| |GUESS;guessHolo;SM;111|) $)))))))
    (COND
     ((|HasCategory| |#1| '(|RetractableTo| (|Symbol|)))
      (COND
       ((|HasCategory| |#2| '(|RetractableTo| (|Symbol|)))
        (PROGN
         (QSETREFV $ 523 (CONS (|dispatchFunction| |GUESS;guessRec;SM;118|) $))
         (QSETREFV $ 524
                   (CONS (|dispatchFunction| |GUESS;guessPRec;SM;119|) $))
         (QSETREFV $ 525
                   (CONS (|dispatchFunction| |GUESS;guessRat;SM;120|) $)))))))
    $))) 

(MAKEPROP '|Guess| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) (|local| |#4|) (|local| |#5|) (|List| 8)
              (|List| 6) (|List| 484)
              (|GuessExpBin| 6 7 8 (NRTEVAL (QREFELT $ 9))
                             (NRTEVAL (QREFELT $ 10)))
              (0 . |guessExpRat|) |GUESS;guessExpRat;LL;1|
              |GUESS;guessExpRat;LLL;2| (6 . |guessBinRat|)
              |GUESS;guessBinRat;LL;3| |GUESS;guessBinRat;LLL;4|
              (|Mapping| 11 12 13) (|Symbol|) (12 . |guessExpRat|)
              (17 . |guessExpRat|) (22 . |guessBinRat|) (27 . |guessBinRat|)
              (|List| 22) (32 . |variables|) (|List| 27) (|Mapping| 27 7)
              (|List| 7) (|ListFunctions2| 7 27) (37 . |map|) (|Fraction| 7)
              (43 . |numer|) (48 . |denom|) (53 . |setUnion|) (|Mapping| 27 6)
              (|ListFunctions2| 6 27) (59 . |map|) (|String|) (65 . |elt|)
              (|Mapping| 27 27 27) (71 . |reduce|) (77 . |coerce|)
              (|Mapping| 8 22) (|ListFunctions2| 22 8) (82 . |map|)
              (88 . |coerce|) (|SparseUnivariatePolynomial| 6) (|Mapping| 6 7)
              (|SparseUnivariatePolynomial| 7)
              (|SparseUnivariatePolynomialFunctions2| 7 6) (93 . |map|)
              (|Union| 73 '"arbitrary") (|GuessOptionFunctions0|)
              (99 . |maxPower|) (|Union| 73 89) (104 . |homogeneous|)
              (|Union| 75 '"arbitrary") (109 . |maxDerivative|) (114 . |Somos|)
              (119 . |One|) (123 . |One|) (|Stream| 85) (|Integer|)
              (|PartitionsAndPermutations|) (127 . |partitions|) (133 . |inc|)
              (|Mapping| 66 66) (|Stream| 66) (138 . |stream|)
              (|PositiveInteger|) (144 . |One|) (|NonNegativeInteger|)
              (148 . +) (154 . |partitions|) (|Stream| 65) (|Mapping| 65 66)
              (|StreamFunctions2| 66 65) (161 . |map|) (167 . |partitions|)
              (|StreamFunctions1| 85) (172 . |concat|) (|List| 66)
              (177 . |cons|) (183 . |conjugates|) (188 . |#|) (|Boolean|)
              (193 . =) (|Mapping| 89 85) (199 . |select|) (205 . +) (211 . +)
              (217 . |Zero|) (|Mapping| 66 66 66) (221 . |reduce|) (228 . =)
              (|List| 85) (|Partition|) (234 . |powers|) (239 . |second|)
              (244 . ^) (250 . *) (|Mapping| 8 8 8) (256 . |reduce|)
              (|U32Vector|) (262 . |construct|)
              (|U32VectorPolynomialOperations|) (267 . |differentiate|)
              (274 . |pow|) (282 . |truncated_multiplication|)
              (|Mapping| 107 107 107) (|List| 107) (290 . |reduce|) (|Void|)
              (296 . |copy_first|) (|UnivariateFormalPowerSeries| 6) (303 . ^)
              (309 . *) (|Mapping| 118 118 118) (|List| 118) (315 . |reduce|)
              (321 . ^) (|Mapping| 6 6) (327 . |map|)
              (|UnivariateFormalPowerSeriesFunctions| 6) (333 . |hadamard|)
              (|SparseMultivariatePolynomial| 6 75) (339 . ^)
              (|Mapping| 129 129) (|UnivariateFormalPowerSeries| 129)
              (345 . |map|) (|UnivariateFormalPowerSeriesFunctions| 129)
              (351 . |hadamard|) (|Mapping| 132 132 132) (|List| 132)
              (357 . |reduce|) (|Stream| 118) (|Mapping| 118 85)
              (|StreamFunctions2| 85 118) (363 . |map|) (369 . |Zero|)
              (373 . |Zero|) (|Vector| 107) (377 . |setelt!|) (384 . ~=)
              (390 . |differentiate|) (396 . |Zero|) (400 . *) (|Vector| 132)
              (406 . |setelt!|) (|Union| $ '"failed") (413 . |subtractIfCan|)
              (|List| 100) (419 . |position|) (|Reference| 155) (425 . |deref|)
              (430 . |coerce|) (435 . |partition|) (|Reference| 99)
              (440 . |deref|) (445 . |setref|) (451 . |setref|) (457 . |max|)
              (463 . |first|) (|Mapping| 66 85) (|ListFunctions2| 85 66)
              (468 . |map|) (474 . |reduce|) (480 . |ref|) (485 . |ref|)
              (490 . |#|) (495 . |One|) (499 . |first|) (504 . |vector|)
              (509 . |vector|) (|Stream| 8) (|Mapping| 8 85)
              (|StreamFunctions2| 85 8) (514 . |map|) (520 . |empty?|)
              (525 . -) (531 . |max|) (|Stream| 75) (|Mapping| 75 85 75)
              (|StreamFunctions2| 85 75) (537 . |scan|) (544 . D) (551 . D)
              (557 . D) (|FractionFreeFastGaussian| 7 52) (563 . |DiffAction|)
              (|FractionFreeFastGaussian| 129 132) (570 . |DiffAction|)
              (577 . |DiffC|) (582 . |One|) (586 . |maxMixedDegree|)
              (591 . |displayKind|) (596 . |One|) (600 . |first|)
              (606 . |complete|) (611 . |entries|) (616 . |elt|) (622 . |One|)
              (|Mapping| 139 118) (|Mapping| 145 114 66 66) (|Mapping| 207 75)
              (|Mapping| 151 132) (|Mapping| 209 309) (|Mapping| 178 8 22)
              (|Mapping| 7 75 75 52) (|Mapping| 129 75 75 132)
              (|Mapping| 8 75 22 8) (|Mapping| 31 75)
              (|Record| (|:| |degreeStream| 185) (|:| |guessStream| 206)
                        (|:| |guessModGen| 208) (|:| |testGen| 210)
                        (|:| |exprStream| 211) (|:| |kind| 22) (|:| |qvar| 22)
                        (|:| A 212) (|:| AF 213) (|:| AX 214) (|:| C 215))
              |GUESS;diffHP;LR;43| (626 . |elt|) (632 . |functionNames|)
              (637 . ~=) (643 . |coerce|) (648 . ~=) (|List| 12) (654 . |elt|)
              (|Mapping| 75 85) (660 . |map|) |GUESS;algDepHP;LLR;47|
              (666 . |eval|) (673 . |multiplyExponents|)
              (679 . |multiplyExponents|) |GUESS;substHP;LR;51|
              (685 . |coerce|) (690 . *) (|Mapping| 6 66)
              (696 . |multiplyCoefficients|) (702 . |coerce|)
              (|Mapping| 129 66) (707 . |multiplyCoefficients|) (713 . |zero?|)
              (718 . =) (|Mapping| 216 13) (724 . |diffHP|) (729 . |coerce|)
              (734 . |factorial|) (739 . /) (745 . |Zero|) (749 . -)
              (755 . |quoByVar|) (|Mapping| 118 118) (|MappingPackage1| 118)
              (760 . ^) (766 . |quoByVar|) (|Mapping| 132 132)
              (|MappingPackage1| 132) (771 . ^)
              (|IntegerCombinatoricFunctions| 66) (777 . |stirling2|)
              (783 . |ShiftAction|) (790 . |ShiftAction|) (797 . |ShiftC|)
              (802 . |monomial|) (808 . -) (|Fraction| 66) (814 . |One|)
              (818 . -) (823 . ^) (829 . |elt|) (835 . |One|)
              (839 . |monomial|) (845 . -) (851 . ^) |GUESS;shiftHP;LR;68|
              (857 . *) (863 . ^) (869 . |coerce|) (874 . |qShiftAction|)
              (882 . |qShiftAction|) (890 . |qShiftC|) (896 . *) (902 . |elt|)
              (|Mapping| 122 118) (|StreamTensor| 118) (908 . |tensorMap|)
              (914 . |#|) (919 . |new|) (|SingleInteger|) (925 . |One|)
              (929 . ^) (935 . |rem|) (941 . |setelt!|) (948 . /)
              (954 . |ceiling|) (959 . |rest|) (964 . |copy|) (969 . |elt|)
              (975 . |cons|) (981 . |reverse!|) (|List| 145) (986 . |cons|)
              (992 . |rem|) (998 . -) (1003 . |reverse!|) (|List| $)
              (1008 . |concat|) (1013 . |Zero|) (|Mapping| 315 75)
              (|StreamTensor| 75) (1017 . |tensorMap|) (|List| 73)
              (1023 . |first|) (1028 . >) (1034 . *) (1040 . |elt|)
              (1046 . |concat|) (|List| 75) (1052 . |cons|) (1058 . |reverse!|)
              (|Mapping| 11 8) (|StreamTensor| 8) (1063 . |tensorMap|)
              (1069 . |shiftHP|) (1074 . |zero?|) (1079 . |leadingCoefficient|)
              (1084 . |degree|) (1089 . |reductum|) (|Stream| 6)
              (1094 . |coerce|) (1099 . |series|) (|List| 129) (|Stream| 129)
              (1104 . |coerce|) (|IndexedExponents| 75) (1109 . |monomial|)
              (1115 . |monomial|) (|StreamFunctions2| 66 129) (1121 . |map|)
              (1127 . |concat|) (1133 . |series|)
              (|SparseUnivariatePolynomial| 129) (|Mapping| 129 6)
              (|SparseUnivariatePolynomialFunctions2| 6 129) (1138 . |map|)
              (|UnivariatePolynomial| (NRTEVAL '|x|) 6)
              (1144 . |univariatePolynomial|) (1150 . |makeSUP|) (|List| 50)
              (|Mapping| 50 118) (|ListFunctions2| 118 50) (1155 . |map|)
              (1161 . |zero?|) (1166 . |allDegrees|) (1171 . |maxDegree|)
              (|Union| '"skip" '"MonteCarlo" '"deterministic") (1176 . |check|)
              (|Union| '"good" '"reject" '"no_solution") (|Mapping| 355 376)
              (|ModularHermitePadeSolver| 6 7) (1181 . |gen_Monte_Carlo_check|)
              (1191 . |debug|) (|OutputPackage|) (1196 . |output|)
              (|Union| 379 89) (1201 . |HP_solve|) (1212 . |elt|)
              (1218 . |setelt!|) (1225 . +) (1231 . +) (1237 . +) (1243 . +)
              (1249 . +) (|Mapping| 75 75 75) (1255 . |reduce|)
              (1261 . |first|) (1267 . |complete|) (1272 . |entries|)
              (|List| 52) (|Vector| 52) (1277 . |vector|) (|Matrix| 52)
              (1282 . |generalInterpolation|) (|Vector| 50) (1290 . |vector|)
              (|FractionFreeFastGaussianFractions| 7 52 50)
              (1295 . |generalInterpolation|) (1303 . |column|)
              (1309 . |entries|) (1314 . |Zero|) (1318 . |zero?|)
              (1323 . |elt|) (1330 . |leadingCoefficient|) (1335 . |content|)
              (1340 . |gcd|) (1345 . |exquo|) (1351 . |setelt!|)
              (1359 . |explicitlyEmpty?|) (|Stream| 379) (1364 . |empty|)
              (1368 . |empty?|) (1373 . |frst|) (1378 . >=) (|Mapping| 89 66)
              (1384 . |every?|) (1390 . |rst|) (1395 . |concat|) (|Mapping| $)
              (1401 . |delay|) (|Mapping| 66 75) (|ListFunctions2| 75 66)
              (1406 . |map|) (|Stream| 315) (1412 . |genVectorStream|)
              (|Mapping| 85 315) (|StreamFunctions2| 315 85) (1419 . |map|)
              (1425 . |empty|) (1429 . |concat|) (|Vector| 6) (1435 . |vector|)
              (1440 . |checkExtraValues|) (|SingletonAsOrderedSet|)
              (1445 . |create|) (1449 . |coerce|) (1454 . |elt|)
              (1460 . |eval|) (1467 . |retract|) (1472 . |elt|) (1478 . |gcd|)
              (1484 . |exquo|) (1490 . *) (1496 . ~=) (1502 . *) (1508 . +)
              (1514 . ~=) (|Vector| 7) (1520 . |elt|) (1526 . |elt|)
              (1532 . |zero?|) (1537 . |zero?|) (1542 . |zero?|)
              (1547 . |zero?|) (1552 . |zero?|) (1557 . |zero?|)
              (|Mapping| 89 6) (1562 . |every?|) (|List| 339) (|Vector| 339)
              (1568 . |vector|) (1573 . |generalCoefficient|) (1581 . |zero?|)
              (|OutputForm|) (1586 . |message|) (1591 . |print|)
              (1596 . |coerce|) (1601 . |hconcat|) (1607 . |ground?|)
              (1612 . |variableName|) (1617 . |numerator|) (1622 . |indexName|)
              (|Mapping| 8 6) (|StreamFunctions2| 6 8) (1627 . |map|)
              (|BasicOperator|) (|RecurrenceOperator| 66 8) (1633 . |makeFEq|)
              (1643 . |makeRec|) (1652 . |safety|) (1657 . |functionName|)
              (1662 . |operator|) (1667 . |elt|) (1673 . |rest|)
              (1679 . |empty?|) (1684 . |coerce|) (1689 . |hconcat|)
              (1694 . |output|) (1699 . |first|) (1705 . |complete|)
              (1710 . |entries|) (1715 . |coerce|) (1720 . |empty?|)
              (1725 . |first|) (1730 . |rst|) (1735 . |member?|) (1741 . |one|)
              (|GuessOption|) (1746 . |Somos|) (|List| 13) (1751 . |concat|)
              (1756 . |homogeneous|) (1761 . |maxPower|) (1766 . |concat|)
              (1772 . |checkOptions|) (1777 . |displayKind|)
              (1782 . |maxSubst|) (1787 . |append|) (1793 . |append|)
              |GUESS;guessAlgDep;LLL;98| |GUESS;guessAlgDep;LL;99|
              |GUESS;guessADE;LLL;100| |GUESS;guessADE;LL;101|
              (1799 . |maxDerivative|) |GUESS;guessAlg;LLL;102|
              |GUESS;guessAlg;LL;103| |GUESS;guessHolo;LLL;104|
              |GUESS;guessHolo;LL;105| (1804 . |allDegrees|) (1809 . |concat|)
              |GUESS;guessPade;LLL;106| |GUESS;guessPade;LL;107|
              |GUESS;guessFE;LLL;108| |GUESS;guessFE;LL;109| (1814 . |cons|)
              (1820 . |empty?|) (1825 . |reverse!|) (1830 . |guessADE|)
              (1835 . |guessHolo|) |GUESS;guessRec;LLL;112|
              |GUESS;guessRec;LL;113| |GUESS;guessPRec;LLL;114|
              |GUESS;guessPRec;LL;115| (1840 . |maxShift|)
              |GUESS;guessRat;LLL;116| |GUESS;guessRat;LL;117|
              (1845 . |guessRec|) (1850 . |guessPRec|) (1855 . |guessRat|)
              (1860 . |maxLevel|) (1865 . |coerce|) (1870 . |member?|)
              (1876 . |member?|) (1882 . |elt|) (1888 . /) (1894 . |one?|)
              (1899 . |one?|) (1904 . |one?|) (1909 . |one?|) (1914 . |one?|)
              (1919 . |one?|) (1924 . |one?|) (1929 . |one?|) (1934 . |one?|)
              (1939 . |coerce|) (|List| 450) (1944 . |subscript|)
              (1950 . |indexName|) (1955 . |maxLevel|) (|List| 21)
              |GUESS;guess;LLLLL;121| (|Segment| 8) (1960 . SEGMENT)
              (|SegmentBinding| 8) (1966 . |equation|) (|SegmentBinding| $)
              (1972 . |product|) (1978 . -) (1984 . =) (1990 . |summation|)
              |GUESS;guess;LL;122| |GUESS;guess;LLL;123|
              |GUESS;guess;LLLL;124|)
           '#(|substHP| 1996 |shiftHP| 2001 |guessRec| 2011 |guessRat| 2027
              |guessPade| 2043 |guessPRec| 2054 |guessHolo| 2070 |guessFE| 2086
              |guessExpRat| 2097 |guessBinRat| 2113 |guessAlgDep| 2129
              |guessAlg| 2140 |guessADE| 2151 |guess| 2167 |diffHP| 2193
              |algDepHP| 2203)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|guess| ((|List| |#3|) (|List| |#1|))) T)
                                   '((|guess|
                                      ((|List| |#3|) (|List| |#1|)
                                       (|List| (|GuessOption|))))
                                     T)
                                   '((|guess|
                                      ((|List| |#3|) (|List| |#1|)
                                       (|List|
                                        (|Mapping| (|List| |#3|) (|List| |#1|)
                                                   (|List| (|GuessOption|))))
                                       (|List| (|Symbol|))))
                                     T)
                                   '((|guess|
                                      ((|List| |#3|) (|List| |#1|)
                                       (|List|
                                        (|Mapping| (|List| |#3|) (|List| |#1|)
                                                   (|List| (|GuessOption|))))
                                       (|List| (|Symbol|))
                                       (|List| (|GuessOption|))))
                                     T)
                                   '((|guessExpRat|
                                      ((|List| |#3|) (|List| |#1|)))
                                     T)
                                   '((|guessExpRat|
                                      ((|List| |#3|) (|List| |#1|)
                                       (|List| (|GuessOption|))))
                                     T)
                                   '((|guessBinRat|
                                      ((|List| |#3|) (|List| |#1|)))
                                     T)
                                   '((|guessBinRat|
                                      ((|List| |#3|) (|List| |#1|)
                                       (|List| (|GuessOption|))))
                                     T)
                                   '((|guessExpRat|
                                      ((|Mapping| (|List| |#3|) (|List| |#1|)
                                                  (|List| (|GuessOption|)))
                                       (|Symbol|)))
                                     (AND (|has| 7 (|RetractableTo| 22))
                                          (|has| 6 (|RetractableTo| 22))))
                                   '((|guessBinRat|
                                      ((|Mapping| (|List| |#3|) (|List| |#1|)
                                                  (|List| (|GuessOption|)))
                                       (|Symbol|)))
                                     (AND (|has| 7 (|RetractableTo| 22))
                                          (|has| 6 (|RetractableTo| 22))))
                                   '((|guessAlgDep|
                                      ((|List| |#3|) (|List| (|List| |#1|))))
                                     T)
                                   '((|guessAlgDep|
                                      ((|List| |#3|) (|List| (|List| |#1|))
                                       (|List| (|GuessOption|))))
                                     T)
                                   '((|guessADE| ((|List| |#3|) (|List| |#1|)))
                                     T)
                                   '((|guessADE|
                                      ((|List| |#3|) (|List| |#1|)
                                       (|List| (|GuessOption|))))
                                     T)
                                   '((|guessFE| ((|List| |#3|) (|List| |#1|)))
                                     T)
                                   '((|guessFE|
                                      ((|List| |#3|) (|List| |#1|)
                                       (|List| (|GuessOption|))))
                                     T)
                                   '((|guessAlg| ((|List| |#3|) (|List| |#1|)))
                                     T)
                                   '((|guessAlg|
                                      ((|List| |#3|) (|List| |#1|)
                                       (|List| (|GuessOption|))))
                                     T)
                                   '((|guessHolo|
                                      ((|List| |#3|) (|List| |#1|)))
                                     T)
                                   '((|guessHolo|
                                      ((|List| |#3|) (|List| |#1|)
                                       (|List| (|GuessOption|))))
                                     T)
                                   '((|guessPade|
                                      ((|List| |#3|) (|List| |#1|)
                                       (|List| (|GuessOption|))))
                                     T)
                                   '((|guessPade|
                                      ((|List| |#3|) (|List| |#1|)))
                                     T)
                                   '((|guessRec| ((|List| |#3|) (|List| |#1|)))
                                     T)
                                   '((|guessRec|
                                      ((|List| |#3|) (|List| |#1|)
                                       (|List| (|GuessOption|))))
                                     T)
                                   '((|guessPRec|
                                      ((|List| |#3|) (|List| |#1|)
                                       (|List| (|GuessOption|))))
                                     T)
                                   '((|guessPRec|
                                      ((|List| |#3|) (|List| |#1|)))
                                     T)
                                   '((|guessRat|
                                      ((|List| |#3|) (|List| |#1|)
                                       (|List| (|GuessOption|))))
                                     T)
                                   '((|guessRat| ((|List| |#3|) (|List| |#1|)))
                                     T)
                                   '((|algDepHP|
                                      ((|Record|
                                        (|:| |degreeStream|
                                             (|Stream| (|NonNegativeInteger|)))
                                        (|:| |guessStream|
                                             (|Mapping|
                                              (|Stream|
                                               (|UnivariateFormalPowerSeries|
                                                |#1|))
                                              (|UnivariateFormalPowerSeries|
                                               |#1|)))
                                        (|:| |guessModGen|
                                             (|Mapping|
                                              (|Mapping|
                                               (|Vector| (|U32Vector|))
                                               (|List| (|U32Vector|))
                                               (|Integer|) (|Integer|))
                                              (|NonNegativeInteger|)))
                                        (|:| |testGen|
                                             (|Mapping|
                                              (|Mapping|
                                               (|Vector|
                                                (|UnivariateFormalPowerSeries|
                                                 (|SparseMultivariatePolynomial|
                                                  |#1|
                                                  (|NonNegativeInteger|))))
                                               (|UnivariateFormalPowerSeries|
                                                (|SparseMultivariatePolynomial|
                                                 |#1| (|NonNegativeInteger|))))
                                              (|List| (|PositiveInteger|))))
                                        (|:| |exprStream|
                                             (|Mapping| (|Stream| |#3|) |#3|
                                                        (|Symbol|)))
                                        (|:| |kind| (|Symbol|))
                                        (|:| |qvar| (|Symbol|))
                                        (|:| A
                                             (|Mapping| |#2|
                                                        (|NonNegativeInteger|)
                                                        (|NonNegativeInteger|)
                                                        (|SparseUnivariatePolynomial|
                                                         |#2|)))
                                        (|:| AF
                                             (|Mapping|
                                              (|SparseMultivariatePolynomial|
                                               |#1| (|NonNegativeInteger|))
                                              (|NonNegativeInteger|)
                                              (|NonNegativeInteger|)
                                              (|UnivariateFormalPowerSeries|
                                               (|SparseMultivariatePolynomial|
                                                |#1| (|NonNegativeInteger|)))))
                                        (|:| AX
                                             (|Mapping| |#3|
                                                        (|NonNegativeInteger|)
                                                        (|Symbol|) |#3|))
                                        (|:| C
                                             (|Mapping| (|List| |#2|)
                                                        (|NonNegativeInteger|))))
                                       (|List| (|List| |#1|))
                                       (|List| (|GuessOption|))))
                                     T)
                                   '((|diffHP|
                                      ((|Record|
                                        (|:| |degreeStream|
                                             (|Stream| (|NonNegativeInteger|)))
                                        (|:| |guessStream|
                                             (|Mapping|
                                              (|Stream|
                                               (|UnivariateFormalPowerSeries|
                                                |#1|))
                                              (|UnivariateFormalPowerSeries|
                                               |#1|)))
                                        (|:| |guessModGen|
                                             (|Mapping|
                                              (|Mapping|
                                               (|Vector| (|U32Vector|))
                                               (|List| (|U32Vector|))
                                               (|Integer|) (|Integer|))
                                              (|NonNegativeInteger|)))
                                        (|:| |testGen|
                                             (|Mapping|
                                              (|Mapping|
                                               (|Vector|
                                                (|UnivariateFormalPowerSeries|
                                                 (|SparseMultivariatePolynomial|
                                                  |#1|
                                                  (|NonNegativeInteger|))))
                                               (|UnivariateFormalPowerSeries|
                                                (|SparseMultivariatePolynomial|
                                                 |#1| (|NonNegativeInteger|))))
                                              (|List| (|PositiveInteger|))))
                                        (|:| |exprStream|
                                             (|Mapping| (|Stream| |#3|) |#3|
                                                        (|Symbol|)))
                                        (|:| |kind| (|Symbol|))
                                        (|:| |qvar| (|Symbol|))
                                        (|:| A
                                             (|Mapping| |#2|
                                                        (|NonNegativeInteger|)
                                                        (|NonNegativeInteger|)
                                                        (|SparseUnivariatePolynomial|
                                                         |#2|)))
                                        (|:| AF
                                             (|Mapping|
                                              (|SparseMultivariatePolynomial|
                                               |#1| (|NonNegativeInteger|))
                                              (|NonNegativeInteger|)
                                              (|NonNegativeInteger|)
                                              (|UnivariateFormalPowerSeries|
                                               (|SparseMultivariatePolynomial|
                                                |#1| (|NonNegativeInteger|)))))
                                        (|:| AX
                                             (|Mapping| |#3|
                                                        (|NonNegativeInteger|)
                                                        (|Symbol|) |#3|))
                                        (|:| C
                                             (|Mapping| (|List| |#2|)
                                                        (|NonNegativeInteger|))))
                                       (|List| (|GuessOption|))))
                                     T)
                                   '((|substHP|
                                      ((|Record|
                                        (|:| |degreeStream|
                                             (|Stream| (|NonNegativeInteger|)))
                                        (|:| |guessStream|
                                             (|Mapping|
                                              (|Stream|
                                               (|UnivariateFormalPowerSeries|
                                                |#1|))
                                              (|UnivariateFormalPowerSeries|
                                               |#1|)))
                                        (|:| |guessModGen|
                                             (|Mapping|
                                              (|Mapping|
                                               (|Vector| (|U32Vector|))
                                               (|List| (|U32Vector|))
                                               (|Integer|) (|Integer|))
                                              (|NonNegativeInteger|)))
                                        (|:| |testGen|
                                             (|Mapping|
                                              (|Mapping|
                                               (|Vector|
                                                (|UnivariateFormalPowerSeries|
                                                 (|SparseMultivariatePolynomial|
                                                  |#1|
                                                  (|NonNegativeInteger|))))
                                               (|UnivariateFormalPowerSeries|
                                                (|SparseMultivariatePolynomial|
                                                 |#1| (|NonNegativeInteger|))))
                                              (|List| (|PositiveInteger|))))
                                        (|:| |exprStream|
                                             (|Mapping| (|Stream| |#3|) |#3|
                                                        (|Symbol|)))
                                        (|:| |kind| (|Symbol|))
                                        (|:| |qvar| (|Symbol|))
                                        (|:| A
                                             (|Mapping| |#2|
                                                        (|NonNegativeInteger|)
                                                        (|NonNegativeInteger|)
                                                        (|SparseUnivariatePolynomial|
                                                         |#2|)))
                                        (|:| AF
                                             (|Mapping|
                                              (|SparseMultivariatePolynomial|
                                               |#1| (|NonNegativeInteger|))
                                              (|NonNegativeInteger|)
                                              (|NonNegativeInteger|)
                                              (|UnivariateFormalPowerSeries|
                                               (|SparseMultivariatePolynomial|
                                                |#1| (|NonNegativeInteger|)))))
                                        (|:| AX
                                             (|Mapping| |#3|
                                                        (|NonNegativeInteger|)
                                                        (|Symbol|) |#3|))
                                        (|:| C
                                             (|Mapping| (|List| |#2|)
                                                        (|NonNegativeInteger|))))
                                       (|List| (|GuessOption|))))
                                     T)
                                   '((|shiftHP|
                                      ((|Record|
                                        (|:| |degreeStream|
                                             (|Stream| (|NonNegativeInteger|)))
                                        (|:| |guessStream|
                                             (|Mapping|
                                              (|Stream|
                                               (|UnivariateFormalPowerSeries|
                                                |#1|))
                                              (|UnivariateFormalPowerSeries|
                                               |#1|)))
                                        (|:| |guessModGen|
                                             (|Mapping|
                                              (|Mapping|
                                               (|Vector| (|U32Vector|))
                                               (|List| (|U32Vector|))
                                               (|Integer|) (|Integer|))
                                              (|NonNegativeInteger|)))
                                        (|:| |testGen|
                                             (|Mapping|
                                              (|Mapping|
                                               (|Vector|
                                                (|UnivariateFormalPowerSeries|
                                                 (|SparseMultivariatePolynomial|
                                                  |#1|
                                                  (|NonNegativeInteger|))))
                                               (|UnivariateFormalPowerSeries|
                                                (|SparseMultivariatePolynomial|
                                                 |#1| (|NonNegativeInteger|))))
                                              (|List| (|PositiveInteger|))))
                                        (|:| |exprStream|
                                             (|Mapping| (|Stream| |#3|) |#3|
                                                        (|Symbol|)))
                                        (|:| |kind| (|Symbol|))
                                        (|:| |qvar| (|Symbol|))
                                        (|:| A
                                             (|Mapping| |#2|
                                                        (|NonNegativeInteger|)
                                                        (|NonNegativeInteger|)
                                                        (|SparseUnivariatePolynomial|
                                                         |#2|)))
                                        (|:| AF
                                             (|Mapping|
                                              (|SparseMultivariatePolynomial|
                                               |#1| (|NonNegativeInteger|))
                                              (|NonNegativeInteger|)
                                              (|NonNegativeInteger|)
                                              (|UnivariateFormalPowerSeries|
                                               (|SparseMultivariatePolynomial|
                                                |#1| (|NonNegativeInteger|)))))
                                        (|:| AX
                                             (|Mapping| |#3|
                                                        (|NonNegativeInteger|)
                                                        (|Symbol|) |#3|))
                                        (|:| C
                                             (|Mapping| (|List| |#2|)
                                                        (|NonNegativeInteger|))))
                                       (|List| (|GuessOption|))))
                                     T)
                                   '((|shiftHP|
                                      ((|Mapping|
                                        (|Record|
                                         (|:| |degreeStream|
                                              (|Stream|
                                               (|NonNegativeInteger|)))
                                         (|:| |guessStream|
                                              (|Mapping|
                                               (|Stream|
                                                (|UnivariateFormalPowerSeries|
                                                 |#1|))
                                               (|UnivariateFormalPowerSeries|
                                                |#1|)))
                                         (|:| |guessModGen|
                                              (|Mapping|
                                               (|Mapping|
                                                (|Vector| (|U32Vector|))
                                                (|List| (|U32Vector|))
                                                (|Integer|) (|Integer|))
                                               (|NonNegativeInteger|)))
                                         (|:| |testGen|
                                              (|Mapping|
                                               (|Mapping|
                                                (|Vector|
                                                 (|UnivariateFormalPowerSeries|
                                                  (|SparseMultivariatePolynomial|
                                                   |#1|
                                                   (|NonNegativeInteger|))))
                                                (|UnivariateFormalPowerSeries|
                                                 (|SparseMultivariatePolynomial|
                                                  |#1|
                                                  (|NonNegativeInteger|))))
                                               (|List| (|PositiveInteger|))))
                                         (|:| |exprStream|
                                              (|Mapping| (|Stream| |#3|) |#3|
                                                         (|Symbol|)))
                                         (|:| |kind| (|Symbol|))
                                         (|:| |qvar| (|Symbol|))
                                         (|:| A
                                              (|Mapping| |#2|
                                                         (|NonNegativeInteger|)
                                                         (|NonNegativeInteger|)
                                                         (|SparseUnivariatePolynomial|
                                                          |#2|)))
                                         (|:| AF
                                              (|Mapping|
                                               (|SparseMultivariatePolynomial|
                                                |#1| (|NonNegativeInteger|))
                                               (|NonNegativeInteger|)
                                               (|NonNegativeInteger|)
                                               (|UnivariateFormalPowerSeries|
                                                (|SparseMultivariatePolynomial|
                                                 |#1|
                                                 (|NonNegativeInteger|)))))
                                         (|:| AX
                                              (|Mapping| |#3|
                                                         (|NonNegativeInteger|)
                                                         (|Symbol|) |#3|))
                                         (|:| C
                                              (|Mapping| (|List| |#2|)
                                                         (|NonNegativeInteger|))))
                                        (|List| (|GuessOption|)))
                                       (|Symbol|)))
                                     (AND (|has| 7 (|RetractableTo| 22))
                                          (|has| 6 (|RetractableTo| 22))))
                                   '((|diffHP|
                                      ((|Mapping|
                                        (|Record|
                                         (|:| |degreeStream|
                                              (|Stream|
                                               (|NonNegativeInteger|)))
                                         (|:| |guessStream|
                                              (|Mapping|
                                               (|Stream|
                                                (|UnivariateFormalPowerSeries|
                                                 |#1|))
                                               (|UnivariateFormalPowerSeries|
                                                |#1|)))
                                         (|:| |guessModGen|
                                              (|Mapping|
                                               (|Mapping|
                                                (|Vector| (|U32Vector|))
                                                (|List| (|U32Vector|))
                                                (|Integer|) (|Integer|))
                                               (|NonNegativeInteger|)))
                                         (|:| |testGen|
                                              (|Mapping|
                                               (|Mapping|
                                                (|Vector|
                                                 (|UnivariateFormalPowerSeries|
                                                  (|SparseMultivariatePolynomial|
                                                   |#1|
                                                   (|NonNegativeInteger|))))
                                                (|UnivariateFormalPowerSeries|
                                                 (|SparseMultivariatePolynomial|
                                                  |#1|
                                                  (|NonNegativeInteger|))))
                                               (|List| (|PositiveInteger|))))
                                         (|:| |exprStream|
                                              (|Mapping| (|Stream| |#3|) |#3|
                                                         (|Symbol|)))
                                         (|:| |kind| (|Symbol|))
                                         (|:| |qvar| (|Symbol|))
                                         (|:| A
                                              (|Mapping| |#2|
                                                         (|NonNegativeInteger|)
                                                         (|NonNegativeInteger|)
                                                         (|SparseUnivariatePolynomial|
                                                          |#2|)))
                                         (|:| AF
                                              (|Mapping|
                                               (|SparseMultivariatePolynomial|
                                                |#1| (|NonNegativeInteger|))
                                               (|NonNegativeInteger|)
                                               (|NonNegativeInteger|)
                                               (|UnivariateFormalPowerSeries|
                                                (|SparseMultivariatePolynomial|
                                                 |#1|
                                                 (|NonNegativeInteger|)))))
                                         (|:| AX
                                              (|Mapping| |#3|
                                                         (|NonNegativeInteger|)
                                                         (|Symbol|) |#3|))
                                         (|:| C
                                              (|Mapping| (|List| |#2|)
                                                         (|NonNegativeInteger|))))
                                        (|List| (|GuessOption|)))
                                       (|Symbol|)))
                                     (AND (|has| 7 (|RetractableTo| 22))
                                          (|has| 6 (|RetractableTo| 22))))
                                   '((|guessRec|
                                      ((|Mapping| (|List| |#3|) (|List| |#1|)
                                                  (|List| (|GuessOption|)))
                                       (|Symbol|)))
                                     (AND (|has| 7 (|RetractableTo| 22))
                                          (|has| 6 (|RetractableTo| 22))))
                                   '((|guessPRec|
                                      ((|Mapping| (|List| |#3|) (|List| |#1|)
                                                  (|List| (|GuessOption|)))
                                       (|Symbol|)))
                                     (AND (|has| 7 (|RetractableTo| 22))
                                          (|has| 6 (|RetractableTo| 22))))
                                   '((|guessRat|
                                      ((|Mapping| (|List| |#3|) (|List| |#1|)
                                                  (|List| (|GuessOption|)))
                                       (|Symbol|)))
                                     (AND (|has| 7 (|RetractableTo| 22))
                                          (|has| 6 (|RetractableTo| 22))))
                                   '((|guessADE|
                                      ((|Mapping| (|List| |#3|) (|List| |#1|)
                                                  (|List| (|GuessOption|)))
                                       (|Symbol|)))
                                     (AND (|has| 7 (|RetractableTo| 22))
                                          (|has| 6 (|RetractableTo| 22))))
                                   '((|guessHolo|
                                      ((|Mapping| (|List| |#3|) (|List| |#1|)
                                                  (|List| (|GuessOption|)))
                                       (|Symbol|)))
                                     (AND (|has| 7 (|RetractableTo| 22))
                                          (|has| 6 (|RetractableTo| 22)))))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 559
                                            '(2 14 11 12 13 15 2 14 11 12 13 18
                                              1 14 21 22 23 1 0 21 22 24 1 14
                                              21 22 25 1 0 21 22 26 1 7 27 0 28
                                              2 32 29 30 31 33 1 34 7 0 35 1 34
                                              7 0 36 2 27 0 0 0 37 2 39 29 38
                                              12 40 2 41 0 0 0 42 2 29 27 43 0
                                              44 1 8 0 22 45 2 47 11 46 27 48 1
                                              34 0 7 49 2 53 50 51 52 54 1 56
                                              55 13 57 1 56 58 13 59 1 56 60 13
                                              61 1 56 58 13 62 0 6 0 63 0 7 0
                                              64 2 67 65 66 66 68 1 66 0 0 69 2
                                              71 0 70 66 72 0 73 0 74 2 75 0 0
                                              0 76 3 67 65 66 66 66 77 2 80 78
                                              79 71 81 1 67 65 66 82 1 83 65 78
                                              84 2 65 0 85 0 86 1 67 65 65 87 1
                                              85 75 0 88 2 75 89 0 0 90 2 65 0
                                              91 0 92 2 8 0 0 0 93 2 66 0 0 0
                                              94 0 75 0 95 3 85 66 96 0 66 97 2
                                              66 89 0 0 98 1 100 99 85 101 1 85
                                              66 0 102 2 8 0 0 75 103 2 8 0 0 0
                                              104 2 11 8 105 0 106 1 107 0 85
                                              108 3 109 107 107 75 66 110 4 109
                                              107 107 73 75 66 111 4 109 107
                                              107 107 66 66 112 2 114 107 113 0
                                              115 3 109 116 107 107 66 117 2
                                              118 0 0 75 119 2 118 0 0 0 120 2
                                              122 118 121 0 123 2 6 0 0 75 124
                                              2 118 0 125 0 126 2 127 118 118
                                              118 128 2 129 0 0 75 130 2 132 0
                                              131 0 133 2 134 132 132 132 135 2
                                              137 132 136 0 138 2 141 139 140
                                              65 142 0 6 0 143 0 7 0 144 3 145
                                              107 0 66 107 146 2 75 89 0 0 147
                                              2 109 107 107 66 148 0 132 0 149
                                              2 132 0 0 0 150 3 151 132 0 66
                                              132 152 2 100 153 0 0 154 2 155
                                              66 100 0 156 1 157 155 0 158 1
                                              100 85 0 159 1 100 0 85 160 1 161
                                              99 0 162 2 161 99 0 99 163 2 157
                                              155 0 155 164 2 66 0 0 0 165 1 85
                                              66 0 166 2 168 85 167 99 169 2 85
                                              66 96 0 170 1 161 0 99 171 1 157
                                              0 155 172 1 114 75 0 173 0 75 0
                                              174 1 114 107 0 175 1 145 0 114
                                              176 1 151 0 137 177 2 180 178 179
                                              65 181 1 85 89 0 182 2 66 0 0 0
                                              183 2 75 0 0 0 184 3 187 185 75
                                              186 65 188 3 8 0 0 22 75 189 2
                                              118 0 0 75 190 2 132 0 0 75 191 3
                                              192 7 75 75 52 193 3 194 129 75
                                              75 132 195 1 192 31 75 196 0 8 0
                                              197 1 56 75 13 198 1 56 22 13 199
                                              0 118 0 200 2 65 0 0 75 201 1 65
                                              0 0 202 1 65 99 0 203 2 65 85 0
                                              66 204 0 132 0 205 2 11 8 0 66
                                              218 1 56 27 13 219 2 66 89 0 0
                                              220 1 22 0 41 221 2 22 89 0 0 222
                                              2 223 12 0 66 224 2 187 185 225
                                              65 226 3 8 0 0 0 0 228 2 118 0 0
                                              73 229 2 132 0 0 73 230 1 6 0 22
                                              232 2 66 0 75 0 233 2 118 0 234 0
                                              235 1 129 0 6 236 2 132 0 237 0
                                              238 1 66 89 0 239 2 22 89 0 0 240
                                              1 0 241 22 242 1 8 0 66 243 1 66
                                              0 0 244 2 8 0 0 0 245 0 8 0 246 2
                                              8 0 0 0 247 1 118 0 0 248 2 250
                                              249 249 75 251 1 132 0 0 252 2
                                              254 253 253 75 255 2 256 66 66 66
                                              257 3 192 7 75 75 52 258 3 194
                                              129 75 75 132 259 1 192 31 75 260
                                              2 118 0 6 75 261 2 118 0 0 0 262
                                              0 263 0 264 1 263 0 0 265 2 118 0
                                              0 263 266 2 185 75 0 66 267 0 129
                                              0 268 2 132 0 129 75 269 2 132 0
                                              0 0 270 2 132 0 0 263 271 2 8 0
                                              75 0 273 2 8 0 0 0 274 1 7 0 22
                                              275 4 192 7 7 75 75 52 276 4 194
                                              129 129 75 75 132 277 2 192 31 7
                                              75 278 2 118 0 6 0 279 2 118 0 0
                                              0 280 2 282 139 139 281 283 1 107
                                              75 0 284 2 107 0 75 66 285 0 286
                                              0 287 2 66 0 0 75 288 2 66 0 0 0
                                              289 3 107 66 0 66 66 290 2 263 0
                                              66 66 291 1 263 66 0 292 1 114 0
                                              0 293 1 107 0 0 294 2 107 66 0 66
                                              295 2 114 0 107 0 296 1 114 0 0
                                              297 2 298 0 145 0 299 2 75 0 0 0
                                              300 1 286 0 0 301 1 298 0 0 302 1
                                              145 0 303 304 0 286 0 305 2 307
                                              185 185 306 308 1 309 73 0 310 2
                                              73 89 0 0 311 2 132 0 129 0 312 2
                                              132 0 0 0 313 2 137 0 0 0 314 2
                                              315 0 75 0 316 1 137 0 0 317 2
                                              319 178 178 318 320 1 0 241 22
                                              321 1 50 89 0 322 1 50 6 0 323 1
                                              50 75 0 324 1 50 0 0 325 1 326 0
                                              12 327 1 118 0 326 328 1 330 0
                                              329 331 2 332 0 75 75 333 2 129 0
                                              6 332 334 2 335 330 237 71 336 2
                                              330 0 0 0 337 1 132 0 330 338 2
                                              341 339 340 50 342 2 118 343 0 75
                                              344 1 343 50 0 345 2 348 346 347
                                              122 349 1 6 89 0 350 1 56 89 13
                                              351 1 56 60 13 352 1 56 353 13
                                              354 6 357 356 356 223 22 22 75
                                              207 358 1 56 89 13 359 1 360 116
                                              41 361 7 357 362 223 85 22 22 75
                                              207 356 363 2 315 75 0 66 364 3
                                              315 75 0 66 75 365 2 118 0 0 0
                                              366 2 132 0 0 0 367 2 7 0 0 0 368
                                              2 50 0 0 0 369 2 6 0 0 0 370 2
                                              315 75 371 0 372 2 139 0 0 75 373
                                              1 139 0 0 374 1 139 122 0 375 1
                                              377 0 376 378 4 192 379 31 212
                                              377 315 380 1 381 0 346 382 4 383
                                              379 31 212 381 315 384 2 379 377
                                              0 66 385 1 377 376 0 386 0 52 0
                                              387 1 7 89 0 388 3 379 52 0 66 66
                                              389 1 52 7 0 390 1 52 7 0 391 1 7
                                              0 303 392 2 52 153 0 7 393 4 379
                                              52 0 66 66 52 394 1 65 89 0 395 0
                                              396 0 397 1 65 89 0 398 1 65 85 0
                                              399 2 66 89 0 0 400 2 85 89 401 0
                                              402 1 65 0 0 403 2 396 0 379 0
                                              404 1 396 0 405 406 2 408 85 407
                                              315 409 3 192 410 75 75 75 411 2
                                              413 65 412 410 414 0 65 0 415 2
                                              65 0 85 0 416 1 417 0 12 418 1 56
                                              89 13 419 0 420 0 421 1 7 0 66
                                              422 2 377 52 0 66 423 3 52 0 0
                                              420 7 424 1 52 7 0 425 2 417 6 0
                                              66 426 2 7 0 0 0 427 2 7 153 0 0
                                              428 2 7 0 0 0 429 2 7 89 0 0 430
                                              2 34 0 7 0 431 2 34 0 0 0 432 2
                                              34 89 0 0 433 2 434 7 0 66 435 2
                                              376 52 0 66 436 1 52 89 0 437 1 8
                                              89 0 438 1 118 89 0 439 1 132 89
                                              0 440 1 75 89 0 441 1 379 89 0
                                              442 2 12 89 443 0 444 1 446 0 445
                                              447 4 194 129 213 151 75 446 448
                                              1 129 89 0 449 1 450 0 41 451 1
                                              450 116 0 452 1 66 450 0 453 2
                                              450 0 0 0 454 1 129 89 0 455 1 56
                                              22 13 456 1 8 0 0 457 1 56 22 13
                                              458 2 460 178 459 326 461 6 463 8
                                              462 22 22 8 11 178 464 5 463 8
                                              462 22 8 11 178 465 1 56 75 13
                                              466 1 56 22 13 467 1 462 0 22 468
                                              2 8 0 462 0 469 2 185 0 0 75 470
                                              1 185 89 0 471 1 75 450 0 472 1
                                              450 0 303 473 1 360 116 450 474 2
                                              178 0 0 75 475 1 178 0 0 476 1
                                              178 11 0 477 1 11 450 0 478 1 396
                                              89 0 479 1 396 379 0 480 1 396 0
                                              0 481 2 11 89 8 0 482 1 56 89 13
                                              483 1 484 0 58 485 1 486 0 303
                                              487 1 484 0 58 488 1 484 0 55 489
                                              2 13 0 0 0 490 1 56 116 13 491 1
                                              484 0 22 492 1 484 0 55 493 2 13
                                              0 0 0 494 2 11 0 0 0 495 1 484 0
                                              60 500 1 484 0 89 505 1 13 0 303
                                              506 2 13 0 484 0 511 1 11 89 0
                                              512 1 11 0 0 513 1 0 21 22 514 1
                                              0 21 22 515 1 484 0 60 520 1 0 21
                                              22 523 1 0 21 22 524 1 0 21 22
                                              525 1 56 60 13 526 1 60 450 0 527
                                              2 27 89 22 0 528 2 12 89 6 0 529
                                              2 12 6 0 66 530 2 6 0 0 0 531 1 8
                                              89 0 532 1 118 89 0 533 1 66 89 0
                                              534 1 132 89 0 535 1 75 89 0 536
                                              1 7 89 0 537 1 50 89 0 538 1 52
                                              89 0 539 1 6 89 0 540 1 73 450 0
                                              541 2 22 0 0 542 543 1 484 0 22
                                              544 1 484 0 60 545 2 548 0 8 8
                                              549 2 550 0 22 548 551 2 8 0 0
                                              552 553 2 6 0 0 0 554 2 6 89 0 0
                                              555 2 8 0 0 552 556 1 0 216 13
                                              231 1 1 241 22 321 1 0 216 13 272
                                              1 1 21 22 523 2 0 11 12 13 516 1
                                              0 11 12 517 1 1 21 22 525 2 0 11
                                              12 13 521 1 0 11 12 522 2 0 11 12
                                              13 507 1 0 11 12 508 1 1 21 22
                                              524 1 0 11 12 519 2 0 11 12 13
                                              518 1 1 21 22 515 1 0 11 12 504 2
                                              0 11 12 13 503 2 0 11 12 13 509 1
                                              0 11 12 510 1 1 21 22 24 2 0 11
                                              12 13 17 1 0 11 12 16 1 1 21 22
                                              26 1 0 11 12 19 2 0 11 12 13 20 1
                                              0 11 223 497 2 0 11 223 13 496 1
                                              0 11 12 502 2 0 11 12 13 501 1 1
                                              21 22 514 2 0 11 12 13 498 1 0 11
                                              12 499 2 0 11 12 13 558 1 0 11 12
                                              557 4 0 11 12 546 27 13 547 3 0
                                              11 12 546 27 559 1 1 241 22 242 1
                                              0 216 13 217 2 0 216 223 13
                                              227)))))
           '|lookupComplete|)) 
