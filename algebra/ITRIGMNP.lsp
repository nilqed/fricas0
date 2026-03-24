
(SDEFUN |ITRIGMNP;GR2F| ((|g| (|Complex| R)) (% (F)))
        (SPADCALL (SPADCALL (SPADCALL |g| (QREFELT % 11)) (QREFELT % 12))
                  (SPADCALL
                   (SPADCALL (SPADCALL (|spadConstant| % 13) (QREFELT % 14))
                             (QREFELT % 15))
                   (SPADCALL (SPADCALL |g| (QREFELT % 16)) (QREFELT % 12))
                   (QREFELT % 17))
                  (QREFELT % 18))) 

(SDEFUN |ITRIGMNP;FG2F;FGF;2| ((|f| (FG)) (% (F)))
        (SPADCALL (|ITRIGMNP;PG2F| (SPADCALL |f| (QREFELT % 20)) %)
                  (|ITRIGMNP;PG2F| (SPADCALL |f| (QREFELT % 21)) %)
                  (QREFELT % 22))) 

(SDEFUN |ITRIGMNP;F2FG;FFG;3| ((|f| (F)) (% (FG)))
        (SPADCALL (|ITRIGMNP;PF2FG| (SPADCALL |f| (QREFELT % 25)) %)
                  (|ITRIGMNP;PF2FG| (SPADCALL |f| (QREFELT % 26)) %)
                  (QREFELT % 27))) 

(SDEFUN |ITRIGMNP;GF2FG;CFG;4| ((|f| (|Complex| F)) (% (FG)))
        (SPADCALL (SPADCALL (SPADCALL |f| (QREFELT % 30)) (QREFELT % 28))
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL (|spadConstant| % 31) (|spadConstant| % 33)
                              (QREFELT % 34))
                    (QREFELT % 35))
                   (SPADCALL (SPADCALL |f| (QREFELT % 36)) (QREFELT % 28))
                   (QREFELT % 37))
                  (QREFELT % 38))) 

(SDEFUN |ITRIGMNP;GR2GF| ((|gr| (|Complex| R)) (% (|Complex| F)))
        (SPADCALL (SPADCALL (SPADCALL |gr| (QREFELT % 11)) (QREFELT % 12))
                  (SPADCALL (SPADCALL |gr| (QREFELT % 16)) (QREFELT % 12))
                  (QREFELT % 40))) 

