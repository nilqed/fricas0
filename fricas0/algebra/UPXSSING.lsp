
(SDEFUN |UPXSSING;retractIfCan;$U;1|
        ((|f| $)
         ($ |Union| (|UnivariatePuiseuxSeries| FE |var| |cen|) "failed"))
        (SEQ
         (COND
          ((EQL (SPADCALL |f| (QREFELT $ 11)) 1)
           (COND
            ((SPADCALL (SPADCALL |f| (QREFELT $ 14)) (QREFELT $ 16))
             (EXIT (CONS 0 (SPADCALL |f| (QREFELT $ 18))))))))
         (EXIT (CONS 1 "failed")))) 

(SDEFUN |UPXSSING;recip;$U;2| ((|f| $) ($ |Union| $ "failed"))
        (COND
         ((EQL (SPADCALL |f| (QREFELT $ 11)) 1)
          (CONS 0
                (SPADCALL
                 (SPADCALL (SPADCALL |f| (QREFELT $ 18)) (QREFELT $ 21))
                 (SPADCALL (SPADCALL |f| (QREFELT $ 14)) (QREFELT $ 22))
                 (QREFELT $ 23))))
         ('T (CONS 1 "failed")))) 

(PUT '|UPXSSING;makeTerm| '|SPADreplace|
     '(XLAM (|coef| |expon|) (VECTOR |coef| |expon| NIL))) 

(SDEFUN |UPXSSING;makeTerm|
        ((|coef| |UnivariatePuiseuxSeries| FE |var| |cen|)
         (|expon| |ExponentialOfUnivariatePuiseuxSeries| FE |var| |cen|)
         ($ |Record| (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
          (|:| |%expon|
               (|ExponentialOfUnivariatePuiseuxSeries| FE |var| |cen|))
          (|:| |%expTerms|
               (|List|
                (|Record| (|:| |k| (|Fraction| (|Integer|))) (|:| |c| FE))))))
        (VECTOR |coef| |expon| NIL)) 

(PUT '|UPXSSING;coeff| '|SPADreplace| '(XLAM (|term|) (QVELT |term| 0))) 

(SDEFUN |UPXSSING;coeff|
        ((|term| |Record|
          (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
          (|:| |%expon|
               (|ExponentialOfUnivariatePuiseuxSeries| FE |var| |cen|))
          (|:| |%expTerms|
               (|List|
                (|Record| (|:| |k| (|Fraction| (|Integer|))) (|:| |c| FE)))))
         ($ |UnivariatePuiseuxSeries| FE |var| |cen|))
        (QVELT |term| 0)) 

(PUT '|UPXSSING;exponent| '|SPADreplace| '(XLAM (|term|) (QVELT |term| 1))) 

(SDEFUN |UPXSSING;exponent|
        ((|term| |Record|
          (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
          (|:| |%expon|
               (|ExponentialOfUnivariatePuiseuxSeries| FE |var| |cen|))
          (|:| |%expTerms|
               (|List|
                (|Record| (|:| |k| (|Fraction| (|Integer|))) (|:| |c| FE)))))
         ($ |ExponentialOfUnivariatePuiseuxSeries| FE |var| |cen|))
        (QVELT |term| 1)) 

(PUT '|UPXSSING;exponentTerms| '|SPADreplace| '(XLAM (|term|) (QVELT |term| 2))) 

(SDEFUN |UPXSSING;exponentTerms|
        ((|term| |Record|
          (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
          (|:| |%expon|
               (|ExponentialOfUnivariatePuiseuxSeries| FE |var| |cen|))
          (|:| |%expTerms|
               (|List|
                (|Record| (|:| |k| (|Fraction| (|Integer|))) (|:| |c| FE)))))
         ($ |List| (|Record| (|:| |k| (|Fraction| (|Integer|))) (|:| |c| FE))))
        (QVELT |term| 2)) 

(PUT '|UPXSSING;setExponentTerms!| '|SPADreplace|
     '(XLAM (|term| |list|) (QSETVELT |term| 2 |list|))) 

(SDEFUN |UPXSSING;setExponentTerms!|
        ((|term| |Record|
          (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
          (|:| |%expon|
               (|ExponentialOfUnivariatePuiseuxSeries| FE |var| |cen|))
          (|:| |%expTerms|
               (|List|
                (|Record| (|:| |k| (|Fraction| (|Integer|))) (|:| |c| FE)))))
         (|list| |List|
          (|Record| (|:| |k| (|Fraction| (|Integer|))) (|:| |c| FE)))
         ($ |List| (|Record| (|:| |k| (|Fraction| (|Integer|))) (|:| |c| FE))))
        (QSETVELT |term| 2 |list|)) 

(SDEFUN |UPXSSING;computeExponentTerms!|
        ((|term| |Record|
          (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
          (|:| |%expon|
               (|ExponentialOfUnivariatePuiseuxSeries| FE |var| |cen|))
          (|:| |%expTerms|
               (|List|
                (|Record| (|:| |k| (|Fraction| (|Integer|))) (|:| |c| FE)))))
         ($ |List| (|Record| (|:| |k| (|Fraction| (|Integer|))) (|:| |c| FE))))
        (|UPXSSING;setExponentTerms!| |term|
         (SPADCALL
          (SPADCALL (SPADCALL (|UPXSSING;exponent| |term| $) (QREFELT $ 28))
                    (QREFELT $ 29))
          (QREFELT $ 31))
         $)) 

(SDEFUN |UPXSSING;terms|
        ((|f| $)
         ($ |List|
          (|Record| (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                    (|:| |%expon|
                         (|ExponentialOfUnivariatePuiseuxSeries| FE |var|
                                                                 |cen|))
                    (|:| |%expTerms|
                         (|List|
                          (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                    (|:| |c| FE)))))))
        (COND ((SPADCALL |f| (QREFELT $ 32)) NIL)
              ('T
               (CONS
                (|UPXSSING;makeTerm| (SPADCALL |f| (QREFELT $ 18))
                 (SPADCALL |f| (QREFELT $ 14)) $)
                (|UPXSSING;terms| (SPADCALL |f| (QREFELT $ 33)) $))))) 

(SDEFUN |UPXSSING;sortAndDiscardTerms|
        ((|termList| |List|
          (|Record| (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                    (|:| |%expon|
                         (|ExponentialOfUnivariatePuiseuxSeries| FE |var|
                                                                 |cen|))
                    (|:| |%expTerms|
                         (|List|
                          (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                    (|:| |c| FE))))))
         ($ |Record|
          (|:| |%zeroTerms|
               (|List|
                (|Record|
                 (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                 (|:| |%expon|
                      (|ExponentialOfUnivariatePuiseuxSeries| FE |var| |cen|))
                 (|:| |%expTerms|
                      (|List|
                       (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                 (|:| |c| FE)))))))
          (|:| |%infiniteTerms|
               (|List|
                (|Record|
                 (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                 (|:| |%expon|
                      (|ExponentialOfUnivariatePuiseuxSeries| FE |var| |cen|))
                 (|:| |%expTerms|
                      (|List|
                       (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                 (|:| |c| FE)))))))
          (|:| |%failedTerms|
               (|List|
                (|Record|
                 (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                 (|:| |%expon|
                      (|ExponentialOfUnivariatePuiseuxSeries| FE |var| |cen|))
                 (|:| |%expTerms|
                      (|List|
                       (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                 (|:| |c| FE)))))))
          (|:| |%puiseuxSeries| (|UnivariatePuiseuxSeries| FE |var| |cen|))))
        (SPROG
         ((|zeroTerms|
           #1=(|List|
               (|Record|
                (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                (|:| |%expon|
                     (|ExponentialOfUnivariatePuiseuxSeries| FE |var| |cen|))
                (|:| |%expTerms|
                     (|List|
                      (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                (|:| |c| FE)))))))
          (|zeroTermOrd| #2=(|Fraction| (|Integer|))) (|infiniteTerms| #1#)
          (|infTermOrd| #2#) (|sig| (|Integer|)) (|failedTerms| #1#)
          (|signum| (|Union| (|Integer|) "failed")) (|coef| (FE))
          (#3=#:G786 NIL)
          (|pSeries| (|UnivariatePuiseuxSeries| FE |var| |cen|)) (|ord| #2#)
          (|expon| (|ExponentialOfUnivariatePuiseuxSeries| FE |var| |cen|))
          (|term|
           (|Record| (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                     (|:| |%expon|
                          (|ExponentialOfUnivariatePuiseuxSeries| FE |var|
                                                                  |cen|))
                     (|:| |%expTerms|
                          (|List|
                           (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                     (|:| |c| FE)))))))
         (SEQ (LETT |zeroTerms| NIL . #4=(|UPXSSING;sortAndDiscardTerms|))
              (LETT |infiniteTerms| NIL . #4#) (LETT |failedTerms| NIL . #4#)
              (LETT |infTermOrd| (|spadConstant| $ 35) . #4#)
              (LETT |zeroTermOrd| (|spadConstant| $ 35) . #4#)
              (LETT |ord| (|spadConstant| $ 35) . #4#)
              (LETT |pSeries| (|spadConstant| $ 36) . #4#)
              (SEQ
               (EXIT
                (SEQ G190 (COND ((NULL (NULL (NULL |termList|))) (GO G191)))
                     (SEQ
                      (LETT |expon|
                            (|UPXSSING;exponent|
                             (LETT |term| (|SPADfirst| |termList|) . #4#) $)
                            . #4#)
                      (LETT |ord|
                            (SPADCALL |expon| (|spadConstant| $ 35)
                                      (QREFELT $ 38))
                            . #4#)
                      (EXIT
                       (COND
                        ((SPADCALL |ord| |infTermOrd| (QREFELT $ 39))
                         (PROGN (LETT #3# |$NoValue| . #4#) (GO #5=#:G781)))
                        ((SPADCALL |ord| (|spadConstant| $ 35) (QREFELT $ 40))
                         (SEQ
                          (LETT |pSeries| (|UPXSSING;coeff| |term| $) . #4#)
                          (LETT |zeroTerms| NIL . #4#)
                          (EXIT (PROGN (LETT #3# |$NoValue| . #4#) (GO #5#)))))
                        ('T
                         (SEQ
                          (LETT |coef| (SPADCALL |expon| |ord| (QREFELT $ 41))
                                . #4#)
                          (LETT |signum| (SPADCALL |coef| (QREFELT $ 44))
                                . #4#)
                          (EXIT
                           (COND
                            ((QEQCAR |signum| 1)
                             (SEQ
                              (LETT |failedTerms| (CONS |term| |failedTerms|)
                                    . #4#)
                              (EXIT (LETT |termList| (CDR |termList|) . #4#))))
                            ('T
                             (SEQ (LETT |sig| (QCDR |signum|) . #4#)
                                  (EXIT
                                   (COND
                                    ((EQL |sig| 1)
                                     (SEQ (LETT |infTermOrd| |ord| . #4#)
                                          (LETT |infiniteTerms|
                                                (CONS |term| |infiniteTerms|)
                                                . #4#)
                                          (LETT |zeroTerms| NIL . #4#)
                                          (EXIT
                                           (LETT |termList| (CDR |termList|)
                                                 . #4#))))
                                    ('T
                                     (SEQ
                                      (COND
                                       ((NULL |infiniteTerms|)
                                        (LETT |zeroTerms|
                                              (COND
                                               ((SPADCALL |ord| |zeroTermOrd|
                                                          (QREFELT $ 40))
                                                (CONS |term| |zeroTerms|))
                                               ('T
                                                (SEQ
                                                 (LETT |zeroTermOrd| |ord|
                                                       . #4#)
                                                 (EXIT
                                                  (SPADCALL |term|
                                                            (QREFELT $ 47))))))
                                              . #4#)))
                                      (EXIT
                                       (LETT |termList| (CDR |termList|)
                                             . #4#)))))))))))))))
                     NIL (GO G190) G191 (EXIT NIL)))
               #5# (EXIT #3#))
              (EXIT
               (VECTOR |zeroTerms| |infiniteTerms| (NREVERSE |failedTerms|)
                       |pSeries|))))) 

(SDEFUN |UPXSSING;termsWithExtremeLeadingCoef|
        ((|termList| |List|
          (|Record| (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                    (|:| |%expon|
                         (|ExponentialOfUnivariatePuiseuxSeries| FE |var|
                                                                 |cen|))
                    (|:| |%expTerms|
                         (|List|
                          (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                    (|:| |c| FE))))))
         (|ord| |Fraction| (|Integer|)) (|signum| |Integer|)
         ($ |Union|
          (|List|
           (|Record| (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                     (|:| |%expon|
                          (|ExponentialOfUnivariatePuiseuxSeries| FE |var|
                                                                  |cen|))
                     (|:| |%expTerms|
                          (|List|
                           (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                     (|:| |c| FE))))))
          "failed"))
        (SPROG
         ((|outList|
           (|List|
            (|Record| (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                      (|:| |%expon|
                           (|ExponentialOfUnivariatePuiseuxSeries| FE |var|
                                                                   |cen|))
                      (|:| |%expTerms|
                           (|List|
                            (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                      (|:| |c| FE)))))))
          (#1=#:G801 NIL) (|sig| (|Union| (|Integer|) "failed"))
          (|coefDiff| (FE)) (#2=#:G802 NIL) (|term| NIL) (|coefExtreme| (FE)))
         (SEQ
          (EXIT
           (SEQ
            (SEQ G190
                 (COND
                  ((NULL
                    (SPADCALL
                     (SPADCALL (|UPXSSING;exponent| (|SPADfirst| |termList|) $)
                               |ord| (QREFELT $ 41))
                     (|spadConstant| $ 37) (QREFELT $ 48)))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT |termList| (CDR |termList|)
                         . #3=(|UPXSSING;termsWithExtremeLeadingCoef|))))
                 NIL (GO G190) G191 (EXIT NIL))
            (EXIT
             (COND ((NULL |termList|) (|error| "UPXSSING: can't happen"))
                   ('T
                    (SEQ
                     (LETT |coefExtreme|
                           (SPADCALL
                            (|UPXSSING;exponent| (|SPADfirst| |termList|) $)
                            |ord| (QREFELT $ 41))
                           . #3#)
                     (LETT |outList|
                           (SPADCALL (|SPADfirst| |termList|) (QREFELT $ 47))
                           . #3#)
                     (LETT |termList| (CDR |termList|) . #3#)
                     (SEQ (LETT |term| NIL . #3#) (LETT #2# |termList| . #3#)
                          G190
                          (COND
                           ((OR (ATOM #2#)
                                (PROGN (LETT |term| (CAR #2#) . #3#) NIL))
                            (GO G191)))
                          (SEQ
                           (LETT |coefDiff|
                                 (SPADCALL
                                  (SPADCALL (|UPXSSING;exponent| |term| $)
                                            |ord| (QREFELT $ 41))
                                  |coefExtreme| (QREFELT $ 49))
                                 . #3#)
                           (EXIT
                            (COND
                             ((SPADCALL |coefDiff| (|spadConstant| $ 37)
                                        (QREFELT $ 48))
                              (LETT |outList| (CONS |term| |outList|) . #3#))
                             ('T
                              (SEQ
                               (LETT |sig| (SPADCALL |coefDiff| (QREFELT $ 44))
                                     . #3#)
                               (EXIT
                                (COND
                                 ((QEQCAR |sig| 1)
                                  (PROGN
                                   (LETT #1# (CONS 1 "failed") . #3#)
                                   (GO #4=#:G800)))
                                 ((EQL (QCDR |sig|) |signum|)
                                  (LETT |outList|
                                        (SPADCALL |term| (QREFELT $ 47))
                                        . #3#)))))))))
                          (LETT #2# (CDR #2#) . #3#) (GO G190) G191 (EXIT NIL))
                     (EXIT (CONS 0 |outList|))))))))
          #4# (EXIT #1#)))) 

(SDEFUN |UPXSSING;filterByOrder|
        ((|termList| |List|
          (|Record| (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                    (|:| |%expon|
                         (|ExponentialOfUnivariatePuiseuxSeries| FE |var|
                                                                 |cen|))
                    (|:| |%expTerms|
                         (|List|
                          (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                    (|:| |c| FE))))))
         (|predicate| |Mapping| (|Boolean|) (|Fraction| (|Integer|))
          (|Fraction| (|Integer|)))
         ($ |Record|
          (|:| |%list|
               (|List|
                (|Record|
                 (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                 (|:| |%expon|
                      (|ExponentialOfUnivariatePuiseuxSeries| FE |var| |cen|))
                 (|:| |%expTerms|
                      (|List|
                       (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                 (|:| |c| FE)))))))
          (|:| |%order| (|Fraction| (|Integer|)))))
        (SPROG
         ((#1=#:G820 NIL) (|term| NIL) (#2=#:G817 NIL) (#3=#:G816 NIL)
          (|outList|
           (|List|
            (|Record| (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                      (|:| |%expon|
                           (|ExponentialOfUnivariatePuiseuxSeries| FE |var|
                                                                   |cen|))
                      (|:| |%expTerms|
                           (|List|
                            (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                      (|:| |c| FE)))))))
          (|ordExtreme| #4=(|Fraction| (|Integer|))) (|ord| #4#)
          (#5=#:G819 NIL) (#6=#:G818 NIL))
         (SEQ
          (SEQ G190
               (COND
                ((NULL
                  (NULL (|UPXSSING;exponentTerms| (|SPADfirst| |termList|) $)))
                 (GO G191)))
               (SEQ
                (EXIT
                 (SEQ
                  (LETT |termList| (CDR |termList|)
                        . #7=(|UPXSSING;filterByOrder|))
                  (EXIT
                   (COND
                    ((NULL |termList|)
                     (PROGN
                      (LETT #6# (|error| "UPXSING: can't happen") . #7#)
                      (GO #8=#:G806)))))))
                #8# (EXIT #6#))
               NIL (GO G190) G191 (EXIT NIL))
          (LETT |ordExtreme|
                (QCAR
                 (|SPADfirst|
                  (|UPXSSING;exponentTerms| (|SPADfirst| |termList|) $)))
                . #7#)
          (LETT |outList| (SPADCALL (|SPADfirst| |termList|) (QREFELT $ 47))
                . #7#)
          (SEQ
           (EXIT
            (SEQ (LETT |term| NIL . #7#) (LETT #5# (CDR |termList|) . #7#) G190
                 (COND
                  ((OR (ATOM #5#) (PROGN (LETT |term| (CAR #5#) . #7#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (COND
                    ((NULL (NULL (|UPXSSING;exponentTerms| |term| $)))
                     (PROGN
                      (LETT #2#
                            (SEQ
                             (LETT |ord|
                                   (QCAR
                                    (|SPADfirst|
                                     (|UPXSSING;exponentTerms| |term| $)))
                                   . #7#)
                             (EXIT
                              (COND
                               ((SPADCALL |ord| |ordExtreme| (QREFELT $ 40))
                                (LETT |outList| (CONS |term| |outList|) . #7#))
                               ('T
                                (SEQ
                                 (EXIT
                                  (COND
                                   ((SPADCALL |ord| |ordExtreme| |predicate|)
                                    (PROGN
                                     (LETT #3#
                                           (SEQ (LETT |ordExtreme| |ord| . #7#)
                                                (EXIT
                                                 (LETT |outList|
                                                       (SPADCALL |term|
                                                                 (QREFELT $
                                                                          47))
                                                       . #7#)))
                                           . #7#)
                                     (GO #9=#:G809)))))
                                 #9# (EXIT #3#))))))
                            . #7#)
                      (GO #10=#:G812))))))
                 (LETT #5# (CDR #5#) . #7#) (GO G190) G191 (EXIT NIL)))
           #10# (EXIT #2#))
          (SEQ (LETT |term| NIL . #7#) (LETT #1# |outList| . #7#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |term| (CAR #1#) . #7#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (|UPXSSING;setExponentTerms!| |term|
                  (CDR (|UPXSSING;exponentTerms| |term| $)) $)))
               (LETT #1# (CDR #1#) . #7#) (GO G190) G191 (EXIT NIL))
          (EXIT (CONS |outList| |ordExtreme|))))) 

(SDEFUN |UPXSSING;dominantTermOnList|
        ((|termList| |List|
          (|Record| (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                    (|:| |%expon|
                         (|ExponentialOfUnivariatePuiseuxSeries| FE |var|
                                                                 |cen|))
                    (|:| |%expTerms|
                         (|List|
                          (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                    (|:| |c| FE))))))
         (|ord0| |Fraction| (|Integer|)) (|signum| |Integer|)
         ($ |Union|
          (|Record| (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                    (|:| |%expon|
                         (|ExponentialOfUnivariatePuiseuxSeries| FE |var|
                                                                 |cen|))
                    (|:| |%expTerms|
                         (|List|
                          (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                    (|:| |c| FE)))))
          "failed"))
        (SPROG
         ((|filtered|
           (|Record|
            (|:| |%list|
                 (|List|
                  (|Record|
                   (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                   (|:| |%expon|
                        (|ExponentialOfUnivariatePuiseuxSeries| FE |var|
                                                                |cen|))
                   (|:| |%expTerms|
                        (|List|
                         (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                   (|:| |c| FE)))))))
            (|:| |%order| (|Fraction| (|Integer|)))))
          (|newList|
           (|Union|
            (|List|
             (|Record| (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                       (|:| |%expon|
                            (|ExponentialOfUnivariatePuiseuxSeries| FE |var|
                                                                    |cen|))
                       (|:| |%expTerms|
                            (|List|
                             (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                       (|:| |c| FE))))))
            "failed")))
         (SEQ
          (LETT |newList|
                (|UPXSSING;termsWithExtremeLeadingCoef| |termList| |ord0|
                 |signum| $)
                . #1=(|UPXSSING;dominantTermOnList|))
          (EXIT
           (COND ((QEQCAR |newList| 1) (CONS 1 "failed"))
                 (#2='T
                  (SEQ (LETT |termList| (QCDR |newList|) . #1#)
                       (EXIT
                        (COND
                         ((NULL (CDR |termList|))
                          (CONS 0 (|SPADfirst| |termList|)))
                         (#2#
                          (SEQ
                           (LETT |filtered|
                                 (COND
                                  ((EQL |signum| 1)
                                   (|UPXSSING;filterByOrder| |termList|
                                    (ELT $ 50) $))
                                  (#2#
                                   (|UPXSSING;filterByOrder| |termList|
                                    (ELT $ 39) $)))
                                 . #1#)
                           (LETT |termList| (QCAR |filtered|) . #1#)
                           (EXIT
                            (COND
                             ((NULL (CDR |termList|))
                              (CONS 0 (|SPADfirst| |termList|)))
                             (#2#
                              (|UPXSSING;dominantTermOnList| |termList|
                               (QCDR |filtered|) |signum| $))))))))))))))) 

(SDEFUN |UPXSSING;iDominantTerm|
        ((|termList| |List|
          (|Record| (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                    (|:| |%expon|
                         (|ExponentialOfUnivariatePuiseuxSeries| FE |var|
                                                                 |cen|))
                    (|:| |%expTerms|
                         (|List|
                          (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                    (|:| |c| FE))))))
         ($ |Union|
          (|Record|
           (|:| |%term|
                (|Record|
                 (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                 (|:| |%expon|
                      (|ExponentialOfUnivariatePuiseuxSeries| FE |var| |cen|))
                 (|:| |%expTerms|
                      (|List|
                       (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                 (|:| |c| FE))))))
           (|:| |%type| (|String|)))
          "failed"))
        (SPROG
         ((#1=#:G852 NIL)
          (|dTerm|
           (|Union|
            (|Record| (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                      (|:| |%expon|
                           (|ExponentialOfUnivariatePuiseuxSeries| FE |var|
                                                                   |cen|))
                      (|:| |%expTerms|
                           (|List|
                            (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                      (|:| |c| FE)))))
            "failed"))
          (|ord0| (|Fraction| (|Integer|))) (#2=#:G854 NIL) (|term| NIL)
          (#3=#:G853 NIL)
          (|pSeries| #4=(|UnivariatePuiseuxSeries| FE |var| |cen|))
          (|failedTerms|
           #5=(|List|
               (|Record|
                (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                (|:| |%expon|
                     (|ExponentialOfUnivariatePuiseuxSeries| FE |var| |cen|))
                (|:| |%expTerms|
                     (|List|
                      (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                (|:| |c| FE)))))))
          (|infiniteTerms|
           #6=(|List|
               (|Record|
                (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                (|:| |%expon|
                     (|ExponentialOfUnivariatePuiseuxSeries| FE |var| |cen|))
                (|:| |%expTerms|
                     (|List|
                      (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                (|:| |c| FE)))))))
          (|zeroTerms|
           #7=(|List|
               (|Record|
                (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                (|:| |%expon|
                     (|ExponentialOfUnivariatePuiseuxSeries| FE |var| |cen|))
                (|:| |%expTerms|
                     (|List|
                      (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                (|:| |c| FE)))))))
          (|termRecord|
           (|Record| (|:| |%zeroTerms| #7#) (|:| |%infiniteTerms| #6#)
                     (|:| |%failedTerms| #5#) (|:| |%puiseuxSeries| #4#))))
         (SEQ
          (EXIT
           (SEQ
            (LETT |termRecord| (|UPXSSING;sortAndDiscardTerms| |termList| $)
                  . #8=(|UPXSSING;iDominantTerm|))
            (LETT |zeroTerms| (QVELT |termRecord| 0) . #8#)
            (LETT |infiniteTerms| (QVELT |termRecord| 1) . #8#)
            (LETT |failedTerms| (QVELT |termRecord| 2) . #8#)
            (LETT |pSeries| (QVELT |termRecord| 3) . #8#)
            (COND ((NULL (NULL |failedTerms|)) (EXIT (CONS 1 "failed"))))
            (COND
             ((NULL (SPADCALL |pSeries| (QREFELT $ 51)))
              (EXIT
               (CONS 0
                     (CONS
                      (|UPXSSING;makeTerm| |pSeries| (|spadConstant| $ 52) $)
                      "series")))))
            (COND
             ((NULL (NULL |infiniteTerms|))
              (EXIT
               (COND
                ((NULL (CDR |infiniteTerms|))
                 (CONS 0 (CONS (|SPADfirst| |infiniteTerms|) "infinity")))
                (#9='T
                 (SEQ
                  (SEQ (LETT |term| NIL . #8#) (LETT #3# |infiniteTerms| . #8#)
                       G190
                       (COND
                        ((OR (ATOM #3#)
                             (PROGN (LETT |term| (CAR #3#) . #8#) NIL))
                         (GO G191)))
                       (SEQ (EXIT (|UPXSSING;computeExponentTerms!| |term| $)))
                       (LETT #3# (CDR #3#) . #8#) (GO G190) G191 (EXIT NIL))
                  (LETT |ord0|
                        (SPADCALL
                         (|UPXSSING;exponent| (|SPADfirst| |infiniteTerms|) $)
                         (QREFELT $ 53))
                        . #8#)
                  (LETT |dTerm|
                        (|UPXSSING;dominantTermOnList| |infiniteTerms| |ord0| 1
                         $)
                        . #8#)
                  (EXIT
                   (COND
                    ((QEQCAR |dTerm| 1)
                     (PROGN
                      (LETT #1# (CONS 1 "failed") . #8#)
                      (GO #10=#:G851)))
                    (#9# (CONS 0 (CONS (QCDR |dTerm|) "infinity")))))))))))
            (EXIT
             (COND
              ((NULL (CDR |zeroTerms|))
               (CONS 0 (CONS (|SPADfirst| |zeroTerms|) "zero")))
              (#9#
               (SEQ
                (SEQ (LETT |term| NIL . #8#) (LETT #2# |zeroTerms| . #8#) G190
                     (COND
                      ((OR (ATOM #2#)
                           (PROGN (LETT |term| (CAR #2#) . #8#) NIL))
                       (GO G191)))
                     (SEQ (EXIT (|UPXSSING;computeExponentTerms!| |term| $)))
                     (LETT #2# (CDR #2#) . #8#) (GO G190) G191 (EXIT NIL))
                (LETT |ord0|
                      (SPADCALL
                       (|UPXSSING;exponent| (|SPADfirst| |zeroTerms|) $)
                       (QREFELT $ 53))
                      . #8#)
                (LETT |dTerm|
                      (|UPXSSING;dominantTermOnList| |zeroTerms| |ord0| -1 $)
                      . #8#)
                (EXIT
                 (COND
                  ((QEQCAR |dTerm| 1)
                   (PROGN (LETT #1# (CONS 1 "failed") . #8#) (GO #10#)))
                  (#9# (CONS 0 (CONS (QCDR |dTerm|) "zero")))))))))))
          #10# (EXIT #1#)))) 

(SDEFUN |UPXSSING;dominantTerm;$U;15|
        ((|f| $)
         ($ |Union|
          (|Record|
           (|:| |%term|
                (|Record|
                 (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                 (|:| |%expon|
                      (|ExponentialOfUnivariatePuiseuxSeries| FE |var| |cen|))
                 (|:| |%expTerms|
                      (|List|
                       (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                 (|:| |c| FE))))))
           (|:| |%type| (|String|)))
          "failed"))
        (|UPXSSING;iDominantTerm| (|UPXSSING;terms| |f| $) $)) 

(SDEFUN |UPXSSING;limitPlus;$U;16|
        ((|f| $) ($ |Union| (|OrderedCompletion| FE) "failed"))
        (SPROG
         ((|signum| (|Union| (|Integer|) "failed")) (|coef| (FE))
          (|ord| (|Fraction| (|Integer|)))
          (|pSeries| (|UnivariatePuiseuxSeries| FE |var| |cen|))
          (|type| #1=(|String|))
          (|domTerm|
           #2=(|Record|
               (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
               (|:| |%expon|
                    (|ExponentialOfUnivariatePuiseuxSeries| FE |var| |cen|))
               (|:| |%expTerms|
                    (|List|
                     (|Record| (|:| |k| (|Fraction| (|Integer|)))
                               (|:| |c| FE))))))
          (|termInfo|
           (|Record|
            (|:| |%term|
                 (|Record|
                  (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                  (|:| |%expon|
                       (|ExponentialOfUnivariatePuiseuxSeries| FE |var| |cen|))
                  (|:| |%expTerms|
                       (|List|
                        (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                  (|:| |c| FE))))))
            (|:| |%type| (|String|))))
          (|tInfo|
           (|Union| (|Record| (|:| |%term| #2#) (|:| |%type| #1#)) "failed"))
          (|termList|
           (|List|
            (|Record| (|:| |%coef| (|UnivariatePuiseuxSeries| FE |var| |cen|))
                      (|:| |%expon|
                           (|ExponentialOfUnivariatePuiseuxSeries| FE |var|
                                                                   |cen|))
                      (|:| |%expTerms|
                           (|List|
                            (|Record| (|:| |k| (|Fraction| (|Integer|)))
                                      (|:| |c| FE))))))))
         (SEQ
          (COND
           ((NULL
             (LETT |termList| (|UPXSSING;terms| |f| $)
                   . #3=(|UPXSSING;limitPlus;$U;16|)))
            (CONS 0 (|spadConstant| $ 58)))
           (#4='T
            (SEQ (LETT |tInfo| (|UPXSSING;iDominantTerm| |termList| $) . #3#)
                 (EXIT
                  (COND ((QEQCAR |tInfo| 1) (CONS 1 "failed"))
                        (#4#
                         (SEQ (LETT |termInfo| (QCDR |tInfo|) . #3#)
                              (LETT |domTerm| (QCAR |termInfo|) . #3#)
                              (LETT |type| (QCDR |termInfo|) . #3#)
                              (EXIT
                               (COND
                                ((EQUAL |type| "series")
                                 (SEQ
                                  (LETT |ord|
                                        (SPADCALL
                                         (LETT |pSeries|
                                               (|UPXSSING;coeff| |domTerm| $)
                                               . #3#)
                                         (|spadConstant| $ 59) (QREFELT $ 60))
                                        . #3#)
                                  (EXIT
                                   (COND
                                    ((SPADCALL |ord| (|spadConstant| $ 35)
                                               (QREFELT $ 39))
                                     (CONS 0 (|spadConstant| $ 58)))
                                    (#4#
                                     (SEQ
                                      (LETT |coef|
                                            (SPADCALL |pSeries| |ord|
                                                      (QREFELT $ 61))
                                            . #3#)
                                      (EXIT
                                       (COND
                                        ((SPADCALL (QREFELT $ 8)
                                                   (SPADCALL |coef|
                                                             (QREFELT $ 63))
                                                   (QREFELT $ 65))
                                         (CONS 1 "failed"))
                                        ((SPADCALL |ord| (|spadConstant| $ 35)
                                                   (QREFELT $ 40))
                                         (CONS 0
                                               (SPADCALL |coef|
                                                         (QREFELT $ 66))))
                                        (#4#
                                         (SEQ
                                          (LETT |signum|
                                                (SPADCALL |coef|
                                                          (QREFELT $ 44))
                                                . #3#)
                                          (EXIT
                                           (COND
                                            ((QEQCAR |signum| 1)
                                             (CONS 1 "failed"))
                                            ((EQL (QCDR |signum|) 1)
                                             (CONS 0
                                                   (SPADCALL (QREFELT $ 67))))
                                            (#4#
                                             (CONS 0
                                                   (SPADCALL
                                                    (QREFELT $
                                                             68))))))))))))))))
                                ((EQUAL |type| "zero")
                                 (CONS 0 (|spadConstant| $ 58)))
                                (#4#
                                 (SEQ
                                  (LETT |ord|
                                        (SPADCALL
                                         (LETT |pSeries|
                                               (|UPXSSING;coeff| |domTerm| $)
                                               . #3#)
                                         (QREFELT $ 69))
                                        . #3#)
                                  (LETT |coef|
                                        (SPADCALL |pSeries| |ord|
                                                  (QREFELT $ 61))
                                        . #3#)
                                  (EXIT
                                   (COND
                                    ((SPADCALL (QREFELT $ 8)
                                               (SPADCALL |coef| (QREFELT $ 63))
                                               (QREFELT $ 65))
                                     (CONS 1 "failed"))
                                    (#4#
                                     (SEQ
                                      (LETT |signum|
                                            (SPADCALL |coef| (QREFELT $ 44))
                                            . #3#)
                                      (EXIT
                                       (COND
                                        ((QEQCAR |signum| 1) (CONS 1 "failed"))
                                        ((EQL (QCDR |signum|) 1)
                                         (CONS 0 (SPADCALL (QREFELT $ 67))))
                                        (#4#
                                         (CONS 0
                                               (SPADCALL
                                                (QREFELT $
                                                         68)))))))))))))))))))))))) 

(DECLAIM (NOTINLINE |UnivariatePuiseuxSeriesWithExponentialSingularity;|)) 

(DEFUN |UnivariatePuiseuxSeriesWithExponentialSingularity| (&REST #1=#:G896)
  (SPROG NIL
         (PROG (#2=#:G897)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|UnivariatePuiseuxSeriesWithExponentialSingularity|)
                                               '|domainEqualList|)
                    . #3=(|UnivariatePuiseuxSeriesWithExponentialSingularity|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function|
                        |UnivariatePuiseuxSeriesWithExponentialSingularity;|)
                       #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|UnivariatePuiseuxSeriesWithExponentialSingularity|)))))))))) 

(DEFUN |UnivariatePuiseuxSeriesWithExponentialSingularity;|
       (|#1| |#2| |#3| |#4|)
  (SPROG
   ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$4 NIL) (DV$3 NIL) (DV$2 NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|)
          . #1=(|UnivariatePuiseuxSeriesWithExponentialSingularity|))
    (LETT DV$2 (|devaluate| |#2|) . #1#)
    (LETT DV$3 (|devaluate| |#3|) . #1#)
    (LETT DV$4 (|devaluate| |#4|) . #1#)
    (LETT |dv$|
          (LIST '|UnivariatePuiseuxSeriesWithExponentialSingularity| DV$1 DV$2
                DV$3 DV$4)
          . #1#)
    (LETT $ (GETREFV 83) . #1#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory|
                                         (|UnivariatePuiseuxSeries| |#2| |#3|
                                                                    |#4|)
                                         '(|Algebra| (|Fraction| (|Integer|))))
                                        (|HasCategory|
                                         (|UnivariatePuiseuxSeries| |#2| |#3|
                                                                    |#4|)
                                         '(|CharacteristicNonZero|))
                                        (|HasCategory|
                                         (|UnivariatePuiseuxSeries| |#2| |#3|
                                                                    |#4|)
                                         '(|CharacteristicZero|))
                                        (|HasCategory|
                                         (|UnivariatePuiseuxSeries| |#2| |#3|
                                                                    |#4|)
                                         '(|CommutativeRing|))
                                        (|HasCategory|
                                         (|UnivariatePuiseuxSeries| |#2| |#3|
                                                                    |#4|)
                                         '(|RetractableTo|
                                           (|Fraction| (|Integer|))))
                                        (|HasCategory|
                                         (|UnivariatePuiseuxSeries| |#2| |#3|
                                                                    |#4|)
                                         '(|RetractableTo| (|Integer|)))
                                        (|HasCategory|
                                         (|UnivariatePuiseuxSeries| |#2| |#3|
                                                                    |#4|)
                                         '(|Field|))
                                        (OR
                                         (|HasCategory|
                                          (|UnivariatePuiseuxSeries| |#2| |#3|
                                                                     |#4|)
                                          '(|Algebra|
                                            (|Fraction| (|Integer|))))
                                         (|HasCategory|
                                          (|UnivariatePuiseuxSeries| |#2| |#3|
                                                                     |#4|)
                                          '(|RetractableTo|
                                            (|Fraction| (|Integer|)))))
                                        (|HasCategory|
                                         (|UnivariatePuiseuxSeries| |#2| |#3|
                                                                    |#4|)
                                         '(|Ring|))
                                        (|HasCategory|
                                         (|UnivariatePuiseuxSeries| |#2| |#3|
                                                                    |#4|)
                                         '(|EntireRing|))
                                        (|HasCategory|
                                         (|UnivariatePuiseuxSeries| |#2| |#3|
                                                                    |#4|)
                                         '(|GcdDomain|))))
                    . #1#))
    (|haddProp| |$ConstructorCache|
                '|UnivariatePuiseuxSeriesWithExponentialSingularity|
                (LIST DV$1 DV$2 DV$3 DV$4) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (QSETREFV $ 9 |#4|)
    (AND (|HasCategory| $ '(|CommutativeRing|)) (|augmentPredVector| $ 2048))
    (SETF |pv$| (QREFELT $ 3))
    $))) 

(MAKEPROP '|UnivariatePuiseuxSeriesWithExponentialSingularity| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|PolynomialRing| 17 13) (|local| |#1|)
              (|local| |#2|) (|local| |#3|) (|local| |#4|)
              (|NonNegativeInteger|) (0 . |numberOfMonomials|) (5 . |One|)
              (|ExponentialOfUnivariatePuiseuxSeries| 7 8 9) (9 . |degree|)
              (|Boolean|) (14 . |zero?|) (|UnivariatePuiseuxSeries| 7 8 9)
              (19 . |leadingCoefficient|) (|Union| 17 '#1="failed")
              |UPXSSING;retractIfCan;$U;1| (24 . |inv|) (29 . -)
              (34 . |monomial|) (|Union| $ '"failed") |UPXSSING;recip;$U;2|
              (|Record| (|:| |k| 34) (|:| |c| 7)) (|Stream| 26) (40 . |terms|)
              (45 . |complete|) (|List| 26) (50 . |entries|) (55 . |zero?|)
              (60 . |reductum|) (|Fraction| 73) (65 . |Zero|) (69 . |Zero|)
              (73 . |Zero|) (77 . |order|) (83 . >) (89 . =)
              (95 . |coefficient|) (|Union| 73 '"failed")
              (|ElementaryFunctionSign| 6 7) (101 . |sign|)
              (|Record| (|:| |%coef| 17) (|:| |%expon| 13)
                        (|:| |%expTerms| 30))
              (|List| 45) (106 . |list|) (111 . =) (117 . -) (123 . <)
              (129 . |zero?|) (134 . |Zero|) (138 . |order|)
              (|Record| (|:| |%term| 45) (|:| |%type| 79))
              (|Union| 54 '"failed") |UPXSSING;dominantTerm;$U;15|
              (|OrderedCompletion| 7) (143 . |Zero|) (147 . |One|)
              (151 . |order|) (157 . |coefficient|) (|List| 64)
              (163 . |variables|) (|Symbol|) (168 . |member?|) (174 . |coerce|)
              (179 . |plusInfinity|) (183 . |minusInfinity|) (187 . |order|)
              (|Union| 57 '"failed") |UPXSSING;limitPlus;$U;16|
              (|Union| 34 '#1#) (|Integer|)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Mapping| 13 13) (|List| 17) (|Mapping| 17 17)
              (|PositiveInteger|) (|String|) (|SingleInteger|) (|HashState|)
              (|OutputForm|))
           '#(~= 192 |zero?| 198 |unitNormal| 203 |unitCanonical| 208 |unit?|
              213 |subtractIfCan| 218 |sample| 224 |retractIfCan| 228 |retract|
              243 |reductum| 258 |recip| 263 |primitivePart| 268 |pomopo!| 273
              |opposite?| 281 |one?| 287 |numberOfMonomials| 292 |monomial?|
              297 |monomial| 302 |minimumDegree| 308 |mapExponents| 313 |map|
              319 |limitPlus| 325 |leadingMonomial| 330 |leadingCoefficient|
              335 |latex| 340 |hashUpdate!| 345 |hash| 351 |ground?| 356
              |ground| 361 |fmecg| 366 |exquo| 374 |dominantTerm| 386 |degree|
              391 |content| 396 |coerce| 401 |coefficients| 426 |coefficient|
              431 |charthRoot| 437 |characteristic| 442 |binomThmExpt| 446
              |associates?| 453 |annihilate?| 459 ^ 465 |Zero| 477 |One| 481 =
              485 / 491 - 497 + 508 * 514)
           'NIL
           (CONS
            (|makeByteWordVec2| 6
                                '(0 0 0 0 1 4 0 0 0 1 2 3 4 0 0 0 1 0 0 0 0 0 1
                                  1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 5 6))
            (CONS
             '#(|FiniteAbelianMonoidRing&| |AbelianMonoidRing&| NIL |Algebra&|
                |Algebra&| |Algebra&| |EntireRing&| |Module&| NIL |Module&| NIL
                NIL |Module&| NIL |Ring&| NIL NIL NIL NIL |Rng&| NIL NIL NIL
                NIL |AbelianGroup&| NIL NIL |Monoid&| NIL |AbelianMonoid&|
                |SemiGroup&| |AbelianSemiGroup&| |FullyRetractableTo&|
                |SetCategory&| NIL NIL NIL |RetractableTo&| |BasicType&| NIL
                |RetractableTo&| |RetractableTo&|)
             (CONS
              '#((|FiniteAbelianMonoidRing| (|UnivariatePuiseuxSeries| 7 8 9)
                                            (|ExponentialOfUnivariatePuiseuxSeries|
                                             7 8 9))
                 (|AbelianMonoidRing| (|UnivariatePuiseuxSeries| 7 8 9)
                                      (|ExponentialOfUnivariatePuiseuxSeries| 7
                                                                              8
                                                                              9))
                 (|IntegralDomain|) (|Algebra| $$) (|Algebra| 34)
                 (|Algebra| (|UnivariatePuiseuxSeries| 7 8 9)) (|EntireRing|)
                 (|Module| $$) (|CommutativeRing|) (|Module| 34)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|Module| (|UnivariatePuiseuxSeries| 7 8 9))
                 (|BiModule| $$ $$) (|Ring|)
                 (|BiModule| (|UnivariatePuiseuxSeries| 7 8 9)
                             (|UnivariatePuiseuxSeries| 7 8 9))
                 (|BiModule| 34 34) (|LeftModule| $$) (|RightModule| $$)
                 (|Rng|) (|LeftModule| (|UnivariatePuiseuxSeries| 7 8 9))
                 (|RightModule| (|UnivariatePuiseuxSeries| 7 8 9))
                 (|LeftModule| 34) (|RightModule| 34) (|AbelianGroup|)
                 (|SemiRing|) (|CancellationAbelianMonoid|) (|Monoid|)
                 (|SemiRng|) (|AbelianMonoid|) (|SemiGroup|)
                 (|AbelianSemiGroup|)
                 (|FullyRetractableTo| (|UnivariatePuiseuxSeries| 7 8 9))
                 (|SetCategory|) (|noZeroDivisors|) (|CommutativeStar|)
                 (|unitsKnown|)
                 (|RetractableTo| (|UnivariatePuiseuxSeries| 7 8 9))
                 (|BasicType|) (|CoercibleTo| 82) (|RetractableTo| 34)
                 (|RetractableTo| 73))
              (|makeByteWordVec2| 82
                                  '(1 0 10 0 11 0 7 0 12 1 0 13 0 14 1 13 15 0
                                    16 1 0 17 0 18 1 17 0 0 21 1 13 0 0 22 2 0
                                    0 17 13 23 1 13 27 0 28 1 27 0 0 29 1 27 30
                                    0 31 1 0 15 0 32 1 0 0 0 33 0 34 0 35 0 17
                                    0 36 0 7 0 37 2 13 34 0 34 38 2 34 15 0 0
                                    39 2 34 15 0 0 40 2 13 7 0 34 41 1 43 42 7
                                    44 1 46 0 45 47 2 7 15 0 0 48 2 7 0 0 0 49
                                    2 34 15 0 0 50 1 17 15 0 51 0 13 0 52 1 13
                                    34 0 53 0 57 0 58 0 34 0 59 2 17 34 0 34 60
                                    2 17 7 0 34 61 1 7 62 0 63 2 62 15 64 0 65
                                    1 57 0 7 66 0 57 0 67 0 57 0 68 1 17 34 0
                                    69 2 0 15 0 0 1 1 0 15 0 32 1 0 74 0 1 1 0
                                    0 0 1 1 0 15 0 1 2 0 24 0 0 1 0 0 0 1 1 5
                                    72 0 1 1 6 42 0 1 1 0 19 0 20 1 5 34 0 1 1
                                    6 73 0 1 1 0 17 0 1 1 0 0 0 33 1 0 24 0 25
                                    1 11 0 0 1 4 0 0 0 17 13 0 1 2 0 15 0 0 1 1
                                    0 15 0 1 1 0 10 0 11 1 0 15 0 1 2 0 0 17 13
                                    23 1 0 13 0 1 2 0 0 75 0 1 2 0 0 77 0 1 1 0
                                    70 0 71 1 0 0 0 1 1 0 17 0 18 1 0 79 0 1 2
                                    0 81 81 0 1 1 0 80 0 1 1 0 15 0 1 1 0 17 0
                                    1 4 9 0 0 13 17 0 1 2 10 24 0 17 1 2 0 24 0
                                    0 1 1 0 55 0 56 1 0 13 0 14 1 11 17 0 1 1 8
                                    0 34 1 1 0 0 0 1 1 0 0 73 1 1 0 0 17 1 1 0
                                    82 0 1 1 0 76 0 1 2 0 17 0 13 1 1 2 24 0 1
                                    0 0 10 1 3 12 0 0 0 10 1 2 0 15 0 0 1 2 0
                                    15 0 0 1 2 0 0 0 10 1 2 0 0 0 78 1 0 0 0 1
                                    0 0 0 1 2 0 15 0 0 1 2 7 0 0 17 1 2 0 0 0 0
                                    1 1 0 0 0 1 2 0 0 0 0 1 2 1 0 0 34 1 2 1 0
                                    34 0 1 2 0 0 10 0 1 2 0 0 73 0 1 2 0 0 17 0
                                    1 2 0 0 0 0 1 2 0 0 0 17 1 2 0 0 78 0
                                    1)))))
           '|lookupComplete|)) 
