
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
          (|vs| ($)) (#1=#:G751 NIL) (|v| NIL) (#2=#:G749 NIL) (|mon| NIL)
          (#3=#:G750 NIL) (|co| NIL) (CO (|List| (|Integer|)))
          (PM
           (|List| (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| $))))
          (|p| (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| $))))
         (SEQ (LETT |res| (|spadConstant| $ 18) . #4=(|JBE;numerJP;$Smp;5|))
              (LETT |p| (SPADCALL |f| (QREFELT $ 19)) . #4#)
              (LETT PM (SPADCALL |p| (QREFELT $ 21)) . #4#)
              (LETT CO (SPADCALL |p| (QREFELT $ 23)) . #4#)
              (SEQ (LETT |co| NIL . #4#) (LETT #3# CO . #4#)
                   (LETT |mon| NIL . #4#) (LETT #2# PM . #4#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |mon| (CAR #2#) . #4#) NIL)
                         (ATOM #3#) (PROGN (LETT |co| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ (LETT JV NIL . #4#) (LETT |Exp| NIL . #4#)
                        (LETT |newco| (SPADCALL |co| (QREFELT $ 25)) . #4#)
                        (SEQ (LETT |v| NIL . #4#)
                             (LETT #1# (SPADCALL |mon| (QREFELT $ 27)) . #4#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |v| (CAR #1#) . #4#) NIL))
                               (GO G191)))
                             (SEQ
                              (LETT |vs| (SPADCALL |v| (QREFELT $ 29)) . #4#)
                              (LETT |jv| (SPADCALL |vs| (QREFELT $ 31)) . #4#)
                              (EXIT
                               (COND
                                ((QEQCAR |jv| 1)
                                 (LETT |newco|
                                       (SPADCALL |newco|
                                                 (SPADCALL |vs| (QREFELT $ 11))
                                                 (QREFELT $ 32))
                                       . #4#))
                                ('T
                                 (SEQ (LETT JV (CONS (QCDR |jv|) JV) . #4#)
                                      (EXIT
                                       (LETT |Exp|
                                             (CONS
                                              (SPADCALL |mon| |v|
                                                        (QREFELT $ 35))
                                              |Exp|)
                                             . #4#)))))))
                             (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                             (EXIT NIL))
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
                                         (QREFELT $ 43))
                               . #4#)))
                   (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #4#))
                         . #4#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT |res|)))) 

(SDEFUN |JBE;coerce;Smp$;6|
        ((|p| |SparseMultivariatePolynomial| (|Expression| (|Integer|)) JB)
         ($ $))
        (SPROG
         ((|res| ($)) (|prod| ($)) (#1=#:G759 NIL) (|v| NIL) (#2=#:G757 NIL)
          (|mon| NIL) (#3=#:G758 NIL) (|co| NIL)
          (CO (|List| (|Expression| (|Integer|))))
          (PM
           (|List|
            (|SparseMultivariatePolynomial| (|Expression| (|Integer|)) JB))))
         (SEQ (LETT |res| (|spadConstant| $ 45) . #4=(|JBE;coerce;Smp$;6|))
              (LETT PM (SPADCALL |p| (QREFELT $ 46)) . #4#)
              (LETT CO (SPADCALL |p| (QREFELT $ 48)) . #4#)
              (SEQ (LETT |co| NIL . #4#) (LETT #3# CO . #4#)
                   (LETT |mon| NIL . #4#) (LETT #2# PM . #4#) G190
                   (COND
                    ((OR (ATOM #2#) (PROGN (LETT |mon| (CAR #2#) . #4#) NIL)
                         (ATOM #3#) (PROGN (LETT |co| (CAR #3#) . #4#) NIL))
                     (GO G191)))
                   (SEQ (LETT |prod| |co| . #4#)
                        (SEQ (LETT |v| NIL . #4#)
                             (LETT #1# (SPADCALL |mon| (QREFELT $ 49)) . #4#)
                             G190
                             (COND
                              ((OR (ATOM #1#)
                                   (PROGN (LETT |v| (CAR #1#) . #4#) NIL))
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
                                               (QREFELT $ 52))
                                     . #4#)))
                             (LETT #1# (CDR #1#) . #4#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (LETT |res| (SPADCALL |res| |prod| (QREFELT $ 53))
                               . #4#)))
                   (LETT #2# (PROG1 (CDR #2#) (LETT #3# (CDR #3#) . #4#))
                         . #4#)
                   (GO G190) G191 (EXIT NIL))
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
                          (SPADCALL |f2| (QREFELT $ 19)) (QREFELT $ 58))
                |JBE;exquo;2$U;8|)
          (EXIT
           (COND ((QEQCAR |p| 1) (CONS 1 "failed"))
                 ('T (CONS 0 (SPADCALL (QCDR |p|) (QREFELT $ 16))))))))) 

(SDEFUN |JBE;recip;$U;9| ((|f| $) ($ |Union| $ "failed"))
        (CONS 0 (SPADCALL (|spadConstant| $ 36) |f| (QREFELT $ 60)))) 

(SDEFUN |JBE;purge|
        ((|l| |List| (|Kernel| $)) (|q| |NonNegativeInteger|)
         ($ |List| (|Kernel| $)))
        (SPROG ((#1=#:G776 NIL) (|k| NIL) (#2=#:G775 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|JBE;purge|))
                 (SEQ (LETT |k| NIL . #3#) (LETT #1# |l| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |k| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (COND
                         ((EQL
                           (SPADCALL (SPADCALL |k| (QREFELT $ 29))
                                     (QREFELT $ 62))
                           |q|)
                          (LETT #2# (CONS |k| #2#) . #3#)))))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |JBE;dimrec|
        ((|lmv| |List| (|List| (|Kernel| $))) (|indVars| |List| (|Kernel| $))
         (|remVars| . #1=(|List| (|Kernel| $)))
         (|sets| . #2=(|List| (|List| (|Kernel| $))))
         ($ |List| (|List| (|Kernel| $))))
        (SPROG
         ((|res| #2#) (|elem| (|Boolean|)) (#3=#:G803 NIL) (|ik| NIL)
          (#4=#:G802 NIL) (#5=#:G800 NIL) (|m| NIL) (#6=#:G801 NIL)
          (#7=#:G798 NIL) (|lv| NIL) (#8=#:G799 NIL)
          (|indK| (|List| (|Kernel| $))) (|newVars| #1#) (|jk| (|Kernel| $)))
         (SEQ (LETT |res| |sets| . #9=(|JBE;dimrec|))
              (LETT |newVars| |remVars| . #9#)
              (SEQ G190 (COND ((NULL (NULL (NULL |newVars|))) (GO G191)))
                   (SEQ (LETT |jk| (SPADCALL |newVars| (QREFELT $ 63)) . #9#)
                        (LETT |newVars| (CDR |newVars|) . #9#)
                        (LETT |elem| NIL . #9#)
                        (LETT |indK| (SPADCALL |indVars| |jk| (QREFELT $ 64))
                              . #9#)
                        (SEQ (LETT #8# NIL . #9#) (LETT |lv| NIL . #9#)
                             (LETT #7# |lmv| . #9#) G190
                             (COND
                              ((OR (ATOM #7#)
                                   (PROGN (LETT |lv| (CAR #7#) . #9#) NIL) #8#)
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT |elem|
                                     (SPADCALL |lv| |indK| (QREFELT $ 66))
                                     . #9#)))
                             (LETT #7#
                                   (PROG1 (CDR #7#) (LETT #8# |elem| . #9#))
                                   . #9#)
                             (GO G190) G191 (EXIT NIL))
                        (EXIT
                         (COND
                          ((NULL |elem|)
                           (LETT |res|
                                 (|JBE;dimrec| |lmv| |indK| |newVars| |res| $)
                                 . #9#)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |elem| NIL . #9#)
              (SEQ (LETT #6# NIL . #9#) (LETT |m| NIL . #9#)
                   (LETT #5# |res| . #9#) G190
                   (COND
                    ((OR (ATOM #5#) (PROGN (LETT |m| (CAR #5#) . #9#) NIL) #6#)
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (LETT |elem|
                           (SPADCALL (ELT $ 68)
                                     (PROGN
                                      (LETT #4# NIL . #9#)
                                      (SEQ (LETT |ik| NIL . #9#)
                                           (LETT #3# |indVars| . #9#) G190
                                           (COND
                                            ((OR (ATOM #3#)
                                                 (PROGN
                                                  (LETT |ik| (CAR #3#) . #9#)
                                                  NIL))
                                             (GO G191)))
                                           (SEQ
                                            (EXIT
                                             (LETT #4#
                                                   (CONS
                                                    (SPADCALL |ik| |m|
                                                              (QREFELT $ 67))
                                                    #4#)
                                                   . #9#)))
                                           (LETT #3# (CDR #3#) . #9#) (GO G190)
                                           G191 (EXIT (NREVERSE #4#))))
                                     'T (QREFELT $ 71))
                           . #9#)))
                   (LETT #5# (PROG1 (CDR #5#) (LETT #6# |elem| . #9#)) . #9#)
                   (GO G190) G191 (EXIT NIL))
              (COND
               ((NULL |elem|)
                (LETT |res| (SPADCALL |indVars| |res| (QREFELT $ 73)) . #9#)))
              (EXIT |res|)))) 

(SDEFUN |JBE;dimension;LSem2Nni;12|
        ((|sys| |List| $) (|jm| |SparseEchelonMatrix| JB $)
         (|q| |NonNegativeInteger|) ($ |NonNegativeInteger|))
        (SPROG
         ((|dim| (|NonNegativeInteger|)) (#1=#:G814 NIL) (|ind| NIL)
          (|indSets| (|List| (|List| (|Kernel| $))))
          (|dim0| (|NonNegativeInteger|)) (#2=#:G807 NIL)
          (|allvars| (|List| (|Kernel| $))) (#3=#:G813 NIL) (|lv| NIL)
          (|lmv| (|List| (|List| (|Kernel| $)))) (#4=#:G812 NIL) (|p| NIL)
          (#5=#:G811 NIL)
          (|polys|
           (|List| (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| $)))))
         (SEQ
          (LETT |polys| (SPADCALL (ELT $ 19) |sys| (QREFELT $ 78))
                . #6=(|JBE;dimension;LSem2Nni;12|))
          (LETT |lmv|
                (PROGN
                 (LETT #5# NIL . #6#)
                 (SEQ (LETT |p| NIL . #6#) (LETT #4# |polys| . #6#) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |p| (CAR #4#) . #6#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #5#
                              (CONS
                               (SPADCALL
                                (SPADCALL (SPADCALL |p| (QREFELT $ 79))
                                          (QREFELT $ 27))
                                (QREFELT $ 80))
                               #5#)
                              . #6#)))
                      (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                      (EXIT (NREVERSE #5#))))
                . #6#)
          (LETT |allvars| (SPADCALL |lmv| (QREFELT $ 81)) . #6#)
          (SEQ (LETT |lv| NIL . #6#) (LETT #3# (CDR |lmv|) . #6#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |lv| (CAR #3#) . #6#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |allvars|
                       (SPADCALL (SPADCALL |lv| |allvars| (QREFELT $ 82))
                                 (QREFELT $ 83))
                       . #6#)))
               (LETT #3# (CDR #3#) . #6#) (GO G190) G191 (EXIT NIL))
          (LETT |dim0|
                (PROG1
                    (LETT #2#
                          (- (SPADCALL |q| (QREFELT $ 84)) (LENGTH |allvars|))
                          . #6#)
                  (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #2#))
                . #6#)
          (LETT |indSets| (|JBE;dimrec| |lmv| NIL |allvars| NIL $) . #6#)
          (LETT |dim| 0 . #6#)
          (SEQ (LETT |ind| NIL . #6#) (LETT #1# |indSets| . #6#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |ind| (CAR #1#) . #6#) NIL))
                 (GO G191)))
               (SEQ (EXIT (LETT |dim| (MAX |dim| (LENGTH |ind|)) . #6#)))
               (LETT #1# (CDR #1#) . #6#) (GO G190) G191 (EXIT NIL))
          (EXIT (+ |dim0| |dim|))))) 

(SDEFUN |JBE;orderDim;LSem2Nni;13|
        ((|sys| |List| $) (|jm| |SparseEchelonMatrix| JB $)
         (|q| |NonNegativeInteger|) ($ |NonNegativeInteger|))
        (SPROG
         ((|dim| (|NonNegativeInteger|)) (#1=#:G825 NIL) (|ind| NIL)
          (|indSets| (|List| (|List| (|Kernel| $))))
          (|dim0| (|NonNegativeInteger|)) (#2=#:G818 NIL)
          (|allvars| (|List| (|Kernel| $))) (#3=#:G824 NIL) (|lv| NIL)
          (|lmv| (|List| (|List| (|Kernel| $)))) (#4=#:G823 NIL) (|p| NIL)
          (#5=#:G822 NIL)
          (|polys|
           (|List| (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| $)))))
         (SEQ
          (LETT |polys| (SPADCALL (ELT $ 19) |sys| (QREFELT $ 78))
                . #6=(|JBE;orderDim;LSem2Nni;13|))
          (LETT |lmv|
                (PROGN
                 (LETT #5# NIL . #6#)
                 (SEQ (LETT |p| NIL . #6#) (LETT #4# |polys| . #6#) G190
                      (COND
                       ((OR (ATOM #4#) (PROGN (LETT |p| (CAR #4#) . #6#) NIL))
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
                               #5#)
                              . #6#)))
                      (LETT #4# (CDR #4#) . #6#) (GO G190) G191
                      (EXIT (NREVERSE #5#))))
                . #6#)
          (LETT |allvars| (SPADCALL |lmv| (QREFELT $ 81)) . #6#)
          (SEQ (LETT |lv| NIL . #6#) (LETT #3# (CDR |lmv|) . #6#) G190
               (COND
                ((OR (ATOM #3#) (PROGN (LETT |lv| (CAR #3#) . #6#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (LETT |allvars|
                       (SPADCALL (SPADCALL |lv| |allvars| (QREFELT $ 82))
                                 (QREFELT $ 83))
                       . #6#)))
               (LETT #3# (CDR #3#) . #6#) (GO G190) G191 (EXIT NIL))
          (LETT |dim0|
                (PROG1
                    (LETT #2#
                          (- (SPADCALL |q| (QREFELT $ 87)) (LENGTH |allvars|))
                          . #6#)
                  (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #2#))
                . #6#)
          (LETT |indSets| (|JBE;dimrec| |lmv| NIL |allvars| NIL $) . #6#)
          (LETT |dim| 0 . #6#)
          (SEQ (LETT |ind| NIL . #6#) (LETT #1# |indSets| . #6#) G190
               (COND
                ((OR (ATOM #1#) (PROGN (LETT |ind| (CAR #1#) . #6#) NIL))
                 (GO G191)))
               (SEQ (EXIT (LETT |dim| (MAX |dim| (LENGTH |ind|)) . #6#)))
               (LETT #1# (CDR #1#) . #6#) (GO G190) G191 (EXIT NIL))
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
                 (SEQ
                  (LETT |tv| (SPADCALL |p| (QREFELT $ 91))
                        . #2=(|JBE;simpSMP|))
                  (EXIT
                   (COND ((QEQCAR |tv| 1) (|error| "inconsistent system"))
                         (#1#
                          (SEQ (LETT |v| (QCDR |tv|) . #2#)
                               (LETT |up| (SPADCALL |p| |v| (QREFELT $ 93))
                                     . #2#)
                               (EXIT
                                (COND
                                 ((SPADCALL |up| (QREFELT $ 95))
                                  (SEQ
                                   (LETT |lc| (SPADCALL |up| (QREFELT $ 96))
                                         . #2#)
                                   (EXIT
                                    (COND
                                     ((QEQCAR (SPADCALL |lc| (QREFELT $ 91)) 1)
                                      (SPADCALL (|spadConstant| $ 13) |v| 1
                                                (QREFELT $ 97)))
                                     (#1#
                                      (SPADCALL (|JBE;simpSMP| |lc| $) |v| 1
                                                (QREFELT $ 97)))))))
                                 (#1#
                                  (SEQ
                                   (LETT |md| (SPADCALL |up| (QREFELT $ 98))
                                         . #2#)
                                   (EXIT
                                    (COND
                                     ((SPADCALL |md| 0 (QREFELT $ 100))
                                      (SEQ
                                       (LETT |up|
                                             (QCAR
                                              (SPADCALL |up|
                                                        (SPADCALL
                                                         (|spadConstant| $ 13)
                                                         |md| (QREFELT $ 101))
                                                        (QREFELT $ 103)))
                                             . #2#)
                                       (EXIT
                                        (SPADCALL |up| |v| (QREFELT $ 104)))))
                                     (#1# |p|))))))))))))))))) 

(SDEFUN |JBE;simpOne;2$;15| ((|f| $) ($ $))
        (COND ((SPADCALL |f| (QREFELT $ 105)) (|spadConstant| $ 45))
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
                       (SEQ
                        (LETT |ind1| (QCAR (QVELT |r1| 1))
                              . #3=(|JBE;greaterLD|))
                        (LETT |ind2| (QCAR (QVELT |r2| 1)) . #3#)
                        (EXIT
                         (COND
                          ((SPADCALL (|SPADfirst| |ind1|) (|SPADfirst| |ind2|)
                                     (QREFELT $ 107))
                           (< (LENGTH |ind1|) (LENGTH |ind2|)))
                          (#2#
                           (SPADCALL (|SPADfirst| |ind1|) (|SPADfirst| |ind2|)
                                     (QREFELT $ 108))))))))))) 

(SDEFUN |JBE;groebner| ((|sys| |List| $) ($ |List| $))
        (SPROG
         ((|gbase|
           (|List| (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| $))))
          (|polys|
           (|List| (|SparseMultivariatePolynomial| (|Integer|) (|Kernel| $)))))
         (SEQ
          (LETT |polys| (SPADCALL (ELT $ 19) |sys| (QREFELT $ 78))
                . #1=(|JBE;groebner|))
          (SPADCALL
           (SPADCALL "polys" (SPADCALL |polys| (QREFELT $ 110))
                     (QREFELT $ 111))
           (QREFELT $ 113))
          (LETT |gbase| (SPADCALL |polys| (QREFELT $ 115)) . #1#)
          (EXIT (SPADCALL (ELT $ 16) |gbase| (QREFELT $ 118)))))) 

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
         ((#1=#:G869 NIL) (|fun| NIL) (|i| NIL) (#2=#:G868 NIL)
          (|resJM| (|SparseEchelonMatrix| JB $)) (#3=#:G867 NIL) (|eq| NIL)
          (#4=#:G866 NIL) (|resSys| (|List| $)) (#5=#:G865 NIL) (|rec| NIL)
          (#6=#:G864 NIL) (|resDep| (|List| (|NonNegativeInteger|)))
          (|tmp| (|List| (|List| (|NonNegativeInteger|)))) (#7=#:G863 NIL)
          (#8=#:G862 NIL))
         (SEQ
          (SPADCALL
           (SPADCALL "groebnerSimp: #"
                     (SPADCALL (LENGTH |sysL|) (QREFELT $ 119))
                     (QREFELT $ 111))
           (QREFELT $ 113))
          (LETT |tmp|
                (PROGN
                 (LETT #8# NIL . #9=(|JBE;groebnerSimp|))
                 (SEQ (LETT |rec| NIL . #9#) (LETT #7# |sysL| . #9#) G190
                      (COND
                       ((OR (ATOM #7#)
                            (PROGN (LETT |rec| (CAR #7#) . #9#) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #8# (CONS (QVELT |rec| 2) #8#) . #9#)))
                      (LETT #7# (CDR #7#) . #9#) (GO G190) G191
                      (EXIT (NREVERSE #8#))))
                . #9#)
          (LETT |resDep| (SPADCALL (ELT $ 120) |tmp| NIL (QREFELT $ 123))
                . #9#)
          (LETT |resSys|
                (|JBE;groebner|
                 (PROGN
                  (LETT #6# NIL . #9#)
                  (SEQ (LETT |rec| NIL . #9#) (LETT #5# |sysL| . #9#) G190
                       (COND
                        ((OR (ATOM #5#)
                             (PROGN (LETT |rec| (CAR #5#) . #9#) NIL))
                         (GO G191)))
                       (SEQ (EXIT (LETT #6# (CONS (QVELT |rec| 0) #6#) . #9#)))
                       (LETT #5# (CDR #5#) . #9#) (GO G190) G191
                       (EXIT (NREVERSE #6#))))
                 $)
                . #9#)
          (LETT |resJM|
                (SPADCALL |resSys|
                          (PROGN
                           (LETT #4# NIL . #9#)
                           (SEQ (LETT |eq| NIL . #9#) (LETT #3# |resSys| . #9#)
                                G190
                                (COND
                                 ((OR (ATOM #3#)
                                      (PROGN (LETT |eq| (CAR #3#) . #9#) NIL))
                                  (GO G191)))
                                (SEQ (EXIT (LETT #4# (CONS |ind| #4#) . #9#)))
                                (LETT #3# (CDR #3#) . #9#) (GO G190) G191
                                (EXIT (NREVERSE #4#))))
                          (QREFELT $ 125))
                . #9#)
          (SPADCALL "END groebnerSimp" (QREFELT $ 113))
          (EXIT
           (PROGN
            (LETT #2# NIL . #9#)
            (SEQ (LETT |i| 1 . #9#) (LETT |fun| NIL . #9#)
                 (LETT #1# |resSys| . #9#) G190
                 (COND
                  ((OR (ATOM #1#) (PROGN (LETT |fun| (CAR #1#) . #9#) NIL))
                   (GO G191)))
                 (SEQ
                  (EXIT
                   (LETT #2#
                         (CONS
                          (VECTOR |fun| (SPADCALL |resJM| |i| (QREFELT $ 128))
                                  |resDep|)
                          #2#)
                         . #9#)))
                 (LETT #1# (PROG1 (CDR #1#) (LETT |i| (|inc_SI| |i|) . #9#))
                       . #9#)
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
          (|newFun| ($)) (#1=#:G891 NIL)
          (|rec|
           #2=(|Record| (|:| |Fun| $)
                        (|:| JMR
                             (|Record| (|:| |Indices| (|List| JB))
                                       (|:| |Entries| (|List| $))))
                        (|:| |Depend| (|List| (|NonNegativeInteger|)))))
          (|sdep| (|List| (|NonNegativeInteger|))) (|ssub| ($)) (#3=#:G874 NIL)
          (|rsysL|
           (|List|
            (|Record| (|:| |Fun| $)
                      (|:| JMR
                           (|Record| (|:| |Indices| (|List| JB))
                                     (|:| |Entries| (|List| $))))
                      (|:| |Depend| (|List| (|NonNegativeInteger|))))))
          (|sld| (JB)) (|srec| #2#) (|solved?| (|Boolean|))
          (|s| (|Union| $ #4="failed")) (|ld| (JB)))
         (SEQ (LETT |solved?| NIL . #5=(|JBE;linearSimp|))
              (LETT |rsysL| NIL . #5#)
              (SEQ G190
                   (COND
                    ((NULL (COND (|solved?| NIL) ('T (NULL (NULL |sysL|)))))
                     (GO G191)))
                   (SEQ (LETT |rec| (SPADCALL |sysL| (QREFELT $ 131)) . #5#)
                        (LETT |sysL| (CDR |sysL|) . #5#)
                        (LETT |ld| (|SPADfirst| (QCAR (QVELT |rec| 1))) . #5#)
                        (LETT |s|
                              (SPADCALL (QVELT |rec| 0) |ld| (QREFELT $ 132))
                              . #5#)
                        (LETT |solved?| (QEQCAR |s| 0) . #5#)
                        (EXIT
                         (COND
                          (|solved?|
                           (SEQ (LETT |srec| |rec| . #5#)
                                (EXIT (LETT |sld| |ld| . #5#))))
                          ('T
                           (LETT |rsysL|
                                 (SPADCALL |rec| |rsysL| (QREFELT $ 133))
                                 . #5#)))))
                   NIL (GO G190) G191 (EXIT NIL))
              (LETT |rsysL|
                    (SPADCALL (NREVERSE |rsysL|) |sysL| (QREFELT $ 134)) . #5#)
              (EXIT
               (COND
                (|solved?|
                 (SEQ
                  (LETT |ssub|
                        (PROG2 (LETT #3# |s| . #5#)
                            (QCDR #3#)
                          (|check_union2| (QEQCAR #3# 0) $ (|Union| $ #4#)
                                          #3#))
                        . #5#)
                  (LETT |res| (LIST |srec|) . #5#)
                  (LETT |sdep| (QVELT |srec| 2) . #5#)
                  (SEQ (LETT |rec| NIL . #5#) (LETT #1# |rsysL| . #5#) G190
                       (COND
                        ((OR (ATOM #1#)
                             (PROGN (LETT |rec| (CAR #1#) . #5#) NIL))
                         (GO G191)))
                       (SEQ
                        (LETT |newFun|
                              (SPADCALL
                               (SPADCALL (QVELT |rec| 0) |sld| |ssub|
                                         (QREFELT $ 135))
                               (QREFELT $ 106))
                              . #5#)
                        (EXIT
                         (COND
                          ((NULL (SPADCALL |newFun| (QREFELT $ 105)))
                           (SEQ
                            (LETT |newJMR|
                                  (SPADCALL
                                   (SPADCALL (LIST |newFun|) (LIST |ind|)
                                             (QREFELT $ 125))
                                   1 (QREFELT $ 128))
                                  . #5#)
                            (LETT |newDep|
                                  (SPADCALL
                                   (SPADCALL (QVELT |rec| 2) |sdep|
                                             (QREFELT $ 136))
                                   (QREFELT $ 137))
                                  . #5#)
                            (EXIT
                             (LETT |res|
                                   (SPADCALL
                                    (VECTOR |newFun| |newJMR| |newDep|) |res|
                                    (QREFELT $ 133))
                                   . #5#)))))))
                       (LETT #1# (CDR #1#) . #5#) (GO G190) G191 (EXIT NIL))
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
                 (SEQ
                  (LETT |frec| (SPADCALL |sysL| (QREFELT $ 131))
                        . #3=(|JBE;simpRec|))
                  (LETT |fld| (|SPADfirst| (QCAR (QVELT |frec| 1))) . #3#)
                  (LETT |sysL| (CDR |sysL|) . #3#)
                  (LETT |srec| (SPADCALL |sysL| (QREFELT $ 131)) . #3#)
                  (LETT |sld| (|SPADfirst| (QCAR (QVELT |srec| 1))) . #3#)
                  (EXIT
                   (COND
                    ((SPADCALL |fld| |sld| (QREFELT $ 108))
                     (SPADCALL |frec| (|JBE;simpRec| |sysL| |ind| $)
                               (QREFELT $ 133)))
                    (#2#
                     (SEQ (LETT |eqLD| (LIST |frec|) . #3#)
                          (SEQ G190
                               (COND
                                ((NULL
                                  (COND ((NULL |sysL|) NIL)
                                        ('T
                                         (SPADCALL |sld| |fld|
                                                   (QREFELT $ 107)))))
                                 (GO G191)))
                               (SEQ
                                (LETT |eqLD|
                                      (SPADCALL |srec| |eqLD| (QREFELT $ 133))
                                      . #3#)
                                (LETT |sysL| (CDR |sysL|) . #3#)
                                (EXIT
                                 (COND
                                  ((NULL (NULL |sysL|))
                                   (SEQ
                                    (LETT |srec|
                                          (SPADCALL |sysL| (QREFELT $ 131))
                                          . #3#)
                                    (EXIT
                                     (LETT |sld|
                                           (|SPADfirst|
                                            (QCAR (QVELT |srec| 1)))
                                           . #3#)))))))
                               NIL (GO G190) G191 (EXIT NIL))
                          (LETT |eqLD|
                                (SPADCALL (CONS (|function| |JBE;greaterLD|) $)
                                          (|JBE;linearSimp| (NREVERSE |eqLD|)
                                           |ind| $)
                                          (QREFELT $ 139))
                                . #3#)
                          (LETT |srec| (SPADCALL |eqLD| (QREFELT $ 131)) . #3#)
                          (LETT |sld| (|SPADfirst| (QCAR (QVELT |srec| 1)))
                                . #3#)
                          (LETT |resLD| NIL . #3#)
                          (SEQ G190
                               (COND
                                ((NULL
                                  (COND ((NULL |eqLD|) NIL)
                                        ('T
                                         (SPADCALL |sld| |fld|
                                                   (QREFELT $ 107)))))
                                 (GO G191)))
                               (SEQ
                                (LETT |resLD|
                                      (SPADCALL |srec| |resLD| (QREFELT $ 133))
                                      . #3#)
                                (LETT |eqLD| (CDR |eqLD|) . #3#)
                                (EXIT
                                 (COND
                                  ((NULL (NULL |eqLD|))
                                   (SEQ
                                    (LETT |srec|
                                          (SPADCALL |eqLD| (QREFELT $ 131))
                                          . #3#)
                                    (EXIT
                                     (LETT |sld|
                                           (|SPADfirst|
                                            (QCAR (QVELT |srec| 1)))
                                           . #3#)))))))
                               NIL (GO G190) G191 (EXIT NIL))
                          (LETT |newSysL|
                                (SPADCALL (CONS (|function| |JBE;greaterLD|) $)
                                          |eqLD| |sysL| (QREFELT $ 140))
                                . #3#)
                          (EXIT
                           (SPADCALL (NREVERSE |resLD|)
                                     (|JBE;simpRec| |newSysL| |ind| $)
                                     (QREFELT $ 134))))))))))))) 

(SDEFUN |JBE;simplify;LSemR;21|
        ((|sys| |List| $) (|jm| |SparseEchelonMatrix| JB $)
         ($ |Record| (|:| |Sys| (|List| $))
          (|:| JM (|SparseEchelonMatrix| JB $))
          (|:| |Depend|
               (|Union| "failed" (|List| (|List| (|NonNegativeInteger|)))))))
        (SPROG
         ((|resDep| (|List| (|List| (|NonNegativeInteger|))))
          (|resSys| (|List| $)) (#1=#:G953 NIL) (|rec| NIL) (|i| NIL)
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
          (|neq| ($)) (#2=#:G952 NIL) (|eq| NIL) (|inds| (|List| JB)))
         (SEQ
          (LETT |inds| (SPADCALL |jm| (QREFELT $ 141))
                . #3=(|JBE;simplify;LSemR;21|))
          (LETT |sysL| NIL . #3#)
          (SEQ (LETT |i| 1 . #3#) (LETT |eq| NIL . #3#) (LETT #2# |sys| . #3#)
               G190
               (COND
                ((OR (ATOM #2#) (PROGN (LETT |eq| (CAR #2#) . #3#) NIL))
                 (GO G191)))
               (SEQ
                (EXIT
                 (COND
                  ((NULL (SPADCALL |eq| (QREFELT $ 105)))
                   (SEQ (LETT |neq| (SPADCALL |eq| (QREFELT $ 106)) . #3#)
                        (COND
                         ((SPADCALL |neq| |eq| (QREFELT $ 142))
                          (LETT |r| (SPADCALL |jm| |i| (QREFELT $ 128)) . #3#))
                         ('T
                          (LETT |r|
                                (SPADCALL
                                 (SPADCALL (LIST |neq|)
                                           (LIST
                                            (QCAR
                                             (SPADCALL |jm| |i|
                                                       (QREFELT $ 128))))
                                           (QREFELT $ 125))
                                 1 (QREFELT $ 128))
                                . #3#)))
                        (COND
                         ((OR (NULL (QCAR |r|))
                              (EQUAL
                               (SPADCALL (|SPADfirst| (QCAR |r|))
                                         (QREFELT $ 144))
                               '|Indep|))
                          (EXIT (|error| "inconsistent system"))))
                        (EXIT
                         (LETT |sysL|
                               (SPADCALL (VECTOR |neq| |r| (LIST |i|)) |sysL|
                                         (QREFELT $ 133))
                               . #3#)))))))
               (LETT #2# (PROG1 (CDR #2#) (LETT |i| (|inc_SI| |i|) . #3#))
                     . #3#)
               (GO G190) G191 (EXIT NIL))
          (EXIT
           (COND
            ((NULL |sysL|)
             (VECTOR (SPADCALL (QREFELT $ 145))
                     (SPADCALL NIL 0 (QREFELT $ 146)) (CONS 1 NIL)))
            ('T
             (SEQ
              (LETT |sysL|
                    (|JBE;simpRec|
                     (SPADCALL (CONS (|function| |JBE;greaterLD|) $) |sysL|
                               (QREFELT $ 139))
                     |inds| $)
                    . #3#)
              (LETT |resSys| (SPADCALL (QREFELT $ 145)) . #3#)
              (LETT |resJM| (SPADCALL |inds| (LENGTH |sysL|) (QREFELT $ 146))
                    . #3#)
              (LETT |resDep| NIL . #3#)
              (SEQ (LETT |i| 1 . #3#) (LETT |rec| NIL . #3#)
                   (LETT #1# |sysL| . #3#) G190
                   (COND
                    ((OR (ATOM #1#) (PROGN (LETT |rec| (CAR #1#) . #3#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((OR (NULL (QCAR (QVELT |rec| 1)))
                           (SPADCALL (|SPADfirst| (QCAR (QVELT |rec| 1)))
                                     (SPADCALL 1 (QREFELT $ 148))
                                     (QREFELT $ 149)))
                       (|error| "inconsistent system"))
                      ('T
                       (SEQ
                        (LETT |resSys|
                              (SPADCALL (QVELT |rec| 0) |resSys|
                                        (QREFELT $ 150))
                              . #3#)
                        (SPADCALL |resJM| |i| (QVELT |rec| 1) (QREFELT $ 151))
                        (EXIT
                         (LETT |resDep| (CONS (QVELT |rec| 2) |resDep|)
                               . #3#)))))))
                   (LETT #1# (PROG1 (CDR #1#) (LETT |i| (|inc_SI| |i|) . #3#))
                         . #3#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT
               (VECTOR (SPADCALL |resSys| (QREFELT $ 152)) |resJM|
                       (CONS 1 (NREVERSE |resDep|))))))))))) 

(SDEFUN |JBE;jetVariables;$L;22| ((|Phi| $) ($ |List| JB))
        (SPROG
         ((JV (|List| JB)) (#1=#:G968 NIL)
          (|pmindex| (|List| (|NonNegativeInteger|))) (#2=#:G965 NIL)
          (#3=#:G983 NIL) (|i| NIL) (#4=#:G982 NIL)
          (|mindex| (|List| (|Integer|))) (#5=#:G981 NIL) (#6=#:G980 NIL)
          (|pupindex| #7=(|Integer|)) (#8=#:G962 NIL) (|uindex| #7#)
          (#9=#:G959 NIL) (|xindex| #7#) (|arg| (|List| $)) (|typ| (|Symbol|))
          (#10=#:G956 NIL) (#11=#:G978 NIL) (|Ke| NIL) (#12=#:G979 NIL)
          (|Op| NIL) (|LOps| (|List| (|BasicOperator|))) (#13=#:G977 NIL)
          (#14=#:G976 NIL) (|LKernels| (|List| (|Kernel| $))))
         (SEQ (LETT JV NIL . #15=(|JBE;jetVariables;$L;22|))
              (LETT |LKernels| (SPADCALL |Phi| (QREFELT $ 157)) . #15#)
              (LETT |LOps|
                    (PROGN
                     (LETT #14# NIL . #15#)
                     (SEQ (LETT |Ke| NIL . #15#) (LETT #13# |LKernels| . #15#)
                          G190
                          (COND
                           ((OR (ATOM #13#)
                                (PROGN (LETT |Ke| (CAR #13#) . #15#) NIL))
                            (GO G191)))
                          (SEQ
                           (EXIT
                            (LETT #14#
                                  (CONS (SPADCALL |Ke| (QREFELT $ 159)) #14#)
                                  . #15#)))
                          (LETT #13# (CDR #13#) . #15#) (GO G190) G191
                          (EXIT (NREVERSE #14#))))
                    . #15#)
              (SEQ (LETT |Op| NIL . #15#) (LETT #12# |LOps| . #15#)
                   (LETT |Ke| NIL . #15#) (LETT #11# |LKernels| . #15#) G190
                   (COND
                    ((OR (ATOM #11#) (PROGN (LETT |Ke| (CAR #11#) . #15#) NIL)
                         (ATOM #12#) (PROGN (LETT |Op| (CAR #12#) . #15#) NIL))
                     (GO G191)))
                   (SEQ
                    (EXIT
                     (COND
                      ((SPADCALL |Op| '|%jet| (QREFELT $ 160))
                       (SEQ
                        (LETT |typ|
                              (PROG2
                                  (LETT #10#
                                        (SPADCALL |Op| '|%jet| (QREFELT $ 162))
                                        . #15#)
                                  (QCDR #10#)
                                (|check_union2| (QEQCAR #10# 0) (|None|)
                                                (|Union| (|None|) "failed")
                                                #10#))
                              . #15#)
                        (LETT |arg| (SPADCALL |Ke| (QREFELT $ 163)) . #15#)
                        (EXIT
                         (COND
                          ((EQUAL |typ| '|Indep|)
                           (SEQ
                            (LETT |xindex|
                                  (SPADCALL (SPADCALL |arg| (QREFELT $ 164))
                                            (QREFELT $ 165))
                                  . #15#)
                            (EXIT
                             (LETT JV
                                   (CONS
                                    (SPADCALL
                                     (PROG1 (LETT #9# |xindex| . #15#)
                                       (|check_subtype2| (> #9# 0)
                                                         '(|PositiveInteger|)
                                                         '(|Integer|) #9#))
                                     (QREFELT $ 166))
                                    JV)
                                   . #15#))))
                          ((EQUAL |typ| '|Dep|)
                           (SEQ
                            (LETT |uindex|
                                  (SPADCALL (SPADCALL |arg| (QREFELT $ 164))
                                            (QREFELT $ 165))
                                  . #15#)
                            (EXIT
                             (LETT JV
                                   (CONS
                                    (SPADCALL
                                     (PROG1 (LETT #8# |uindex| . #15#)
                                       (|check_subtype2| (> #8# 0)
                                                         '(|PositiveInteger|)
                                                         '(|Integer|) #8#))
                                     (QREFELT $ 148))
                                    JV)
                                   . #15#))))
                          ('T
                           (SEQ
                            (LETT |pupindex|
                                  (SPADCALL (SPADCALL |arg| (QREFELT $ 164))
                                            (QREFELT $ 165))
                                  . #15#)
                            (LETT |mindex|
                                  (PROGN
                                   (LETT #6# NIL . #15#)
                                   (SEQ (LETT |i| NIL . #15#)
                                        (LETT #5#
                                              (SPADCALL
                                               (SPADCALL |arg| (QREFELT $ 167))
                                               (QREFELT $ 167))
                                              . #15#)
                                        G190
                                        (COND
                                         ((OR (ATOM #5#)
                                              (PROGN
                                               (LETT |i| (CAR #5#) . #15#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #6#
                                                (CONS
                                                 (SPADCALL |i| (QREFELT $ 165))
                                                 #6#)
                                                . #15#)))
                                        (LETT #5# (CDR #5#) . #15#) (GO G190)
                                        G191 (EXIT (NREVERSE #6#))))
                                  . #15#)
                            (LETT |pmindex|
                                  (PROGN
                                   (LETT #4# NIL . #15#)
                                   (SEQ (LETT |i| NIL . #15#)
                                        (LETT #3# |mindex| . #15#) G190
                                        (COND
                                         ((OR (ATOM #3#)
                                              (PROGN
                                               (LETT |i| (CAR #3#) . #15#)
                                               NIL))
                                          (GO G191)))
                                        (SEQ
                                         (EXIT
                                          (LETT #4#
                                                (CONS
                                                 (PROG1 (LETT #2# |i| . #15#)
                                                   (|check_subtype2| (>= #2# 0)
                                                                     '(|NonNegativeInteger|)
                                                                     '(|Integer|)
                                                                     #2#))
                                                 #4#)
                                                . #15#)))
                                        (LETT #3# (CDR #3#) . #15#) (GO G190)
                                        G191 (EXIT (NREVERSE #4#))))
                                  . #15#)
                            (EXIT
                             (LETT JV
                                   (CONS
                                    (SPADCALL
                                     (PROG1 (LETT #1# |pupindex| . #15#)
                                       (|check_subtype2| (> #1# 0)
                                                         '(|PositiveInteger|)
                                                         '(|Integer|) #1#))
                                     |pmindex| (QREFELT $ 168))
                                    JV)
                                   . #15#)))))))))))
                   (LETT #11# (PROG1 (CDR #11#) (LETT #12# (CDR #12#) . #15#))
                         . #15#)
                   (GO G190) G191 (EXIT NIL))
              (EXIT
               (SPADCALL (ELT $ 108) (SPADCALL JV (QREFELT $ 169))
                         (QREFELT $ 171)))))) 

(SDEFUN |JBE;differentiate;$JB$;23| ((|fun| $) (|jv| JB) ($ $))
        (SPROG ((|x| (|Symbol|)))
               (SEQ
                (LETT |x| (SPADCALL |jv| (QREFELT $ 173))
                      |JBE;differentiate;$JB$;23|)
                (EXIT (SPADCALL |fun| |x| (QREFELT $ 174)))))) 

(SDEFUN |JBE;differentiate;$S$;24| ((|fun| $) (|x| |Symbol|) ($ $))
        (SPADCALL (SPADCALL |fun| (QREFELT $ 11)) |x| (QREFELT $ 176))) 

(SDEFUN |JBE;subst;$JB2$;25| ((|f| $) (|jv| JB) (|exp| $) ($ $))
        (SPROG ((|res| ($)))
               (SEQ
                (LETT |res|
                      (SPADCALL |f|
                                (SPADCALL (SPADCALL |jv| (QREFELT $ 9)) |exp|
                                          (QREFELT $ 179))
                                (QREFELT $ 181))
                      |JBE;subst;$JB2$;25|)
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
         (SEQ
          (LETT |fun| (SPADCALL |f| (QREFELT $ 19))
                . #2=(|JBE;solveFor;$JBU;26|))
          (LETT |var| (SPADCALL (SPADCALL |jv| (QREFELT $ 9)) (QREFELT $ 182))
                . #2#)
          (LETT |md|
                (SPADCALL |fun| (SPADCALL |var| (QREFELT $ 183)) |var|
                          (QREFELT $ 184))
                . #2#)
          (LETT |vrem| (SPADCALL (QCDR |md|) (QREFELT $ 27)) . #2#)
          (LETT |vquo| (SPADCALL (QCAR |md|) (QREFELT $ 27)) . #2#)
          (EXIT
           (COND
            ((SPADCALL |var| (SPADCALL |vrem| |vquo| (QREFELT $ 185))
                       (QREFELT $ 67))
             (CONS 1 "failed"))
            ((SPADCALL (QCDR |md|) (QREFELT $ 186))
             (COND ((NULL |vquo|) (CONS 0 (|spadConstant| $ 45)))
                   (#3='T (CONS 1 "failed"))))
            (#3#
             (CONS 0
                   (SPADCALL (SPADCALL (QCDR |md|) (QCAR |md|) (QREFELT $ 15))
                             (QREFELT $ 187))))))))) 

(SDEFUN |JBE;kernel0| ((|op| |BasicOperator|) (|ls| |List| $) ($ $))
        (SPADCALL |op| |ls| (QREFELT $ 188))) 

(SDEFUN |JBE;sy2jbe| ((|s| |Symbol|) ($ $)) (SPADCALL |s| (QREFELT $ 189))) 

(SDEFUN |JBE;hidedisp| ((|l| |List| $) ($ |OutputForm|))
        (SPROG
         ((|op| (|OutputForm|)) (#1=#:G1009 NIL) (|e| NIL) (#2=#:G1008 NIL)
          (#3=#:G1007 NIL) (|k| NIL) (|args| (|List| (|OutputForm|)))
          (#4=#:G1006 NIL) (|show| #5=(|Integer|)) (|num| #5#)
          (|name| (|Symbol|)))
         (SEQ
          (LETT |name|
                (SPADCALL (SPADCALL |l| (QREFELT $ 190)) (QREFELT $ 191))
                . #6=(|JBE;hidedisp|))
          (LETT |l| (SPADCALL |l| (QREFELT $ 167)) . #6#)
          (LETT |num| (SPADCALL (SPADCALL |l| (QREFELT $ 190)) (QREFELT $ 165))
                . #6#)
          (LETT |l| (SPADCALL |l| (QREFELT $ 167)) . #6#)
          (LETT |show|
                (SPADCALL (SPADCALL |l| (QREFELT $ 190)) (QREFELT $ 165))
                . #6#)
          (LETT |l| (SPADCALL |l| (QREFELT $ 167)) . #6#)
          (LETT |args| NIL . #6#)
          (SEQ (LETT |k| 1 . #6#) (LETT #4# |show| . #6#) G190
               (COND ((|greater_SI| |k| #4#) (GO G191)))
               (SEQ
                (LETT |args|
                      (SPADCALL |args|
                                (LIST
                                 (SPADCALL (SPADCALL |l| (QREFELT $ 190))
                                           (QREFELT $ 192)))
                                (QREFELT $ 194))
                      . #6#)
                (EXIT (LETT |l| (SPADCALL |l| (QREFELT $ 167)) . #6#)))
               (LETT |k| (|inc_SI| |k|) . #6#) (GO G190) G191 (EXIT NIL))
          (SEQ (LETT |k| (+ |show| 1) . #6#) (LETT #3# |num| . #6#) G190
               (COND ((> |k| #3#) (GO G191)))
               (SEQ (EXIT (LETT |l| (SPADCALL |l| (QREFELT $ 167)) . #6#)))
               (LETT |k| (+ |k| 1) . #6#) (GO G190) G191 (EXIT NIL))
          (COND
           ((SPADCALL |l| (QREFELT $ 195))
            (LETT |op| (SPADCALL |name| (QREFELT $ 196)) . #6#))
           (#7='T
            (LETT |op|
                  (SPADCALL (SPADCALL |name| (QREFELT $ 196))
                            (SPADCALL
                             (PROGN
                              (LETT #2# NIL . #6#)
                              (SEQ (LETT |e| NIL . #6#) (LETT #1# |l| . #6#)
                                   G190
                                   (COND
                                    ((OR (ATOM #1#)
                                         (PROGN
                                          (LETT |e| (CAR #1#) . #6#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #2#
                                           (CONS (SPADCALL |e| (QREFELT $ 192))
                                                 #2#)
                                           . #6#)))
                                   (LETT #1# (CDR #1#) . #6#) (GO G190) G191
                                   (EXIT (NREVERSE #2#))))
                             (QREFELT $ 197))
                            (QREFELT $ 198))
                  . #6#)))
          (EXIT
           (COND ((NULL |args|) |op|)
                 (#7# (SPADCALL |op| |args| (QREFELT $ 199)))))))) 

(SDEFUN |JBE;hidediff| ((|l| |List| $) (|x| |Symbol|) ($ $))
        (SPROG
         ((|res| ($)) (|newarg| (|List| $)) (#1=#:G1032 NIL) (|j| NIL)
          (#2=#:G1031 NIL) (|da| ($)) (|k| NIL) (#3=#:G1030 NIL) (|arg| NIL)
          (|op| (|BasicOperator|)) (|oldarg| (|List| $)) (#4=#:G1013 NIL)
          (|diff| (|List| (|Integer|))) (#5=#:G1029 NIL) (#6=#:G1028 NIL)
          (|args| (|List| $)) (#7=#:G1027 NIL) (|show| #8=(|Integer|))
          (|num| #8#) (|name| (|Symbol|)))
         (SEQ
          (LETT |oldarg| (SPADCALL |l| (QREFELT $ 200)) . #9=(|JBE;hidediff|))
          (LETT |name|
                (SPADCALL (SPADCALL |l| (QREFELT $ 190)) (QREFELT $ 191))
                . #9#)
          (LETT |l| (SPADCALL |l| (QREFELT $ 167)) . #9#)
          (LETT |num| (SPADCALL (SPADCALL |l| (QREFELT $ 190)) (QREFELT $ 165))
                . #9#)
          (EXIT
           (COND ((ZEROP |num|) (|spadConstant| $ 45))
                 ('T
                  (SEQ (LETT |l| (SPADCALL |l| (QREFELT $ 167)) . #9#)
                       (LETT |show|
                             (SPADCALL (SPADCALL |l| (QREFELT $ 190))
                                       (QREFELT $ 165))
                             . #9#)
                       (LETT |l| (SPADCALL |l| (QREFELT $ 167)) . #9#)
                       (LETT |args| (SPADCALL (QREFELT $ 145)) . #9#)
                       (SEQ (LETT |k| 1 . #9#) (LETT #7# |num| . #9#) G190
                            (COND ((|greater_SI| |k| #7#) (GO G191)))
                            (SEQ
                             (LETT |args|
                                   (SPADCALL (SPADCALL |l| (QREFELT $ 190))
                                             |args| (QREFELT $ 150))
                                   . #9#)
                             (EXIT
                              (LETT |l| (SPADCALL |l| (QREFELT $ 167)) . #9#)))
                            (LETT |k| (|inc_SI| |k|) . #9#) (GO G190) G191
                            (EXIT NIL))
                       (LETT |diff|
                             (PROGN
                              (LETT #6# NIL . #9#)
                              (SEQ (LETT |k| NIL . #9#) (LETT #5# |l| . #9#)
                                   G190
                                   (COND
                                    ((OR (ATOM #5#)
                                         (PROGN
                                          (LETT |k| (CAR #5#) . #9#)
                                          NIL))
                                     (GO G191)))
                                   (SEQ
                                    (EXIT
                                     (LETT #6#
                                           (CONS (SPADCALL |k| (QREFELT $ 165))
                                                 #6#)
                                           . #9#)))
                                   (LETT #5# (CDR #5#) . #9#) (GO G190) G191
                                   (EXIT (NREVERSE #6#))))
                             . #9#)
                       (LETT |oldarg|
                             (SPADCALL |oldarg|
                                       (PROG1 (LETT #4# (+ |num| 3) . #9#)
                                         (|check_subtype2| (>= #4# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #4#))
                                       (QREFELT $ 201))
                             . #9#)
                       (LETT |op| (SPADCALL |name| (QREFELT $ 202)) . #9#)
                       (SPADCALL |op| '|%specialDisp|
                                 (CONS (|function| |JBE;hidedisp|) $)
                                 (QREFELT $ 204))
                       (SPADCALL |op| '|%specialDiff|
                                 (CONS (|function| |JBE;hidediff|) $)
                                 (QREFELT $ 204))
                       (LETT |res| (|spadConstant| $ 45) . #9#)
                       (SEQ (LETT |arg| NIL . #9#) (LETT #3# |args| . #9#)
                            (LETT |k| |num| . #9#) G190
                            (COND
                             ((OR (< |k| 1) (ATOM #3#)
                                  (PROGN (LETT |arg| (CAR #3#) . #9#) NIL))
                              (GO G191)))
                            (SEQ
                             (LETT |da| (SPADCALL |arg| |x| (QREFELT $ 174))
                                   . #9#)
                             (EXIT
                              (COND
                               ((NULL (SPADCALL |da| (QREFELT $ 105)))
                                (SEQ
                                 (LETT |newarg|
                                       (SPADCALL |oldarg|
                                                 (PROGN
                                                  (LETT #2# NIL . #9#)
                                                  (SEQ (LETT |j| NIL . #9#)
                                                       (LETT #1#
                                                             (SPADCALL |diff|
                                                                       (LIST
                                                                        |k|)
                                                                       (QREFELT
                                                                        $ 205))
                                                             . #9#)
                                                       G190
                                                       (COND
                                                        ((OR (ATOM #1#)
                                                             (PROGN
                                                              (LETT |j|
                                                                    (CAR #1#)
                                                                    . #9#)
                                                              NIL))
                                                         (GO G191)))
                                                       (SEQ
                                                        (EXIT
                                                         (LETT #2#
                                                               (CONS
                                                                (SPADCALL |j|
                                                                          (QREFELT
                                                                           $
                                                                           206))
                                                                #2#)
                                                               . #9#)))
                                                       (LETT #1# (CDR #1#)
                                                             . #9#)
                                                       (GO G190) G191
                                                       (EXIT (NREVERSE #2#))))
                                                 (QREFELT $ 207))
                                       . #9#)
                                 (EXIT
                                  (LETT |res|
                                        (SPADCALL |res|
                                                  (SPADCALL
                                                   (|JBE;kernel0| |op| |newarg|
                                                    $)
                                                   |da| (QREFELT $ 52))
                                                  (QREFELT $ 53))
                                        . #9#)))))))
                            (LETT |k|
                                  (PROG1 (+ |k| -1) (LETT #3# (CDR #3#) . #9#))
                                  . #9#)
                            (GO G190) G191 (EXIT NIL))
                       (EXIT |res|)))))))) 

(SDEFUN |JBE;function;SLNni$;31|
        ((|f| |Symbol|) (|arg| |List| $) (|show| |NonNegativeInteger|) ($ $))
        (SPROG ((|args| (|List| $)) (|op| (|BasicOperator|)))
               (SEQ
                (LETT |op| (SPADCALL |f| (QREFELT $ 202))
                      . #1=(|JBE;function;SLNni$;31|))
                (SPADCALL |op| '|%specialDisp|
                          (CONS (|function| |JBE;hidedisp|) $) (QREFELT $ 204))
                (SPADCALL |op| '|%specialDiff|
                          (CONS (|function| |JBE;hidediff|) $) (QREFELT $ 204))
                (LETT |args|
                      (SPADCALL
                       (LIST (|JBE;sy2jbe| |f| $)
                             (SPADCALL (SPADCALL |arg| (QREFELT $ 208))
                                       (QREFELT $ 206))
                             (SPADCALL |show| (QREFELT $ 206)))
                       |arg| (QREFELT $ 207))
                      . #1#)
                (EXIT (|JBE;kernel0| |op| |args| $))))) 

(DECLAIM (NOTINLINE |JetBundleExpression;|)) 

(DEFUN |JetBundleExpression| (#1=#:G1106)
  (SPROG NIL
         (PROG (#2=#:G1107)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|JetBundleExpression|)
                                               '|domainEqualList|)
                    . #3=(|JetBundleExpression|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|JetBundleExpression;| #1#) (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|JetBundleExpression|)))))))))) 

(DEFUN |JetBundleExpression;| (|#1|)
  (SPROG
   ((|pv$| NIL) (#1=#:G1104 NIL) (#2=#:G1105 NIL) ($ NIL) (|dv$| NIL)
    (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #3=(|JetBundleExpression|))
    (LETT |dv$| (LIST '|JetBundleExpression| DV$1) . #3#)
    (LETT $ (GETREFV 259) . #3#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (LETT #2#
                                              (|HasCategory| (|Integer|)
                                                             '(|IntegralDomain|))
                                              . #3#)
                                        (OR
                                         (|HasCategory| (|Integer|)
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (AND
                                          (|HasCategory| (|Integer|)
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #2#))
                                        (|HasCategory| (|Integer|)
                                                       '(|CommutativeRing|))
                                        (|HasCategory| (|Integer|)
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| (|Integer|)
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| (|Integer|) '(|Ring|))
                                        (|HasCategory| (|Integer|) '(|Group|))
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
                                        (LETT #1#
                                              (|HasCategory| (|Integer|)
                                                             '(|PatternMatchable|
                                                               (|Integer|)))
                                              . #3#)
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
                                          #1#)
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
                                          (|HasCategory| (|Integer|)
                                                         '(|RetractableTo|
                                                           (|Integer|)))
                                          #2#)
                                         (AND
                                          (|HasCategory| (|Integer|)
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| (|Integer|)
                                                         '(|Group|)))
                                         (|HasCategory| (|Integer|) '(|Ring|)))
                                        (|HasCategory| (|Integer|)
                                                       '(|AbelianSemiGroup|))
                                        (|HasCategory| (|Integer|)
                                                       '(|SemiGroup|))))
                    . #3#))
    (|haddProp| |$ConstructorCache| '|JetBundleExpression| (LIST DV$1)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| $ '(|Ring|)) (|augmentPredVector| $ 32768))
    (AND (|HasCategory| $ '(|RetractableTo| (|Integer|)))
         (|augmentPredVector| $ 65536))
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
              (280 . |minimumDegree|) (285 . |Zero|) (289 . >)
              (295 . |monomial|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (301 . |monicDivide|) (307 . |multivariate|) (313 . |zero?|)
              |JBE;simpOne;2$;15| (318 . =) (324 . >) (|OutputForm|)
              (330 . |coerce|) (335 . |assign|) (|Void|) (341 . |print|)
              (|GroebnerPackage| 24 (|IndexedExponents| 34) 34 12)
              (346 . |groebner|) (|Mapping| $$ 12)
              (|FiniteLinearAggregateFunctions2| 12 74 $$ 76) (351 . |map|)
              (357 . |coerce|) (362 . |setUnion|) (|Mapping| 40 40 40)
              (|List| 40) (368 . |reduce|) (|List| 39) (375 . |jacobiMatrix|)
              (|Record| (|:| |Indices| 39) (|:| |Entries| 76))
              (|SparseEchelonMatrix| 6 $$) (381 . |row|)
              (|Record| (|:| |Fun| $$) (|:| JMR 126) (|:| |Depend| 40))
              (|List| 129) (387 . |first|) |JBE;solveFor;$JBU;26|
              (392 . |cons|) (398 . |concat!|) |JBE;subst;$JB2$;25|
              (404 . |append|) (410 . |removeDuplicates!|)
              (|Mapping| 65 129 129) (415 . |sort!|) (421 . |merge|)
              (428 . |allIndices|) (433 . =) (|Symbol|) (439 . |type|)
              (444 . |empty|) (448 . |new|) (|PositiveInteger|) (454 . U)
              (459 . <) (465 . |cons|) (471 . |setRow!|) (478 . |reverse!|)
              (|Union| '"failed" 122)
              (|Record| (|:| |Sys| 20) (|:| JM 85) (|:| |Depend| 153))
              |JBE;simplify;LSemR;21| (|List| 28) (483 . |tower|)
              (|BasicOperator|) (488 . |operator|) (493 . |has?|)
              (|Union| 203 '"failed") (499 . |property|) (505 . |argument|)
              (510 . |second|) (515 . |retract|) (520 . X) (525 . |rest|)
              (530 . P) (536 . |removeDuplicates!|) (|Mapping| 65 6 6)
              (541 . |sort|) |JBE;jetVariables;$L;22| (547 . |name|)
              |JBE;differentiate;$S$;24| |JBE;differentiate;$JB$;23|
              (552 . |differentiate|) (558 . =) (|Equation| $$) (564 . =)
              (|Equation| $) (570 . |eval|) (576 . |retract|) (581 . |coerce|)
              (586 . |monicDivide|) (593 . |append|) (599 . |zero?|) (604 . -)
              (609 . |kernel|) (615 . |coerce|) (620 . |first|)
              (625 . |retract|) (630 . |coerce|) (|List| 109) (635 . |concat!|)
              (641 . |empty?|) (646 . |coerce|) (651 . |commaSeparate|)
              (656 . |sub|) (662 . |prefix|) (668 . |copy|) (673 . |first|)
              (679 . |operator|) (|None|) (684 . |setProperty|) (691 . |merge|)
              (697 . |coerce|) (702 . |append|) (708 . |#|)
              |JBE;function;SLNni$;31| (|Union| 211 '#1#) (|Fraction| 24)
              (|Union| 20 '#2="failed")
              (|Record| (|:| |coef| 24) (|:| |var| 28)) (|Union| 213 '#2#)
              (|List| 143) (|List| 158) (|InputForm|) (|Pattern| (|Float|))
              (|Pattern| 24) (|Factored| $) (|Polynomial| 211) (|Fraction| 92)
              (|Fraction| 221) (|Fraction| 241) (|Union| 224 '#1#)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 24 $)
              (|Record| (|:| |mat| 231) (|:| |vec| (|Vector| 24))) (|Matrix| $)
              (|Vector| $) (|Matrix| 24)
              (|Record| (|:| |var| 28) (|:| |exponent| 24)) (|Union| 232 '#2#)
              (|Mapping| $ $) (|List| 234)
              (|Record| (|:| |val| $) (|:| |exponent| 24)) (|Union| 236 '#2#)
              (|Mapping| $ 20) (|List| 238) (|Union| 241 '#1#)
              (|Polynomial| 24) (|SegmentBinding| $)
              (|Record| (|:| |coef| 20) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 244 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Polynomial| $) (|Union| 28 '#1#) (|List| 180)
              (|Union| 143 '#1#) (|Union| 24 '#1#)
              (|Record| (|:| |DPhi| $) (|:| |JVars| 39))
              (|Record| (|:| |DSys| 20) (|:| |JVars| 124))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 713 |zerosOf| 719 |zeroOf| 746 |zero?| 773 |whittakerW| 778
              |whittakerM| 785 |weierstrassZeta| 792 |weierstrassSigma| 799
              |weierstrassPPrime| 806 |weierstrassPInverse| 813 |weierstrassP|
              820 |weberE| 827 |variables| 833 |univariate| 843 |unitNormal|
              849 |unitCanonical| 854 |unit?| 859 |tower| 864 |tanh| 874 |tan|
              879 |symbol| 884 |summation| 889 |subtractIfCan| 901 |subst| 907
              |struveL| 933 |struveH| 939 |squareFreePart| 945 |squareFree| 950
              |sqrt| 955 |sortLD| 960 |solveFor| 965 |smaller?| 971 |sizeLess?|
              977 |sinh| 983 |sin| 988 |simplify| 993 |simpOne| 999 |simpMod|
              1004 |setNotation| 1017 |sech| 1022 |sec| 1027 |sample| 1032
              |rootsOf| 1036 |rootSum| 1063 |rootOf| 1070 |riemannZeta| 1097
              |retractIfCan| 1102 |retract| 1137 |rem| 1172 |reducedSystem|
              1178 |reduceMod| 1189 |reduce| 1195 |recip| 1200 |quo| 1205
              |product| 1211 |principalIdeal| 1223 |prime?| 1228 |polylog| 1233
              |polygamma| 1239 |pi| 1245 |permutation| 1249 |patternMatch| 1255
              |paren| 1269 |orderDim| 1279 |order| 1286 |opposite?| 1291
              |operators| 1297 |operator| 1302 |one?| 1307 |odd?| 1312
              |numerator| 1317 |numerJP| 1322 |numer| 1327 |numIndVar| 1332
              |numDepVar| 1336 |nthRoot| 1340 |multiEuclidean| 1346 |minPoly|
              1352 |meixnerM| 1357 |meijerG| 1365 |map| 1374 |mainKernel| 1380
              |lommelS2| 1385 |lommelS1| 1392 |log| 1399 |li| 1404 |lerchPhi|
              1409 |legendreQ| 1416 |legendreP| 1423 |leadingDer| 1430
              |lcmCoef| 1435 |lcm| 1441 |latex| 1452 |lambertW| 1457
              |laguerreL| 1462 |kummerU| 1469 |kummerM| 1476 |kernels| 1483
              |kernel| 1493 |kelvinKer| 1505 |kelvinKei| 1511 |kelvinBer| 1517
              |kelvinBei| 1523 |jetVariables| 1529 |jacobiZeta| 1534
              |jacobiTheta| 1540 |jacobiSn| 1546 |jacobiP| 1552 |jacobiMatrix|
              1560 |jacobiDn| 1571 |jacobiCn| 1577 |isTimes| 1583 |isPower|
              1588 |isPlus| 1593 |isMult| 1598 |isExpt| 1603 |is?| 1620 |inv|
              1632 |integral| 1637 |hypergeometricF| 1649 |hermiteH| 1656
              |height| 1662 |hashUpdate!| 1667 |hash| 1673 |hankelH2| 1678
              |hankelH1| 1684 |ground?| 1690 |ground| 1695 |getNotation| 1700
              |gcdPolynomial| 1704 |gcd| 1710 |function| 1721 |fresnelS| 1728
              |fresnelC| 1733 |freeOf?| 1738 |formalDiff2| 1756 |formalDiff|
              1770 |factorials| 1788 |factorial| 1799 |factor| 1804
              |extractSymbol| 1809 |extendedEuclidean| 1814 |exquo| 1827
              |expressIdealMember| 1833 |exp| 1839 |even?| 1844 |eval| 1849
              |euclideanSize| 2010 |erfi| 2015 |erf| 2020 |elt| 2025
              |ellipticPi| 2121 |ellipticK| 2128 |ellipticF| 2133 |ellipticE|
              2139 |divide| 2150 |distribute| 2156 |dimension| 2167 |dilog|
              2174 |digamma| 2179 |differentiate| 2184 |denominator| 2216
              |denom| 2221 |definingPolynomial| 2226 |dSubst| 2231 |csch| 2238
              |csc| 2243 |coth| 2248 |cot| 2253 |cosh| 2258 |cos| 2263
              |convert| 2268 |const?| 2288 |conjugate| 2293 |commutator| 2299
              |coerce| 2305 |class| 2380 |charthRoot| 2385 |charlierC| 2390
              |characteristic| 2397 |box| 2401 |binomial| 2411 |besselY| 2417
              |besselK| 2423 |besselJ| 2429 |besselI| 2435 |belong?| 2441
              |autoReduce| 2446 |atanh| 2451 |atan| 2456 |associates?| 2461
              |asinh| 2467 |asin| 2472 |asech| 2477 |asec| 2482 |applyQuote|
              2487 |annihilate?| 2523 |angerJ| 2529 |algtower| 2535
              |airyBiPrime| 2545 |airyBi| 2550 |airyAiPrime| 2555 |airyAi| 2560
              |acsch| 2565 |acsc| 2570 |acoth| 2575 |acot| 2580 |acosh| 2585
              |acos| 2590 |abs| 2595 ^ 2600 |Zero| 2630 X 2634 U 2643 |Si| 2652
              |Shi| 2657 P 2662 |One| 2684 |Gamma| 2688 |Ei| 2699 D 2704 |Ci|
              2730 |Chi| 2735 |Beta| 2740 = 2746 / 2752 - 2764 + 2775 * 2781)
           'NIL
           (CONS
            (|makeByteWordVec2| 13
                                '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 3 6 0 0 0 0 0 3 4
                                  5 13 0 0 0 3 0 0 0 0 0 3 3 0 0 0 7 0 0 0 0 0
                                  0 0 0 0 11 12 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 2 1 6 8 9 10))
            (CONS
             '#(|AlgebraicallyClosedFunctionSpace&| |AlgebraicallyClosedField&|
                |FunctionSpace&| |Field&| |EuclideanDomain&|
                |JetBundleFunctionCategory&| NIL |UniqueFactorizationDomain&|
                |GcdDomain&| |DivisionRing&| NIL |Algebra&| NIL |Algebra&|
                |Algebra&| |FullyLinearlyExplicitOver&|
                |PartialDifferentialRing&| |Module&| NIL |EntireRing&|
                |Module&| |Module&| NIL NIL NIL NIL NIL |Ring&| NIL NIL NIL NIL
                |Rng&| NIL NIL NIL |AbelianGroup&| NIL NIL |Group&| NIL
                |ExpressionSpace&| |AbelianMonoid&| |Monoid&| NIL NIL NIL
                |SemiGroup&| |AbelianSemiGroup&| NIL NIL NIL
                |TranscendentalFunctionCategory&| |FullyRetractableTo&| NIL
                |Evalable&| |SetCategory&| NIL NIL NIL
                |ElementaryFunctionCategory&| NIL |HyperbolicFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |TrigonometricFunctionCategory&| |RadicalCategory&|
                |RetractableTo&| NIL |RetractableTo&| NIL NIL |InnerEvalable&|
                |InnerEvalable&| |RetractableTo&| |RetractableTo&| NIL NIL NIL
                |BasicType&| NIL |RetractableTo&| |RetractableTo&|
                |RetractableTo&| NIL NIL NIL)
             (CONS
              '#((|AlgebraicallyClosedFunctionSpace| 24)
                 (|AlgebraicallyClosedField|) (|FunctionSpace| 24) (|Field|)
                 (|EuclideanDomain|) (|JetBundleFunctionCategory| 6)
                 (|PrincipalIdealDomain|) (|UniqueFactorizationDomain|)
                 (|GcdDomain|) (|DivisionRing|) (|IntegralDomain|)
                 (|Algebra| 211) (|LeftOreRing|) (|Algebra| $$) (|Algebra| 24)
                 (|FullyLinearlyExplicitOver| 24)
                 (|PartialDifferentialRing| 143) (|Module| 211)
                 (|CommutativeRing|) (|EntireRing|) (|Module| $$) (|Module| 24)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|LinearlyExplicitOver| 24) (|BiModule| 211 211)
                 (|BiModule| $$ $$) (|Ring|) (|BiModule| 24 24)
                 (|RightModule| 211) (|LeftModule| 211) (|LeftModule| $$)
                 (|Rng|) (|RightModule| $$) (|LeftModule| 24)
                 (|RightModule| 24) (|AbelianGroup|)
                 (|CancellationAbelianMonoid|) (|SemiRing|) (|Group|)
                 (|FullyPatternMatchable| 24) (|ExpressionSpace|)
                 (|AbelianMonoid|) (|Monoid|) (|SemiRng|)
                 (|LiouvillianFunctionCategory|) (|Comparable|) (|SemiGroup|)
                 (|AbelianSemiGroup|) (|PatternMatchable| (|Float|))
                 (|PatternMatchable| 24) (|CombinatorialOpsCategory|)
                 (|TranscendentalFunctionCategory|) (|FullyRetractableTo| 24)
                 (|Patternable| 24) (|Evalable| $$) (|SetCategory|)
                 (|SpecialFunctionCategory|) (|PrimitiveFunctionCategory|)
                 (|CombinatorialFunctionCategory|)
                 (|ElementaryFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|TrigonometricFunctionCategory|) (|RadicalCategory|)
                 (|RetractableTo| 24) (|Type|) (|RetractableTo| 143)
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|InnerEvalable| $$ $$) (|InnerEvalable| 34 $$)
                 (|RetractableTo| 34) (|RetractableTo| 6) (|noZeroDivisors|)
                 (|CommutativeStar|) (|unitsKnown|) (|BasicType|)
                 (|CoercibleTo| 109) (|RetractableTo| 211)
                 (|RetractableTo| 224) (|RetractableTo| 241)
                 (|ConvertibleTo| 217) (|ConvertibleTo| 218)
                 (|ConvertibleTo| 219))
              (|makeByteWordVec2| 258
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
                                    94 33 0 98 0 7 0 99 2 33 65 0 0 100 2 94 0
                                    12 33 101 2 94 102 0 0 103 2 12 0 92 34 104
                                    1 0 65 0 105 2 6 65 0 0 107 2 6 65 0 0 108
                                    1 74 109 0 110 2 109 0 0 0 111 1 109 112 0
                                    113 1 114 74 74 115 2 117 76 116 74 118 1
                                    33 109 0 119 2 40 0 0 0 120 3 122 40 121 0
                                    40 123 2 0 85 20 124 125 2 127 126 0 24 128
                                    1 130 129 0 131 2 130 0 129 0 133 2 130 0 0
                                    0 134 2 40 0 0 0 136 1 40 0 0 137 2 130 0
                                    138 0 139 3 130 0 138 0 0 140 1 127 39 0
                                    141 2 0 65 0 0 142 1 6 143 0 144 0 76 0 145
                                    2 127 0 39 24 146 1 6 0 147 148 2 6 65 0 0
                                    149 2 76 0 2 0 150 3 127 112 0 24 126 151 1
                                    76 0 0 152 1 0 156 0 157 1 34 158 0 159 2
                                    158 65 0 143 160 2 158 161 0 143 162 1 34
                                    76 0 163 1 76 2 0 164 1 0 24 0 165 1 6 0
                                    147 166 1 76 0 0 167 2 6 0 147 40 168 1 39
                                    0 0 169 2 39 0 170 0 171 1 6 143 0 173 2 7
                                    0 0 143 176 2 7 65 0 0 177 2 178 0 2 2 179
                                    2 0 0 0 180 181 1 0 28 0 182 1 12 0 34 183
                                    3 12 102 0 0 34 184 2 26 0 0 0 185 1 12 65
                                    0 186 1 0 0 0 187 2 5 0 158 20 188 1 5 0
                                    143 189 1 76 2 0 190 1 0 143 0 191 1 0 109
                                    0 192 2 193 0 0 0 194 1 76 65 0 195 1 143
                                    109 0 196 1 109 0 20 197 2 109 0 0 0 198 2
                                    109 0 0 20 199 1 76 0 0 200 2 76 0 0 33 201
                                    1 158 0 143 202 3 158 0 0 143 203 204 2 22
                                    0 0 0 205 1 0 0 24 206 2 76 0 0 0 207 1 76
                                    33 0 208 2 0 65 0 0 1 1 0 20 247 1 2 0 20
                                    92 143 1 1 0 20 92 1 1 0 20 0 1 2 0 20 0
                                    143 1 1 0 0 247 1 2 0 0 92 143 1 1 0 0 92 1
                                    1 0 0 0 1 2 0 0 0 143 1 1 0 65 0 105 3 0 0
                                    0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0
                                    0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0
                                    0 1 2 0 0 0 0 1 1 0 215 0 1 1 0 215 20 1 2
                                    1 222 0 28 1 1 0 254 0 1 1 0 0 0 1 1 0 65 0
                                    1 1 0 156 0 157 1 0 156 20 1 1 0 0 0 1 1 0
                                    0 0 1 1 0 85 20 1 2 0 0 0 242 1 2 0 0 0 143
                                    1 2 0 57 0 0 1 2 0 0 0 180 1 3 0 0 0 156 20
                                    1 2 0 0 0 249 1 3 0 0 0 6 0 135 2 0 0 0 0 1
                                    2 0 0 0 0 1 1 0 0 0 1 1 0 220 0 1 1 0 0 0 1
                                    1 0 20 20 1 2 0 57 0 6 132 2 0 65 0 0 1 2 0
                                    65 0 0 1 1 0 0 0 1 1 0 0 0 1 2 0 154 20 85
                                    155 1 0 0 0 106 2 0 20 20 20 1 3 0 154 20
                                    85 20 1 1 0 112 143 1 1 0 0 0 1 1 0 0 0 1 0
                                    0 0 1 1 0 20 247 1 2 0 20 92 143 1 1 0 20
                                    92 1 1 0 20 0 1 2 0 20 0 143 1 3 0 0 0 92
                                    143 1 1 0 0 247 1 2 0 0 92 143 1 1 0 0 92 1
                                    1 0 0 0 1 2 0 0 0 143 1 1 0 0 0 1 1 2 210 0
                                    1 1 1 225 0 1 1 6 240 0 1 1 0 248 0 1 1 0
                                    250 0 1 1 0 251 0 1 1 0 30 0 31 1 2 211 0 1
                                    1 1 224 0 1 1 6 241 0 1 1 0 28 0 182 1 0
                                    143 0 191 1 0 24 0 165 1 0 6 0 1 2 0 0 0 0
                                    1 2 6 228 229 230 1 1 6 231 229 1 2 0 20 20
                                    20 1 1 0 0 0 1 1 0 57 0 61 2 0 0 0 0 1 2 0
                                    0 0 143 1 2 0 0 0 242 1 1 0 243 20 1 1 0 65
                                    0 1 2 0 0 0 0 1 2 0 0 0 0 1 0 0 0 1 2 0 0 0
                                    0 1 3 11 226 0 218 226 1 3 12 227 0 219 227
                                    1 1 0 0 0 1 1 0 0 20 1 3 0 33 20 85 33 88 1
                                    0 33 0 62 2 0 65 0 0 1 1 0 216 0 1 1 0 158
                                    158 1 1 0 65 0 1 1 17 65 0 1 1 0 0 0 1 1 0
                                    17 0 44 1 6 14 0 19 0 0 147 1 0 0 147 1 2 0
                                    0 0 24 1 2 0 212 20 0 1 1 16 92 28 1 4 0 0
                                    0 0 0 0 1 5 17 0 20 20 20 20 0 1 2 0 0 234
                                    28 1 1 0 248 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0
                                    1 1 0 0 0 1 1 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0
                                    0 0 1 3 0 0 0 0 0 1 1 0 6 0 1 2 0 255 0 0 1
                                    1 0 0 20 1 2 0 0 0 0 1 1 0 256 0 1 1 0 0 0
                                    1 3 0 0 0 0 0 1 3 0 0 0 0 0 1 3 0 0 0 0 0 1
                                    1 0 156 0 1 1 0 156 20 1 2 0 0 158 0 1 2 0
                                    0 158 20 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0
                                    0 1 2 0 0 0 0 1 1 0 39 0 172 2 0 0 0 0 1 2
                                    0 0 0 0 1 2 0 0 0 0 1 4 0 0 0 0 0 0 1 1 0
                                    85 20 1 2 0 85 20 124 125 2 0 0 0 0 1 2 0 0
                                    0 0 1 1 15 212 0 1 1 6 237 0 1 1 14 212 0 1
                                    1 14 214 0 1 2 6 233 0 158 1 2 6 233 0 143
                                    1 1 15 233 0 1 2 0 65 0 143 1 2 0 65 0 158
                                    1 1 0 0 0 1 2 0 0 0 242 1 2 0 0 0 143 1 3
                                    17 0 20 20 0 1 2 0 0 0 0 1 1 0 33 0 1 2 0
                                    258 258 0 1 1 0 257 0 1 2 0 0 0 0 1 2 0 0 0
                                    0 1 1 0 65 0 1 1 0 24 0 1 0 0 143 1 2 0 92
                                    92 92 1 2 0 0 0 0 56 1 0 0 20 1 3 0 0 143
                                    20 33 209 1 0 0 0 1 1 0 0 0 1 2 0 65 0 143
                                    1 2 0 65 0 0 1 2 0 65 0 6 1 3 0 252 0 147
                                    85 1 3 0 253 20 147 85 1 2 0 20 20 147 1 2
                                    0 0 0 147 1 2 0 0 0 40 1 1 0 0 0 1 2 0 0 0
                                    143 1 1 0 0 0 1 1 0 220 0 1 1 0 85 85 1 3 0
                                    245 0 0 0 1 2 0 246 0 0 1 2 0 57 0 0 59 2 0
                                    212 20 0 1 1 0 0 0 1 1 17 65 0 1 2 8 0 0
                                    215 1 2 8 0 0 143 1 1 8 0 0 1 4 8 0 0 216
                                    20 143 1 4 8 0 0 158 0 143 1 4 6 0 0 215 40
                                    235 1 4 6 0 0 143 33 238 1 4 6 0 0 215 40
                                    239 1 4 6 0 0 143 33 234 1 3 0 0 0 156 20 1
                                    3 0 0 0 28 0 1 2 0 0 0 249 1 3 0 0 0 0 0 1
                                    2 0 0 0 180 181 3 0 0 0 20 20 1 3 0 0 0 215
                                    235 1 3 0 0 0 143 238 1 3 0 0 0 215 239 1 3
                                    0 0 0 143 234 1 3 0 0 0 216 239 1 3 0 0 0
                                    216 235 1 3 0 0 0 158 238 1 3 0 0 0 158 234
                                    1 1 0 33 0 1 1 0 0 0 1 1 0 0 0 1 3 0 0 158
                                    0 0 1 2 0 0 158 0 1 4 0 0 158 0 0 0 1 6 0 0
                                    158 0 0 0 0 0 1 5 0 0 158 0 0 0 0 1 7 0 0
                                    158 0 0 0 0 0 0 1 9 0 0 158 0 0 0 0 0 0 0 0
                                    1 8 0 0 158 0 0 0 0 0 0 0 1 10 0 0 158 0 0
                                    0 0 0 0 0 0 0 1 2 0 0 158 20 1 3 0 0 0 0 0
                                    1 1 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 1 0 0 0
                                    1 2 0 102 0 0 1 2 0 0 0 0 1 1 0 0 0 1 3 0
                                    33 20 85 33 86 1 0 0 0 1 1 0 0 0 1 2 0 0 0
                                    6 175 3 0 0 0 215 40 1 3 0 0 0 143 33 1 2 0
                                    0 0 143 174 2 0 0 0 215 1 1 0 0 0 1 1 1 14
                                    0 1 1 16 0 0 1 3 0 0 0 6 0 1 1 0 0 0 1 1 0
                                    0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0
                                    1 1 8 217 0 1 1 9 218 0 1 1 10 219 0 1 1 1
                                    0 220 1 1 0 65 0 1 2 7 0 0 0 1 2 7 0 0 0 1
                                    1 1 0 221 1 1 1 0 223 1 1 1 0 224 1 1 6 0
                                    241 1 1 0 0 14 16 1 0 0 17 54 1 0 5 0 11 1
                                    0 0 5 10 1 0 0 211 1 1 0 0 28 29 1 0 0 143
                                    1 1 0 0 6 9 1 0 0 0 1 1 0 0 24 206 1 0 109
                                    0 192 1 0 33 0 1 1 4 57 0 1 3 0 0 0 0 0 1 0
                                    0 33 1 1 0 0 0 1 1 0 0 20 1 2 0 0 0 0 1 2 0
                                    0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1 2 0 0 0 0 1
                                    1 0 65 158 1 1 0 20 20 1 1 0 0 0 1 1 0 0 0
                                    1 2 0 65 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0
                                    1 1 0 0 0 1 2 0 0 143 0 1 3 0 0 143 0 0 1 5
                                    0 0 143 0 0 0 0 1 4 0 0 143 0 0 0 1 2 0 0
                                    143 20 1 2 0 65 0 0 1 2 0 0 0 0 1 1 1 156
                                    20 1 1 1 156 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0
                                    0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1
                                    1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1 2 0
                                    0 0 0 1 2 0 0 0 24 1 2 0 0 0 211 1 2 0 0 0
                                    33 51 2 0 0 0 147 1 0 0 0 45 0 0 0 1 1 0 0
                                    147 1 0 0 0 1 1 0 0 147 1 1 0 0 0 1 1 0 0 0
                                    1 2 0 0 147 33 1 1 0 0 33 1 1 0 0 40 1 2 0
                                    0 147 40 1 0 0 0 36 2 0 0 0 0 1 1 0 0 0 1 1
                                    0 0 0 1 3 0 0 0 143 33 1 3 0 0 0 215 40 1 2
                                    0 0 0 215 1 2 0 0 0 143 1 1 0 0 0 1 1 0 0 0
                                    1 2 0 0 0 0 1 2 0 65 0 0 142 2 1 0 14 14 15
                                    2 0 0 0 0 60 2 0 0 0 0 1 1 0 0 0 187 2 0 0
                                    0 0 53 2 3 0 0 24 1 2 0 0 211 0 1 2 0 0 0
                                    211 1 2 0 0 0 0 52 2 0 0 24 0 1 2 0 0 33 0
                                    1 2 0 0 147 0 1)))))
           '|lookupComplete|)) 
