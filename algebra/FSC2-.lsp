
(SDEFUN |FSC2-;ground?;SB;1| ((|x| (S)) (% (|Boolean|)))
        (QEQCAR (SPADCALL |x| (QREFELT % 19)) 0)) 

(SDEFUN |FSC2-;ground;SR;2| ((|x| (S)) (% (R))) (SPADCALL |x| (QREFELT % 22))) 

(SDEFUN |FSC2-;coerce;SS;3| ((|x| (|Symbol|)) (% (S)))
        (SPADCALL (SPADCALL |x| (QREFELT % 24)) (QREFELT % 25))) 

(SDEFUN |FSC2-;retract;SS;4| ((|x| (S)) (% (|Symbol|)))
        (SPROG ((#1=#:G59 NIL))
               (PROG2
                   (LETT #1#
                         (SPADCALL (SPADCALL |x| (QREFELT % 27))
                                   (QREFELT % 29)))
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 0) (|Symbol|)
                                 (|Union| (|Symbol|) "failed") #1#)))) 

(SDEFUN |FSC2-;applyQuote;S2S;5| ((|s| (|Symbol|)) (|x| (S)) (% (S)))
        (SPADCALL |s| (LIST |x|) (QREFELT % 32))) 

(SDEFUN |FSC2-;applyQuote;S3S;6| ((|s| (|Symbol|)) (|x| (S)) (|y| (S)) (% (S)))
        (SPADCALL |s| (LIST |x| |y|) (QREFELT % 32))) 

(SDEFUN |FSC2-;applyQuote;S4S;7|
        ((|s| (|Symbol|)) (|x| (S)) (|y| (S)) (|z| (S)) (% (S)))
        (SPADCALL |s| (LIST |x| |y| |z|) (QREFELT % 32))) 

(SDEFUN |FSC2-;applyQuote;S5S;8|
        ((|s| (|Symbol|)) (|x| (S)) (|y| (S)) (|z| (S)) (|t| (S)) (% (S)))
        (SPADCALL |s| (LIST |x| |y| |z| |t|) (QREFELT % 32))) 

(SDEFUN |FSC2-;applyQuote;SLS;9| ((|s| (|Symbol|)) (|l| (|List| S)) (% (S)))
        (SPADCALL (QREFELT % 17) (CONS (SPADCALL |s| (QREFELT % 37)) |l|)
                  (QREFELT % 38))) 

(SDEFUN |FSC2-;belong?;BoB;10| ((|op| (|BasicOperator|)) (% (|Boolean|)))
        (COND
         ((SPADCALL |op| '|any| (QREFELT % 40))
          (COND ((SPADCALL |op| '|%diff| (QREFELT % 41)) 'T)
                (#1='T (SPADCALL |op| '|%quote| (QREFELT % 41)))))
         (#1# NIL))) 

(SDEFUN |FSC2-;subs| ((|fn| (|Mapping| S S)) (|k| (K)) (% (S)))
        (SPROG ((#1=#:G74 NIL) (|x| NIL) (#2=#:G73 NIL))
               (SEQ
                (SPADCALL (SPADCALL |k| (QREFELT % 43))
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |x| NIL)
                                (LETT #1# (SPADCALL |k| (QREFELT % 45))) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |x| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2# (CONS (SPADCALL |x| |fn|) #2#))))
                                (LETT #1# (CDR #1#)) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT % 46))))) 

(SDEFUN |FSC2-;operator;2Bo;12|
        ((|op| (|BasicOperator|)) (% (|BasicOperator|)))
        (COND ((SPADCALL |op| '|%diff| (QREFELT % 41)) (QREFELT % 16))
              ((SPADCALL |op| '|%quote| (QREFELT % 41)) (QREFELT % 17))
              ('T
               (|error|
                (STRCONC "Unknown operator 4: "
                         (SPADCALL (SPADCALL |op| (QREFELT % 47))
                                   (QREFELT % 49))))))) 

(SDEFUN |FSC2-;pint| ((|l| (|List| (|InputForm|))) (% (|InputForm|)))
        (SPADCALL (CONS (SPADCALL 'D (QREFELT % 52)) |l|) (QREFELT % 53))) 

(SDEFUN |FSC2-;indiff| ((|l| (|List| S)) (% (|InputForm|)))
        (SPROG
         ((|d1| (|InputForm|)) (|si| (|InputForm|)) (|do_eval| (|Boolean|))
          (|ne| (S)) (|s| (|Symbol|)) (|ne1| (S))
          (|su| (|Union| (|Symbol|) "failed")) (|a3| (S)))
         (SEQ (LETT |a3| (SPADCALL |l| (QREFELT % 54))) (LETT |do_eval| NIL)
              (LETT |s|
                    (SEQ (LETT |su| (SPADCALL |a3| (QREFELT % 55)))
                         (EXIT
                          (COND ((QEQCAR |su| 0) (QCDR |su|))
                                (#1='T
                                 (SEQ (LETT |do_eval| 'T)
                                      (EXIT (SPADCALL (QREFELT % 56)))))))))
              (LETT |ne|
                    (SPADCALL (|SPADfirst| |l|)
                              (SPADCALL (SPADCALL |l| (QREFELT % 57))
                                        (QREFELT % 27))
                              (COND (|do_eval| (SPADCALL |s| (QREFELT % 37)))
                                    (#1# |a3|))
                              (QREFELT % 58)))
              (COND
               ((NULL |do_eval|)
                (SEQ
                 (LETT |ne1|
                       (SPADCALL |ne| (SPADCALL |a3| (QREFELT % 27))
                                 (SPADCALL |l| (QREFELT % 57)) (QREFELT % 58)))
                 (EXIT
                  (COND
                   ((NULL (SPADCALL (|SPADfirst| |l|) |ne1| (QREFELT % 59)))
                    (SEQ (LETT |s| (SPADCALL (QREFELT % 56)))
                         (LETT |ne|
                               (SPADCALL (|SPADfirst| |l|)
                                         (SPADCALL
                                          (SPADCALL |l| (QREFELT % 57))
                                          (QREFELT % 27))
                                         (SPADCALL |s| (QREFELT % 37))
                                         (QREFELT % 58)))
                         (EXIT (LETT |do_eval| 'T)))))))))
              (LETT |si|
                    (SPADCALL
                     (LIST (SPADCALL '|::| (QREFELT % 52))
                           (SPADCALL |s| (QREFELT % 52))
                           (SPADCALL '|Symbol| (QREFELT % 52)))
                     (QREFELT % 53)))
              (LETT |d1|
                    (|FSC2-;pint| (LIST (SPADCALL |ne| (QREFELT % 60)) |si|)
                     %))
              (EXIT
               (COND
                (|do_eval|
                 (SPADCALL
                  (LIST (SPADCALL '|eval| (QREFELT % 52)) |d1| |si|
                        (SPADCALL (SPADCALL |l| (QREFELT % 54))
                                  (QREFELT % 60)))
                  (QREFELT % 53)))
                (#1# |d1|)))))) 

(SDEFUN |FSC2-;eval;SBoSSS;15|
        ((|f| (S)) (|s| (|BasicOperator|)) (|g| (S)) (|x| (|Symbol|)) (% (S)))
        (SPADCALL |f| (LIST |s|) (LIST |g|) |x| (QREFELT % 62))) 

(SDEFUN |FSC2-;eval;SLLSS;16|
        ((|f| (S)) (|ls| (|List| (|BasicOperator|))) (|lg| (|List| S))
         (|x| (|Symbol|)) (% (S)))
        (SPROG ((#1=#:G94 NIL) (|g| NIL) (#2=#:G93 NIL))
               (SEQ
                (SPADCALL |f| |ls|
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |g| NIL) (LETT #1# |lg|) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |g| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS (SPADCALL |g| |x| (QREFELT % 66))
                                              #2#))))
                                (LETT #1# (CDR #1#)) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT % 69))))) 

(SDEFUN |FSC2-;variables;LL;17| ((|lx| (|List| S)) (% (|List| (|Symbol|))))
        (SPROG
         ((|l| (|List| (|Symbol|))) (|s| (|Union| (|Symbol|) "failed"))
          (#1=#:G105 NIL) (|k| NIL))
         (SEQ (LETT |l| NIL)
              (SEQ (LETT |k| NIL) (LETT #1# (SPADCALL |lx| (QREFELT % 74)))
                   G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |s| (SPADCALL |k| (QREFELT % 29)))
                        (EXIT
                         (COND
                          ((QEQCAR |s| 0) (LETT |l| (CONS (QCDR |s|) |l|))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (NREVERSE |l|))))) 

(SDEFUN |FSC2-;variables;SL;18| ((|x| (S)) (% (|List| (|Symbol|))))
        (SPADCALL (LIST |x|) (QREFELT % 77))) 

(SDEFUN |FSC2-;retractIfCan;SU;19|
        ((|x| (S)) (% (|Union| (|Symbol|) "failed")))
        (SPROG ((|k| (|Union| K "failed")))
               (SEQ (LETT |k| (SPADCALL |x| (QREFELT % 80)))
                    (EXIT
                     (COND ((QEQCAR |k| 1) (CONS 1 "failed"))
                           ('T (SPADCALL (QCDR |k|) (QREFELT % 29)))))))) 

(SDEFUN |FSC2-;characteristic;Nni;20| ((% (|NonNegativeInteger|)))
        (SPADCALL (QREFELT % 84))) 

(SDEFUN |FSC2-;coerce;KS;21| ((|k| (K)) (% (S)))
        (SPADCALL (SPADCALL |k| (QREFELT % 87)) (QREFELT % 88))) 

(SDEFUN |FSC2-;symsub| ((|sy| (|Symbol|)) (|i| (|Integer|)) (% (|Symbol|)))
        (SPADCALL (QREFELT % 56))) 

(SDEFUN |FSC2-;numerator;2S;23| ((|x| (S)) (% (S)))
        (SPADCALL (SPADCALL |x| (QREFELT % 90)) (QREFELT % 88))) 

(SDEFUN |FSC2-;eval;SSNniMS;24|
        ((|x| (S)) (|s| (|Symbol|)) (|n| (|NonNegativeInteger|))
         (|f| (|Mapping| S S)) (% (S)))
        (SPROG NIL
               (SPADCALL |x| (LIST |s|) (LIST |n|)
                         (LIST
                          (CONS #'|FSC2-;eval;SSNniMS;24!0| (VECTOR |f| %)))
                         (QREFELT % 96)))) 

(SDEFUN |FSC2-;eval;SSNniMS;24!0| ((|y| NIL) ($$ NIL))
        (PROG (% |f|)
          (LETT % (QREFELT $$ 1))
          (LETT |f| (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL (SPADCALL |y| (QREFELT % 92)) |f|))))) 

(SDEFUN |FSC2-;eval;SSNniMS;25|
        ((|x| (S)) (|s| (|Symbol|)) (|n| (|NonNegativeInteger|))
         (|f| (|Mapping| S (|List| S))) (% (S)))
        (SPADCALL |x| (LIST |s|) (LIST |n|) (LIST |f|) (QREFELT % 96))) 

(SDEFUN |FSC2-;eval;SLLS;26|
        ((|x| (S)) (|l| (|List| (|Symbol|)))
         (|f| (|List| (|Mapping| S (|List| S)))) (% (S)))
        (SPADCALL |x| |l| (SPADCALL (LENGTH |l|) 1 (QREFELT % 99)) |f|
                  (QREFELT % 96))) 

(SDEFUN |FSC2-;elt;BoLS;27|
        ((|op| (|BasicOperator|)) (|args| (|List| S)) (% (S)))
        (SPROG ((#1=#:G150 NIL) (|x| (S)) (|od?| (|Boolean|)))
               (SEQ
                (EXIT
                 (SEQ
                  (COND
                   ((SPADCALL |op| (QREFELT % 101))
                    (SEQ
                     (LETT |od?| (SPADCALL |op| (QREFELT % 9) (QREFELT % 40)))
                     (EXIT
                      (COND
                       ((OR |od?|
                            (SPADCALL |op| (QREFELT % 10) (QREFELT % 40)))
                        (COND
                         ((SPADCALL
                           (SPADCALL
                            (SPADCALL (|SPADfirst| |args|) (QREFELT % 90))
                            (QREFELT % 102))
                           (|spadConstant| % 103) (QREFELT % 104))
                          (PROGN
                           (LETT #1#
                                 (SEQ
                                  (LETT |x|
                                        (SPADCALL |op|
                                                  (SPADCALL
                                                   (|SPADfirst| |args|)
                                                   (QREFELT % 105))
                                                  (QREFELT % 106)))
                                  (EXIT
                                   (COND (|od?| (SPADCALL |x| (QREFELT % 105)))
                                         ('T |x|)))))
                           (GO #2=#:G148))))))))))
                  (EXIT (SPADCALL |op| |args| (QREFELT % 108)))))
                #2# (EXIT #1#)))) 

(SDEFUN |FSC2-;eval;SLLLS;28|
        ((|x| (S)) (|s| (|List| (|Symbol|)))
         (|n| (|List| (|NonNegativeInteger|))) (|l| (|List| (|Mapping| S S)))
         (% (S)))
        (SPROG ((#1=#:G156 NIL) (|f| NIL) (#2=#:G155 NIL))
               (SEQ
                (SPADCALL |x| |s| |n|
                          (PROGN
                           (LETT #2# NIL)
                           (SEQ (LETT |f| NIL) (LETT #1# |l|) G190
                                (COND
                                 ((OR (ATOM #1#)
                                      (PROGN (LETT |f| (CAR #1#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (EXIT
                                  (LETT #2#
                                        (CONS
                                         (CONS #'|FSC2-;eval;SLLLS;28!0|
                                               (VECTOR |f| %))
                                         #2#))))
                                (LETT #1# (CDR #1#)) (GO G190) G191
                                (EXIT (NREVERSE #2#))))
                          (QREFELT % 96))))) 

(SDEFUN |FSC2-;eval;SLLLS;28!0| ((|y| NIL) ($$ NIL))
        (PROG (% |f|)
          (LETT % (QREFELT $$ 1))
          (LETT |f| (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL (SPADCALL |y| (QREFELT % 92)) |f|))))) 

(SDEFUN |FSC2-;smprep|
        ((|lop| (|List| (|Symbol|))) (|lexp| (|List| (|NonNegativeInteger|)))
         (|lfunc| (|List| (|Mapping| S (|List| S))))
         (|p| (|SparseMultivariatePolynomial| R K)) (% (S)))
        (SPROG
         ((|q| (|SparseUnivariatePolynomial| S)) (|a| (S)) (|t2| (S))
          (|t1| (S))
          (|qr|
           (|Record| (|:| |quotient| (|NonNegativeInteger|))
                     (|:| |remainder| (|NonNegativeInteger|))))
          (|m| (|NonNegativeInteger|)) (|e| (|NonNegativeInteger|)) (|f| (S))
          (|n| (|Integer|)) (|g| (S)) (|arg| (|List| S)) (#1=#:G193 NIL)
          (#2=#:G192 NIL) (|op| (|BasicOperator|)) (|k| (K))
          (|v| (|Union| K "failed")))
         (SEQ (LETT |v| (SPADCALL |p| (QREFELT % 111)))
              (EXIT
               (COND ((QEQCAR |v| 1) (SPADCALL |p| (QREFELT % 88)))
                     (#3='T
                      (SEQ (LETT |k| (QCDR |v|))
                           (LETT |g|
                                 (SPADCALL
                                  (LETT |op| (SPADCALL |k| (QREFELT % 43)))
                                  (LETT |arg|
                                        (PROGN
                                         (LETT #2# NIL)
                                         (SEQ
                                          (LETT #1#
                                                (SPADCALL |k| (QREFELT % 45)))
                                          G190
                                          (COND
                                           ((OR (ATOM #1#)
                                                (PROGN
                                                 (LETT |a| (CAR #1#))
                                                 NIL))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (LETT #2#
                                                  (CONS
                                                   (SPADCALL |a| |lop| |lexp|
                                                             |lfunc|
                                                             (QREFELT % 96))
                                                   #2#))))
                                          (LETT #1# (CDR #1#)) (GO G190) G191
                                          (EXIT (NREVERSE #2#)))))
                                  (QREFELT % 38)))
                           (LETT |q|
                                 (SPADCALL
                                  (CONS #'|FSC2-;smprep!0|
                                        (VECTOR |lfunc| |lexp| |lop| %))
                                  (SPADCALL |p| |k| (QREFELT % 113))
                                  (QREFELT % 118)))
                           (EXIT
                            (COND
                             ((<
                               (LETT |n|
                                     (SPADCALL (SPADCALL |op| (QREFELT % 47))
                                               |lop| (QREFELT % 120)))
                               (PROGN |lop| 1))
                              (SPADCALL |q| |g| (QREFELT % 121)))
                             (#3#
                              (SEQ (LETT |a| (|spadConstant| % 122))
                                   (LETT |f|
                                         (SPADCALL
                                          (SPADCALL |arg|
                                                    (SPADCALL |lfunc| |n|
                                                              (QREFELT % 125)))
                                          |lop| |lexp| |lfunc| (QREFELT % 96)))
                                   (LETT |e|
                                         (SPADCALL |lexp| |n| (QREFELT % 126)))
                                   (SEQ G190
                                        (COND
                                         ((NULL
                                           (SPADCALL |q| (|spadConstant| % 127)
                                                     (QREFELT % 128)))
                                          (GO G191)))
                                        (SEQ
                                         (LETT |m|
                                               (SPADCALL |q| (QREFELT % 129)))
                                         (LETT |qr| (DIVIDE2 |m| |e|))
                                         (LETT |t1|
                                               (SPADCALL |f| (QCAR |qr|)
                                                         (QREFELT % 130)))
                                         (LETT |t2|
                                               (SPADCALL |g| (QCDR |qr|)
                                                         (QREFELT % 130)))
                                         (LETT |a|
                                               (SPADCALL |a|
                                                         (SPADCALL
                                                          (SPADCALL
                                                           (SPADCALL |q|
                                                                     (QREFELT %
                                                                              131))
                                                           |t1|
                                                           (QREFELT % 132))
                                                          |t2| (QREFELT % 132))
                                                         (QREFELT % 133)))
                                         (EXIT
                                          (LETT |q|
                                                (SPADCALL |q|
                                                          (QREFELT % 134)))))
                                        NIL (GO G190) G191 (EXIT NIL))
                                   (EXIT |a|)))))))))))) 

(SDEFUN |FSC2-;smprep!0| ((|y| NIL) ($$ NIL))
        (PROG (% |lop| |lexp| |lfunc|)
          (LETT % (QREFELT $$ 3))
          (LETT |lop| (QREFELT $$ 2))
          (LETT |lexp| (QREFELT $$ 1))
          (LETT |lfunc| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL (SPADCALL |y| (QREFELT % 88)) |lop| |lexp| |lfunc|
                      (QREFELT % 96)))))) 

(SDEFUN |FSC2-;dispdiff|
        ((|l| (|List| S))
         (%
          (|Record| (|:| |name| (|OutputForm|)) (|:| |sub| (|OutputForm|))
                    (|:| |arg| (|List| (|OutputForm|)))
                    (|:| |orig_op| (|BasicOperator|))
                    (|:| |level| (|NonNegativeInteger|)))))
        (SPROG
         ((|d_name| (|OutputForm|)) (|dnu| (|Union| (|None|) "failed"))
          (|m| (|List| (|OutputForm|))) (#1=#:G211 NIL) (|x| NIL)
          (#2=#:G210 NIL) (|i| (|Integer|))
          (|rec|
           (|Record| (|:| |name| (|OutputForm|)) (|:| |sub| (|OutputForm|))
                     (|:| |arg| (|List| (|OutputForm|)))
                     (|:| |orig_op| (|BasicOperator|))
                     (|:| |level| (|NonNegativeInteger|))))
          (|a| (|List| S)) (|k| (K)) (|t| (|OutputForm|)) (|s| (|OutputForm|)))
         (SEQ
          (LETT |s| (SPADCALL (SPADCALL |l| (QREFELT % 57)) (QREFELT % 136)))
          (LETT |t| (SPADCALL (SPADCALL |l| (QREFELT % 54)) (QREFELT % 136)))
          (LETT |a|
                (SPADCALL
                 (LETT |k| (SPADCALL (|SPADfirst| |l|) (QREFELT % 27)))
                 (QREFELT % 45)))
          (EXIT
           (COND
            ((SPADCALL |k| (QREFELT % 16) (QREFELT % 137))
             (SEQ (LETT |rec| (|FSC2-;dispdiff| |a| %))
                  (LETT |i| (SPADCALL |s| (QVELT |rec| 2) (QREFELT % 139)))
                  (SPADCALL (QVELT |rec| 2) |i| |t| (QREFELT % 140))
                  (EXIT
                   (VECTOR (QVELT |rec| 0)
                           (SPADCALL (QVELT |rec| 1)
                                     (SPADCALL (SPADCALL '|,| (QREFELT % 141))
                                               (SPADCALL
                                                (- (+ |i| 1) (PROGN |a| 1))
                                                (QREFELT % 143))
                                               (QREFELT % 144))
                                     (QREFELT % 144))
                           (QVELT |rec| 2) (QVELT |rec| 3)
                           (COND ((ZEROP (QVELT |rec| 4)) 0)
                                 (#3='T (+ (QVELT |rec| 4) 1)))))))
            (#3#
             (SEQ
              (LETT |i|
                    (SPADCALL (SPADCALL |l| (QREFELT % 57)) |a|
                              (QREFELT % 145)))
              (LETT |m|
                    (PROGN
                     (LETT #2# NIL)
                     (SEQ (LETT |x| NIL) (LETT #1# |a|) G190
                          (COND
                           ((OR (ATOM #1#) (PROGN (LETT |x| (CAR #1#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #2#
                                  (CONS (SPADCALL |x| (QREFELT % 136)) #2#))))
                          (LETT #1# (CDR #1#)) (GO G190) G191
                          (EXIT (NREVERSE #2#)))))
              (SPADCALL |m| |i| |t| (QREFELT % 140))
              (LETT |d_name|
                    (SEQ
                     (LETT |dnu|
                           (SPADCALL (SPADCALL |k| (QREFELT % 43)) '|disp_name|
                                     (QREFELT % 147)))
                     (EXIT
                      (COND ((QEQCAR |dnu| 0) (QCDR |dnu|))
                            (#3#
                             (SPADCALL
                              (SPADCALL (SPADCALL |k| (QREFELT % 43))
                                        (QREFELT % 47))
                              (QREFELT % 141)))))))
              (EXIT
               (VECTOR |d_name|
                       (SPADCALL (SPADCALL '|,| (QREFELT % 141))
                                 (SPADCALL (- (+ |i| 1) (PROGN |a| 1))
                                           (QREFELT % 143))
                                 (QREFELT % 144))
                       |m| (SPADCALL |k| (QREFELT % 43))
                       (COND ((NULL (CDR |a|)) 1) (#3# 0))))))))))) 

(SDEFUN |FSC2-;ddiff| ((|l| (|List| S)) (% (|OutputForm|)))
        (SPROG
         ((|f| (|Union| (|None|) "failed")) (|opname| (|OutputForm|))
          (|rec|
           (|Record| (|:| |name| (|OutputForm|)) (|:| |sub| (|OutputForm|))
                     (|:| |arg| (|List| (|OutputForm|)))
                     (|:| |orig_op| (|BasicOperator|))
                     (|:| |level| (|NonNegativeInteger|)))))
         (SEQ (LETT |rec| (|FSC2-;dispdiff| |l| %))
              (LETT |opname|
                    (COND
                     ((ZEROP (QVELT |rec| 4))
                      (SPADCALL (QVELT |rec| 0) (QVELT |rec| 1)
                                (QREFELT % 148)))
                     (#1='T
                      (SPADCALL (QVELT |rec| 0) (QVELT |rec| 4)
                                (QREFELT % 149)))))
              (LETT |f|
                    (SPADCALL (QVELT |rec| 3) '|%diffDisp| (QREFELT % 147)))
              (EXIT
               (COND
                ((QEQCAR |f| 0)
                 (SPADCALL (CONS |opname| (QVELT |rec| 2)) (QCDR |f|)))
                (#1# (SPADCALL |opname| (QVELT |rec| 2) (QREFELT % 150)))))))) 

(SDEFUN |FSC2-;encode_diff|
        ((|ker| (K)) (|nsub| (|List| (|Integer|))) (|args| (|List| S))
         (|nd| (|List| S)) (% (S)))
        (SPROG
         ((|res| (S)) (#1=#:G241 NIL) (|kk| NIL) (#2=#:G237 NIL)
          (#3=#:G238 NIL) (#4=#:G239 NIL) (|pt| NIL) (#5=#:G240 NIL) (|dm| NIL)
          (|pts| (|List| S)) (#6=#:G235 NIL) (#7=#:G236 NIL)
          (|nargs| (|List| S)) (|li| (|List| (|Integer|)))
          (|lk| (|List| (|Integer|))) (|k| (|Integer|)) (|i| #8=(|Integer|))
          (|ii| #8#))
         (SEQ (LETT |li| NIL) (LETT |lk| NIL) (LETT |i| (|SPADfirst| |nsub|))
              (LETT |k| 1) (LETT |nsub| (CDR |nsub|))
              (SEQ G190 (COND ((NULL (NULL (NULL |nsub|))) (GO G191)))
                   (SEQ (LETT |ii| (|SPADfirst| |nsub|))
                        (LETT |nsub| (CDR |nsub|))
                        (EXIT
                         (COND ((EQL |ii| |i|) (LETT |k| (+ |k| 1)))
                               ('T
                                (SEQ (LETT |lk| (CONS |k| |lk|))
                                     (LETT |li| (CONS |i| |li|))
                                     (LETT |i| |ii|) (EXIT (LETT |k| 1)))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |lk| (CONS |k| |lk|)) (LETT |li| (CONS |i| |li|))
              (LETT |nargs| (SPADCALL |args| (QREFELT % 151))) (LETT |pts| NIL)
              (SEQ (LETT |dm| NIL) (LETT #7# |nd|) (LETT #6# (REVERSE |li|))
                   G190
                   (COND
                    ((OR (ATOM #6#) (PROGN (LETT |i| (CAR #6#)) NIL) (ATOM #7#)
                         (PROGN (LETT |dm| (CAR #7#)) NIL))
                     (GO G191)))
                   (SEQ
                    (LETT |pts|
                          (CONS (SPADCALL |nargs| |i| (QREFELT % 152)) |pts|))
                    (EXIT (SPADCALL |nargs| |i| |dm| (QREFELT % 153))))
                   (LETT #6# (PROG1 (CDR #6#) (LETT #7# (CDR #7#)))) (GO G190)
                   G191 (EXIT NIL))
              (LETT |res|
                    (SPADCALL (SPADCALL |ker| (QREFELT % 43)) |nargs|
                              (QREFELT % 46)))
              (SEQ (LETT |dm| NIL) (LETT #5# (REVERSE |nd|)) (LETT |pt| NIL)
                   (LETT #4# |pts|) (LETT #3# |lk|) (LETT #2# |li|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |i| (CAR #2#)) NIL) (ATOM #3#)
                         (PROGN (LETT |k| (CAR #3#)) NIL) (ATOM #4#)
                         (PROGN (LETT |pt| (CAR #4#)) NIL) (ATOM #5#)
                         (PROGN (LETT |dm| (CAR #5#)) NIL))
                     (GO G191)))
                   (SEQ
                    (SEQ (LETT |kk| 2) (LETT #1# |k|) G190
                         (COND ((|greater_SI| |kk| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |res|
                                 (SPADCALL (QREFELT % 16)
                                           (LIST |res| |dm| |dm|)
                                           (QREFELT % 46)))))
                         (LETT |kk| (|inc_SI| |kk|)) (GO G190) G191 (EXIT NIL))
                    (EXIT
                     (LETT |res|
                           (SPADCALL (QREFELT % 16) (LIST |res| |dm| |pt|)
                                     (QREFELT % 46)))))
                   (LETT #2#
                         (PROG1 (CDR #2#)
                           (LETT #3#
                                 (PROG1 (CDR #3#)
                                   (LETT #4#
                                         (PROG1 (CDR #4#)
                                           (LETT #5# (CDR #5#))))))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |FSC2-;insert_sub|
        ((|lsub| (|List| (|Integer|))) (|j| (|Integer|))
         (% (|List| (|Integer|))))
        (SPROG
         ((|nsub| (|List| (|Integer|))) (|to_insert| (|Boolean|))
          (#1=#:G248 NIL) (|i| NIL))
         (SEQ (LETT |nsub| NIL) (LETT |to_insert| 'T)
              (SEQ (LETT |i| NIL) (LETT #1# |lsub|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |i| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (COND
                     (|to_insert|
                      (COND
                       ((NULL (> |i| |j|))
                        (SEQ (LETT |nsub| (CONS |j| |nsub|))
                             (EXIT (LETT |to_insert| NIL)))))))
                    (EXIT (LETT |nsub| (CONS |i| |nsub|))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (COND (|to_insert| (LETT |nsub| (CONS |j| |nsub|))))
              (EXIT (NREVERSE |nsub|))))) 

(SDEFUN |FSC2-;pos_diff|
        ((|l| (|List| S))
         (|r1|
          (|Record| (|:| |orig_k| K) (|:| |sub| (|List| (|Integer|)))
                    (|:| |oarg| (|List| S)) (|:| |arg| (|List| S))
                    (|:| |dummies| #1=(|List| S))))
         (|i| (|Integer|)) (% (S)))
        (SPROG
         ((|nd| #1#) (|dm| (S)) (|nd2| (|List| S)) (|nd1| (|List| S))
          (|k| (|NonNegativeInteger|)) (#2=#:G256 NIL) (#3=#:G257 NIL)
          (|j| NIL) (|ii| (|Integer|)) (|nsub| (|List| (|Integer|))))
         (SEQ (LETT |nsub| (|FSC2-;insert_sub| (QVELT |r1| 1) |i| %))
              (LETT |nd| (QVELT |r1| 4))
              (COND
               ((NULL (SPADCALL |i| (QVELT |r1| 1) (QREFELT % 155)))
                (SEQ (LETT |k| 0) (LETT |ii| (|SPADfirst| |nsub|))
                     (SEQ
                      (EXIT
                       (SEQ (LETT |j| NIL) (LETT #3# |nsub|) G190
                            (COND
                             ((OR (ATOM #3#) (PROGN (LETT |j| (CAR #3#)) NIL))
                              (GO G191)))
                            (SEQ
                             (EXIT
                              (COND
                               ((EQL |i| |j|)
                                (PROGN (LETT #2# |$NoValue|) (GO #4=#:G251)))
                               ((NULL (EQL |ii| |j|)) (LETT |k| (+ |k| 1))))))
                            (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL)))
                      #4# (EXIT #2#))
                     (LETT |nd1| (SPADCALL |nd| |k| (QREFELT % 156)))
                     (LETT |nd2| (SPADCALL |nd| |k| (QREFELT % 157)))
                     (LETT |dm|
                           (SPADCALL (SPADCALL (QREFELT % 56)) (QREFELT % 37)))
                     (EXIT
                      (LETT |nd|
                            (SPADCALL |nd1| (CONS |dm| |nd2|)
                                      (QREFELT % 158)))))))
              (EXIT
               (|FSC2-;encode_diff| (QVELT |r1| 0) |nsub| (QVELT |r1| 3) |nd|
                %))))) 

(SDEFUN |FSC2-;diffdiff| ((|l| (|List| S)) (|x| (|Symbol|)) (% (S)))
        (SPROG
         ((|res| (S)) (#1=#:G264 NIL) (|db| (S)) (#2=#:G265 NIL) (|i| NIL)
          (#3=#:G266 NIL) (|b| NIL) (|args| #4=(|List| S))
          (|r1|
           (|Record| (|:| |orig_k| K) (|:| |sub| (|List| (|Integer|)))
                     (|:| |oarg| (|List| S)) (|:| |arg| #4#)
                     (|:| |dummies| (|List| S)))))
         (SEQ (LETT |r1| (|FSC2-;decode_diff| |l| %))
              (LETT |args| (QVELT |r1| 3)) (LETT |res| (|spadConstant| % 122))
              (SEQ (LETT |b| NIL) (LETT #3# |args|) (LETT |i| (PROGN |args| 1))
                   (LETT #2# (LENGTH |args|)) G190
                   (COND
                    ((OR (> |i| #2#) (ATOM #3#)
                         (PROGN (LETT |b| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |db| (SPADCALL |b| |x| (QREFELT % 159)))
                          (EXIT
                           (COND
                            ((SPADCALL |db| (|spadConstant| % 122)
                                       (QREFELT % 59))
                             (PROGN (LETT #1# |$NoValue|) (GO #5=#:G259)))
                            ('T
                             (LETT |res|
                                   (SPADCALL |res|
                                             (SPADCALL |db|
                                                       (|FSC2-;pos_diff| |l|
                                                        |r1| |i| %)
                                                       (QREFELT % 132))
                                             (QREFELT % 133))))))))
                    #5# (EXIT #1#))
                   (LETT |i| (PROG1 (+ |i| 1) (LETT #3# (CDR #3#)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |FSC2-;dfeval| ((|l| (|List| S)) (|g| (K)) (% (S)))
        (SPROG ((#1=#:G268 NIL))
               (SPADCALL
                (SPADCALL (|SPADfirst| |l|)
                          (PROG2 (LETT #1# (SPADCALL |g| (QREFELT % 29)))
                              (QCDR #1#)
                            (|check_union2| (QEQCAR #1# 0) (|Symbol|)
                                            (|Union| (|Symbol|) "failed") #1#))
                          (QREFELT % 159))
                |g| (SPADCALL |l| (QREFELT % 54)) (QREFELT % 58)))) 

(SDEFUN |FSC2-;diffEval| ((|l| (|List| S)) (% (S)))
        (SPROG
         ((|d| (|List| (|Mapping| S (|List| S)))) (|n| (|Integer|))
          (|nl| (|List| S)) (|ss| (S)) (|dumm| (S))
          (|ud| (|Union| (|List| (|Mapping| S (|List| S))) "failed"))
          (|op| (|BasicOperator|)) (#1=#:G304 NIL) (|k| (K))
          (|u| (|Union| K "failed")) (|g| (K)))
         (SEQ
          (EXIT
           (SEQ
            (LETT |g| (SPADCALL (SPADCALL |l| (QREFELT % 57)) (QREFELT % 27)))
            (SEQ (LETT |u| (SPADCALL (|SPADfirst| |l|) (QREFELT % 80)))
                 (EXIT
                  (COND
                   ((QEQCAR |u| 1)
                    (PROGN
                     (LETT #1# (|FSC2-;dfeval| |l| |g| %))
                     (GO #2=#:G302)))
                   ((QEQCAR |u| 0)
                    (COND
                     ((QEQCAR (SPADCALL (LETT |k| (QCDR |u|)) (QREFELT % 29))
                              0)
                      (PROGN
                       (LETT #1# (|FSC2-;dfeval| |l| |g| %))
                       (GO #2#))))))))
            (LETT |op| (SPADCALL |k| (QREFELT % 43)))
            (LETT |ud| (SPADCALL |op| (QREFELT % 162)))
            (EXIT
             (COND
              ((QEQCAR |ud| 1)
               (SEQ
                (LETT |dumm|
                      (SPADCALL (|FSC2-;symsub| (QREFELT % 82) 1 %)
                                (QREFELT % 37)))
                (LETT |ss|
                      (SPADCALL (SPADCALL |l| 1 (QREFELT % 152))
                                (SPADCALL (SPADCALL |l| 2 (QREFELT % 152))
                                          |dumm| (QREFELT % 164))
                                (QREFELT % 166)))
                (LETT |nl| (LIST |ss| |dumm| (SPADCALL |l| 3 (QREFELT % 152))))
                (EXIT (SPADCALL (QREFELT % 16) |nl| (QREFELT % 46)))))
              ((<
                (LETT |n|
                      (SPADCALL (SPADCALL |l| (QREFELT % 57))
                                (SPADCALL |k| (QREFELT % 45)) (QREFELT % 145)))
                (PROGN |l| 1))
               (|FSC2-;dfeval| |l| |g| %))
              ('T
               (SEQ (LETT |d| (QCDR |ud|))
                    (EXIT
                     (SPADCALL
                      (SPADCALL (SPADCALL |k| (QREFELT % 45))
                                (SPADCALL |d| |n| (QREFELT % 125)))
                      |g| (SPADCALL |l| (QREFELT % 54)) (QREFELT % 58)))))))))
          #2# (EXIT #1#)))) 

(SDEFUN |FSC2-;diffArg|
        ((|l| (|List| S)) (|op| (|BasicOperator|)) (|i| (|NonNegativeInteger|))
         (% (|List| S)))
        (SPROG ((|g| (S)) (|z| (|List| S)) (|n| (|Integer|)))
               (SEQ (LETT |n| (+ (- |i| 1) (PROGN |l| 1)))
                    (LETT |z| (SPADCALL |l| (QREFELT % 151)))
                    (SPADCALL |z| |n|
                              (LETT |g|
                                    (SPADCALL
                                     (|FSC2-;symsub| (QREFELT % 82) |n| %)
                                     (QREFELT % 37)))
                              (QREFELT % 153))
                    (EXIT
                     (LIST (SPADCALL |op| |z| (QREFELT % 46)) |g|
                           (SPADCALL |l| |n| (QREFELT % 152))))))) 

(SDEFUN |FSC2-;opderiv|
        ((|op| (|BasicOperator|)) (|n| (|NonNegativeInteger|))
         (% (|List| (|Mapping| S (|List| S)))))
        (SPROG ((#1=#:G316 NIL) (|i| NIL) (#2=#:G315 NIL) (|g| (S)))
               (SEQ
                (COND
                 ((EQL |n| 1)
                  (SEQ
                   (LETT |g|
                         (SPADCALL (|FSC2-;symsub| (QREFELT % 82) |n| %)
                                   (QREFELT % 37)))
                   (EXIT
                    (LIST
                     (CONS #'|FSC2-;opderiv!0|
                           (VECTOR % |g| |op| (QREFELT % 16)))))))
                 ('T
                  (PROGN
                   (LETT #2# NIL)
                   (SEQ (LETT |i| 1) (LETT #1# |n|) G190
                        (COND ((|greater_SI| |i| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2#
                                (CONS
                                 (CONS #'|FSC2-;opderiv!1|
                                       (VECTOR % |i| |op| (QREFELT % 16)))
                                 #2#))))
                        (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                        (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |FSC2-;opderiv!1| ((|x| NIL) ($$ NIL))
        (PROG (|opdiff| |op| |i| %)
          (LETT |opdiff| (QREFELT $$ 3))
          (LETT |op| (QREFELT $$ 2))
          (LETT |i| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |opdiff| (|FSC2-;diffArg| |x| |op| |i| %)
                      (QREFELT % 46)))))) 

(SDEFUN |FSC2-;opderiv!0| ((|x| NIL) ($$ NIL))
        (PROG (|opdiff| |op| |g| %)
          (LETT |opdiff| (QREFELT $$ 3))
          (LETT |op| (QREFELT $$ 2))
          (LETT |g| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL |opdiff|
                      (LIST (SPADCALL |op| |g| (QREFELT % 167)) |g|
                            (SPADCALL |x| (QREFELT % 92)))
                      (QREFELT % 46)))))) 

(SDEFUN |FSC2-;kgrad| ((|k| (K)) (% (|List| (|Mapping| S (|List| S)))))
        (SPROG
         ((|grad| (|List| (|Mapping| S (|List| S))))
          (|u| (|Union| (|List| (|Mapping| S (|List| S))) "failed"))
          (|op| (|BasicOperator|)) (|n| (|NonNegativeInteger|))
          (|args| (|List| S)))
         (SEQ
          (COND
           ((ZEROP
             (LETT |n| (LENGTH (LETT |args| (SPADCALL |k| (QREFELT % 45))))))
            NIL)
           (#1='T
            (SEQ (LETT |op| (SPADCALL |k| (QREFELT % 43)))
                 (LETT |grad|
                       (SEQ (LETT |u| (SPADCALL |op| (QREFELT % 162)))
                            (EXIT
                             (COND
                              ((QEQCAR |u| 1) (|FSC2-;opderiv| |op| |n| %))
                              (#1# (QCDR |u|))))))
                 (EXIT
                  (COND
                   ((SPADCALL (LENGTH |grad|) |n| (QREFELT % 168))
                    (|FSC2-;opderiv| |op| |n| %))
                   (#1# |grad|))))))))) 

(SDEFUN |FSC2-;kerderiv| ((|k| (K)) (|x| (|Symbol|)) (% (S)))
        (SPROG
         ((#1=#:G335 NIL) (#2=#:G334 (S)) (#3=#:G336 (S)) (|dyx| (S))
          (#4=#:G340 NIL) (|g| NIL) (#5=#:G341 NIL) (|y| NIL)
          (|fn| (|Union| (|None|) "failed")) (|ak| (|List| S))
          (|v| (|Union| (|Symbol|) "failed")))
         (SEQ (LETT |v| (SPADCALL |k| (QREFELT % 29)))
              (EXIT
               (COND
                ((QEQCAR |v| 0)
                 (COND ((EQUAL (QCDR |v|) |x|) (|spadConstant| % 142))
                       (#6='T (|spadConstant| % 122))))
                (#6#
                 (SEQ (LETT |ak| (SPADCALL |k| (QREFELT % 45)))
                      (LETT |fn|
                            (SPADCALL (SPADCALL |k| (QREFELT % 43))
                                      (QREFELT % 11) (QREFELT % 147)))
                      (EXIT
                       (COND ((QEQCAR |fn| 0) (SPADCALL |ak| |x| (QCDR |fn|)))
                             (#6#
                              (PROGN
                               (LETT #1# NIL)
                               (SEQ (LETT |y| NIL) (LETT #5# |ak|)
                                    (LETT |g| NIL)
                                    (LETT #4# (|FSC2-;kgrad| |k| %)) G190
                                    (COND
                                     ((OR (ATOM #4#)
                                          (PROGN (LETT |g| (CAR #4#)) NIL)
                                          (ATOM #5#)
                                          (PROGN (LETT |y| (CAR #5#)) NIL))
                                      (GO G191)))
                                    (SEQ
                                     (EXIT
                                      (COND
                                       ((SPADCALL
                                         (LETT |dyx|
                                               (SPADCALL |y| |x|
                                                         (QREFELT % 159)))
                                         (|spadConstant| % 122)
                                         (QREFELT % 169))
                                        (PROGN
                                         (LETT #3#
                                               (SPADCALL (SPADCALL |ak| |g|)
                                                         |dyx|
                                                         (QREFELT % 132)))
                                         (COND
                                          (#1#
                                           (LETT #2#
                                                 (SPADCALL #2# #3#
                                                           (QREFELT % 133))))
                                          ('T
                                           (PROGN
                                            (LETT #2# #3#)
                                            (LETT #1# 'T)))))))))
                                    (LETT #4#
                                          (PROG1 (CDR #4#)
                                            (LETT #5# (CDR #5#))))
                                    (GO G190) G191 (EXIT NIL))
                               (COND (#1# #2#)
                                     (#6# (|spadConstant| % 122)))))))))))))) 

(SDEFUN |FSC2-;smpderiv|
        ((|p| (|SparseMultivariatePolynomial| R K)) (|x| (|Symbol|)) (% (S)))
        (SPROG
         ((#1=#:G368 NIL) (#2=#:G367 (S)) (#3=#:G369 (S)) (#4=#:G371 NIL)
          (|k| NIL))
         (SEQ
          (SPADCALL
           (SPADCALL
            (SPADCALL (CONS #'|FSC2-;smpderiv!0| (VECTOR |x| %)) |p|
                      (QREFELT % 175))
            (QREFELT % 88))
           (PROGN
            (LETT #1# NIL)
            (SEQ (LETT |k| NIL) (LETT #4# (SPADCALL |p| (QREFELT % 176))) G190
                 (COND
                  ((OR (ATOM #4#) (PROGN (LETT |k| (CAR #4#)) NIL)) (GO G191)))
                 (SEQ
                  (EXIT
                   (PROGN
                    (LETT #3#
                          (SPADCALL
                           (SPADCALL (SPADCALL |p| |k| (QREFELT % 177))
                                     (QREFELT % 88))
                           (|FSC2-;kerderiv| |k| |x| %) (QREFELT % 132)))
                    (COND (#1# (LETT #2# (SPADCALL #2# #3# (QREFELT % 133))))
                          ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                 (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
            (COND (#1# #2#) ('T (|spadConstant| % 122))))
           (QREFELT % 133))))) 

(SDEFUN |FSC2-;smpderiv!0| ((|s| NIL) ($$ NIL))
        (PROG (% |x|)
          (LETT % (QREFELT $$ 1))
          (LETT |x| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPADCALL
             (SPADCALL (SPADCALL |s| (QREFELT % 171)) |x| (QREFELT % 172))
             (QREFELT % 173)))))) 

(SDEFUN |FSC2-;coerce;PS;43| ((|p| (|Polynomial| R)) (% (S)))
        (SPADCALL (ELT % 37) (ELT % 178) |p| (QREFELT % 182))) 

(SDEFUN |FSC2-;worse?| ((|k1| (K)) (|k2| (K)) (% (|Boolean|)))
        (SPROG ((|u| (|Union| (|Boolean|) "failed")))
               (SEQ
                (LETT |u|
                      (SPADCALL
                       (SPADCALL (SPADCALL |k1| (QREFELT % 43)) (QREFELT % 47))
                       (SPADCALL (SPADCALL |k2| (QREFELT % 43)) (QREFELT % 47))
                       (QREFELT % 186)))
                (EXIT
                 (COND ((QEQCAR |u| 1) (SPADCALL |k1| |k2| (QREFELT % 187)))
                       ('T (QCDR |u|))))))) 

(SDEFUN |FSC2-;bestKernel| ((|l| (|List| K)) (% (K)))
        (SPROG ((|a| (K)))
               (SEQ
                (COND ((NULL (CDR |l|)) (|SPADfirst| |l|))
                      (#1='T
                       (SEQ (LETT |a| (|FSC2-;bestKernel| (CDR |l|) %))
                            (EXIT
                             (COND
                              ((|FSC2-;worse?| (|SPADfirst| |l|) |a| %) |a|)
                              (#1# (|SPADfirst| |l|)))))))))) 

(SDEFUN |FSC2-;smp2O|
        ((|p| (|SparseMultivariatePolynomial| R K)) (% (|OutputForm|)))
        (SPROG ((|a| (K)) (#1=#:G385 NIL) (|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |p| (QREFELT % 188)))
                    (EXIT
                     (COND
                      ((QEQCAR |r| 0) (SPADCALL (QCDR |r|) (QREFELT % 189)))
                      (#2='T
                       (SEQ
                        (LETT |a|
                              (COND
                               ((SPADCALL (QREFELT % 190))
                                (|FSC2-;bestKernel|
                                 (SPADCALL |p| (QREFELT % 176)) %))
                               (#2#
                                (PROG2
                                    (LETT #1# (SPADCALL |p| (QREFELT % 111)))
                                    (QCDR #1#)
                                  (|check_union2| (QEQCAR #1# 0) (QREFELT % 8)
                                                  (|Union| (QREFELT % 8)
                                                           "failed")
                                                  #1#)))))
                        (EXIT
                         (SPADCALL
                          (SPADCALL (ELT % 88)
                                    (SPADCALL |p| |a| (QREFELT % 113))
                                    (QREFELT % 118))
                          (SPADCALL |a| (QREFELT % 191))
                          (QREFELT % 192)))))))))) 

(SDEFUN |FSC2-;smpsubst|
        ((|p| (|SparseMultivariatePolynomial| R K)) (|lk| (|List| K))
         (|lv| (|List| S)) (% (S)))
        (SPROG NIL
               (SPADCALL (CONS #'|FSC2-;smpsubst!2| (VECTOR % |lv| |lk|))
                         (ELT % 178) |p| (QREFELT % 198)))) 

(SDEFUN |FSC2-;smpsubst!2| ((|x| NIL) ($$ NIL))
        (PROG (|lk| |lv| %)
          (LETT |lk| (QREFELT $$ 2))
          (LETT |lv| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |lk| |lv| |x|
                             (|FSC2-;notfound|
                              (CONS #'|FSC2-;smpsubst!1| (VECTOR |lk| |lv| %))
                              |lk| %)
                             (QREFELT % 196))))))) 

(SDEFUN |FSC2-;smpsubst!1| ((|z| NIL) ($$ NIL))
        (PROG (% |lv| |lk|)
          (LETT % (QREFELT $$ 2))
          (LETT |lv| (QREFELT $$ 1))
          (LETT |lk| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (|FSC2-;subs|
                    (CONS #'|FSC2-;smpsubst!0| (VECTOR % |lv| |lk|)) |z| %)))))) 

(SDEFUN |FSC2-;smpsubst!0| ((|s| NIL) ($$ NIL))
        (PROG (|lk| |lv| %)
          (LETT |lk| (QREFELT $$ 2))
          (LETT |lv| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |s| |lk| |lv| (QREFELT % 193)))))) 

(SDEFUN |FSC2-;smpeval|
        ((|p| (|SparseMultivariatePolynomial| R K)) (|lk| (|List| K))
         (|lv| (|List| S)) (% (S)))
        (SPROG NIL
               (SPADCALL (CONS #'|FSC2-;smpeval!2| (VECTOR % |lv| |lk|))
                         (ELT % 178) |p| (QREFELT % 198)))) 

(SDEFUN |FSC2-;smpeval!2| ((|x| NIL) ($$ NIL))
        (PROG (|lk| |lv| %)
          (LETT |lk| (QREFELT $$ 2))
          (LETT |lv| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL |lk| |lv| |x|
                             (|FSC2-;notfound|
                              (CONS #'|FSC2-;smpeval!1| (VECTOR |lk| |lv| %))
                              |lk| %)
                             (QREFELT % 196))))))) 

(SDEFUN |FSC2-;smpeval!1| ((|z| NIL) ($$ NIL))
        (PROG (% |lv| |lk|)
          (LETT % (QREFELT $$ 2))
          (LETT |lv| (QREFELT $$ 1))
          (LETT |lk| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG NIL
                   (SPADCALL (CONS #'|FSC2-;smpeval!0| (VECTOR % |lv| |lk|))
                             |z| (QREFELT % 200))))))) 

(SDEFUN |FSC2-;smpeval!0| ((|s| NIL) ($$ NIL))
        (PROG (|lk| |lv| %)
          (LETT |lk| (QREFELT $$ 2))
          (LETT |lv| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |s| |lk| |lv| (QREFELT % 199)))))) 

(SDEFUN |FSC2-;notfound|
        ((|fn| (|Mapping| S K)) (|lk| (|List| K)) (% (|Mapping| S K)))
        (SPROG NIL (CONS #'|FSC2-;notfound!0| (VECTOR |fn| |lk| %)))) 

(SDEFUN |FSC2-;notfound!0| ((|k| NIL) ($$ NIL))
        (PROG (% |lk| |fn|)
          (LETT % (QREFELT $$ 2))
          (LETT |lk| (QREFELT $$ 1))
          (LETT |fn| (QREFELT $$ 0))
          (RETURN
           (PROGN
            (SPROG ((|f| NIL))
                   (COND
                    ((SPADCALL
                      (SPADCALL
                       (SPADCALL (LETT |f| (SPADCALL |k| (QREFELT % 25)))
                                 (QREFELT % 201))
                       |lk| (QREFELT % 202))
                      (QREFELT % 203))
                     |f|)
                    ('T (SPADCALL |k| |fn|)))))))) 

(SDEFUN |FSC2-;smpret|
        ((|p| (|SparseMultivariatePolynomial| R K))
         (% (|Union| (|Polynomial| R) "failed")))
        (SPROG
         ((#1=#:G439 NIL) (#2=#:G438 #3=(|Boolean|)) (#4=#:G440 #3#)
          (#5=#:G447 NIL) (|k| NIL))
         (SEQ
          (COND
           ((PROGN
             (LETT #1# NIL)
             (SEQ (LETT |k| NIL) (LETT #5# (SPADCALL |p| (QREFELT % 176))) G190
                  (COND
                   ((OR (ATOM #5#) (PROGN (LETT |k| (CAR #5#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #4# (QEQCAR (SPADCALL |k| (QREFELT % 29)) 1))
                     (COND (#1# (LETT #2# (COND (#2# 'T) ('T #4#))))
                           ('T (PROGN (LETT #2# #4#) (LETT #1# 'T)))))))
                  (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))
             (COND (#1# #2#) (#6='T NIL)))
            (CONS 1 "failed"))
           (#6#
            (CONS 0
                  (SPADCALL (CONS #'|FSC2-;smpret!0| %) (ELT % 171) |p|
                            (QREFELT % 208)))))))) 

(SDEFUN |FSC2-;smpret!0| ((|x| NIL) (% NIL))
        (SPROG ((#1=#:G442 NIL))
               (SPADCALL
                (PROG2 (LETT #1# (SPADCALL |x| (QREFELT % 29)))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (|Symbol|)
                                  (|Union| (|Symbol|) "failed") #1#))
                (QREFELT % 204)))) 

(SDEFUN |FSC2-;isExpt;SBoU;51|
        ((|x| (S)) (|op| (|BasicOperator|))
         (%
          (|Union| (|Record| (|:| |var| K) (|:| |exponent| (|Integer|)))
                   "failed")))
        (SPROG
         ((|v| (K))
          (|u|
           (|Union| (|Record| (|:| |var| K) (|:| |exponent| (|Integer|)))
                    "failed")))
         (SEQ (LETT |u| (SPADCALL |x| (QREFELT % 211)))
              (EXIT
               (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                     ('T
                      (SEQ (LETT |v| (QCAR (QCDR |u|)))
                           (COND
                            ((SPADCALL |v| |op| (QREFELT % 137))
                             (COND
                              ((EQL (LENGTH (SPADCALL |v| (QREFELT % 45))) 1)
                               (EXIT |u|)))))
                           (EXIT (CONS 1 "failed"))))))))) 

(SDEFUN |FSC2-;isExpt;SSU;52|
        ((|x| (S)) (|sy| (|Symbol|))
         (%
          (|Union| (|Record| (|:| |var| K) (|:| |exponent| (|Integer|)))
                   "failed")))
        (SPROG
         ((|v| (K))
          (|u|
           (|Union| (|Record| (|:| |var| K) (|:| |exponent| (|Integer|)))
                    "failed")))
         (SEQ (LETT |u| (SPADCALL |x| (QREFELT % 211)))
              (EXIT
               (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                     ('T
                      (SEQ (LETT |v| (QCAR (QCDR |u|)))
                           (COND
                            ((SPADCALL |v| |sy| (QREFELT % 213))
                             (COND
                              ((EQL (LENGTH (SPADCALL |v| (QREFELT % 45))) 1)
                               (EXIT |u|)))))
                           (EXIT (CONS 1 "failed"))))))))) 

(SDEFUN |FSC2-;smpIsMult|
        ((|p| (|SparseMultivariatePolynomial| R K))
         (%
          (|Union| (|Record| (|:| |coef| (|Integer|)) (|:| |var| K))
                   "failed")))
        (SPROG
         ((#1=#:G486 NIL) (|n| (|Union| (|Integer|) "failed"))
          (|r| (|Union| R "failed"))
          (|q|
           (|SparseUnivariatePolynomial| (|SparseMultivariatePolynomial| R K)))
          (|u| (|Union| K "failed")))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |u| (SPADCALL |p| (QREFELT % 111)))
                 (EXIT
                  (COND
                   ((QEQCAR |u| 0)
                    (COND
                     ((EQL
                       (SPADCALL
                        (LETT |q| (SPADCALL |p| (QCDR |u|) (QREFELT % 113)))
                        (QREFELT % 215))
                       1)
                      (COND
                       ((SPADCALL
                         (SPADCALL (SPADCALL |q| (QREFELT % 216))
                                   (QREFELT % 217))
                         (QREFELT % 218))
                        (SEQ
                         (LETT |r|
                               (SPADCALL (SPADCALL |q| (QREFELT % 217))
                                         (QREFELT % 188)))
                         (EXIT
                          (COND
                           ((QEQCAR |r| 0)
                            (SEQ
                             (LETT |n| (SPADCALL (QCDR |r|) (QREFELT % 220)))
                             (EXIT
                              (COND
                               ((QEQCAR |n| 0)
                                (PROGN
                                 (LETT #1#
                                       (CONS 0 (CONS (QCDR |n|) (QCDR |u|))))
                                 (GO #2=#:G484))))))))))))))))))
            (EXIT (CONS 1 "failed"))))
          #2# (EXIT #1#)))) 

(PUT '|FSC2-;debugA| '|SPADreplace| '(XLAM (|a1| |a2| |t|) |t|)) 

(SDEFUN |FSC2-;debugA|
        ((|a1| (|List| S)) (|a2| (|List| S)) (|t| (|Boolean|)) (% (|Boolean|)))
        |t|) 

(SDEFUN |FSC2-;decode_diff|
        ((|l| (|List| S))
         (%
          #1=(|Record| (|:| |orig_k| K) (|:| |sub| (|List| (|Integer|)))
                       (|:| |oarg| (|List| S)) (|:| |arg| (|List| S))
                       (|:| |dummies| #2=(|List| S)))))
        (SPROG
         ((|a1| (|List| S)) (|i| (|Integer|)) (|nd| #2#) (|rec| #1#)
          (|a| (|List| S)) (|k| (K)) (|pt| (S)) (|da| (S)))
         (SEQ (LETT |da| (SPADCALL |l| (QREFELT % 57)))
              (LETT |pt| (SPADCALL |l| (QREFELT % 54)))
              (LETT |a|
                    (SPADCALL
                     (LETT |k| (SPADCALL (|SPADfirst| |l|) (QREFELT % 27)))
                     (QREFELT % 45)))
              (EXIT
               (COND
                ((SPADCALL |k| (QREFELT % 16) (QREFELT % 137))
                 (SEQ (LETT |rec| (|FSC2-;decode_diff| |a| %))
                      (LETT |i|
                            (SPADCALL |da| (QVELT |rec| 3) (QREFELT % 145)))
                      (SPADCALL (QVELT |rec| 3) |i| |pt| (QREFELT % 153))
                      (LETT |nd| (QVELT |rec| 4))
                      (COND
                       ((NULL (SPADCALL |i| (QVELT |rec| 1) (QREFELT % 155)))
                        (LETT |nd| (CONS |da| |nd|))))
                      (EXIT
                       (VECTOR (QVELT |rec| 0) (CONS |i| (QVELT |rec| 1))
                               (QVELT |rec| 2) (QVELT |rec| 3) |nd|))))
                ('T
                 (SEQ (LETT |i| (SPADCALL |da| |a| (QREFELT % 145)))
                      (LETT |a1| (SPADCALL |a| (QREFELT % 151)))
                      (SPADCALL |a1| |i| |pt| (QREFELT % 153))
                      (EXIT (VECTOR |k| (LIST |i|) |a| |a1| (LIST |da|)))))))))) 

(SDEFUN |FSC2-;equaldiff| ((|k1| (K)) (|k2| (K)) (% (|Boolean|)))
        (SPROG
         ((|sk1| (S)) (|ok1| (S)) (|od| (|List| K)) (#1=#:G507 NIL) (|dk| NIL)
          (#2=#:G506 NIL)
          (|r2|
           #3=(|Record| (|:| |orig_k| K) (|:| |sub| (|List| (|Integer|)))
                        (|:| |oarg| (|List| S)) (|:| |arg| (|List| S))
                        (|:| |dummies| (|List| S))))
          (|r1| #3#) (|res| (|Boolean|)) (|a2| #4=(|List| S)) (|a1| #4#))
         (SEQ (LETT |a1| (SPADCALL |k1| (QREFELT % 45)))
              (LETT |a2| (SPADCALL |k2| (QREFELT % 45)))
              (LETT |res|
                    (SPADCALL (SPADCALL |k1| (QREFELT % 43))
                              (SPADCALL |k2| (QREFELT % 43)) (QREFELT % 222)))
              (EXIT
               (COND
                (|res|
                 (SEQ
                  (LETT |res|
                        (SPADCALL (SPADCALL |a1| 3 (QREFELT % 152))
                                  (SPADCALL |a2| 3 (QREFELT % 152))
                                  (QREFELT % 59)))
                  (EXIT
                   (COND
                    (|res|
                     (COND
                      ((SPADCALL (SPADCALL |a1| 2 (QREFELT % 152))
                                 (SPADCALL |a2| 2 (QREFELT % 152))
                                 (QREFELT % 59))
                       (SPADCALL (SPADCALL |a1| 1 (QREFELT % 152))
                                 (SPADCALL |a2| 1 (QREFELT % 152))
                                 (QREFELT % 59)))
                      (#5='T
                       (SEQ (LETT |r1| (|FSC2-;decode_diff| |a1| %))
                            (LETT |r2| (|FSC2-;decode_diff| |a2| %))
                            (COND
                             ((NULL
                               (SPADCALL
                                (SPADCALL (QVELT |r1| 0) (QREFELT % 43))
                                (SPADCALL (QVELT |r2| 0) (QREFELT % 43))
                                (QREFELT % 222)))
                              (EXIT NIL)))
                            (COND
                             ((NULL
                               (SPADCALL (QVELT |r1| 1) (QVELT |r2| 1)
                                         (QREFELT % 223)))
                              (EXIT NIL)))
                            (COND
                             ((NULL
                               (SPADCALL (QVELT |r1| 3) (QVELT |r2| 3)
                                         (QREFELT % 224)))
                              (EXIT NIL)))
                            (LETT |od|
                                  (PROGN
                                   (LETT #2# NIL)
                                   (SEQ (LETT |dk| NIL)
                                        (LETT #1# (QVELT |r1| 4)) G190
                                        (COND
                                         ((OR (ATOM #1#)
                                              (PROGN
                                               (LETT |dk| (CAR #1#))
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #2#
                                                (CONS
                                                 (SPADCALL |dk| (QREFELT % 27))
                                                 #2#))))
                                        (LETT #1# (CDR #1#)) (GO G190) G191
                                        (EXIT (NREVERSE #2#)))))
                            (LETT |ok1|
                                  (SPADCALL (QVELT |r1| 0) (QREFELT % 25)))
                            (LETT |sk1|
                                  (SPADCALL |ok1| |od| (QVELT |r2| 4)
                                            (QREFELT % 193)))
                            (EXIT
                             (SPADCALL |sk1|
                                       (SPADCALL (QVELT |r2| 0) (QREFELT % 25))
                                       (QREFELT % 59)))))))
                    (#5# (|FSC2-;debugA| |a1| |a2| |res| %))))))
                (#5# (|FSC2-;debugA| |a1| |a2| |res| %))))))) 

(SDEFUN |FSC2-;mainKernel;SU;57| ((|x| (S)) (% (|Union| K "failed")))
        (SPADCALL (SPADCALL |x| (QREFELT % 90)) (QREFELT % 111))) 

(SDEFUN |FSC2-;kernels;SL;58| ((|x| (S)) (% (|List| K)))
        (SPADCALL (SPADCALL |x| (QREFELT % 90)) (QREFELT % 176))) 

(SDEFUN |FSC2-;retract;SR;59| ((|x| (S)) (% (R)))
        (SPADCALL (SPADCALL |x| (QREFELT % 90)) (QREFELT % 227))) 

(SDEFUN |FSC2-;retract;SP;60| ((|x| (S)) (% (|Polynomial| R)))
        (SPROG ((#1=#:G525 NIL))
               (PROG2
                   (LETT #1# (|FSC2-;smpret| (SPADCALL |x| (QREFELT % 90)) %))
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 0) (|Polynomial| (QREFELT % 7))
                                 (|Union| (|Polynomial| (QREFELT % 7))
                                          "failed")
                                 #1#)))) 

(SDEFUN |FSC2-;retractIfCan;SU;61| ((|x| (S)) (% (|Union| R "failed")))
        (CONS 0 (SPADCALL (SPADCALL |x| (QREFELT % 90)) (QREFELT % 227)))) 

(SDEFUN |FSC2-;retractIfCan;SU;62|
        ((|x| (S)) (% (|Union| (|Polynomial| R) "failed")))
        (|FSC2-;smpret| (SPADCALL |x| (QREFELT % 90)) %)) 

(SDEFUN |FSC2-;eval;SLLS;63|
        ((|x| (S)) (|lk| (|List| K)) (|lv| (|List| S)) (% (S)))
        (|FSC2-;smpeval| (SPADCALL |x| (QREFELT % 90)) |lk| |lv| %)) 

(SDEFUN |FSC2-;subst;SLLS;64|
        ((|x| (S)) (|lk| (|List| K)) (|lv| (|List| S)) (% (S)))
        (|FSC2-;smpsubst| (SPADCALL |x| (QREFELT % 90)) |lk| |lv| %)) 

(SDEFUN |FSC2-;differentiate;SSS;65| ((|x| (S)) (|s| (|Symbol|)) (% (S)))
        (|FSC2-;smpderiv| (SPADCALL |x| (QREFELT % 90)) |s| %)) 

(SDEFUN |FSC2-;coerce;SOf;66| ((|x| (S)) (% (|OutputForm|)))
        (|FSC2-;smp2O| (SPADCALL |x| (QREFELT % 90)) %)) 

(SDEFUN |FSC2-;eval;SLLLS;67|
        ((|x| (S)) (|s| (|List| (|Symbol|)))
         (|n| (|List| (|NonNegativeInteger|)))
         (|f| (|List| (|Mapping| S (|List| S)))) (% (S)))
        (|FSC2-;smprep| |s| |n| |f| (SPADCALL |x| (QREFELT % 90)) %)) 

(SDEFUN |FSC2-;isPlus;SU;68| ((|x| (S)) (% (|Union| (|List| S) "failed")))
        (SPROG
         ((#1=#:G555 NIL) (|p| NIL) (#2=#:G554 NIL)
          (|u|
           (|Union| (|List| (|SparseMultivariatePolynomial| R K)) "failed")))
         (SEQ
          (LETT |u| (SPADCALL (SPADCALL |x| (QREFELT % 90)) (QREFELT % 239)))
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T
                  (CONS 0
                        (PROGN
                         (LETT #2# NIL)
                         (SEQ (LETT |p| NIL) (LETT #1# (QCDR |u|)) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |p| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS (SPADCALL |p| (QREFELT % 88))
                                            #2#))))
                              (LETT #1# (CDR #1#)) (GO G190) G191
                              (EXIT (NREVERSE #2#))))))))))) 

(SDEFUN |FSC2-;isTimes;SU;69| ((|x| (S)) (% (|Union| (|List| S) "failed")))
        (SPROG
         ((#1=#:G567 NIL) (|p| NIL) (#2=#:G566 NIL)
          (|u|
           (|Union| (|List| (|SparseMultivariatePolynomial| R K)) "failed")))
         (SEQ
          (LETT |u| (SPADCALL (SPADCALL |x| (QREFELT % 90)) (QREFELT % 241)))
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T
                  (CONS 0
                        (PROGN
                         (LETT #2# NIL)
                         (SEQ (LETT |p| NIL) (LETT #1# (QCDR |u|)) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |p| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS (SPADCALL |p| (QREFELT % 88))
                                            #2#))))
                              (LETT #1# (CDR #1#)) (GO G190) G191
                              (EXIT (NREVERSE #2#))))))))))) 

(SDEFUN |FSC2-;isExpt;SU;70|
        ((|x| (S))
         (%
          (|Union| (|Record| (|:| |var| K) (|:| |exponent| (|Integer|)))
                   "failed")))
        (SPROG
         ((|r|
           (|Record| (|:| |var| K) (|:| |exponent| (|NonNegativeInteger|))))
          (|u|
           (|Union|
            (|Record| (|:| |var| K) (|:| |exponent| (|NonNegativeInteger|)))
            "failed")))
         (SEQ
          (LETT |u| (SPADCALL (SPADCALL |x| (QREFELT % 90)) (QREFELT % 245)))
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |r| (QCDR |u|))
                       (EXIT (CONS 0 (CONS (QCAR |r|) (QCDR |r|))))))))))) 

(SDEFUN |FSC2-;isPower;SU;71|
        ((|x| (S))
         (%
          (|Union| (|Record| (|:| |val| S) (|:| |exponent| (|Integer|)))
                   "failed")))
        (SPROG
         ((|r|
           (|Record| (|:| |var| K) (|:| |exponent| (|NonNegativeInteger|))))
          (|u|
           (|Union|
            (|Record| (|:| |var| K) (|:| |exponent| (|NonNegativeInteger|)))
            "failed")))
         (SEQ
          (LETT |u| (SPADCALL (SPADCALL |x| (QREFELT % 90)) (QREFELT % 245)))
          (EXIT
           (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                 ('T
                  (SEQ (LETT |r| (QCDR |u|))
                       (EXIT
                        (CONS 0
                              (CONS (SPADCALL (QCAR |r|) (QREFELT % 25))
                                    (QCDR |r|))))))))))) 

(SDEFUN |FSC2-;convert;SP;72| ((|x| (S)) (% (|Pattern| (|Integer|))))
        (SPADCALL (SPADCALL |x| (QREFELT % 90)) (QREFELT % 251))) 

(SDEFUN |FSC2-;convert;SP;73| ((|x| (S)) (% (|Pattern| (|Float|))))
        (SPADCALL (SPADCALL |x| (QREFELT % 90)) (QREFELT % 254))) 

(SDEFUN |FSC2-;isMult;SU;74|
        ((|x| (S))
         (%
          (|Union| (|Record| (|:| |coef| (|Integer|)) (|:| |var| K))
                   "failed")))
        (|FSC2-;smpIsMult| (SPADCALL |x| (QREFELT % 90)) %)) 

(SDEFUN |FSC2-;*;R2S;75| ((|r| (R)) (|x| (S)) (% (S)))
        (SPADCALL (SPADCALL (SPADCALL |r| (QREFELT % 259)) (QREFELT % 88)) |x|
                  (QREFELT % 132))) 

(SDEFUN |FSC2-;mainKernel;SU;76| ((|x| (S)) (% (|Union| K "failed")))
        (SPADCALL |x| (QREFELT % 262))) 

(SDEFUN |FSC2-;kernels;SL;77| ((|x| (S)) (% (|List| K)))
        (SPADCALL |x| (QREFELT % 263))) 

(SDEFUN |FSC2-;univariate;SKF;78|
        ((|x| (S)) (|k| (K)) (% (|Fraction| (|SparseUnivariatePolynomial| S))))
        (SPADCALL |x| |k| (QREFELT % 265))) 

(SDEFUN |FSC2-;isPlus;SU;79| ((|x| (S)) (% (|Union| (|List| S) "failed")))
        (SPADCALL |x| (QREFELT % 269))) 

(SDEFUN |FSC2-;isTimes;SU;80| ((|x| (S)) (% (|Union| (|List| S) "failed")))
        (SPADCALL |x| (QREFELT % 270))) 

(SDEFUN |FSC2-;isExpt;SU;81|
        ((|x| (S))
         (%
          (|Union| (|Record| (|:| |var| K) (|:| |exponent| (|Integer|)))
                   "failed")))
        (SPADCALL |x| (QREFELT % 271))) 

(SDEFUN |FSC2-;isPower;SU;82|
        ((|x| (S))
         (%
          (|Union| (|Record| (|:| |val| S) (|:| |exponent| (|Integer|)))
                   "failed")))
        (SPADCALL |x| (QREFELT % 274))) 

(SDEFUN |FSC2-;denominator;2S;83| ((|x| (S)) (% (S)))
        (SPADCALL (SPADCALL |x| (QREFELT % 275)) (QREFELT % 88))) 

(SDEFUN |FSC2-;coerce;FS;84| ((|q| (|Fraction| R)) (% (S)))
        (SPADCALL (SPADCALL (SPADCALL |q| (QREFELT % 278)) (QREFELT % 259))
                  (SPADCALL (SPADCALL |q| (QREFELT % 279)) (QREFELT % 259))
                  (QREFELT % 280))) 

(SDEFUN |FSC2-;coerce;FS;85| ((|q| (|Fraction| (|Polynomial| R))) (% (S)))
        (SPADCALL (SPADCALL (SPADCALL |q| (QREFELT % 283)) (QREFELT % 284))
                  (SPADCALL (SPADCALL |q| (QREFELT % 285)) (QREFELT % 284))
                  (QREFELT % 286))) 

(SDEFUN |FSC2-;coerce;FS;86|
        ((|q| (|Fraction| (|Polynomial| (|Fraction| R)))) (% (S)))
        (SPADCALL (SPADCALL (SPADCALL |q| (QREFELT % 290)) (QREFELT % 291))
                  (SPADCALL (SPADCALL |q| (QREFELT % 292)) (QREFELT % 291))
                  (QREFELT % 286))) 

(SDEFUN |FSC2-;retract;SP;87| ((|x| (S)) (% (|Polynomial| R)))
        (SPADCALL (SPADCALL |x| (QREFELT % 294)) (QREFELT % 295))) 

(SDEFUN |FSC2-;retract;SF;88| ((|x| (S)) (% (|Fraction| (|Polynomial| R))))
        (SPROG ((#1=#:G636 NIL))
               (SPADCALL
                (PROG2
                    (LETT #1# (|FSC2-;smpret| (SPADCALL |x| (QREFELT % 90)) %))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (|Polynomial| (QREFELT % 7))
                                  (|Union| (|Polynomial| (QREFELT % 7))
                                           #2="failed")
                                  #1#))
                (PROG2
                    (LETT #1#
                          (|FSC2-;smpret| (SPADCALL |x| (QREFELT % 275)) %))
                    (QCDR #1#)
                  (|check_union2| (QEQCAR #1# 0) (|Polynomial| (QREFELT % 7))
                                  (|Union| (|Polynomial| (QREFELT % 7)) #2#)
                                  #1#))
                (QREFELT % 296)))) 

(SDEFUN |FSC2-;retract;SR;89| ((|x| (S)) (% (R)))
        (SPROG ((#1=#:G640 NIL))
               (PROG2
                   (LETT #1#
                         (SPADCALL
                          (SPADCALL (SPADCALL |x| (QREFELT % 90))
                                    (QREFELT % 227))
                          (SPADCALL (SPADCALL |x| (QREFELT % 275))
                                    (QREFELT % 227))
                          (QREFELT % 299)))
                   (QCDR #1#)
                 (|check_union2| (QEQCAR #1# 0) (QREFELT % 7)
                                 (|Union| (QREFELT % 7) "failed") #1#)))) 

(SDEFUN |FSC2-;alg_ker_set| ((|lx| (|List| S)) (% (|List| K)))
        (SPROG
         ((#1=#:G669 NIL) (|ak1| (|List| K)) (#2=#:G676 NIL) (|k1| NIL)
          (|arg| (|List| S)) (|resl| (|List| K)) (|needed| (|Boolean|))
          (#3=#:G675 NIL) (#4=#:G674 NIL) (#5=#:G673 NIL) (|k| NIL)
          (|ak| (|List| K)) (#6=#:G670 NIL) (#7=#:G672 NIL) (#8=#:G671 NIL)
          (|x| NIL))
         (SEQ (LETT |resl| NIL) (LETT |ak1| NIL)
              (SEQ (LETT |x| NIL) (LETT #8# |lx|) G190
                   (COND
                    ((OR (ATOM #8#) (PROGN (LETT |x| (CAR #8#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (SEQ (LETT |k| NIL)
                          (LETT #7# (SPADCALL |x| (QREFELT % 300))) G190
                          (COND
                           ((OR (ATOM #7#) (PROGN (LETT |k| (CAR #7#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (SEQ
                             (COND
                              ((NULL (SPADCALL |k| '|nthRoot| (QREFELT % 213)))
                               (COND
                                ((NULL
                                  (SPADCALL |k| '|rootOf| (QREFELT % 213)))
                                 (EXIT
                                  (PROGN
                                   (LETT #6# |$NoValue|)
                                   (GO #9=#:G644)))))))
                             (EXIT (LETT |ak1| (CONS |k| |ak1|)))))
                           #9# (EXIT #6#))
                          (LETT #7# (CDR #7#)) (GO G190) G191 (EXIT NIL))))
                   (LETT #8# (CDR #8#)) (GO G190) G191 (EXIT NIL))
              (SEQ G190 (COND ((NULL (NULL (NULL |ak1|))) (GO G191)))
                   (SEQ (LETT |ak| |ak1|) (LETT |ak1| NIL)
                        (EXIT
                         (SEQ (LETT |k| NIL) (LETT #5# |ak|) G190
                              (COND
                               ((OR (ATOM #5#)
                                    (PROGN (LETT |k| (CAR #5#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (SEQ (LETT |needed| 'T)
                                     (SEQ (LETT |k1| NIL) (LETT #4# |resl|)
                                          G190
                                          (COND
                                           ((OR (ATOM #4#)
                                                (PROGN
                                                 (LETT |k1| (CAR #4#))
                                                 NIL)
                                                (NULL |needed|))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (COND
                                             ((EQ |k1| |k|)
                                              (LETT |needed| NIL)))))
                                          (LETT #4# (CDR #4#)) (GO G190) G191
                                          (EXIT NIL))
                                     (SEQ (LETT |k1| NIL) (LETT #3# |resl|)
                                          G190
                                          (COND
                                           ((OR (ATOM #3#)
                                                (PROGN
                                                 (LETT |k1| (CAR #3#))
                                                 NIL)
                                                (NULL |needed|))
                                            (GO G191)))
                                          (SEQ
                                           (EXIT
                                            (COND
                                             ((SPADCALL |k1| |k|
                                                        (QREFELT % 301))
                                              (LETT |needed| NIL)))))
                                          (LETT #3# (CDR #3#)) (GO G190) G191
                                          (EXIT NIL))
                                     (EXIT
                                      (COND
                                       (|needed|
                                        (SEQ (LETT |resl| (CONS |k| |resl|))
                                             (LETT |arg|
                                                   (SPADCALL |k|
                                                             (QREFELT % 45)))
                                             (EXIT
                                              (SEQ (LETT |k1| NIL)
                                                   (LETT #2#
                                                         (SPADCALL
                                                          (SPADCALL |arg| 1
                                                                    (QREFELT %
                                                                             152))
                                                          (QREFELT % 300)))
                                                   G190
                                                   (COND
                                                    ((OR (ATOM #2#)
                                                         (PROGN
                                                          (LETT |k1| (CAR #2#))
                                                          NIL))
                                                     (GO G191)))
                                                   (SEQ
                                                    (EXIT
                                                     (COND
                                                      ((OR
                                                        (SPADCALL |k1|
                                                                  '|nthRoot|
                                                                  (QREFELT %
                                                                           213))
                                                        (SPADCALL |k1|
                                                                  '|rootOf|
                                                                  (QREFELT %
                                                                           213)))
                                                       (LETT |ak1|
                                                             (CONS |k1|
                                                                   |ak1|))))))
                                                   (LETT #2# (CDR #2#))
                                                   (GO G190) G191
                                                   (EXIT NIL)))))
                                       ('T
                                        (PROGN
                                         (LETT #1# |$NoValue|)
                                         (GO #10=#:G652)))))))
                               #10# (EXIT #1#))
                              (LETT #5# (CDR #5#)) (GO G190) G191 (EXIT NIL))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |resl|)))) 

(SDEFUN |FSC2-;algtower;LL;91| ((|lx| (|List| S)) (% (|List| K)))
        (NREVERSE (SPADCALL (|FSC2-;alg_ker_set| |lx| %) (QREFELT % 302)))) 

(SDEFUN |FSC2-;algtower;SL;92| ((|x| (S)) (% (|List| K)))
        (SPADCALL (LIST |x|) (QREFELT % 304))) 

(SDEFUN |FSC2-;coerce;SOf;93| ((|x| (S)) (% (|OutputForm|)))
        (COND
         ((SPADCALL (SPADCALL |x| (QREFELT % 275)) (|spadConstant| % 306)
                    (QREFELT % 307))
          (|FSC2-;smp2O| (SPADCALL |x| (QREFELT % 90)) %))
         ('T
          (SPADCALL (|FSC2-;smp2O| (SPADCALL |x| (QREFELT % 90)) %)
                    (|FSC2-;smp2O| (SPADCALL |x| (QREFELT % 275)) %)
                    (QREFELT % 308))))) 

(SDEFUN |FSC2-;retractIfCan;SU;94| ((|x| (S)) (% (|Union| R "failed")))
        (SPROG
         ((#1=#:G689 NIL) (|r| (|Union| R "failed"))
          (|d| #2=(|Union| R "failed")) (|n| #2#))
         (SEQ
          (EXIT
           (SEQ
            (SEQ
             (LETT |n|
                   (SPADCALL (SPADCALL |x| (QREFELT % 90)) (QREFELT % 188)))
             (EXIT
              (COND
               ((QEQCAR |n| 1)
                (PROGN (LETT #1# (CONS 1 #3="failed")) (GO #4=#:G687)))
               (#5='T
                (SEQ
                 (LETT |d|
                       (SPADCALL (SPADCALL |x| (QREFELT % 275))
                                 (QREFELT % 188)))
                 (EXIT
                  (COND
                   ((QEQCAR |d| 1) (PROGN (LETT #1# (CONS 1 #3#)) (GO #4#)))
                   (#5#
                    (SEQ
                     (LETT |r|
                           (SPADCALL (QCDR |n|) (QCDR |d|) (QREFELT % 299)))
                     (EXIT
                      (COND
                       ((QEQCAR |r| 1)
                        (PROGN (LETT #1# (CONS 1 #3#)) (GO #4#))))))))))))))
            (EXIT (CONS 0 (QCDR |r|)))))
          #4# (EXIT #1#)))) 

(SDEFUN |FSC2-;eval;SLLLS;95|
        ((|x| (S)) (|s| (|List| (|Symbol|)))
         (|n| (|List| (|NonNegativeInteger|)))
         (|f| (|List| (|Mapping| S (|List| S)))) (% (S)))
        (SPADCALL (|FSC2-;smprep| |s| |n| |f| (SPADCALL |x| (QREFELT % 90)) %)
                  (|FSC2-;smprep| |s| |n| |f| (SPADCALL |x| (QREFELT % 275)) %)
                  (QREFELT % 286))) 

(SDEFUN |FSC2-;differentiate;SSS;96| ((|f| (S)) (|x| (|Symbol|)) (% (S)))
        (SPADCALL
         (SPADCALL
          (SPADCALL (|FSC2-;smpderiv| (SPADCALL |f| (QREFELT % 90)) |x| %)
                    (SPADCALL (SPADCALL |f| (QREFELT % 275)) (QREFELT % 88))
                    (QREFELT % 132))
          (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT % 90)) (QREFELT % 88))
                    (|FSC2-;smpderiv| (SPADCALL |f| (QREFELT % 275)) |x| %)
                    (QREFELT % 132))
          (QREFELT % 309))
         (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT % 275)) (QREFELT % 88)) 2
                   (QREFELT % 310))
         (QREFELT % 286))) 

(SDEFUN |FSC2-;eval;SLLS;97|
        ((|x| (S)) (|lk| (|List| K)) (|lv| (|List| S)) (% (S)))
        (SPADCALL (|FSC2-;smpeval| (SPADCALL |x| (QREFELT % 90)) |lk| |lv| %)
                  (|FSC2-;smpeval| (SPADCALL |x| (QREFELT % 275)) |lk| |lv| %)
                  (QREFELT % 286))) 

(SDEFUN |FSC2-;subst;SLLS;98|
        ((|x| (S)) (|lk| (|List| K)) (|lv| (|List| S)) (% (S)))
        (SPADCALL (|FSC2-;smpsubst| (SPADCALL |x| (QREFELT % 90)) |lk| |lv| %)
                  (|FSC2-;smpsubst| (SPADCALL |x| (QREFELT % 275)) |lk| |lv| %)
                  (QREFELT % 286))) 

(SDEFUN |FSC2-;par| ((|x| (S)) (% (S)))
        (SPROG ((|r| (|Union| R "failed")))
               (SEQ (LETT |r| (SPADCALL |x| (QREFELT % 19)))
                    (EXIT
                     (COND ((QEQCAR |r| 0) |x|)
                           ('T (SPADCALL |x| (QREFELT % 311)))))))) 

(SDEFUN |FSC2-;convert;FS;100| ((|x| (|Factored| S)) (% (S)))
        (SPROG
         ((#1=#:G713 NIL) (#2=#:G712 (S)) (#3=#:G714 (S)) (#4=#:G716 NIL)
          (|f| NIL))
         (SEQ
          (SPADCALL (|FSC2-;par| (SPADCALL |x| (QREFELT % 313)) %)
                    (PROGN
                     (LETT #1# NIL)
                     (SEQ (LETT |f| NIL)
                          (LETT #4# (SPADCALL |x| (QREFELT % 317))) G190
                          (COND
                           ((OR (ATOM #4#) (PROGN (LETT |f| (CAR #4#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (PROGN
                             (LETT #3#
                                   (SPADCALL (|FSC2-;par| (QVELT |f| 1) %)
                                             (QVELT |f| 2) (QREFELT % 310)))
                             (COND
                              (#1#
                               (LETT #2# (SPADCALL #2# #3# (QREFELT % 132))))
                              ('T (PROGN (LETT #2# #3#) (LETT #1# 'T)))))))
                          (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
                     (COND (#1# #2#) ('T (|spadConstant| % 142))))
                    (QREFELT % 132))))) 

(SDEFUN |FSC2-;retractIfCan;SU;101|
        ((|x| (S)) (% (|Union| (|Polynomial| R) "failed")))
        (SPROG ((|u| (|Union| (|Fraction| (|Polynomial| R)) "failed")))
               (SEQ (LETT |u| (SPADCALL |x| (QREFELT % 321)))
                    (EXIT
                     (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                           ('T (SPADCALL (QCDR |u|) (QREFELT % 322)))))))) 

(SDEFUN |FSC2-;retractIfCan;SU;102|
        ((|x| (S)) (% (|Union| (|Fraction| (|Polynomial| R)) "failed")))
        (SPROG ((|d| #1=(|Union| (|Polynomial| R) "failed")) (|n| #1#))
               (SEQ (LETT |n| (|FSC2-;smpret| (SPADCALL |x| (QREFELT % 90)) %))
                    (EXIT
                     (COND ((QEQCAR |n| 1) (CONS 1 "failed"))
                           (#2='T
                            (SEQ
                             (LETT |d|
                                   (|FSC2-;smpret|
                                    (SPADCALL |x| (QREFELT % 275)) %))
                             (EXIT
                              (COND ((QEQCAR |d| 1) (CONS 1 "failed"))
                                    (#2#
                                     (CONS 0
                                           (SPADCALL (QCDR |n|) (QCDR |d|)
                                                     (QREFELT % 296))))))))))))) 

(SDEFUN |FSC2-;coerce;PS;103| ((|p| (|Polynomial| (|Fraction| R))) (% (S)))
        (SPADCALL (ELT % 37) (ELT % 324) |p| (QREFELT % 327))) 

(SDEFUN |FSC2-;coerce;FS;104| ((|x| (|Fraction| (|Integer|))) (% (S)))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 330)) (QREFELT % 331))
                  (SPADCALL (SPADCALL |x| (QREFELT % 332)) (QREFELT % 331))
                  (QREFELT % 280))) 

(SDEFUN |FSC2-;isMult;SU;105|
        ((|x| (S))
         (%
          (|Union| (|Record| (|:| |coef| (|Integer|)) (|:| |var| K))
                   "failed")))
        (SPROG
         ((|q| (|Union| (|Integer|) "failed"))
          (|r| (|Record| (|:| |coef| (|Integer|)) (|:| |var| K)))
          (#1=#:G751 NIL) (|w| (|Union| (|Integer|) "failed"))
          (|v| (|Union| R "failed"))
          (|u|
           (|Union| (|Record| (|:| |coef| (|Integer|)) (|:| |var| K))
                    "failed")))
         (SEQ
          (EXIT
           (SEQ
            (SEQ (LETT |u| (|FSC2-;smpIsMult| (SPADCALL |x| (QREFELT % 90)) %))
                 (EXIT
                  (COND
                   ((QEQCAR |u| 1)
                    (PROGN (LETT #1# (CONS 1 #2="failed")) (GO #3=#:G749)))
                   (#4='T
                    (SEQ
                     (LETT |v|
                           (SPADCALL (SPADCALL |x| (QREFELT % 275))
                                     (QREFELT % 188)))
                     (EXIT
                      (COND
                       ((QEQCAR |v| 1)
                        (PROGN (LETT #1# (CONS 1 #2#)) (GO #3#)))
                       (#4#
                        (SEQ (LETT |w| (SPADCALL (QCDR |v|) (QREFELT % 220)))
                             (EXIT
                              (COND
                               ((QEQCAR |w| 1)
                                (PROGN
                                 (LETT #1# (CONS 1 #2#))
                                 (GO #3#))))))))))))))
            (LETT |r| (QCDR |u|))
            (LETT |q| (SPADCALL (QCAR |r|) (QCDR |w|) (QREFELT % 334)))
            (EXIT
             (COND ((QEQCAR |q| 1) (CONS 1 "failed"))
                   (#4# (CONS 0 (CONS (QCDR |q|) (QCDR |r|))))))))
          #3# (EXIT #1#)))) 

(SDEFUN |FSC2-;convert;SP;106| ((|x| (S)) (% (|Pattern| (|Integer|))))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 90)) (QREFELT % 251))
                  (SPADCALL (SPADCALL |x| (QREFELT % 275)) (QREFELT % 251))
                  (QREFELT % 335))) 

(SDEFUN |FSC2-;convert;SP;107| ((|x| (S)) (% (|Pattern| (|Float|))))
        (SPADCALL (SPADCALL (SPADCALL |x| (QREFELT % 90)) (QREFELT % 254))
                  (SPADCALL (SPADCALL |x| (QREFELT % 275)) (QREFELT % 254))
                  (QREFELT % 336))) 

(DECLAIM (NOTINLINE |FunctionSpace2&;|)) 

(DEFUN |FunctionSpace2&| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT DV$3 (|devaluate| |#3|))
          (LETT |dv$| (LIST '|FunctionSpace2&| DV$1 DV$2 DV$3))
          (LETT % (GETREFV 340))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
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
                                                               (|InputForm|)))))))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (QSETREFV % 8 |#3|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 9 '|odd|)
          (QSETREFV % 10 '|even|)
          (QSETREFV % 11 '|%specialDiff|)
          (QSETREFV % 16 (SPADCALL '|%diff| (QREFELT % 15)))
          (QSETREFV % 17 (SPADCALL '|%quote| (QREFELT % 15)))
          (COND
           ((|testBitVector| |pv$| 11)
            (PROGN
             (QSETREFV % 63
                       (CONS (|dispatchFunction| |FSC2-;eval;SBoSSS;15|) %))
             (QSETREFV % 70
                       (CONS (|dispatchFunction| |FSC2-;eval;SLLSS;16|) %))
             (SPADCALL (QREFELT % 16) '|%specialInput|
                       (CONS (|function| |FSC2-;indiff|) %) (QREFELT % 72)))))
          (COND
           ((|testBitVector| |pv$| 6)
            (PROGN
             (QSETREFV % 82 '%%0)
             (QSETREFV % 85
                       (CONS (|dispatchFunction| |FSC2-;characteristic;Nni;20|)
                             %))
             (QSETREFV % 89 (CONS (|dispatchFunction| |FSC2-;coerce;KS;21|) %))
             (QSETREFV % 91
                       (CONS (|dispatchFunction| |FSC2-;numerator;2S;23|) %))
             (QSETREFV % 97
                       (CONS (|dispatchFunction| |FSC2-;eval;SSNniMS;24|) %))
             (QSETREFV % 98
                       (CONS (|dispatchFunction| |FSC2-;eval;SSNniMS;25|) %))
             (QSETREFV % 100
                       (CONS (|dispatchFunction| |FSC2-;eval;SLLS;26|) %))
             (QSETREFV % 109 (CONS (|dispatchFunction| |FSC2-;elt;BoLS;27|) %))
             (QSETREFV % 110
                       (CONS (|dispatchFunction| |FSC2-;eval;SLLLS;28|) %))
             NIL
             (QSETREFV % 183
                       (CONS (|dispatchFunction| |FSC2-;coerce;PS;43|) %))
             (QSETREFV % 212
                       (CONS (|dispatchFunction| |FSC2-;isExpt;SBoU;51|) %))
             (QSETREFV % 214
                       (CONS (|dispatchFunction| |FSC2-;isExpt;SSU;52|) %))
             (COND ((|testBitVector| |pv$| 1)))
             (SPADCALL (QREFELT % 16) (CONS (|function| |FSC2-;diffEval|) %)
                       (QREFELT % 221))
             (SPADCALL (QREFELT % 16) '|%specialEqual|
                       (CONS (|function| |FSC2-;equaldiff|) %) (QREFELT % 72))
             (SPADCALL (QREFELT % 16) (QREFELT % 11)
                       (CONS (|function| |FSC2-;diffdiff|) %) (QREFELT % 72))
             (SPADCALL (QREFELT % 16) '|%specialDisp|
                       (CONS (|function| |FSC2-;ddiff|) %) (QREFELT % 72))
             (COND ((|testBitVector| |pv$| 2))
                   ('T
                    (PROGN
                     (QSETREFV % 225
                               (CONS
                                (|dispatchFunction| |FSC2-;mainKernel;SU;57|)
                                %))
                     (QSETREFV % 226
                               (CONS (|dispatchFunction| |FSC2-;kernels;SL;58|)
                                     %))
                     (QSETREFV % 228
                               (CONS (|dispatchFunction| |FSC2-;retract;SR;59|)
                                     %))
                     (QSETREFV % 229
                               (CONS (|dispatchFunction| |FSC2-;retract;SP;60|)
                                     %))
                     (QSETREFV % 230
                               (CONS
                                (|dispatchFunction| |FSC2-;retractIfCan;SU;61|)
                                %))
                     (QSETREFV % 232
                               (CONS
                                (|dispatchFunction| |FSC2-;retractIfCan;SU;62|)
                                %))
                     (QSETREFV % 233
                               (CONS (|dispatchFunction| |FSC2-;eval;SLLS;63|)
                                     %))
                     (QSETREFV % 234
                               (CONS (|dispatchFunction| |FSC2-;subst;SLLS;64|)
                                     %))
                     (QSETREFV % 235
                               (CONS
                                (|dispatchFunction|
                                 |FSC2-;differentiate;SSS;65|)
                                %))
                     (QSETREFV % 236
                               (CONS (|dispatchFunction| |FSC2-;coerce;SOf;66|)
                                     %))
                     (QSETREFV % 237
                               (CONS (|dispatchFunction| |FSC2-;eval;SLLLS;67|)
                                     %))
                     (QSETREFV % 240
                               (CONS (|dispatchFunction| |FSC2-;isPlus;SU;68|)
                                     %))
                     (QSETREFV % 242
                               (CONS (|dispatchFunction| |FSC2-;isTimes;SU;69|)
                                     %))
                     (QSETREFV % 246
                               (CONS (|dispatchFunction| |FSC2-;isExpt;SU;70|)
                                     %))
                     (QSETREFV % 249
                               (CONS (|dispatchFunction| |FSC2-;isPower;SU;71|)
                                     %))
                     (COND
                      ((|HasCategory|
                        (|SparseMultivariatePolynomial| |#2| |#3|)
                        '(|ConvertibleTo| (|Pattern| (|Integer|))))
                       (QSETREFV % 252
                                 (CONS
                                  (|dispatchFunction| |FSC2-;convert;SP;72|)
                                  %))))
                     (COND
                      ((|HasCategory|
                        (|SparseMultivariatePolynomial| |#2| |#3|)
                        '(|ConvertibleTo| (|Pattern| (|Float|))))
                       (QSETREFV % 255
                                 (CONS
                                  (|dispatchFunction| |FSC2-;convert;SP;73|)
                                  %))))
                     (COND
                      ((|testBitVector| |pv$| 1)
                       (QSETREFV % 258
                                 (CONS
                                  (|dispatchFunction| |FSC2-;isMult;SU;74|)
                                  %))))))))))
          (COND
           ((|testBitVector| |pv$| 3)
            (QSETREFV % 260 (CONS (|dispatchFunction| |FSC2-;*;R2S;75|) %))))
          (COND
           ((|testBitVector| |pv$| 2)
            (PROGN
             (QSETREFV % 225
                       (CONS (|dispatchFunction| |FSC2-;mainKernel;SU;76|) %))
             (QSETREFV % 226
                       (CONS (|dispatchFunction| |FSC2-;kernels;SL;77|) %))
             (QSETREFV % 267
                       (CONS (|dispatchFunction| |FSC2-;univariate;SKF;78|) %))
             (QSETREFV % 240
                       (CONS (|dispatchFunction| |FSC2-;isPlus;SU;79|) %))
             (QSETREFV % 242
                       (CONS (|dispatchFunction| |FSC2-;isTimes;SU;80|) %))
             (QSETREFV % 246
                       (CONS (|dispatchFunction| |FSC2-;isExpt;SU;81|) %))
             (QSETREFV % 249
                       (CONS (|dispatchFunction| |FSC2-;isPower;SU;82|) %))
             (QSETREFV % 276
                       (CONS (|dispatchFunction| |FSC2-;denominator;2S;83|) %))
             (QSETREFV % 281
                       (CONS (|dispatchFunction| |FSC2-;coerce;FS;84|) %))
             (QSETREFV % 287
                       (CONS (|dispatchFunction| |FSC2-;coerce;FS;85|) %))
             (QSETREFV % 293
                       (CONS (|dispatchFunction| |FSC2-;coerce;FS;86|) %))
             (QSETREFV % 229
                       (CONS (|dispatchFunction| |FSC2-;retract;SP;87|) %))
             (QSETREFV % 297
                       (CONS (|dispatchFunction| |FSC2-;retract;SF;88|) %))
             (QSETREFV % 228
                       (CONS (|dispatchFunction| |FSC2-;retract;SR;89|) %))
             (QSETREFV % 303
                       (CONS (|dispatchFunction| |FSC2-;algtower;LL;91|) %))
             (QSETREFV % 305
                       (CONS (|dispatchFunction| |FSC2-;algtower;SL;92|) %))
             (QSETREFV % 236
                       (CONS (|dispatchFunction| |FSC2-;coerce;SOf;93|) %))
             (QSETREFV % 230
                       (CONS (|dispatchFunction| |FSC2-;retractIfCan;SU;94|)
                             %))
             (COND
              ((|testBitVector| |pv$| 11)
               (QSETREFV % 237
                         (CONS (|dispatchFunction| |FSC2-;eval;SLLLS;95|) %))))
             (QSETREFV % 235
                       (CONS (|dispatchFunction| |FSC2-;differentiate;SSS;96|)
                             %))
             (QSETREFV % 233
                       (CONS (|dispatchFunction| |FSC2-;eval;SLLS;97|) %))
             (QSETREFV % 234
                       (CONS (|dispatchFunction| |FSC2-;subst;SLLS;98|) %))
             (QSETREFV % 319
                       (CONS (|dispatchFunction| |FSC2-;convert;FS;100|) %))
             (QSETREFV % 232
                       (CONS (|dispatchFunction| |FSC2-;retractIfCan;SU;101|)
                             %))
             (QSETREFV % 323
                       (CONS (|dispatchFunction| |FSC2-;retractIfCan;SU;102|)
                             %))
             (QSETREFV % 328
                       (CONS (|dispatchFunction| |FSC2-;coerce;PS;103|) %))
             (COND
              ((|testBitVector| |pv$| 1)
               (PROGN
                (QSETREFV % 333
                          (CONS (|dispatchFunction| |FSC2-;coerce;FS;104|) %))
                (QSETREFV % 258
                          (CONS (|dispatchFunction| |FSC2-;isMult;SU;105|)
                                %)))))
             (COND
              ((|HasCategory| (|SparseMultivariatePolynomial| |#2| |#3|)
                              '(|ConvertibleTo| (|Pattern| (|Integer|))))
               (QSETREFV % 252
                         (CONS (|dispatchFunction| |FSC2-;convert;SP;106|)
                               %))))
             (COND
              ((|HasCategory| (|SparseMultivariatePolynomial| |#2| |#3|)
                              '(|ConvertibleTo| (|Pattern| (|Float|))))
               (QSETREFV % 255
                         (CONS (|dispatchFunction| |FSC2-;convert;SP;107|)
                               %)))))))
          %))) 

(MAKEPROP '|FunctionSpace2&| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) 'ODD 'EVEN 'SPECIALDIFF (|BasicOperator|)
              (|Symbol|) (|CommonOperators|) (0 . |operator|) '|opdiff|
              '|opquote| (|Union| 7 '#1="failed") (5 . |retractIfCan|)
              (|Boolean|) |FSC2-;ground?;SB;1| (10 . |retract|)
              |FSC2-;ground;SR;2| (15 . |kernel|) (20 . |coerce|)
              |FSC2-;coerce;SS;3| (25 . |retract|) (|Union| 13 '"failed")
              (30 . |symbolIfCan|) |FSC2-;retract;SS;4| (|List| %)
              (35 . |applyQuote|) |FSC2-;applyQuote;S2S;5|
              |FSC2-;applyQuote;S3S;6| |FSC2-;applyQuote;S4S;7|
              |FSC2-;applyQuote;S5S;8| (41 . |coerce|) (46 . |elt|)
              |FSC2-;applyQuote;SLS;9| (52 . |has?|) (58 . |is?|)
              |FSC2-;belong?;BoB;10| (64 . |operator|) (|List| 6)
              (69 . |argument|) (74 . |kernel|) (80 . |name|) (|String|)
              (85 . |string|) |FSC2-;operator;2Bo;12| (|InputForm|)
              (90 . |convert|) (95 . |convert|) (100 . |third|)
              (105 . |retractIfCan|) (110 . |new|) (114 . |second|)
              (119 . |eval|) (126 . =) (132 . |convert|) (|List| 12)
              (137 . |eval|) (145 . |eval|) (|Mapping| 6 6)
              (|MakeUnaryCompiledFunction| 6 6 6) (153 . |compiledFunction|)
              (|Mapping| % %) (|List| 67) (159 . |eval|) (166 . |eval|)
              (|None|) (174 . |setProperty|) (|List| 8) (181 . |tower|)
              (|List| 13) |FSC2-;variables;LL;17| (186 . |variables|)
              |FSC2-;variables;SL;18| (|Union| 8 '#1#) (191 . |retractIfCan|)
              |FSC2-;retractIfCan;SU;19| '|gendiff| (|NonNegativeInteger|)
              (196 . |characteristic|) (200 . |characteristic|)
              (|SparseMultivariatePolynomial| 7 8) (204 . |coerce|)
              (209 . |coerce|) (214 . |coerce|) (219 . |numer|)
              (224 . |numerator|) (229 . |first|) (|List| 83) (|Mapping| % 31)
              (|List| 94) (234 . |eval|) (242 . |eval|) (250 . |eval|)
              (258 . |new|) (264 . |eval|) (271 . |unary?|)
              (276 . |leadingCoefficient|) (281 . |Zero|) (285 . |smaller?|)
              (291 . -) (296 . |elt|) (|ExpressionSpace2&| 6 8) (302 . |elt|)
              (308 . |elt|) (314 . |eval|) (322 . |mainVariable|)
              (|SparseUnivariatePolynomial| %) (327 . |univariate|)
              (|SparseUnivariatePolynomial| 6) (|Mapping| 6 86)
              (|SparseUnivariatePolynomial| 86)
              (|SparseUnivariatePolynomialFunctions2| 86 6) (333 . |map|)
              (|Integer|) (339 . |position|) (345 . |elt|) (351 . |Zero|)
              (|Mapping| 6 44) (|List| 123) (355 . |elt|) (361 . |elt|)
              (367 . |Zero|) (371 . ~=) (377 . |degree|) (382 . ^)
              (388 . |leadingCoefficient|) (393 . *) (399 . +)
              (405 . |reductum|) (|OutputForm|) (410 . |coerce|) (415 . |is?|)
              (|List| 135) (421 . |position|) (427 . |setelt!|)
              (434 . |coerce|) (439 . |One|) (443 . |coerce|) (448 . |hconcat|)
              (454 . |position|) (|Union| 71 '"failed") (460 . |property|)
              (466 . |sub|) (472 . |differentiate|) (478 . |prefix|)
              (484 . |copy|) (489 . |elt|) (495 . |setelt!|) (|List| 119)
              (502 . |member?|) (508 . |first|) (514 . |rest|) (520 . |concat|)
              (526 . |differentiate|) (|Union| 124 '"failed")
              (|BasicOperatorFunctions1| 6) (532 . |derivative|) (|Equation| 6)
              (537 . =) (|Equation| %) (543 . |subst|) (549 . |kernel|)
              (555 . ~=) (561 . ~=) (|Polynomial| 7) (567 . |coerce|)
              (572 . |differentiate|) (578 . |retract|) (|Mapping| 7 7)
              (583 . |map|) (589 . |variables|) (594 . |differentiate|)
              (600 . |coerce|) (|Mapping| 6 13) (|Mapping| 6 7)
              (|PolynomialCategoryLifting| (|IndexedExponents| 13) 13 7 170 6)
              (605 . |map|) (612 . |coerce|) (|Union| 20 '"failed")
              (|UserDefinedPartialOrdering| 13) (617 . |less?|) (623 . <)
              (629 . |retractIfCan|) (634 . |coerce|) (639 . |userOrdered?|)
              (643 . |coerce|) (648 . |outputForm|) (654 . |subst|)
              (|Mapping| 6 8) (|ListToMap| 8 6) (661 . |match|)
              (|PolynomialCategoryLifting| (|IndexedExponents| 8) 8 7 86 6)
              (669 . |map|) (676 . |eval|) (683 . |map|) (689 . |tower|)
              (694 . |setIntersection|) (700 . |empty?|) (705 . |coerce|)
              (|Mapping| 170 8) (|Mapping| 170 7)
              (|PolynomialCategoryLifting| (|IndexedExponents| 8) 8 7 86 170)
              (710 . |map|) (|Record| (|:| |var| 8) (|:| |exponent| 119))
              (|Union| 209 '#2="failed") (717 . |isExpt|) (722 . |isExpt|)
              (728 . |is?|) (734 . |isExpt|) (740 . |degree|)
              (745 . |reductum|) (750 . |leadingCoefficient|) (755 . |zero?|)
              (|Union| 119 '#1#) (760 . |retractIfCan|) (765 . |evaluate|)
              (771 . =) (777 . =) (783 . =) (789 . |mainKernel|)
              (794 . |kernels|) (799 . |retract|) (804 . |retract|)
              (809 . |retract|) (814 . |retractIfCan|) (|Union| 170 '"failed")
              (819 . |retractIfCan|) (824 . |eval|) (831 . |subst|)
              (838 . |differentiate|) (844 . |coerce|) (849 . |eval|)
              (|Union| 31 '#3="failed") (857 . |isPlus|) (862 . |isPlus|)
              (867 . |isTimes|) (872 . |isTimes|)
              (|Record| (|:| |var| 8) (|:| |exponent| 83)) (|Union| 243 '#3#)
              (877 . |isExpt|) (882 . |isExpt|)
              (|Record| (|:| |val| %) (|:| |exponent| 119))
              (|Union| 247 '#4="failed") (887 . |isPower|) (|Pattern| 119)
              (892 . |convert|) (897 . |convert|) (|Pattern| (|Float|))
              (902 . |convert|) (907 . |convert|)
              (|Record| (|:| |coef| 119) (|:| |var| 8))
              (|Union| 256 '#5="failed") (912 . |isMult|) (917 . |coerce|)
              (922 . *)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 8) 8 7
                                                     86 6)
              (928 . |mainVariable|) (933 . |variables|) (|Fraction| 114)
              (938 . |univariate|) (|Fraction| 112) (944 . |univariate|)
              (|Union| 44 '"failed") (950 . |isPlus|) (955 . |isTimes|)
              (960 . |isExpt|) (|Record| (|:| |val| 6) (|:| |exponent| 119))
              (|Union| 272 '"failed") (965 . |isPower|) (970 . |denom|)
              (975 . |denominator|) (|Fraction| 7) (980 . |numer|)
              (985 . |denom|) (990 . /) (996 . |coerce|) (|Fraction| 170)
              (1001 . |numer|) (1006 . |coerce|) (1011 . |denom|) (1016 . /)
              (1022 . |coerce|) (|Polynomial| 277) (|Fraction| 288)
              (1027 . |numer|) (1032 . |coerce|) (1037 . |denom|)
              (1042 . |coerce|) (1047 . |retract|) (1052 . |retract|)
              (1057 . /) (1063 . |retract|) (|Union| % '"failed")
              (1068 . |exquo|) (1074 . |kernels|) (1079 . =) (1085 . |sort!|)
              (1090 . |algtower|) (1095 . |algtower|) (1100 . |algtower|)
              (1105 . |One|) (1109 . =) (1115 . /) (1121 . -) (1127 . ^)
              (1133 . |paren|) (|Factored| 6) (1138 . |unit|)
              (|Union| '"nil" '"sqfr" '"irred" '"prime")
              (|Record| (|:| |flag| 314) (|:| |factor| 6) (|:| |exponent| 83))
              (|List| 315) (1143 . |factorList|) (|Factored| %)
              (1148 . |convert|) (|Union| 282 '#1#) (1153 . |retractIfCan|)
              (1158 . |retractIfCan|) (1163 . |retractIfCan|) (1168 . |coerce|)
              (|Mapping| 6 277)
              (|PolynomialCategoryLifting| (|IndexedExponents| 13) 13 277 288
                                           6)
              (1173 . |map|) (1180 . |coerce|) (|Fraction| 119)
              (1185 . |numer|) (1190 . |coerce|) (1195 . |denom|)
              (1200 . |coerce|) (1205 . |exquo|) (1211 . /) (1217 . /)
              (|List| 165) (|Union| 329 '#1#) (|PositiveInteger|))
           '#(|variables| 1223 |univariate| 1233 |subst| 1239 |retractIfCan|
              1246 |retract| 1266 |operator| 1286 |numerator| 1291 |mainKernel|
              1296 |kernels| 1301 |isTimes| 1306 |isPower| 1311 |isPlus| 1316
              |isMult| 1321 |isExpt| 1326 |ground?| 1343 |ground| 1348 |eval|
              1353 |elt| 1415 |differentiate| 1421 |denominator| 1427 |convert|
              1432 |coerce| 1447 |characteristic| 1492 |belong?| 1496
              |applyQuote| 1501 |algtower| 1537 * 1547)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((|convert| ((|InputForm|) |#1|)) T)
                                   '((* (|#1| |#1| |#1|)) T)
                                   '((* (|#1| (|PositiveInteger|) |#1|)) T)
                                   '((* (|#1| (|NonNegativeInteger|) |#1|)) T)
                                   '((* (|#1| (|Integer|) |#1|)) T)
                                   '((|coerce| (|#1| (|Integer|))) T)
                                   '((|coerce| (|#1| (|Polynomial| |#2|))) T)
                                   '((|retractIfCan|
                                      ((|Union| (|Polynomial| |#2|) #1#) |#1|))
                                     T)
                                   '((|retract| ((|Polynomial| |#2|) |#1|)) T)
                                   '((|characteristic|
                                      ((|NonNegativeInteger|)))
                                     T)
                                   '((|differentiate| (|#1| |#1| (|Symbol|)))
                                     T)
                                   '((|differentiate|
                                      (|#1| |#1| (|List| (|Symbol|))))
                                     T)
                                   '((|differentiate|
                                      (|#1| |#1| (|Symbol|)
                                       (|NonNegativeInteger|)))
                                     T)
                                   '((|differentiate|
                                      (|#1| |#1| (|List| (|Symbol|))
                                       (|List| (|NonNegativeInteger|))))
                                     T)
                                   '((* (|#1| |#1| |#2|)) T)
                                   '((* (|#1| |#1| (|Integer|))) T)
                                   '((* (|#1| |#2| |#1|)) T)
                                   '((|coerce| (|#1| |#1|)) T)
                                   '((* (|#1| (|Fraction| (|Integer|)) |#1|))
                                     T)
                                   '((* (|#1| |#1| (|Fraction| (|Integer|))))
                                     T)
                                   '((|coerce| (|#1| (|Fraction| (|Integer|))))
                                     T)
                                   '((|coerce|
                                      (|#1| (|Fraction| (|Polynomial| |#2|))))
                                     T)
                                   '((|retractIfCan|
                                      ((|Union|
                                        (|Fraction| (|Polynomial| |#2|)) #1#)
                                       |#1|))
                                     T)
                                   '((|retract|
                                      ((|Fraction| (|Polynomial| |#2|)) |#1|))
                                     T)
                                   '((|retractIfCan|
                                      ((|Union| (|Fraction| (|Integer|)) #1#)
                                       |#1|))
                                     T)
                                   '((|retract|
                                      ((|Fraction| (|Integer|)) |#1|))
                                     T)
                                   '((|univariate|
                                      ((|Fraction|
                                        (|SparseUnivariatePolynomial| |#1|))
                                       |#1| |#3|))
                                     T)
                                   '((|coerce|
                                      (|#1|
                                       (|Fraction|
                                        (|Polynomial| (|Fraction| |#2|)))))
                                     T)
                                   '((|coerce|
                                      (|#1| (|Polynomial| (|Fraction| |#2|))))
                                     T)
                                   '((|coerce| (|#1| (|Fraction| |#2|))) T)
                                   '((|denominator| (|#1| |#1|)) T)
                                   '((|convert| (|#1| (|Factored| |#1|))) T)
                                   '((|algtower| ((|List| |#3|) (|List| |#1|)))
                                     T)
                                   '((|algtower| ((|List| |#3|) |#1|)) T)
                                   '((|eval|
                                      (|#1| |#1| (|Symbol|)
                                       (|NonNegativeInteger|)
                                       (|Mapping| |#1| |#1|)))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|Symbol|)
                                       (|NonNegativeInteger|)
                                       (|Mapping| |#1| (|List| |#1|))))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|List| (|Symbol|))
                                       (|List| (|NonNegativeInteger|))
                                       (|List|
                                        (|Mapping| |#1| (|List| |#1|)))))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|List| (|Symbol|))
                                       (|List| (|NonNegativeInteger|))
                                       (|List| (|Mapping| |#1| |#1|))))
                                     T)
                                   '((|isPower|
                                      ((|Union|
                                        (|Record| (|:| |val| |#1|)
                                                  (|:| |exponent| (|Integer|)))
                                        #4#)
                                       |#1|))
                                     T)
                                   '((|isExpt|
                                      ((|Union|
                                        (|Record| (|:| |var| |#3|)
                                                  (|:| |exponent| (|Integer|)))
                                        "failed")
                                       |#1| (|Symbol|)))
                                     T)
                                   '((|isExpt|
                                      ((|Union|
                                        (|Record| (|:| |var| |#3|)
                                                  (|:| |exponent| (|Integer|)))
                                        "failed")
                                       |#1| (|BasicOperator|)))
                                     T)
                                   '((|numerator| (|#1| |#1|)) T)
                                   '((|coerce|
                                      (|#1|
                                       (|SparseMultivariatePolynomial| |#2|
                                                                       |#3|)))
                                     T)
                                   '((|isMult|
                                      ((|Union|
                                        (|Record| (|:| |coef| (|Integer|))
                                                  (|:| |var| |#3|))
                                        #5#)
                                       |#1|))
                                     T)
                                   '((|isPlus|
                                      ((|Union| (|List| |#1|) "failed") |#1|))
                                     T)
                                   '((|isExpt|
                                      ((|Union|
                                        (|Record| (|:| |var| |#3|)
                                                  (|:| |exponent| (|Integer|)))
                                        #2#)
                                       |#1|))
                                     T)
                                   '((|isTimes|
                                      ((|Union| (|List| |#1|) "failed") |#1|))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|List| (|BasicOperator|))
                                       (|List| |#1|) (|Symbol|)))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|BasicOperator|) |#1|
                                       (|Symbol|)))
                                     T)
                                   '((|applyQuote|
                                      (|#1| (|Symbol|) (|List| |#1|)))
                                     T)
                                   '((|applyQuote|
                                      (|#1| (|Symbol|) |#1| |#1| |#1| |#1|))
                                     T)
                                   '((|applyQuote|
                                      (|#1| (|Symbol|) |#1| |#1| |#1|))
                                     T)
                                   '((|applyQuote| (|#1| (|Symbol|) |#1| |#1|))
                                     T)
                                   '((|applyQuote| (|#1| (|Symbol|) |#1|)) T)
                                   '((|variables|
                                      ((|List| (|Symbol|)) (|List| |#1|)))
                                     T)
                                   '((|variables| ((|List| (|Symbol|)) |#1|))
                                     T)
                                   '((|ground| (|#2| |#1|)) T)
                                   '((|ground?| ((|Boolean|) |#1|)) T)
                                   '((|coerce| (|#1| |#2|)) T)
                                   '((|retractIfCan| ((|Union| |#2| #1#) |#1|))
                                     T)
                                   '((|retract| (|#2| |#1|)) T)
                                   '((|retract| ((|Integer|) |#1|)) T)
                                   '((|retractIfCan|
                                      ((|Union| (|Integer|) #1#) |#1|))
                                     T)
                                   '((|convert| ((|Pattern| (|Float|)) |#1|))
                                     T)
                                   '((|convert| ((|Pattern| (|Integer|)) |#1|))
                                     T)
                                   '((|coerce| (|#1| (|Symbol|))) T)
                                   '((|retractIfCan|
                                      ((|Union| (|Symbol|) #1#) |#1|))
                                     T)
                                   '((|retract| ((|Symbol|) |#1|)) T)
                                   '((|eval|
                                      (|#1| |#1| (|BasicOperator|)
                                       (|Mapping| |#1| |#1|)))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|BasicOperator|)
                                       (|Mapping| |#1| (|List| |#1|))))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|List| (|BasicOperator|))
                                       (|List|
                                        (|Mapping| |#1| (|List| |#1|)))))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|List| (|BasicOperator|))
                                       (|List| (|Mapping| |#1| |#1|))))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|Symbol|)
                                       (|Mapping| |#1| |#1|)))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|Symbol|)
                                       (|Mapping| |#1| (|List| |#1|))))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|List| (|Symbol|))
                                       (|List|
                                        (|Mapping| |#1| (|List| |#1|)))))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|List| (|Symbol|))
                                       (|List| (|Mapping| |#1| |#1|))))
                                     T)
                                   '((|belong?|
                                      ((|Boolean|) (|BasicOperator|)))
                                     T)
                                   '((|operator|
                                      ((|BasicOperator|) (|BasicOperator|)))
                                     T)
                                   '((|kernels| ((|List| |#3|) (|List| |#1|)))
                                     T)
                                   '((|kernels| ((|List| |#3|) |#1|)) T)
                                   '((|mainKernel|
                                      ((|Union| |#3| "failed") |#1|))
                                     T)
                                   '((|subst|
                                      (|#1| |#1| (|List| |#3|) (|List| |#1|)))
                                     T)
                                   '((|subst|
                                      (|#1| |#1| (|List| (|Equation| |#1|))))
                                     T)
                                   '((|subst| (|#1| |#1| (|Equation| |#1|))) T)
                                   '((|elt|
                                      (|#1| (|BasicOperator|) (|List| |#1|)))
                                     T)
                                   '((|elt|
                                      (|#1| (|BasicOperator|) |#1| |#1| |#1|
                                       |#1| |#1| |#1| |#1| |#1| |#1|))
                                     T)
                                   '((|elt|
                                      (|#1| (|BasicOperator|) |#1| |#1| |#1|
                                       |#1| |#1| |#1| |#1| |#1|))
                                     T)
                                   '((|elt|
                                      (|#1| (|BasicOperator|) |#1| |#1| |#1|
                                       |#1| |#1| |#1| |#1|))
                                     T)
                                   '((|elt|
                                      (|#1| (|BasicOperator|) |#1| |#1| |#1|
                                       |#1| |#1| |#1|))
                                     T)
                                   '((|elt|
                                      (|#1| (|BasicOperator|) |#1| |#1| |#1|
                                       |#1| |#1|))
                                     T)
                                   '((|elt|
                                      (|#1| (|BasicOperator|) |#1| |#1| |#1|
                                       |#1|))
                                     T)
                                   '((|elt|
                                      (|#1| (|BasicOperator|) |#1| |#1| |#1|))
                                     T)
                                   '((|elt| (|#1| (|BasicOperator|) |#1| |#1|))
                                     T)
                                   '((|elt| (|#1| (|BasicOperator|) |#1|)) T)
                                   '((|eval|
                                      (|#1| |#1| (|List| |#1|) (|List| |#1|)))
                                     T)
                                   '((|eval| (|#1| |#1| |#1| |#1|)) T)
                                   '((|eval| (|#1| |#1| (|Equation| |#1|))) T)
                                   '((|eval|
                                      (|#1| |#1| (|List| (|Equation| |#1|))))
                                     T)
                                   '((|eval|
                                      (|#1| |#1| (|List| |#3|) (|List| |#1|)))
                                     T)
                                   '((|eval| (|#1| |#1| |#3| |#1|)) T)
                                   '((|coerce| (|#1| |#3|)) T)
                                   '((|retractIfCan| ((|Union| |#3| #1#) |#1|))
                                     T)
                                   '((|retract| (|#3| |#1|)) T)
                                   '((|coerce| ((|OutputForm|) |#1|)) T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 336
                                            '(1 14 12 13 15 1 6 18 0 19 1 6 7 0
                                              22 1 8 0 13 24 1 6 0 8 25 1 6 8 0
                                              27 1 8 28 0 29 2 6 0 13 31 32 1 6
                                              0 13 37 2 6 0 12 31 38 2 12 20 0
                                              13 40 2 12 20 0 13 41 1 8 12 0 43
                                              1 8 44 0 45 2 6 0 12 31 46 1 12
                                              13 0 47 1 13 48 0 49 1 13 51 0 52
                                              1 51 0 31 53 1 44 6 0 54 1 6 28 0
                                              55 0 13 0 56 1 44 6 0 57 3 6 0 0
                                              8 0 58 2 6 20 0 0 59 1 6 51 0 60
                                              4 6 0 0 61 31 13 62 4 0 0 0 12 0
                                              13 63 2 65 64 6 13 66 3 6 0 0 61
                                              68 69 4 0 0 0 61 31 13 70 3 12 0
                                              0 13 71 72 1 6 73 31 74 1 6 75 31
                                              77 1 6 79 0 80 0 7 83 84 0 0 83
                                              85 1 86 0 8 87 1 6 0 86 88 1 0 0
                                              8 89 1 6 86 0 90 1 0 0 0 91 1 44
                                              6 0 92 4 6 0 0 75 93 95 96 4 0 0
                                              0 13 83 67 97 4 0 0 0 13 83 94 98
                                              2 93 0 83 83 99 3 0 0 0 75 95 100
                                              1 12 20 0 101 1 86 7 0 102 0 7 0
                                              103 2 7 20 0 0 104 1 6 0 0 105 2
                                              6 0 12 0 106 2 107 0 12 31 108 2
                                              0 0 12 31 109 4 0 0 0 75 93 68
                                              110 1 86 79 0 111 2 86 112 0 8
                                              113 2 117 114 115 116 118 2 75
                                              119 13 0 120 2 114 6 0 6 121 0 6
                                              0 122 2 124 123 0 119 125 2 93 83
                                              0 119 126 0 114 0 127 2 114 20 0
                                              0 128 1 114 83 0 129 2 6 0 0 83
                                              130 1 114 6 0 131 2 6 0 0 0 132 2
                                              6 0 0 0 133 1 114 0 0 134 1 6 135
                                              0 136 2 8 20 0 12 137 2 138 119
                                              135 0 139 3 138 135 0 119 135 140
                                              1 13 135 0 141 0 6 0 142 1 119
                                              135 0 143 2 135 0 0 0 144 2 44
                                              119 6 0 145 2 12 146 0 13 147 2
                                              135 0 0 0 148 2 135 0 0 83 149 2
                                              135 0 0 31 150 1 44 0 0 151 2 44
                                              6 0 119 152 3 44 6 0 119 6 153 2
                                              154 20 119 0 155 2 44 0 0 83 156
                                              2 44 0 0 83 157 2 44 0 0 0 158 2
                                              6 0 0 13 159 1 161 160 12 162 2
                                              163 0 6 6 164 2 6 0 0 165 166 2 6
                                              0 12 0 167 2 83 20 0 0 168 2 6 20
                                              0 0 169 1 170 0 7 171 2 170 0 0
                                              13 172 1 170 7 0 173 2 86 0 174 0
                                              175 1 86 73 0 176 2 86 0 0 8 177
                                              1 6 0 7 178 3 181 6 179 180 170
                                              182 1 0 0 170 183 2 185 184 13 13
                                              186 2 8 20 0 0 187 1 86 18 0 188
                                              1 7 135 0 189 0 185 20 190 1 8
                                              135 0 191 2 114 135 0 135 192 3 6
                                              0 0 73 31 193 4 195 6 73 44 8 194
                                              196 3 197 6 194 180 86 198 3 6 0
                                              0 73 31 199 2 6 0 67 8 200 1 6 73
                                              0 201 2 73 0 0 0 202 1 73 20 0
                                              203 1 170 0 13 204 3 207 170 205
                                              206 86 208 1 6 210 0 211 2 0 210
                                              0 12 212 2 8 20 0 13 213 2 0 210
                                              0 13 214 1 116 83 0 215 1 116 0 0
                                              216 1 116 86 0 217 1 86 20 0 218
                                              1 7 219 0 220 2 161 12 12 123 221
                                              2 12 20 0 0 222 2 154 20 0 0 223
                                              2 44 20 0 0 224 1 0 79 0 225 1 0
                                              73 0 226 1 86 7 0 227 1 0 7 0 228
                                              1 0 170 0 229 1 0 18 0 230 1 0
                                              231 0 232 3 0 0 0 73 31 233 3 0 0
                                              0 73 31 234 2 0 0 0 13 235 1 0
                                              135 0 236 4 0 0 0 75 93 95 237 1
                                              86 238 0 239 1 0 238 0 240 1 86
                                              238 0 241 1 0 238 0 242 1 86 244
                                              0 245 1 0 210 0 246 1 0 248 0 249
                                              1 86 250 0 251 1 0 250 0 252 1 86
                                              253 0 254 1 0 253 0 255 1 0 257 0
                                              258 1 86 0 7 259 2 0 0 7 0 260 1
                                              261 79 6 262 1 261 73 6 263 2 261
                                              264 6 8 265 2 0 266 0 8 267 1 261
                                              268 6 269 1 261 268 6 270 1 261
                                              210 6 271 1 261 273 6 274 1 6 86
                                              0 275 1 0 0 0 276 1 277 7 0 278 1
                                              277 7 0 279 2 6 0 86 86 280 1 0 0
                                              277 281 1 282 170 0 283 1 6 0 170
                                              284 1 282 170 0 285 2 6 0 0 0 286
                                              1 0 0 282 287 1 289 288 0 290 1 6
                                              0 288 291 1 289 288 0 292 1 0 0
                                              289 293 1 6 282 0 294 1 282 170 0
                                              295 2 282 0 170 170 296 1 0 282 0
                                              297 2 7 298 0 0 299 1 6 73 0 300
                                              2 8 20 0 0 301 1 73 0 0 302 1 0
                                              73 31 303 1 6 73 31 304 1 0 73 0
                                              305 0 86 0 306 2 86 20 0 0 307 2
                                              135 0 0 0 308 2 6 0 0 0 309 2 6 0
                                              0 119 310 1 6 0 0 311 1 312 6 0
                                              313 1 312 316 0 317 1 0 0 318 319
                                              1 6 320 0 321 1 282 231 0 322 1 0
                                              320 0 323 1 6 0 277 324 3 326 6
                                              179 325 288 327 1 0 0 288 328 1
                                              329 119 0 330 1 86 0 119 331 1
                                              329 119 0 332 1 0 0 329 333 2 119
                                              298 0 0 334 2 250 0 0 0 335 2 253
                                              0 0 0 336 1 0 75 0 78 1 0 75 31
                                              76 2 0 266 0 8 267 3 0 0 0 73 31
                                              234 1 0 28 0 81 1 0 18 0 230 1 0
                                              320 0 323 1 0 231 0 232 1 0 13 0
                                              30 1 0 7 0 228 1 0 282 0 297 1 0
                                              170 0 229 1 0 12 12 50 1 0 0 0 91
                                              1 0 79 0 225 1 0 73 0 226 1 0 238
                                              0 242 1 0 248 0 249 1 0 238 0 240
                                              1 0 257 0 258 1 0 210 0 246 2 0
                                              210 0 12 212 2 0 210 0 13 214 1 0
                                              20 0 21 1 0 7 0 23 3 0 0 0 73 31
                                              233 3 0 0 0 75 95 100 4 0 0 0 12
                                              0 13 63 4 0 0 0 61 31 13 70 4 0 0
                                              0 75 93 68 110 4 0 0 0 13 83 94
                                              98 4 0 0 0 75 93 95 237 4 0 0 0
                                              13 83 67 97 2 0 0 12 31 109 2 0 0
                                              0 13 235 1 0 0 0 276 1 0 253 0
                                              255 1 0 250 0 252 1 0 0 318 319 1
                                              0 135 0 236 1 0 0 8 89 1 0 0 13
                                              26 1 0 0 277 281 1 0 0 289 293 1
                                              0 0 288 328 1 0 0 329 333 1 0 0
                                              282 287 1 0 0 170 183 0 0 83 85 1
                                              0 20 12 42 2 0 0 13 0 33 3 0 0 13
                                              0 0 34 5 0 0 13 0 0 0 0 36 4 0 0
                                              13 0 0 0 35 2 0 0 13 31 39 1 0 73
                                              0 305 1 0 73 31 303 2 0 0 7 0
                                              260)))))
           '|lookupComplete|)) 
