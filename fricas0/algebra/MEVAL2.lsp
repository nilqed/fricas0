
(SDEFUN |MEVAL2;degree;FpSNni;1|
        ((|p| |FakePolynomial|) (|s| |Symbol|) ($ |NonNegativeInteger|))
        (SPADCALL |p| |s| (QREFELT $ 9))) 

(SDEFUN |MEVAL2;ldegree;RSNni;2|
        ((|p| |Record| (|:| |var| (|Symbol|))
          (|:| |coef|
               (|SparseUnivariatePolynomial|
                (|Fraction| (|Polynomial| (|Integer|))))))
         (|s| |Symbol|) ($ |NonNegativeInteger|))
        (SPROG
         ((|dp2| (|Polynomial| (|Integer|))) (|np2| (|Polynomial| (|Integer|)))
          (|p2| (|Fraction| (|Polynomial| (|Integer|))))
          (|p1|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|Polynomial| (|Integer|))))))
         (SEQ
          (COND ((EQUAL |s| (QCAR |p|)) (|error| "ldegree: s = p.var"))
                (#1='T
                 (SEQ (LETT |p1| (QCDR |p|) . #2=(|MEVAL2;ldegree;RSNni;2|))
                      (EXIT
                       (COND
                        ((SPADCALL (SPADCALL |p1| (QREFELT $ 12)) 0
                                   (QREFELT $ 14))
                         (|error| "ldegree: degree(p1) > 0"))
                        (#1#
                         (SEQ (LETT |p2| (SPADCALL |p1| (QREFELT $ 16)) . #2#)
                              (LETT |np2| (SPADCALL |p2| (QREFELT $ 18)) . #2#)
                              (LETT |dp2| (SPADCALL |p2| (QREFELT $ 19)) . #2#)
                              (EXIT
                               (COND
                                ((SPADCALL (SPADCALL |dp2| |s| (QREFELT $ 20))
                                           0 (QREFELT $ 14))
                                 (|error| "ldegree: degree(dp2, s) > 0"))
                                (#1#
                                 (SPADCALL |np2| |s|
                                           (QREFELT $ 20))))))))))))))) 

(SDEFUN |MEVAL2;eval1;FpSIRFp;3|
        ((|p| . #1=(|FakePolynomial|)) (|v| |Symbol|) (|pt| . #2=(|Integer|))
         (|s| |Record| (|:| |prime| #2#) (|:| |eval1coeffbuf| (|U32Vector|))
          (|:| |eval1expbuf| (|SortedExponentVector|)))
         ($ . #1#))
        (SPROG NIL
               (SPADCALL
                (CONS #'|MEVAL2;eval1;FpSIRFp;3!0| (VECTOR $ |s| |pt| |v|)) |p|
                (QREFELT $ 28)))) 

(SDEFUN |MEVAL2;eval1;FpSIRFp;3!0| ((|c| NIL) ($$ NIL))
        (PROG (|v| |pt| |s| $)
          (LETT |v| (QREFELT $$ 3) . #1=(|MEVAL2;eval1;FpSIRFp;3|))
          (LETT |pt| (QREFELT $$ 2) . #1#)
          (LETT |s| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |c| |v| |pt| |s| (QREFELT $ 26)))))) 

(SDEFUN |MEVAL2;modpreduction;FpIFp;4|
        ((|p| . #1=(|FakePolynomial|)) (|q| |Integer|) ($ . #1#))
        (SPROG NIL
               (SPADCALL
                (CONS #'|MEVAL2;modpreduction;FpIFp;4!0| (VECTOR $ |q|)) |p|
                (QREFELT $ 28)))) 

(SDEFUN |MEVAL2;modpreduction;FpIFp;4!0| ((|c| NIL) ($$ NIL))
        (PROG (|q| $)
          (LETT |q| (QREFELT $$ 1) . #1=(|MEVAL2;modpreduction;FpIFp;4|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |c| |q| (QREFELT $ 30)))))) 

(SDEFUN |MEVAL2;subst_vars;R2LFp;5|
        ((|p| |Record| (|:| |var| (|Symbol|))
          (|:| |coef|
               (|SparseUnivariatePolynomial|
                (|Fraction| (|Polynomial| (|Integer|))))))
         (|ls1| . #1=(|List| (|Symbol|))) (|ls2| . #1#) ($ |FakePolynomial|))
        (SPROG
         ((|res1| (|FakePolynomial|))
          (|lm| (|List| (|Polynomial| (|Integer|)))) (#2=#:G738 NIL) (|v| NIL)
          (#3=#:G737 NIL))
         (SEQ
          (LETT |lm|
                (PROGN
                 (LETT #3# NIL . #4=(|MEVAL2;subst_vars;R2LFp;5|))
                 (SEQ (LETT |v| NIL . #4#) (LETT #2# |ls2| . #4#) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |v| (CAR #2#) . #4#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #3#
                              (CONS
                               (SPADCALL (|spadConstant| $ 32) |v| 1
                                         (QREFELT $ 33))
                               #3#)
                              . #4#)))
                      (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                      (EXIT (NREVERSE #3#))))
                . #4#)
          (LETT |res1|
                (SPADCALL
                 (CONS #'|MEVAL2;subst_vars;R2LFp;5!0| (VECTOR $ |lm| |ls1|))
                 |p| (QREFELT $ 37))
                . #4#)
          (EXIT (SPADCALL |res1| |ls1| |ls2| (QREFELT $ 38)))))) 

(SDEFUN |MEVAL2;subst_vars;R2LFp;5!0| ((|c| NIL) ($$ NIL))
        (PROG (|ls1| |lm| $)
          (LETT |ls1| (QREFELT $$ 2) . #1=(|MEVAL2;subst_vars;R2LFp;5|))
          (LETT |lm| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |c| |ls1| |lm| (QREFELT $ 36)))))) 

(SDEFUN |MEVAL2;m_inverse|
        ((|x1| |Fraction| (|Polynomial| (|Integer|)))
         (|lmu| |List|
          (|SparseUnivariatePolynomial|
           (|Fraction| (|Polynomial| (|Integer|)))))
         (|ls| |List| (|Symbol|)) ($ |Fraction| (|Polynomial| (|Integer|))))
        (SPROG
         ((|q|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|Polynomial| (|Integer|)))))
          (#1=#:G743 NIL) (|s| NIL) (#2=#:G744 NIL) (|m| NIL))
         (SEQ
          (SEQ (LETT |m| NIL . #3=(|MEVAL2;m_inverse|)) (LETT #2# |lmu| . #3#)
               (LETT |s| NIL . #3#) (LETT #1# |ls| . #3#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |s| (CAR #1#) . #3#) NIL)
                     (ATOM #2#) (PROGN (LETT |m| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ (LETT |q| (SPADCALL |x1| |s| |m| (QREFELT $ 44)) . #3#)
                    (EXIT
                     (LETT |x1|
                           (SPADCALL
                            (SPADCALL |q| (QREFELT $ 42)
                                      (SPADCALL
                                       (SPADCALL (SPADCALL |s| (QREFELT $ 45))
                                                 (QREFELT $ 46))
                                       (QREFELT $ 47))
                                      (QREFELT $ 48))
                            (QREFELT $ 49))
                           . #3#)))
               (LETT #1# (PROG1 (CDR #1#) (LETT #2# (CDR #2#) . #3#)) . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT |x1|)))) 

(SDEFUN |MEVAL2;trial_division;FpPLSLB;7|
        ((|p| . #1=(|FakePolynomial|)) (|g| |Polynomial| (|Integer|))
         (|lm| |List| #1#) (|v| . #2=(|Symbol|)) (|ls| |List| #2#)
         ($ |Boolean|))
        (SPROG
         ((|pu|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|Polynomial| (|Integer|)))))
          (|c1| (|Fraction| (|Polynomial| (|Integer|))))
          (|lcp| #3=(|Fraction| (|Polynomial| (|Integer|)))) (#4=#:G753 NIL)
          (|dp| #5=(|NonNegativeInteger|))
          (|lmu|
           (|List|
            (|SparseUnivariatePolynomial|
             (|Fraction| (|Polynomial| (|Integer|))))))
          (#6=#:G762 NIL) (|m| NIL) (#7=#:G763 NIL) (|s| NIL) (#8=#:G761 NIL)
          (|gu|
           (|SparseUnivariatePolynomial|
            (|Fraction| (|Polynomial| (|Integer|)))))
          (|dg| #5#) (|lcg| #3#)
          (|gu1| (|SparseUnivariatePolynomial| (|Polynomial| (|Integer|)))))
         (SEQ
          (LETT |gu1| (SPADCALL |g| |v| (QREFELT $ 51))
                . #9=(|MEVAL2;trial_division;FpPLSLB;7|))
          (LETT |gu| (SPADCALL (ELT $ 46) |gu1| (QREFELT $ 55)) . #9#)
          (LETT |pu| (SPADCALL |p| (QREFELT $ 56)) . #9#)
          (LETT |lcg| (SPADCALL |gu| (QREFELT $ 57)) . #9#)
          (LETT |dg| (SPADCALL |gu| (QREFELT $ 12)) . #9#)
          (LETT |gu| (SPADCALL |gu| (QREFELT $ 58)) . #9#)
          (LETT |lmu|
                (PROGN
                 (LETT #8# NIL . #9#)
                 (SEQ (LETT |s| NIL . #9#) (LETT #7# |ls| . #9#)
                      (LETT |m| NIL . #9#) (LETT #6# |lm| . #9#) G190
                      (COND
                       ((OR (ATOM #6#) (PROGN (LETT |m| (CAR #6#) . #9#) NIL)
                            (ATOM #7#) (PROGN (LETT |s| (CAR #7#) . #9#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #8#
                              (CONS
                               (SPADCALL
                                (SPADCALL
                                 (SPADCALL (SPADCALL |m| (QREFELT $ 56))
                                           (QREFELT $ 16))
                                 |s| (QREFELT $ 60))
                                (QREFELT $ 61))
                               #8#)
                              . #9#)))
                      (LETT #6# (PROG1 (CDR #6#) (LETT #7# (CDR #7#) . #9#))
                            . #9#)
                      (GO G190) G191 (EXIT (NREVERSE #8#))))
                . #9#)
          (SEQ G190
               (COND
                ((NULL
                  (SEQ (LETT |dp| (SPADCALL |pu| (QREFELT $ 12)) . #9#)
                       (EXIT
                        (NULL
                         (OR (< |dp| |dg|)
                             (SPADCALL |pu| (|spadConstant| $ 64)
                                       (QREFELT $ 65)))))))
                 (GO G191)))
               (SEQ (LETT |lcp| (SPADCALL |pu| (QREFELT $ 57)) . #9#)
                    (LETT |c1|
                          (|MEVAL2;m_inverse|
                           (SPADCALL |lcp| |lcg| (QREFELT $ 66)) |lmu| |ls| $)
                          . #9#)
                    (EXIT
                     (LETT |pu|
                           (SPADCALL (SPADCALL |pu| (QREFELT $ 58))
                                     (SPADCALL
                                      (SPADCALL |c1|
                                                (PROG1
                                                    (LETT #4# (- |dp| |dg|)
                                                          . #9#)
                                                  (|check_subtype2| (>= #4# 0)
                                                                    '(|NonNegativeInteger|)
                                                                    '(|Integer|)
                                                                    #4#))
                                                (QREFELT $ 67))
                                      |gu| (QREFELT $ 68))
                                     (QREFELT $ 69))
                           . #9#)))
               NIL (GO G190) G191 (EXIT NIL))
          (SEQ G190
               (COND
                ((NULL
                  (NULL (SPADCALL |pu| (|spadConstant| $ 64) (QREFELT $ 65))))
                 (GO G191)))
               (SEQ (LETT |lcp| (SPADCALL |pu| (QREFELT $ 57)) . #9#)
                    (LETT |c1| (|MEVAL2;m_inverse| |lcp| |lmu| |ls| $) . #9#)
                    (EXIT
                     (COND
                      ((SPADCALL |c1| (|spadConstant| $ 62) (QREFELT $ 70))
                       (LETT |pu| (SPADCALL |pu| (QREFELT $ 58)) . #9#))
                      ('T
                       (SEQ
                        (SPADCALL (SPADCALL |pu| (QREFELT $ 72))
                                  (QREFELT $ 74))
                        (EXIT (|error| "trial_division: not(pu = 0)")))))))
               NIL (GO G190) G191 (EXIT NIL))
          (EXIT (SPADCALL |pu| (|spadConstant| $ 64) (QREFELT $ 65)))))) 

(DECLAIM (NOTINLINE |ModularEvaluation2;|)) 

(DEFUN |ModularEvaluation2| ()
  (SPROG NIL
         (PROG (#1=#:G767)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|ModularEvaluation2|)
                    . #2=(|ModularEvaluation2|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|ModularEvaluation2|
                             (LIST
                              (CONS NIL (CONS 1 (|ModularEvaluation2;|))))))
                    (LETT #1# T . #2#))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|ModularEvaluation2|)))))))))) 

(DEFUN |ModularEvaluation2;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|ModularEvaluation2|) . #1=(|ModularEvaluation2|))
          (LETT $ (GETREFV 77) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|ModularEvaluation2| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 42 (SPADCALL (QREFELT $ 41)))
          $))) 

(MAKEPROP '|ModularEvaluation2| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|NonNegativeInteger|) (|Symbol|)
              (|FakePolynomial|) (0 . |degree|) |MEVAL2;degree;FpSNni;1|
              (|SparseUnivariatePolynomial| 15) (6 . |degree|) (|Boolean|)
              (11 . >) (|Fraction| 17) (17 . |ground|) (|Polynomial| 23)
              (22 . |numer|) (27 . |denom|) (32 . |degree|)
              (|Record| (|:| |var| 7) (|:| |coef| 11)) |MEVAL2;ldegree;RSNni;2|
              (|Integer|)
              (|Record| (|:| |prime| 23) (|:| |eval1coeffbuf| (|U32Vector|))
                        (|:| |eval1expbuf| (|SortedExponentVector|)))
              (|PolynomialEvaluationUtilities|) (38 . |eval1|)
              (|Mapping| 17 17) (46 . |map|) |MEVAL2;eval1;FpSIRFp;3|
              (52 . |modpreduction|) |MEVAL2;modpreduction;FpIFp;4|
              (58 . |One|) (62 . |monomial|) (|List| 7) (|List| $)
              (69 . |eval|) (76 . |map|) (82 . |subst_var|)
              |MEVAL2;subst_vars;R2LFp;5| (|SingletonAsOrderedSet|)
              (89 . |create|) '|sas|
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 7) 7
                                                     23 17 15)
              (93 . |univariate|) (100 . |coerce|) (105 . |coerce|)
              (110 . |coerce|) (115 . |eval|) (122 . |retract|)
              (|SparseUnivariatePolynomial| $) (127 . |univariate|)
              (|Mapping| 15 17) (|SparseUnivariatePolynomial| 17)
              (|SparseUnivariatePolynomialFunctions2| 17 15) (133 . |map|)
              (139 . |to_UP|) (144 . |leadingCoefficient|) (149 . |reductum|)
              (|Fraction| 11) (154 . |univariate|) (160 . |numer|)
              (165 . |Zero|) (169 . |Zero|) (173 . |Zero|) (177 . =) (183 . /)
              (189 . |monomial|) (195 . *) (201 . -) (207 . =) (|OutputForm|)
              (213 . |coerce|) (|Void|) (218 . |print|) (|List| 8)
              |MEVAL2;trial_division;FpPLSLB;7|)
           '#(|trial_division| 223 |subst_vars| 232 |modpreduction| 239
              |ldegree| 245 |eval1a| 251 |eval1| 258 |degree| 266)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS '#((|ModularEvaluationCategory| 21 8))
                             (|makeByteWordVec2| 76
                                                 '(2 8 6 0 7 9 1 11 6 0 12 2 6
                                                   13 0 0 14 1 11 15 0 16 1 15
                                                   17 0 18 1 15 17 0 19 2 17 6
                                                   0 7 20 4 25 17 17 7 23 24 26
                                                   2 8 0 27 0 28 2 25 17 17 23
                                                   30 0 17 0 32 3 17 0 0 7 6 33
                                                   3 17 0 0 34 35 36 2 8 0 27
                                                   21 37 3 8 0 0 34 34 38 0 40
                                                   0 41 3 43 11 15 7 11 44 1 17
                                                   0 7 45 1 15 0 17 46 1 11 0
                                                   15 47 3 11 0 0 40 0 48 1 11
                                                   15 0 49 2 17 50 0 7 51 2 54
                                                   11 52 53 55 1 8 11 0 56 1 11
                                                   15 0 57 1 11 0 0 58 2 43 59
                                                   15 7 60 1 59 11 0 61 0 15 0
                                                   62 0 17 0 63 0 11 0 64 2 11
                                                   13 0 0 65 2 15 0 0 0 66 2 11
                                                   0 15 6 67 2 11 0 0 0 68 2 11
                                                   0 0 0 69 2 15 13 0 0 70 1 11
                                                   71 0 72 1 71 73 0 74 5 0 13
                                                   8 17 75 7 34 76 3 0 8 21 34
                                                   34 39 2 0 8 8 23 31 2 0 6 21
                                                   7 22 3 0 23 8 23 24 1 4 0 8
                                                   8 7 23 24 29 2 0 6 8 7
                                                   10)))))
           '|lookupComplete|)) 

(MAKEPROP '|ModularEvaluation2| 'NILADIC T) 