(SDEFUN |ITRIGMNP;KG2F| ((|k| (|Kernel| FG)) (% (F)))
        (SPROG ((#1=#:G57 NIL) (|a| NIL) (#2=#:G56 NIL))
               (SEQ
                (SPADCALL
                 (SPADCALL (SPADCALL |k| (QREFELT % 44)) (QREFELT % 45))
                 (PROGN
                  (LETT #2# NIL)
                  (SEQ (LETT |a| NIL) (LETT #1# (SPADCALL |k| (QREFELT % 47)))
                       G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |a| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT #2# (CONS (SPADCALL |a| (QREFELT % 23)) #2#))))
                       (LETT #1# (CDR #1#)) (GO G190) G191
                       (EXIT (NREVERSE #2#))))
                 (QREFELT % 49))))) 

(SDEFUN |ITRIGMNP;KF2FG| ((|k| (|Kernel| F)) (% (FG)))
        (SPROG
         ((#1=#:G68 NIL) (|a| NIL) (#2=#:G67 NIL) (|op| (|BasicOperator|))
          (|akl| (|List| F)))
         (SEQ (LETT |akl| (SPADCALL |k| (QREFELT % 52)))
              (LETT |op| (SPADCALL |k| (QREFELT % 53)))
              (COND
               ((SPADCALL |op| '|nthRoot| (QREFELT % 56))
                (COND
                 ((SPADCALL (SPADCALL |akl| 1 (QREFELT % 58))
                            (SPADCALL (|spadConstant| % 13) (QREFELT % 14))
                            (QREFELT % 59))
                  (COND
                   ((SPADCALL (SPADCALL |akl| 2 (QREFELT % 58))
                              (SPADCALL 2 (QREFELT % 60)) (QREFELT % 59))
                    (EXIT (QREFELT % 41))))))))
              (EXIT
               (SPADCALL (SPADCALL |op| (QREFELT % 61))
                         (PROGN
                          (LETT #2# NIL)
                          (SEQ (LETT |a| NIL) (LETT #1# |akl|) G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |a| (CAR #1#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #2#
                                       (CONS (SPADCALL |a| (QREFELT % 28))
                                             #2#))))
                               (LETT #1# (CDR #1#)) (GO G190) G191
                               (EXIT (NREVERSE #2#))))
                         (QREFELT % 62)))))) 

(SDEFUN |ITRIGMNP;ker2explogs|
        ((|k| (|Kernel| FG)) (|l| (|List| (|Kernel| FG))) (% (FG)))
        (SPROG
         ((|e| (FG)) (|z| (FG)) (|args| (|List| FG)) (#1=#:G86 NIL) (|a| NIL)
          (#2=#:G85 NIL) (|kf| (FG)))
         (SEQ (LETT |kf| (SPADCALL |k| (QREFELT % 64)))
              (EXIT
               (COND
                ((NULL
                  (LETT |args|
                        (PROGN
                         (LETT #2# NIL)
                         (SEQ (LETT |a| NIL)
                              (LETT #1# (SPADCALL |k| (QREFELT % 47))) G190
                              (COND
                               ((OR (ATOM #1#)
                                    (PROGN (LETT |a| (CAR #1#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #2#
                                      (CONS (SPADCALL |a| |l| (QREFELT % 66))
                                            #2#))))
                              (LETT #1# (CDR #1#)) (GO G190) G191
                              (EXIT (NREVERSE #2#))))))
                 |kf|)
                (#3='T
                 (SEQ (LETT |z| (|SPADfirst| |args|))
                      (EXIT
                       (COND
                        ((SPADCALL |k| '|tan| (QREFELT % 67))
                         (SEQ
                          (LETT |e|
                                (COND
                                 ((SPADCALL |k| |l| (QREFELT % 68))
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL (QREFELT % 41) |z|
                                              (QREFELT % 37))
                                    (QREFELT % 69))
                                   2 (QREFELT % 70)))
                                 (#3#
                                  (SPADCALL
                                   (SPADCALL
                                    (SPADCALL 2 (QREFELT % 41) (QREFELT % 72))
                                    |z| (QREFELT % 37))
                                   (QREFELT % 69)))))
                          (EXIT
                           (SPADCALL
                            (SPADCALL
                             (SPADCALL (QREFELT % 41)
                                       (SPADCALL |e| (|spadConstant| % 73)
                                                 (QREFELT % 74))
                                       (QREFELT % 37))
                             (SPADCALL |e| (|spadConstant| % 73)
                                       (QREFELT % 38))
                             (QREFELT % 27))
                            (QREFELT % 75)))))
                        ((SPADCALL |k| '|atan| (QREFELT % 67))
                         (SPADCALL
                          (SPADCALL (QREFELT % 41)
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL (|spadConstant| % 73)
                                                (SPADCALL (QREFELT % 41) |z|
                                                          (QREFELT % 37))
                                                (QREFELT % 74))
                                      (SPADCALL (|spadConstant| % 73)
                                                (SPADCALL (QREFELT % 41) |z|
                                                          (QREFELT % 37))
                                                (QREFELT % 38))
                                      (QREFELT % 27))
                                     (QREFELT % 76))
                                    (QREFELT % 37))
                          (SPADCALL 2 (QREFELT % 77)) (QREFELT % 27)))
                        (#3#
                         (SPADCALL (SPADCALL |k| (QREFELT % 44)) |args|
                                   (QREFELT % 62)))))))))))) 

(SDEFUN |ITRIGMNP;trigs2explogs;FGLFG;9|
        ((|f| (FG)) (|l| (|List| (|Kernel| FG))) (% (FG)))
        (SPADCALL (|ITRIGMNP;smp2explogs| (SPADCALL |f| (QREFELT % 20)) |l| %)
                  (|ITRIGMNP;smp2explogs| (SPADCALL |f| (QREFELT % 21)) |l| %)
                  (QREFELT % 27))) 

(SDEFUN |ITRIGMNP;ker2trigs_error|
        ((|op| (|BasicOperator|)) (|arg| (|List| (|Complex| F)))
         (% (|Complex| F)))
        (SPROG ((|s2| #1=(|String|)) (|s1| #1#))
               (SEQ
                (LETT |s1|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL |op| (QREFELT % 79))
                                  (QREFELT % 82))
                        (QREFELT % 84))
                       (QREFELT % 86)))
                (LETT |s2|
                      (SPADCALL
                       (SPADCALL
                        (SPADCALL (SPADCALL |arg| (QREFELT % 88))
                                  (QREFELT % 82))
                        (QREFELT % 84))
                       (QREFELT % 86)))
                (EXIT
                 (|error|
                  (SPADCALL
                   (LIST
                    "ker2trigs: cannot convert kernel to gaussian function"
                    ", operator is '" |s1| "' and argument list is " |s2|)
                   (QREFELT % 86))))))) 

(SDEFUN |ITRIGMNP;do_liou;BoLC;11|
        ((|op| (|BasicOperator|)) (|arg| (|List| (|Complex| F)))
         (% (|Complex| F)))
        (SPROG ((|a1| (F)) (|a| (|Complex| F)))
               (SEQ (LETT |a| (|SPADfirst| |arg|))
                    (COND
                     ((SPADCALL |op| '|Ei| (QREFELT % 56))
                      (COND
                       ((SPADCALL (SPADCALL |a| (QREFELT % 30))
                                  (|spadConstant| % 32) (QREFELT % 59))
                        (EXIT
                         (SPADCALL
                          (SPADCALL (SPADCALL |a| (QREFELT % 36))
                                    (QREFELT % 89))
                          (SPADCALL (SPADCALL |a| (QREFELT % 36))
                                    (QREFELT % 90))
                          (QREFELT % 40)))))))
                    (COND
                     ((SPADCALL |op| '|erf| (QREFELT % 56))
                      (COND
                       ((SPADCALL (SPADCALL |a| (QREFELT % 30))
                                  (|spadConstant| % 32) (QREFELT % 59))
                        (EXIT
                         (SPADCALL (|spadConstant| % 32)
                                   (SPADCALL (SPADCALL |a| (QREFELT % 36))
                                             (QREFELT % 91))
                                   (QREFELT % 40)))))))
                    (COND
                     ((SPADCALL |op| '|erf| (QREFELT % 56))
                      (COND
                       ((SPADCALL (SPADCALL |a| (QREFELT % 30))
                                  (SPADCALL |a| (QREFELT % 36)) (QREFELT % 59))
                        (EXIT
                         (SEQ
                          (LETT |a1|
                                (SPADCALL
                                 (SPADCALL 2 (SPADCALL |a| (QREFELT % 30))
                                           (QREFELT % 92))
                                 (SPADCALL (SPADCALL (QREFELT % 93))
                                           (QREFELT % 15))
                                 (QREFELT % 22)))
                          (EXIT
                           (SPADCALL
                            (SPADCALL (|spadConstant| % 13)
                                      (|spadConstant| % 13) (QREFELT % 40))
                            (SPADCALL (SPADCALL |a1| (QREFELT % 94))
                                      (SPADCALL (SPADCALL |a1| (QREFELT % 95))
                                                (QREFELT % 14))
                                      (QREFELT % 40))
                            (QREFELT % 96)))))))))
                    (COND
                     ((SPADCALL |op| '|erf| (QREFELT % 56))
                      (COND
                       ((SPADCALL (SPADCALL |a| (QREFELT % 30))
                                  (SPADCALL (SPADCALL |a| (QREFELT % 36))
                                            (QREFELT % 14))
                                  (QREFELT % 59))
                        (EXIT
                         (SEQ
                          (LETT |a1|
                                (SPADCALL
                                 (SPADCALL 2 (SPADCALL |a| (QREFELT % 30))
                                           (QREFELT % 92))
                                 (SPADCALL (SPADCALL (QREFELT % 93))
                                           (QREFELT % 15))
                                 (QREFELT % 22)))
                          (EXIT
                           (SPADCALL
                            (SPADCALL (|spadConstant| % 13)
                                      (SPADCALL (|spadConstant| % 13)
                                                (QREFELT % 14))
                                      (QREFELT % 40))
                            (SPADCALL (SPADCALL |a1| (QREFELT % 94))
                                      (SPADCALL |a1| (QREFELT % 95))
                                      (QREFELT % 40))
                            (QREFELT % 96)))))))))
                    (EXIT (|ITRIGMNP;ker2trigs_error| |op| |arg| %))))) 

(SDEFUN |ITRIGMNP;do_liou;BoLC;12|
        ((|op| (|BasicOperator|)) (|args| (|List| (|Complex| F)))
         (% (|Complex| F)))
        (|ITRIGMNP;ker2trigs_error| |op| |args| %)) 

(SDEFUN |ITRIGMNP;ker2trigs|
        ((|op| (|BasicOperator|)) (|arg| (|List| (|Complex| F)))
         (% (|Complex| F)))
        (SPROG
         ((#1=#:G149 NIL) (|x| NIL) (#2=#:G148 NIL) (#3=#:G147 NIL)
          (#4=#:G146 NIL) (|a| (|Complex| F)) (#5=#:G145 NIL) (#6=#:G144 NIL)
          (#7=#:G104 NIL) (#8=#:G103 #9=(|Boolean|)) (#10=#:G105 #9#)
          (#11=#:G143 NIL))
         (SEQ
          (COND
           ((PROGN
             (LETT #7# NIL)
             (SEQ (LETT |x| NIL) (LETT #11# |arg|) G190
                  (COND
                   ((OR (ATOM #11#) (PROGN (LETT |x| (CAR #11#)) NIL))
                    (GO G191)))
                  (SEQ
                   (EXIT
                    (PROGN
                     (LETT #10#
                           (SPADCALL (SPADCALL |x| (QREFELT % 36))
                                     (QREFELT % 98)))
                     (COND (#7# (LETT #8# (COND (#8# #10#) ('T NIL))))
                           ('T (PROGN (LETT #8# #10#) (LETT #7# 'T)))))))
                  (LETT #11# (CDR #11#)) (GO G190) G191 (EXIT NIL))
             (COND (#7# #8#) (#12='T 'T)))
            (SPADCALL
             (SPADCALL |op|
                       (PROGN
                        (LETT #6# NIL)
                        (SEQ (LETT |x| NIL) (LETT #5# |arg|) G190
                             (COND
                              ((OR (ATOM #5#) (PROGN (LETT |x| (CAR #5#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #6#
                                     (CONS (SPADCALL |x| (QREFELT % 30))
                                           #6#))))
                             (LETT #5# (CDR #5#)) (GO G190) G191
                             (EXIT (NREVERSE #6#))))
                       (QREFELT % 99))
             (|spadConstant| % 32) (QREFELT % 40)))
           (#12#
            (SEQ (LETT |a| (|SPADfirst| |arg|))
                 (EXIT
                  (COND
                   ((SPADCALL |op| '|exp| (QREFELT % 56))
                    (SPADCALL |a| (QREFELT % 100)))
                   ((SPADCALL |op| '|log| (QREFELT % 56))
                    (SPADCALL |a| (QREFELT % 101)))
                   ((SPADCALL |op| '|sin| (QREFELT % 56))
                    (SPADCALL |a| (QREFELT % 102)))
                   ((SPADCALL |op| '|cos| (QREFELT % 56))
                    (SPADCALL |a| (QREFELT % 103)))
                   ((SPADCALL |op| '|tan| (QREFELT % 56))
                    (SPADCALL |a| (QREFELT % 104)))
                   ((SPADCALL |op| '|cot| (QREFELT % 56))
                    (SPADCALL |a| (QREFELT % 105)))
                   ((SPADCALL |op| '|sec| (QREFELT % 56))
                    (SPADCALL |a| (QREFELT % 106)))
                   ((SPADCALL |op| '|csc| (QREFELT % 56))
                    (SPADCALL |a| (QREFELT % 107)))
                   ((SPADCALL |op| '|asin| (QREFELT % 56))
                    (SPADCALL |a| (QREFELT % 108)))
                   ((SPADCALL |op| '|acos| (QREFELT % 56))
                    (SPADCALL |a| (QREFELT % 109)))
                   ((SPADCALL |op| '|atan| (QREFELT % 56))
                    (SPADCALL |a| (QREFELT % 110)))
                   ((SPADCALL |op| '|acot| (QREFELT % 56))
                    (SPADCALL |a| (QREFELT % 111)))
                   ((SPADCALL |op| '|asec| (QREFELT % 56))
                    (SPADCALL |a| (QREFELT % 112)))
                   ((SPADCALL |op| '|acsc| (QREFELT % 56))
                    (SPADCALL |a| (QREFELT % 113)))
                   ((SPADCALL |op| '|sinh| (QREFELT % 56))
                    (SPADCALL |a| (QREFELT % 114)))
                   ((SPADCALL |op| '|cosh| (QREFELT % 56))
                    (SPADCALL |a| (QREFELT % 115)))
                   ((SPADCALL |op| '|tanh| (QREFELT % 56))
                    (SPADCALL |a| (QREFELT % 116)))
                   ((SPADCALL |op| '|coth| (QREFELT % 56))
                    (SPADCALL |a| (QREFELT % 117)))
                   ((SPADCALL |op| '|sech| (QREFELT % 56))
                    (SPADCALL |a| (QREFELT % 118)))
                   ((SPADCALL |op| '|csch| (QREFELT % 56))
                    (SPADCALL |a| (QREFELT % 119)))
                   ((SPADCALL |op| '|asinh| (QREFELT % 56))
                    (SPADCALL |a| (QREFELT % 120)))
                   ((SPADCALL |op| '|acosh| (QREFELT % 56))
                    (SPADCALL |a| (QREFELT % 121)))
                   ((SPADCALL |op| '|atanh| (QREFELT % 56))
                    (SPADCALL |a| (QREFELT % 122)))
                   ((SPADCALL |op| '|acoth| (QREFELT % 56))
                    (SPADCALL |a| (QREFELT % 123)))
                   ((SPADCALL |op| '|asech| (QREFELT % 56))
                    (SPADCALL |a| (QREFELT % 124)))
                   ((SPADCALL |op| '|acsch| (QREFELT % 56))
                    (SPADCALL |a| (QREFELT % 125)))
                   ((SPADCALL |op| '|abs| (QREFELT % 56))
                    (SPADCALL
                     (SPADCALL (SPADCALL |a| (QREFELT % 126)) (QREFELT % 15))
                     (QREFELT % 127)))
                   (#12#
                    (SEQ
                     (COND
                      ((QREFELT % 9)
                       (COND
                        ((SPADCALL |op| '|nthRoot| (QREFELT % 56))
                         (EXIT
                          (SPADCALL |a|
                                    (SPADCALL (SPADCALL |arg| (QREFELT % 128))
                                              (QREFELT % 129))
                                    (QREFELT % 130)))))))
                     (EXIT
                      (COND
                       ((SPADCALL |op| '|%iint| (QREFELT % 56))
                        (SPADCALL
                         (SPADCALL |op|
                                   (PROGN
                                    (LETT #4# NIL)
                                    (SEQ (LETT |x| NIL) (LETT #3# |arg|) G190
                                         (COND
                                          ((OR (ATOM #3#)
                                               (PROGN
                                                (LETT |x| (CAR #3#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #4#
                                                 (CONS
                                                  (SPADCALL |x| (QREFELT % 30))
                                                  #4#))))
                                         (LETT #3# (CDR #3#)) (GO G190) G191
                                         (EXIT (NREVERSE #4#))))
                                   (QREFELT % 99))
                         (SPADCALL |op|
                                   (PROGN
                                    (LETT #2# NIL)
                                    (SEQ (LETT |x| NIL) (LETT #1# |arg|) G190
                                         (COND
                                          ((OR (ATOM #1#)
                                               (PROGN
                                                (LETT |x| (CAR #1#))
                                                NIL))
                                           (GO G191)))
                                         (SEQ
                                          (EXIT
                                           (LETT #2#
                                                 (CONS
                                                  (SPADCALL |x| (QREFELT % 36))
                                                  #2#))))
                                         (LETT #1# (CDR #1#)) (GO G190) G191
                                         (EXIT (NREVERSE #2#))))
                                   (QREFELT % 99))
                         (QREFELT % 40)))
                       (#12# (SPADCALL |op| |arg| (QREFELT % 97))))))))))))))) 

(SDEFUN |ITRIGMNP;sup2trigs|
        ((|p|
          (|SparseUnivariatePolynomial|
           (|SparseMultivariatePolynomial| (|Complex| R) (|Kernel| FG))))
         (|f| (|Complex| F)) (% (|Complex| F)))
        (SPADCALL
         (SPADCALL (CONS (|function| |ITRIGMNP;smp2trigs|) %) |p|
                   (QREFELT % 135))
         |f| (QREFELT % 136))) 

(SDEFUN |ITRIGMNP;smp2trigs|
        ((|p| (|SparseMultivariatePolynomial| (|Complex| R) (|Kernel| FG)))
         (% (|Complex| F)))
        (SPADCALL (CONS #'|ITRIGMNP;smp2trigs!0| %)
                  (CONS (|function| |ITRIGMNP;GR2GF|) %) |p| (QREFELT % 142))) 

(SDEFUN |ITRIGMNP;smp2trigs!0| ((|x| NIL) (% NIL))
        (SPADCALL (SPADCALL |x| (QREFELT % 64)) (QREFELT % 137))) 

(SDEFUN |ITRIGMNP;explogs2trigs;FGC;16| ((|f| (FG)) (% (|Complex| F)))
        (SPROG
         ((|g| #1=(|Complex| F)) (|b| (|Integer|)) (|gi| #1#) (|y| (F))
          (|e| (F))
          (|den|
           #2=(|SparseUnivariatePolynomial|
               (|SparseMultivariatePolynomial| (|Complex| R) (|Kernel| FG))))
          (|num| #2#) (|arg| (|List| (|Complex| F))) (#3=#:G166 NIL) (|x| NIL)
          (#4=#:G165 NIL) (|op| (|BasicOperator|)) (|k| (|Kernel| FG))
          (|m| (|Union| (|Kernel| FG) "failed"))
          (|df| (|SparseMultivariatePolynomial| (|Complex| R) (|Kernel| FG)))
          (|nf| (|SparseMultivariatePolynomial| (|Complex| R) (|Kernel| FG))))
         (SEQ (LETT |nf| (SPADCALL |f| (QREFELT % 20)))
              (LETT |df| (SPADCALL |f| (QREFELT % 21)))
              (LETT |m| (SPADCALL |f| (QREFELT % 144)))
              (EXIT
               (COND
                ((QEQCAR |m| 1)
                 (SPADCALL (|ITRIGMNP;GR2GF| (SPADCALL |nf| (QREFELT % 145)) %)
                           (|ITRIGMNP;GR2GF| (SPADCALL |df| (QREFELT % 145)) %)
                           (QREFELT % 146)))
                (#5='T
                 (SEQ
                  (LETT |op|
                        (SPADCALL
                         (SPADCALL (LETT |k| (QCDR |m|)) (QREFELT % 44))
                         (QREFELT % 45)))
                  (LETT |arg|
                        (PROGN
                         (LETT #4# NIL)
                         (SEQ (LETT |x| NIL)
                              (LETT #3# (SPADCALL |k| (QREFELT % 47))) G190
                              (COND
                               ((OR (ATOM #3#)
                                    (PROGN (LETT |x| (CAR #3#)) NIL))
                                (GO G191)))
                              (SEQ
                               (EXIT
                                (LETT #4#
                                      (CONS (SPADCALL |x| (QREFELT % 137))
                                            #4#))))
                              (LETT #3# (CDR #3#)) (GO G190) G191
                              (EXIT (NREVERSE #4#)))))
                  (LETT |num| (SPADCALL |nf| |k| (QREFELT % 148)))
                  (LETT |den| (SPADCALL |df| |k| (QREFELT % 148)))
                  (EXIT
                   (COND
                    ((SPADCALL |op| '|exp| (QREFELT % 56))
                     (SEQ
                      (LETT |e|
                            (SPADCALL
                             (SPADCALL (|SPADfirst| |arg|) (QREFELT % 30))
                             (QREFELT % 149)))
                      (LETT |y| (SPADCALL (|SPADfirst| |arg|) (QREFELT % 36)))
                      (LETT |g|
                            (SPADCALL
                             (SPADCALL |e| (SPADCALL |y| (QREFELT % 150))
                                       (QREFELT % 17))
                             (SPADCALL |e| (SPADCALL |y| (QREFELT % 151))
                                       (QREFELT % 17))
                             (QREFELT % 40)))
                      (LETT |gi|
                            (SPADCALL
                             (SPADCALL (SPADCALL |y| (QREFELT % 150)) |e|
                                       (QREFELT % 22))
                             (SPADCALL
                              (SPADCALL (SPADCALL |y| (QREFELT % 151)) |e|
                                        (QREFELT % 22))
                              (QREFELT % 14))
                             (QREFELT % 40)))
                      (EXIT
                       (SPADCALL
                        (|ITRIGMNP;supexp| |num| |g| |gi|
                         (LETT |b|
                               (QUOTIENT2 (SPADCALL |num| (QREFELT % 153)) 2))
                         %)
                        (|ITRIGMNP;supexp| |den| |g| |gi| |b| %)
                        (QREFELT % 146)))))
                    (#5#
                     (SPADCALL
                      (|ITRIGMNP;sup2trigs| |num|
                       (LETT |g| (|ITRIGMNP;ker2trigs| |op| |arg| %)) %)
                      (|ITRIGMNP;sup2trigs| |den| |g| %)
                      (QREFELT % 146)))))))))))) 

(SDEFUN |ITRIGMNP;supexp|
        ((|p|
          (|SparseUnivariatePolynomial|
           (|SparseMultivariatePolynomial| (|Complex| R) (|Kernel| FG))))
         (|f1| (|Complex| F)) (|f2| (|Complex| F)) (|bse| (|Integer|))
         (% (|Complex| F)))
        (SPROG ((|ans| (|Complex| F)) (|d| (|Integer|)) (|g| (|Complex| F)))
               (SEQ (LETT |ans| (|spadConstant| % 154))
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL |p| (|spadConstant| % 155)
                                      (QREFELT % 156)))
                           (GO G191)))
                         (SEQ
                          (LETT |g|
                                (SPADCALL
                                 (SPADCALL (SPADCALL |p| (QREFELT % 157))
                                           (QREFELT % 158))
                                 (QREFELT % 137)))
                          (SEQ
                           (LETT |d| (- (SPADCALL |p| (QREFELT % 153)) |bse|))
                           (EXIT
                            (COND
                             ((>= |d| 0)
                              (LETT |ans|
                                    (SPADCALL |ans|
                                              (SPADCALL |g|
                                                        (SPADCALL |f1| |d|
                                                                  (QREFELT %
                                                                           159))
                                                        (QREFELT % 96))
                                              (QREFELT % 160))))
                             ('T
                              (LETT |ans|
                                    (SPADCALL |ans|
                                              (SPADCALL |g|
                                                        (SPADCALL |f2| (- |d|)
                                                                  (QREFELT %
                                                                           159))
                                                        (QREFELT % 96))
                                              (QREFELT % 160)))))))
                          (EXIT (LETT |p| (SPADCALL |p| (QREFELT % 161)))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |ans|)))) 

(SDEFUN |ITRIGMNP;PG2F|
        ((|p| (|SparseMultivariatePolynomial| (|Complex| R) (|Kernel| FG)))
         (% (F)))
        (SPADCALL (CONS (|function| |ITRIGMNP;KG2F|) %)
                  (CONS (|function| |ITRIGMNP;GR2F|) %) |p| (QREFELT % 165))) 

(SDEFUN |ITRIGMNP;PF2FG|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| F))) (% (FG)))
        (SPADCALL (CONS (|function| |ITRIGMNP;KF2FG|) %)
                  (CONS #'|ITRIGMNP;PF2FG!0| %) |p| (QREFELT % 171))) 

(SDEFUN |ITRIGMNP;PF2FG!0| ((|x| NIL) (% NIL))
        (SPADCALL (SPADCALL |x| (QREFELT % 166)) (QREFELT % 35))) 

(SDEFUN |ITRIGMNP;smp2explogs|
        ((|p| (|SparseMultivariatePolynomial| (|Complex| R) (|Kernel| FG)))
         (|l| (|List| (|Kernel| FG))) (% (FG)))
        (SPROG NIL
               (SPADCALL (CONS #'|ITRIGMNP;smp2explogs!0| (VECTOR % |l|))
                         (ELT % 35) |p| (QREFELT % 175)))) 

(SDEFUN |ITRIGMNP;smp2explogs!0| ((|x| NIL) ($$ NIL))
        (PROG (|l| %)
          (LETT |l| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (|ITRIGMNP;ker2explogs| |x| |l| %))))) 

(DECLAIM (NOTINLINE |InnerTrigonometricManipulations;|)) 

(DEFUN |InnerTrigonometricManipulations;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT DV$3 (|devaluate| |#3|))
          (LETT |dv$| (LIST '|InnerTrigonometricManipulations| DV$1 DV$2 DV$3))
          (LETT % (GETREFV 176))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|InnerTrigonometricManipulations|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (QSETREFV % 8 |#3|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 9
                    (COND
                     ((|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
                      (|HasCategory| |#2| '(|RadicalCategory|)))
                     ('T NIL)))
          (QSETREFV % 41
                    (SPADCALL
                     (SPADCALL (|spadConstant| % 31) (|spadConstant| % 33)
                               (QREFELT % 34))
                     (QREFELT % 35)))
          (COND
           ((|HasCategory| |#2| '(|LiouvillianFunctionCategory|))
            (QSETREFV % 97
                      (CONS (|dispatchFunction| |ITRIGMNP;do_liou;BoLC;11|)
                            %)))
           ('T
            (QSETREFV % 97
                      (CONS (|dispatchFunction| |ITRIGMNP;do_liou;BoLC;12|)
                            %))))
          %))) 

(DEFUN |InnerTrigonometricManipulations| (&REST #1=#:G181)
  (SPROG NIL
         (PROG (#2=#:G182)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|InnerTrigonometricManipulations|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |InnerTrigonometricManipulations;|)
                             #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|InnerTrigonometricManipulations|)))))))))) 

(MAKEPROP '|InnerTrigonometricManipulations| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) '|nth| (|Complex| 6) (0 . |real|) (5 . |coerce|)
              (10 . |One|) (14 . -) (19 . |sqrt|) (24 . |imag|) (29 . *)
              (35 . +) (|SparseMultivariatePolynomial| 10 63) (41 . |numer|)
              (46 . |denom|) (51 . /) |ITRIGMNP;FG2F;FGF;2|
              (|SparseMultivariatePolynomial| 6 63) (57 . |numer|)
              (62 . |denom|) (67 . /) |ITRIGMNP;F2FG;FFG;3| (|Complex| 7)
              (73 . |real|) (78 . |Zero|) (82 . |Zero|) (86 . |One|)
              (90 . |complex|) (96 . |coerce|) (101 . |imag|) (106 . *)
              (112 . +) |ITRIGMNP;GF2FG;CFG;4| (118 . |complex|) '|im|
              (|BasicOperator|) (|Kernel| 8) (124 . |operator|)
              (129 . |operator|) (|List| 8) (134 . |argument|) (|List| %)
              (139 . |kernel|) (|List| 7) (|Kernel| 7) (145 . |argument|)
              (150 . |operator|) (|Boolean|) (|Symbol|) (155 . |is?|)
              (|Integer|) (161 . |elt|) (167 . =) (173 . |coerce|)
              (178 . |operator|) (183 . |kernel|) (|Kernel| %) (189 . |coerce|)
              (|List| 43) |ITRIGMNP;trigs2explogs;FGLFG;9| (194 . |is?|)
              (200 . |member?|) (206 . |exp|) (211 . ^) (|PositiveInteger|)
              (217 . *) (223 . |One|) (227 . -) (233 . -) (238 . |log|)
              (243 . |coerce|) (|OutputForm|) (248 . |coerce|) (|OutputBox|)
              (|Format1D|) (253 . |formatExpression|) (|List| 85)
              (258 . |lines|) (|String|) (263 . |concat|) (|List| 29)
              (268 . |coerce|) (273 . |Ci|) (278 . |Si|) (283 . |erfi|)
              (288 . *) (294 . |pi|) (298 . |fresnelC|) (303 . |fresnelS|)
              (308 . *) (314 . |do_liou|) (320 . |zero?|) (325 . |elt|)
              (331 . |exp|) (336 . |log|) (341 . |sin|) (346 . |cos|)
              (351 . |tan|) (356 . |cot|) (361 . |sec|) (366 . |csc|)
              (371 . |asin|) (376 . |acos|) (381 . |atan|) (386 . |acot|)
              (391 . |asec|) (396 . |acsc|) (401 . |sinh|) (406 . |cosh|)
              (411 . |tanh|) (416 . |coth|) (421 . |sech|) (426 . |csch|)
              (431 . |asinh|) (436 . |acosh|) (441 . |atanh|) (446 . |acoth|)
              (451 . |asech|) (456 . |acsch|) (461 . |norm|) (466 . |coerce|)
              (471 . |second|) (476 . |retract|) (481 . |nthRoot|)
              (|SparseUnivariatePolynomial| 29) (|Mapping| 29 140)
              (|SparseUnivariatePolynomial| 140)
              (|SparseUnivariatePolynomialFunctions2| 140 29) (487 . |map|)
              (493 . |elt|) |ITRIGMNP;explogs2trigs;FGC;16| (|Mapping| 29 43)
              (|Mapping| 29 10) (|SparseMultivariatePolynomial| 10 43)
              (|PolynomialCategoryLifting| (|IndexedExponents| 43) 43 10 140
                                           29)
              (499 . |map|) (|Union| 63 '"failed") (506 . |mainKernel|)
              (511 . |retract|) (516 . /) (|SparseUnivariatePolynomial| %)
              (522 . |univariate|) (528 . |exp|) (533 . |cos|) (538 . |sin|)
              (|NonNegativeInteger|) (543 . |degree|) (548 . |Zero|)
              (552 . |Zero|) (556 . ~=) (562 . |leadingCoefficient|)
              (567 . |coerce|) (572 . ^) (578 . +) (584 . |reductum|)
              (|Mapping| 7 43) (|Mapping| 7 10)
              (|PolynomialCategoryLifting| (|IndexedExponents| 43) 43 10 140 7)
              (589 . |map|) (596 . |coerce|) (|Mapping| 8 51) (|Mapping| 8 6)
              (|SparseMultivariatePolynomial| 6 51)
              (|PolynomialCategoryLifting| (|IndexedExponents| 51) 51 6 169 8)
              (601 . |map|) (|Mapping| 8 43) (|Mapping| 8 10)
              (|PolynomialCategoryLifting| (|IndexedExponents| 43) 43 10 140 8)
              (608 . |map|))
           '#(|trigs2explogs| 615 |explogs2trigs| 621 |do_liou| 626 GF2FG 632
              FG2F 637 F2FG 642)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST '((GF2FG (|#3| (|Complex| |#2|))) T)
                                   '((FG2F (|#2| |#3|)) T)
                                   '((F2FG (|#3| |#2|)) T)
                                   '((|explogs2trigs| ((|Complex| |#2|) |#3|))
                                     T)
                                   '((|trigs2explogs|
                                      (|#3| |#3| (|List| (|Kernel| |#3|))))
                                     T)
                                   '((|do_liou|
                                      ((|Complex| |#2|) (|BasicOperator|)
                                       (|List| (|Complex| |#2|))))
                                     T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 175
                                            '(1 10 6 0 11 1 7 0 6 12 0 7 0 13 1
                                              7 0 0 14 1 7 0 0 15 1 10 6 0 16 2
                                              7 0 0 0 17 2 7 0 0 0 18 1 8 19 0
                                              20 1 8 19 0 21 2 7 0 0 0 22 1 7
                                              24 0 25 1 7 24 0 26 2 8 0 0 0 27
                                              1 29 7 0 30 0 6 0 31 0 7 0 32 0 6
                                              0 33 2 10 0 6 6 34 1 8 0 10 35 1
                                              29 7 0 36 2 8 0 0 0 37 2 8 0 0 0
                                              38 2 29 0 7 7 40 1 43 42 0 44 1 7
                                              42 42 45 1 43 46 0 47 2 7 0 42 48
                                              49 1 51 50 0 52 1 51 42 0 53 2 42
                                              54 0 55 56 2 50 7 0 57 58 2 7 54
                                              0 0 59 1 7 0 57 60 1 8 42 42 61 2
                                              8 0 42 48 62 1 8 0 63 64 2 43 54
                                              0 55 67 2 65 54 43 0 68 1 8 0 0
                                              69 2 8 0 0 57 70 2 8 0 71 0 72 0
                                              8 0 73 2 8 0 0 0 74 1 8 0 0 75 1
                                              8 0 0 76 1 8 0 57 77 1 42 78 0 79
                                              1 81 80 78 82 1 80 83 0 84 1 85 0
                                              48 86 1 87 78 0 88 1 7 0 0 89 1 7
                                              0 0 90 1 7 0 0 91 2 7 0 71 0 92 0
                                              7 0 93 1 7 0 0 94 1 7 0 0 95 2 29
                                              0 0 0 96 2 0 29 42 87 97 1 7 54 0
                                              98 2 7 0 42 48 99 1 29 0 0 100 1
                                              29 0 0 101 1 29 0 0 102 1 29 0 0
                                              103 1 29 0 0 104 1 29 0 0 105 1
                                              29 0 0 106 1 29 0 0 107 1 29 0 0
                                              108 1 29 0 0 109 1 29 0 0 110 1
                                              29 0 0 111 1 29 0 0 112 1 29 0 0
                                              113 1 29 0 0 114 1 29 0 0 115 1
                                              29 0 0 116 1 29 0 0 117 1 29 0 0
                                              118 1 29 0 0 119 1 29 0 0 120 1
                                              29 0 0 121 1 29 0 0 122 1 29 0 0
                                              123 1 29 0 0 124 1 29 0 0 125 1
                                              29 7 0 126 1 29 0 7 127 1 87 29 0
                                              128 1 29 57 0 129 2 29 0 0 57 130
                                              2 134 131 132 133 135 2 131 29 0
                                              29 136 3 141 29 138 139 140 142 1
                                              8 143 0 144 1 140 10 0 145 2 29 0
                                              0 0 146 2 140 147 0 43 148 1 7 0
                                              0 149 1 7 0 0 150 1 7 0 0 151 1
                                              133 152 0 153 0 29 0 154 0 133 0
                                              155 2 133 54 0 0 156 1 133 140 0
                                              157 1 8 0 19 158 2 29 0 0 57 159
                                              2 29 0 0 0 160 1 133 0 0 161 3
                                              164 7 162 163 140 165 1 10 0 6
                                              166 3 170 8 167 168 169 171 3 174
                                              8 172 173 140 175 2 0 8 8 65 66 1
                                              0 29 8 137 2 0 29 42 87 97 1 0 8
                                              29 39 1 0 7 8 23 1 0 8 7 28)))))
           '|lookupComplete|)) 
