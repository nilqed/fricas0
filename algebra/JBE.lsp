
(SDEFUN |JBE;coerce;JB%;1| ((|jv| (JB)) (% (%))) (SPADCALL |jv| (QREFELT % 8))) 

(PUT '|JBE;coerce;E%;2| '|SPADreplace| '(XLAM (|exp|) |exp|)) 

(SDEFUN |JBE;coerce;E%;2| ((|exp| (|Expression| (|Integer|))) (% (%))) |exp|) 

(PUT '|JBE;coerce;%E;3| '|SPADreplace| '(XLAM (|f|) |f|)) 

(SDEFUN |JBE;coerce;%E;3| ((|f| (%)) (% (|Expression| (|Integer|)))) |f|) 

(SDEFUN |JBE;coerce;Smp%;4|
        ((|p| (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| %)))
         (% (%)))
        (SPADCALL |p| (|spadConstant| % 13) (QREFELT % 15))) 

(SDEFUN |JBE;numerJP;%Smp;5|
        ((|f| (%))
         (% (|SparseMultivariatePolynomial| (|Expression| (|Integer|)) JB)))
        (SPROG
         ((|res|
           (|SparseMultivariatePolynomial| (|Expression| (|Integer|)) JB))
          (|Exp| (|List| (|NonNegativeInteger|))) (JV (|List| JB))
          (|newco| (|Expression| (|Integer|))) (|jv| (|Union| JB "failed"))
          (|vs| (%)) (#1=#:G46 NIL) (|v| NIL) (#2=#:G44 NIL) (|mon| NIL)
          (#3=#:G45 NIL) (|co| NIL) (CO (|List| (|Integer|)))
          (PM
           (|List| (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| %))))
          (|p| (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| %))))
         (SEQ (LETT |res| (|spadConstant| % 18))
              (LETT |p| (SPADCALL |f| (QREFELT % 19)))
              (LETT PM (SPADCALL |p| (QREFELT % 21)))
              (LETT CO (SPADCALL |p| (QREFELT % 23)))
              (SEQ (LETT |co| NIL) (LETT #3# CO) (LETT |mon| NIL) (LETT #2# PM)
                   G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |mon| (CAR #2#)) NIL)
                         (ATOM #3#) (PROGN (LETT |co| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (LETT JV NIL) (LETT |Exp| NIL)
                        (LETT |newco| (SPADCALL |co| (QREFELT % 25)))
                        (SEQ (LETT |v| NIL)
                             (LETT #1# (SPADCALL |mon| (QREFELT % 27))) G190
                             (COND
                              ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ (LETT |vs| (SPADCALL |v| (QREFELT % 29)))
                                  (LETT |jv| (SPADCALL |vs| (QREFELT % 31)))
                                  (EXIT
                                   (COND
                                    ((QEQCAR |jv| 1)
                                     (LETT |newco|
                                           (SPADCALL |newco|
                                                     (SPADCALL |vs|
                                                               (QREFELT % 11))
                                                     (QREFELT % 32))))
                                    ('T
                                     (SEQ (LETT JV (CONS (QCDR |jv|) JV))
                                          (EXIT
                                           (LETT |Exp|
                                                 (CONS
                                                  (SPADCALL |mon| |v|
                                                            (QREFELT % 35))
                                                  |Exp|))))))))
                             (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (LETT |res|
                               (SPADCALL |res|
                                         (SPADCALL |newco|
                                                   (SPADCALL
                                                    (|spadConstant| % 38)
                                                    (NREVERSE JV)
                                                    (NREVERSE |Exp|)
                                                    (QREFELT % 41))
                                                   (QREFELT % 42))
                                         (QREFELT % 43)))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |JBE;coerce;Smp%;6|
        ((|p| (|SparseMultivariatePolynomial| (|Expression| (|Integer|)) JB))
         (% (%)))
        (SPROG
         ((|res| (%)) (|prod| (%)) (#1=#:G56 NIL) (|v| NIL) (#2=#:G54 NIL)
          (|mon| NIL) (#3=#:G55 NIL) (|co| NIL)
          (CO (|List| (|Expression| (|Integer|))))
          (PM
           (|List|
            (|SparseMultivariatePolynomial| (|Expression| (|Integer|)) JB))))
         (SEQ (LETT |res| (|spadConstant| % 45))
              (LETT PM (SPADCALL |p| (QREFELT % 46)))
              (LETT CO (SPADCALL |p| (QREFELT % 48)))
              (SEQ (LETT |co| NIL) (LETT #3# CO) (LETT |mon| NIL) (LETT #2# PM)
                   G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |mon| (CAR #2#)) NIL)
                         (ATOM #3#) (PROGN (LETT |co| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |prod| |co|)
                        (SEQ (LETT |v| NIL)
                             (LETT #1# (SPADCALL |mon| (QREFELT % 49))) G190
                             (COND
                              ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |prod|
                                     (SPADCALL |prod|
                                               (SPADCALL
                                                (SPADCALL |v| (QREFELT % 9))
                                                (SPADCALL |p| |v|
                                                          (QREFELT % 50))
                                                (QREFELT % 51))
                                               (QREFELT % 52)))))
                             (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (LETT |res| (SPADCALL |res| |prod| (QREFELT % 53)))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |JBE;gcd;3%;7| ((|f1| (%)) (|f2| (%)) (% (%)))
        (SPADCALL
         (SPADCALL (SPADCALL |f1| (QREFELT % 19))
                   (SPADCALL |f2| (QREFELT % 19)) (QREFELT % 55))
         (QREFELT % 16))) 

(SDEFUN |JBE;exquo;2%U;8| ((|f1| (%)) (|f2| (%)) (% (|Union| % "failed")))
        (SPROG
         ((|p|
           (|Union| (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| %))
                    "failed")))
         (SEQ
          (LETT |p|
                (SPADCALL (SPADCALL |f1| (QREFELT % 19))
                          (SPADCALL |f2| (QREFELT % 19)) (QREFELT % 58)))
          (EXIT
           (COND ((QEQCAR |p| 1) (CONS 1 "failed"))
                 ('T (CONS 0 (SPADCALL (QCDR |p|) (QREFELT % 16))))))))) 

(SDEFUN |JBE;recip;%U;9| ((|f| (%)) (% (|Union| % "failed")))
        (CONS 0 (SPADCALL (|spadConstant| % 36) |f| (QREFELT % 60)))) 

(SDEFUN |JBE;purge|
        ((|l| (|List| (|Kernel| %))) (|q| (|NonNegativeInteger|))
         (% (|List| (|Kernel| %))))
        (SPROG ((#1=#:G74 NIL) (|k| NIL) (#2=#:G73 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |k| NIL) (LETT #1# |l|) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((EQL
                           (SPADCALL (SPADCALL |k| (QREFELT % 29))
                                     (QREFELT % 62))
                           |q|)
                          (LETT #2# (CONS |k| #2#))))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |JBE;dimrec|
        ((|lmv| (|List| (|List| (|Kernel| %))))
         (|indVars| (|List| (|Kernel| %))) (|remVars| #1=(|List| (|Kernel| %)))
         (|sets| #2=(|List| (|List| (|Kernel| %))))
         (% (|List| (|List| (|Kernel| %)))))
        (SPROG
         ((|res| #2#) (|elem| (|Boolean|)) (#3=#:G96 NIL) (|ik| NIL)
          (#4=#:G95 NIL) (#5=#:G93 NIL) (|m| NIL) (#6=#:G94 NIL) (#7=#:G91 NIL)
          (|lv| NIL) (#8=#:G92 NIL) (|indK| (|List| (|Kernel| %)))
          (|newVars| #1#) (|jk| (|Kernel| %)))
         (SEQ (LETT |res| |sets|) (LETT |newVars| |remVars|)
              (SEQ G190 (COND ((NULL (NULL (NULL |newVars|))) (GO G191)))
                   (SEQ (LETT |jk| (SPADCALL |newVars| (QREFELT % 63)))
                        (LETT |newVars| (CDR |newVars|)) (LETT |elem| NIL)
                        (LETT |indK| (SPADCALL |indVars| |jk| (QREFELT % 64)))
                        (SEQ (LETT #8# NIL) (LETT |lv| NIL) (LETT #7# |lmv|)
                             G190
                             (COND
                              ((OR (ATOM #7#) (PROGN (LETT |lv| (CAR #7#)) NIL)
                                   #8#)
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |elem|
                                     (SPADCALL |lv| |indK| (QREFELT % 66)))))
                             (LETT #7# (PROG1 (CDR #7#) (LETT #8# |elem|)))
                             (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          ((NULL |elem|)
                           (LETT |res|
                                 (|JBE;dimrec| |lmv| |indK| |newVars| |res|
                                  %))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |elem| NIL)
              (SEQ (LETT #6# NIL) (LETT |m| NIL) (LETT #5# |res|) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |m| (CAR #5#)) NIL) #6#)
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |elem|
                           (SPADCALL (ELT % 68)
                                     (PROGN
                                      (LETT #4# NIL)
                                      (SEQ (LETT |ik| NIL) (LETT #3# |indVars|)
                                           G190
                                           (COND
                                            ((OR (ATOM #3#)
                                                 (PROGN
                                                  (LETT |ik| (CAR #3#))
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT #4#
                                                   (CONS
                                                    (SPADCALL |ik| |m|
                                                              (QREFELT % 67))
                                                    #4#))))
                                           (LETT #3# (CDR #3#)) (GO G190) G191
                                           (EXIT (NREVERSE #4#))))
                                     'T (QREFELT % 71)))))
                   (LETT #5# (PROG1 (CDR #5#) (LETT #6# |elem|))) (GO G190)
                   G191 (EXIT NIL))
              (COND
               ((NULL |elem|)
                (LETT |res| (SPADCALL |indVars| |res| (QREFELT % 73)))))
              (EXIT |res|)))) 

(SDEFUN |JBE;dimension;LSem2Nni;12|
        ((|sys| (|List| %)) (|jm| (|SparseEchelonMatrix| JB %))
         (|q| (|NonNegativeInteger|)) (% (|NonNegativeInteger|)))
        (SPROG
         ((|dim| (|NonNegativeInteger|)) (#1=#:G110 NIL) (|ind| NIL)
          (|indSets| (|List| (|List| (|Kernel| %))))
          (|dim0| (|NonNegativeInteger|)) (#2=#:G102 NIL)
          (|allvars| (|List| (|Kernel| %))) (#3=#:G109 NIL) (|lv| NIL)
          (|lmv| (|List| (|List| (|Kernel| %)))) (#4=#:G108 NIL) (|p| NIL)
          (#5=#:G107 NIL)
          (|polys|
           (|List| (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| %)))))
         (SEQ (LETT |polys| (SPADCALL (ELT % 19) |sys| (QREFELT % 78)))
              (LETT |lmv|
                    (PROGN
                     (LETT #5# NIL)
                     (SEQ (LETT |p| NIL) (LETT #4# |polys|) G190
                          (COND
                           ((OR (ATOM #4#) (PROGN (LETT |p| (CAR #4#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #5#
                                  (CONS
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |p| (QREFELT % 79))
                                              (QREFELT % 27))
                                    (QREFELT % 80))
                                   #5#))))
                          (LETT #4# (CDR #4#)) (GO G190) G191
                          (EXIT (NREVERSE #5#)))))
              (LETT |allvars| (SPADCALL |lmv| (QREFELT % 81)))
              (SEQ (LETT |lv| NIL) (LETT #3# (CDR |lmv|)) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |lv| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |allvars|
                           (SPADCALL (SPADCALL |lv| |allvars| (QREFELT % 82))
                                     (QREFELT % 83)))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (LETT |dim0|
                    (PROG1
                        (LETT #2#
                              (- (SPADCALL |q| (QREFELT % 84))
                                 (LENGTH |allvars|)))
                      (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #2#)))
              (LETT |indSets| (|JBE;dimrec| |lmv| NIL |allvars| NIL %))
              (LETT |dim| 0)
              (SEQ (LETT |ind| NIL) (LETT #1# |indSets|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |ind| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (LETT |dim| (MAX |dim| (LENGTH |ind|)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (+ |dim0| |dim|))))) 

(SDEFUN |JBE;orderDim;LSem2Nni;13|
        ((|sys| (|List| %)) (|jm| (|SparseEchelonMatrix| JB %))
         (|q| (|NonNegativeInteger|)) (% (|NonNegativeInteger|)))
        (SPROG
         ((|dim| (|NonNegativeInteger|)) (#1=#:G124 NIL) (|ind| NIL)
          (|indSets| (|List| (|List| (|Kernel| %))))
          (|dim0| (|NonNegativeInteger|)) (#2=#:G116 NIL)
          (|allvars| (|List| (|Kernel| %))) (#3=#:G123 NIL) (|lv| NIL)
          (|lmv| (|List| (|List| (|Kernel| %)))) (#4=#:G122 NIL) (|p| NIL)
          (#5=#:G121 NIL)
          (|polys|
           (|List| (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| %)))))
         (SEQ (LETT |polys| (SPADCALL (ELT % 19) |sys| (QREFELT % 78)))
              (LETT |lmv|
                    (PROGN
                     (LETT #5# NIL)
                     (SEQ (LETT |p| NIL) (LETT #4# |polys|) G190
                          (COND
                           ((OR (ATOM #4#) (PROGN (LETT |p| (CAR #4#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #5#
                                  (CONS
                                   (SPADCALL
                                    (|JBE;purge|
                                     (SPADCALL (SPADCALL |p| (QREFELT % 79))
                                               (QREFELT % 27))
                                     |q| %)
                                    (QREFELT % 80))
                                   #5#))))
                          (LETT #4# (CDR #4#)) (GO G190) G191
                          (EXIT (NREVERSE #5#)))))
              (LETT |allvars| (SPADCALL |lmv| (QREFELT % 81)))
              (SEQ (LETT |lv| NIL) (LETT #3# (CDR |lmv|)) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |lv| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |allvars|
                           (SPADCALL (SPADCALL |lv| |allvars| (QREFELT % 82))
                                     (QREFELT % 83)))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (LETT |dim0|
                    (PROG1
                        (LETT #2#
                              (- (SPADCALL |q| (QREFELT % 87))
                                 (LENGTH |allvars|)))
                      (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #2#)))
              (LETT |indSets| (|JBE;dimrec| |lmv| NIL |allvars| NIL %))
              (LETT |dim| 0)
              (SEQ (LETT |ind| NIL) (LETT #1# |indSets|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |ind| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (LETT |dim| (MAX |dim| (LENGTH |ind|)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (+ |dim0| |dim|))))) 

(SDEFUN |JBE;simpSMP|
        ((|p| (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| %)))
         (% (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| %))))
        (SPROG
         ((|up|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| %))))
          (|md| (|NonNegativeInteger|))
          (|lc| (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| %)))
          (|v| (|Kernel| %)) (|tv| (|Union| (|Kernel| %) "failed")))
         (SEQ
          (COND ((SPADCALL |p| (QREFELT % 89)) (|spadConstant| % 13))
                (#1='T
                 (SEQ (LETT |tv| (SPADCALL |p| (QREFELT % 91)))
                      (EXIT
                       (COND ((QEQCAR |tv| 1) (|error| "inconsistent system"))
                             (#1#
                              (SEQ (LETT |v| (QCDR |tv|))
                                   (LETT |up|
                                         (SPADCALL |p| |v| (QREFELT % 93)))
                                   (EXIT
                                    (COND
                                     ((SPADCALL |up| (QREFELT % 95))
                                      (SEQ
                                       (LETT |lc|
                                             (SPADCALL |up| (QREFELT % 96)))
                                       (EXIT
                                        (COND
                                         ((QEQCAR
                                           (SPADCALL |lc| (QREFELT % 91)) 1)
                                          (SPADCALL (|spadConstant| % 13) |v| 1
                                                    (QREFELT % 97)))
                                         (#1#
                                          (SPADCALL (|JBE;simpSMP| |lc| %) |v|
                                                    1 (QREFELT % 97)))))))
                                     (#1#
                                      (SEQ
                                       (LETT |md|
                                             (SPADCALL |up| (QREFELT % 98)))
                                       (EXIT
                                        (COND
                                         ((> |md| 0)
                                          (SEQ
                                           (LETT |up|
                                                 (QCAR
                                                  (SPADCALL |up|
                                                            (SPADCALL
                                                             (|spadConstant| %
                                                                             13)
                                                             |md|
                                                             (QREFELT % 100))
                                                            (QREFELT % 102))))
                                           (EXIT
                                            (SPADCALL |up| |v|
                                                      (QREFELT % 103)))))
                                         (#1# |p|))))))))))))))))) 

(SDEFUN |JBE;simpOne;2%;15| ((|f| (%)) (% (%)))
        (COND ((SPADCALL |f| (QREFELT % 104)) (|spadConstant| % 45))
              ('T
               (SPADCALL (|JBE;simpSMP| (SPADCALL |f| (QREFELT % 19)) %)
                         (QREFELT % 16))))) 

(SDEFUN |JBE;greaterLD|
        ((|r1|
          (|Record| (|:| |Fun| %)
                    (|:| JMR
                         (|Record| (|:| |Indices| #1=(|List| JB))
                                   (|:| |Entries| (|List| %))))
                    (|:| |Depend| (|List| (|NonNegativeInteger|)))))
         (|r2|
          (|Record| (|:| |Fun| %)
                    (|:| JMR
                         (|Record| (|:| |Indices| (|List| JB))
                                   (|:| |Entries| (|List| %))))
                    (|:| |Depend| (|List| (|NonNegativeInteger|)))))
         (% (|Boolean|)))
        (SPROG ((|ind2| #1#) (|ind1| #1#))
               (SEQ
                (COND ((NULL (QCAR (QVELT |r1| 1))) NIL)
                      ((NULL (QCAR (QVELT |r2| 1))) 'T)
                      (#2='T
                       (SEQ (LETT |ind1| (QCAR (QVELT |r1| 1)))
                            (LETT |ind2| (QCAR (QVELT |r2| 1)))
                            (EXIT
                             (COND
                              ((SPADCALL (|SPADfirst| |ind1|)
                                         (|SPADfirst| |ind2|) (QREFELT % 106))
                               (< (LENGTH |ind1|) (LENGTH |ind2|)))
                              (#2#
                               (SPADCALL (|SPADfirst| |ind1|)
                                         (|SPADfirst| |ind2|)
                                         (QREFELT % 107))))))))))) 

(SDEFUN |JBE;groebner| ((|sys| (|List| %)) (% (|List| %)))
        (SPROG
         ((|gbase|
           (|List| (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| %))))
          (|polys|
           (|List| (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| %)))))
         (SEQ (LETT |polys| (SPADCALL (ELT % 19) |sys| (QREFELT % 78)))
              (SPADCALL
               (SPADCALL (SPADCALL "polys" (QREFELT % 110))
                         (SPADCALL |polys| (QREFELT % 111)) (QREFELT % 112))
               (QREFELT % 114))
              (LETT |gbase| (SPADCALL |polys| (QREFELT % 116)))
              (EXIT (SPADCALL (ELT % 16) |gbase| (QREFELT % 119)))))) 

(SDEFUN |JBE;groebnerSimp|
        ((|sysL|
          (|List|
           (|Record| (|:| |Fun| %)
                     (|:| JMR
                          (|Record| (|:| |Indices| (|List| JB))
                                    (|:| |Entries| (|List| %))))
                     (|:| |Depend| (|List| (|NonNegativeInteger|))))))
         (|ind| (|List| JB))
         (%
          (|List|
           (|Record| (|:| |Fun| %)
                     (|:| JMR
                          (|Record| (|:| |Indices| (|List| JB))
                                    (|:| |Entries| (|List| %))))
                     (|:| |Depend| (|List| (|NonNegativeInteger|)))))))
        (SPROG
         ((#1=#:G170 NIL) (|fun| NIL) (|i| NIL) (#2=#:G169 NIL)
          (|resJM| (|SparseEchelonMatrix| JB %)) (#3=#:G168 NIL) (|eq| NIL)
          (#4=#:G167 NIL) (|resSys| (|List| %)) (#5=#:G166 NIL) (|rec| NIL)
          (#6=#:G165 NIL) (|resDep| (|List| (|NonNegativeInteger|)))
          (|tmp| (|List| (|List| (|NonNegativeInteger|)))) (#7=#:G164 NIL)
          (#8=#:G163 NIL))
         (SEQ
          (SPADCALL
           (SPADCALL (SPADCALL "groebnerSimp: #" (QREFELT % 110))
                     (SPADCALL (LENGTH |sysL|) (QREFELT % 120))
                     (QREFELT % 112))
           (QREFELT % 114))
          (LETT |tmp|
                (PROGN
                 (LETT #8# NIL)
                 (SEQ (LETT |rec| NIL) (LETT #7# |sysL|) G190
                      (COND
                       ((OR (ATOM #7#) (PROGN (LETT |rec| (CAR #7#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #8# (CONS (QVELT |rec| 2) #8#))))
                      (LETT #7# (CDR #7#)) (GO G190) G191
                      (EXIT (NREVERSE #8#)))))
          (LETT |resDep| (SPADCALL (ELT % 121) |tmp| NIL (QREFELT % 124)))
          (LETT |resSys|
                (|JBE;groebner|
                 (PROGN
                  (LETT #6# NIL)
                  (SEQ (LETT |rec| NIL) (LETT #5# |sysL|) G190
                       (COND
                        ((OR (ATOM #5#) (PROGN (LETT |rec| (CAR #5#)) NIL))
                         (GO G191)))
                       (SEQ (EXIT (LETT #6# (CONS (QVELT |rec| 0) #6#))))
                       (LETT #5# (CDR #5#)) (GO G190) G191
                       (EXIT (NREVERSE #6#))))
                 %))
          (LETT |resJM|
                (SPADCALL |resSys|
                          (PROGN
                           (LETT #4# NIL)
                           (SEQ (LETT |eq| NIL) (LETT #3# |resSys|) G190
                                (COND
                                 ((OR (ATOM #3#)
                                      (PROGN (LETT |eq| (CAR #3#)) NIL))
                                  (GO G191)))
                                (SEQ (EXIT (LETT #4# (CONS |ind| #4#))))
                                (LETT #3# (CDR #3#)) (GO G190) G191
                                (EXIT (NREVERSE #4#))))
                          (QREFELT % 126)))
          (SPADCALL (SPADCALL "END groebnerSimp" (QREFELT % 110))
                    (QREFELT % 114))
          (EXIT
           (PROGN
            (LETT #2# NIL)
            (SEQ (LETT |i| 1) (LETT |fun| NIL) (LETT #1# |resSys|) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |fun| (CAR #1#)) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2#
                         (CONS
                          (VECTOR |fun| (SPADCALL |resJM| |i| (QREFELT % 129))
                                  |resDep|)
                          #2#))))
                 (LETT #1# (PROG1 (CDR #1#) (LETT |i| (|inc_SI| |i|))))
                 (GO G190) G191 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |JBE;linearSimp|
        ((|sysL|
          (|List|
           (|Record| (|:| |Fun| %)
                     (|:| JMR
                          (|Record| (|:| |Indices| (|List| JB))
                                    (|:| |Entries| (|List| %))))
                     (|:| |Depend| (|List| (|NonNegativeInteger|))))))
         (|ind| (|List| JB))
         (%
          (|List|
           (|Record| (|:| |Fun| %)
                     (|:| JMR
                          (|Record| (|:| |Indices| (|List| JB))
                                    (|:| |Entries| (|List| %))))
                     (|:| |Depend| (|List| (|NonNegativeInteger|)))))))
        (SPROG
         ((|res|
           (|List|
            (|Record| (|:| |Fun| %)
                      (|:| JMR
                           (|Record| (|:| |Indices| (|List| JB))
                                     (|:| |Entries| (|List| %))))
                      (|:| |Depend| (|List| (|NonNegativeInteger|))))))
          (|newDep| (|List| (|NonNegativeInteger|)))
          (|newJMR|
           (|Record| (|:| |Indices| (|List| JB)) (|:| |Entries| (|List| %))))
          (|newFun| (%)) (#1=#:G194 NIL)
          (|sdep| (|List| (|NonNegativeInteger|))) (|ssub| (%)) (#2=#:G176 NIL)
          (|rsysL|
           (|List|
            (|Record| (|:| |Fun| %)
                      (|:| JMR
                           (|Record| (|:| |Indices| (|List| JB))
                                     (|:| |Entries| (|List| %))))
                      (|:| |Depend| (|List| (|NonNegativeInteger|))))))
          (|sld| (JB))
          (|srec|
           #3=(|Record| (|:| |Fun| %)
                        (|:| JMR
                             (|Record| (|:| |Indices| (|List| JB))
                                       (|:| |Entries| (|List| %))))
                        (|:| |Depend| (|List| (|NonNegativeInteger|)))))
          (|solved?| (|Boolean|)) (|s| (|Union| % #4="failed")) (|ld| (JB))
          (|rec| #3#))
         (SEQ (LETT |solved?| NIL) (LETT |rsysL| NIL)
              (SEQ G190
                   (COND
                    ((NULL (COND (|solved?| NIL) ('T (NULL (NULL |sysL|)))))
                     (GO G191)))
                   (SEQ (LETT |rec| (SPADCALL |sysL| (QREFELT % 132)))
                        (LETT |sysL| (CDR |sysL|))
                        (LETT |ld| (|SPADfirst| (QCAR (QVELT |rec| 1))))
                        (LETT |s|
                              (SPADCALL (QVELT |rec| 0) |ld| (QREFELT % 133)))
                        (LETT |solved?| (QEQCAR |s| 0))
                        (EXIT
                         (COND
                          (|solved?|
                           (SEQ (LETT |srec| |rec|) (EXIT (LETT |sld| |ld|))))
                          ('T
                           (LETT |rsysL|
                                 (SPADCALL |rec| |rsysL| (QREFELT % 134)))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |rsysL|
                    (SPADCALL (NREVERSE |rsysL|) |sysL| (QREFELT % 135)))
              (EXIT
               (COND
                (|solved?|
                 (SEQ
                  (LETT |ssub|
                        (PROG2 (LETT #2# |s|)
                            (QCDR #2#)
                          (|check_union2| (QEQCAR #2# 0) % (|Union| % #4#)
                                          #2#)))
                  (LETT |res| (LIST |srec|)) (LETT |sdep| (QVELT |srec| 2))
                  (SEQ (LETT #1# |rsysL|) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |rec| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |newFun|
                              (SPADCALL
                               (SPADCALL (QVELT |rec| 0) |sld| |ssub|
                                         (QREFELT % 136))
                               (QREFELT % 105)))
                        (EXIT
                         (COND
                          ((NULL (SPADCALL |newFun| (QREFELT % 104)))
                           (SEQ
                            (LETT |newJMR|
                                  (SPADCALL
                                   (SPADCALL (LIST |newFun|) (LIST |ind|)
                                             (QREFELT % 126))
                                   1 (QREFELT % 129)))
                            (LETT |newDep|
                                  (SPADCALL
                                   (SPADCALL (QVELT |rec| 2) |sdep|
                                             (QREFELT % 137))
                                   (QREFELT % 138)))
                            (EXIT
                             (LETT |res|
                                   (SPADCALL
                                    (VECTOR |newFun| |newJMR| |newDep|) |res|
                                    (QREFELT % 134)))))))))
                       (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                  (EXIT (NREVERSE |res|))))
                ('T (|JBE;groebnerSimp| |rsysL| |ind| %))))))) 

(SDEFUN |JBE;simpRec|
        ((|sysL|
          (|List|
           (|Record| (|:| |Fun| %)
                     (|:| JMR
                          (|Record| (|:| |Indices| (|List| JB))
                                    (|:| |Entries| (|List| %))))
                     (|:| |Depend| (|List| (|NonNegativeInteger|))))))
         (|ind| (|List| JB))
         (%
          (|List|
           (|Record| (|:| |Fun| %)
                     (|:| JMR
                          (|Record| (|:| |Indices| (|List| JB))
                                    (|:| |Entries| (|List| %))))
                     (|:| |Depend| (|List| (|NonNegativeInteger|)))))))
        (SPROG
         ((|newSysL|
           (|List|
            (|Record| (|:| |Fun| %)
                      (|:| JMR
                           (|Record| (|:| |Indices| (|List| JB))
                                     (|:| |Entries| (|List| %))))
                      (|:| |Depend| (|List| (|NonNegativeInteger|))))))
          (|sld| (JB))
          (|srec|
           #1=(|Record| (|:| |Fun| %)
                        (|:| JMR
                             (|Record| (|:| |Indices| (|List| JB))
                                       (|:| |Entries| (|List| %))))
                        (|:| |Depend| (|List| (|NonNegativeInteger|)))))
          (|eqLD| (|List| #1#))
          (|resLD|
           (|List|
            (|Record| (|:| |Fun| %)
                      (|:| JMR
                           (|Record| (|:| |Indices| (|List| JB))
                                     (|:| |Entries| (|List| %))))
                      (|:| |Depend| (|List| (|NonNegativeInteger|))))))
          (|fld| (JB)) (|frec| #1#))
         (SEQ
          (COND ((< (LENGTH |sysL|) 2) |sysL|)
                (#2='T
                 (SEQ (LETT |frec| (SPADCALL |sysL| (QREFELT % 132)))
                      (LETT |fld| (|SPADfirst| (QCAR (QVELT |frec| 1))))
                      (LETT |sysL| (CDR |sysL|))
                      (LETT |srec| (SPADCALL |sysL| (QREFELT % 132)))
                      (LETT |sld| (|SPADfirst| (QCAR (QVELT |srec| 1))))
                      (EXIT
                       (COND
                        ((SPADCALL |fld| |sld| (QREFELT % 107))
                         (SPADCALL |frec| (|JBE;simpRec| |sysL| |ind| %)
                                   (QREFELT % 134)))
                        (#2#
                         (SEQ (LETT |eqLD| (LIST |frec|))
                              (SEQ G190
                                   (COND
                                    ((NULL
                                      (COND ((NULL |sysL|) NIL)
                                            ('T
                                             (SPADCALL |sld| |fld|
                                                       (QREFELT % 106)))))
                                     (GO G191)))
                                   (SEQ
                                    (LETT |eqLD|
                                          (SPADCALL |srec| |eqLD|
                                                    (QREFELT % 134)))
                                    (LETT |sysL| (CDR |sysL|))
                                    (EXIT
                                     (COND
                                      ((NULL (NULL |sysL|))
                                       (SEQ
                                        (LETT |srec|
                                              (SPADCALL |sysL|
                                                        (QREFELT % 132)))
                                        (EXIT
                                         (LETT |sld|
                                               (|SPADfirst|
                                                (QCAR (QVELT |srec| 1))))))))))
                                   NIL (GO G190) G191 (EXIT NIL))
                              (LETT |eqLD|
                                    (SPADCALL
                                     (CONS (|function| |JBE;greaterLD|) %)
                                     (|JBE;linearSimp| (NREVERSE |eqLD|) |ind|
                                      %)
                                     (QREFELT % 140)))
                              (LETT |srec| (SPADCALL |eqLD| (QREFELT % 132)))
                              (LETT |sld|
                                    (|SPADfirst| (QCAR (QVELT |srec| 1))))
                              (LETT |resLD| NIL)
                              (SEQ G190
                                   (COND
                                    ((NULL
                                      (COND ((NULL |eqLD|) NIL)
                                            ('T
                                             (SPADCALL |sld| |fld|
                                                       (QREFELT % 106)))))
                                     (GO G191)))
                                   (SEQ
                                    (LETT |resLD|
                                          (SPADCALL |srec| |resLD|
                                                    (QREFELT % 134)))
                                    (LETT |eqLD| (CDR |eqLD|))
                                    (EXIT
                                     (COND
                                      ((NULL (NULL |eqLD|))
                                       (SEQ
                                        (LETT |srec|
                                              (SPADCALL |eqLD|
                                                        (QREFELT % 132)))
                                        (EXIT
                                         (LETT |sld|
                                               (|SPADfirst|
                                                (QCAR (QVELT |srec| 1))))))))))
                                   NIL (GO G190) G191 (EXIT NIL))
                              (LETT |newSysL|
                                    (SPADCALL
                                     (CONS (|function| |JBE;greaterLD|) %)
                                     |eqLD| |sysL| (QREFELT % 141)))
                              (EXIT
                               (SPADCALL (NREVERSE |resLD|)
                                         (|JBE;simpRec| |newSysL| |ind| %)
                                         (QREFELT % 135))))))))))))) 

(SDEFUN |JBE;simplify;LSemR;21|
        ((|sys| (|List| %)) (|jm| (|SparseEchelonMatrix| JB %))
         (%
          (|Record| (|:| |Sys| (|List| %))
                    (|:| JM (|SparseEchelonMatrix| JB %))
                    (|:| |Depend|
                         (|Union| "failed"
                                  (|List| (|List| (|NonNegativeInteger|))))))))
        (SPROG
         ((|resDep| (|List| (|List| (|NonNegativeInteger|))))
          (|resSys| (|List| %)) (#1=#:G254 NIL) (|rec| NIL) (|i| NIL)
          (|resJM| (|SparseEchelonMatrix| JB %))
          (|sysL|
           (|List|
            (|Record| (|:| |Fun| %)
                      (|:| JMR
                           (|Record| (|:| |Indices| (|List| JB))
                                     (|:| |Entries| (|List| %))))
                      (|:| |Depend| (|List| (|NonNegativeInteger|))))))
          (|r|
           (|Record| (|:| |Indices| (|List| JB)) (|:| |Entries| (|List| %))))
          (|neq| (%)) (#2=#:G253 NIL) (|eq| NIL) (|inds| (|List| JB)))
         (SEQ (LETT |inds| (SPADCALL |jm| (QREFELT % 142))) (LETT |sysL| NIL)
              (SEQ (LETT |i| 1) (LETT |eq| NIL) (LETT #2# |sys|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |eq| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL (SPADCALL |eq| (QREFELT % 104)))
                       (SEQ (LETT |neq| (SPADCALL |eq| (QREFELT % 105)))
                            (COND
                             ((SPADCALL |neq| |eq| (QREFELT % 143))
                              (LETT |r| (SPADCALL |jm| |i| (QREFELT % 129))))
                             ('T
                              (LETT |r|
                                    (SPADCALL
                                     (SPADCALL (LIST |neq|)
                                               (LIST
                                                (QCAR
                                                 (SPADCALL |jm| |i|
                                                           (QREFELT % 129))))
                                               (QREFELT % 126))
                                     1 (QREFELT % 129)))))
                            (COND
                             ((OR (NULL (QCAR |r|))
                                  (EQUAL
                                   (SPADCALL (|SPADfirst| (QCAR |r|))
                                             (QREFELT % 145))
                                   '|Indep|))
                              (EXIT (|error| "inconsistent system"))))
                            (EXIT
                             (LETT |sysL|
                                   (SPADCALL (VECTOR |neq| |r| (LIST |i|))
                                             |sysL| (QREFELT % 134)))))))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT |i| (|inc_SI| |i|))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND
                ((NULL |sysL|)
                 (VECTOR NIL (SPADCALL NIL 0 (QREFELT % 146)) (CONS 1 NIL)))
                ('T
                 (SEQ
                  (LETT |sysL|
                        (|JBE;simpRec|
                         (SPADCALL (CONS (|function| |JBE;greaterLD|) %) |sysL|
                                   (QREFELT % 140))
                         |inds| %))
                  (LETT |resSys| NIL)
                  (LETT |resJM|
                        (SPADCALL |inds| (LENGTH |sysL|) (QREFELT % 146)))
                  (LETT |resDep| NIL)
                  (SEQ (LETT |i| 1) (LETT |rec| NIL) (LETT #1# |sysL|) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |rec| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((OR (NULL (QCAR (QVELT |rec| 1)))
                               (SPADCALL (|SPADfirst| (QCAR (QVELT |rec| 1)))
                                         (SPADCALL 1 (QREFELT % 148))
                                         (QREFELT % 149)))
                           (|error| "inconsistent system"))
                          ('T
                           (SEQ
                            (LETT |resSys|
                                  (SPADCALL (QVELT |rec| 0) |resSys|
                                            (QREFELT % 150)))
                            (SPADCALL |resJM| |i| (QVELT |rec| 1)
                                      (QREFELT % 151))
                            (EXIT
                             (LETT |resDep|
                                   (CONS (QVELT |rec| 2) |resDep|))))))))
                       (LETT #1# (PROG1 (CDR #1#) (LETT |i| (|inc_SI| |i|))))
                       (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (VECTOR (SPADCALL |resSys| (QREFELT % 152)) |resJM|
                           (CONS 1 (NREVERSE |resDep|))))))))))) 

(SDEFUN |JBE;jetVariables;%L;22| ((|Phi| (%)) (% (|List| JB)))
        (SPROG
         ((JV (|List| JB)) (#1=#:G273 NIL)
          (|pmindex| (|List| (|NonNegativeInteger|))) (#2=#:G270 NIL)
          (#3=#:G288 NIL) (|i| NIL) (#4=#:G287 NIL)
          (|mindex| (|List| (|Integer|))) (#5=#:G286 NIL) (#6=#:G285 NIL)
          (|pupindex| #7=(|Integer|)) (#8=#:G265 NIL) (|uindex| #7#)
          (#9=#:G262 NIL) (|xindex| #7#) (|arg| (|List| %)) (|typ| (|Symbol|))
          (#10=#:G259 NIL) (#11=#:G283 NIL) (|Ke| NIL) (#12=#:G284 NIL)
          (|Op| NIL) (|LOps| (|List| (|BasicOperator|))) (#13=#:G282 NIL)
          (#14=#:G281 NIL) (|LKernels| (|List| (|Kernel| %))))
         (SEQ (LETT JV NIL) (LETT |LKernels| (SPADCALL |Phi| (QREFELT % 157)))
              (LETT |LOps|
                    (PROGN
                     (LETT #14# NIL)
                     (SEQ (LETT |Ke| NIL) (LETT #13# |LKernels|) G190
                          (COND
                           ((OR (ATOM #13#) (PROGN (LETT |Ke| (CAR #13#)) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #14#
                                  (CONS (SPADCALL |Ke| (QREFELT % 159))
                                        #14#))))
                          (LETT #13# (CDR #13#)) (GO G190) G191
                          (EXIT (NREVERSE #14#)))))
              (SEQ (LETT |Op| NIL) (LETT #12# |LOps|) (LETT |Ke| NIL)
                   (LETT #11# |LKernels|) G190
                   (COND
                    ((OR (ATOM #11#) (PROGN (LETT |Ke| (CAR #11#)) NIL)
                         (ATOM #12#) (PROGN (LETT |Op| (CAR #12#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |Op| '|%jet| (QREFELT % 160))
                       (SEQ
                        (LETT |typ|
                              (PROG2
                                  (LETT #10#
                                        (SPADCALL |Op| '|%jet|
                                                  (QREFELT % 162)))
                                  (QCDR #10#)
                                (|check_union2| (QEQCAR #10# 0) (|None|)
                                                (|Union| (|None|) "failed")
                                                #10#)))
                        (LETT |arg| (SPADCALL |Ke| (QREFELT % 163)))
                        (EXIT
                         (COND
                          ((EQUAL |typ| '|Indep|)
                           (SEQ
                            (LETT |xindex|
                                  (SPADCALL (SPADCALL |arg| (QREFELT % 164))
                                            (QREFELT % 165)))
                            (EXIT
                             (LETT JV
                                   (CONS
                                    (SPADCALL
                                     (PROG1 (LETT #9# |xindex|)
                                       (|check_subtype2| (> #9# 0)
                                                         '(|PositiveInteger|)
                                                         '(|Integer|) #9#))
                                     (QREFELT % 166))
                                    JV)))))
                          ((EQUAL |typ| '|Dep|)
                           (SEQ
                            (LETT |uindex|
                                  (SPADCALL (SPADCALL |arg| (QREFELT % 164))
                                            (QREFELT % 165)))
                            (EXIT
                             (LETT JV
                                   (CONS
                                    (SPADCALL
                                     (PROG1 (LETT #8# |uindex|)
                                       (|check_subtype2| (> #8# 0)
                                                         '(|PositiveInteger|)
                                                         '(|Integer|) #8#))
                                     (QREFELT % 148))
                                    JV)))))
                          ('T
                           (SEQ
                            (LETT |pupindex|
                                  (SPADCALL (SPADCALL |arg| (QREFELT % 164))
                                            (QREFELT % 165)))
                            (LETT |mindex|
                                  (PROGN
                                   (LETT #6# NIL)
                                   (SEQ (LETT |i| NIL)
                                        (LETT #5#
                                              (SPADCALL
                                               (SPADCALL |arg| (QREFELT % 167))
                                               (QREFELT % 167)))
                                        G190
                                        (COND
                                         ((OR (ATOM #5#)
                                              (PROGN (LETT |i| (CAR #5#)) NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #6#
                                                (CONS
                                                 (SPADCALL |i| (QREFELT % 165))
                                                 #6#))))
                                        (LETT #5# (CDR #5#)) (GO G190) G191
                                        (EXIT (NREVERSE #6#)))))
                            (LETT |pmindex|
                                  (PROGN
                                   (LETT #4# NIL)
                                   (SEQ (LETT |i| NIL) (LETT #3# |mindex|) G190
                                        (COND
                                         ((OR (ATOM #3#)
                                              (PROGN (LETT |i| (CAR #3#)) NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #4#
                                                (CONS
                                                 (PROG1 (LETT #2# |i|)
                                                   (|check_subtype2| (>= #2# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     '(|Integer|)
                                                                     #2#))
                                                 #4#))))
                                        (LETT #3# (CDR #3#)) (GO G190) G191
                                        (EXIT (NREVERSE #4#)))))
                            (EXIT
                             (LETT JV
                                   (CONS
                                    (SPADCALL
                                     (PROG1 (LETT #1# |pupindex|)
                                       (|check_subtype2| (> #1# 0)
                                                         '(|PositiveInteger|)
                                                         '(|Integer|) #1#))
                                     |pmindex| (QREFELT % 168))
                                    JV))))))))))))
                   (LETT #11# (PROG1 (CDR #11#) (LETT #12# (CDR #12#))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (ELT % 107) (SPADCALL JV (QREFELT % 169))
                         (QREFELT % 171)))))) 

(SDEFUN |JBE;differentiate;%JB%;23| ((|fun| (%)) (|jv| (JB)) (% (%)))
        (SPROG ((|x| (|Symbol|)))
               (SEQ (LETT |x| (SPADCALL |jv| (QREFELT % 173)))
                    (EXIT (SPADCALL |fun| |x| (QREFELT % 174)))))) 

(SDEFUN |JBE;differentiate;%S%;24| ((|fun| (%)) (|x| (|Symbol|)) (% (%)))
        (SPADCALL (SPADCALL |fun| (QREFELT % 11)) |x| (QREFELT % 176))) 

(SDEFUN |JBE;subst;%JB2%;25| ((|f| (%)) (|jv| (JB)) (|exp| (%)) (% (%)))
        (SPROG ((|res| (%)))
               (SEQ
                (LETT |res|
                      (SPADCALL |f|
                                (SPADCALL (SPADCALL |jv| (QREFELT % 9)) |exp|
                                          (QREFELT % 179))
                                (QREFELT % 181)))
                (EXIT |res|)))) 

(SDEFUN |JBE;solveFor;%JBU;26| ((|f| (%)) (|jv| (JB)) (% (|Union| % "failed")))
        (SPROG
         ((|vquo| #1=(|List| (|Kernel| %))) (|vrem| #1#)
          (|md|
           (|Record|
            (|:| |quotient|
                 (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| %)))
            (|:| |remainder|
                 (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| %)))))
          (|var| (|Kernel| %))
          (|fun| (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| %))))
         (SEQ (LETT |fun| (SPADCALL |f| (QREFELT % 19)))
              (LETT |var|
                    (SPADCALL (SPADCALL |jv| (QREFELT % 9)) (QREFELT % 182)))
              (LETT |md|
                    (SPADCALL |fun| (SPADCALL |var| (QREFELT % 183)) |var|
                              (QREFELT % 184)))
              (LETT |vrem| (SPADCALL (QCDR |md|) (QREFELT % 27)))
              (LETT |vquo| (SPADCALL (QCAR |md|) (QREFELT % 27)))
              (EXIT
               (COND
                ((SPADCALL |var| (SPADCALL |vrem| |vquo| (QREFELT % 185))
                           (QREFELT % 67))
                 (CONS 1 "failed"))
                ((SPADCALL (QCDR |md|) (QREFELT % 186))
                 (COND ((NULL |vquo|) (CONS 0 (|spadConstant| % 45)))
                       (#2='T (CONS 1 "failed"))))
                (#2#
                 (CONS 0
                       (SPADCALL
                        (SPADCALL (QCDR |md|) (QCAR |md|) (QREFELT % 15))
                        (QREFELT % 187))))))))) 

(SDEFUN |JBE;kernel0| ((|op| (|BasicOperator|)) (|ls| (|List| %)) (% (%)))
        (SPADCALL |op| |ls| (QREFELT % 188))) 

(SDEFUN |JBE;sy2jbe| ((|s| (|Symbol|)) (% (%))) (SPADCALL |s| (QREFELT % 189))) 

(SDEFUN |JBE;hidedisp| ((|l| (|List| %)) (% (|OutputForm|)))
        (SPROG
         ((|op| (|OutputForm|)) (#1=#:G317 NIL) (|e| NIL) (#2=#:G316 NIL)
          (#3=#:G315 NIL) (|k| NIL) (|args| (|List| (|OutputForm|)))
          (#4=#:G314 NIL) (|show| #5=(|Integer|)) (|num| #5#)
          (|name| (|Symbol|)))
         (SEQ
          (LETT |name|
                (SPADCALL (SPADCALL |l| (QREFELT % 190)) (QREFELT % 191)))
          (LETT |l| (SPADCALL |l| (QREFELT % 167)))
          (LETT |num|
                (SPADCALL (SPADCALL |l| (QREFELT % 190)) (QREFELT % 165)))
          (LETT |l| (SPADCALL |l| (QREFELT % 167)))
          (LETT |show|
                (SPADCALL (SPADCALL |l| (QREFELT % 190)) (QREFELT % 165)))
          (LETT |l| (SPADCALL |l| (QREFELT % 167))) (LETT |args| NIL)
          (SEQ (LETT |k| 1) (LETT #4# |show|) G190
               (COND ((|greater_SI| |k| #4#) (GO G191)))
               (SEQ
                (LETT |args|
                      (SPADCALL |args|
                                (LIST
                                 (SPADCALL (SPADCALL |l| (QREFELT % 190))
                                           (QREFELT % 192)))
                                (QREFELT % 194)))
                (EXIT (LETT |l| (SPADCALL |l| (QREFELT % 167)))))
               (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |k| (+ |show| 1)) (LETT #3# |num|) G190
               (COND ((> |k| #3#) (GO G191)))
               (SEQ (EXIT (LETT |l| (SPADCALL |l| (QREFELT % 167)))))
               (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))
          (COND
           ((SPADCALL |l| (QREFELT % 195))
            (LETT |op| (SPADCALL |name| (QREFELT % 196))))
           (#6='T
            (LETT |op|
                  (SPADCALL (SPADCALL |name| (QREFELT % 196))
                            (SPADCALL
                             (PROGN
                              (LETT #2# NIL)
                              (SEQ (LETT |e| NIL) (LETT #1# |l|) G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN (LETT |e| (CAR #1#)) NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #2#
                                           (CONS (SPADCALL |e| (QREFELT % 192))
                                                 #2#))))
                                   (LETT #1# (CDR #1#)) (GO G190) G191
                                   (EXIT (NREVERSE #2#))))
                             (QREFELT % 197))
                            (QREFELT % 198)))))
          (EXIT
           (COND ((NULL |args|) |op|)
                 (#6# (SPADCALL |op| |args| (QREFELT % 199)))))))) 

(SDEFUN |JBE;hidediff| ((|l| (|List| %)) (|x| (|Symbol|)) (% (%)))
        (SPROG
         ((|res| (%)) (|newarg| (|List| %)) (#1=#:G344 NIL) (|j| NIL)
          (#2=#:G343 NIL) (|da| (%)) (|k| NIL) (#3=#:G342 NIL) (|arg| NIL)
          (|op| (|BasicOperator|)) (|oldarg| (|List| %)) (#4=#:G323 NIL)
          (|diff| (|List| (|Integer|))) (#5=#:G341 NIL) (#6=#:G340 NIL)
          (|args| (|List| %)) (#7=#:G339 NIL) (|num| (|Integer|))
          (|name| (|Symbol|)))
         (SEQ (LETT |oldarg| (SPADCALL |l| (QREFELT % 200)))
              (LETT |name|
                    (SPADCALL (SPADCALL |l| (QREFELT % 190)) (QREFELT % 191)))
              (LETT |l| (SPADCALL |l| (QREFELT % 167)))
              (LETT |num|
                    (SPADCALL (SPADCALL |l| (QREFELT % 190)) (QREFELT % 165)))
              (EXIT
               (COND ((ZEROP |num|) (|spadConstant| % 45))
                     ('T
                      (SEQ (LETT |l| (SPADCALL |l| (QREFELT % 167)))
                           (LETT |l| (SPADCALL |l| (QREFELT % 167)))
                           (LETT |args| NIL)
                           (SEQ (LETT |k| 1) (LETT #7# |num|) G190
                                (COND ((|greater_SI| |k| #7#) (GO G191)))
                                (SEQ
                                 (LETT |args|
                                       (SPADCALL (SPADCALL |l| (QREFELT % 190))
                                                 |args| (QREFELT % 150)))
                                 (EXIT
                                  (LETT |l| (SPADCALL |l| (QREFELT % 167)))))
                                (LETT |k| (|inc_SI| |k|)) (GO G190) G191
                                (EXIT NIL))
                           (LETT |diff|
                                 (PROGN
                                  (LETT #6# NIL)
                                  (SEQ (LETT |k| NIL) (LETT #5# |l|) G190
                                       (COND
                                        ((OR (ATOM #5#)
                                             (PROGN (LETT |k| (CAR #5#)) NIL))
                                         (GO G191)))
                                       (SEQ
                                        (EXIT
                                         (LETT #6#
                                               (CONS
                                                (SPADCALL |k| (QREFELT % 165))
                                                #6#))))
                                       (LETT #5# (CDR #5#)) (GO G190) G191
                                       (EXIT (NREVERSE #6#)))))
                           (LETT |oldarg|
                                 (SPADCALL |oldarg|
                                           (PROG1 (LETT #4# (+ |num| 3))
                                             (|check_subtype2| (>= #4# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #4#))
                                           (QREFELT % 201)))
                           (LETT |op| (SPADCALL |name| (QREFELT % 202)))
                           (SPADCALL |op| '|%specialDisp|
                                     (CONS (|function| |JBE;hidedisp|) %)
                                     (QREFELT % 204))
                           (SPADCALL |op| '|%specialDiff|
                                     (CONS (|function| |JBE;hidediff|) %)
                                     (QREFELT % 204))
                           (LETT |res| (|spadConstant| % 45))
                           (SEQ (LETT |arg| NIL) (LETT #3# |args|)
                                (LETT |k| |num|) G190
                                (COND
                                 ((OR (< |k| 1) (ATOM #3#)
                                      (PROGN (LETT |arg| (CAR #3#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (LETT |da|
                                       (SPADCALL |arg| |x| (QREFELT % 174)))
                                 (EXIT
                                  (COND
                                   ((NULL (SPADCALL |da| (QREFELT % 104)))
                                    (SEQ
                                     (LETT |newarg|
                                           (SPADCALL |oldarg|
                                                     (PROGN
                                                      (LETT #2# NIL)
                                                      (SEQ (LETT |j| NIL)
                                                           (LETT #1#
                                                                 (SPADCALL
                                                                  |diff|
                                                                  (LIST |k|)
                                                                  (QREFELT %
                                                                           205)))
                                                           G190
                                                           (COND
                                                            ((OR (ATOM #1#)
                                                                 (PROGN
                                                                  (LETT |j|
                                                                        (CAR
                                                                         #1#))
                                                                  NIL))
                                                             (GO G191)))
                                                           (SEQ
                                                            (EXIT
                                                             (LETT #2#
                                                                   (CONS
                                                                    (SPADCALL
                                                                     |j|
                                                                     (QREFELT %
                                                                              206))
                                                                    #2#))))
                                                           (LETT #1# (CDR #1#))
                                                           (GO G190) G191
                                                           (EXIT
                                                            (NREVERSE #2#))))
                                                     (QREFELT % 207)))
                                     (EXIT
                                      (LETT |res|
                                            (SPADCALL |res|
                                                      (SPADCALL
                                                       (|JBE;kernel0| |op|
                                                        |newarg| %)
                                                       |da| (QREFELT % 52))
                                                      (QREFELT % 53)))))))))
                                (LETT |k|
                                      (PROG1 (+ |k| -1) (LETT #3# (CDR #3#))))
                                (GO G190) G191 (EXIT NIL))
                           (EXIT |res|)))))))) 

(SDEFUN |JBE;function;SLNni%;31|
        ((|f| (|Symbol|)) (|arg| (|List| %)) (|show| (|NonNegativeInteger|))
         (% (%)))
        (SPROG ((|args| (|List| %)) (|op| (|BasicOperator|)))
               (SEQ (LETT |op| (SPADCALL |f| (QREFELT % 202)))
                    (SPADCALL |op| '|%specialDisp|
                              (CONS (|function| |JBE;hidedisp|) %)
                              (QREFELT % 204))
                    (SPADCALL |op| '|%specialDiff|
                              (CONS (|function| |JBE;hidediff|) %)
                              (QREFELT % 204))
                    (LETT |args|
                          (SPADCALL
                           (LIST (|JBE;sy2jbe| |f| %)
                                 (SPADCALL (SPADCALL |arg| (QREFELT % 208))
                                           (QREFELT % 206))
                                 (SPADCALL |show| (QREFELT % 206)))
                           |arg| (QREFELT % 207)))
                    (EXIT (|JBE;kernel0| |op| |args| %))))) 

(DECLAIM (NOTINLINE |JetBundleExpression;|)) 

(DEFUN |JetBundleExpression;| (|#1|)
  (SPROG ((|pv$| NIL) (#1=#:G404 NIL) (% NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|JetBundleExpression| DV$1))
          (LETT % (GETREFV 258))
          (QSETREFV % 0 |dv$|)
          (QSETREFV % 3
                    (LETT |pv$|
                          (|buildPredVector| 0 0
                                             (LIST
                                              (|HasCategory| (|Integer|)
                                                             '(|IntegralDomain|))
                                              (|HasCategory| (|Integer|)
                                                             '(|CommutativeRing|))
                                              (|HasCategory| (|Integer|)
                                                             '(|CharacteristicNonZero|))
                                              (|HasCategory| (|Integer|)
                                                             '(|CharacteristicZero|))
                                              (|HasCategory| (|Integer|)
                                                             '(|Ring|))
                                              (|HasCategory| (|Integer|)
                                                             '(|Group|))
                                              (|HasCategory| (|Integer|)
                                                             '(|ConvertibleTo|
                                                               (|InputForm|)))
                                              (|HasCategory| (|Integer|)
                                                             '(|ConvertibleTo|
                                                               (|Pattern|
                                                                (|Float|))))
                                              (|HasCategory| (|Integer|)
                                                             '(|ConvertibleTo|
                                                               (|Pattern|
                                                                (|Integer|))))
                                              (|HasCategory| (|Integer|)
                                                             '(|PatternMatchable|
                                                               (|Float|)))
                                              (|HasCategory| (|Integer|)
                                                             '(|PatternMatchable|
                                                               (|Integer|)))
                                              (LETT #1#
                                                    (|HasCategory| (|Integer|)
                                                                   '(|RetractableTo|
                                                                     (|Integer|))))
                                              (OR
                                               (|HasCategory| (|Integer|)
                                                              '(|RetractableTo|
                                                                (|Fraction|
                                                                 (|Integer|))))
                                               (AND #1#
                                                    (|HasCategory| (|Integer|)
                                                                   '(|IntegralDomain|))))
                                              (|HasCategory| (|Integer|)
                                                             '(|AbelianSemiGroup|))
                                              (|HasCategory| (|Integer|)
                                                             '(|SemiGroup|))))))
          (|haddProp| |$ConstructorCache| '|JetBundleExpression| (LIST DV$1)
                      (CONS 1 %))
          (|stuffDomainSlots| %)
          (QSETREFV % 6 |#1|)
          (AND (|HasCategory| % '(|Ring|)) (|augmentPredVector| % 32768))
          (AND (|HasCategory| % '(|RetractableTo| (|Integer|)))
               (|augmentPredVector| % 65536))
          (SETF |pv$| (QREFELT % 3))
          (QSETREFV % 7 (|Expression| (|Integer|)))
          %))) 

(DEFUN |JetBundleExpression| (#1=#:G405)
  (SPROG NIL
         (PROG (#2=#:G406)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|JetBundleExpression|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT (PROG1 (|JetBundleExpression;| #1#) (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|JetBundleExpression|)))))))))) 

(MAKEPROP '|JetBundleExpression| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Expression| 24) (|local| |#1|) '|Rep|
              (0 . |coerce|) |JBE;coerce;JB%;1| |JBE;coerce;E%;2|
              |JBE;coerce;%E;3| (|SparseMultivariatePolynomial| 24 34)
              (5 . |One|) (|SparseMultivariatePolynomial| 24 28) (9 . /)
              |JBE;coerce;Smp%;4| (|SparseMultivariatePolynomial| 5 6)
              (15 . |Zero|) (19 . |numer|) (|List| %)
              (24 . |primitiveMonomials|) (|List| 24) (29 . |coefficients|)
              (|Integer|) (34 . |coerce|) (|List| 34) (39 . |variables|)
              (|Kernel| %) (44 . |coerce|) (|Union| 6 '#1="failed")
              (49 . |retractIfCan|) (54 . *) (|NonNegativeInteger|)
              (|Kernel| $$) (60 . |degree|) (66 . |One|) (70 . |One|)
              (74 . |One|) (|List| 6) (|List| 33) (78 . |monomial|) (85 . *)
              (91 . +) |JBE;numerJP;%Smp;5| (97 . |Zero|)
              (101 . |primitiveMonomials|) (|List| 5) (106 . |coefficients|)
              (111 . |variables|) (116 . |degree|) (122 . ^) (128 . *)
              (134 . +) |JBE;coerce;Smp%;6| (140 . |gcd|) |JBE;gcd;3%;7|
              (|Union| % '"failed") (146 . |exquo|) |JBE;exquo;2%U;8| (152 . /)
              |JBE;recip;%U;9| (158 . |order|) (163 . |first|) (168 . |concat|)
              (|Boolean|) (174 . =) (180 . |member?|) (186 . |and|)
              (|Mapping| 65 65 65) (|List| 65) (192 . |reduce|) (|List| 26)
              (199 . |cons|) (|List| 12) (|Mapping| 12 $$) (|List| $$)
              (|FiniteLinearAggregateFunctions2| $$ 76 12 74) (205 . |map|)
              (211 . |leadingMonomial|) (216 . |sort!|) (221 . |first|)
              (226 . |merge|) (232 . |removeDuplicates!|) (237 . |dimJ|)
              (|SparseEchelonMatrix| 6 %) |JBE;dimension;LSem2Nni;12|
              (242 . |dimS|) |JBE;orderDim;LSem2Nni;13| (247 . |ground?|)
              (|Union| 34 '"failed") (252 . |mainVariable|)
              (|SparseUnivariatePolynomial| %) (257 . |univariate|)
              (|SparseUnivariatePolynomial| 12) (263 . |monomial?|)
              (268 . |leadingCoefficient|) (273 . |monomial|)
              (280 . |minimumDegree|) (285 . |Zero|) (289 . |monomial|)
              (|Record| (|:| |quotient| %) (|:| |remainder| %))
              (295 . |monicDivide|) (301 . |multivariate|) (307 . |zero?|)
              |JBE;simpOne;2%;15| (312 . =) (318 . >) (|String|) (|OutputForm|)
              (324 . |message|) (329 . |coerce|) (334 . |assign|) (|Void|)
              (340 . |print|) (|GroebnerPackage| 24 (|IndexedExponents| 34) 12)
              (345 . |groebner|) (|Mapping| $$ 12)
              (|FiniteLinearAggregateFunctions2| 12 74 $$ 76) (350 . |map|)
              (356 . |coerce|) (361 . |setUnion|) (|Mapping| 40 40 40)
              (|List| 40) (367 . |reduce|) (|List| 39) (374 . |jacobiMatrix|)
              (|Record| (|:| |Indices| 39) (|:| |Entries| 76))
              (|SparseEchelonMatrix| 6 $$) (380 . |row|)
              (|Record| (|:| |Fun| $$) (|:| JMR 127) (|:| |Depend| 40))
              (|List| 130) (386 . |first|) |JBE;solveFor;%JBU;26|
              (391 . |cons|) (397 . |concat!|) |JBE;subst;%JB2%;25|
              (403 . |append|) (409 . |removeDuplicates!|)
              (|Mapping| 65 130 130) (414 . |sort!|) (420 . |merge|)
              (427 . |allIndices|) (432 . =) (|Symbol|) (438 . |type|)
              (443 . |new|) (|PositiveInteger|) (449 . U) (454 . <)
              (460 . |cons|) (466 . |setRow!|) (473 . |reverse!|)
              (|Union| '"failed" 123)
              (|Record| (|:| |Sys| 20) (|:| JM 85) (|:| |Depend| 153))
              |JBE;simplify;LSemR;21| (|List| 28) (478 . |tower|)
              (|BasicOperator|) (483 . |operator|) (488 . |has?|)
              (|Union| 203 '"failed") (494 . |property|) (500 . |argument|)
              (505 . |second|) (510 . |retract|) (515 . X) (520 . |rest|)
              (525 . P) (531 . |removeDuplicates!|) (|Mapping| 65 6 6)
              (536 . |sort|) |JBE;jetVariables;%L;22| (542 . |name|)
              |JBE;differentiate;%S%;24| |JBE;differentiate;%JB%;23|
              (547 . |differentiate|) (553 . =) (|Equation| $$) (559 . =)
              (|Equation| %) (565 . |eval|) (571 . |retract|) (576 . |coerce|)
              (581 . |monicDivide|) (588 . |append|) (594 . |zero?|) (599 . -)
              (604 . |kernel|) (610 . |coerce|) (615 . |first|)
              (620 . |retract|) (625 . |coerce|) (|List| 109) (630 . |concat!|)
              (636 . |empty?|) (641 . |coerce|) (646 . |commaSeparate|)
              (651 . |sub|) (657 . |prefix|) (663 . |copy|) (668 . |first|)
              (674 . |operator|) (|None|) (679 . |setProperty|) (686 . |merge|)
              (692 . |coerce|) (697 . |append|) (703 . |#|)
              |JBE;function;SLNni%;31| (|List| 144)
              (|Record| (|:| |llcm_res| %) (|:| |coeff1| %) (|:| |coeff2| %))
              (|Record| (|:| |unit| %) (|:| |canonical| %) (|:| |associate| %))
              (|Record| (|:| |DPhi| %) (|:| |JVars| 39))
              (|Record| (|:| |DSys| 20) (|:| |JVars| 125)) (|Union| 24 '#1#)
              (|Union| 144 '#1#) (|Mapping| % 20) (|Mapping| % %) (|List| 158)
              (|List| 217) (|List| 218) (|Union| 28 '"failed") (|List| 180)
              (|Polynomial| %) (|Fraction| 24) (|Factored| %)
              (|Record| (|:| |coef1| %) (|:| |coef2| %))
              (|Union| 227 '#2="failed") (|Union| 20 '#2#)
              (|Record| (|:| |coef1| %) (|:| |coef2| %) (|:| |generator| %))
              (|Record| (|:| |coef| 20) (|:| |generator| %))
              (|SegmentBinding| %) (|Union| 225 '#1#)
              (|Record| (|:| |coef| 24) (|:| |var| 28))
              (|Union| 234 '#3="failed") (|InputForm|) (|Pattern| (|Float|))
              (|Pattern| 24) (|Fraction| 248) (|Union| 239 '#1#)
              (|Fraction| 92) (|Fraction| 243) (|Polynomial| 225)
              (|PatternMatchResult| (|Float|) %) (|PatternMatchResult| 24 %)
              (|AlgebraicNumber|) (|Union| 246 '#1#) (|Polynomial| 24)
              (|Union| 248 '#1#) (|Record| (|:| |val| %) (|:| |exponent| 24))
              (|Union| 250 '#3#) (|Record| (|:| |var| 28) (|:| |exponent| 24))
              (|Union| 252 '#3#)
              (|Record| (|:| |mat| 257) (|:| |vec| (|Vector| 24))) (|Matrix| %)
              (|Vector| %) (|Matrix| 24))
           '#(~= 708 |zerosOf| 714 |zeroOf| 741 |zero?| 768 |wilsonW| 773
              |whittakerW| 783 |whittakerM| 790 |weierstrassZeta| 797
              |weierstrassSigma| 804 |weierstrassPPrime| 811
              |weierstrassPInverse| 818 |weierstrassP| 825 |weberE| 832
              |variables| 838 |univariate| 848 |unitStep| 854 |unitNormal| 859
              |unitCanonical| 864 |unit?| 869 |tower| 874 |tanh| 884 |tan| 889
              |symbol| 894 |summation| 899 |subtractIfCan| 911 |subst| 917
              |struveL| 943 |struveH| 949 |squareFreePart| 955 |squareFree| 960
              |sqrt| 965 |sortLD| 970 |solveFor| 975 |smaller?| 981 |sizeLess?|
              987 |sinh| 993 |sin| 998 |simplify| 1003 |simpOne| 1009 |simpMod|
              1014 |sign| 1027 |setNotation| 1032 |sech| 1037 |sec| 1042
              |sample| 1047 |rootsOf| 1051 |rootSum| 1078 |rootOf| 1085
              |rightRecip| 1112 |rightPower| 1117 |riemannZeta| 1129
              |retractIfCan| 1134 |retract| 1174 |rem| 1214 |reducedSystem|
              1220 |reduceMod| 1231 |reduce| 1237 |recip| 1242 |racahR| 1247
              |quo| 1257 |product| 1263 |principalIdeal| 1275 |prime?| 1280
              |polylog| 1285 |polygamma| 1291 |plenaryPower| 1297 |pi| 1303
              |permutation| 1307 |patternMatch| 1313 |paren| 1327 |orderDim|
              1332 |order| 1339 |opposite?| 1344 |operators| 1350 |operator|
              1355 |one?| 1360 |odd?| 1365 |numerator| 1370 |numerJP| 1375
              |numer| 1380 |numIndVar| 1385 |numDepVar| 1389 |nthRoot| 1393
              |multiEuclidean| 1399 |minPoly| 1405 |meixnerP| 1410 |meixnerM|
              1418 |meijerG| 1426 |map| 1435 |mainKernel| 1441 |lommelS2| 1446
              |lommelS1| 1453 |log| 1460 |li| 1465 |lerchPhi| 1470 |legendreQ|
              1477 |legendreP| 1484 |leftRecip| 1491 |leftPower| 1496
              |leadingDer| 1508 |lcmCoef| 1513 |lcm| 1519 |latex| 1530
              |lambertW| 1535 |laguerreL| 1540 |kummerU| 1547 |kummerM| 1554
              |krawtchoukK| 1561 |kernels| 1569 |kernel| 1579 |kelvinKer| 1591
              |kelvinKei| 1597 |kelvinBer| 1603 |kelvinBei| 1609 |jetVariables|
              1615 |jacobiZeta| 1620 |jacobiTheta| 1626 |jacobiSn| 1632
              |jacobiP| 1638 |jacobiMatrix| 1646 |jacobiDn| 1657 |jacobiCn|
              1663 |isTimes| 1669 |isPower| 1674 |isPlus| 1679 |isMult| 1684
              |isExpt| 1689 |is?| 1706 |inv| 1718 |integral| 1723
              |hypergeometricF| 1735 |hermiteH| 1742 |height| 1748 |hankelH2|
              1753 |hankelH1| 1759 |hahn_p| 1765 |hahnS| 1774 |hahnR| 1783
              |hahnQ| 1792 |ground?| 1801 |ground| 1806 |getNotation| 1811
              |gcdPolynomial| 1815 |gcd| 1821 |function| 1832 |fresnelS| 1839
              |fresnelC| 1844 |freeOf?| 1849 |fractionPart| 1867 |formalDiff2|
              1872 |formalDiff| 1886 |floor| 1904 |factorials| 1909 |factorial|
              1920 |factor| 1925 |extractSymbol| 1930 |extendedEuclidean| 1935
              |exquo| 1948 |expressIdealMember| 1954 |exp| 1960 |even?| 1965
              |eval| 1970 |euclideanSize| 2114 |erfi| 2119 |erf| 2124 |elt|
              2129 |ellipticPi| 2225 |ellipticK| 2232 |ellipticF| 2237
              |ellipticE| 2243 |divide| 2254 |distribute| 2260 |diracDelta|
              2271 |dimension| 2276 |dilog| 2283 |digamma| 2288 |differentiate|
              2293 |denominator| 2325 |denom| 2330 |definingPolynomial| 2335
              |dSubst| 2340 |csch| 2347 |csc| 2352 |coth| 2357 |cot| 2362
              |cosh| 2367 |cos| 2372 |convert| 2377 |const?| 2397 |conjugate|
              2402 |commutator| 2413 |coerce| 2419 |class| 2499 |charthRoot|
              2504 |charlierC| 2509 |characteristic| 2516 |ceiling| 2520 |box|
              2525 |binomial| 2530 |besselY| 2536 |besselK| 2542 |besselJ| 2548
              |besselI| 2554 |belong?| 2560 |autoReduce| 2565 |atanh| 2570
              |atan| 2575 |associator| 2580 |associates?| 2587 |asinh| 2593
              |asin| 2598 |asech| 2603 |asec| 2608 |applyQuote| 2613
              |antiCommutator| 2649 |annihilate?| 2655 |angerJ| 2661 |algtower|
              2667 |airyBiPrime| 2677 |airyBi| 2682 |airyAiPrime| 2687 |airyAi|
              2692 |acsch| 2697 |acsc| 2702 |acoth| 2707 |acot| 2712 |acosh|
              2717 |acos| 2722 |abs| 2727 ^ 2732 |Zero| 2762 X 2766 U 2775 |Si|
              2784 |Shi| 2789 P 2794 |One| 2816 |Gamma| 2820 |Ei| 2831 D 2836
              |Ci| 2862 |Chi| 2867 |Beta| 2872 = 2885 / 2891 - 2903 + 2914 *
              2920)
           'NIL
           (CONS
            (|makeByteWordVec2| 13
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 4 3 2 0 0 0 0 0 2
                                  0 0 0 0 5 2 0 0 0 5 2 0 0 0 5 2 0 0 0 0 0 6 0
                                  0 0 0 0 0 0 0 0 0 0 11 10 0 0 0 0 0 12 5 1 13
                                  0 0 0 0 0 0 0 0 0 0 12 9 8 7 5 1 13 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))
            (CONS
             '#(|AlgebraicallyClosedFunctionSpace&| NIL |FunctionSpace2&|
                |AlgebraicallyClosedField&| |Field&| |EuclideanDomain&|
                |UniqueFactorizationDomain&| NIL |JetBundleFunctionCategory&|
                |GcdDomain&| NIL NIL NIL |DivisionRing&| NIL NIL |Algebra&|
                |Algebra&| |EntireRing&| |Algebra&| |PartialDifferentialRing&|
                NIL |NonAssociativeAlgebra&| NIL |Rng&|
                |NonAssociativeAlgebra&| |NonAssociativeAlgebra&|
                |FullyLinearlyExplicitOver&| |Module&| NIL |Module&| |Module&|
                NIL NIL |NonAssociativeRing&| NIL NIL NIL NIL NIL
                |NonAssociativeRng&| NIL NIL NIL |Group&| |AbelianGroup&| NIL
                NIL NIL NIL |AbelianMonoid&| |NonAssociativeSemiRng&|
                |MagmaWithUnit&| NIL |ExpressionSpace2&| NIL NIL NIL
                |AbelianSemiGroup&| |Magma&| NIL |FullyRetractableTo&| NIL
                |RetractableTo&| |RetractableTo&| |RetractableTo&|
                |RetractableTo&| |SetCategory&| NIL |RetractableTo&|
                |RetractableTo&| |Evalable&| |RetractableTo&| NIL
                |RetractableTo&| |TranscendentalFunctionCategory&| NIL NIL NIL
                NIL NIL NIL NIL NIL NIL |BasicType&| NIL NIL NIL NIL NIL
                |InnerEvalable&| |InnerEvalable&| NIL NIL NIL NIL NIL
                |RadicalCategory&| |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                NIL NIL NIL)
             (CONS
              '#((|AlgebraicallyClosedFunctionSpace| 24) (|FunctionSpace| 24)
                 (|FunctionSpace2| 24 34) (|AlgebraicallyClosedField|)
                 (|Field|) (|EuclideanDomain|) (|UniqueFactorizationDomain|)
                 (|PrincipalIdealDomain|) (|JetBundleFunctionCategory| 6)
                 (|GcdDomain|) (|IntegralDomain|) (|LeftOreRing|)
                 (|CommutativeRing|) (|DivisionRing|) (|CharacteristicZero|)
                 (|CharacteristicNonZero|) (|Algebra| 24) (|Algebra| $$)
                 (|EntireRing|) (|Algebra| 225) (|PartialDifferentialRing| 144)
                 (|Ring|) (|NonAssociativeAlgebra| 24) (|SemiRing|) (|Rng|)
                 (|NonAssociativeAlgebra| $$) (|NonAssociativeAlgebra| 225)
                 (|FullyLinearlyExplicitOver| 24) (|Module| 24) (|SemiRng|)
                 (|Module| $$) (|Module| 225) (|LinearlyExplicitOver| 24)
                 (|BiModule| 24 24) (|NonAssociativeRing|) (|BiModule| $$ $$)
                 (|BiModule| 225 225) (|RightModule| 24) (|LeftModule| 24)
                 (|RightModule| $$) (|NonAssociativeRng|) (|LeftModule| $$)
                 (|LeftModule| 225) (|RightModule| 225) (|Group|)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|) (|ExpressionSpace|)
                 (|AbelianMonoid|) (|NonAssociativeSemiRng|) (|MagmaWithUnit|)
                 (|SemiGroup|) (|ExpressionSpace2| 34)
                 (|FullyPatternMatchable| 24) (|PatternMatchable| 24)
                 (|PatternMatchable| (|Float|)) (|AbelianSemiGroup|) (|Magma|)
                 (|Comparable|) (|FullyRetractableTo| 24)
                 (|LiouvillianFunctionCategory|) (|RetractableTo| 246)
                 (|RetractableTo| 248) (|RetractableTo| 239)
                 (|RetractableTo| 225) (|SetCategory|) (|CommutativeStar|)
                 (|RetractableTo| 6) (|RetractableTo| 34) (|Evalable| $$)
                 (|RetractableTo| 144) (|Patternable| 24) (|RetractableTo| 24)
                 (|TranscendentalFunctionCategory|)
                 (|CombinatorialOpsCategory|) (|CoercibleFrom| 246)
                 (|ConvertibleTo| 238) (|ConvertibleTo| 237)
                 (|ConvertibleTo| 236) (|CoercibleFrom| 248)
                 (|CoercibleFrom| 239) (|CoercibleFrom| 225)
                 (|CoercibleTo| 109) (|BasicType|) (|unitsKnown|)
                 (|TwoSidedRecip|) (|noZeroDivisors|) (|CoercibleFrom| 6)
                 (|CoercibleFrom| 34) (|InnerEvalable| 34 $$)
                 (|InnerEvalable| $$ $$) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|CoercibleFrom| 144) (|Type|)
                 (|CoercibleFrom| 24) (|RadicalCategory|)
                 (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|)
                 (|CombinatorialFunctionCategory|)
                 (|PrimitiveFunctionCategory|) (|SpecialFunctionCategory|))
              (|makeByteWordVec2| 257
                                  '(1 6 5 0 8 0 12 0 13 2 0 0 14 14 15 0 17 0
                                    18 1 0 14 0 19 1 12 20 0 21 1 12 22 0 23 1
                                    5 0 24 25 1 12 26 0 27 1 0 0 28 29 1 0 30 0
                                    31 2 5 0 0 0 32 2 12 33 0 34 35 0 0 0 36 0
                                    6 0 37 0 17 0 38 3 17 0 0 39 40 41 2 17 0 5
                                    0 42 2 17 0 0 0 43 0 0 0 45 1 17 20 0 46 1
                                    17 47 0 48 1 17 39 0 49 2 17 33 0 6 50 2 0
                                    0 0 33 51 2 0 0 0 0 52 2 0 0 0 0 53 2 12 0
                                    0 0 55 2 12 57 0 0 58 2 0 0 0 0 60 1 0 33 0
                                    62 1 26 34 0 63 2 26 0 0 34 64 2 26 65 0 0
                                    66 2 26 65 34 0 67 2 65 0 0 0 68 3 70 65 69
                                    0 65 71 2 72 0 26 0 73 2 77 74 75 76 78 1
                                    12 0 0 79 1 26 0 0 80 1 72 26 0 81 2 26 0 0
                                    0 82 1 26 0 0 83 1 6 33 33 84 1 6 33 33 87
                                    1 12 65 0 89 1 12 90 0 91 2 12 92 0 34 93 1
                                    94 65 0 95 1 94 12 0 96 3 12 0 0 34 33 97 1
                                    94 33 0 98 0 7 0 99 2 94 0 12 33 100 2 94
                                    101 0 0 102 2 12 0 92 34 103 1 0 65 0 104 2
                                    6 65 0 0 106 2 6 65 0 0 107 1 109 0 108 110
                                    1 74 109 0 111 2 109 0 0 0 112 1 109 113 0
                                    114 1 115 74 74 116 2 118 76 117 74 119 1
                                    33 109 0 120 2 40 0 0 0 121 3 123 40 122 0
                                    40 124 2 0 85 20 125 126 2 128 127 0 24 129
                                    1 131 130 0 132 2 131 0 130 0 134 2 131 0 0
                                    0 135 2 40 0 0 0 137 1 40 0 0 138 2 131 0
                                    139 0 140 3 131 0 139 0 0 141 1 128 39 0
                                    142 2 0 65 0 0 143 1 6 144 0 145 2 128 0 39
                                    24 146 1 6 0 147 148 2 6 65 0 0 149 2 76 0
                                    2 0 150 3 128 113 0 24 127 151 1 76 0 0 152
                                    1 0 156 0 157 1 34 158 0 159 2 158 65 0 144
                                    160 2 158 161 0 144 162 1 34 76 0 163 1 76
                                    2 0 164 1 0 24 0 165 1 6 0 147 166 1 76 0 0
                                    167 2 6 0 147 40 168 1 39 0 0 169 2 39 0
                                    170 0 171 1 6 144 0 173 2 7 0 0 144 176 2 7
                                    65 0 0 177 2 178 0 2 2 179 2 0 0 0 180 181
                                    1 0 28 0 182 1 12 0 34 183 3 12 101 0 0 34
                                    184 2 26 0 0 0 185 1 12 65 0 186 1 0 0 0
                                    187 2 5 0 158 20 188 1 5 0 144 189 1 76 2 0
                                    190 1 0 144 0 191 1 0 109 0 192 2 193 0 0 0
                                    194 1 76 65 0 195 1 144 109 0 196 1 109 0
                                    20 197 2 109 0 0 0 198 2 109 0 0 20 199 1
                                    76 0 0 200 2 76 0 0 33 201 1 158 0 144 202
                                    3 158 0 0 144 203 204 2 22 0 0 0 205 1 0 0
                                    24 206 2 76 0 0 0 207 1 76 33 0 208 2 0 65
                                    0 0 1 2 0 20 0 144 1 1 0 20 0 1 2 0 20 92
                                    144 1 1 0 20 224 1 1 0 20 92 1 2 0 0 0 144
                                    1 1 0 0 0 1 2 0 0 92 144 1 1 0 0 224 1 1 0
                                    0 92 1 1 0 65 0 104 6 0 0 0 0 0 0 0 0 1 3 0
                                    0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0
                                    0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0
                                    0 0 1 2 0 0 0 0 1 1 0 210 20 1 1 0 210 0 1
                                    2 1 241 0 28 1 1 0 0 0 1 1 0 212 0 1 1 0 0
                                    0 1 1 0 65 0 1 1 0 156 0 157 1 0 156 20 1 1
                                    0 0 0 1 1 0 0 0 1 1 0 85 20 1 2 0 0 0 232 1
                                    2 0 0 0 144 1 2 0 57 0 0 1 3 0 0 0 6 0 136
                                    3 0 0 0 156 20 1 2 0 0 0 223 1 2 0 0 0 180
                                    1 2 0 0 0 0 1 2 0 0 0 0 1 1 0 0 0 1 1 0 226
                                    0 1 1 0 0 0 1 1 0 20 20 1 2 0 57 0 6 133 2
                                    0 65 0 0 1 2 0 65 0 0 1 1 0 0 0 1 1 0 0 0 1
                                    2 0 154 20 85 155 1 0 0 0 105 2 0 20 20 20
                                    1 3 0 154 20 85 20 1 1 0 0 0 1 1 0 113 144
                                    1 1 0 0 0 1 1 0 0 0 1 0 0 0 1 2 0 20 0 144
                                    1 1 0 20 0 1 2 0 20 92 144 1 1 0 20 224 1 1
                                    0 20 92 1 3 0 0 0 92 144 1 2 0 0 0 144 1 1
                                    0 0 0 1 2 0 0 92 144 1 1 0 0 224 1 1 0 0 92
                                    1 1 0 57 0 1 2 0 0 0 147 1 2 0 0 0 33 1 1 0
                                    0 0 1 1 0 30 0 31 1 0 215 0 1 1 0 216 0 1 1
                                    0 222 0 1 1 13 233 0 1 1 1 240 0 1 1 12 247
                                    0 1 1 5 249 0 1 1 0 6 0 1 1 0 24 0 165 1 0
                                    144 0 191 1 0 28 0 182 1 13 225 0 1 1 1 239
                                    0 1 1 12 246 0 1 1 5 248 0 1 2 0 0 0 0 1 2
                                    5 254 255 256 1 1 5 257 255 1 2 0 20 20 20
                                    1 1 0 0 0 1 1 0 57 0 61 6 0 0 0 0 0 0 0 0 1
                                    2 0 0 0 0 1 2 0 0 0 232 1 2 0 0 0 144 1 1 0
                                    231 20 1 1 0 65 0 1 2 0 0 0 0 1 2 0 0 0 0 1
                                    2 0 0 0 147 1 0 0 0 1 2 0 0 0 0 1 3 10 244
                                    0 237 244 1 3 11 245 0 238 245 1 1 0 0 0 1
                                    3 0 33 20 85 33 88 1 0 33 0 62 2 0 65 0 0 1
                                    1 0 219 0 1 1 0 158 158 1 1 0 65 0 1 1 17
                                    65 0 1 1 0 0 0 1 1 0 17 0 44 1 5 14 0 19 0
                                    0 147 1 0 0 147 1 2 0 0 0 24 1 2 0 229 20 0
                                    1 1 16 92 28 1 4 0 0 0 0 0 0 1 4 0 0 0 0 0
                                    0 1 5 17 0 20 20 20 20 0 1 2 0 0 218 28 1 1
                                    0 222 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 1 0 0
                                    0 1 1 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3
                                    0 0 0 0 0 1 1 0 57 0 1 2 0 0 0 147 1 2 0 0
                                    0 33 1 1 0 6 0 1 2 0 211 0 0 1 1 0 0 20 1 2
                                    0 0 0 0 1 1 0 108 0 1 1 0 0 0 1 3 0 0 0 0 0
                                    1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 4 0 0 0 0 0 0
                                    1 1 0 156 20 1 1 0 156 0 1 2 0 0 158 20 1 2
                                    0 0 158 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0
                                    0 1 2 0 0 0 0 1 1 0 39 0 172 2 0 0 0 0 1 2
                                    0 0 0 0 1 2 0 0 0 0 1 4 0 0 0 0 0 0 1 1 0
                                    85 20 1 2 0 85 20 125 126 2 0 0 0 0 1 2 0 0
                                    0 0 1 1 15 229 0 1 1 5 251 0 1 1 14 229 0 1
                                    1 14 235 0 1 2 5 253 0 144 1 2 5 253 0 158
                                    1 1 15 253 0 1 2 0 65 0 144 1 2 0 65 0 158
                                    1 1 0 0 0 1 2 0 0 0 144 1 2 0 0 0 232 1 3
                                    17 0 20 20 0 1 2 0 0 0 0 1 1 0 33 0 1 2 0 0
                                    0 0 1 2 0 0 0 0 1 5 0 0 0 0 0 0 0 1 5 0 0 0
                                    0 0 0 0 1 5 0 0 0 0 0 0 0 1 5 0 0 0 0 0 0 0
                                    1 1 0 65 0 1 1 0 24 0 1 0 0 144 1 2 0 92 92
                                    92 1 1 0 0 20 1 2 0 0 0 0 56 3 0 0 144 20
                                    33 209 1 0 0 0 1 1 0 0 0 1 2 0 65 0 6 1 2 0
                                    65 0 144 1 2 0 65 0 0 1 1 0 0 0 1 3 0 213 0
                                    147 85 1 3 0 214 20 147 85 1 2 0 0 0 147 1
                                    2 0 0 0 40 1 2 0 20 20 147 1 1 0 0 0 1 1 0
                                    0 0 1 2 0 0 0 144 1 1 0 0 0 1 1 0 226 0 1 1
                                    0 85 85 1 3 0 228 0 0 0 1 2 0 230 0 0 1 2 0
                                    57 0 0 59 2 0 229 20 0 1 1 0 0 0 1 1 17 65
                                    0 1 3 0 0 0 158 217 1 3 0 0 0 158 218 1 3 0
                                    0 0 219 220 1 3 0 0 0 144 218 1 3 0 0 0 219
                                    221 1 3 0 0 0 144 217 1 3 0 0 0 210 221 1 3
                                    0 0 0 210 220 1 3 0 0 0 0 0 1 3 0 0 0 20 20
                                    1 2 0 0 0 223 1 2 0 0 0 180 181 3 0 0 0 156
                                    20 1 3 0 0 0 28 0 1 4 7 0 0 158 0 144 1 4 7
                                    0 0 219 20 144 1 4 5 0 0 144 33 217 1 4 5 0
                                    0 144 33 218 1 4 5 0 0 210 40 220 1 4 5 0 0
                                    210 40 221 1 1 0 33 0 1 1 0 0 0 1 1 0 0 0 1
                                    2 0 0 158 20 1 10 0 0 158 0 0 0 0 0 0 0 0 0
                                    1 8 0 0 158 0 0 0 0 0 0 0 1 9 0 0 158 0 0 0
                                    0 0 0 0 0 1 7 0 0 158 0 0 0 0 0 0 1 5 0 0
                                    158 0 0 0 0 1 6 0 0 158 0 0 0 0 0 1 4 0 0
                                    158 0 0 0 1 2 0 0 158 0 1 3 0 0 158 0 0 1 3
                                    0 0 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0
                                    1 1 0 0 0 1 2 0 101 0 0 1 1 0 0 0 1 2 0 0 0
                                    0 1 1 0 0 0 1 3 0 33 20 85 33 86 1 0 0 0 1
                                    1 0 0 0 1 2 0 0 0 144 174 3 0 0 0 144 33 1
                                    2 0 0 0 210 1 3 0 0 0 210 40 1 2 0 0 0 6
                                    175 1 0 0 0 1 1 1 14 0 1 1 16 0 0 1 3 0 0 0
                                    6 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0
                                    1 1 0 0 0 1 1 0 0 0 1 1 7 236 0 1 1 8 237 0
                                    1 1 9 238 0 1 1 1 0 226 1 1 0 65 0 1 1 0 0
                                    0 1 2 6 0 0 0 1 2 0 0 0 0 1 1 0 109 0 192 1
                                    0 0 24 206 1 0 0 0 1 1 0 0 6 9 1 0 0 144 1
                                    1 0 0 28 29 1 0 0 225 1 1 0 0 5 10 1 0 0 14
                                    16 1 0 5 0 11 1 0 0 17 54 1 1 0 239 1 1 1 0
                                    242 1 1 1 0 243 1 1 12 0 246 1 1 5 0 248 1
                                    1 0 33 0 1 1 3 57 0 1 3 0 0 0 0 0 1 0 0 33
                                    1 1 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0
                                    1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 1 0
                                    65 158 1 1 0 20 20 1 1 0 0 0 1 1 0 0 0 1 3
                                    0 0 0 0 0 1 2 0 65 0 0 1 1 0 0 0 1 1 0 0 0
                                    1 1 0 0 0 1 1 0 0 0 1 2 0 0 144 20 1 4 0 0
                                    144 0 0 0 1 5 0 0 144 0 0 0 0 1 3 0 0 144 0
                                    0 1 2 0 0 144 0 1 2 0 0 0 0 1 2 0 65 0 0 1
                                    2 0 0 0 0 1 1 1 156 20 1 1 1 156 0 1 1 0 0
                                    0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1
                                    1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0
                                    0 0 1 1 0 0 0 1 2 0 0 0 147 1 2 0 0 0 33 51
                                    2 0 0 0 225 1 2 0 0 0 24 1 2 0 0 0 0 1 0 0
                                    0 45 1 0 0 147 1 0 0 0 1 1 0 0 147 1 0 0 0
                                    1 1 0 0 0 1 1 0 0 0 1 2 0 0 147 40 1 1 0 0
                                    40 1 2 0 0 147 33 1 1 0 0 33 1 0 0 0 36 1 0
                                    0 0 1 2 0 0 0 0 1 1 0 0 0 1 2 0 0 0 210 1 2
                                    0 0 0 144 1 3 0 0 0 144 33 1 3 0 0 0 210 40
                                    1 1 0 0 0 1 1 0 0 0 1 3 0 0 0 0 0 1 2 0 0 0
                                    0 1 2 0 65 0 0 143 2 0 0 0 0 60 2 1 0 14 14
                                    15 2 0 0 0 0 1 1 0 0 0 187 2 0 0 0 0 53 2 0
                                    0 147 0 1 2 0 0 0 0 52 2 0 0 24 0 1 2 0 0
                                    33 0 1 2 0 0 0 225 1 2 0 0 225 0 1 2 5 0 0
                                    24 1)))))
           '|lookupComplete|)) 
