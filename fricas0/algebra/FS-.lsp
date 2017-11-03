
(SDEFUN |FS-;ground?;SB;1| ((|x| S) ($ |Boolean|))
        (QEQCAR (SPADCALL |x| (QREFELT $ 18)) 0)) 

(SDEFUN |FS-;ground;SR;2| ((|x| S) ($ R)) (SPADCALL |x| (QREFELT $ 21))) 

(SDEFUN |FS-;coerce;SS;3| ((|x| |Symbol|) ($ S))
        (SPADCALL (SPADCALL |x| (QREFELT $ 24)) (QREFELT $ 26))) 

(SDEFUN |FS-;retract;SS;4| ((|x| S) ($ |Symbol|))
        (SPROG ((#1=#:G765 NIL))
               (PROG2
                   (LETT #1#
                         (SPADCALL (SPADCALL |x| (QREFELT $ 28))
                                   (QREFELT $ 30))
                         |FS-;retract;SS;4|)
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 0) (|Symbol|)
                                 (|Union| (|Symbol|) "failed") #1#)))) 

(SDEFUN |FS-;applyQuote;S2S;5| ((|s| |Symbol|) (|x| S) ($ S))
        (SPADCALL |s| (LIST |x|) (QREFELT $ 33))) 

(SDEFUN |FS-;applyQuote;S3S;6| ((|s| |Symbol|) (|x| S) (|y| S) ($ S))
        (SPADCALL |s| (LIST |x| |y|) (QREFELT $ 33))) 

(SDEFUN |FS-;applyQuote;S4S;7| ((|s| |Symbol|) (|x| S) (|y| S) (|z| S) ($ S))
        (SPADCALL |s| (LIST |x| |y| |z|) (QREFELT $ 33))) 

(SDEFUN |FS-;applyQuote;S5S;8|
        ((|s| |Symbol|) (|x| S) (|y| S) (|z| S) (|t| S) ($ S))
        (SPADCALL |s| (LIST |x| |y| |z| |t|) (QREFELT $ 33))) 

(SDEFUN |FS-;applyQuote;SLS;9| ((|s| |Symbol|) (|l| |List| S) ($ S))
        (SPADCALL (QREFELT $ 16) (CONS (SPADCALL |s| (QREFELT $ 38)) |l|)
                  (QREFELT $ 39))) 

(SDEFUN |FS-;belong?;BoB;10| ((|op| |BasicOperator|) ($ |Boolean|))
        (COND
         ((SPADCALL |op| '|any| (QREFELT $ 41))
          (COND ((SPADCALL |op| '|%diff| (QREFELT $ 42)) 'T)
                (#1='T (SPADCALL |op| '|%quote| (QREFELT $ 42)))))
         (#1# NIL))) 

(SDEFUN |FS-;subs| ((|fn| |Mapping| S S) (|k| |Kernel| S) ($ S))
        (SPROG ((#1=#:G783 NIL) (|x| NIL) (#2=#:G782 NIL))
               (SEQ
                (SPADCALL (SPADCALL |k| (QREFELT $ 44))
                          (PROGN
                           (LETT #2# NIL . #3=(|FS-;subs|))
                           (SEQ (LETT |x| NIL . #3#)
                                (LETT #1# (SPADCALL |k| (QREFELT $ 46)) . #3#)
                                G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2# (CONS (SPADCALL |x| |fn|) #2#)
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 47))))) 

(SDEFUN |FS-;operator;2Bo;12| ((|op| |BasicOperator|) ($ |BasicOperator|))
        (COND ((SPADCALL |op| '|%diff| (QREFELT $ 42)) (QREFELT $ 15))
              ((SPADCALL |op| '|%quote| (QREFELT $ 42)) (QREFELT $ 16))
              ('T
               (|error|
                (STRCONC "Unknown operator 4: "
                         (SPADCALL (SPADCALL |op| (QREFELT $ 48))
                                   (QREFELT $ 50))))))) 

(SDEFUN |FS-;differentiand| ((|l| |List| S) ($ S))
        (SPADCALL (|SPADfirst| |l|)
                  (SPADCALL (SPADCALL |l| (QREFELT $ 52)) (QREFELT $ 28))
                  (SPADCALL |l| (QREFELT $ 53)) (QREFELT $ 54))) 

(SDEFUN |FS-;pint| ((|l| |List| (|InputForm|)) ($ |InputForm|))
        (SPADCALL (CONS (SPADCALL 'D (QREFELT $ 56)) |l|) (QREFELT $ 57))) 

(SDEFUN |FS-;indiff| ((|l| |List| S) ($ |InputForm|))
        (SPROG ((|r2| (|InputForm|)))
               (SEQ
                (LETT |r2|
                      (SPADCALL
                       (LIST (SPADCALL '|::| (QREFELT $ 56))
                             (SPADCALL (SPADCALL |l| (QREFELT $ 53))
                                       (QREFELT $ 58))
                             (SPADCALL '|Symbol| (QREFELT $ 56)))
                       (QREFELT $ 57))
                      |FS-;indiff|)
                (EXIT
                 (|FS-;pint|
                  (LIST (SPADCALL (|FS-;differentiand| |l| $) (QREFELT $ 58))
                        |r2|)
                  $))))) 

(SDEFUN |FS-;eval;SSS;16| ((|f| S) (|s| |Symbol|) ($ S))
        (SPADCALL |f| (LIST |s|) (QREFELT $ 60))) 

(SDEFUN |FS-;eval;SBoSSS;17|
        ((|f| S) (|s| |BasicOperator|) (|g| S) (|x| |Symbol|) ($ S))
        (SPADCALL |f| (LIST |s|) (LIST |g|) |x| (QREFELT $ 63))) 

(SDEFUN |FS-;eval;SLLSS;18|
        ((|f| S) (|ls| |List| (|BasicOperator|)) (|lg| |List| S) (|x| |Symbol|)
         ($ S))
        (SPROG ((#1=#:G809 NIL) (|g| NIL) (#2=#:G808 NIL))
               (SEQ
                (SPADCALL |f| |ls|
                          (PROGN
                           (LETT #2# NIL . #3=(|FS-;eval;SLLSS;18|))
                           (SEQ (LETT |g| NIL . #3#) (LETT #1# |lg| . #3#) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |g| (CAR #1#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS (SPADCALL |g| |x| (QREFELT $ 67))
                                              #2#)
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 70))))) 

(SDEFUN |FS-;variables;LL;19| ((|lx| |List| S) ($ |List| (|Symbol|)))
        (SPROG
         ((|l| (|List| (|Symbol|))) (|s| (|Union| (|Symbol|) "failed"))
          (#1=#:G819 NIL) (|k| NIL))
         (SEQ (LETT |l| NIL . #2=(|FS-;variables;LL;19|))
              (SEQ (LETT |k| NIL . #2#)
                   (LETT #1# (SPADCALL |lx| (QREFELT $ 75)) . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ (LETT |s| (SPADCALL |k| (QREFELT $ 30)) . #2#)
                        (EXIT
                         (COND
                          ((QEQCAR |s| 0)
                           (LETT |l| (CONS (QCDR |s|) |l|) . #2#)))))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |l|))))) 

(SDEFUN |FS-;variables;SL;20| ((|x| S) ($ |List| (|Symbol|)))
        (SPADCALL (LIST |x|) (QREFELT $ 77))) 

(SDEFUN |FS-;retractIfCan;SU;21| ((|x| S) ($ |Union| (|Symbol|) "failed"))
        (SPROG ((|k| (|Union| (|Kernel| S) "failed")))
               (SEQ
                (LETT |k| (SPADCALL |x| (QREFELT $ 80))
                      |FS-;retractIfCan;SU;21|)
                (EXIT
                 (COND ((QEQCAR |k| 1) (CONS 1 "failed"))
                       ('T (SPADCALL (QCDR |k|) (QREFELT $ 30)))))))) 

(SDEFUN |FS-;characteristic;Nni;22| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 84))) 

(SDEFUN |FS-;coerce;KS;23| ((|k| |Kernel| S) ($ S))
        (SPADCALL (SPADCALL |k| (QREFELT $ 87)) (QREFELT $ 89))) 

(SDEFUN |FS-;symsub| ((|sy| |Symbol|) (|i| |Integer|) ($ |Symbol|))
        (SPADCALL (QREFELT $ 91))) 

(SDEFUN |FS-;numerator;2S;25| ((|x| S) ($ S))
        (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 89))) 

(SDEFUN |FS-;eval;SSNniMS;26|
        ((|x| S) (|s| |Symbol|) (|n| |NonNegativeInteger|) (|f| |Mapping| S S)
         ($ S))
        (SPROG NIL
               (SPADCALL |x| (LIST |s|) (LIST |n|)
                         (LIST (CONS #'|FS-;eval;SSNniMS;26!0| (VECTOR |f| $)))
                         (QREFELT $ 98)))) 

(SDEFUN |FS-;eval;SSNniMS;26!0| ((|y| NIL) ($$ NIL))
        (PROG ($ |f|)
          (LETT $ (QREFELT $$ 1) . #1=(|FS-;eval;SSNniMS;26|))
          (LETT |f| (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL (SPADCALL |y| (QREFELT $ 94)) |f|))))) 

(SDEFUN |FS-;eval;SSNniMS;27|
        ((|x| S) (|s| |Symbol|) (|n| |NonNegativeInteger|)
         (|f| |Mapping| S (|List| S)) ($ S))
        (SPADCALL |x| (LIST |s|) (LIST |n|) (LIST |f|) (QREFELT $ 98))) 

(SDEFUN |FS-;eval;SLLS;28|
        ((|x| S) (|l| |List| (|Symbol|)) (|f| |List| (|Mapping| S (|List| S)))
         ($ S))
        (SPADCALL |x| |l| (SPADCALL (LENGTH |l|) 1 (QREFELT $ 101)) |f|
                  (QREFELT $ 98))) 

(SDEFUN |FS-;elt;BoLS;29| ((|op| |BasicOperator|) (|args| |List| S) ($ S))
        (SPROG ((#1=#:G858 NIL) (|x| (S)) (|od?| (|Boolean|)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |op| (QREFELT $ 103))
                    (SEQ
                     (LETT |od?| (SPADCALL |op| (QREFELT $ 8) (QREFELT $ 41))
                           . #2=(|FS-;elt;BoLS;29|))
                     (EXIT
                      (COND
                       ((OR |od?| (SPADCALL |op| (QREFELT $ 9) (QREFELT $ 41)))
                        (COND
                         ((SPADCALL
                           (SPADCALL
                            (SPADCALL (|SPADfirst| |args|) (QREFELT $ 92))
                            (QREFELT $ 104))
                           (|spadConstant| $ 105) (QREFELT $ 106))
                          (PROGN
                           (LETT #1#
                                 (SEQ
                                  (LETT |x|
                                        (SPADCALL |op|
                                                  (SPADCALL
                                                   (|SPADfirst| |args|)
                                                   (QREFELT $ 107))
                                                  (QREFELT $ 108))
                                        . #2#)
                                  (EXIT
                                   (COND (|od?| (SPADCALL |x| (QREFELT $ 107)))
                                         ('T |x|))))
                                 . #2#)
                           (GO #3=#:G856))))))))))
                  (EXIT (SPADCALL |op| |args| (QREFELT $ 110)))))
                #3# (EXIT #1#)))) 

(SDEFUN |FS-;eval;SLLLS;30|
        ((|x| S) (|s| |List| (|Symbol|)) (|n| |List| (|NonNegativeInteger|))
         (|l| |List| (|Mapping| S S)) ($ S))
        (SPROG ((#1=#:G863 NIL) (|f| NIL) (#2=#:G862 NIL))
               (SEQ
                (SPADCALL |x| |s| |n|
                          (PROGN
                           (LETT #2# NIL . #3=(|FS-;eval;SLLLS;30|))
                           (SEQ (LETT |f| NIL . #3#) (LETT #1# |l| . #3#) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |f| (CAR #1#) . #3#) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS
                                         (CONS #'|FS-;eval;SLLLS;30!0|
                                               (VECTOR |f| $))
                                         #2#)
                                        . #3#)))
                                (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT $ 98))))) 

(SDEFUN |FS-;eval;SLLLS;30!0| ((|y| NIL) ($$ NIL))
        (PROG ($ |f|)
          (LETT $ (QREFELT $$ 1) . #1=(|FS-;eval;SLLLS;30|))
          (LETT |f| (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL (SPADCALL |y| (QREFELT $ 94)) |f|))))) 

(SDEFUN |FS-;smprep|
        ((|lop| |List| (|Symbol|)) (|lexp| |List| (|NonNegativeInteger|))
         (|lfunc| |List| (|Mapping| S (|List| S)))
         (|p| |SparseMultivariatePolynomial| R (|Kernel| S)) ($ S))
        (SPROG
         ((|q| (|SparseUnivariatePolynomial| S)) (|a| (S)) (|t2| (S))
          (|t1| (S))
          (|qr|
           (|Record| (|:| |quotient| (|NonNegativeInteger|))
                     (|:| |remainder| (|NonNegativeInteger|))))
          (|m| (|NonNegativeInteger|)) (|e| (|NonNegativeInteger|)) (|f| (S))
          (|n| (|Integer|)) (|g| (S)) (|arg| (|List| S)) (#1=#:G905 NIL)
          (#2=#:G904 NIL) (|op| (|BasicOperator|)) (|k| (|Kernel| S))
          (|v| (|Union| (|Kernel| S) "failed")))
         (SEQ (LETT |v| (SPADCALL |p| (QREFELT $ 114)) . #3=(|FS-;smprep|))
              (EXIT
               (COND ((QEQCAR |v| 1) (SPADCALL |p| (QREFELT $ 89)))
                     (#4='T
                      (SEQ (LETT |k| (QCDR |v|) . #3#)
                           (LETT |g|
                                 (SPADCALL
                                  (LETT |op| (SPADCALL |k| (QREFELT $ 44))
                                        . #3#)
                                  (LETT |arg|
                                        (PROGN
                                         (LETT #2# NIL . #3#)
                                         (SEQ (LETT |a| NIL . #3#)
                                              (LETT #1#
                                                    (SPADCALL |k|
                                                              (QREFELT $ 46))
                                                    . #3#)
                                              G190
                                              (COND
                                               ((OR (ATOM #1#)
                                                    (PROGN
                                                     (LETT |a| (CAR #1#) . #3#)
                                                     NIL))
                                                (GO G191)))
                                              (SEQ
                                               (EXIT
                                                (LETT #2#
                                                      (CONS
                                                       (SPADCALL |a| |lop|
                                                                 |lexp| |lfunc|
                                                                 (QREFELT $
                                                                          98))
                                                       #2#)
                                                      . #3#)))
                                              (LETT #1# (CDR #1#) . #3#)
                                              (GO G190) G191
                                              (EXIT (NREVERSE #2#))))
                                        . #3#)
                                  (QREFELT $ 39))
                                 . #3#)
                           (LETT |q|
                                 (SPADCALL
                                  (CONS #'|FS-;smprep!0|
                                        (VECTOR |lfunc| |lexp| |lop| $))
                                  (SPADCALL |p| |k| (QREFELT $ 116))
                                  (QREFELT $ 121))
                                 . #3#)
                           (EXIT
                            (COND
                             ((<
                               (LETT |n|
                                     (SPADCALL (SPADCALL |op| (QREFELT $ 48))
                                               |lop| (QREFELT $ 123))
                                     . #3#)
                               (SPADCALL |lop| (QREFELT $ 124)))
                              (SPADCALL |q| |g| (QREFELT $ 125)))
                             (#4#
                              (SEQ (LETT |a| (|spadConstant| $ 126) . #3#)
                                   (LETT |f|
                                         (SPADCALL
                                          (SPADCALL |arg|
                                                    (SPADCALL |lfunc| |n|
                                                              (QREFELT $ 129)))
                                          |lop| |lexp| |lfunc| (QREFELT $ 98))
                                         . #3#)
                                   (LETT |e|
                                         (SPADCALL |lexp| |n| (QREFELT $ 130))
                                         . #3#)
                                   (SEQ G190
                                        (COND
                                         ((NULL
                                           (SPADCALL |q| (|spadConstant| $ 131)
                                                     (QREFELT $ 132)))
                                          (GO G191)))
                                        (SEQ
                                         (LETT |m|
                                               (SPADCALL |q| (QREFELT $ 133))
                                               . #3#)
                                         (LETT |qr| (DIVIDE2 |m| |e|) . #3#)
                                         (LETT |t1|
                                               (SPADCALL |f| (QCAR |qr|)
                                                         (QREFELT $ 134))
                                               . #3#)
                                         (LETT |t2|
                                               (SPADCALL |g| (QCDR |qr|)
                                                         (QREFELT $ 134))
                                               . #3#)
                                         (LETT |a|
                                               (SPADCALL |a|
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (SPADCALL |q|
                                                                     (QREFELT $
                                                                              135))
                                                           |t1|
                                                           (QREFELT $ 136))
                                                          |t2| (QREFELT $ 136))
                                                         (QREFELT $ 137))
                                               . #3#)
                                         (EXIT
                                          (LETT |q|
                                                (SPADCALL |q| (QREFELT $ 138))
                                                . #3#)))
                                        NIL (GO G190) G191 (EXIT NIL))
                                   (EXIT |a|)))))))))))) 

(SDEFUN |FS-;smprep!0| ((|y| NIL) ($$ NIL))
        (PROG ($ |lop| |lexp| |lfunc|)
          (LETT $ (QREFELT $$ 3) . #1=(|FS-;smprep|))
          (LETT |lop| (QREFELT $$ 2) . #1#)
          (LETT |lexp| (QREFELT $$ 1) . #1#)
          (LETT |lfunc| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |y| (QREFELT $ 89)) |lop| |lexp| |lfunc|
                      (QREFELT $ 98)))))) 

(SDEFUN |FS-;dispdiff|
        ((|l| |List| S)
         ($ |Record| (|:| |name| (|OutputForm|)) (|:| |sub| (|OutputForm|))
          (|:| |arg| (|List| (|OutputForm|))) (|:| |orig_op| (|BasicOperator|))
          (|:| |level| (|NonNegativeInteger|))))
        (SPROG
         ((|m| (|List| (|OutputForm|))) (#1=#:G918 NIL) (|x| NIL)
          (#2=#:G917 NIL) (|i| (|Integer|))
          (|rec|
           (|Record| (|:| |name| (|OutputForm|)) (|:| |sub| (|OutputForm|))
                     (|:| |arg| (|List| (|OutputForm|)))
                     (|:| |orig_op| (|BasicOperator|))
                     (|:| |level| (|NonNegativeInteger|))))
          (|a| (|List| S)) (|k| (|Kernel| S)) (|t| (|OutputForm|))
          (|s| (|OutputForm|)))
         (SEQ
          (LETT |s| (SPADCALL (SPADCALL |l| (QREFELT $ 52)) (QREFELT $ 140))
                . #3=(|FS-;dispdiff|))
          (LETT |t| (SPADCALL (SPADCALL |l| (QREFELT $ 53)) (QREFELT $ 140))
                . #3#)
          (LETT |a|
                (SPADCALL
                 (LETT |k| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 28)) . #3#)
                 (QREFELT $ 46))
                . #3#)
          (EXIT
           (COND
            ((SPADCALL |k| (QREFELT $ 15) (QREFELT $ 141))
             (SEQ (LETT |rec| (|FS-;dispdiff| |a| $) . #3#)
                  (LETT |i| (SPADCALL |s| (QVELT |rec| 2) (QREFELT $ 143))
                        . #3#)
                  (SPADCALL (QVELT |rec| 2) |i| |t| (QREFELT $ 144))
                  (EXIT
                   (VECTOR (QVELT |rec| 0)
                           (SPADCALL (QVELT |rec| 1)
                                     (SPADCALL (SPADCALL '|,| (QREFELT $ 145))
                                               (SPADCALL
                                                (- (+ |i| 1)
                                                   (SPADCALL |a|
                                                             (QREFELT $ 147)))
                                                (QREFELT $ 148))
                                               (QREFELT $ 149))
                                     (QREFELT $ 149))
                           (QVELT |rec| 2) (QVELT |rec| 3)
                           (COND ((ZEROP (QVELT |rec| 4)) 0)
                                 (#4='T (+ (QVELT |rec| 4) 1)))))))
            (#4#
             (SEQ
              (LETT |i|
                    (SPADCALL (SPADCALL |l| (QREFELT $ 52)) |a|
                              (QREFELT $ 150))
                    . #3#)
              (LETT |m|
                    (PROGN
                     (LETT #2# NIL . #3#)
                     (SEQ (LETT |x| NIL . #3#) (LETT #1# |a| . #3#) G190
                          (COND
                           ((OR (ATOM #1#)
                                (PROGN (LETT |x| (CAR #1#) . #3#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2# (CONS (SPADCALL |x| (QREFELT $ 140)) #2#)
                                  . #3#)))
                          (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                          (EXIT (NREVERSE #2#))))
                    . #3#)
              (SPADCALL |m| |i| |t| (QREFELT $ 144))
              (EXIT
               (VECTOR
                (SPADCALL
                 (SPADCALL (SPADCALL |k| (QREFELT $ 44)) (QREFELT $ 48))
                 (QREFELT $ 145))
                (SPADCALL (SPADCALL '|,| (QREFELT $ 145))
                          (SPADCALL
                           (- (+ |i| 1) (SPADCALL |a| (QREFELT $ 147)))
                           (QREFELT $ 148))
                          (QREFELT $ 149))
                |m| (SPADCALL |k| (QREFELT $ 44))
                (COND ((NULL (CDR |a|)) 1) (#4# 0))))))))))) 

(SDEFUN |FS-;ddiff| ((|l| |List| S) ($ |OutputForm|))
        (SPROG
         ((|f| (|Union| (|None|) "failed")) (|opname| (|OutputForm|))
          (|rec|
           (|Record| (|:| |name| (|OutputForm|)) (|:| |sub| (|OutputForm|))
                     (|:| |arg| (|List| (|OutputForm|)))
                     (|:| |orig_op| (|BasicOperator|))
                     (|:| |level| (|NonNegativeInteger|)))))
         (SEQ (LETT |rec| (|FS-;dispdiff| |l| $) . #1=(|FS-;ddiff|))
              (LETT |opname|
                    (COND
                     ((ZEROP (QVELT |rec| 4))
                      (SPADCALL (QVELT |rec| 0) (QVELT |rec| 1)
                                (QREFELT $ 151)))
                     (#2='T
                      (SPADCALL (QVELT |rec| 0) (QVELT |rec| 4)
                                (QREFELT $ 152))))
                    . #1#)
              (LETT |f| (SPADCALL (QVELT |rec| 3) '|%diffDisp| (QREFELT $ 154))
                    . #1#)
              (EXIT
               (COND
                ((QEQCAR |f| 0)
                 (SPADCALL (CONS |opname| (QVELT |rec| 2)) (QCDR |f|)))
                (#2# (SPADCALL |opname| (QVELT |rec| 2) (QREFELT $ 155)))))))) 

(SDEFUN |FS-;encode_diff|
        ((|ker| |Kernel| S) (|nsub| |List| (|Integer|)) (|args| |List| S)
         (|nd| |List| S) ($ S))
        (SPROG
         ((|res| (S)) (#1=#:G944 NIL) (|kk| NIL) (#2=#:G940 NIL)
          (|i| #3=(|Integer|)) (#4=#:G941 NIL) (|k| (|Integer|))
          (#5=#:G942 NIL) (|pt| NIL) (#6=#:G943 NIL) (|dm| NIL)
          (|pts| (|List| S)) (#7=#:G938 NIL) (#8=#:G939 NIL)
          (|nargs| (|List| S)) (|li| (|List| (|Integer|)))
          (|lk| (|List| (|Integer|))) (|ii| #3#))
         (SEQ (LETT |li| NIL . #9=(|FS-;encode_diff|)) (LETT |lk| NIL . #9#)
              (LETT |i| (|SPADfirst| |nsub|) . #9#) (LETT |k| 1 . #9#)
              (LETT |nsub| (CDR |nsub|) . #9#)
              (SEQ G190 (COND ((NULL (NULL (NULL |nsub|))) (GO G191)))
                   (SEQ (LETT |ii| (|SPADfirst| |nsub|) . #9#)
                        (LETT |nsub| (CDR |nsub|) . #9#)
                        (EXIT
                         (COND ((EQL |ii| |i|) (LETT |k| (+ |k| 1) . #9#))
                               ('T
                                (SEQ (LETT |lk| (CONS |k| |lk|) . #9#)
                                     (LETT |li| (CONS |i| |li|) . #9#)
                                     (LETT |i| |ii| . #9#)
                                     (EXIT (LETT |k| 1 . #9#)))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |lk| (CONS |k| |lk|) . #9#)
              (LETT |li| (CONS |i| |li|) . #9#)
              (LETT |nargs| (SPADCALL |args| (QREFELT $ 156)) . #9#)
              (LETT |pts| NIL . #9#)
              (SEQ (LETT |dm| NIL . #9#) (LETT #8# |nd| . #9#)
                   (LETT |i| NIL . #9#) (LETT #7# (REVERSE |li|) . #9#) G190
                   (COND
                    ((OR (ATOM #7#) (PROGN (LETT |i| (CAR #7#) . #9#) NIL)
                         (ATOM #8#) (PROGN (LETT |dm| (CAR #8#) . #9#) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |pts|
                          (CONS (SPADCALL |nargs| |i| (QREFELT $ 157)) |pts|)
                          . #9#)
                    (EXIT (SPADCALL |nargs| |i| |dm| (QREFELT $ 158))))
                   (LETT #7# (PROG1 (CDR #7#) (LETT #8# (CDR #8#) . #9#))
                         . #9#)
                   (GO G190) G191 (EXIT NIL))
              (LETT |res|
                    (SPADCALL (SPADCALL |ker| (QREFELT $ 44)) |nargs|
                              (QREFELT $ 47))
                    . #9#)
              (SEQ (LETT |dm| NIL . #9#) (LETT #6# (REVERSE |nd|) . #9#)
                   (LETT |pt| NIL . #9#) (LETT #5# |pts| . #9#)
                   (LETT |k| NIL . #9#) (LETT #4# |lk| . #9#)
                   (LETT |i| NIL . #9#) (LETT #2# |li| . #9#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#) . #9#) NIL)
                         (ATOM #4#) (PROGN (LETT |k| (CAR #4#) . #9#) NIL)
                         (ATOM #5#) (PROGN (LETT |pt| (CAR #5#) . #9#) NIL)
                         (ATOM #6#) (PROGN (LETT |dm| (CAR #6#) . #9#) NIL))
                     (GO G191)))
                   (SEQ
                    (SEQ (LETT |kk| 2 . #9#) (LETT #1# |k| . #9#) G190
                         (COND ((|greater_SI| |kk| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res|
                                 (SPADCALL (QREFELT $ 15)
                                           (LIST |res| |dm| |dm|)
                                           (QREFELT $ 47))
                                 . #9#)))
                         (LETT |kk| (|inc_SI| |kk|) . #9#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT
                     (LETT |res|
                           (SPADCALL (QREFELT $ 15) (LIST |res| |dm| |pt|)
                                     (QREFELT $ 47))
                           . #9#)))
                   (LETT #2#
                         (PROG1 (CDR #2#)
                           (LETT #4#
                                 (PROG1 (CDR #4#)
                                   (LETT #5#
                                         (PROG1 (CDR #5#)
                                           (LETT #6# (CDR #6#) . #9#))
                                         . #9#))
                                 . #9#))
                         . #9#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |FS-;insert_sub|
        ((|lsub| |List| (|Integer|)) (|j| |Integer|) ($ |List| (|Integer|)))
        (SPROG
         ((|nsub| (|List| (|Integer|))) (|to_insert| (|Boolean|))
          (#1=#:G950 NIL) (|i| NIL))
         (SEQ (LETT |nsub| NIL . #2=(|FS-;insert_sub|))
              (LETT |to_insert| 'T . #2#)
              (SEQ (LETT |i| NIL . #2#) (LETT #1# |lsub| . #2#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#) . #2#) NIL))
                     (GO G191)))
                   (SEQ
                    (COND
                     (|to_insert|
                      (COND
                       ((NULL (SPADCALL |i| |j| (QREFELT $ 159)))
                        (SEQ (LETT |nsub| (CONS |j| |nsub|) . #2#)
                             (EXIT (LETT |to_insert| NIL . #2#)))))))
                    (EXIT (LETT |nsub| (CONS |i| |nsub|) . #2#)))
                   (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
              (COND (|to_insert| (LETT |nsub| (CONS |j| |nsub|) . #2#)))
              (EXIT (NREVERSE |nsub|))))) 

(SDEFUN |FS-;pos_diff|
        ((|l| |List| S)
         (|r1| |Record| (|:| |orig_k| (|Kernel| S))
          (|:| |sub| (|List| (|Integer|))) (|:| |oarg| (|List| S))
          (|:| |arg| (|List| S)) (|:| |dummies| #1=(|List| S)))
         (|i| |Integer|) ($ S))
        (SPROG
         ((|nd| #1#) (|dm| (S)) (|nd2| (|List| S)) (|nd1| (|List| S))
          (|k| (|NonNegativeInteger|)) (#2=#:G957 NIL) (#3=#:G958 NIL)
          (|j| NIL) (|ii| (|Integer|)) (|nsub| (|List| (|Integer|))))
         (SEQ
          (LETT |nsub| (|FS-;insert_sub| (QVELT |r1| 1) |i| $)
                . #4=(|FS-;pos_diff|))
          (LETT |nd| (QVELT |r1| 4) . #4#)
          (COND
           ((NULL (SPADCALL |i| (QVELT |r1| 1) (QREFELT $ 161)))
            (SEQ (LETT |k| 0 . #4#) (LETT |ii| (|SPADfirst| |nsub|) . #4#)
                 (SEQ
                  (EXIT
                   (SEQ (LETT |j| NIL . #4#) (LETT #3# |nsub| . #4#) G190
                        (COND
                         ((OR (ATOM #3#)
                              (PROGN (LETT |j| (CAR #3#) . #4#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (COND
                           ((EQL |i| |j|)
                            (PROGN (LETT #2# |$NoValue| . #4#) (GO #5=#:G952)))
                           ((NULL (EQL |ii| |j|))
                            (LETT |k| (+ |k| 1) . #4#)))))
                        (LETT #3# (CDR #3#) . #4#) (GO G190) G191 (EXIT NIL)))
                  #5# (EXIT #2#))
                 (LETT |nd1| (SPADCALL |nd| |k| (QREFELT $ 162)) . #4#)
                 (LETT |nd2| (SPADCALL |nd| |k| (QREFELT $ 163)) . #4#)
                 (LETT |dm| (SPADCALL (SPADCALL (QREFELT $ 91)) (QREFELT $ 38))
                       . #4#)
                 (EXIT
                  (LETT |nd| (SPADCALL |nd1| (CONS |dm| |nd2|) (QREFELT $ 164))
                        . #4#)))))
          (EXIT
           (|FS-;encode_diff| (QVELT |r1| 0) |nsub| (QVELT |r1| 3) |nd| $))))) 

(SDEFUN |FS-;diffdiff| ((|l| |List| S) (|x| |Symbol|) ($ S))
        (SPROG
         ((|res| (S)) (|db| (S)) (#1=#:G964 NIL) (|i| NIL) (#2=#:G965 NIL)
          (|b| NIL) (|args| #3=(|List| S))
          (|r1|
           (|Record| (|:| |orig_k| (|Kernel| S))
                     (|:| |sub| (|List| (|Integer|))) (|:| |oarg| (|List| S))
                     (|:| |arg| #3#) (|:| |dummies| (|List| S)))))
         (SEQ (LETT |r1| (|FS-;decode_diff| |l| $) . #4=(|FS-;diffdiff|))
              (LETT |args| (QVELT |r1| 3) . #4#)
              (LETT |res| (|spadConstant| $ 126) . #4#)
              (SEQ (LETT |b| NIL . #4#) (LETT #2# |args| . #4#)
                   (LETT |i| (SPADCALL |args| (QREFELT $ 147)) . #4#)
                   (LETT #1# (SPADCALL |args| (QREFELT $ 165)) . #4#) G190
                   (COND
                    ((OR (> |i| #1#) (ATOM #2#)
                         (PROGN (LETT |b| (CAR #2#) . #4#) NIL))
                     (GO G191)))
                   (SEQ (LETT |db| (SPADCALL |b| |x| (QREFELT $ 166)) . #4#)
                        (EXIT
                         (COND
                          ((SPADCALL |db| (|spadConstant| $ 126)
                                     (QREFELT $ 167))
                           "iterate")
                          ('T
                           (LETT |res|
                                 (SPADCALL |res|
                                           (SPADCALL |db|
                                                     (|FS-;pos_diff| |l| |r1|
                                                      |i| $)
                                                     (QREFELT $ 136))
                                           (QREFELT $ 137))
                                 . #4#)))))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT #2# (CDR #2#) . #4#))
                         . #4#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |FS-;dfeval| ((|l| |List| S) (|g| |Kernel| S) ($ S))
        (SPROG ((#1=#:G967 NIL))
               (SPADCALL
                (SPADCALL (|SPADfirst| |l|)
                          (PROG2
                              (LETT #1# (SPADCALL |g| (QREFELT $ 30))
                                    |FS-;dfeval|)
                              (QCDR #1#)
                            (|check_union2| (QEQCAR #1# 0) (|Symbol|)
                                            (|Union| (|Symbol|) "failed") #1#))
                          (QREFELT $ 166))
                |g| (SPADCALL |l| (QREFELT $ 53)) (QREFELT $ 54)))) 

(SDEFUN |FS-;diffEval| ((|l| |List| S) ($ S))
        (SPROG
         ((|d| (|List| (|Mapping| S (|List| S)))) (|n| (|Integer|))
          (|nl| (|List| S)) (|ss| (S)) (|dumm| (S))
          (|ud| (|Union| (|List| (|Mapping| S (|List| S))) "failed"))
          (|op| (|BasicOperator|)) (#1=#:G1000 NIL) (|k| (|Kernel| S))
          (|u| (|Union| (|Kernel| S) "failed")) (|g| (|Kernel| S)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |g| (SPADCALL (SPADCALL |l| (QREFELT $ 52)) (QREFELT $ 28))
                  . #2=(|FS-;diffEval|))
            (SEQ (LETT |u| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 80)) . #2#)
                 (EXIT
                  (COND
                   ((QEQCAR |u| 1)
                    (PROGN
                     (LETT #1# (|FS-;dfeval| |l| |g| $) . #2#)
                     (GO #3=#:G998)))
                   ((QEQCAR |u| 0)
                    (COND
                     ((QEQCAR
                       (SPADCALL (LETT |k| (QCDR |u|) . #2#) (QREFELT $ 30)) 0)
                      (PROGN
                       (LETT #1# (|FS-;dfeval| |l| |g| $) . #2#)
                       (GO #3#))))))))
            (LETT |op| (SPADCALL |k| (QREFELT $ 44)) . #2#)
            (LETT |ud| (SPADCALL |op| (QREFELT $ 170)) . #2#)
            (EXIT
             (COND
              ((QEQCAR |ud| 1)
               (SEQ
                (LETT |dumm|
                      (SPADCALL (|FS-;symsub| (QREFELT $ 82) 1 $)
                                (QREFELT $ 38))
                      . #2#)
                (LETT |ss|
                      (SPADCALL (SPADCALL |l| 1 (QREFELT $ 157))
                                (SPADCALL (SPADCALL |l| 2 (QREFELT $ 157))
                                          |dumm| (QREFELT $ 172))
                                (QREFELT $ 174))
                      . #2#)
                (LETT |nl| (LIST |ss| |dumm| (SPADCALL |l| 3 (QREFELT $ 157)))
                      . #2#)
                (EXIT (SPADCALL (QREFELT $ 15) |nl| (QREFELT $ 47)))))
              ((<
                (LETT |n|
                      (SPADCALL (SPADCALL |l| (QREFELT $ 52))
                                (SPADCALL |k| (QREFELT $ 46)) (QREFELT $ 150))
                      . #2#)
                (SPADCALL |l| (QREFELT $ 147)))
               (|FS-;dfeval| |l| |g| $))
              ('T
               (SEQ (LETT |d| (QCDR |ud|) . #2#)
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |k| (QREFELT $ 46))
                                (SPADCALL |d| |n| (QREFELT $ 129)))
                      |g| (SPADCALL |l| (QREFELT $ 53)) (QREFELT $ 54)))))))))
          #3# (EXIT #1#)))) 

(SDEFUN |FS-;diffArg|
        ((|l| |List| S) (|op| |BasicOperator|) (|i| |NonNegativeInteger|)
         ($ |List| S))
        (SPROG ((|g| (S)) (|z| (|List| S)) (|n| (|Integer|)))
               (SEQ
                (LETT |n| (+ (- |i| 1) (SPADCALL |l| (QREFELT $ 147)))
                      . #1=(|FS-;diffArg|))
                (LETT |z| (SPADCALL |l| (QREFELT $ 156)) . #1#)
                (SPADCALL |z| |n|
                          (LETT |g|
                                (SPADCALL (|FS-;symsub| (QREFELT $ 82) |n| $)
                                          (QREFELT $ 38))
                                . #1#)
                          (QREFELT $ 158))
                (EXIT
                 (LIST (SPADCALL |op| |z| (QREFELT $ 47)) |g|
                       (SPADCALL |l| |n| (QREFELT $ 157))))))) 

(SDEFUN |FS-;opderiv|
        ((|op| |BasicOperator|) (|n| |NonNegativeInteger|)
         ($ |List| (|Mapping| S (|List| S))))
        (SPROG ((#1=#:G1011 NIL) (|i| NIL) (#2=#:G1010 NIL) (|g| (S)))
               (SEQ
                (COND
                 ((EQL |n| 1)
                  (SEQ
                   (LETT |g|
                         (SPADCALL (|FS-;symsub| (QREFELT $ 82) |n| $)
                                   (QREFELT $ 38))
                         . #3=(|FS-;opderiv|))
                   (EXIT
                    (LIST
                     (CONS #'|FS-;opderiv!0|
                           (VECTOR $ |g| |op| (QREFELT $ 15)))))))
                 ('T
                  (PROGN
                   (LETT #2# NIL . #3#)
                   (SEQ (LETT |i| 1 . #3#) (LETT #1# |n| . #3#) G190
                        (COND ((|greater_SI| |i| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2#
                                (CONS
                                 (CONS #'|FS-;opderiv!1|
                                       (VECTOR $ |i| |op| (QREFELT $ 15)))
                                 #2#)
                                . #3#)))
                        (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |FS-;opderiv!1| ((|x| NIL) ($$ NIL))
        (PROG (|opdiff| |op| |i| $)
          (LETT |opdiff| (QREFELT $$ 3) . #1=(|FS-;opderiv|))
          (LETT |op| (QREFELT $$ 2) . #1#)
          (LETT |i| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |opdiff| (|FS-;diffArg| |x| |op| |i| $)
                      (QREFELT $ 47)))))) 

(SDEFUN |FS-;opderiv!0| ((|x| NIL) ($$ NIL))
        (PROG (|opdiff| |op| |g| $)
          (LETT |opdiff| (QREFELT $$ 3) . #1=(|FS-;opderiv|))
          (LETT |op| (QREFELT $$ 2) . #1#)
          (LETT |g| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL |opdiff|
                      (LIST (SPADCALL |op| |g| (QREFELT $ 175)) |g|
                            (SPADCALL |x| (QREFELT $ 94)))
                      (QREFELT $ 47)))))) 

(SDEFUN |FS-;kgrad| ((|k| |Kernel| S) ($ |List| (|Mapping| S (|List| S))))
        (SPROG
         ((|grad| (|List| (|Mapping| S (|List| S))))
          (|u| (|Union| (|List| (|Mapping| S (|List| S))) "failed"))
          (|op| (|BasicOperator|)) (|n| (|NonNegativeInteger|))
          (|args| (|List| S)))
         (SEQ
          (COND
           ((ZEROP
             (LETT |n|
                   (LENGTH
                    (LETT |args| (SPADCALL |k| (QREFELT $ 46))
                          . #1=(|FS-;kgrad|)))
                   . #1#))
            NIL)
           (#2='T
            (SEQ (LETT |op| (SPADCALL |k| (QREFELT $ 44)) . #1#)
                 (LETT |grad|
                       (SEQ (LETT |u| (SPADCALL |op| (QREFELT $ 170)) . #1#)
                            (EXIT
                             (COND ((QEQCAR |u| 1) (|FS-;opderiv| |op| |n| $))
                                   (#2# (QCDR |u|)))))
                       . #1#)
                 (EXIT
                  (COND
                   ((SPADCALL (LENGTH |grad|) |n| (QREFELT $ 176))
                    (|FS-;opderiv| |op| |n| $))
                   (#2# |grad|))))))))) 

(SDEFUN |FS-;kerderiv| ((|k| |Kernel| S) (|x| |Symbol|) ($ S))
        (SPROG
         ((#1=#:G1029 NIL) (#2=#:G1028 (S)) (#3=#:G1030 (S)) (|dyx| (S))
          (#4=#:G1034 NIL) (|g| NIL) (#5=#:G1035 NIL) (|y| NIL)
          (|fn| (|Union| (|None|) "failed")) (|ak| (|List| S))
          (|v| (|Union| (|Symbol|) "failed")))
         (SEQ (LETT |v| (SPADCALL |k| (QREFELT $ 30)) . #6=(|FS-;kerderiv|))
              (EXIT
               (COND
                ((QEQCAR |v| 0)
                 (COND ((EQUAL (QCDR |v|) |x|) (|spadConstant| $ 146))
                       (#7='T (|spadConstant| $ 126))))
                (#7#
                 (SEQ (LETT |ak| (SPADCALL |k| (QREFELT $ 46)) . #6#)
                      (LETT |fn|
                            (SPADCALL (SPADCALL |k| (QREFELT $ 44))
                                      (QREFELT $ 10) (QREFELT $ 154))
                            . #6#)
                      (EXIT
                       (COND ((QEQCAR |fn| 0) (SPADCALL |ak| |x| (QCDR |fn|)))
                             (#7#
                              (PROGN
                               (LETT #1# NIL . #6#)
                               (SEQ (LETT |y| NIL . #6#) (LETT #5# |ak| . #6#)
                                    (LETT |g| NIL . #6#)
                                    (LETT #4# (|FS-;kgrad| |k| $) . #6#) G190
                                    (COND
                                     ((OR (ATOM #4#)
                                          (PROGN
                                           (LETT |g| (CAR #4#) . #6#)
                                           NIL)
                                          (ATOM #5#)
                                          (PROGN
                                           (LETT |y| (CAR #5#) . #6#)
                                           NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((SPADCALL
                                         (LETT |dyx|
                                               (SPADCALL |y| |x|
                                                         (QREFELT $ 166))
                                               . #6#)
                                         (|spadConstant| $ 126)
                                         (QREFELT $ 177))
                                        (PROGN
                                         (LETT #3#
                                               (SPADCALL (SPADCALL |ak| |g|)
                                                         |dyx| (QREFELT $ 136))
                                               . #6#)
                                         (COND
                                          (#1#
                                           (LETT #2#
                                                 (SPADCALL #2# #3#
                                                           (QREFELT $ 137))
                                                 . #6#))
                                          ('T
                                           (PROGN
                                            (LETT #2# #3# . #6#)
                                            (LETT #1# 'T . #6#)))))))))
                                    (LETT #4#
                                          (PROG1 (CDR #4#)
                                            (LETT #5# (CDR #5#) . #6#))
                                          . #6#)
                                    (GO G190) G191 (EXIT NIL))
                               (COND (#1# #2#)
                                     (#7# (|spadConstant| $ 126)))))))))))))) 

(SDEFUN |FS-;smpderiv|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| S)) (|x| |Symbol|)
         ($ S))
        (SPROG
         ((#1=#:G1065 NIL) (#2=#:G1064 (S)) (#3=#:G1066 (S)) (#4=#:G1068 NIL)
          (|k| NIL))
         (SEQ
          (SPADCALL
           (SPADCALL
            (SPADCALL (CONS #'|FS-;smpderiv!0| (VECTOR |x| $)) |p|
                      (QREFELT $ 183))
            (QREFELT $ 89))
           (PROGN
            (LETT #1# NIL . #5=(|FS-;smpderiv|))
            (SEQ (LETT |k| NIL . #5#)
                 (LETT #4# (SPADCALL |p| (QREFELT $ 185)) . #5#) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |k| (CAR #4#) . #5#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (PROGN
                    (LETT #3#
                          (SPADCALL
                           (SPADCALL (SPADCALL |p| |k| (QREFELT $ 186))
                                     (QREFELT $ 89))
                           (|FS-;kerderiv| |k| |x| $) (QREFELT $ 136))
                          . #5#)
                    (COND
                     (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT $ 137)) . #5#))
                     ('T (PROGN (LETT #2# #3# . #5#) (LETT #1# 'T . #5#)))))))
                 (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
            (COND (#1# #2#) ('T (|spadConstant| $ 126))))
           (QREFELT $ 137))))) 

(SDEFUN |FS-;smpderiv!0| ((|s| NIL) ($$ NIL))
        (PROG ($ |x|)
          (LETT $ (QREFELT $$ 1) . #1=(|FS-;smpderiv|))
          (LETT |x| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL (SPADCALL |s| (QREFELT $ 179)) |x| (QREFELT $ 180))
             (QREFELT $ 181)))))) 

(SDEFUN |FS-;coerce;PS;45| ((|p| |Polynomial| R) ($ S))
        (SPADCALL (ELT $ 38) (ELT $ 187) |p| (QREFELT $ 191))) 

(SDEFUN |FS-;worse?| ((|k1| |Kernel| S) (|k2| |Kernel| S) ($ |Boolean|))
        (SPROG ((|u| (|Union| (|Boolean|) "failed")))
               (SEQ
                (LETT |u|
                      (SPADCALL
                       (SPADCALL (SPADCALL |k1| (QREFELT $ 44)) (QREFELT $ 48))
                       (SPADCALL (SPADCALL |k2| (QREFELT $ 44)) (QREFELT $ 48))
                       (QREFELT $ 195))
                      |FS-;worse?|)
                (EXIT
                 (COND ((QEQCAR |u| 1) (SPADCALL |k1| |k2| (QREFELT $ 196)))
                       ('T (QCDR |u|))))))) 

(SDEFUN |FS-;bestKernel| ((|l| |List| (|Kernel| S)) ($ |Kernel| S))
        (SPROG ((|a| (|Kernel| S)))
               (SEQ
                (COND ((NULL (CDR |l|)) (|SPADfirst| |l|))
                      (#1='T
                       (SEQ
                        (LETT |a| (|FS-;bestKernel| (CDR |l|) $)
                              |FS-;bestKernel|)
                        (EXIT
                         (COND ((|FS-;worse?| (|SPADfirst| |l|) |a| $) |a|)
                               (#1# (|SPADfirst| |l|)))))))))) 

(SDEFUN |FS-;smp2O|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| S)) ($ |OutputForm|))
        (SPROG ((|a| (|Kernel| S)) (#1=#:G1082 NIL) (|r| (|Union| R "failed")))
               (SEQ
                (LETT |r| (SPADCALL |p| (QREFELT $ 197)) . #2=(|FS-;smp2O|))
                (EXIT
                 (COND ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) (QREFELT $ 198)))
                       (#3='T
                        (SEQ
                         (LETT |a|
                               (COND
                                ((SPADCALL (QREFELT $ 199))
                                 (|FS-;bestKernel|
                                  (SPADCALL |p| (QREFELT $ 185)) $))
                                (#3#
                                 (PROG2
                                     (LETT #1# (SPADCALL |p| (QREFELT $ 114))
                                           . #2#)
                                     (QCDR #1#)
                                   (|check_union2| (QEQCAR #1# 0)
                                                   (|Kernel| (QREFELT $ 6))
                                                   (|Union|
                                                    (|Kernel| (QREFELT $ 6))
                                                    "failed")
                                                   #1#))))
                               . #2#)
                         (EXIT
                          (SPADCALL
                           (SPADCALL (ELT $ 89)
                                     (SPADCALL |p| |a| (QREFELT $ 116))
                                     (QREFELT $ 121))
                           (SPADCALL |a| (QREFELT $ 200))
                           (QREFELT $ 201)))))))))) 

(SDEFUN |FS-;smpsubst|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| S))
         (|lk| |List| (|Kernel| S)) (|lv| |List| S) ($ S))
        (SPROG NIL
               (SPADCALL (CONS #'|FS-;smpsubst!2| (VECTOR $ |lv| |lk|))
                         (ELT $ 187) |p| (QREFELT $ 207)))) 

(SDEFUN |FS-;smpsubst!2| ((|x| NIL) ($$ NIL))
        (PROG (|lk| |lv| $)
          (LETT |lk| (QREFELT $$ 2) . #1=(|FS-;smpsubst|))
          (LETT |lv| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |lk| |lv| |x|
                             (|FS-;notfound|
                              (CONS #'|FS-;smpsubst!1| (VECTOR |lk| |lv| $))
                              |lk| $)
                             (QREFELT $ 205))))))) 

(SDEFUN |FS-;smpsubst!1| ((|z| NIL) ($$ NIL))
        (PROG ($ |lv| |lk|)
          (LETT $ (QREFELT $$ 2) NIL)
          (LETT |lv| (QREFELT $$ 1) NIL)
          (LETT |lk| (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (SPROG NIL
                   (|FS-;subs| (CONS #'|FS-;smpsubst!0| (VECTOR $ |lv| |lk|))
                    |z| $)))))) 

(SDEFUN |FS-;smpsubst!0| ((|s| NIL) ($$ NIL))
        (PROG (|lk| |lv| $)
          (LETT |lk| (QREFELT $$ 2) NIL)
          (LETT |lv| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |s| |lk| |lv| (QREFELT $ 202)))))) 

(SDEFUN |FS-;smpeval|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| S))
         (|lk| |List| (|Kernel| S)) (|lv| |List| S) ($ S))
        (SPROG NIL
               (SPADCALL (CONS #'|FS-;smpeval!2| (VECTOR $ |lv| |lk|))
                         (ELT $ 187) |p| (QREFELT $ 207)))) 

(SDEFUN |FS-;smpeval!2| ((|x| NIL) ($$ NIL))
        (PROG (|lk| |lv| $)
          (LETT |lk| (QREFELT $$ 2) . #1=(|FS-;smpeval|))
          (LETT |lv| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |lk| |lv| |x|
                             (|FS-;notfound|
                              (CONS #'|FS-;smpeval!1| (VECTOR |lk| |lv| $))
                              |lk| $)
                             (QREFELT $ 205))))))) 

(SDEFUN |FS-;smpeval!1| ((|z| NIL) ($$ NIL))
        (PROG ($ |lv| |lk|)
          (LETT $ (QREFELT $$ 2) NIL)
          (LETT |lv| (QREFELT $$ 1) NIL)
          (LETT |lk| (QREFELT $$ 0) NIL)
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL (CONS #'|FS-;smpeval!0| (VECTOR $ |lv| |lk|)) |z|
                             (QREFELT $ 209))))))) 

(SDEFUN |FS-;smpeval!0| ((|s| NIL) ($$ NIL))
        (PROG (|lk| |lv| $)
          (LETT |lk| (QREFELT $$ 2) NIL)
          (LETT |lv| (QREFELT $$ 1) NIL)
          (LETT $ (QREFELT $$ 0) NIL)
          (RETURN (PROGN (SPADCALL |s| |lk| |lv| (QREFELT $ 208)))))) 

(SDEFUN |FS-;notfound|
        ((|fn| |Mapping| S (|Kernel| S)) (|lk| |List| (|Kernel| S))
         ($ |Mapping| S (|Kernel| S)))
        (SPROG NIL (CONS #'|FS-;notfound!0| (VECTOR |fn| |lk| $)))) 

(SDEFUN |FS-;notfound!0| ((|k| NIL) ($$ NIL))
        (PROG ($ |lk| |fn|)
          (LETT $ (QREFELT $$ 2) . #1=(|FS-;notfound|))
          (LETT |lk| (QREFELT $$ 1) . #1#)
          (LETT |fn| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|f| NIL))
                   (COND
                    ((SPADCALL
                      (SPADCALL
                       (SPADCALL (LETT |f| (SPADCALL |k| (QREFELT $ 26)) NIL)
                                 (QREFELT $ 210))
                       |lk| (QREFELT $ 211))
                      (QREFELT $ 212))
                     |f|)
                    ('T (SPADCALL |k| |fn|)))))))) 

(SDEFUN |FS-;pushunq| ((|l| |List| (|Symbol|)) (|arg| |List| S) ($ |List| S))
        (SPROG
         ((#1=#:G1139 NIL) (|a| NIL) (#2=#:G1138 NIL) (#3=#:G1137 NIL)
          (#4=#:G1136 NIL))
         (SEQ
          (COND
           ((NULL |l|)
            (PROGN
             (LETT #4# NIL . #5=(|FS-;pushunq|))
             (SEQ (LETT |a| NIL . #5#) (LETT #3# |arg| . #5#) G190
                  (COND
                   ((OR (ATOM #3#) (PROGN (LETT |a| (CAR #3#) . #5#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #4# (CONS (SPADCALL |a| (QREFELT $ 213)) #4#)
                          . #5#)))
                  (LETT #3# (CDR #3#) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #4#)))))
           ('T
            (PROGN
             (LETT #2# NIL . #5#)
             (SEQ (LETT |a| NIL . #5#) (LETT #1# |arg| . #5#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#) . #5#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (LETT #2# (CONS (SPADCALL |a| |l| (QREFELT $ 60)) #2#)
                          . #5#)))
                  (LETT #1# (CDR #1#) . #5#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |FS-;kunq|
        ((|k| |Kernel| S) (|l| |List| (|Symbol|)) (|givenlist?| |Boolean|)
         ($ S))
        (SPROG ((#1=#:G1191 NIL) (|a| NIL) (#2=#:G1190 NIL) (|s| (|Symbol|)))
               (SEQ
                (COND
                 (|givenlist?|
                  (COND ((NULL |l|) (EXIT (SPADCALL |k| (QREFELT $ 26)))))))
                (COND
                 ((SPADCALL |k| (QREFELT $ 16) (QREFELT $ 141))
                  (COND
                   ((OR
                     (SPADCALL
                      (LETT |s|
                            (SPADCALL
                             (|SPADfirst| (SPADCALL |k| (QREFELT $ 46)))
                             (QREFELT $ 214))
                            . #3=(|FS-;kunq|))
                      |l| (QREFELT $ 215))
                     (NULL |l|))
                    (EXIT
                     (SPADCALL
                      (SPADCALL
                       (CONS (SPADCALL |s| (QREFELT $ 56))
                             (PROGN
                              (LETT #2# NIL . #3#)
                              (SEQ (LETT |a| NIL . #3#)
                                   (LETT #1#
                                         (|FS-;pushunq| |l|
                                          (CDR (SPADCALL |k| (QREFELT $ 46)))
                                          $)
                                         . #3#)
                                   G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN
                                          (LETT |a| (CAR #1#) . #3#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #2#
                                           (CONS (SPADCALL |a| (QREFELT $ 58))
                                                 #2#)
                                           . #3#)))
                                   (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                                   (EXIT (NREVERSE #2#)))))
                       (QREFELT $ 57))
                      (QREFELT $ 217)))))))
                (EXIT
                 (SPADCALL (SPADCALL |k| (QREFELT $ 44))
                           (|FS-;pushunq| |l| (SPADCALL |k| (QREFELT $ 46)) $)
                           (QREFELT $ 39)))))) 

(SDEFUN |FS-;smpunq|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| S))
         (|l| |List| (|Symbol|)) (|givenlist?| |Boolean|) ($ S))
        (SPROG NIL
               (SEQ
                (COND
                 (|givenlist?|
                  (COND ((NULL |l|) (EXIT (SPADCALL |p| (QREFELT $ 89)))))))
                (EXIT
                 (SPADCALL (CONS #'|FS-;smpunq!0| (VECTOR $ |givenlist?| |l|))
                           (ELT $ 187) |p| (QREFELT $ 207)))))) 

(SDEFUN |FS-;smpunq!0| ((|x| NIL) ($$ NIL))
        (PROG (|l| |givenlist?| $)
          (LETT |l| (QREFELT $$ 2) . #1=(|FS-;smpunq|))
          (LETT |givenlist?| (QREFELT $$ 1) . #1#)
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|FS-;kunq| |x| |l| |givenlist?| $))))) 

(SDEFUN |FS-;smpret|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| S))
         ($ |Union| (|Polynomial| R) "failed"))
        (SPROG
         ((#1=#:G1200 NIL) (#2=#:G1199 #3=(|Boolean|)) (#4=#:G1201 #3#)
          (#5=#:G1208 NIL) (|k| NIL))
         (SEQ
          (COND
           ((PROGN
             (LETT #1# NIL . #6=(|FS-;smpret|))
             (SEQ (LETT |k| NIL . #6#)
                  (LETT #5# (SPADCALL |p| (QREFELT $ 185)) . #6#) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |k| (CAR #5#) . #6#) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4# (QEQCAR (SPADCALL |k| (QREFELT $ 30)) 1) . #6#)
                     (COND (#1# (LETT #2# (COND (#2# 'T) ('T #4#)) . #6#))
                           ('T
                            (PROGN
                             (LETT #2# #4# . #6#)
                             (LETT #1# 'T . #6#)))))))
                  (LETT #5# (CDR #5#) . #6#) (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) (#7='T NIL)))
            (CONS 1 "failed"))
           (#7#
            (CONS 0
                  (SPADCALL (CONS #'|FS-;smpret!0| $) (ELT $ 179) |p|
                            (QREFELT $ 222)))))))) 

(SDEFUN |FS-;smpret!0| ((|x| NIL) ($ NIL))
        (SPROG ((#1=#:G1203 NIL))
               (SPADCALL
                (PROG2 (LETT #1# (SPADCALL |x| (QREFELT $ 30)) NIL)
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (|Symbol|)
                                  (|Union| (|Symbol|) "failed") #1#))
                (QREFELT $ 218)))) 

(SDEFUN |FS-;isExpt;SBoU;56|
        ((|x| S) (|op| |BasicOperator|)
         ($ |Union|
          (|Record| (|:| |var| #1=(|Kernel| S)) (|:| |exponent| (|Integer|)))
          "failed"))
        (SPROG
         ((|v| #1#)
          (|u|
           (|Union|
            (|Record| (|:| |var| (|Kernel| S)) (|:| |exponent| (|Integer|)))
            "failed")))
         (SEQ
          (LETT |u| (SPADCALL |x| (QREFELT $ 225)) . #2=(|FS-;isExpt;SBoU;56|))
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |v| (QCAR (QCDR |u|)) . #2#)
                       (COND
                        ((SPADCALL |v| |op| (QREFELT $ 141))
                         (COND
                          ((EQL (LENGTH (SPADCALL |v| (QREFELT $ 46))) 1)
                           (EXIT |u|)))))
                       (EXIT (CONS 1 "failed"))))))))) 

(SDEFUN |FS-;isExpt;SSU;57|
        ((|x| S) (|sy| |Symbol|)
         ($ |Union|
          (|Record| (|:| |var| #1=(|Kernel| S)) (|:| |exponent| (|Integer|)))
          "failed"))
        (SPROG
         ((|v| #1#)
          (|u|
           (|Union|
            (|Record| (|:| |var| (|Kernel| S)) (|:| |exponent| (|Integer|)))
            "failed")))
         (SEQ
          (LETT |u| (SPADCALL |x| (QREFELT $ 225)) . #2=(|FS-;isExpt;SSU;57|))
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |v| (QCAR (QCDR |u|)) . #2#)
                       (COND
                        ((SPADCALL |v| |sy| (QREFELT $ 227))
                         (COND
                          ((EQL (LENGTH (SPADCALL |v| (QREFELT $ 46))) 1)
                           (EXIT |u|)))))
                       (EXIT (CONS 1 "failed"))))))))) 

(SDEFUN |FS-;smpIsMult|
        ((|p| |SparseMultivariatePolynomial| R (|Kernel| S))
         ($ |Union|
          (|Record| (|:| |coef| (|Integer|)) (|:| |var| (|Kernel| S)))
          "failed"))
        (SPROG
         ((#1=#:G1247 NIL) (|n| (|Union| (|Integer|) "failed"))
          (|r| (|Union| R "failed"))
          (|q|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| S))))
          (|u| (|Union| (|Kernel| S) "failed")))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |u| (SPADCALL |p| (QREFELT $ 114)) . #2=(|FS-;smpIsMult|))
             (EXIT
              (COND
               ((QEQCAR |u| 0)
                (COND
                 ((EQL
                   (SPADCALL
                    (LETT |q| (SPADCALL |p| (QCDR |u|) (QREFELT $ 116)) . #2#)
                    (QREFELT $ 229))
                   1)
                  (COND
                   ((SPADCALL
                     (SPADCALL (SPADCALL |q| (QREFELT $ 230)) (QREFELT $ 231))
                     (QREFELT $ 232))
                    (SEQ
                     (LETT |r|
                           (SPADCALL (SPADCALL |q| (QREFELT $ 231))
                                     (QREFELT $ 197))
                           . #2#)
                     (EXIT
                      (COND
                       ((QEQCAR |r| 0)
                        (SEQ
                         (LETT |n| (SPADCALL (QCDR |r|) (QREFELT $ 234)) . #2#)
                         (EXIT
                          (COND
                           ((QEQCAR |n| 0)
                            (PROGN
                             (LETT #1# (CONS 0 (CONS (QCDR |n|) (QCDR |u|)))
                                   . #2#)
                             (GO #3=#:G1245))))))))))))))))))
            (EXIT (CONS 1 "failed"))))
          #3# (EXIT #1#)))) 

(PUT '|FS-;debugA| '|SPADreplace| '(XLAM (|a1| |a2| |t|) |t|)) 

(SDEFUN |FS-;debugA|
        ((|a1| |List| S) (|a2| |List| S) (|t| |Boolean|) ($ |Boolean|)) |t|) 

(SDEFUN |FS-;decode_diff|
        ((|l| |List| S)
         ($
          . #1=(|Record| (|:| |orig_k| (|Kernel| S))
                         (|:| |sub| (|List| (|Integer|)))
                         (|:| |oarg| (|List| S)) (|:| |arg| (|List| S))
                         (|:| |dummies| #2=(|List| S)))))
        (SPROG
         ((|a1| (|List| S)) (|i| (|Integer|)) (|nd| #2#) (|rec| #1#)
          (|a| (|List| S)) (|k| (|Kernel| S)) (|pt| (S)) (|da| (S)))
         (SEQ
          (LETT |da| (SPADCALL |l| (QREFELT $ 52)) . #3=(|FS-;decode_diff|))
          (LETT |pt| (SPADCALL |l| (QREFELT $ 53)) . #3#)
          (LETT |a|
                (SPADCALL
                 (LETT |k| (SPADCALL (|SPADfirst| |l|) (QREFELT $ 28)) . #3#)
                 (QREFELT $ 46))
                . #3#)
          (EXIT
           (COND
            ((SPADCALL |k| (QREFELT $ 15) (QREFELT $ 141))
             (SEQ (LETT |rec| (|FS-;decode_diff| |a| $) . #3#)
                  (LETT |i| (SPADCALL |da| (QVELT |rec| 3) (QREFELT $ 150))
                        . #3#)
                  (SPADCALL (QVELT |rec| 3) |i| |pt| (QREFELT $ 158))
                  (LETT |nd| (QVELT |rec| 4) . #3#)
                  (COND
                   ((NULL (SPADCALL |i| (QVELT |rec| 1) (QREFELT $ 161)))
                    (LETT |nd| (CONS |da| |nd|) . #3#)))
                  (EXIT
                   (VECTOR (QVELT |rec| 0) (CONS |i| (QVELT |rec| 1))
                           (QVELT |rec| 2) (QVELT |rec| 3) |nd|))))
            ('T
             (SEQ (LETT |i| (SPADCALL |da| |a| (QREFELT $ 150)) . #3#)
                  (LETT |a1| (SPADCALL |a| (QREFELT $ 156)) . #3#)
                  (SPADCALL |a1| |i| |pt| (QREFELT $ 158))
                  (EXIT (VECTOR |k| (LIST |i|) |a| |a1| (LIST |da|)))))))))) 

(SDEFUN |FS-;equaldiff| ((|k1| |Kernel| S) (|k2| |Kernel| S) ($ |Boolean|))
        (SPROG
         ((|sk1| (S)) (|ok1| (S)) (|od| (|List| (|Kernel| S))) (#1=#:G1267 NIL)
          (|dk| NIL) (#2=#:G1266 NIL)
          (|r2|
           #3=(|Record| (|:| |orig_k| (|Kernel| S))
                        (|:| |sub| (|List| (|Integer|)))
                        (|:| |oarg| (|List| S)) (|:| |arg| (|List| S))
                        (|:| |dummies| (|List| S))))
          (|r1| #3#) (|res| (|Boolean|)) (|a2| #4=(|List| S)) (|a1| #4#))
         (SEQ (LETT |a1| (SPADCALL |k1| (QREFELT $ 46)) . #5=(|FS-;equaldiff|))
              (LETT |a2| (SPADCALL |k2| (QREFELT $ 46)) . #5#)
              (LETT |res|
                    (SPADCALL (SPADCALL |k1| (QREFELT $ 44))
                              (SPADCALL |k2| (QREFELT $ 44)) (QREFELT $ 236))
                    . #5#)
              (EXIT
               (COND
                (|res|
                 (SEQ
                  (LETT |res|
                        (SPADCALL (SPADCALL |a1| 3 (QREFELT $ 157))
                                  (SPADCALL |a2| 3 (QREFELT $ 157))
                                  (QREFELT $ 167))
                        . #5#)
                  (EXIT
                   (COND
                    (|res|
                     (COND
                      ((SPADCALL (SPADCALL |a1| 2 (QREFELT $ 157))
                                 (SPADCALL |a2| 2 (QREFELT $ 157))
                                 (QREFELT $ 167))
                       (SPADCALL (SPADCALL |a1| 1 (QREFELT $ 157))
                                 (SPADCALL |a2| 1 (QREFELT $ 157))
                                 (QREFELT $ 167)))
                      (#6='T
                       (SEQ (LETT |r1| (|FS-;decode_diff| |a1| $) . #5#)
                            (LETT |r2| (|FS-;decode_diff| |a2| $) . #5#)
                            (COND
                             ((NULL
                               (SPADCALL
                                (SPADCALL (QVELT |r1| 0) (QREFELT $ 44))
                                (SPADCALL (QVELT |r2| 0) (QREFELT $ 44))
                                (QREFELT $ 236)))
                              (EXIT NIL)))
                            (COND
                             ((NULL
                               (SPADCALL (QVELT |r1| 1) (QVELT |r2| 1)
                                         (QREFELT $ 237)))
                              (EXIT NIL)))
                            (COND
                             ((NULL
                               (SPADCALL (QVELT |r1| 3) (QVELT |r2| 3)
                                         (QREFELT $ 238)))
                              (EXIT NIL)))
                            (LETT |od|
                                  (PROGN
                                   (LETT #2# NIL . #5#)
                                   (SEQ (LETT |dk| NIL . #5#)
                                        (LETT #1# (QVELT |r1| 4) . #5#) G190
                                        (COND
                                         ((OR (ATOM #1#)
                                              (PROGN
                                               (LETT |dk| (CAR #1#) . #5#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #2#
                                                (CONS
                                                 (SPADCALL |dk| (QREFELT $ 28))
                                                 #2#)
                                                . #5#)))
                                        (LETT #1# (CDR #1#) . #5#) (GO G190)
                                        G191 (EXIT (NREVERSE #2#))))
                                  . #5#)
                            (LETT |ok1|
                                  (SPADCALL (QVELT |r1| 0) (QREFELT $ 26))
                                  . #5#)
                            (LETT |sk1|
                                  (SPADCALL |ok1| |od| (QVELT |r2| 4)
                                            (QREFELT $ 202))
                                  . #5#)
                            (EXIT
                             (SPADCALL |sk1|
                                       (SPADCALL (QVELT |r2| 0) (QREFELT $ 26))
                                       (QREFELT $ 167)))))))
                    (#6# (|FS-;debugA| |a1| |a2| |res| $))))))
                (#6# (|FS-;debugA| |a1| |a2| |res| $))))))) 

(SDEFUN |FS-;mainKernel;SU;62| ((|x| S) ($ |Union| (|Kernel| S) "failed"))
        (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 114))) 

(SDEFUN |FS-;kernels;SL;63| ((|x| S) ($ |List| (|Kernel| S)))
        (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 185))) 

(SDEFUN |FS-;retract;SR;64| ((|x| S) ($ R))
        (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 241))) 

(SDEFUN |FS-;retract;SP;65| ((|x| S) ($ |Polynomial| R))
        (SPROG ((#1=#:G1285 NIL))
               (PROG2
                   (LETT #1# (|FS-;smpret| (SPADCALL |x| (QREFELT $ 92)) $)
                         |FS-;retract;SP;65|)
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 0) (|Polynomial| (QREFELT $ 7))
                                 (|Union| (|Polynomial| (QREFELT $ 7))
                                          "failed")
                                 #1#)))) 

(SDEFUN |FS-;retractIfCan;SU;66| ((|x| S) ($ |Union| R "failed"))
        (CONS 0 (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 241)))) 

(SDEFUN |FS-;retractIfCan;SU;67|
        ((|x| S) ($ |Union| (|Polynomial| R) "failed"))
        (|FS-;smpret| (SPADCALL |x| (QREFELT $ 92)) $)) 

(SDEFUN |FS-;eval;SLLS;68|
        ((|x| S) (|lk| |List| (|Kernel| S)) (|lv| |List| S) ($ S))
        (|FS-;smpeval| (SPADCALL |x| (QREFELT $ 92)) |lk| |lv| $)) 

(SDEFUN |FS-;subst;SLLS;69|
        ((|x| S) (|lk| |List| (|Kernel| S)) (|lv| |List| S) ($ S))
        (|FS-;smpsubst| (SPADCALL |x| (QREFELT $ 92)) |lk| |lv| $)) 

(SDEFUN |FS-;differentiate;SSS;70| ((|x| S) (|s| |Symbol|) ($ S))
        (|FS-;smpderiv| (SPADCALL |x| (QREFELT $ 92)) |s| $)) 

(SDEFUN |FS-;coerce;SOf;71| ((|x| S) ($ |OutputForm|))
        (|FS-;smp2O| (SPADCALL |x| (QREFELT $ 92)) $)) 

(SDEFUN |FS-;eval;SLS;72| ((|f| S) (|l| |List| (|Symbol|)) ($ S))
        (|FS-;smpunq| (SPADCALL |f| (QREFELT $ 92)) |l| 'T $)) 

(SDEFUN |FS-;eval;2S;73| ((|f| S) ($ S))
        (|FS-;smpunq| (SPADCALL |f| (QREFELT $ 92)) NIL NIL $)) 

(SDEFUN |FS-;eval;SLLLS;74|
        ((|x| S) (|s| |List| (|Symbol|)) (|n| |List| (|NonNegativeInteger|))
         (|f| |List| (|Mapping| S (|List| S))) ($ S))
        (|FS-;smprep| |s| |n| |f| (SPADCALL |x| (QREFELT $ 92)) $)) 

(SDEFUN |FS-;isPlus;SU;75| ((|x| S) ($ |Union| (|List| S) "failed"))
        (SPROG
         ((#1=#:G1316 NIL) (|p| NIL) (#2=#:G1315 NIL)
          (|u|
           (|Union| (|List| (|SparseMultivariatePolynomial| R (|Kernel| S)))
                    "failed")))
         (SEQ
          (LETT |u| (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 255))
                . #3=(|FS-;isPlus;SU;75|))
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T
                  (CONS 0
                        (PROGN
                         (LETT #2# NIL . #3#)
                         (SEQ (LETT |p| NIL . #3#) (LETT #1# (QCDR |u|) . #3#)
                              G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |p| (CAR #1#) . #3#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS (SPADCALL |p| (QREFELT $ 89)) #2#)
                                      . #3#)))
                              (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                              (EXIT (NREVERSE #2#))))))))))) 

(SDEFUN |FS-;isTimes;SU;76| ((|x| S) ($ |Union| (|List| S) "failed"))
        (SPROG
         ((#1=#:G1327 NIL) (|p| NIL) (#2=#:G1326 NIL)
          (|u|
           (|Union| (|List| (|SparseMultivariatePolynomial| R (|Kernel| S)))
                    "failed")))
         (SEQ
          (LETT |u| (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 257))
                . #3=(|FS-;isTimes;SU;76|))
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T
                  (CONS 0
                        (PROGN
                         (LETT #2# NIL . #3#)
                         (SEQ (LETT |p| NIL . #3#) (LETT #1# (QCDR |u|) . #3#)
                              G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |p| (CAR #1#) . #3#) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS (SPADCALL |p| (QREFELT $ 89)) #2#)
                                      . #3#)))
                              (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                              (EXIT (NREVERSE #2#))))))))))) 

(SDEFUN |FS-;isExpt;SU;77|
        ((|x| S)
         ($ |Union|
          (|Record| (|:| |var| (|Kernel| S)) (|:| |exponent| (|Integer|)))
          "failed"))
        (SPROG
         ((|r|
           (|Record| (|:| |var| (|Kernel| S))
                     (|:| |exponent| (|NonNegativeInteger|))))
          (|u|
           (|Union|
            (|Record| (|:| |var| (|Kernel| S))
                      (|:| |exponent| (|NonNegativeInteger|)))
            "failed")))
         (SEQ
          (LETT |u| (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 261))
                . #1=(|FS-;isExpt;SU;77|))
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |r| (QCDR |u|) . #1#)
                       (EXIT (CONS 0 (CONS (QCAR |r|) (QCDR |r|))))))))))) 

(SDEFUN |FS-;isPower;SU;78|
        ((|x| S)
         ($ |Union| (|Record| (|:| |val| S) (|:| |exponent| (|Integer|)))
          "failed"))
        (SPROG
         ((|r|
           (|Record| (|:| |var| (|Kernel| S))
                     (|:| |exponent| (|NonNegativeInteger|))))
          (|u|
           (|Union|
            (|Record| (|:| |var| (|Kernel| S))
                      (|:| |exponent| (|NonNegativeInteger|)))
            "failed")))
         (SEQ
          (LETT |u| (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 261))
                . #1=(|FS-;isPower;SU;78|))
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |r| (QCDR |u|) . #1#)
                       (EXIT
                        (CONS 0
                              (CONS (SPADCALL (QCAR |r|) (QREFELT $ 26))
                                    (QCDR |r|))))))))))) 

(SDEFUN |FS-;convert;SP;79| ((|x| S) ($ |Pattern| (|Integer|)))
        (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 267))) 

(SDEFUN |FS-;convert;SP;80| ((|x| S) ($ |Pattern| (|Float|)))
        (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 270))) 

(SDEFUN |FS-;isMult;SU;81|
        ((|x| S)
         ($ |Union|
          (|Record| (|:| |coef| (|Integer|)) (|:| |var| (|Kernel| S)))
          "failed"))
        (|FS-;smpIsMult| (SPADCALL |x| (QREFELT $ 92)) $)) 

(SDEFUN |FS-;*;R2S;82| ((|r| R) (|x| S) ($ S))
        (SPADCALL (SPADCALL (SPADCALL |r| (QREFELT $ 275)) (QREFELT $ 89)) |x|
                  (QREFELT $ 136))) 

(SDEFUN |FS-;mainKernel;SU;83| ((|x| S) ($ |Union| (|Kernel| S) "failed"))
        (SPADCALL |x| (QREFELT $ 278))) 

(SDEFUN |FS-;kernels;SL;84| ((|x| S) ($ |List| (|Kernel| S)))
        (SPADCALL |x| (QREFELT $ 279))) 

(SDEFUN |FS-;univariate;SKF;85|
        ((|x| S) (|k| |Kernel| S)
         ($ |Fraction| (|SparseUnivariatePolynomial| S)))
        (SPADCALL |x| |k| (QREFELT $ 281))) 

(SDEFUN |FS-;isPlus;SU;86| ((|x| S) ($ |Union| (|List| S) "failed"))
        (SPADCALL |x| (QREFELT $ 285))) 

(SDEFUN |FS-;isTimes;SU;87| ((|x| S) ($ |Union| (|List| S) "failed"))
        (SPADCALL |x| (QREFELT $ 286))) 

(SDEFUN |FS-;isExpt;SU;88|
        ((|x| S)
         ($ |Union|
          (|Record| (|:| |var| (|Kernel| S)) (|:| |exponent| (|Integer|)))
          "failed"))
        (SPADCALL |x| (QREFELT $ 289))) 

(SDEFUN |FS-;isPower;SU;89|
        ((|x| S)
         ($ |Union| (|Record| (|:| |val| S) (|:| |exponent| (|Integer|)))
          "failed"))
        (SPADCALL |x| (QREFELT $ 292))) 

(SDEFUN |FS-;denominator;2S;90| ((|x| S) ($ S))
        (SPADCALL (SPADCALL |x| (QREFELT $ 293)) (QREFELT $ 89))) 

(SDEFUN |FS-;coerce;FS;91| ((|q| |Fraction| R) ($ S))
        (SPADCALL (SPADCALL (SPADCALL |q| (QREFELT $ 296)) (QREFELT $ 275))
                  (SPADCALL (SPADCALL |q| (QREFELT $ 297)) (QREFELT $ 275))
                  (QREFELT $ 298))) 

(SDEFUN |FS-;coerce;FS;92| ((|q| |Fraction| (|Polynomial| R)) ($ S))
        (SPADCALL (SPADCALL (SPADCALL |q| (QREFELT $ 301)) (QREFELT $ 302))
                  (SPADCALL (SPADCALL |q| (QREFELT $ 303)) (QREFELT $ 302))
                  (QREFELT $ 304))) 

(SDEFUN |FS-;coerce;FS;93|
        ((|q| |Fraction| (|Polynomial| (|Fraction| R))) ($ S))
        (SPADCALL (SPADCALL (SPADCALL |q| (QREFELT $ 308)) (QREFELT $ 309))
                  (SPADCALL (SPADCALL |q| (QREFELT $ 310)) (QREFELT $ 309))
                  (QREFELT $ 304))) 

(SDEFUN |FS-;retract;SP;94| ((|x| S) ($ |Polynomial| R))
        (SPADCALL (SPADCALL |x| (QREFELT $ 312)) (QREFELT $ 313))) 

(SDEFUN |FS-;retract;SF;95| ((|x| S) ($ |Fraction| (|Polynomial| R)))
        (SPROG ((#1=#:G1397 NIL))
               (SPADCALL
                (PROG2
                    (LETT #1# (|FS-;smpret| (SPADCALL |x| (QREFELT $ 92)) $)
                          . #2=(|FS-;retract;SF;95|))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (|Polynomial| (QREFELT $ 7))
                                  (|Union| (|Polynomial| (QREFELT $ 7))
                                           #3="failed")
                                  #1#))
                (PROG2
                    (LETT #1# (|FS-;smpret| (SPADCALL |x| (QREFELT $ 293)) $)
                          . #2#)
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (|Polynomial| (QREFELT $ 7))
                                  (|Union| (|Polynomial| (QREFELT $ 7)) #3#)
                                  #1#))
                (QREFELT $ 314)))) 

(SDEFUN |FS-;retract;SR;96| ((|x| S) ($ R))
        (SPROG ((#1=#:G1401 NIL))
               (PROG2
                   (LETT #1#
                         (SPADCALL
                          (SPADCALL (SPADCALL |x| (QREFELT $ 92))
                                    (QREFELT $ 241))
                          (SPADCALL (SPADCALL |x| (QREFELT $ 293))
                                    (QREFELT $ 241))
                          (QREFELT $ 317))
                         |FS-;retract;SR;96|)
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 0) (QREFELT $ 7)
                                 (|Union| (QREFELT $ 7) "failed") #1#)))) 

(SDEFUN |FS-;alg_ker_set| ((|lx| |List| S) ($ |List| (|Kernel| S)))
        (SPROG
         ((|ak1| (|List| #1=(|Kernel| S))) (#2=#:G1428 NIL) (|k1| NIL)
          (|arg| (|List| S)) (|resl| (|List| (|Kernel| S)))
          (|needed| (|Boolean|)) (#3=#:G1427 NIL) (#4=#:G1426 NIL)
          (#5=#:G1425 NIL) (|k| NIL) (|ak| (|List| #1#)) (#6=#:G1424 NIL)
          (#7=#:G1423 NIL) (|x| NIL))
         (SEQ (LETT |resl| NIL . #8=(|FS-;alg_ker_set|)) (LETT |ak1| NIL . #8#)
              (SEQ (LETT |x| NIL . #8#) (LETT #7# |lx| . #8#) G190
                   (COND
                    ((OR (ATOM #7#) (PROGN (LETT |x| (CAR #7#) . #8#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |k| NIL . #8#)
                          (LETT #6# (SPADCALL |x| (QREFELT $ 318)) . #8#) G190
                          (COND
                           ((OR (ATOM #6#)
                                (PROGN (LETT |k| (CAR #6#) . #8#) NIL))
                            (GO G191)))
                          (SEQ
                           (COND
                            ((NULL (SPADCALL |k| '|nthRoot| (QREFELT $ 227)))
                             (COND
                              ((NULL (SPADCALL |k| '|rootOf| (QREFELT $ 227)))
                               (EXIT "iterate")))))
                           (EXIT (LETT |ak1| (CONS |k| |ak1|) . #8#)))
                          (LETT #6# (CDR #6#) . #8#) (GO G190) G191
                          (EXIT NIL))))
                   (LETT #7# (CDR #7#) . #8#) (GO G190) G191 (EXIT NIL))
              (SEQ G190 (COND ((NULL (NULL (NULL |ak1|))) (GO G191)))
                   (SEQ (LETT |ak| |ak1| . #8#) (LETT |ak1| NIL . #8#)
                        (EXIT
                         (SEQ (LETT |k| NIL . #8#) (LETT #5# |ak| . #8#) G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT |k| (CAR #5#) . #8#) NIL))
                                (GO G191)))
                              (SEQ (LETT |needed| 'T . #8#)
                                   (SEQ (LETT |k1| NIL . #8#)
                                        (LETT #4# |resl| . #8#) G190
                                        (COND
                                         ((OR (ATOM #4#)
                                              (PROGN
                                               (LETT |k1| (CAR #4#) . #8#)
                                               NIL)
                                              (NULL |needed|))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (COND
                                           ((EQ |k1| |k|)
                                            (LETT |needed| NIL . #8#)))))
                                        (LETT #4# (CDR #4#) . #8#) (GO G190)
                                        G191 (EXIT NIL))
                                   (SEQ (LETT |k1| NIL . #8#)
                                        (LETT #3# |resl| . #8#) G190
                                        (COND
                                         ((OR (ATOM #3#)
                                              (PROGN
                                               (LETT |k1| (CAR #3#) . #8#)
                                               NIL)
                                              (NULL |needed|))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (COND
                                           ((SPADCALL |k1| |k| (QREFELT $ 319))
                                            (LETT |needed| NIL . #8#)))))
                                        (LETT #3# (CDR #3#) . #8#) (GO G190)
                                        G191 (EXIT NIL))
                                   (EXIT
                                    (COND
                                     (|needed|
                                      (SEQ
                                       (LETT |resl| (CONS |k| |resl|) . #8#)
                                       (LETT |ak1| (CONS |k| |ak1|) . #8#)
                                       (LETT |arg|
                                             (SPADCALL |k| (QREFELT $ 46))
                                             . #8#)
                                       (EXIT
                                        (SEQ (LETT |k1| NIL . #8#)
                                             (LETT #2#
                                                   (SPADCALL
                                                    (SPADCALL |arg| 1
                                                              (QREFELT $ 157))
                                                    (QREFELT $ 318))
                                                   . #8#)
                                             G190
                                             (COND
                                              ((OR (ATOM #2#)
                                                   (PROGN
                                                    (LETT |k1| (CAR #2#) . #8#)
                                                    NIL))
                                               (GO G191)))
                                             (SEQ
                                              (EXIT
                                               (COND
                                                ((OR
                                                  (SPADCALL |k1| '|nthRoot|
                                                            (QREFELT $ 227))
                                                  (SPADCALL |k1| '|rootOf|
                                                            (QREFELT $ 227)))
                                                 (LETT |ak1| (CONS |k1| |ak1|)
                                                       . #8#)))))
                                             (LETT #2# (CDR #2#) . #8#)
                                             (GO G190) G191 (EXIT NIL)))))
                                     ('T "iterate"))))
                              (LETT #5# (CDR #5#) . #8#) (GO G190) G191
                              (EXIT NIL))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |resl|)))) 

(SDEFUN |FS-;algtower;LL;98| ((|lx| |List| S) ($ |List| (|Kernel| S)))
        (NREVERSE (SPADCALL (|FS-;alg_ker_set| |lx| $) (QREFELT $ 320)))) 

(SDEFUN |FS-;algtower;SL;99| ((|x| S) ($ |List| (|Kernel| S)))
        (SPADCALL (LIST |x|) (QREFELT $ 322))) 

(SDEFUN |FS-;coerce;SOf;100| ((|x| S) ($ |OutputForm|))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT $ 293)) (|spadConstant| $ 324)
                    (QREFELT $ 325))
          (|FS-;smp2O| (SPADCALL |x| (QREFELT $ 92)) $))
         ('T
          (SPADCALL (|FS-;smp2O| (SPADCALL |x| (QREFELT $ 92)) $)
                    (|FS-;smp2O| (SPADCALL |x| (QREFELT $ 293)) $)
                    (QREFELT $ 326))))) 

(SDEFUN |FS-;retractIfCan;SU;101| ((|x| S) ($ |Union| R "failed"))
        (SPROG
         ((#1=#:G1441 NIL) (|r| (|Union| R "failed"))
          (|d| #2=(|Union| R "failed")) (|n| #2#))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |n| (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 197))
                   . #3=(|FS-;retractIfCan;SU;101|))
             (EXIT
              (COND
               ((QEQCAR |n| 1)
                (PROGN (LETT #1# (CONS 1 #4="failed") . #3#) (GO #5=#:G1439)))
               (#6='T
                (SEQ
                 (LETT |d|
                       (SPADCALL (SPADCALL |x| (QREFELT $ 293))
                                 (QREFELT $ 197))
                       . #3#)
                 (EXIT
                  (COND
                   ((QEQCAR |d| 1)
                    (PROGN (LETT #1# (CONS 1 #4#) . #3#) (GO #5#)))
                   (#6#
                    (SEQ
                     (LETT |r| (SPADCALL (QCDR |n|) (QCDR |d|) (QREFELT $ 317))
                           . #3#)
                     (EXIT
                      (COND
                       ((QEQCAR |r| 1)
                        (PROGN
                         (LETT #1# (CONS 1 #4#) . #3#)
                         (GO #5#))))))))))))))
            (EXIT (CONS 0 (QCDR |r|)))))
          #5# (EXIT #1#)))) 

(SDEFUN |FS-;eval;SLS;102| ((|f| S) (|l| |List| (|Symbol|)) ($ S))
        (SPADCALL (|FS-;smpunq| (SPADCALL |f| (QREFELT $ 92)) |l| 'T $)
                  (|FS-;smpunq| (SPADCALL |f| (QREFELT $ 293)) |l| 'T $)
                  (QREFELT $ 304))) 

(SDEFUN |FS-;eval;2S;103| ((|f| S) ($ S))
        (SPADCALL (|FS-;smpunq| (SPADCALL |f| (QREFELT $ 92)) NIL NIL $)
                  (|FS-;smpunq| (SPADCALL |f| (QREFELT $ 293)) NIL NIL $)
                  (QREFELT $ 304))) 

(SDEFUN |FS-;eval;SLLLS;104|
        ((|x| S) (|s| |List| (|Symbol|)) (|n| |List| (|NonNegativeInteger|))
         (|f| |List| (|Mapping| S (|List| S))) ($ S))
        (SPADCALL (|FS-;smprep| |s| |n| |f| (SPADCALL |x| (QREFELT $ 92)) $)
                  (|FS-;smprep| |s| |n| |f| (SPADCALL |x| (QREFELT $ 293)) $)
                  (QREFELT $ 304))) 

(SDEFUN |FS-;differentiate;SSS;105| ((|f| S) (|x| |Symbol|) ($ S))
        (SPADCALL
         (SPADCALL
          (SPADCALL (|FS-;smpderiv| (SPADCALL |f| (QREFELT $ 92)) |x| $)
                    (SPADCALL (SPADCALL |f| (QREFELT $ 293)) (QREFELT $ 89))
                    (QREFELT $ 136))
          (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 92)) (QREFELT $ 89))
                    (|FS-;smpderiv| (SPADCALL |f| (QREFELT $ 293)) |x| $)
                    (QREFELT $ 136))
          (QREFELT $ 327))
         (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT $ 293)) (QREFELT $ 89)) 2
                   (QREFELT $ 328))
         (QREFELT $ 304))) 

(SDEFUN |FS-;eval;SLLS;106|
        ((|x| S) (|lk| |List| (|Kernel| S)) (|lv| |List| S) ($ S))
        (SPADCALL (|FS-;smpeval| (SPADCALL |x| (QREFELT $ 92)) |lk| |lv| $)
                  (|FS-;smpeval| (SPADCALL |x| (QREFELT $ 293)) |lk| |lv| $)
                  (QREFELT $ 304))) 

(SDEFUN |FS-;subst;SLLS;107|
        ((|x| S) (|lk| |List| (|Kernel| S)) (|lv| |List| S) ($ S))
        (SPADCALL (|FS-;smpsubst| (SPADCALL |x| (QREFELT $ 92)) |lk| |lv| $)
                  (|FS-;smpsubst| (SPADCALL |x| (QREFELT $ 293)) |lk| |lv| $)
                  (QREFELT $ 304))) 

(SDEFUN |FS-;par| ((|x| S) ($ S))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT $ 18)) |FS-;par|)
                    (EXIT
                     (COND ((QEQCAR |r| 0) |x|)
                           ('T (SPADCALL |x| (QREFELT $ 329)))))))) 

(SDEFUN |FS-;convert;FS;109| ((|x| |Factored| S) ($ S))
        (SPROG
         ((#1=#:G1473 NIL) (#2=#:G1472 (S)) (#3=#:G1474 (S)) (#4=#:G1476 NIL)
          (|f| NIL))
         (SEQ
          (SPADCALL (|FS-;par| (SPADCALL |x| (QREFELT $ 331)) $)
                    (PROGN
                     (LETT #1# NIL . #5=(|FS-;convert;FS;109|))
                     (SEQ (LETT |f| NIL . #5#)
                          (LETT #4# (SPADCALL |x| (QREFELT $ 334)) . #5#) G190
                          (COND
                           ((OR (ATOM #4#)
                                (PROGN (LETT |f| (CAR #4#) . #5#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #3#
                                   (SPADCALL (|FS-;par| (QCAR |f|) $)
                                             (QCDR |f|) (QREFELT $ 328))
                                   . #5#)
                             (COND
                              (#1#
                               (LETT #2# (SPADCALL #2# #3# (QREFELT $ 136))
                                     . #5#))
                              ('T
                               (PROGN
                                (LETT #2# #3# . #5#)
                                (LETT #1# 'T . #5#)))))))
                          (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
                     (COND (#1# #2#) ('T (|spadConstant| $ 146))))
                    (QREFELT $ 136))))) 

(SDEFUN |FS-;retractIfCan;SU;110|
        ((|x| S) ($ |Union| (|Polynomial| R) "failed"))
        (SPROG ((|u| (|Union| (|Fraction| (|Polynomial| R)) "failed")))
               (SEQ
                (LETT |u| (SPADCALL |x| (QREFELT $ 338))
                      |FS-;retractIfCan;SU;110|)
                (EXIT
                 (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                       ('T (SPADCALL (QCDR |u|) (QREFELT $ 339)))))))) 

(SDEFUN |FS-;retractIfCan;SU;111|
        ((|x| S) ($ |Union| (|Fraction| (|Polynomial| R)) "failed"))
        (SPROG ((|d| #1=(|Union| (|Polynomial| R) "failed")) (|n| #1#))
               (SEQ
                (LETT |n| (|FS-;smpret| (SPADCALL |x| (QREFELT $ 92)) $)
                      . #2=(|FS-;retractIfCan;SU;111|))
                (EXIT
                 (COND ((QEQCAR |n| 1) (CONS 1 "failed"))
                       (#3='T
                        (SEQ
                         (LETT |d|
                               (|FS-;smpret| (SPADCALL |x| (QREFELT $ 293)) $)
                               . #2#)
                         (EXIT
                          (COND ((QEQCAR |d| 1) (CONS 1 "failed"))
                                (#3#
                                 (CONS 0
                                       (SPADCALL (QCDR |n|) (QCDR |d|)
                                                 (QREFELT $ 314))))))))))))) 

(SDEFUN |FS-;coerce;PS;112| ((|p| |Polynomial| (|Fraction| R)) ($ S))
        (SPADCALL (ELT $ 38) (ELT $ 341) |p| (QREFELT $ 344))) 

(SDEFUN |FS-;coerce;FS;113| ((|x| |Fraction| (|Integer|)) ($ S))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 347)) (QREFELT $ 348))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 349)) (QREFELT $ 348))
                  (QREFELT $ 298))) 

(SDEFUN |FS-;isMult;SU;114|
        ((|x| S)
         ($ |Union|
          (|Record| (|:| |coef| (|Integer|)) (|:| |var| (|Kernel| S)))
          "failed"))
        (SPROG
         ((|q| (|Union| (|Integer|) "failed"))
          (|r| (|Record| (|:| |coef| (|Integer|)) (|:| |var| (|Kernel| S))))
          (#1=#:G1511 NIL) (|w| (|Union| (|Integer|) "failed"))
          (|v| (|Union| R "failed"))
          (|u|
           (|Union|
            (|Record| (|:| |coef| (|Integer|)) (|:| |var| (|Kernel| S)))
            "failed")))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |u| (|FS-;smpIsMult| (SPADCALL |x| (QREFELT $ 92)) $)
                   . #2=(|FS-;isMult;SU;114|))
             (EXIT
              (COND
               ((QEQCAR |u| 1)
                (PROGN (LETT #1# (CONS 1 #3="failed") . #2#) (GO #4=#:G1509)))
               (#5='T
                (SEQ
                 (LETT |v|
                       (SPADCALL (SPADCALL |x| (QREFELT $ 293))
                                 (QREFELT $ 197))
                       . #2#)
                 (EXIT
                  (COND
                   ((QEQCAR |v| 1)
                    (PROGN (LETT #1# (CONS 1 #3#) . #2#) (GO #4#)))
                   (#5#
                    (SEQ (LETT |w| (SPADCALL (QCDR |v|) (QREFELT $ 234)) . #2#)
                         (EXIT
                          (COND
                           ((QEQCAR |w| 1)
                            (PROGN
                             (LETT #1# (CONS 1 #3#) . #2#)
                             (GO #4#))))))))))))))
            (LETT |r| (QCDR |u|) . #2#)
            (LETT |q| (SPADCALL (QCAR |r|) (QCDR |w|) (QREFELT $ 351)) . #2#)
            (EXIT
             (COND ((QEQCAR |q| 1) (CONS 1 "failed"))
                   (#5# (CONS 0 (CONS (QCDR |q|) (QCDR |r|))))))))
          #4# (EXIT #1#)))) 

(SDEFUN |FS-;convert;SP;115| ((|x| S) ($ |Pattern| (|Integer|)))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 267))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 293)) (QREFELT $ 267))
                  (QREFELT $ 352))) 

(SDEFUN |FS-;convert;SP;116| ((|x| S) ($ |Pattern| (|Float|)))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT $ 92)) (QREFELT $ 270))
                  (SPADCALL (SPADCALL |x| (QREFELT $ 293)) (QREFELT $ 270))
                  (QREFELT $ 353))) 

(DECLAIM (NOTINLINE |FunctionSpace&;|)) 

(DEFUN |FunctionSpace&| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FunctionSpace&|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|FunctionSpace&| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 357) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| |#2|
                                                             '(|RetractableTo|
                                                               (|Integer|)))
                                              (|HasCategory| |#2|
                                                             '(|IntegralDomain|))
                                              (|HasCategory| |#2|
                                                             '(|CommutativeRing|))
                                              (|HasCategory| |#2|
                                                             '(|CharacteristicNonZero|))
                                              (|HasCategory| |#2|
                                                             '(|CharacteristicZero|))
                                              (|HasCategory| |#2| '(|Ring|))
                                              (|HasCategory| |#2|
                                                             '(|AbelianGroup|))
                                              (|HasCategory| |#2|
                                                             '(|AbelianSemiGroup|))
                                              (|HasCategory| |#2| '(|Group|))
                                              (|HasCategory| |#2|
                                                             '(|SemiGroup|))
                                              (|HasCategory| |#2|
                                                             '(|ConvertibleTo|
                                                               (|InputForm|)))))
                          . #1#))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8 '|odd|)
          (QSETREFV $ 9 '|even|)
          (QSETREFV $ 10 '|%specialDiff|)
          (QSETREFV $ 15 (SPADCALL '|%diff| (QREFELT $ 14)))
          (QSETREFV $ 16 (SPADCALL '|%quote| (QREFELT $ 14)))
          (COND
           ((|testBitVector| |pv$| 11)
            (PROGN
             (QSETREFV $ 61 (CONS (|dispatchFunction| |FS-;eval;SSS;16|) $))
             (QSETREFV $ 64 (CONS (|dispatchFunction| |FS-;eval;SBoSSS;17|) $))
             (QSETREFV $ 71 (CONS (|dispatchFunction| |FS-;eval;SLLSS;18|) $))
             (SPADCALL (QREFELT $ 15) '|%specialInput|
                       (CONS (|function| |FS-;indiff|) $) (QREFELT $ 73)))))
          (COND
           ((|testBitVector| |pv$| 6)
            (PROGN
             (QSETREFV $ 82 '%%0)
             (QSETREFV $ 85
                       (CONS (|dispatchFunction| |FS-;characteristic;Nni;22|)
                             $))
             (QSETREFV $ 90 (CONS (|dispatchFunction| |FS-;coerce;KS;23|) $))
             (QSETREFV $ 93
                       (CONS (|dispatchFunction| |FS-;numerator;2S;25|) $))
             (QSETREFV $ 99
                       (CONS (|dispatchFunction| |FS-;eval;SSNniMS;26|) $))
             (QSETREFV $ 100
                       (CONS (|dispatchFunction| |FS-;eval;SSNniMS;27|) $))
             (QSETREFV $ 102 (CONS (|dispatchFunction| |FS-;eval;SLLS;28|) $))
             (QSETREFV $ 111 (CONS (|dispatchFunction| |FS-;elt;BoLS;29|) $))
             (QSETREFV $ 112 (CONS (|dispatchFunction| |FS-;eval;SLLLS;30|) $))
             NIL
             (QSETREFV $ 192 (CONS (|dispatchFunction| |FS-;coerce;PS;45|) $))
             (COND ((|testBitVector| |pv$| 11)))
             (QSETREFV $ 226
                       (CONS (|dispatchFunction| |FS-;isExpt;SBoU;56|) $))
             (QSETREFV $ 228 (CONS (|dispatchFunction| |FS-;isExpt;SSU;57|) $))
             (COND ((|testBitVector| |pv$| 1)))
             (SPADCALL (QREFELT $ 15) (CONS (|function| |FS-;diffEval|) $)
                       (QREFELT $ 235))
             (SPADCALL (QREFELT $ 15) '|%specialEqual|
                       (CONS (|function| |FS-;equaldiff|) $) (QREFELT $ 73))
             (SPADCALL (QREFELT $ 15) (QREFELT $ 10)
                       (CONS (|function| |FS-;diffdiff|) $) (QREFELT $ 73))
             (SPADCALL (QREFELT $ 15) '|%specialDisp|
                       (CONS (|function| |FS-;ddiff|) $) (QREFELT $ 73))
             (COND ((|testBitVector| |pv$| 2))
                   ('T
                    (PROGN
                     (QSETREFV $ 239
                               (CONS
                                (|dispatchFunction| |FS-;mainKernel;SU;62|) $))
                     (QSETREFV $ 240
                               (CONS (|dispatchFunction| |FS-;kernels;SL;63|)
                                     $))
                     (QSETREFV $ 242
                               (CONS (|dispatchFunction| |FS-;retract;SR;64|)
                                     $))
                     (QSETREFV $ 243
                               (CONS (|dispatchFunction| |FS-;retract;SP;65|)
                                     $))
                     (QSETREFV $ 244
                               (CONS
                                (|dispatchFunction| |FS-;retractIfCan;SU;66|)
                                $))
                     (QSETREFV $ 246
                               (CONS
                                (|dispatchFunction| |FS-;retractIfCan;SU;67|)
                                $))
                     (QSETREFV $ 247
                               (CONS (|dispatchFunction| |FS-;eval;SLLS;68|)
                                     $))
                     (QSETREFV $ 248
                               (CONS (|dispatchFunction| |FS-;subst;SLLS;69|)
                                     $))
                     (QSETREFV $ 249
                               (CONS
                                (|dispatchFunction| |FS-;differentiate;SSS;70|)
                                $))
                     (QSETREFV $ 250
                               (CONS (|dispatchFunction| |FS-;coerce;SOf;71|)
                                     $))
                     (COND
                      ((|testBitVector| |pv$| 11)
                       (PROGN
                        (QSETREFV $ 251
                                  (CONS (|dispatchFunction| |FS-;eval;SLS;72|)
                                        $))
                        (QSETREFV $ 252
                                  (CONS (|dispatchFunction| |FS-;eval;2S;73|)
                                        $)))))
                     (QSETREFV $ 253
                               (CONS (|dispatchFunction| |FS-;eval;SLLLS;74|)
                                     $))
                     (QSETREFV $ 256
                               (CONS (|dispatchFunction| |FS-;isPlus;SU;75|)
                                     $))
                     (QSETREFV $ 258
                               (CONS (|dispatchFunction| |FS-;isTimes;SU;76|)
                                     $))
                     (QSETREFV $ 262
                               (CONS (|dispatchFunction| |FS-;isExpt;SU;77|)
                                     $))
                     (QSETREFV $ 265
                               (CONS (|dispatchFunction| |FS-;isPower;SU;78|)
                                     $))
                     (COND
                      ((|HasCategory| |#2|
                                      '(|ConvertibleTo|
                                        (|Pattern| (|Integer|))))
                       (QSETREFV $ 268
                                 (CONS (|dispatchFunction| |FS-;convert;SP;79|)
                                       $))))
                     (COND
                      ((|HasCategory| |#2|
                                      '(|ConvertibleTo| (|Pattern| (|Float|))))
                       (QSETREFV $ 271
                                 (CONS (|dispatchFunction| |FS-;convert;SP;80|)
                                       $))))
                     (COND
                      ((|testBitVector| |pv$| 1)
                       (QSETREFV $ 274
                                 (CONS (|dispatchFunction| |FS-;isMult;SU;81|)
                                       $))))))))))
          (COND
           ((|testBitVector| |pv$| 3)
            (QSETREFV $ 276 (CONS (|dispatchFunction| |FS-;*;R2S;82|) $))))
          (COND
           ((|testBitVector| |pv$| 2)
            (PROGN
             (QSETREFV $ 239
                       (CONS (|dispatchFunction| |FS-;mainKernel;SU;83|) $))
             (QSETREFV $ 240 (CONS (|dispatchFunction| |FS-;kernels;SL;84|) $))
             (QSETREFV $ 283
                       (CONS (|dispatchFunction| |FS-;univariate;SKF;85|) $))
             (QSETREFV $ 256 (CONS (|dispatchFunction| |FS-;isPlus;SU;86|) $))
             (QSETREFV $ 258 (CONS (|dispatchFunction| |FS-;isTimes;SU;87|) $))
             (QSETREFV $ 262 (CONS (|dispatchFunction| |FS-;isExpt;SU;88|) $))
             (QSETREFV $ 265 (CONS (|dispatchFunction| |FS-;isPower;SU;89|) $))
             (QSETREFV $ 294
                       (CONS (|dispatchFunction| |FS-;denominator;2S;90|) $))
             (QSETREFV $ 299 (CONS (|dispatchFunction| |FS-;coerce;FS;91|) $))
             (QSETREFV $ 305 (CONS (|dispatchFunction| |FS-;coerce;FS;92|) $))
             (QSETREFV $ 311 (CONS (|dispatchFunction| |FS-;coerce;FS;93|) $))
             (QSETREFV $ 243 (CONS (|dispatchFunction| |FS-;retract;SP;94|) $))
             (QSETREFV $ 315 (CONS (|dispatchFunction| |FS-;retract;SF;95|) $))
             (QSETREFV $ 242 (CONS (|dispatchFunction| |FS-;retract;SR;96|) $))
             (QSETREFV $ 321
                       (CONS (|dispatchFunction| |FS-;algtower;LL;98|) $))
             (QSETREFV $ 323
                       (CONS (|dispatchFunction| |FS-;algtower;SL;99|) $))
             (QSETREFV $ 250
                       (CONS (|dispatchFunction| |FS-;coerce;SOf;100|) $))
             (QSETREFV $ 244
                       (CONS (|dispatchFunction| |FS-;retractIfCan;SU;101|) $))
             (QSETREFV $ 251 (CONS (|dispatchFunction| |FS-;eval;SLS;102|) $))
             (COND
              ((|testBitVector| |pv$| 11)
               (PROGN
                (QSETREFV $ 252
                          (CONS (|dispatchFunction| |FS-;eval;2S;103|) $))
                (QSETREFV $ 253
                          (CONS (|dispatchFunction| |FS-;eval;SLLLS;104|)
                                $)))))
             (QSETREFV $ 249
                       (CONS (|dispatchFunction| |FS-;differentiate;SSS;105|)
                             $))
             (QSETREFV $ 247 (CONS (|dispatchFunction| |FS-;eval;SLLS;106|) $))
             (QSETREFV $ 248
                       (CONS (|dispatchFunction| |FS-;subst;SLLS;107|) $))
             (QSETREFV $ 336
                       (CONS (|dispatchFunction| |FS-;convert;FS;109|) $))
             (QSETREFV $ 246
                       (CONS (|dispatchFunction| |FS-;retractIfCan;SU;110|) $))
             (QSETREFV $ 340
                       (CONS (|dispatchFunction| |FS-;retractIfCan;SU;111|) $))
             (QSETREFV $ 345 (CONS (|dispatchFunction| |FS-;coerce;PS;112|) $))
             (COND
              ((|testBitVector| |pv$| 1)
               (PROGN
                (QSETREFV $ 350
                          (CONS (|dispatchFunction| |FS-;coerce;FS;113|) $))
                (QSETREFV $ 274
                          (CONS (|dispatchFunction| |FS-;isMult;SU;114|) $)))))
             (COND
              ((|HasCategory| |#2| '(|ConvertibleTo| (|Pattern| (|Integer|))))
               (QSETREFV $ 268
                         (CONS (|dispatchFunction| |FS-;convert;SP;115|) $))))
             (COND
              ((|HasCategory| |#2| '(|ConvertibleTo| (|Pattern| (|Float|))))
               (QSETREFV $ 271
                         (CONS (|dispatchFunction| |FS-;convert;SP;116|)
                               $)))))))
          $))) 

(MAKEPROP '|FunctionSpace&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) 'ODD 'EVEN
              'SPECIALDIFF (|BasicOperator|) (|Symbol|) (|CommonOperators|)
              (0 . |operator|) '|opdiff| '|opquote| (|Union| 7 '#1="failed")
              (5 . |retractIfCan|) (|Boolean|) |FS-;ground?;SB;1|
              (10 . |retract|) |FS-;ground;SR;2| (|Kernel| 6) (15 . |kernel|)
              (|Kernel| $) (20 . |coerce|) |FS-;coerce;SS;3| (25 . |retract|)
              (|Union| 12 '"failed") (30 . |symbolIfCan|) |FS-;retract;SS;4|
              (|List| $) (35 . |applyQuote|) |FS-;applyQuote;S2S;5|
              |FS-;applyQuote;S3S;6| |FS-;applyQuote;S4S;7|
              |FS-;applyQuote;S5S;8| (41 . |coerce|) (46 . |elt|)
              |FS-;applyQuote;SLS;9| (52 . |has?|) (58 . |is?|)
              |FS-;belong?;BoB;10| (64 . |operator|) (|List| 6)
              (69 . |argument|) (74 . |kernel|) (80 . |name|) (|String|)
              (85 . |string|) |FS-;operator;2Bo;12| (90 . |second|)
              (95 . |third|) (100 . |eval|) (|InputForm|) (107 . |convert|)
              (112 . |convert|) (117 . |convert|) (|List| 12) (122 . |eval|)
              (128 . |eval|) (|List| 11) (134 . |eval|) (142 . |eval|)
              (|Mapping| 6 6) (|MakeUnaryCompiledFunction| 6 6 6)
              (150 . |compiledFunction|) (|Mapping| $ $) (|List| 68)
              (156 . |eval|) (163 . |eval|) (|None|) (171 . |setProperty|)
              (|List| 25) (178 . |tower|) |FS-;variables;LL;19|
              (183 . |variables|) |FS-;variables;SL;20| (|Union| 25 '#1#)
              (188 . |retractIfCan|) |FS-;retractIfCan;SU;21| '|gendiff|
              (|NonNegativeInteger|) (193 . |characteristic|)
              (197 . |characteristic|) (|SparseMultivariatePolynomial| 7 23)
              (201 . |coerce|) (|SparseMultivariatePolynomial| 7 25)
              (206 . |coerce|) (211 . |coerce|) (216 . |new|) (220 . |numer|)
              (225 . |numerator|) (230 . |first|) (|List| 83) (|Mapping| $ 32)
              (|List| 96) (235 . |eval|) (243 . |eval|) (251 . |eval|)
              (259 . |new|) (265 . |eval|) (272 . |unary?|)
              (277 . |leadingCoefficient|) (282 . |Zero|) (286 . |smaller?|)
              (292 . -) (297 . |elt|) (|ExpressionSpace&| 6) (303 . |elt|)
              (309 . |elt|) (315 . |eval|) (|Union| 23 '"failed")
              (323 . |mainVariable|) (|SparseUnivariatePolynomial| $)
              (328 . |univariate|) (|SparseUnivariatePolynomial| 6)
              (|Mapping| 6 86) (|SparseUnivariatePolynomial| 86)
              (|SparseUnivariatePolynomialFunctions2| 86 6) (334 . |map|)
              (|Integer|) (340 . |position|) (346 . |minIndex|) (351 . |elt|)
              (357 . |Zero|) (|Mapping| 6 45) (|List| 127) (361 . |elt|)
              (367 . |elt|) (373 . |Zero|) (377 . ~=) (383 . |degree|)
              (388 . ^) (394 . |leadingCoefficient|) (399 . *) (405 . +)
              (411 . |reductum|) (|OutputForm|) (416 . |coerce|) (421 . |is?|)
              (|List| 139) (427 . |position|) (433 . |setelt!|)
              (440 . |coerce|) (445 . |One|) (449 . |minIndex|)
              (454 . |coerce|) (459 . |hconcat|) (465 . |position|)
              (471 . |sub|) (477 . |differentiate|) (|Union| 72 '"failed")
              (483 . |property|) (489 . |prefix|) (495 . |copy|) (500 . |elt|)
              (506 . |setelt!|) (513 . >) (|List| 122) (519 . |member?|)
              (525 . |first|) (531 . |rest|) (537 . |concat|)
              (543 . |maxIndex|) (548 . |differentiate|) (554 . =)
              (|Union| 128 '"failed") (|BasicOperatorFunctions1| 6)
              (560 . |derivative|) (|Equation| 6) (565 . =) (|Equation| $)
              (571 . |subst|) (577 . |kernel|) (583 . ~=) (589 . ~=)
              (|Polynomial| 7) (595 . |coerce|) (600 . |differentiate|)
              (606 . |retract|) (|Mapping| 7 7) (611 . |map|) (|List| 23)
              (617 . |variables|) (622 . |differentiate|) (628 . |coerce|)
              (|Mapping| 6 12) (|Mapping| 6 7)
              (|PolynomialCategoryLifting| (|IndexedExponents| 12) 12 7 178 6)
              (633 . |map|) (640 . |coerce|) (|Union| 19 '"failed")
              (|UserDefinedPartialOrdering| 12) (645 . |less?|) (651 . <)
              (657 . |retractIfCan|) (662 . |coerce|) (667 . |userOrdered?|)
              (671 . |coerce|) (676 . |outputForm|) (682 . |subst|)
              (|Mapping| 6 23) (|ListToMap| 23 6) (689 . |match|)
              (|PolynomialCategoryLifting| (|IndexedExponents| 23) 23 7 86 6)
              (697 . |map|) (704 . |eval|) (711 . |map|) (717 . |tower|)
              (722 . |setIntersection|) (728 . |empty?|) (733 . |eval|)
              (738 . |retract|) (743 . |member?|) (|InputFormFunctions1| 6)
              (749 . |interpret|) (754 . |coerce|) (|Mapping| 178 23)
              (|Mapping| 178 7)
              (|PolynomialCategoryLifting| (|IndexedExponents| 23) 23 7 86 178)
              (759 . |map|) (|Record| (|:| |var| 25) (|:| |exponent| 122))
              (|Union| 223 '"failed") (766 . |isExpt|) (771 . |isExpt|)
              (777 . |is?|) (783 . |isExpt|) (789 . |degree|)
              (794 . |reductum|) (799 . |leadingCoefficient|) (804 . |zero?|)
              (|Union| 122 '#1#) (809 . |retractIfCan|) (814 . |evaluate|)
              (820 . =) (826 . =) (832 . =) (838 . |mainKernel|)
              (843 . |kernels|) (848 . |retract|) (853 . |retract|)
              (858 . |retract|) (863 . |retractIfCan|) (|Union| 178 '"failed")
              (868 . |retractIfCan|) (873 . |eval|) (880 . |subst|)
              (887 . |differentiate|) (893 . |coerce|) (898 . |eval|)
              (904 . |eval|) (909 . |eval|) (|Union| 32 '#2="failed")
              (917 . |isPlus|) (922 . |isPlus|) (927 . |isTimes|)
              (932 . |isTimes|) (|Record| (|:| |var| 23) (|:| |exponent| 83))
              (|Union| 259 '#2#) (937 . |isExpt|) (942 . |isExpt|)
              (|Record| (|:| |val| $) (|:| |exponent| 122))
              (|Union| 263 '"failed") (947 . |isPower|) (|Pattern| 122)
              (952 . |convert|) (957 . |convert|) (|Pattern| (|Float|))
              (962 . |convert|) (967 . |convert|)
              (|Record| (|:| |coef| 122) (|:| |var| 25))
              (|Union| 272 '"failed") (972 . |isMult|) (977 . |coerce|)
              (982 . *)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 23) 23
                                                     7 86 6)
              (988 . |mainVariable|) (993 . |variables|) (|Fraction| 117)
              (998 . |univariate|) (|Fraction| 115) (1004 . |univariate|)
              (|Union| 45 '"failed") (1010 . |isPlus|) (1015 . |isTimes|)
              (|Record| (|:| |var| 23) (|:| |exponent| 122))
              (|Union| 287 '"failed") (1020 . |isExpt|)
              (|Record| (|:| |val| 6) (|:| |exponent| 122))
              (|Union| 290 '"failed") (1025 . |isPower|) (1030 . |denom|)
              (1035 . |denominator|) (|Fraction| 7) (1040 . |numer|)
              (1045 . |denom|) (1050 . /) (1056 . |coerce|) (|Fraction| 178)
              (1061 . |numer|) (1066 . |coerce|) (1071 . |denom|) (1076 . /)
              (1082 . |coerce|) (|Polynomial| 295) (|Fraction| 306)
              (1087 . |numer|) (1092 . |coerce|) (1097 . |denom|)
              (1102 . |coerce|) (1107 . |retract|) (1112 . |retract|)
              (1117 . /) (1123 . |retract|) (|Union| $ '"failed")
              (1128 . |exquo|) (1134 . |kernels|) (1139 . =) (1145 . |sort!|)
              (1150 . |algtower|) (1155 . |algtower|) (1160 . |algtower|)
              (1165 . |One|) (1169 . =) (1175 . /) (1181 . -) (1187 . ^)
              (1193 . |paren|) (|Factored| 6) (1198 . |unit|)
              (|Record| (|:| |factor| 6) (|:| |exponent| 122)) (|List| 332)
              (1203 . |factors|) (|Factored| $) (1208 . |convert|)
              (|Union| 300 '#1#) (1213 . |retractIfCan|)
              (1218 . |retractIfCan|) (1223 . |retractIfCan|) (1228 . |coerce|)
              (|Mapping| 6 295)
              (|PolynomialCategoryLifting| (|IndexedExponents| 12) 12 295 306
                                           6)
              (1233 . |map|) (1240 . |coerce|) (|Fraction| 122)
              (1245 . |numer|) (1250 . |coerce|) (1255 . |denom|)
              (1260 . |coerce|) (1265 . |exquo|) (1271 . /) (1277 . /)
              (|PositiveInteger|) (|Union| 346 '#1#) (|List| 173))
           '#(|variables| 1283 |univariate| 1293 |subst| 1299 |retractIfCan|
              1306 |retract| 1326 |operator| 1346 |numerator| 1351 |mainKernel|
              1356 |kernels| 1361 |isTimes| 1366 |isPower| 1371 |isPlus| 1376
              |isMult| 1381 |isExpt| 1386 |ground?| 1403 |ground| 1408 |eval|
              1413 |elt| 1492 |differentiate| 1498 |denominator| 1504 |convert|
              1509 |coerce| 1524 |characteristic| 1569 |belong?| 1573
              |applyQuote| 1578 |algtower| 1614 * 1624)
           'NIL
           (CONS (|makeByteWordVec2| 1 'NIL)
                 (CONS '#()
                       (CONS '#()
                             (|makeByteWordVec2| 353
                                                 '(1 13 11 12 14 1 6 17 0 18 1
                                                   6 7 0 21 1 23 0 12 24 1 6 0
                                                   25 26 1 6 25 0 28 1 23 29 0
                                                   30 2 6 0 12 32 33 1 6 0 12
                                                   38 2 6 0 11 32 39 2 11 19 0
                                                   12 41 2 11 19 0 12 42 1 23
                                                   11 0 44 1 23 45 0 46 2 6 0
                                                   11 32 47 1 11 12 0 48 1 12
                                                   49 0 50 1 45 6 0 52 1 45 6 0
                                                   53 3 6 0 0 25 0 54 1 12 55 0
                                                   56 1 55 0 32 57 1 6 55 0 58
                                                   2 6 0 0 59 60 2 0 0 0 12 61
                                                   4 6 0 0 62 32 12 63 4 0 0 0
                                                   11 0 12 64 2 66 65 6 12 67 3
                                                   6 0 0 62 69 70 4 0 0 0 62 32
                                                   12 71 3 11 0 0 12 72 73 1 6
                                                   74 32 75 1 6 59 32 77 1 6 79
                                                   0 80 0 7 83 84 0 0 83 85 1
                                                   86 0 23 87 1 6 0 88 89 1 0 0
                                                   25 90 0 12 0 91 1 6 88 0 92
                                                   1 0 0 0 93 1 45 6 0 94 4 6 0
                                                   0 59 95 97 98 4 0 0 0 12 83
                                                   68 99 4 0 0 0 12 83 96 100 2
                                                   95 0 83 83 101 3 0 0 0 59 97
                                                   102 1 11 19 0 103 1 86 7 0
                                                   104 0 7 0 105 2 7 19 0 0 106
                                                   1 6 0 0 107 2 6 0 11 0 108 2
                                                   109 0 11 32 110 2 0 0 11 32
                                                   111 4 0 0 0 59 95 69 112 1
                                                   86 113 0 114 2 86 115 0 23
                                                   116 2 120 117 118 119 121 2
                                                   59 122 12 0 123 1 59 122 0
                                                   124 2 117 6 0 6 125 0 6 0
                                                   126 2 128 127 0 122 129 2 95
                                                   83 0 122 130 0 117 0 131 2
                                                   117 19 0 0 132 1 117 83 0
                                                   133 2 6 0 0 83 134 1 117 6 0
                                                   135 2 6 0 0 0 136 2 6 0 0 0
                                                   137 1 117 0 0 138 1 6 139 0
                                                   140 2 23 19 0 11 141 2 142
                                                   122 139 0 143 3 142 139 0
                                                   122 139 144 1 12 139 0 145 0
                                                   6 0 146 1 45 122 0 147 1 122
                                                   139 0 148 2 139 0 0 0 149 2
                                                   45 122 6 0 150 2 139 0 0 0
                                                   151 2 139 0 0 83 152 2 11
                                                   153 0 12 154 2 139 0 0 32
                                                   155 1 45 0 0 156 2 45 6 0
                                                   122 157 3 45 6 0 122 6 158 2
                                                   122 19 0 0 159 2 160 19 122
                                                   0 161 2 45 0 0 83 162 2 45 0
                                                   0 83 163 2 45 0 0 0 164 1 45
                                                   122 0 165 2 6 0 0 12 166 2 6
                                                   19 0 0 167 1 169 168 11 170
                                                   2 171 0 6 6 172 2 6 0 0 173
                                                   174 2 6 0 11 0 175 2 83 19 0
                                                   0 176 2 6 19 0 0 177 1 178 0
                                                   7 179 2 178 0 0 12 180 1 178
                                                   7 0 181 2 86 0 182 0 183 1
                                                   86 184 0 185 2 86 0 0 23 186
                                                   1 6 0 7 187 3 190 6 188 189
                                                   178 191 1 0 0 178 192 2 194
                                                   193 12 12 195 2 23 19 0 0
                                                   196 1 86 17 0 197 1 7 139 0
                                                   198 0 194 19 199 1 23 139 0
                                                   200 2 117 139 0 139 201 3 6
                                                   0 0 74 32 202 4 204 6 184 45
                                                   23 203 205 3 206 6 203 189
                                                   86 207 3 6 0 0 74 32 208 2 6
                                                   0 68 25 209 1 6 74 0 210 2
                                                   184 0 0 0 211 1 184 19 0 212
                                                   1 6 0 0 213 1 6 12 0 214 2
                                                   59 19 12 0 215 1 216 6 55
                                                   217 1 178 0 12 218 3 221 178
                                                   219 220 86 222 1 6 224 0 225
                                                   2 0 224 0 11 226 2 23 19 0
                                                   12 227 2 0 224 0 12 228 1
                                                   119 83 0 229 1 119 0 0 230 1
                                                   119 86 0 231 1 86 19 0 232 1
                                                   7 233 0 234 2 169 11 11 127
                                                   235 2 11 19 0 0 236 2 160 19
                                                   0 0 237 2 45 19 0 0 238 1 0
                                                   79 0 239 1 0 74 0 240 1 86 7
                                                   0 241 1 0 7 0 242 1 0 178 0
                                                   243 1 0 17 0 244 1 0 245 0
                                                   246 3 0 0 0 74 32 247 3 0 0
                                                   0 74 32 248 2 0 0 0 12 249 1
                                                   0 139 0 250 2 0 0 0 59 251 1
                                                   0 0 0 252 4 0 0 0 59 95 97
                                                   253 1 86 254 0 255 1 0 254 0
                                                   256 1 86 254 0 257 1 0 254 0
                                                   258 1 86 260 0 261 1 0 224 0
                                                   262 1 0 264 0 265 1 86 266 0
                                                   267 1 0 266 0 268 1 86 269 0
                                                   270 1 0 269 0 271 1 0 273 0
                                                   274 1 86 0 7 275 2 0 0 7 0
                                                   276 1 277 113 6 278 1 277
                                                   184 6 279 2 277 280 6 23 281
                                                   2 0 282 0 25 283 1 277 284 6
                                                   285 1 277 284 6 286 1 277
                                                   288 6 289 1 277 291 6 292 1
                                                   6 88 0 293 1 0 0 0 294 1 295
                                                   7 0 296 1 295 7 0 297 2 6 0
                                                   88 88 298 1 0 0 295 299 1
                                                   300 178 0 301 1 6 0 178 302
                                                   1 300 178 0 303 2 6 0 0 0
                                                   304 1 0 0 300 305 1 307 306
                                                   0 308 1 6 0 306 309 1 307
                                                   306 0 310 1 0 0 307 311 1 6
                                                   300 0 312 1 300 178 0 313 2
                                                   300 0 178 178 314 1 0 300 0
                                                   315 2 7 316 0 0 317 1 6 74 0
                                                   318 2 23 19 0 0 319 1 184 0
                                                   0 320 1 0 74 32 321 1 6 74
                                                   32 322 1 0 74 0 323 0 86 0
                                                   324 2 86 19 0 0 325 2 139 0
                                                   0 0 326 2 6 0 0 0 327 2 6 0
                                                   0 122 328 1 6 0 0 329 1 330
                                                   6 0 331 1 330 333 0 334 1 0
                                                   0 335 336 1 6 337 0 338 1
                                                   300 245 0 339 1 0 337 0 340
                                                   1 6 0 295 341 3 343 6 188
                                                   342 306 344 1 0 0 306 345 1
                                                   346 122 0 347 1 86 0 122 348
                                                   1 346 122 0 349 1 0 0 346
                                                   350 2 122 316 0 0 351 2 266
                                                   0 0 0 352 2 269 0 0 0 353 1
                                                   0 59 32 76 1 0 59 0 78 2 0
                                                   282 0 25 283 3 0 0 0 74 32
                                                   248 1 0 245 0 246 1 0 337 0
                                                   340 1 0 17 0 244 1 0 29 0 81
                                                   1 0 178 0 243 1 0 300 0 315
                                                   1 0 7 0 242 1 0 12 0 31 1 0
                                                   11 11 51 1 0 0 0 93 1 0 79 0
                                                   239 1 0 74 0 240 1 0 254 0
                                                   258 1 0 264 0 265 1 0 254 0
                                                   256 1 0 273 0 274 2 0 224 0
                                                   12 228 2 0 224 0 11 226 1 0
                                                   224 0 262 1 0 19 0 20 1 0 7
                                                   0 22 4 0 0 0 12 83 96 100 4
                                                   0 0 0 12 83 68 99 4 0 0 0 59
                                                   95 69 112 4 0 0 0 59 95 97
                                                   253 4 0 0 0 62 32 12 71 1 0
                                                   0 0 252 4 0 0 0 11 0 12 64 2
                                                   0 0 0 12 61 2 0 0 0 59 251 3
                                                   0 0 0 59 97 102 3 0 0 0 74
                                                   32 247 2 0 0 11 32 111 2 0 0
                                                   0 12 249 1 0 0 0 294 1 0 0
                                                   335 336 1 0 269 0 271 1 0
                                                   266 0 268 1 0 0 178 192 1 0
                                                   0 346 350 1 0 0 300 305 1 0
                                                   0 307 311 1 0 0 295 299 1 0
                                                   0 306 345 1 0 0 12 27 1 0
                                                   139 0 250 1 0 0 25 90 0 0 83
                                                   85 1 0 19 11 43 5 0 0 12 0 0
                                                   0 0 37 2 0 0 12 32 40 4 0 0
                                                   12 0 0 0 36 2 0 0 12 0 34 3
                                                   0 0 12 0 0 35 1 0 74 32 321
                                                   1 0 74 0 323 2 0 0 7 0
                                                   276)))))
           '|lookupComplete|)) 
