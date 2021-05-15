
(SDEFUN |JBE;coerce;JB$;1| ((|jv| JB) ($ $)) (SPADCALL |jv| (QREFELT $ 8))) 

(PUT '|JBE;coerce;E$;2| '|SPADreplace| '(XLAM (|exp|) |exp|)) 

(SDEFUN |JBE;coerce;E$;2| ((|exp| |Expression| (|Integer|)) ($ $)) |exp|) 

(PUT '|JBE;coerce;$E;3| '|SPADreplace| '(XLAM (|f|) |f|)) 

(SDEFUN |JBE;coerce;$E;3| ((|f| $) ($ |Expression| (|Integer|))) |f|) 

(SDEFUN |JBE;coerce;Smp$;4|
        ((|p| |SparseMultivariatePolynomial| (|Integer|) (|Kernel| $)) ($ $))
        (SPADCALL |p| (|spadConstant| $ 13) (QREFELT $ 15))) 

(SDEFUN |JBE;numerJP;$Smp;5|
        ((|f| $)
         ($ |SparseMultivariatePolynomial| (|Expression| (|Integer|)) JB))
        (SPROG
         ((|res|
           (|SparseMultivariatePolynomial| (|Expression| (|Integer|)) JB))
          (|Exp| (|List| (|NonNegativeInteger|))) (JV (|List| JB))
          (|newco| (|Expression| (|Integer|))) (|jv| (|Union| JB "failed"))
          (|vs| ($)) (#1=#:G422 NIL) (|v| NIL) (#2=#:G420 NIL) (|mon| NIL)
          (#3=#:G421 NIL) (|co| NIL) (CO (|List| (|Integer|)))
          (PM
           (|List| (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| $))))
          (|p| (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| $))))
         (SEQ (LETT |res| (|spadConstant| $ 18))
              (LETT |p| (SPADCALL |f| (QREFELT $ 19)))
              (LETT PM (SPADCALL |p| (QREFELT $ 21)))
              (LETT CO (SPADCALL |p| (QREFELT $ 23)))
              (SEQ (LETT |co| NIL) (LETT #3# CO) (LETT |mon| NIL) (LETT #2# PM)
                   G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |mon| (CAR #2#)) NIL)
                         (ATOM #3#) (PROGN (LETT |co| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (LETT JV NIL) (LETT |Exp| NIL)
                        (LETT |newco| (SPADCALL |co| (QREFELT $ 25)))
                        (SEQ (LETT |v| NIL)
                             (LETT #1# (SPADCALL |mon| (QREFELT $ 27))) G190
                             (COND
                              ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ (LETT |vs| (SPADCALL |v| (QREFELT $ 29)))
                                  (LETT |jv| (SPADCALL |vs| (QREFELT $ 31)))
                                  (EXIT
                                   (COND
                                    ((QEQCAR |jv| 1)
                                     (LETT |newco|
                                           (SPADCALL |newco|
                                                     (SPADCALL |vs|
                                                               (QREFELT $ 11))
                                                     (QREFELT $ 32))))
                                    ('T
                                     (SEQ (LETT JV (CONS (QCDR |jv|) JV))
                                          (EXIT
                                           (LETT |Exp|
                                                 (CONS
                                                  (SPADCALL |mon| |v|
                                                            (QREFELT $ 35))
                                                  |Exp|))))))))
                             (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (LETT |res|
                               (SPADCALL |res|
                                         (SPADCALL |newco|
                                                   (SPADCALL
                                                    (|spadConstant| $ 38)
                                                    (NREVERSE JV)
                                                    (NREVERSE |Exp|)
                                                    (QREFELT $ 41))
                                                   (QREFELT $ 42))
                                         (QREFELT $ 43)))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |JBE;coerce;Smp$;6|
        ((|p| |SparseMultivariatePolynomial| (|Expression| (|Integer|)) JB)
         ($ $))
        (SPROG
         ((|res| ($)) (|prod| ($)) (#1=#:G430 NIL) (|v| NIL) (#2=#:G428 NIL)
          (|mon| NIL) (#3=#:G429 NIL) (|co| NIL)
          (CO (|List| (|Expression| (|Integer|))))
          (PM
           (|List|
            (|SparseMultivariatePolynomial| (|Expression| (|Integer|)) JB))))
         (SEQ (LETT |res| (|spadConstant| $ 45))
              (LETT PM (SPADCALL |p| (QREFELT $ 46)))
              (LETT CO (SPADCALL |p| (QREFELT $ 48)))
              (SEQ (LETT |co| NIL) (LETT #3# CO) (LETT |mon| NIL) (LETT #2# PM)
                   G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |mon| (CAR #2#)) NIL)
                         (ATOM #3#) (PROGN (LETT |co| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |prod| |co|)
                        (SEQ (LETT |v| NIL)
                             (LETT #1# (SPADCALL |mon| (QREFELT $ 49))) G190
                             (COND
                              ((OR (ATOM #1#) (PROGN (LETT |v| (CAR #1#)) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |prod|
                                     (SPADCALL |prod|
                                               (SPADCALL
                                                (SPADCALL |v| (QREFELT $ 9))
                                                (SPADCALL |p| |v|
                                                          (QREFELT $ 50))
                                                (QREFELT $ 51))
                                               (QREFELT $ 52)))))
                             (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (LETT |res| (SPADCALL |res| |prod| (QREFELT $ 53)))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#)))) (GO G190)
                   G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |JBE;gcd;3$;7| ((|f1| $) (|f2| $) ($ $))
        (SPADCALL
         (SPADCALL (SPADCALL |f1| (QREFELT $ 19))
                   (SPADCALL |f2| (QREFELT $ 19)) (QREFELT $ 55))
         (QREFELT $ 16))) 

(SDEFUN |JBE;exquo;2$U;8| ((|f1| $) (|f2| $) ($ |Union| $ "failed"))
        (SPROG
         ((|p|
           (|Union| (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| $))
                    "failed")))
         (SEQ
          (LETT |p|
                (SPADCALL (SPADCALL |f1| (QREFELT $ 19))
                          (SPADCALL |f2| (QREFELT $ 19)) (QREFELT $ 58)))
          (EXIT
           (COND ((QEQCAR |p| 1) (CONS 1 "failed"))
                 ('T (CONS 0 (SPADCALL (QCDR |p|) (QREFELT $ 16))))))))) 

(SDEFUN |JBE;recip;$U;9| ((|f| $) ($ |Union| $ "failed"))
        (CONS 0 (SPADCALL (|spadConstant| $ 36) |f| (QREFELT $ 60)))) 

(SDEFUN |JBE;purge|
        ((|l| |List| (|Kernel| $)) (|q| |NonNegativeInteger|)
         ($ |List| (|Kernel| $)))
        (SPROG ((#1=#:G447 NIL) (|k| NIL) (#2=#:G446 NIL))
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
                           (SPADCALL (SPADCALL |k| (QREFELT $ 29))
                                     (QREFELT $ 62))
                           |q|)
                          (LETT #2# (CONS |k| #2#))))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |JBE;dimrec|
        ((|lmv| |List| (|List| (|Kernel| $))) (|indVars| |List| (|Kernel| $))
         (|remVars| . #1=(|List| (|Kernel| $)))
         (|sets| . #2=(|List| (|List| (|Kernel| $))))
         ($ |List| (|List| (|Kernel| $))))
        (SPROG
         ((|res| #2#) (|elem| (|Boolean|)) (#3=#:G464 NIL) (|ik| NIL)
          (#4=#:G463 NIL) (#5=#:G461 NIL) (|m| NIL) (#6=#:G462 NIL)
          (#7=#:G459 NIL) (|lv| NIL) (#8=#:G460 NIL)
          (|indK| (|List| (|Kernel| $))) (|newVars| #1#) (|jk| (|Kernel| $)))
         (SEQ (LETT |res| |sets|) (LETT |newVars| |remVars|)
              (SEQ G190 (COND ((NULL (NULL (NULL |newVars|))) (GO G191)))
                   (SEQ (LETT |jk| (SPADCALL |newVars| (QREFELT $ 63)))
                        (LETT |newVars| (CDR |newVars|)) (LETT |elem| NIL)
                        (LETT |indK| (SPADCALL |indVars| |jk| (QREFELT $ 64)))
                        (SEQ (LETT #8# NIL) (LETT |lv| NIL) (LETT #7# |lmv|)
                             G190
                             (COND
                              ((OR (ATOM #7#) (PROGN (LETT |lv| (CAR #7#)) NIL)
                                   #8#)
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |elem|
                                     (SPADCALL |lv| |indK| (QREFELT $ 66)))))
                             (LETT #7# (PROG1 (CDR #7#) (LETT #8# |elem|)))
                             (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          ((NULL |elem|)
                           (LETT |res|
                                 (|JBE;dimrec| |lmv| |indK| |newVars| |res|
                                  $))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |elem| NIL)
              (SEQ (LETT #6# NIL) (LETT |m| NIL) (LETT #5# |res|) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |m| (CAR #5#)) NIL) #6#)
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |elem|
                           (SPADCALL (ELT $ 68)
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
                                                              (QREFELT $ 67))
                                                    #4#))))
                                           (LETT #3# (CDR #3#)) (GO G190) G191
                                           (EXIT (NREVERSE #4#))))
                                     'T (QREFELT $ 71)))))
                   (LETT #5# (PROG1 (CDR #5#) (LETT #6# |elem|))) (GO G190)
                   G191 (EXIT NIL))
              (COND
               ((NULL |elem|)
                (LETT |res| (SPADCALL |indVars| |res| (QREFELT $ 73)))))
              (EXIT |res|)))) 

(SDEFUN |JBE;dimension;LSem2Nni;12|
        ((|sys| |List| $) (|jm| |SparseEchelonMatrix| JB $)
         (|q| |NonNegativeInteger|) ($ |NonNegativeInteger|))
        (SPROG
         ((|dim| (|NonNegativeInteger|)) (#1=#:G475 NIL) (|ind| NIL)
          (|indSets| (|List| (|List| (|Kernel| $))))
          (|dim0| (|NonNegativeInteger|)) (#2=#:G468 NIL)
          (|allvars| (|List| (|Kernel| $))) (#3=#:G474 NIL) (|lv| NIL)
          (|lmv| (|List| (|List| (|Kernel| $)))) (#4=#:G473 NIL) (|p| NIL)
          (#5=#:G472 NIL)
          (|polys|
           (|List| (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| $)))))
         (SEQ (LETT |polys| (SPADCALL (ELT $ 19) |sys| (QREFELT $ 78)))
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
                                    (SPADCALL (SPADCALL |p| (QREFELT $ 79))
                                              (QREFELT $ 27))
                                    (QREFELT $ 80))
                                   #5#))))
                          (LETT #4# (CDR #4#)) (GO G190) G191
                          (EXIT (NREVERSE #5#)))))
              (LETT |allvars| (SPADCALL |lmv| (QREFELT $ 81)))
              (SEQ (LETT |lv| NIL) (LETT #3# (CDR |lmv|)) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |lv| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |allvars|
                           (SPADCALL (SPADCALL |lv| |allvars| (QREFELT $ 82))
                                     (QREFELT $ 83)))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (LETT |dim0|
                    (PROG1
                        (LETT #2#
                              (- (SPADCALL |q| (QREFELT $ 84))
                                 (LENGTH |allvars|)))
                      (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #2#)))
              (LETT |indSets| (|JBE;dimrec| |lmv| NIL |allvars| NIL $))
              (LETT |dim| 0)
              (SEQ (LETT |ind| NIL) (LETT #1# |indSets|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |ind| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (LETT |dim| (MAX |dim| (LENGTH |ind|)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (+ |dim0| |dim|))))) 

(SDEFUN |JBE;orderDim;LSem2Nni;13|
        ((|sys| |List| $) (|jm| |SparseEchelonMatrix| JB $)
         (|q| |NonNegativeInteger|) ($ |NonNegativeInteger|))
        (SPROG
         ((|dim| (|NonNegativeInteger|)) (#1=#:G486 NIL) (|ind| NIL)
          (|indSets| (|List| (|List| (|Kernel| $))))
          (|dim0| (|NonNegativeInteger|)) (#2=#:G479 NIL)
          (|allvars| (|List| (|Kernel| $))) (#3=#:G485 NIL) (|lv| NIL)
          (|lmv| (|List| (|List| (|Kernel| $)))) (#4=#:G484 NIL) (|p| NIL)
          (#5=#:G483 NIL)
          (|polys|
           (|List| (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| $)))))
         (SEQ (LETT |polys| (SPADCALL (ELT $ 19) |sys| (QREFELT $ 78)))
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
                                     (SPADCALL (SPADCALL |p| (QREFELT $ 79))
                                               (QREFELT $ 27))
                                     |q| $)
                                    (QREFELT $ 80))
                                   #5#))))
                          (LETT #4# (CDR #4#)) (GO G190) G191
                          (EXIT (NREVERSE #5#)))))
              (LETT |allvars| (SPADCALL |lmv| (QREFELT $ 81)))
              (SEQ (LETT |lv| NIL) (LETT #3# (CDR |lmv|)) G190
                   (COND
                    ((OR (ATOM #3#) (PROGN (LETT |lv| (CAR #3#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |allvars|
                           (SPADCALL (SPADCALL |lv| |allvars| (QREFELT $ 82))
                                     (QREFELT $ 83)))))
                   (LETT #3# (CDR #3#)) (GO G190) G191 (EXIT NIL))
              (LETT |dim0|
                    (PROG1
                        (LETT #2#
                              (- (SPADCALL |q| (QREFELT $ 87))
                                 (LENGTH |allvars|)))
                      (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                        '(|Integer|) #2#)))
              (LETT |indSets| (|JBE;dimrec| |lmv| NIL |allvars| NIL $))
              (LETT |dim| 0)
              (SEQ (LETT |ind| NIL) (LETT #1# |indSets|) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |ind| (CAR #1#)) NIL))
                     (GO G191)))
                   (SEQ (EXIT (LETT |dim| (MAX |dim| (LENGTH |ind|)))))
                   (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
              (EXIT (+ |dim0| |dim|))))) 

(SDEFUN |JBE;simpSMP|
        ((|p| |SparseMultivariatePolynomial| (|Integer|) (|Kernel| $))
         ($ |SparseMultivariatePolynomial| (|Integer|) (|Kernel| $)))
        (SPROG
         ((|up|
           (|SparseUnivariatePolynomial|
            (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| $))))
          (|md| (|NonNegativeInteger|))
          (|lc| (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| $)))
          (|v| (|Kernel| $)) (|tv| (|Union| (|Kernel| $) "failed")))
         (SEQ
          (COND ((SPADCALL |p| (QREFELT $ 89)) (|spadConstant| $ 13))
                (#1='T
                 (SEQ (LETT |tv| (SPADCALL |p| (QREFELT $ 91)))
                      (EXIT
                       (COND ((QEQCAR |tv| 1) (|error| "inconsistent system"))
                             (#1#
                              (SEQ (LETT |v| (QCDR |tv|))
                                   (LETT |up|
                                         (SPADCALL |p| |v| (QREFELT $ 93)))
                                   (EXIT
                                    (COND
                                     ((SPADCALL |up| (QREFELT $ 95))
                                      (SEQ
                                       (LETT |lc|
                                             (SPADCALL |up| (QREFELT $ 96)))
                                       (EXIT
                                        (COND
                                         ((QEQCAR
                                           (SPADCALL |lc| (QREFELT $ 91)) 1)
                                          (SPADCALL (|spadConstant| $ 13) |v| 1
                                                    (QREFELT $ 97)))
                                         (#1#
                                          (SPADCALL (|JBE;simpSMP| |lc| $) |v|
                                                    1 (QREFELT $ 97)))))))
                                     (#1#
                                      (SEQ
                                       (LETT |md|
                                             (SPADCALL |up| (QREFELT $ 98)))
                                       (EXIT
                                        (COND
                                         ((> |md| 0)
                                          (SEQ
                                           (LETT |up|
                                                 (QCAR
                                                  (SPADCALL |up|
                                                            (SPADCALL
                                                             (|spadConstant| $
                                                                             13)
                                                             |md|
                                                             (QREFELT $ 100))
                                                            (QREFELT $ 102))))
                                           (EXIT
                                            (SPADCALL |up| |v|
                                                      (QREFELT $ 103)))))
                                         (#1# |p|))))))))))))))))) 

(SDEFUN |JBE;simpOne;2$;15| ((|f| $) ($ $))
        (COND ((SPADCALL |f| (QREFELT $ 104)) (|spadConstant| $ 45))
              ('T
               (SPADCALL (|JBE;simpSMP| (SPADCALL |f| (QREFELT $ 19)) $)
                         (QREFELT $ 16))))) 

(SDEFUN |JBE;greaterLD|
        ((|r1| |Record| (|:| |Fun| $)
          (|:| JMR
               (|Record| (|:| |Indices| (|List| JB))
                         (|:| |Entries| (|List| $))))
          (|:| |Depend| (|List| (|NonNegativeInteger|))))
         (|r2| |Record| (|:| |Fun| $)
          (|:| JMR
               (|Record| (|:| |Indices| #1=(|List| JB))
                         (|:| |Entries| (|List| $))))
          (|:| |Depend| (|List| (|NonNegativeInteger|))))
         ($ |Boolean|))
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
                                         (|SPADfirst| |ind2|) (QREFELT $ 106))
                               (< (LENGTH |ind1|) (LENGTH |ind2|)))
                              (#2#
                               (SPADCALL (|SPADfirst| |ind1|)
                                         (|SPADfirst| |ind2|)
                                         (QREFELT $ 107))))))))))) 

(SDEFUN |JBE;groebner| ((|sys| |List| $) ($ |List| $))
        (SPROG
         ((|gbase|
           (|List| (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| $))))
          (|polys|
           (|List| (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| $)))))
         (SEQ (LETT |polys| (SPADCALL (ELT $ 19) |sys| (QREFELT $ 78)))
              (SPADCALL
               (SPADCALL (SPADCALL "polys" (QREFELT $ 110))
                         (SPADCALL |polys| (QREFELT $ 111)) (QREFELT $ 112))
               (QREFELT $ 114))
              (LETT |gbase| (SPADCALL |polys| (QREFELT $ 116)))
              (EXIT (SPADCALL (ELT $ 16) |gbase| (QREFELT $ 119)))))) 

(SDEFUN |JBE;groebnerSimp|
        ((|sysL| |List|
          (|Record| (|:| |Fun| $)
                    (|:| JMR
                         (|Record| (|:| |Indices| (|List| JB))
                                   (|:| |Entries| (|List| $))))
                    (|:| |Depend| (|List| (|NonNegativeInteger|)))))
         (|ind| |List| JB)
         ($ |List|
          (|Record| (|:| |Fun| $)
                    (|:| JMR
                         (|Record| (|:| |Indices| (|List| JB))
                                   (|:| |Entries| (|List| $))))
                    (|:| |Depend| (|List| (|NonNegativeInteger|))))))
        (SPROG
         ((#1=#:G528 NIL) (|fun| NIL) (|i| NIL) (#2=#:G527 NIL)
          (|resJM| (|SparseEchelonMatrix| JB $)) (#3=#:G526 NIL) (|eq| NIL)
          (#4=#:G525 NIL) (|resSys| (|List| $)) (#5=#:G524 NIL) (|rec| NIL)
          (#6=#:G523 NIL) (|resDep| (|List| (|NonNegativeInteger|)))
          (|tmp| (|List| (|List| (|NonNegativeInteger|)))) (#7=#:G522 NIL)
          (#8=#:G521 NIL))
         (SEQ
          (SPADCALL
           (SPADCALL (SPADCALL "groebnerSimp: #" (QREFELT $ 110))
                     (SPADCALL (LENGTH |sysL|) (QREFELT $ 120))
                     (QREFELT $ 112))
           (QREFELT $ 114))
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
          (LETT |resDep| (SPADCALL (ELT $ 121) |tmp| NIL (QREFELT $ 124)))
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
                 $))
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
                          (QREFELT $ 126)))
          (SPADCALL (SPADCALL "END groebnerSimp" (QREFELT $ 110))
                    (QREFELT $ 114))
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
                          (VECTOR |fun| (SPADCALL |resJM| |i| (QREFELT $ 129))
                                  |resDep|)
                          #2#))))
                 (LETT #1# (PROG1 (CDR #1#) (LETT |i| (|inc_SI| |i|))))
                 (GO G190) G191 (EXIT (NREVERSE #2#)))))))) 

(SDEFUN |JBE;linearSimp|
        ((|sysL| |List|
          (|Record| (|:| |Fun| $)
                    (|:| JMR
                         (|Record| (|:| |Indices| (|List| JB))
                                   (|:| |Entries| (|List| $))))
                    (|:| |Depend| (|List| (|NonNegativeInteger|)))))
         (|ind| |List| JB)
         ($ |List|
          (|Record| (|:| |Fun| $)
                    (|:| JMR
                         (|Record| (|:| |Indices| (|List| JB))
                                   (|:| |Entries| (|List| $))))
                    (|:| |Depend| (|List| (|NonNegativeInteger|))))))
        (SPROG
         ((|res|
           (|List|
            (|Record| (|:| |Fun| $)
                      (|:| JMR
                           (|Record| (|:| |Indices| (|List| JB))
                                     (|:| |Entries| (|List| $))))
                      (|:| |Depend| (|List| (|NonNegativeInteger|))))))
          (|newDep| (|List| (|NonNegativeInteger|)))
          (|newJMR|
           (|Record| (|:| |Indices| (|List| JB)) (|:| |Entries| (|List| $))))
          (|newFun| ($)) (#1=#:G550 NIL)
          (|rec|
           #2=(|Record| (|:| |Fun| $)
                        (|:| JMR
                             (|Record| (|:| |Indices| (|List| JB))
                                       (|:| |Entries| (|List| $))))
                        (|:| |Depend| (|List| (|NonNegativeInteger|)))))
          (|sdep| (|List| (|NonNegativeInteger|))) (|ssub| ($)) (#3=#:G533 NIL)
          (|rsysL|
           (|List|
            (|Record| (|:| |Fun| $)
                      (|:| JMR
                           (|Record| (|:| |Indices| (|List| JB))
                                     (|:| |Entries| (|List| $))))
                      (|:| |Depend| (|List| (|NonNegativeInteger|))))))
          (|sld| (JB)) (|srec| #2#) (|solved?| (|Boolean|))
          (|s| (|Union| $ #4="failed")) (|ld| (JB)))
         (SEQ (LETT |solved?| NIL) (LETT |rsysL| NIL)
              (SEQ G190
                   (COND
                    ((NULL (COND (|solved?| NIL) ('T (NULL (NULL |sysL|)))))
                     (GO G191)))
                   (SEQ (LETT |rec| (SPADCALL |sysL| (QREFELT $ 132)))
                        (LETT |sysL| (CDR |sysL|))
                        (LETT |ld| (|SPADfirst| (QCAR (QVELT |rec| 1))))
                        (LETT |s|
                              (SPADCALL (QVELT |rec| 0) |ld| (QREFELT $ 133)))
                        (LETT |solved?| (QEQCAR |s| 0))
                        (EXIT
                         (COND
                          (|solved?|
                           (SEQ (LETT |srec| |rec|) (EXIT (LETT |sld| |ld|))))
                          ('T
                           (LETT |rsysL|
                                 (SPADCALL |rec| |rsysL| (QREFELT $ 134)))))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |rsysL|
                    (SPADCALL (NREVERSE |rsysL|) |sysL| (QREFELT $ 135)))
              (EXIT
               (COND
                (|solved?|
                 (SEQ
                  (LETT |ssub|
                        (PROG2 (LETT #3# |s|)
                            (QCDR #3#)
                          (|check_union2| (QEQCAR #3# 0) $ (|Union| $ #4#)
                                          #3#)))
                  (LETT |res| (LIST |srec|)) (LETT |sdep| (QVELT |srec| 2))
                  (SEQ (LETT |rec| NIL) (LETT #1# |rsysL|) G190
                       (COND
                        ((OR (ATOM #1#) (PROGN (LETT |rec| (CAR #1#)) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |newFun|
                              (SPADCALL
                               (SPADCALL (QVELT |rec| 0) |sld| |ssub|
                                         (QREFELT $ 136))
                               (QREFELT $ 105)))
                        (EXIT
                         (COND
                          ((NULL (SPADCALL |newFun| (QREFELT $ 104)))
                           (SEQ
                            (LETT |newJMR|
                                  (SPADCALL
                                   (SPADCALL (LIST |newFun|) (LIST |ind|)
                                             (QREFELT $ 126))
                                   1 (QREFELT $ 129)))
                            (LETT |newDep|
                                  (SPADCALL
                                   (SPADCALL (QVELT |rec| 2) |sdep|
                                             (QREFELT $ 137))
                                   (QREFELT $ 138)))
                            (EXIT
                             (LETT |res|
                                   (SPADCALL
                                    (VECTOR |newFun| |newJMR| |newDep|) |res|
                                    (QREFELT $ 134)))))))))
                       (LETT #1# (CDR #1#)) (GO G190) G191 (EXIT NIL))
                  (EXIT (NREVERSE |res|))))
                ('T (|JBE;groebnerSimp| |rsysL| |ind| $))))))) 

(SDEFUN |JBE;simpRec|
        ((|sysL| |List|
          (|Record| (|:| |Fun| $)
                    (|:| JMR
                         (|Record| (|:| |Indices| (|List| JB))
                                   (|:| |Entries| (|List| $))))
                    (|:| |Depend| (|List| (|NonNegativeInteger|)))))
         (|ind| |List| JB)
         ($ |List|
          (|Record| (|:| |Fun| $)
                    (|:| JMR
                         (|Record| (|:| |Indices| (|List| JB))
                                   (|:| |Entries| (|List| $))))
                    (|:| |Depend| (|List| (|NonNegativeInteger|))))))
        (SPROG
         ((|newSysL|
           (|List|
            (|Record| (|:| |Fun| $)
                      (|:| JMR
                           (|Record| (|:| |Indices| (|List| JB))
                                     (|:| |Entries| (|List| $))))
                      (|:| |Depend| (|List| (|NonNegativeInteger|))))))
          (|sld| (JB))
          (|srec|
           #1=(|Record| (|:| |Fun| $)
                        (|:| JMR
                             (|Record| (|:| |Indices| (|List| JB))
                                       (|:| |Entries| (|List| $))))
                        (|:| |Depend| (|List| (|NonNegativeInteger|)))))
          (|eqLD| (|List| #1#))
          (|resLD|
           (|List|
            (|Record| (|:| |Fun| $)
                      (|:| JMR
                           (|Record| (|:| |Indices| (|List| JB))
                                     (|:| |Entries| (|List| $))))
                      (|:| |Depend| (|List| (|NonNegativeInteger|))))))
          (|fld| (JB)) (|frec| #1#))
         (SEQ
          (COND ((< (LENGTH |sysL|) 2) |sysL|)
                (#2='T
                 (SEQ (LETT |frec| (SPADCALL |sysL| (QREFELT $ 132)))
                      (LETT |fld| (|SPADfirst| (QCAR (QVELT |frec| 1))))
                      (LETT |sysL| (CDR |sysL|))
                      (LETT |srec| (SPADCALL |sysL| (QREFELT $ 132)))
                      (LETT |sld| (|SPADfirst| (QCAR (QVELT |srec| 1))))
                      (EXIT
                       (COND
                        ((SPADCALL |fld| |sld| (QREFELT $ 107))
                         (SPADCALL |frec| (|JBE;simpRec| |sysL| |ind| $)
                                   (QREFELT $ 134)))
                        (#2#
                         (SEQ (LETT |eqLD| (LIST |frec|))
                              (SEQ G190
                                   (COND
                                    ((NULL
                                      (COND ((NULL |sysL|) NIL)
                                            ('T
                                             (SPADCALL |sld| |fld|
                                                       (QREFELT $ 106)))))
                                     (GO G191)))
                                   (SEQ
                                    (LETT |eqLD|
                                          (SPADCALL |srec| |eqLD|
                                                    (QREFELT $ 134)))
                                    (LETT |sysL| (CDR |sysL|))
                                    (EXIT
                                     (COND
                                      ((NULL (NULL |sysL|))
                                       (SEQ
                                        (LETT |srec|
                                              (SPADCALL |sysL|
                                                        (QREFELT $ 132)))
                                        (EXIT
                                         (LETT |sld|
                                               (|SPADfirst|
                                                (QCAR (QVELT |srec| 1))))))))))
                                   NIL (GO G190) G191 (EXIT NIL))
                              (LETT |eqLD|
                                    (SPADCALL
                                     (CONS (|function| |JBE;greaterLD|) $)
                                     (|JBE;linearSimp| (NREVERSE |eqLD|) |ind|
                                      $)
                                     (QREFELT $ 140)))
                              (LETT |srec| (SPADCALL |eqLD| (QREFELT $ 132)))
                              (LETT |sld|
                                    (|SPADfirst| (QCAR (QVELT |srec| 1))))
                              (LETT |resLD| NIL)
                              (SEQ G190
                                   (COND
                                    ((NULL
                                      (COND ((NULL |eqLD|) NIL)
                                            ('T
                                             (SPADCALL |sld| |fld|
                                                       (QREFELT $ 106)))))
                                     (GO G191)))
                                   (SEQ
                                    (LETT |resLD|
                                          (SPADCALL |srec| |resLD|
                                                    (QREFELT $ 134)))
                                    (LETT |eqLD| (CDR |eqLD|))
                                    (EXIT
                                     (COND
                                      ((NULL (NULL |eqLD|))
                                       (SEQ
                                        (LETT |srec|
                                              (SPADCALL |eqLD|
                                                        (QREFELT $ 132)))
                                        (EXIT
                                         (LETT |sld|
                                               (|SPADfirst|
                                                (QCAR (QVELT |srec| 1))))))))))
                                   NIL (GO G190) G191 (EXIT NIL))
                              (LETT |newSysL|
                                    (SPADCALL
                                     (CONS (|function| |JBE;greaterLD|) $)
                                     |eqLD| |sysL| (QREFELT $ 141)))
                              (EXIT
                               (SPADCALL (NREVERSE |resLD|)
                                         (|JBE;simpRec| |newSysL| |ind| $)
                                         (QREFELT $ 135))))))))))))) 

(SDEFUN |JBE;simplify;LSemR;21|
        ((|sys| |List| $) (|jm| |SparseEchelonMatrix| JB $)
         ($ |Record| (|:| |Sys| (|List| $))
          (|:| JM (|SparseEchelonMatrix| JB $))
          (|:| |Depend|
               (|Union| "failed" (|List| (|List| (|NonNegativeInteger|)))))))
        (SPROG
         ((|resDep| (|List| (|List| (|NonNegativeInteger|))))
          (|resSys| (|List| $)) (#1=#:G606 NIL) (|rec| NIL) (|i| NIL)
          (|resJM| (|SparseEchelonMatrix| JB $))
          (|sysL|
           (|List|
            (|Record| (|:| |Fun| $)
                      (|:| JMR
                           (|Record| (|:| |Indices| (|List| JB))
                                     (|:| |Entries| (|List| $))))
                      (|:| |Depend| (|List| (|NonNegativeInteger|))))))
          (|r|
           (|Record| (|:| |Indices| (|List| JB)) (|:| |Entries| (|List| $))))
          (|neq| ($)) (#2=#:G605 NIL) (|eq| NIL) (|inds| (|List| JB)))
         (SEQ (LETT |inds| (SPADCALL |jm| (QREFELT $ 142))) (LETT |sysL| NIL)
              (SEQ (LETT |i| 1) (LETT |eq| NIL) (LETT #2# |sys|) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |eq| (CAR #2#)) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((NULL (SPADCALL |eq| (QREFELT $ 104)))
                       (SEQ (LETT |neq| (SPADCALL |eq| (QREFELT $ 105)))
                            (COND
                             ((SPADCALL |neq| |eq| (QREFELT $ 143))
                              (LETT |r| (SPADCALL |jm| |i| (QREFELT $ 129))))
                             ('T
                              (LETT |r|
                                    (SPADCALL
                                     (SPADCALL (LIST |neq|)
                                               (LIST
                                                (QCAR
                                                 (SPADCALL |jm| |i|
                                                           (QREFELT $ 129))))
                                               (QREFELT $ 126))
                                     1 (QREFELT $ 129)))))
                            (COND
                             ((OR (NULL (QCAR |r|))
                                  (EQUAL
                                   (SPADCALL (|SPADfirst| (QCAR |r|))
                                             (QREFELT $ 145))
                                   '|Indep|))
                              (EXIT (|error| "inconsistent system"))))
                            (EXIT
                             (LETT |sysL|
                                   (SPADCALL (VECTOR |neq| |r| (LIST |i|))
                                             |sysL| (QREFELT $ 134)))))))))
                   (LETT #2# (PROG1 (CDR #2#) (LETT |i| (|inc_SI| |i|))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT
               (COND
                ((NULL |sysL|)
                 (VECTOR (SPADCALL (QREFELT $ 146))
                         (SPADCALL NIL 0 (QREFELT $ 147)) (CONS 1 NIL)))
                ('T
                 (SEQ
                  (LETT |sysL|
                        (|JBE;simpRec|
                         (SPADCALL (CONS (|function| |JBE;greaterLD|) $) |sysL|
                                   (QREFELT $ 140))
                         |inds| $))
                  (LETT |resSys| (SPADCALL (QREFELT $ 146)))
                  (LETT |resJM|
                        (SPADCALL |inds| (LENGTH |sysL|) (QREFELT $ 147)))
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
                                         (SPADCALL 1 (QREFELT $ 149))
                                         (QREFELT $ 150)))
                           (|error| "inconsistent system"))
                          ('T
                           (SEQ
                            (LETT |resSys|
                                  (SPADCALL (QVELT |rec| 0) |resSys|
                                            (QREFELT $ 151)))
                            (SPADCALL |resJM| |i| (QVELT |rec| 1)
                                      (QREFELT $ 152))
                            (EXIT
                             (LETT |resDep|
                                   (CONS (QVELT |rec| 2) |resDep|))))))))
                       (LETT #1# (PROG1 (CDR #1#) (LETT |i| (|inc_SI| |i|))))
                       (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (VECTOR (SPADCALL |resSys| (QREFELT $ 153)) |resJM|
                           (CONS 1 (NREVERSE |resDep|))))))))))) 

(SDEFUN |JBE;jetVariables;$L;22| ((|Phi| $) ($ |List| JB))
        (SPROG
         ((JV (|List| JB)) (#1=#:G621 NIL)
          (|pmindex| (|List| (|NonNegativeInteger|))) (#2=#:G618 NIL)
          (#3=#:G636 NIL) (|i| NIL) (#4=#:G635 NIL)
          (|mindex| (|List| (|Integer|))) (#5=#:G634 NIL) (#6=#:G633 NIL)
          (|pupindex| #7=(|Integer|)) (#8=#:G615 NIL) (|uindex| #7#)
          (#9=#:G612 NIL) (|xindex| #7#) (|arg| (|List| $)) (|typ| (|Symbol|))
          (#10=#:G609 NIL) (#11=#:G631 NIL) (|Ke| NIL) (#12=#:G632 NIL)
          (|Op| NIL) (|LOps| (|List| (|BasicOperator|))) (#13=#:G630 NIL)
          (#14=#:G629 NIL) (|LKernels| (|List| (|Kernel| $))))
         (SEQ (LETT JV NIL) (LETT |LKernels| (SPADCALL |Phi| (QREFELT $ 158)))
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
                                  (CONS (SPADCALL |Ke| (QREFELT $ 160))
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
                      ((SPADCALL |Op| '|%jet| (QREFELT $ 161))
                       (SEQ
                        (LETT |typ|
                              (PROG2
                                  (LETT #10#
                                        (SPADCALL |Op| '|%jet|
                                                  (QREFELT $ 163)))
                                  (QCDR #10#)
                                (|check_union2| (QEQCAR #10# 0) (|None|)
                                                (|Union| (|None|) "failed")
                                                #10#)))
                        (LETT |arg| (SPADCALL |Ke| (QREFELT $ 164)))
                        (EXIT
                         (COND
                          ((EQUAL |typ| '|Indep|)
                           (SEQ
                            (LETT |xindex|
                                  (SPADCALL (SPADCALL |arg| (QREFELT $ 165))
                                            (QREFELT $ 166)))
                            (EXIT
                             (LETT JV
                                   (CONS
                                    (SPADCALL
                                     (PROG1 (LETT #9# |xindex|)
                                       (|check_subtype2| (> #9# 0)
                                                         '(|PositiveInteger|)
                                                         '(|Integer|) #9#))
                                     (QREFELT $ 167))
                                    JV)))))
                          ((EQUAL |typ| '|Dep|)
                           (SEQ
                            (LETT |uindex|
                                  (SPADCALL (SPADCALL |arg| (QREFELT $ 165))
                                            (QREFELT $ 166)))
                            (EXIT
                             (LETT JV
                                   (CONS
                                    (SPADCALL
                                     (PROG1 (LETT #8# |uindex|)
                                       (|check_subtype2| (> #8# 0)
                                                         '(|PositiveInteger|)
                                                         '(|Integer|) #8#))
                                     (QREFELT $ 149))
                                    JV)))))
                          ('T
                           (SEQ
                            (LETT |pupindex|
                                  (SPADCALL (SPADCALL |arg| (QREFELT $ 165))
                                            (QREFELT $ 166)))
                            (LETT |mindex|
                                  (PROGN
                                   (LETT #6# NIL)
                                   (SEQ (LETT |i| NIL)
                                        (LETT #5#
                                              (SPADCALL
                                               (SPADCALL |arg| (QREFELT $ 168))
                                               (QREFELT $ 168)))
                                        G190
                                        (COND
                                         ((OR (ATOM #5#)
                                              (PROGN (LETT |i| (CAR #5#)) NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #6#
                                                (CONS
                                                 (SPADCALL |i| (QREFELT $ 166))
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
                                     |pmindex| (QREFELT $ 169))
                                    JV))))))))))))
                   (LETT #11# (PROG1 (CDR #11#) (LETT #12# (CDR #12#))))
                   (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (ELT $ 107) (SPADCALL JV (QREFELT $ 170))
                         (QREFELT $ 172)))))) 

(SDEFUN |JBE;differentiate;$JB$;23| ((|fun| $) (|jv| JB) ($ $))
        (SPROG ((|x| (|Symbol|)))
               (SEQ (LETT |x| (SPADCALL |jv| (QREFELT $ 174)))
                    (EXIT (SPADCALL |fun| |x| (QREFELT $ 175)))))) 

(SDEFUN |JBE;differentiate;$S$;24| ((|fun| $) (|x| |Symbol|) ($ $))
        (SPADCALL (SPADCALL |fun| (QREFELT $ 11)) |x| (QREFELT $ 177))) 

(SDEFUN |JBE;subst;$JB2$;25| ((|f| $) (|jv| JB) (|exp| $) ($ $))
        (SPROG ((|res| ($)))
               (SEQ
                (LETT |res|
                      (SPADCALL |f|
                                (SPADCALL (SPADCALL |jv| (QREFELT $ 9)) |exp|
                                          (QREFELT $ 180))
                                (QREFELT $ 182)))
                (EXIT |res|)))) 

(SDEFUN |JBE;solveFor;$JBU;26| ((|f| $) (|jv| JB) ($ |Union| $ "failed"))
        (SPROG
         ((|vquo| #1=(|List| (|Kernel| $))) (|vrem| #1#)
          (|md|
           (|Record|
            (|:| |quotient|
                 (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| $)))
            (|:| |remainder|
                 (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| $)))))
          (|var| (|Kernel| $))
          (|fun| (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| $))))
         (SEQ (LETT |fun| (SPADCALL |f| (QREFELT $ 19)))
              (LETT |var|
                    (SPADCALL (SPADCALL |jv| (QREFELT $ 9)) (QREFELT $ 183)))
              (LETT |md|
                    (SPADCALL |fun| (SPADCALL |var| (QREFELT $ 184)) |var|
                              (QREFELT $ 185)))
              (LETT |vrem| (SPADCALL (QCDR |md|) (QREFELT $ 27)))
              (LETT |vquo| (SPADCALL (QCAR |md|) (QREFELT $ 27)))
              (EXIT
               (COND
                ((SPADCALL |var| (SPADCALL |vrem| |vquo| (QREFELT $ 186))
                           (QREFELT $ 67))
                 (CONS 1 "failed"))
                ((SPADCALL (QCDR |md|) (QREFELT $ 187))
                 (COND ((NULL |vquo|) (CONS 0 (|spadConstant| $ 45)))
                       (#2='T (CONS 1 "failed"))))
                (#2#
                 (CONS 0
                       (SPADCALL
                        (SPADCALL (QCDR |md|) (QCAR |md|) (QREFELT $ 15))
                        (QREFELT $ 188))))))))) 

(SDEFUN |JBE;kernel0| ((|op| |BasicOperator|) (|ls| |List| $) ($ $))
        (SPADCALL |op| |ls| (QREFELT $ 189))) 

(SDEFUN |JBE;sy2jbe| ((|s| |Symbol|) ($ $)) (SPADCALL |s| (QREFELT $ 190))) 

(SDEFUN |JBE;hidedisp| ((|l| |List| $) ($ |OutputForm|))
        (SPROG
         ((|op| (|OutputForm|)) (#1=#:G662 NIL) (|e| NIL) (#2=#:G661 NIL)
          (#3=#:G660 NIL) (|k| NIL) (|args| (|List| (|OutputForm|)))
          (#4=#:G659 NIL) (|show| #5=(|Integer|)) (|num| #5#)
          (|name| (|Symbol|)))
         (SEQ
          (LETT |name|
                (SPADCALL (SPADCALL |l| (QREFELT $ 191)) (QREFELT $ 192)))
          (LETT |l| (SPADCALL |l| (QREFELT $ 168)))
          (LETT |num|
                (SPADCALL (SPADCALL |l| (QREFELT $ 191)) (QREFELT $ 166)))
          (LETT |l| (SPADCALL |l| (QREFELT $ 168)))
          (LETT |show|
                (SPADCALL (SPADCALL |l| (QREFELT $ 191)) (QREFELT $ 166)))
          (LETT |l| (SPADCALL |l| (QREFELT $ 168))) (LETT |args| NIL)
          (SEQ (LETT |k| 1) (LETT #4# |show|) G190
               (COND ((|greater_SI| |k| #4#) (GO G191)))
               (SEQ
                (LETT |args|
                      (SPADCALL |args|
                                (LIST
                                 (SPADCALL (SPADCALL |l| (QREFELT $ 191))
                                           (QREFELT $ 193)))
                                (QREFELT $ 195)))
                (EXIT (LETT |l| (SPADCALL |l| (QREFELT $ 168)))))
               (LETT |k| (|inc_SI| |k|)) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |k| (+ |show| 1)) (LETT #3# |num|) G190
               (COND ((> |k| #3#) (GO G191)))
               (SEQ (EXIT (LETT |l| (SPADCALL |l| (QREFELT $ 168)))))
               (LETT |k| (+ |k| 1)) (GO G190) G191 (EXIT NIL))
          (COND
           ((SPADCALL |l| (QREFELT $ 196))
            (LETT |op| (SPADCALL |name| (QREFELT $ 197))))
           (#6='T
            (LETT |op|
                  (SPADCALL (SPADCALL |name| (QREFELT $ 197))
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
                                           (CONS (SPADCALL |e| (QREFELT $ 193))
                                                 #2#))))
                                   (LETT #1# (CDR #1#)) (GO G190) G191
                                   (EXIT (NREVERSE #2#))))
                             (QREFELT $ 198))
                            (QREFELT $ 199)))))
          (EXIT
           (COND ((NULL |args|) |op|)
                 (#6# (SPADCALL |op| |args| (QREFELT $ 200)))))))) 

(SDEFUN |JBE;hidediff| ((|l| |List| $) (|x| |Symbol|) ($ $))
        (SPROG
         ((|res| ($)) (|newarg| (|List| $)) (#1=#:G685 NIL) (|j| NIL)
          (#2=#:G684 NIL) (|da| ($)) (|k| NIL) (#3=#:G683 NIL) (|arg| NIL)
          (|op| (|BasicOperator|)) (|oldarg| (|List| $)) (#4=#:G666 NIL)
          (|diff| (|List| (|Integer|))) (#5=#:G682 NIL) (#6=#:G681 NIL)
          (|args| (|List| $)) (#7=#:G680 NIL) (|show| #8=(|Integer|))
          (|num| #8#) (|name| (|Symbol|)))
         (SEQ (LETT |oldarg| (SPADCALL |l| (QREFELT $ 201)))
              (LETT |name|
                    (SPADCALL (SPADCALL |l| (QREFELT $ 191)) (QREFELT $ 192)))
              (LETT |l| (SPADCALL |l| (QREFELT $ 168)))
              (LETT |num|
                    (SPADCALL (SPADCALL |l| (QREFELT $ 191)) (QREFELT $ 166)))
              (EXIT
               (COND ((ZEROP |num|) (|spadConstant| $ 45))
                     ('T
                      (SEQ (LETT |l| (SPADCALL |l| (QREFELT $ 168)))
                           (LETT |show|
                                 (SPADCALL (SPADCALL |l| (QREFELT $ 191))
                                           (QREFELT $ 166)))
                           (LETT |l| (SPADCALL |l| (QREFELT $ 168)))
                           (LETT |args| (SPADCALL (QREFELT $ 146)))
                           (SEQ (LETT |k| 1) (LETT #7# |num|) G190
                                (COND ((|greater_SI| |k| #7#) (GO G191)))
                                (SEQ
                                 (LETT |args|
                                       (SPADCALL (SPADCALL |l| (QREFELT $ 191))
                                                 |args| (QREFELT $ 151)))
                                 (EXIT
                                  (LETT |l| (SPADCALL |l| (QREFELT $ 168)))))
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
                                                (SPADCALL |k| (QREFELT $ 166))
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
                                           (QREFELT $ 202)))
                           (LETT |op| (SPADCALL |name| (QREFELT $ 203)))
                           (SPADCALL |op| '|%specialDisp|
                                     (CONS (|function| |JBE;hidedisp|) $)
                                     (QREFELT $ 205))
                           (SPADCALL |op| '|%specialDiff|
                                     (CONS (|function| |JBE;hidediff|) $)
                                     (QREFELT $ 205))
                           (LETT |res| (|spadConstant| $ 45))
                           (SEQ (LETT |arg| NIL) (LETT #3# |args|)
                                (LETT |k| |num|) G190
                                (COND
                                 ((OR (< |k| 1) (ATOM #3#)
                                      (PROGN (LETT |arg| (CAR #3#)) NIL))
                                  (GO G191)))
                                (SEQ
                                 (LETT |da|
                                       (SPADCALL |arg| |x| (QREFELT $ 175)))
                                 (EXIT
                                  (COND
                                   ((NULL (SPADCALL |da| (QREFELT $ 104)))
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
                                                                  (QREFELT $
                                                                           206)))
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
                                                                     (QREFELT $
                                                                              207))
                                                                    #2#))))
                                                           (LETT #1# (CDR #1#))
                                                           (GO G190) G191
                                                           (EXIT
                                                            (NREVERSE #2#))))
                                                     (QREFELT $ 208)))
                                     (EXIT
                                      (LETT |res|
                                            (SPADCALL |res|
                                                      (SPADCALL
                                                       (|JBE;kernel0| |op|
                                                        |newarg| $)
                                                       |da| (QREFELT $ 52))
                                                      (QREFELT $ 53)))))))))
                                (LETT |k|
                                      (PROG1 (+ |k| -1) (LETT #3# (CDR #3#))))
                                (GO G190) G191 (EXIT NIL))
                           (EXIT |res|)))))))) 

(SDEFUN |JBE;function;SLNni$;31|
        ((|f| |Symbol|) (|arg| |List| $) (|show| |NonNegativeInteger|) ($ $))
        (SPROG ((|args| (|List| $)) (|op| (|BasicOperator|)))
               (SEQ (LETT |op| (SPADCALL |f| (QREFELT $ 203)))
                    (SPADCALL |op| '|%specialDisp|
                              (CONS (|function| |JBE;hidedisp|) $)
                              (QREFELT $ 205))
                    (SPADCALL |op| '|%specialDiff|
                              (CONS (|function| |JBE;hidediff|) $)
                              (QREFELT $ 205))
                    (LETT |args|
                          (SPADCALL
                           (LIST (|JBE;sy2jbe| |f| $)
                                 (SPADCALL (SPADCALL |arg| (QREFELT $ 209))
                                           (QREFELT $ 207))
                                 (SPADCALL |show| (QREFELT $ 207)))
                           |arg| (QREFELT $ 208)))
                    (EXIT (|JBE;kernel0| |op| |args| $))))) 

(DECLAIM (NOTINLINE |JetBundleExpression;|)) 

(DEFUN |JetBundleExpression| (#1=#:G746)
  (SPROG NIL
         (PROG (#2=#:G747)
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

(DEFUN |JetBundleExpression;| (|#1|)
  (SPROG ((|pv$| NIL) (#1=#:G745 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|))
          (LETT |dv$| (LIST '|JetBundleExpression| DV$1))
          (LETT $ (GETREFV 261))
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3
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
                                              (OR
                                               (AND
                                                (|HasCategory| (|Integer|)
                                                               '(|ConvertibleTo|
                                                                 (|Pattern|
                                                                  (|Float|))))
                                                (|HasCategory| (|Integer|)
                                                               '(|LinearlyExplicitOver|
                                                                 (|Integer|))))
                                               (AND
                                                (|HasCategory| (|Integer|)
                                                               '(|ConvertibleTo|
                                                                 (|Pattern|
                                                                  (|Integer|))))
                                                (|HasCategory| (|Integer|)
                                                               '(|LinearlyExplicitOver|
                                                                 (|Integer|))))
                                               (AND
                                                (|HasCategory| (|Integer|)
                                                               '(|ConvertibleTo|
                                                                 (|InputForm|)))
                                                (|HasCategory| (|Integer|)
                                                               '(|LinearlyExplicitOver|
                                                                 (|Integer|))))
                                               (AND
                                                (|HasCategory| (|Integer|)
                                                               '(|LinearlyExplicitOver|
                                                                 (|Integer|)))
                                                (|HasCategory| (|Integer|)
                                                               '(|PatternMatchable|
                                                                 (|Float|))))
                                               (AND
                                                (|HasCategory| (|Integer|)
                                                               '(|LinearlyExplicitOver|
                                                                 (|Integer|)))
                                                (|HasCategory| (|Integer|)
                                                               '(|PatternMatchable|
                                                                 (|Integer|))))
                                               (AND
                                                (|HasCategory| (|Integer|)
                                                               '(|LinearlyExplicitOver|
                                                                 (|Integer|)))
                                                (|HasCategory| (|Integer|)
                                                               '(|RetractableTo|
                                                                 (|Fraction|
                                                                  (|Integer|)))))
                                               (AND
                                                (|HasCategory| (|Integer|)
                                                               '(|LinearlyExplicitOver|
                                                                 (|Integer|)))
                                                #1#)
                                               (AND
                                                (|HasCategory| (|Integer|)
                                                               '(|LinearlyExplicitOver|
                                                                 (|Integer|)))
                                                (|HasCategory| (|Integer|)
                                                               '(|Group|)))
                                               (|HasCategory| (|Integer|)
                                                              '(|Ring|)))
                                              (|HasCategory| (|Integer|)
                                                             '(|AbelianSemiGroup|))
                                              (|HasCategory| (|Integer|)
                                                             '(|SemiGroup|))))))
          (|haddProp| |$ConstructorCache| '|JetBundleExpression| (LIST DV$1)
                      (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (AND (|HasCategory| $ '(|Ring|)) (|augmentPredVector| $ 65536))
          (AND (|HasCategory| $ '(|RetractableTo| (|Integer|)))
               (|augmentPredVector| $ 131072))
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 7 (|Expression| (|Integer|)))
          $))) 

(MAKEPROP '|JetBundleExpression| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|Expression| 24) (|local| |#1|) '|Rep|
              (0 . |coerce|) |JBE;coerce;JB$;1| |JBE;coerce;E$;2|
              |JBE;coerce;$E;3| (|SparseMultivariatePolynomial| 24 34)
              (5 . |One|) (|SparseMultivariatePolynomial| 24 28) (9 . /)
              |JBE;coerce;Smp$;4| (|SparseMultivariatePolynomial| 5 6)
              (15 . |Zero|) (19 . |numer|) (|List| $)
              (24 . |primitiveMonomials|) (|List| 24) (29 . |coefficients|)
              (|Integer|) (34 . |coerce|) (|List| 34) (39 . |variables|)
              (|Kernel| $) (44 . |coerce|) (|Union| 6 '#1="failed")
              (49 . |retractIfCan|) (54 . *) (|NonNegativeInteger|)
              (|Kernel| $$) (60 . |degree|) (66 . |One|) (70 . |One|)
              (74 . |One|) (|List| 6) (|List| 33) (78 . |monomial|) (85 . *)
              (91 . +) |JBE;numerJP;$Smp;5| (97 . |Zero|)
              (101 . |primitiveMonomials|) (|List| 5) (106 . |coefficients|)
              (111 . |variables|) (116 . |degree|) (122 . ^) (128 . *)
              (134 . +) |JBE;coerce;Smp$;6| (140 . |gcd|) |JBE;gcd;3$;7|
              (|Union| $ '"failed") (146 . |exquo|) |JBE;exquo;2$U;8| (152 . /)
              |JBE;recip;$U;9| (158 . |order|) (163 . |first|) (168 . |concat|)
              (|Boolean|) (174 . =) (180 . |member?|) (186 . |and|)
              (|Mapping| 65 65 65) (|List| 65) (192 . |reduce|) (|List| 26)
              (199 . |cons|) (|List| 12) (|Mapping| 12 $$) (|List| $$)
              (|FiniteLinearAggregateFunctions2| $$ 76 12 74) (205 . |map|)
              (211 . |leadingMonomial|) (216 . |sort!|) (221 . |first|)
              (226 . |merge|) (232 . |removeDuplicates!|) (237 . |dimJ|)
              (|SparseEchelonMatrix| 6 $) |JBE;dimension;LSem2Nni;12|
              (242 . |dimS|) |JBE;orderDim;LSem2Nni;13| (247 . |ground?|)
              (|Union| 34 '"failed") (252 . |mainVariable|)
              (|SparseUnivariatePolynomial| $) (257 . |univariate|)
              (|SparseUnivariatePolynomial| 12) (263 . |monomial?|)
              (268 . |leadingCoefficient|) (273 . |monomial|)
              (280 . |minimumDegree|) (285 . |Zero|) (289 . |monomial|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (295 . |monicDivide|) (301 . |multivariate|) (307 . |zero?|)
              |JBE;simpOne;2$;15| (312 . =) (318 . >) (|String|) (|OutputForm|)
              (324 . |message|) (329 . |coerce|) (334 . |assign|) (|Void|)
              (340 . |print|) (|GroebnerPackage| 24 (|IndexedExponents| 34) 12)
              (345 . |groebner|) (|Mapping| $$ 12)
              (|FiniteLinearAggregateFunctions2| 12 74 $$ 76) (350 . |map|)
              (356 . |coerce|) (361 . |setUnion|) (|Mapping| 40 40 40)
              (|List| 40) (367 . |reduce|) (|List| 39) (374 . |jacobiMatrix|)
              (|Record| (|:| |Indices| 39) (|:| |Entries| 76))
              (|SparseEchelonMatrix| 6 $$) (380 . |row|)
              (|Record| (|:| |Fun| $$) (|:| JMR 127) (|:| |Depend| 40))
              (|List| 130) (386 . |first|) |JBE;solveFor;$JBU;26|
              (391 . |cons|) (397 . |concat!|) |JBE;subst;$JB2$;25|
              (403 . |append|) (409 . |removeDuplicates!|)
              (|Mapping| 65 130 130) (414 . |sort!|) (420 . |merge|)
              (427 . |allIndices|) (432 . =) (|Symbol|) (438 . |type|)
              (443 . |empty|) (447 . |new|) (|PositiveInteger|) (453 . U)
              (458 . <) (464 . |cons|) (470 . |setRow!|) (477 . |reverse!|)
              (|Union| '"failed" 123)
              (|Record| (|:| |Sys| 20) (|:| JM 85) (|:| |Depend| 154))
              |JBE;simplify;LSemR;21| (|List| 28) (482 . |tower|)
              (|BasicOperator|) (487 . |operator|) (492 . |has?|)
              (|Union| 204 '"failed") (498 . |property|) (504 . |argument|)
              (509 . |second|) (514 . |retract|) (519 . X) (524 . |rest|)
              (529 . P) (535 . |removeDuplicates!|) (|Mapping| 65 6 6)
              (540 . |sort|) |JBE;jetVariables;$L;22| (546 . |name|)
              |JBE;differentiate;$S$;24| |JBE;differentiate;$JB$;23|
              (551 . |differentiate|) (557 . =) (|Equation| $$) (563 . =)
              (|Equation| $) (569 . |eval|) (575 . |retract|) (580 . |coerce|)
              (585 . |monicDivide|) (592 . |append|) (598 . |zero?|) (603 . -)
              (608 . |kernel|) (614 . |coerce|) (619 . |first|)
              (624 . |retract|) (629 . |coerce|) (|List| 109) (634 . |concat!|)
              (640 . |empty?|) (645 . |coerce|) (650 . |commaSeparate|)
              (655 . |sub|) (661 . |prefix|) (667 . |copy|) (672 . |first|)
              (678 . |operator|) (|None|) (683 . |setProperty|) (690 . |merge|)
              (696 . |coerce|) (701 . |append|) (707 . |#|)
              |JBE;function;SLNni$;31| (|Union| 212 '#1#) (|Fraction| 24)
              (|Union| 20 '#2="failed")
              (|Record| (|:| |coef| 24) (|:| |var| 28)) (|Union| 214 '#2#)
              (|List| 159) (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 24)
              (|Factored| $) (|Polynomial| 212) (|Fraction| 221)
              (|Fraction| 92) (|Union| 225 '#1#) (|Fraction| 243)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 24 $)
              (|AlgebraicNumber|) (|Union| 228 '#1#) (|Matrix| 24) (|Matrix| $)
              (|Record| (|:| |mat| 230) (|:| |vec| (|Vector| 24))) (|Vector| $)
              (|Record| (|:| |var| 28) (|:| |exponent| 24)) (|Union| 234 '#2#)
              (|List| 144) (|Mapping| $ $) (|List| 237)
              (|Record| (|:| |val| $) (|:| |exponent| 24)) (|Union| 239 '#2#)
              (|Mapping| $ 20) (|List| 241) (|Polynomial| 24)
              (|Union| 243 '#1#) (|SegmentBinding| $)
              (|Record| (|:| |coef| 20) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 248 '"failed") (|Polynomial| $) (|Union| 28 '#1#)
              (|List| 181) (|Union| 144 '#1#) (|Union| 24 '#1#)
              (|Record| (|:| |DSys| 20) (|:| |JVars| 125))
              (|Record| (|:| |DPhi| $) (|:| |JVars| 39))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|SingleInteger|) (|HashState|))
           '#(~= 712 |zerosOf| 718 |zeroOf| 745 |zero?| 772 |whittakerW| 777
              |whittakerM| 784 |weierstrassZeta| 791 |weierstrassSigma| 798
              |weierstrassPPrime| 805 |weierstrassPInverse| 812 |weierstrassP|
              819 |weberE| 826 |variables| 832 |univariate| 842 |unitNormal|
              848 |unitCanonical| 853 |unit?| 858 |tower| 863 |tanh| 873 |tan|
              878 |symbol| 883 |summation| 888 |subtractIfCan| 900 |subst| 906
              |struveL| 932 |struveH| 938 |squareFreePart| 944 |squareFree| 949
              |sqrt| 954 |sortLD| 959 |solveFor| 964 |smaller?| 970 |sizeLess?|
              976 |sinh| 982 |sin| 987 |simplify| 992 |simpOne| 998 |simpMod|
              1003 |setNotation| 1016 |sech| 1021 |sec| 1026 |sample| 1031
              |rootsOf| 1035 |rootSum| 1062 |rootOf| 1069 |rightRecip| 1096
              |rightPower| 1101 |riemannZeta| 1113 |retractIfCan| 1118
              |retract| 1158 |rem| 1198 |reducedSystem| 1204 |reduceMod| 1215
              |reduce| 1221 |recip| 1226 |quo| 1231 |product| 1237
              |principalIdeal| 1249 |prime?| 1254 |polylog| 1259 |polygamma|
              1265 |pi| 1271 |permutation| 1275 |patternMatch| 1281 |paren|
              1295 |orderDim| 1300 |order| 1307 |opposite?| 1312 |operators|
              1318 |operator| 1323 |one?| 1328 |odd?| 1333 |numerator| 1338
              |numerJP| 1343 |numer| 1348 |numIndVar| 1353 |numDepVar| 1357
              |nthRoot| 1361 |multiEuclidean| 1367 |minPoly| 1373 |meixnerM|
              1378 |meijerG| 1386 |map| 1395 |mainKernel| 1401 |lommelS2| 1406
              |lommelS1| 1413 |log| 1420 |li| 1425 |lerchPhi| 1430 |legendreQ|
              1437 |legendreP| 1444 |leftRecip| 1451 |leftPower| 1456
              |leadingDer| 1468 |lcmCoef| 1473 |lcm| 1479 |latex| 1490
              |lambertW| 1495 |laguerreL| 1500 |kummerU| 1507 |kummerM| 1514
              |kernels| 1521 |kernel| 1531 |kelvinKer| 1543 |kelvinKei| 1549
              |kelvinBer| 1555 |kelvinBei| 1561 |jetVariables| 1567
              |jacobiZeta| 1572 |jacobiTheta| 1578 |jacobiSn| 1584 |jacobiP|
              1590 |jacobiMatrix| 1598 |jacobiDn| 1609 |jacobiCn| 1615
              |isTimes| 1621 |isPower| 1626 |isPlus| 1631 |isMult| 1636
              |isExpt| 1641 |is?| 1658 |inv| 1670 |integral| 1675
              |hypergeometricF| 1687 |hermiteH| 1694 |height| 1700
              |hashUpdate!| 1705 |hash| 1711 |hankelH2| 1716 |hankelH1| 1722
              |ground?| 1728 |ground| 1733 |getNotation| 1738 |gcdPolynomial|
              1742 |gcd| 1748 |function| 1759 |fresnelS| 1766 |fresnelC| 1771
              |freeOf?| 1776 |formalDiff2| 1794 |formalDiff| 1808 |factorials|
              1826 |factorial| 1837 |factor| 1842 |extractSymbol| 1847
              |extendedEuclidean| 1852 |exquo| 1865 |expressIdealMember| 1871
              |exp| 1877 |even?| 1882 |eval| 1887 |euclideanSize| 2031 |erfi|
              2036 |erf| 2041 |elt| 2046 |ellipticPi| 2142 |ellipticK| 2149
              |ellipticF| 2154 |ellipticE| 2160 |divide| 2171 |distribute| 2177
              |dimension| 2188 |dilog| 2195 |digamma| 2200 |differentiate| 2205
              |denominator| 2237 |denom| 2242 |definingPolynomial| 2247
              |dSubst| 2252 |csch| 2259 |csc| 2264 |coth| 2269 |cot| 2274
              |cosh| 2279 |cos| 2284 |convert| 2289 |const?| 2309 |conjugate|
              2314 |commutator| 2325 |coerce| 2331 |class| 2411 |charthRoot|
              2416 |charlierC| 2421 |characteristic| 2428 |box| 2432 |binomial|
              2437 |besselY| 2443 |besselK| 2449 |besselJ| 2455 |besselI| 2461
              |belong?| 2467 |autoReduce| 2472 |atanh| 2477 |atan| 2482
              |associator| 2487 |associates?| 2494 |asinh| 2500 |asin| 2505
              |asech| 2510 |asec| 2515 |applyQuote| 2520 |antiCommutator| 2556
              |annihilate?| 2562 |angerJ| 2568 |algtower| 2574 |airyBiPrime|
              2584 |airyBi| 2589 |airyAiPrime| 2594 |airyAi| 2599 |acsch| 2604
              |acsc| 2609 |acoth| 2614 |acot| 2619 |acosh| 2624 |acos| 2629
              |abs| 2634 ^ 2639 |Zero| 2669 X 2673 U 2682 |Si| 2691 |Shi| 2696
              P 2701 |One| 2723 |Gamma| 2727 |Ei| 2738 D 2743 |Ci| 2769 |Chi|
              2774 |Beta| 2779 = 2785 / 2791 - 2803 + 2814 * 2820)
           'NIL
           (CONS
            (|makeByteWordVec2| 14
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 5 0 0 0 0 2 3 4 14
                                  0 0 0 0 0 0 2 0 0 0 2 0 0 0 0 0 2 2 0 6 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 10 11 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 13 1
                                  5 7 8 9 12))
            (CONS
             '#(|AlgebraicallyClosedFunctionSpace&| |AlgebraicallyClosedField&|
                |FunctionSpace&| |Field&| |EuclideanDomain&|
                |JetBundleFunctionCategory&| NIL |UniqueFactorizationDomain&|
                |GcdDomain&| NIL |DivisionRing&| NIL NIL
                |FullyLinearlyExplicitOver&| |PartialDifferentialRing&|
                |Algebra&| |EntireRing&| |Algebra&| |Algebra&| NIL NIL NIL NIL
                |Rng&| NIL |Module&| |Module&| NIL |Module&| NIL NIL
                |NonAssociativeRing&| NIL NIL NIL NIL |NonAssociativeRng&| NIL
                NIL NIL |AbelianGroup&| |Group&| NIL NIL NIL NIL
                |ExpressionSpace&| NIL |MagmaWithUnit&|
                |NonAssociativeSemiRng&| |AbelianMonoid&| NIL NIL |Magma&|
                |AbelianSemiGroup&| NIL NIL NIL
                |TranscendentalFunctionCategory&| |FullyRetractableTo&| NIL
                |Evalable&| NIL |SetCategory&| NIL NIL NIL
                |ElementaryFunctionCategory&| NIL |HyperbolicFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |TrigonometricFunctionCategory&| |RadicalCategory&|
                |RetractableTo&| NIL |RetractableTo&| NIL NIL |InnerEvalable&|
                |InnerEvalable&| |RetractableTo&| |RetractableTo&| NIL NIL NIL
                |BasicType&| NIL |RetractableTo&| |RetractableTo&|
                |RetractableTo&| NIL NIL NIL |RetractableTo&|)
             (CONS
              '#((|AlgebraicallyClosedFunctionSpace| 24)
                 (|AlgebraicallyClosedField|) (|FunctionSpace| 24) (|Field|)
                 (|EuclideanDomain|) (|JetBundleFunctionCategory| 6)
                 (|PrincipalIdealDomain|) (|UniqueFactorizationDomain|)
                 (|GcdDomain|) (|IntegralDomain|) (|DivisionRing|)
                 (|CommutativeRing|) (|LeftOreRing|)
                 (|FullyLinearlyExplicitOver| 24)
                 (|PartialDifferentialRing| 144) (|Algebra| 212) (|EntireRing|)
                 (|Algebra| $$) (|Algebra| 24) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|LinearlyExplicitOver| 24) (|Ring|)
                 (|Rng|) (|SemiRing|) (|Module| 212) (|Module| $$) (|SemiRng|)
                 (|Module| 24) (|BiModule| 212 212) (|BiModule| $$ $$)
                 (|NonAssociativeRing|) (|BiModule| 24 24) (|RightModule| 212)
                 (|LeftModule| 212) (|LeftModule| $$) (|NonAssociativeRng|)
                 (|RightModule| $$) (|LeftModule| 24) (|RightModule| 24)
                 (|AbelianGroup|) (|Group|) (|Monoid|)
                 (|NonAssociativeSemiRing|) (|CancellationAbelianMonoid|)
                 (|FullyPatternMatchable| 24) (|ExpressionSpace|) (|SemiGroup|)
                 (|MagmaWithUnit|) (|NonAssociativeSemiRng|) (|AbelianMonoid|)
                 (|LiouvillianFunctionCategory|) (|Comparable|) (|Magma|)
                 (|AbelianSemiGroup|) (|PatternMatchable| (|Float|))
                 (|PatternMatchable| 24) (|CombinatorialOpsCategory|)
                 (|TranscendentalFunctionCategory|) (|FullyRetractableTo| 24)
                 (|Patternable| 24) (|Evalable| $$) (|CommutativeStar|)
                 (|SetCategory|) (|SpecialFunctionCategory|)
                 (|PrimitiveFunctionCategory|)
                 (|CombinatorialFunctionCategory|)
                 (|ElementaryFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|TrigonometricFunctionCategory|) (|RadicalCategory|)
                 (|RetractableTo| 24) (|Type|) (|RetractableTo| 144)
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|InnerEvalable| $$ $$) (|InnerEvalable| 34 $$)
                 (|RetractableTo| 34) (|RetractableTo| 6) (|noZeroDivisors|)
                 (|TwoSidedRecip|) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 109) (|RetractableTo| 212)
                 (|RetractableTo| 225) (|RetractableTo| 243)
                 (|ConvertibleTo| 217) (|ConvertibleTo| 218)
                 (|ConvertibleTo| 219) (|RetractableTo| 228))
              (|makeByteWordVec2| 260
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
                                    142 2 0 65 0 0 143 1 6 144 0 145 0 76 0 146
                                    2 128 0 39 24 147 1 6 0 148 149 2 6 65 0 0
                                    150 2 76 0 2 0 151 3 128 113 0 24 127 152 1
                                    76 0 0 153 1 0 157 0 158 1 34 159 0 160 2
                                    159 65 0 144 161 2 159 162 0 144 163 1 34
                                    76 0 164 1 76 2 0 165 1 0 24 0 166 1 6 0
                                    148 167 1 76 0 0 168 2 6 0 148 40 169 1 39
                                    0 0 170 2 39 0 171 0 172 1 6 144 0 174 2 7
                                    0 0 144 177 2 7 65 0 0 178 2 179 0 2 2 180
                                    2 0 0 0 181 182 1 0 28 0 183 1 12 0 34 184
                                    3 12 101 0 0 34 185 2 26 0 0 0 186 1 12 65
                                    0 187 1 0 0 0 188 2 5 0 159 20 189 1 5 0
                                    144 190 1 76 2 0 191 1 0 144 0 192 1 0 109
                                    0 193 2 194 0 0 0 195 1 76 65 0 196 1 144
                                    109 0 197 1 109 0 20 198 2 109 0 0 0 199 2
                                    109 0 0 20 200 1 76 0 0 201 2 76 0 0 33 202
                                    1 159 0 144 203 3 159 0 0 144 204 205 2 22
                                    0 0 0 206 1 0 0 24 207 2 76 0 0 0 208 1 76
                                    33 0 209 2 0 65 0 0 1 1 0 20 92 1 1 0 20
                                    250 1 2 0 20 92 144 1 1 0 20 0 1 2 0 20 0
                                    144 1 1 0 0 92 1 1 0 0 250 1 2 0 0 92 144 1
                                    1 0 0 0 1 2 0 0 0 144 1 1 0 65 0 104 3 0 0
                                    0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0
                                    0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0
                                    0 1 2 0 0 0 0 1 1 0 236 0 1 1 0 236 20 1 2
                                    1 223 0 28 1 1 0 257 0 1 1 0 0 0 1 1 0 65 0
                                    1 1 0 157 0 158 1 0 157 20 1 1 0 0 0 1 1 0
                                    0 0 1 1 0 85 20 1 2 0 0 0 144 1 2 0 0 0 245
                                    1 2 0 57 0 0 1 2 0 0 0 181 1 3 0 0 0 157 20
                                    1 2 0 0 0 252 1 3 0 0 0 6 0 136 2 0 0 0 0 1
                                    2 0 0 0 0 1 1 0 0 0 1 1 0 220 0 1 1 0 0 0 1
                                    1 0 20 20 1 2 0 57 0 6 133 2 0 65 0 0 1 2 0
                                    65 0 0 1 1 0 0 0 1 1 0 0 0 1 2 0 155 20 85
                                    156 1 0 0 0 105 2 0 20 20 20 1 3 0 155 20
                                    85 20 1 1 0 113 144 1 1 0 0 0 1 1 0 0 0 1 0
                                    0 0 1 1 0 20 92 1 1 0 20 250 1 2 0 20 92
                                    144 1 1 0 20 0 1 2 0 20 0 144 1 3 0 0 0 92
                                    144 1 1 0 0 92 1 1 0 0 250 1 2 0 0 92 144 1
                                    1 0 0 0 1 2 0 0 0 144 1 1 0 57 0 1 2 0 0 0
                                    33 1 2 0 0 0 148 1 1 0 0 0 1 1 13 211 0 1 1
                                    1 224 0 1 1 12 229 0 1 1 5 244 0 1 1 0 251
                                    0 1 1 0 253 0 1 1 0 254 0 1 1 0 30 0 31 1
                                    13 212 0 1 1 1 225 0 1 1 12 228 0 1 1 5 243
                                    0 1 1 0 28 0 183 1 0 144 0 192 1 0 24 0 166
                                    1 0 6 0 1 2 0 0 0 0 1 1 5 230 231 1 2 5 232
                                    231 233 1 2 0 20 20 20 1 1 0 0 0 1 1 0 57 0
                                    61 2 0 0 0 0 1 2 0 0 0 144 1 2 0 0 0 245 1
                                    1 0 246 20 1 1 0 65 0 1 2 0 0 0 0 1 2 0 0 0
                                    0 1 0 0 0 1 2 0 0 0 0 1 3 10 226 0 218 226
                                    1 3 11 227 0 219 227 1 1 0 0 0 1 3 0 33 20
                                    85 33 88 1 0 33 0 62 2 0 65 0 0 1 1 0 216 0
                                    1 1 0 159 159 1 1 0 65 0 1 1 18 65 0 1 1 0
                                    0 0 1 1 0 17 0 44 1 5 14 0 19 0 0 148 1 0 0
                                    148 1 2 0 0 0 24 1 2 0 213 20 0 1 1 17 92
                                    28 1 4 0 0 0 0 0 0 1 5 18 0 20 20 20 20 0 1
                                    2 0 0 237 28 1 1 0 251 0 1 3 0 0 0 0 0 1 3
                                    0 0 0 0 0 1 1 0 0 0 1 1 0 0 0 1 3 0 0 0 0 0
                                    1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 1 0 57 0 1 2
                                    0 0 0 33 1 2 0 0 0 148 1 1 0 6 0 1 2 0 258
                                    0 0 1 2 0 0 0 0 1 1 0 0 20 1 1 0 108 0 1 1
                                    0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0
                                    0 0 1 1 0 157 0 1 1 0 157 20 1 2 0 0 159 0
                                    1 2 0 0 159 20 1 2 0 0 0 0 1 2 0 0 0 0 1 2
                                    0 0 0 0 1 2 0 0 0 0 1 1 0 39 0 173 2 0 0 0
                                    0 1 2 0 0 0 0 1 2 0 0 0 0 1 4 0 0 0 0 0 0 1
                                    1 0 85 20 1 2 0 85 20 125 126 2 0 0 0 0 1 2
                                    0 0 0 0 1 1 16 213 0 1 1 5 240 0 1 1 15 213
                                    0 1 1 15 215 0 1 2 5 235 0 159 1 2 5 235 0
                                    144 1 1 16 235 0 1 2 0 65 0 144 1 2 0 65 0
                                    159 1 1 0 0 0 1 2 0 0 0 245 1 2 0 0 0 144 1
                                    3 18 0 20 20 0 1 2 0 0 0 0 1 1 0 33 0 1 2 0
                                    260 260 0 1 1 0 259 0 1 2 0 0 0 0 1 2 0 0 0
                                    0 1 1 0 65 0 1 1 0 24 0 1 0 0 144 1 2 0 92
                                    92 92 1 2 0 0 0 0 56 1 0 0 20 1 3 0 0 144
                                    20 33 210 1 0 0 0 1 1 0 0 0 1 2 0 65 0 0 1
                                    2 0 65 0 144 1 2 0 65 0 6 1 3 0 255 20 148
                                    85 1 3 0 256 0 148 85 1 2 0 0 0 40 1 2 0 20
                                    20 148 1 2 0 0 0 148 1 2 0 0 0 144 1 1 0 0
                                    0 1 1 0 0 0 1 1 0 220 0 1 1 0 85 85 1 2 0
                                    247 0 0 1 3 0 249 0 0 0 1 2 0 57 0 0 59 2 0
                                    213 20 0 1 1 0 0 0 1 1 18 65 0 1 4 7 0 0
                                    216 20 144 1 4 7 0 0 159 0 144 1 4 5 0 0
                                    236 40 238 1 4 5 0 0 236 40 242 1 4 5 0 0
                                    144 33 237 1 4 5 0 0 144 33 241 1 3 0 0 0
                                    157 20 1 3 0 0 0 28 0 1 2 0 0 0 252 1 3 0 0
                                    0 0 0 1 2 0 0 0 181 182 3 0 0 0 20 20 1 3 0
                                    0 0 236 238 1 3 0 0 0 144 241 1 3 0 0 0 236
                                    242 1 3 0 0 0 144 237 1 3 0 0 0 216 242 1 3
                                    0 0 0 216 238 1 3 0 0 0 159 241 1 3 0 0 0
                                    159 237 1 1 0 33 0 1 1 0 0 0 1 1 0 0 0 1 3
                                    0 0 159 0 0 1 2 0 0 159 0 1 4 0 0 159 0 0 0
                                    1 6 0 0 159 0 0 0 0 0 1 5 0 0 159 0 0 0 0 1
                                    7 0 0 159 0 0 0 0 0 0 1 9 0 0 159 0 0 0 0 0
                                    0 0 0 1 8 0 0 159 0 0 0 0 0 0 0 1 10 0 0
                                    159 0 0 0 0 0 0 0 0 0 1 2 0 0 159 20 1 3 0
                                    0 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1 1 0 0 0 1 2
                                    0 0 0 0 1 2 0 101 0 0 1 1 0 0 0 1 2 0 0 0 0
                                    1 3 0 33 20 85 33 86 1 0 0 0 1 1 0 0 0 1 2
                                    0 0 0 6 176 3 0 0 0 236 40 1 2 0 0 0 236 1
                                    3 0 0 0 144 33 1 2 0 0 0 144 175 1 0 0 0 1
                                    1 1 14 0 1 1 17 0 0 1 3 0 0 0 6 0 1 1 0 0 0
                                    1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1
                                    0 0 0 1 1 7 217 0 1 1 8 218 0 1 1 9 219 0 1
                                    1 1 0 220 1 1 0 65 0 1 2 6 0 0 0 1 1 0 0 0
                                    1 2 0 0 0 0 1 1 1 0 221 1 1 1 0 222 1 1 1 0
                                    225 1 1 12 0 228 1 1 5 0 243 1 1 0 0 14 16
                                    1 0 0 17 54 1 0 5 0 11 1 0 0 5 10 1 0 0 212
                                    1 1 0 0 28 29 1 0 0 144 1 1 0 0 6 9 1 0 0 0
                                    1 1 0 0 24 207 1 0 109 0 193 1 0 33 0 1 1 3
                                    57 0 1 3 0 0 0 0 0 1 0 0 33 1 1 0 0 0 1 2 0
                                    0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1
                                    2 0 0 0 0 1 1 0 65 159 1 1 0 20 20 1 1 0 0
                                    0 1 1 0 0 0 1 3 0 0 0 0 0 1 2 0 65 0 0 1 1
                                    0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 2 0 0
                                    144 0 1 3 0 0 144 0 0 1 5 0 0 144 0 0 0 0 1
                                    4 0 0 144 0 0 0 1 2 0 0 144 20 1 2 0 0 0 0
                                    1 2 0 65 0 0 1 2 0 0 0 0 1 1 1 157 0 1 1 1
                                    157 20 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0
                                    0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0
                                    1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 2 0 0 0 0 1
                                    2 0 0 0 24 1 2 0 0 0 212 1 2 0 0 0 33 51 2
                                    0 0 0 148 1 0 0 0 45 0 0 0 1 1 0 0 148 1 0
                                    0 0 1 1 0 0 148 1 1 0 0 0 1 1 0 0 0 1 1 0 0
                                    33 1 2 0 0 148 33 1 1 0 0 40 1 2 0 0 148 40
                                    1 0 0 0 36 2 0 0 0 0 1 1 0 0 0 1 1 0 0 0 1
                                    3 0 0 0 236 40 1 3 0 0 0 144 33 1 2 0 0 0
                                    144 1 2 0 0 0 236 1 1 0 0 0 1 1 0 0 0 1 2 0
                                    0 0 0 1 2 0 65 0 0 143 2 1 0 14 14 15 2 0 0
                                    0 0 60 1 0 0 0 188 2 0 0 0 0 1 2 0 0 0 0 53
                                    2 2 0 0 24 1 2 0 0 0 212 1 2 0 0 212 0 1 2
                                    0 0 33 0 1 2 0 0 24 0 1 2 0 0 0 0 52 2 0 0
                                    148 0 1)))))
           '|lookupComplete|)) 
