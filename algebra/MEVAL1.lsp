
(SDEFUN |MEVAL1;degree;PSNni;1|
        ((|p| |Polynomial| (|Integer|)) (|s| |Symbol|)
         ($ |NonNegativeInteger|))
        (SPADCALL |p| |s| (QREFELT $ 9))) 

(SDEFUN |MEVAL1;ldegree;PSNni;2|
        ((|p| |Polynomial| (|Integer|)) (|s| |Symbol|)
         ($ |NonNegativeInteger|))
        (SPADCALL |p| |s| (QREFELT $ 9))) 

(SDEFUN |MEVAL1;eval1a;PIRI;3|
        ((|p| |Polynomial| (|Integer|)) (|pt| . #1=(|Integer|))
         (|s| |Record| (|:| |prime| #1#) (|:| |eval1coeffbuf| (|U32Vector|))
          (|:| |eval1expbuf| (|SortedExponentVector|)))
         ($ . #1#))
        (SPADCALL |p| |pt| |s| (QREFELT $ 15))) 

(SDEFUN |MEVAL1;eval1;PSIRP;4|
        ((|p| . #1=(|Polynomial| (|Integer|))) (|v| |Symbol|)
         (|pt| . #2=(|Integer|))
         (|s| |Record| (|:| |prime| #2#) (|:| |eval1coeffbuf| (|U32Vector|))
          (|:| |eval1expbuf| (|SortedExponentVector|)))
         ($ . #1#))
        (SPADCALL |p| |v| |pt| |s| (QREFELT $ 17))) 

(SDEFUN |MEVAL1;modpreduction;PIP;5|
        ((|p| . #1=(|Polynomial| (|Integer|))) (|q| |Integer|) ($ . #1#))
        (SPADCALL |p| |q| (QREFELT $ 19))) 

(SDEFUN |MEVAL1;subst_vars;P2LP;6|
        ((|p| |Polynomial| (|Integer|)) (|ls1| . #1=(|List| (|Symbol|)))
         (|ls2| . #1#) ($ |Polynomial| (|Integer|)))
        (SPROG
         ((|lm| (|List| (|Polynomial| (|Integer|)))) (#2=#:G389 NIL) (|v| NIL)
          (#3=#:G388 NIL))
         (SEQ
          (LETT |lm|
                (PROGN
                 (LETT #3# NIL)
                 (SEQ (LETT |v| NIL) (LETT #2# |ls2|) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |v| (CAR #2#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #3#
                              (CONS
                               (SPADCALL (|spadConstant| $ 21) |v| 1
                                         (QREFELT $ 22))
                               #3#))))
                      (LETT #2# (CDR #2#)) (GO G190) G191
                      (EXIT (NREVERSE #3#)))))
          (EXIT (SPADCALL |p| |ls1| |lm| (QREFELT $ 25)))))) 

(SDEFUN |MEVAL1;trial_division;2PLSLB;7|
        ((|p| . #1=(|Polynomial| (|Integer|))) (|g| |Polynomial| (|Integer|))
         (|lm| |List| #1#) (|v| . #2=(|Symbol|)) (|ls| |List| #2#)
         ($ |Boolean|))
        (SPROG ((#3=#:G393 NIL) (|m| NIL) (#4=#:G392 NIL))
               (SEQ
                (SPADCALL |p| |g|
                          (PROGN
                           (LETT #4# NIL)
                           (SEQ (LETT |m| NIL) (LETT #3# |lm|) G190
                                (COND
                                 ((OR (ATOM #3#)
                                      (PROGN (LETT |m| (CAR #3#)) NIL))
                                  (GO G191)))
                                (SEQ (EXIT (LETT #4# (CONS |m| #4#))))
                                (LETT #3# (CDR #3#)) (GO G190) G191
                                (EXIT (NREVERSE #4#))))
                          (LIST |v|) |ls| (QREFELT $ 31))))) 

(DECLAIM (NOTINLINE |ModularEvaluation1;|)) 

(DEFUN |ModularEvaluation1| ()
  (SPROG NIL
         (PROG (#1=#:G395)
           (RETURN
            (COND
             ((LETT #1# (HGET |$ConstructorCache| '|ModularEvaluation1|))
              (|CDRwithIncrement| (CDAR #1#)))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (CDDAR
                       (HPUT |$ConstructorCache| '|ModularEvaluation1|
                             (LIST
                              (CONS NIL (CONS 1 (|ModularEvaluation1;|))))))
                    (LETT #1# T))
                (COND
                 ((NOT #1#)
                  (HREM |$ConstructorCache| '|ModularEvaluation1|)))))))))) 

(DEFUN |ModularEvaluation1;| ()
  (SPROG ((|dv$| NIL) ($ NIL) (|pv$| NIL))
         (PROGN
          (LETT |dv$| '(|ModularEvaluation1|))
          (LETT $ (GETREFV 34))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|ModularEvaluation1| NIL (CONS 1 $))
          (|stuffDomainSlots| $)
          (SETF |pv$| (QREFELT $ 3))
          $))) 

(MAKEPROP '|ModularEvaluation1| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|NonNegativeInteger|) (|Symbol|)
              (|Polynomial| 12) (0 . |degree|) |MEVAL1;degree;PSNni;1|
              |MEVAL1;ldegree;PSNni;2| (|Integer|)
              (|Record| (|:| |prime| 12) (|:| |eval1coeffbuf| (|U32Vector|))
                        (|:| |eval1expbuf| (|SortedExponentVector|)))
              (|PolynomialEvaluationUtilities|) (6 . |eval1a|)
              |MEVAL1;eval1a;PIRI;3| (13 . |eval1|) |MEVAL1;eval1;PSIRP;4|
              (21 . |modpreduction|) |MEVAL1;modpreduction;PIP;5| (27 . |One|)
              (31 . |monomial|) (|List| 7) (|List| $) (38 . |eval|)
              |MEVAL1;subst_vars;P2LP;6| (|Boolean|)
              (|SparseMultivariatePolynomial| 12 7) (|List| 28) (|PrimGCD|)
              (45 . |alg_trial_division|) (|List| 8)
              |MEVAL1;trial_division;2PLSLB;7|)
           '#(|trial_division| 54 |subst_vars| 63 |modpreduction| 70 |ldegree|
              76 |eval1a| 82 |eval1| 89 |degree| 97)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS '#((|ModularEvaluationCategory| 8 8))
                             (|makeByteWordVec2| 33
                                                 '(2 8 6 0 7 9 3 14 12 8 12 13
                                                   15 4 14 8 8 7 12 13 17 2 14
                                                   8 8 12 19 0 8 0 21 3 8 0 0 7
                                                   6 22 3 8 0 0 23 24 25 5 30
                                                   27 28 28 29 23 23 31 5 0 27
                                                   8 8 32 7 23 33 3 0 8 8 23 23
                                                   26 2 0 8 8 12 20 2 0 6 8 7
                                                   11 3 0 12 8 12 13 16 4 0 8 8
                                                   7 12 13 18 2 0 6 8 7 10)))))
           '|lookupComplete|)) 

(MAKEPROP '|ModularEvaluation1| 'NILADIC T) 
