
(SDEFUN |LODEEF;simp_roots| ((|f| (F)) (|la| (|List| F)) (% (F)))
        (SPROG
         ((|k1| (F)) (#1=#:G24 NIL) (|k| NIL) (|ta| (|List| (|Kernel| F)))
          (|tf| (|List| (|Kernel| F))))
         (SEQ (LETT |tf| (SPADCALL |f| (QREFELT % 13)))
              (LETT |ta| (SPADCALL |la| (QREFELT % 15)))
              (SEQ (LETT |k| NIL)
                   (LETT #1# (SPADCALL |tf| |ta| (QREFELT % 17))) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |k| '|nthRoot| (QREFELT % 21))
                       (SEQ
                        (LETT |k1|
                              (SPADCALL (SPADCALL |k| (QREFELT % 23))
                                        (QREFELT % 25)))
                        (EXIT
                         (LETT |f|
                               (SPADCALL |f| (LIST |k|) (LIST |k1|)
                                         (QREFELT % 26)))))))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT |f|)))) 

(SDEFUN |LODEEF;smpxpart|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| F))) (|x| (|Symbol|))
         (|l| (|List| (|Kernel| F)))
         (|lp| (|List| (|SparseMultivariatePolynomial| R (|Kernel| F))))
         (% (|SparseMultivariatePolynomial| R (|Kernel| F))))
        (|LODEEF;downmp| (SPADCALL (|LODEEF;upmp| |p| |l| %) (QREFELT % 28))
         |l| |lp| %)) 

(SDEFUN |LODEEF;downmp|
        ((|p|
          (|SparseMultivariatePolynomial|
           (|SparseMultivariatePolynomial| R (|Kernel| F)) (|Kernel| F)))
         (|l| (|List| (|Kernel| F)))
         (|lp| (|List| (|SparseMultivariatePolynomial| R (|Kernel| F))))
         (% (|SparseMultivariatePolynomial| R (|Kernel| F))))
        (SPADCALL (SPADCALL |p| |l| |lp| (QREFELT % 30)) (QREFELT % 32))) 

(SDEFUN |LODEEF;homosolve|
        ((|lf| (L))
         (|op|
          (|LinearOrdinaryDifferentialOperator1|
           (|Fraction| (|SparseUnivariatePolynomial| F))))
         (|sols| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
         (|k| (|Kernel| F)) (|x| (|Symbol|)) (% (|List| F)))
        (|LODEEF;homosolve1| |lf| (|LODEEF;ratlogsol| |op| |sols| |k| |x| %)
         |k| |x| %)) 

(SDEFUN |LODEEF;algSolve|
        ((|op| (L)) (|g| (F)) (|k| #1=(|Kernel| F)) (|l| (|List| (|Kernel| F)))
         (|x| (|Symbol|))
         (%
          (|Union| (|Record| (|:| |particular| F) (|:| |basis| (|List| F)))
                   #2="failed")))
        (SPROG
         ((#3=#:G45 NIL) (|f| NIL) (#4=#:G44 NIL) (|kz| (|Kernel| F))
          (|rc| (|Record| (|:| |particular| F) (|:| |basis| (|List| F))))
          (|u|
           (|Union| (|Record| (|:| |particular| F) (|:| |basis| (|List| F)))
                    #2#))
          (|lv| (|List| F)) (|lk| (|List| #1#)) (|z| (F))
          (|rec|
           (|Record| (|:| |primelt| F)
                     (|:| |pol1| (|SparseUnivariatePolynomial| F))
                     (|:| |pol2| (|SparseUnivariatePolynomial| F))
                     (|:| |prim| (|SparseUnivariatePolynomial| F))))
          (|kx| (|Kernel| F)))
         (SEQ
          (COND
           ((QEQCAR
             (SPADCALL (LETT |kx| (SPADCALL |k| |l| |x| (QREFELT % 34)))
                       (QREFELT % 36))
             0)
            (|LODEEF;palgSolve| |op| |g| |kx| |k| |x| %))
           ((SPADCALL (SPADCALL |kx| (QREFELT % 38)) (QREFELT % 9)
                      (QREFELT % 39))
            (SEQ
             (LETT |rec|
                   (SPADCALL (SPADCALL |kx| (QREFELT % 23))
                             (SPADCALL |k| (QREFELT % 23)) (QREFELT % 42)))
             (LETT |z| (SPADCALL (QVELT |rec| 3) (QREFELT % 44)))
             (LETT |lk| (LIST |kx| |k|))
             (LETT |lv|
                   (LIST (SPADCALL (QVELT |rec| 1) |z| (QREFELT % 46))
                         (SPADCALL (QVELT |rec| 2) |z| (QREFELT % 46))))
             (LETT |u|
                   (SPADCALL
                    (|LODEEF;localmap|
                     (CONS #'|LODEEF;algSolve!0| (VECTOR % |lv| |lk|)) |op| %)
                    (SPADCALL |g| |lk| |lv| (QREFELT % 47)) |x|
                    (QREFELT % 50)))
             (EXIT
              (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                    (#5='T
                     (SEQ (LETT |rc| (QCDR |u|))
                          (LETT |kz| (SPADCALL |z| (QREFELT % 51)))
                          (EXIT
                           (CONS 0
                                 (CONS
                                  (SPADCALL (QCAR |rc|) |kz| (QVELT |rec| 0)
                                            (QREFELT % 52))
                                  (PROGN
                                   (LETT #4# NIL)
                                   (SEQ (LETT |f| NIL) (LETT #3# (QCDR |rc|))
                                        G190
                                        (COND
                                         ((OR (ATOM #3#)
                                              (PROGN (LETT |f| (CAR #3#)) NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #4#
                                                (CONS
                                                 (SPADCALL |f| |kz|
                                                           (QVELT |rec| 0)
                                                           (QREFELT % 52))
                                                 #4#))))
                                        (LETT #3# (CDR #3#)) (GO G190) G191
                                        (EXIT (NREVERSE #4#)))))))))))))
           (#5# (|LODEEF;lastChance| |op| |g| |x| %)))))) 

(SDEFUN |LODEEF;algSolve!0| ((|f1| NIL) ($$ NIL))
        (PROG (|lk| |lv| %)
          (LETT |lk| (QREFELT $$ 2))
          (LETT |lv| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |f1| |lk| |lv| (QREFELT % 47)))))) 

(SDEFUN |LODEEF;doVarParams|
        ((|eq| (L)) (|g| (F)) (|bas| (|List| F)) (|x| (|Symbol|))
         (%
          (|Union| (|Record| (|:| |particular| F) (|:| |basis| (|List| F)))
                   "failed")))
        (SPROG ((|u| (|Union| F "failed")))
               (SEQ
                (LETT |u|
                      (SPADCALL |eq| |g| |bas|
                                (CONS #'|LODEEF;doVarParams!0| (VECTOR % |x|))
                                (QREFELT % 59)))
                (EXIT
                 (COND ((QEQCAR |u| 1) (|LODEEF;lastChance| |eq| |g| |x| %))
                       ('T (CONS 0 (CONS (QCDR |u|) |bas|)))))))) 

(SDEFUN |LODEEF;doVarParams!0| ((|f1| NIL) ($$ NIL))
        (PROG (|x| %)
          (LETT |x| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |f1| |x| (QREFELT % 54)))))) 

(SDEFUN |LODEEF;lastChance|
        ((|op| (L)) (|g| (F)) (|x| (|Symbol|))
         (%
          (|Union| (|Record| (|:| |particular| F) (|:| |basis| (|List| F)))
                   "failed")))
        (COND
         ((EQL (SPADCALL |op| (QREFELT % 61)) 1)
          (CONS 0
                (|LODEEF;firstOrder| (SPADCALL |op| 0 (QREFELT % 64))
                 (SPADCALL |op| (QREFELT % 65)) |g| |x| %)))
         ('T (CONS 1 "failed")))) 

(SDEFUN |LODEEF;firstOrder|
        ((|a0| (F)) (|a1| (F)) (|g| (F)) (|x| (|Symbol|))
         (% (|Record| (|:| |particular| F) (|:| |basis| (|List| F)))))
        (SPROG ((|h| (F)))
               (SEQ
                (LETT |h|
                      (|LODEEF;xpart|
                       (SPADCALL
                        (SPADCALL (SPADCALL |a0| |a1| (QREFELT % 66))
                                  (QREFELT % 67))
                        |x| (QREFELT % 68))
                       |x| %))
                (EXIT
                 (CONS
                  (SPADCALL |h|
                            (SPADCALL
                             (SPADCALL (SPADCALL |g| |h| (QREFELT % 66)) |a1|
                                       (QREFELT % 66))
                             |x| (QREFELT % 54))
                            (QREFELT % 69))
                  (LIST |h|)))))) 

(SDEFUN |LODEEF;xpart| ((|f| (F)) (|x| (|Symbol|)) (% (F)))
        (SPROG
         ((|lp| (|List| (|SparseMultivariatePolynomial| R (|Kernel| F))))
          (#1=#:G70 NIL) (|k| NIL) (#2=#:G69 NIL) (|l| (|List| (|Kernel| F))))
         (SEQ
          (LETT |l|
                (NREVERSE
                 (SPADCALL (SPADCALL |f| (QREFELT % 13)) |x| (QREFELT % 70))))
          (LETT |lp|
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |k| NIL) (LETT #1# |l|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (SPADCALL |k| (QREFELT % 71)) #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#)))))
          (EXIT
           (SPADCALL
            (|LODEEF;smpxpart| (SPADCALL |f| (QREFELT % 73)) |x| |l| |lp| %)
            (|LODEEF;smpxpart| (SPADCALL |f| (QREFELT % 74)) |x| |l| |lp| %)
            (QREFELT % 75)))))) 

(SDEFUN |LODEEF;upmp|
        ((|p| (|SparseMultivariatePolynomial| R (|Kernel| F)))
         (|l| (|List| (|Kernel| F)))
         (%
          (|SparseMultivariatePolynomial|
           (|SparseMultivariatePolynomial| R (|Kernel| F)) (|Kernel| F))))
        (SPROG
         ((|up|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| F))))
          (|ans|
           (|SparseMultivariatePolynomial|
            (|SparseMultivariatePolynomial| R (|Kernel| F)) (|Kernel| F)))
          (|k| (|Kernel| F)))
         (SEQ
          (COND ((NULL |l|) (SPADCALL |p| (QREFELT % 76)))
                ('T
                 (SEQ
                  (LETT |up|
                        (SPADCALL |p| (LETT |k| (|SPADfirst| |l|))
                                  (QREFELT % 77)))
                  (LETT |l| (CDR |l|)) (LETT |ans| (|spadConstant| % 78))
                  (SEQ G190
                       (COND
                        ((NULL
                          (SPADCALL |up| (|spadConstant| % 80) (QREFELT % 81)))
                         (GO G191)))
                       (SEQ
                        (LETT |ans|
                              (SPADCALL |ans|
                                        (SPADCALL
                                         (|LODEEF;upmp|
                                          (SPADCALL |up| (QREFELT % 82)) |l| %)
                                         |k| (SPADCALL |up| (QREFELT % 83))
                                         (QREFELT % 84))
                                        (QREFELT % 85)))
                        (EXIT (LETT |up| (SPADCALL |up| (QREFELT % 86)))))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT |ans|))))))) 

(SDEFUN |LODEEF;multint| ((|a| (F)) (|l| (|List| F)) (|x| (|Symbol|)) (% (F)))
        (SPROG ((#1=#:G81 NIL) (|g| NIL))
               (SEQ
                (SEQ (LETT |g| NIL) (LETT #1# |l|) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |g| (CAR #1#)) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |a|
                             (SPADCALL |g|
                                       (|LODEEF;xpart|
                                        (SPADCALL |a| |x| (QREFELT % 54)) |x|
                                        %)
                                       (QREFELT % 69)))))
                     (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                (EXIT |a|)))) 

(SDEFUN |LODEEF;expsols|
        ((|op|
          (|LinearOrdinaryDifferentialOperator1|
           (|Fraction| (|SparseUnivariatePolynomial| F))))
         (|k| (|Kernel| F)) (|x| (|Symbol|)) (% (|List| F)))
        (SPROG ((#1=#:G91 NIL) (|h| NIL) (#2=#:G90 NIL))
               (SEQ
                (COND
                 ((EQL (SPADCALL |op| (QREFELT % 88)) 1)
                  (QCDR
                   (|LODEEF;firstOrder|
                    (SPADCALL (SPADCALL |op| 0 (QREFELT % 90)) |k|
                              (QREFELT % 92))
                    (SPADCALL (SPADCALL |op| (QREFELT % 93)) |k|
                              (QREFELT % 92))
                    (|spadConstant| % 94) |x| %)))
                 ('T
                  (PROGN
                   (LETT #2# NIL)
                   (SEQ (LETT |h| NIL)
                        (LETT #1# (SPADCALL |op| (ELT % 97) (QREFELT % 101)))
                        G190
                        (COND
                         ((OR (ATOM #1#) (PROGN (LETT |h| (CAR #1#)) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2#
                                (CONS
                                 (|LODEEF;xpart|
                                  (SPADCALL (SPADCALL |h| |k| (QREFELT % 92))
                                            |x| (QREFELT % 68))
                                  |x| %)
                                 #2#))))
                        (LETT #1# (CDR #1#)) (GO G190) G191
                        (EXIT (NREVERSE #2#))))))))) 

(SDEFUN |LODEEF;ratlogsol|
        ((|oper|
          (|LinearOrdinaryDifferentialOperator1|
           (|Fraction| (|SparseUnivariatePolynomial| F))))
         (|sols| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))
         (|k| (|Kernel| F)) (|x| (|Symbol|)) (% (|List| F)))
        (SPROG
         ((#1=#:G115 NIL) (|e| NIL) (#2=#:G114 NIL) (#3=#:G113 NIL) (|h| NIL)
          (#4=#:G112 NIL) (|int| (|List| F)) (#5=#:G111 NIL) (#6=#:G110 NIL)
          (|le| (|List| F))
          (|rec|
           (|Record|
            (|:| |eq|
                 (|LinearOrdinaryDifferentialOperator1|
                  (|Fraction| (|SparseUnivariatePolynomial| F))))
            (|:| |op| (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))))
          (|bas| (|List| F)) (#7=#:G109 NIL) (#8=#:G108 NIL))
         (SEQ
          (LETT |bas|
                (PROGN
                 (LETT #8# NIL)
                 (SEQ (LETT |h| NIL) (LETT #7# |sols|) G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |h| (CAR #7#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #8#
                              (CONS
                               (|LODEEF;xpart|
                                (SPADCALL |h| |k| (QREFELT % 92)) |x| %)
                               #8#))))
                      (LETT #7# (CDR #7#)) (GO G190) G191
                      (EXIT (NREVERSE #8#)))))
          (EXIT
           (COND ((EQL (SPADCALL |oper| (QREFELT % 88)) (LENGTH |bas|)) |bas|)
                 ('T
                  (SEQ (LETT |rec| (SPADCALL |oper| |sols| (QREFELT % 104)))
                       (LETT |le| (|LODEEF;expsols| (QCAR |rec|) |k| |x| %))
                       (LETT |int|
                             (PROGN
                              (LETT #6# NIL)
                              (SEQ (LETT |h| NIL) (LETT #5# (QCDR |rec|)) G190
                                   (COND
                                    ((OR (ATOM #5#)
                                         (PROGN (LETT |h| (CAR #5#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #6#
                                           (CONS
                                            (|LODEEF;xpart|
                                             (SPADCALL |h| |k| (QREFELT % 92))
                                             |x| %)
                                            #6#))))
                                   (LETT #5# (CDR #5#)) (GO G190) G191
                                   (EXIT (NREVERSE #6#)))))
                       (EXIT
                        (SPADCALL
                         (PROGN
                          (LETT #4# NIL)
                          (SEQ (LETT |h| NIL) (LETT #3# |sols|) G190
                               (COND
                                ((OR (ATOM #3#)
                                     (PROGN (LETT |h| (CAR #3#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #4#
                                       (CONS
                                        (|LODEEF;xpart|
                                         (SPADCALL |h| |k| (QREFELT % 92)) |x|
                                         %)
                                        #4#))))
                               (LETT #3# (CDR #3#)) (GO G190) G191
                               (EXIT (NREVERSE #4#))))
                         (PROGN
                          (LETT #2# NIL)
                          (SEQ (LETT |e| NIL) (LETT #1# |le|) G190
                               (COND
                                ((OR (ATOM #1#)
                                     (PROGN (LETT |e| (CAR #1#)) NIL))
                                 (GO G191)))
                               (SEQ
                                (EXIT
                                 (LETT #2#
                                       (CONS (|LODEEF;multint| |e| |int| |x| %)
                                             #2#))))
                               (LETT #1# (CDR #1#)) (GO G190) G191
                               (EXIT (NREVERSE #2#))))
                         (QREFELT % 105)))))))))) 

(SDEFUN |LODEEF;homosolve1|
        ((|oper| (L)) (|sols| (|List| F)) (|k| (|Kernel| F)) (|x| (|Symbol|))
         (% (|List| F)))
        (SPROG
         ((#1=#:G159 NIL) (|e| NIL) (#2=#:G158 NIL) (|int| (|List| F))
          (#3=#:G157 NIL) (|h| NIL) (#4=#:G156 NIL)
          (|rec| (|Record| (|:| |eq| L) (|:| |op| (|List| F))))
          (|n| (|NonNegativeInteger|)) (#5=#:G145 NIL))
         (SEQ
          (COND
           ((ZEROP
             (LETT |n|
                   (PROG1
                       (LETT #5#
                             (- (SPADCALL |oper| (QREFELT % 61))
                                (LENGTH |sols|)))
                     (|check_subtype2| (>= #5# 0) '(|NonNegativeInteger|)
                                       '(|Integer|) #5#))))
            |sols|)
           ('T
            (SEQ (LETT |rec| (SPADCALL |oper| |sols| (QREFELT % 108)))
                 (LETT |int|
                       (PROGN
                        (LETT #4# NIL)
                        (SEQ (LETT |h| NIL) (LETT #3# (QCDR |rec|)) G190
                             (COND
                              ((OR (ATOM #3#) (PROGN (LETT |h| (CAR #3#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #4#
                                     (CONS (|LODEEF;xpart| |h| |x| %) #4#))))
                             (LETT #3# (CDR #3#)) (GO G190) G191
                             (EXIT (NREVERSE #4#)))))
                 (EXIT
                  (SPADCALL |sols|
                            (PROGN
                             (LETT #2# NIL)
                             (SEQ (LETT |e| NIL)
                                  (LETT #1#
                                        (|LODEEF;norf1| (QCAR |rec|) |k| |x|
                                         |n| %))
                                  G190
                                  (COND
                                   ((OR (ATOM #1#)
                                        (PROGN (LETT |e| (CAR #1#)) NIL))
                                    (GO G191)))
                                  (SEQ
                                   (EXIT
                                    (LETT #2#
                                          (CONS
                                           (|LODEEF;multint| |e| |int| |x| %)
                                           #2#))))
                                  (LETT #1# (CDR #1#)) (GO G190) G191
                                  (EXIT (NREVERSE #2#))))
                            (QREFELT % 105))))))))) 

(SDEFUN |LODEEF;norf1|
        ((|op| (L)) (|k| (|Kernel| F)) (|x| (|Symbol|))
         (|n| (|NonNegativeInteger|)) (% (|List| F)))
        (SPROG
         ((|bas| (|List| F))
          (|eq|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction| (|SparseUnivariatePolynomial| F)))))
         (SEQ
          (COND
           ((EQL |n| 1)
            (QCDR
             (|LODEEF;firstOrder| (SPADCALL |op| 0 (QREFELT % 64))
              (SPADCALL |op| (QREFELT % 65)) (|spadConstant| % 94) |x| %)))
           ((QEQCAR
             (SPADCALL
              (SPADCALL
               (SPADCALL (SPADCALL |op| (QREFELT % 110)) |x| (QREFELT % 111))
               (QREFELT % 112))
              (QREFELT % 36))
             0)
            (SEQ (LETT |eq| (|LODEEF;ulodo| |op| |k| %))
                 (EXIT
                  (COND ((EQL |n| 2) (|LODEEF;kovode| |eq| |k| |x| %))
                        (#1='T
                         (SEQ
                          (LETT |eq|
                                (SPADCALL (SPADCALL |eq| (QREFELT % 115))
                                          (QREFELT % 116)))
                          (EXIT
                           (COND
                            ((EQL (SPADCALL |eq| (QREFELT % 88)) 2)
                             (COND
                              ((NULL
                                (LETT |bas| (|LODEEF;kovode| |eq| |k| |x| %)))
                               NIL)
                              (#1#
                               (|LODEEF;homosolve1| |op| |bas| |k| |x| %))))
                            (#1# NIL)))))))))
           (#1# NIL))))) 

(SDEFUN |LODEEF;kovode|
        ((|op|
          (|LinearOrdinaryDifferentialOperator1|
           (|Fraction| (|SparseUnivariatePolynomial| F))))
         (|k| (|Kernel| F)) (|x| (|Symbol|)) (% (|List| F)))
        (SPROG
         ((|y2| (F)) (|y1| (F)) (#1=#:G186 NIL) (|e| NIL) (#2=#:G185 NIL)
          (|zp| (|List| F)) (|lc| (|List| F)) (#3=#:G184 NIL) (|crf| NIL)
          (#4=#:G183 NIL)
          (|lcrf| (|List| #5=(|Fraction| (|SparseUnivariatePolynomial| F))))
          (|ba| (F)) (|p| (|SparseUnivariatePolynomial| F))
          (|u|
           (|Union|
            (|SparseUnivariatePolynomial|
             (|Fraction| (|SparseUnivariatePolynomial| F)))
            "failed"))
          (|c| #5#) (|a| #5#) (|b| #5#))
         (SEQ (LETT |b| (SPADCALL |op| 1 (QREFELT % 90)))
              (LETT |a| (SPADCALL |op| 2 (QREFELT % 90)))
              (LETT |c| (SPADCALL |op| 0 (QREFELT % 90)))
              (LETT |u| (SPADCALL |c| |b| |a| (ELT % 97) (QREFELT % 119)))
              (EXIT
               (COND ((QEQCAR |u| 1) NIL)
                     (#6='T
                      (SEQ
                       (LETT |p|
                             (SPADCALL
                              (CONS #'|LODEEF;kovode!0| (VECTOR % |k|))
                              (QCDR |u|) (QREFELT % 123)))
                       (LETT |ba|
                             (SPADCALL
                              (SPADCALL (SPADCALL |b| |a| (QREFELT % 124))
                                        (QREFELT % 125))
                              |k| (QREFELT % 92)))
                       (LETT |lcrf| (LIST |a| |b| |c|))
                       (LETT |lc|
                             (PROGN
                              (LETT #4# NIL)
                              (SEQ (LETT |crf| NIL) (LETT #3# |lcrf|) G190
                                   (COND
                                    ((OR (ATOM #3#)
                                         (PROGN (LETT |crf| (CAR #3#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #4#
                                           (CONS
                                            (SPADCALL |crf| |k| (QREFELT % 92))
                                            #4#))))
                                   (LETT #3# (CDR #3#)) (GO G190) G191
                                   (EXIT (NREVERSE #4#)))))
                       (EXIT
                        (COND
                         ((EQL (SPADCALL |p| (QREFELT % 126)) 2)
                          (SEQ (LETT |zp| (SPADCALL |p| (QREFELT % 127)))
                               (EXIT
                                (PROGN
                                 (LETT #2# NIL)
                                 (SEQ (LETT |e| NIL) (LETT #1# |zp|) G190
                                      (COND
                                       ((OR (ATOM #1#)
                                            (PROGN (LETT |e| (CAR #1#)) NIL))
                                        (GO G191)))
                                      (SEQ
                                       (EXIT
                                        (LETT #2#
                                              (CONS
                                               (|LODEEF;simp_roots|
                                                (|LODEEF;xpart|
                                                 (SPADCALL
                                                  (SPADCALL
                                                   (SPADCALL |ba|
                                                             (SPADCALL 2
                                                                       (QREFELT
                                                                        % 129))
                                                             (QREFELT % 66))
                                                   |e| (QREFELT % 130))
                                                  |x| (QREFELT % 68))
                                                 |x| %)
                                                |lc| %)
                                               #2#))))
                                      (LETT #1# (CDR #1#)) (GO G190) G191
                                      (EXIT (NREVERSE #2#)))))))
                         (#6#
                          (SEQ
                           (LETT |y1|
                                 (|LODEEF;simp_roots|
                                  (|LODEEF;xpart|
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL |ba|
                                               (SPADCALL 2 (QREFELT % 129))
                                               (QREFELT % 66))
                                     (SPADCALL |p| (QREFELT % 131))
                                     (QREFELT % 130))
                                    |x| (QREFELT % 68))
                                   |x| %)
                                  |lc| %))
                           (LETT |y2|
                                 (|LODEEF;simp_roots|
                                  (|LODEEF;xpart|
                                   (SPADCALL
                                    (SPADCALL
                                     (SPADCALL |ba| |x| (QREFELT % 68))
                                     (SPADCALL |y1| 2 (QREFELT % 133))
                                     (QREFELT % 66))
                                    |x| (QREFELT % 54))
                                   |x| %)
                                  (CONS |y1| |lc|) %))
                           (EXIT
                            (LIST |y1|
                                  (SPADCALL |y1| |y2|
                                            (QREFELT % 69))))))))))))))) 

(SDEFUN |LODEEF;kovode!0| ((|z1| NIL) ($$ NIL))
        (PROG (|k| %)
          (LETT |k| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |z1| |k| (QREFELT % 92)))))) 

(SDEFUN |LODEEF;solve;LFSU;17|
        ((|op| (L)) (|g| (F)) (|x| (|Symbol|))
         (%
          (|Union| (|Record| (|:| |particular| F) (|:| |basis| (|List| F)))
                   "failed")))
        (SPROG ((|k| (|Kernel| F)) (|l| (|List| (|Kernel| F))))
               (COND
                ((NULL
                  (LETT |l|
                        (SPADCALL (SPADCALL |op| (QREFELT % 110)) |x|
                                  (QREFELT % 111))))
                 (CONS 0 (SPADCALL |op| |g| |x| (QREFELT % 135))))
                ((QEQCAR
                  (SPADCALL (LETT |k| (SPADCALL |l| (QREFELT % 112)))
                            (QREFELT % 36))
                  0)
                 (|LODEEF;rfSolve| |op| |g| |k| |x| %))
                ((SPADCALL (SPADCALL |k| (QREFELT % 38)) (QREFELT % 9)
                           (QREFELT % 39))
                 (|LODEEF;algSolve| |op| |g| |k| |l| |x| %))
                ('T (|LODEEF;lastChance| |op| |g| |x| %))))) 

(SDEFUN |LODEEF;ulodo|
        ((|eq| (L)) (|k| (|Kernel| F))
         (%
          (|LinearOrdinaryDifferentialOperator1|
           (|Fraction| (|SparseUnivariatePolynomial| F)))))
        (SPROG
         ((|op|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction| (|SparseUnivariatePolynomial| F)))))
         (SEQ (LETT |op| (|spadConstant| % 136))
              (SEQ G190
                   (COND
                    ((NULL
                      (SPADCALL |eq| (|spadConstant| % 137) (QREFELT % 138)))
                     (GO G191)))
                   (SEQ
                    (LETT |op|
                          (SPADCALL |op|
                                    (SPADCALL
                                     (SPADCALL (SPADCALL |eq| (QREFELT % 65))
                                               |k| (QREFELT % 140))
                                     (SPADCALL |eq| (QREFELT % 61))
                                     (QREFELT % 141))
                                    (QREFELT % 142)))
                    (EXIT (LETT |eq| (SPADCALL |eq| (QREFELT % 143)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (EXIT |op|)))) 

(SDEFUN |LODEEF;rfSolve|
        ((|eq| (L)) (|g| (F)) (|k| (|Kernel| F)) (|x| (|Symbol|))
         (%
          (|Union| (|Record| (|:| |particular| F) (|:| |basis| (|List| F)))
                   "failed")))
        (SPROG
         ((#1=#:G209 NIL)
          (|rc|
           (|Record|
            (|:| |particular|
                 (|Union| (|Fraction| (|SparseUnivariatePolynomial| F))
                          #2="failed"))
            (|:| |basis|
                 (|List| (|Fraction| (|SparseUnivariatePolynomial| F))))))
          (|op|
           (|LinearOrdinaryDifferentialOperator1|
            (|Fraction| (|SparseUnivariatePolynomial| F)))))
         (SEQ (LETT |op| (|LODEEF;ulodo| |eq| |k| %))
              (EXIT
               (COND
                ((NULL
                  (SPADCALL |k|
                            (SPADCALL (SPADCALL |g| (QREFELT % 144)) |x|
                                      (QREFELT % 70))
                            (QREFELT % 145)))
                 (SEQ
                  (LETT |rc|
                        (SPADCALL |op| (SPADCALL |g| |k| (QREFELT % 140))
                                  (QREFELT % 149)))
                  (EXIT
                   (COND
                    ((QEQCAR (QCAR |rc|) 1)
                     (|LODEEF;doVarParams| |eq| |g|
                      (|LODEEF;homosolve| |eq| |op| (QCDR |rc|) |k| |x| %) |x|
                      %))
                    (#3='T
                     (CONS 0
                           (CONS
                            (SPADCALL
                             (PROG2 (LETT #1# (QCAR |rc|))
                                 (QCDR #1#)
                               (|check_union2| (QEQCAR #1# 0)
                                               (|Fraction|
                                                (|SparseUnivariatePolynomial|
                                                 (QREFELT % 7)))
                                               (|Union|
                                                (|Fraction|
                                                 (|SparseUnivariatePolynomial|
                                                  (QREFELT % 7)))
                                                #2#)
                                               #1#))
                             |k| (QREFELT % 92))
                            (|LODEEF;homosolve| |eq| |op| (QCDR |rc|) |k| |x|
                             %))))))))
                (#3#
                 (|LODEEF;doVarParams| |eq| |g|
                  (|LODEEF;homosolve| |eq| |op|
                   (QCDR
                    (SPADCALL |op| (|spadConstant| % 150) (QREFELT % 149)))
                   |k| |x| %)
                  |x| %))))))) 

(SDEFUN |LODEEF;solve;LFSFLU;20|
        ((|op| (L)) (|g| (F)) (|x| (|Symbol|)) (|a| (F)) (|y0| (|List| F))
         (% (|Union| F "failed")))
        (SPROG
         ((|hp| (F)) (#1=#:G236 NIL) (|f| NIL) (|i| NIL) (|s| (|Vector| F))
          (|sol| (|Union| (|Vector| F) "failed")) (|h| (F)) (#2=#:G234 NIL)
          (#3=#:G235 NIL) (|yy| NIL) (|kx| (|Kernel| F)) (|v| (|Vector| F))
          (|n| (|NonNegativeInteger|)) (|b| #4=(|List| F))
          (|u|
           (|Union| (|Record| (|:| |particular| F) (|:| |basis| #4#))
                    "failed")))
         (SEQ (LETT |u| (SPADCALL |op| |g| |x| (QREFELT % 50)))
              (EXIT
               (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                     (#5='T
                      (SEQ (LETT |hp| (LETT |h| (QCAR (QCDR |u|))))
                           (LETT |b| (QCDR (QCDR |u|)))
                           (LETT |v|
                                 (MAKEARR1 (LETT |n| (LENGTH |y0|))
                                           (|spadConstant| % 94)))
                           (LETT |kx| (SPADCALL |x| (QREFELT % 151)))
                           (SEQ (LETT |yy| NIL) (LETT #3# |y0|)
                                (LETT |i| (SPADCALL |v| (QREFELT % 153)))
                                (LETT #2# (QVSIZE |v|)) G190
                                (COND
                                 ((OR (> |i| #2#) (ATOM #3#)
                                      (PROGN (LETT |yy| (CAR #3#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (SPADCALL |v| |i|
                                           (SPADCALL |yy|
                                                     (SPADCALL |h| |kx| |a|
                                                               (QREFELT % 52))
                                                     (QREFELT % 154))
                                           (QREFELT % 155))
                                 (EXIT
                                  (LETT |h|
                                        (SPADCALL (QREFELT % 11) |h|
                                                  (QREFELT % 156)))))
                                (LETT |i|
                                      (PROG1 (+ |i| 1) (LETT #3# (CDR #3#))))
                                (GO G190) G191 (EXIT NIL))
                           (LETT |sol|
                                 (SPADCALL
                                  (SPADCALL
                                   (CONS #'|LODEEF;solve;LFSFLU;20!0|
                                         (VECTOR % |a| |kx|))
                                   (SPADCALL |b| |n| (QREFELT % 158))
                                   (QREFELT % 159))
                                  |v| (QREFELT % 162)))
                           (EXIT
                            (COND ((QEQCAR |sol| 1) (CONS 1 "failed"))
                                  (#5#
                                   (SEQ
                                    (SEQ
                                     (LETT |i|
                                           (SPADCALL (LETT |s| (QCDR |sol|))
                                                     (QREFELT % 153)))
                                     (LETT |f| NIL) (LETT #1# |b|) G190
                                     (COND
                                      ((OR (ATOM #1#)
                                           (PROGN (LETT |f| (CAR #1#)) NIL))
                                       (GO G191)))
                                     (SEQ
                                      (EXIT
                                       (LETT |hp|
                                             (SPADCALL |hp|
                                                       (SPADCALL
                                                        (SPADCALL |s| |i|
                                                                  (QREFELT %
                                                                           163))
                                                        |f| (QREFELT % 69))
                                                       (QREFELT % 130)))))
                                     (LETT #1#
                                           (PROG1 (CDR #1#)
                                             (LETT |i| (+ |i| 1))))
                                     (GO G190) G191 (EXIT NIL))
                                    (EXIT (CONS 0 |hp|))))))))))))) 

(SDEFUN |LODEEF;solve;LFSFLU;20!0| ((|f1| NIL) ($$ NIL))
        (PROG (|kx| |a| %)
          (LETT |kx| (QREFELT $$ 2))
          (LETT |a| (QREFELT $$ 1))
          (LETT % (QREFELT $$ 0))
          (RETURN (PROGN (SPADCALL |f1| |kx| |a| (QREFELT % 52)))))) 

(SDEFUN |LODEEF;localmap| ((|f| (|Mapping| F F)) (|op| (L)) (% (L)))
        (SPROG ((|ans| (L)))
               (SEQ (LETT |ans| (|spadConstant| % 137))
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL |op| (|spadConstant| % 137)
                                      (QREFELT % 138)))
                           (GO G191)))
                         (SEQ
                          (LETT |ans|
                                (SPADCALL |ans|
                                          (SPADCALL
                                           (SPADCALL
                                            (SPADCALL |op| (QREFELT % 65)) |f|)
                                           (SPADCALL |op| (QREFELT % 61))
                                           (QREFELT % 165))
                                          (QREFELT % 166)))
                          (EXIT (LETT |op| (SPADCALL |op| (QREFELT % 143)))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |ans|)))) 

(SDEFUN |LODEEF;palgSolve|
        ((|op| (L)) (|g| (F)) (|kx| (|Kernel| F)) (|k| (|Kernel| F))
         (|x| (|Symbol|))
         (%
          (|Union| (|Record| (|:| |particular| F) (|:| |basis| (|List| F)))
                   "failed")))
        (SPROG
         ((#1=#:G248 NIL)
          (|rec|
           (|Record| (|:| |particular| (|Union| F #2="failed"))
                     (|:| |basis| (|List| F)))))
         (SEQ (LETT |rec| (SPADCALL |op| |g| |kx| |k| |x| (QREFELT % 169)))
              (EXIT
               (COND
                ((QEQCAR (QCAR |rec|) 1)
                 (|LODEEF;doVarParams| |op| |g|
                  (|LODEEF;homosolve1| |op| (QCDR |rec|) |k| |x| %) |x| %))
                ('T
                 (CONS 0
                       (CONS
                        (PROG2 (LETT #1# (QCAR |rec|))
                            (QCDR #1#)
                          (|check_union2| (QEQCAR #1# 0) (QREFELT % 7)
                                          (|Union| (QREFELT % 7) #2#) #1#))
                        (|LODEEF;homosolve1| |op| (QCDR |rec|) |k| |x|
                         %))))))))) 

(DECLAIM (NOTINLINE |ElementaryFunctionLODESolver;|)) 

(DEFUN |ElementaryFunctionLODESolver;| (|#1| |#2| |#3|)
  (SPROG ((|pv$| NIL) (% NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT DV$2 (|devaluate| |#2|))
          (LETT DV$3 (|devaluate| |#3|))
          (LETT |dv$| (LIST '|ElementaryFunctionLODESolver| DV$1 DV$2 DV$3))
          (LETT % (GETREFV 170))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3 (LETT |pv$| (|buildPredVector| 0 0 NIL)))
          (|haddProp| |$ConstructorCache| '|ElementaryFunctionLODESolver|
                      (LIST DV$1 DV$2 DV$3) (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (QSETREFV % 7 |#2|)
          (QSETREFV % 8 |#3|)
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 9 '|%alg|)
          (QSETREFV % 11 (SPADCALL (QREFELT % 10)))
          %))) 

(DEFUN |ElementaryFunctionLODESolver| (&REST #1=#:G252)
  (SPROG NIL
         (PROG (#2=#:G253)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|ElementaryFunctionLODESolver|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |ElementaryFunctionLODESolver;|) #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|ElementaryFunctionLODESolver|)))))))))) 

(MAKEPROP '|ElementaryFunctionLODESolver| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|)
              (|local| |#3|) 'ALGOP (0 . D) '|diff| (|List| 22) (4 . |tower|)
              (|List| %) (9 . |tower|) (|List| 20) (14 . |setDifference|)
              (|Boolean|) (|Symbol|) (|Kernel| 7) (20 . |is?|) (|Kernel| %)
              (26 . |coerce|) (|AlgebraicManipulations| 6 7) (31 . |rootSimp|)
              (36 . |subst|) (|SparseMultivariatePolynomial| 31 20)
              (43 . |primitivePart|) (|List| 31) (48 . |eval|)
              (|SparseMultivariatePolynomial| 6 20) (55 . |ground|)
              (|IntegrationTools| 6 7) (60 . |ksec|) (|Union| 19 '"failed")
              (67 . |symbolIfCan|) (|BasicOperator|) (72 . |operator|)
              (77 . |has?|)
              (|Record| (|:| |primelt| 7) (|:| |pol1| 45) (|:| |pol2| 45)
                        (|:| |prim| 45))
              (|FunctionSpacePrimitiveElement| 6 7) (83 . |primitiveElement|)
              (|SparseUnivariatePolynomial| %) (89 . |rootOf|)
              (|SparseUnivariatePolynomial| 7) (94 . |elt|) (100 . |eval|)
              (|Record| (|:| |particular| 7) (|:| |basis| 56))
              (|Union| 48 '#1="failed") |LODEEF;solve;LFSU;17|
              (107 . |retract|) (112 . |eval|) (|ODEIntegration| 6 7)
              (119 . |int|) (|Union| 7 '"failed") (|List| 7) (|Mapping| 7 7)
              (|ODETools| 7 8) (125 . |particularSolution|)
              (|NonNegativeInteger|) (133 . |degree|) (138 . |One|)
              (142 . |Zero|) (146 . |coefficient|) (152 . |leadingCoefficient|)
              (157 . /) (163 . -) (168 . |expint|) (174 . *)
              (180 . |varselect|) (186 . |coerce|)
              (|SparseMultivariatePolynomial| 6 22) (191 . |numer|)
              (196 . |denom|) (201 . /) (207 . |coerce|) (212 . |univariate|)
              (218 . |Zero|) (|SparseUnivariatePolynomial| 31) (222 . |Zero|)
              (226 . ~=) (232 . |leadingCoefficient|) (237 . |degree|)
              (242 . |monomial|) (249 . +) (255 . |reductum|)
              (|LinearOrdinaryDifferentialOperator1| 89) (260 . |degree|)
              (|Fraction| 45) (265 . |coefficient|)
              (|PolynomialCategoryQuotientFunctions| (|IndexedExponents| 20) 20
                                                     6 31 7)
              (271 . |multivariate|) (277 . |leadingCoefficient|)
              (282 . |Zero|) (|Factored| 45) (|ExpressionFactorPolynomial| 6 7)
              (286 . |factorPolynomial|) (|List| 89) (|Mapping| 95 45)
              (|RationalRicDE| 7 45) (291 . |ricDsolve|)
              (|Record| (|:| |eq| 87) (|:| |op| 98)) (|ReductionOfOrder| 89 87)
              (297 . |ReduceOrder|) (303 . |concat!|)
              (|Record| (|:| |eq| 8) (|:| |op| 56)) (|ReductionOfOrder| 7 8)
              (309 . |ReduceOrder|) (315 . |One|) (319 . |coefficients|)
              (324 . |vark|) (330 . |kmax|) (|List| 87)
              (|LinearOrdinaryDifferentialOperatorFactorizer| 7 45)
              (335 . |factor1|) (340 . |last|) (|Union| 121 '"failed")
              (|Kovacic| 7 45) (345 . |kovacic|) (|Mapping| 7 89)
              (|SparseUnivariatePolynomial| 89)
              (|SparseUnivariatePolynomialFunctions2| 89 7) (353 . |map|)
              (359 . /) (365 . -) (370 . |degree|) (375 . |zerosOf|)
              (|Integer|) (380 . |coerce|) (385 . +) (391 . |zeroOf|)
              (|PositiveInteger|) (396 . ^) (|ConstantLODE| 6 7 8)
              (402 . |constDsolve|) (409 . |Zero|) (413 . |Zero|) (417 . ~=)
              (|Fraction| 43) (423 . |univariate|) (429 . |monomial|) (435 . +)
              (441 . |reductum|) (446 . |kernels|) (451 . |remove!|)
              (|Union| 89 '"failed")
              (|Record| (|:| |particular| 146) (|:| |basis| 98))
              (|RationalLODE| 7 45) (457 . |ratDsolve|) (463 . |Zero|)
              (467 . |kernel|) (|Vector| 7) (472 . |minIndex|) (477 . -)
              (483 . |setelt!|) (490 . |elt|) (|Matrix| 7)
              (496 . |wronskianMatrix|) (502 . |map!|) (|Union| 152 '"failed")
              (|LinearSystemMatrixPackage| 7 152 152 157)
              (508 . |particularSolution|) (514 . |elt|)
              |LODEEF;solve;LFSFLU;20| (520 . |monomial|) (526 . +)
              (|Record| (|:| |particular| 55) (|:| |basis| 56))
              (|PureAlgebraicIntegration| 6 7 8) (532 . |palgLODE|))
           '#(|solve| 541) 'NIL
           (CONS (|makeByteWordVec2| 1 '(0))
                 (CONS '#(NIL)
                       (CONS
                        '#((|Join|
                            (|mkCategory|
                             (LIST
                              '((|solve|
                                 ((|Union|
                                   (|Record| (|:| |particular| |#2|)
                                             (|:| |basis| (|List| |#2|)))
                                   #1#)
                                  |#3| |#2| (|Symbol|)))
                                T)
                              '((|solve|
                                 ((|Union| |#2| "failed") |#3| |#2| (|Symbol|)
                                  |#2| (|List| |#2|)))
                                T))
                             (LIST) NIL NIL)))
                        (|makeByteWordVec2| 169
                                            '(0 8 0 10 1 7 12 0 13 1 7 12 14 15
                                              2 16 0 0 0 17 2 20 18 0 19 21 1 7
                                              0 22 23 1 24 7 7 25 3 7 0 0 12 14
                                              26 1 27 0 0 28 3 27 0 0 16 29 30
                                              1 27 31 0 32 3 33 20 20 16 19 34
                                              1 20 35 0 36 1 20 37 0 38 2 37 18
                                              0 19 39 2 41 40 7 7 42 1 7 0 43
                                              44 2 45 7 0 7 46 3 7 0 0 12 14 47
                                              1 7 22 0 51 3 7 0 0 22 0 52 2 53
                                              7 7 19 54 4 58 55 8 7 56 57 59 1
                                              8 60 0 61 0 6 0 62 0 6 0 63 2 8 7
                                              0 60 64 1 8 7 0 65 2 7 0 0 0 66 1
                                              7 0 0 67 2 53 7 7 19 68 2 7 0 0 0
                                              69 2 33 16 16 19 70 1 31 0 20 71
                                              1 7 72 0 73 1 7 72 0 74 2 7 0 72
                                              72 75 1 27 0 31 76 2 31 43 0 20
                                              77 0 27 0 78 0 79 0 80 2 79 18 0
                                              0 81 1 79 31 0 82 1 79 60 0 83 3
                                              27 0 0 20 60 84 2 27 0 0 0 85 1
                                              79 0 0 86 1 87 60 0 88 2 87 89 0
                                              60 90 2 91 7 89 20 92 1 87 89 0
                                              93 0 7 0 94 1 96 95 45 97 2 100
                                              98 87 99 101 2 103 102 87 98 104
                                              2 56 0 0 0 105 2 107 106 8 56 108
                                              0 7 0 109 1 8 56 0 110 2 33 16 56
                                              19 111 1 33 20 16 112 1 114 113
                                              87 115 1 113 87 0 116 4 118 117
                                              89 89 89 99 119 2 122 45 120 121
                                              123 2 89 0 0 0 124 1 89 0 0 125 1
                                              45 60 0 126 1 7 14 43 127 1 7 0
                                              128 129 2 7 0 0 0 130 1 7 0 43
                                              131 2 7 0 0 132 133 3 134 48 8 7
                                              19 135 0 87 0 136 0 8 0 137 2 8
                                              18 0 0 138 2 7 139 0 22 140 2 87
                                              0 89 60 141 2 87 0 0 0 142 1 8 0
                                              0 143 1 7 12 0 144 2 16 0 20 0
                                              145 2 148 147 87 89 149 0 89 0
                                              150 1 20 0 19 151 1 152 128 0 153
                                              2 7 0 0 0 154 3 152 7 0 128 7 155
                                              2 8 7 0 7 156 2 58 157 56 60 158
                                              2 157 0 57 0 159 2 161 160 157
                                              152 162 2 152 7 0 128 163 2 8 0 7
                                              60 165 2 8 0 0 0 166 5 168 167 8
                                              7 20 20 19 169 3 0 49 8 7 19 50 5
                                              0 55 8 7 19 7 56 164)))))
           '|lookupComplete|)) 
