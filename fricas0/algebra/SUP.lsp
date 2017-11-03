
(PUT '|SUP;makeSUP;2$;1| '|SPADreplace| '(XLAM (|p|) |p|)) 

(SDEFUN |SUP;makeSUP;2$;1| ((|p| $) ($ |SparseUnivariatePolynomial| R)) |p|) 

(PUT '|SUP;unmakeSUP;2$;2| '|SPADreplace| '(XLAM (|sp|) |sp|)) 

(SDEFUN |SUP;unmakeSUP;2$;2| ((|sp| |SparseUnivariatePolynomial| R) ($ $)) |sp|) 

(SDEFUN |SUP;^;$Pi$;3| ((|p| $) (|np| |PositiveInteger|) ($ $))
        (SPADCALL |p| |np| (QREFELT $ 12))) 

(SDEFUN |SUP;^;$Nni$;4| ((|p| $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG
         ((|rn| #1=(|NonNegativeInteger|)) (|qn| #2=(|NonNegativeInteger|))
          (|rec| (|Record| (|:| |quotient| #2#) (|:| |remainder| #1#)))
          (#3=#:G760 NIL) (|t| NIL) (#4=#:G759 NIL) (#5=#:G758 NIL) (|y| ($))
          (|cc| (R)))
         (SEQ
          (EXIT
           (COND ((ZEROP |n|) (|spadConstant| $ 15))
                 ((NULL |p|) (|spadConstant| $ 16)) ((EQL |n| 1) |p|)
                 (#6='T
                  (COND
                   ((NULL (CDR |p|))
                    (COND
                     ((SPADCALL
                       (LETT |cc|
                             (SPADCALL (QCDR (|SPADfirst| |p|)) |n|
                                       (QREFELT $ 17))
                             . #7=(|SUP;^;$Nni$;4|))
                       (QREFELT $ 19))
                      (|spadConstant| $ 16))
                     (#6#
                      (LIST (CONS (* |n| (QCAR (|SPADfirst| |p|))) |cc|)))))
                   ((< (SPADCALL (QREFELT $ 20)) 3)
                    (SPADCALL |p| |n| (QREFELT $ 22)))
                   (#6#
                    (SEQ (LETT |y| (|spadConstant| $ 15) . #7#)
                         (LETT |rec| (DIVIDE2 |n| (SPADCALL (QREFELT $ 20)))
                               . #7#)
                         (LETT |qn| (QCAR |rec|) . #7#)
                         (LETT |rn| (QCDR |rec|) . #7#)
                         (SEQ G190 NIL
                              (SEQ
                               (COND
                                ((EQL |rn| 1)
                                 (LETT |y| (SPADCALL |y| |p| (QREFELT $ 23))
                                       . #7#)))
                               (COND
                                ((SPADCALL |rn| 1 (QREFELT $ 24))
                                 (LETT |y|
                                       (SPADCALL |y|
                                                 (SPADCALL
                                                  (LIST (|SPADfirst| |p|))
                                                  (CDR |p|) |rn|
                                                  (QREFELT $ 25))
                                                 (QREFELT $ 23))
                                       . #7#)))
                               (EXIT
                                (COND
                                 ((ZEROP |qn|)
                                  (PROGN (LETT #5# |y| . #7#) (GO #8=#:G757)))
                                 ('T
                                  (SEQ
                                   (LETT |p|
                                         (PROGN
                                          (LETT #4# NIL . #7#)
                                          (SEQ (LETT |t| NIL . #7#)
                                               (LETT #3# |p| . #7#) G190
                                               (COND
                                                ((OR (ATOM #3#)
                                                     (PROGN
                                                      (LETT |t| (CAR #3#)
                                                            . #7#)
                                                      NIL))
                                                 (GO G191)))
                                               (SEQ
                                                (EXIT
                                                 (LETT #4#
                                                       (CONS
                                                        (CONS
                                                         (* (QCAR |t|)
                                                            (SPADCALL
                                                             (QREFELT $ 20)))
                                                         (SPADCALL (QCDR |t|)
                                                                   (QREFELT $
                                                                            26)))
                                                        #4#)
                                                       . #7#)))
                                               (LETT #3# (CDR #3#) . #7#)
                                               (GO G190) G191
                                               (EXIT (NREVERSE #4#))))
                                         . #7#)
                                   (LETT |rec|
                                         (DIVIDE2 |qn|
                                                  (SPADCALL (QREFELT $ 20)))
                                         . #7#)
                                   (LETT |qn| (QCAR |rec|) . #7#)
                                   (EXIT (LETT |rn| (QCDR |rec|) . #7#)))))))
                              NIL (GO G190) G191 (EXIT NIL))
                         (EXIT |y|)))))))
          #8# (EXIT #5#)))) 

(PUT '|SUP;zero?;$B;5| '|SPADreplace| 'NULL) 

(SDEFUN |SUP;zero?;$B;5| ((|p| $) ($ |Boolean|)) (NULL |p|)) 

(SDEFUN |SUP;one?;$B;6| ((|p| $) ($ |Boolean|))
        (COND
         ((OR (OR (NULL |p|) (NULL (NULL (CDR |p|))))
              (NULL (ZEROP (QCAR (|SPADfirst| |p|)))))
          NIL)
         ('T
          (SPADCALL (QCDR (|SPADfirst| |p|)) (|spadConstant| $ 28)
                    (QREFELT $ 29))))) 

(SDEFUN |SUP;ground?;$B;7| ((|p| $) ($ |Boolean|))
        (COND ((NULL |p|) 'T)
              ((NULL (CDR |p|)) (ZEROP (QCAR (|SPADfirst| |p|)))) ('T NIL))) 

(SDEFUN |SUP;multiplyExponents;$Nni$;8|
        ((|p| $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG ((#1=#:G775 NIL) (|u| NIL) (#2=#:G774 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|SUP;multiplyExponents;$Nni$;8|))
                 (SEQ (LETT |u| NIL . #3#) (LETT #1# |p| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |u| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (CONS (* (QCAR |u|) |n|) (QCDR |u|)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(SDEFUN |SUP;divideExponents;$NniU;9|
        ((|p| $) (|n| |NonNegativeInteger|) ($ |Union| $ #1="failed"))
        (SPROG
         ((#2=#:G784 NIL) (|u| (|Union| $ #1#))
          (|m| (|Union| (|Integer|) "failed")))
         (SEQ
          (COND ((NULL |p|) (CONS 0 |p|))
                (#3='T
                 (SEQ
                  (LETT |m|
                        (SPADCALL (QCAR (|SPADfirst| |p|)) |n| (QREFELT $ 35))
                        . #4=(|SUP;divideExponents;$NniU;9|))
                  (EXIT
                   (COND ((QEQCAR |m| 1) (CONS 1 "failed"))
                         (#3#
                          (SEQ
                           (LETT |u| (SPADCALL (CDR |p|) |n| (QREFELT $ 36))
                                 . #4#)
                           (EXIT
                            (COND ((QEQCAR |u| 1) (CONS 1 "failed"))
                                  (#3#
                                   (CONS 0
                                         (CONS
                                          (CONS
                                           (PROG1 (LETT #2# (QCDR |m|) . #4#)
                                             (|check_subtype2| (>= #2# 0)
                                                               '(|NonNegativeInteger|)
                                                               '(|Integer|)
                                                               #2#))
                                           (QCDR (|SPADfirst| |p|)))
                                          (QCDR |u|)))))))))))))))) 

(SDEFUN |SUP;karatsubaDivide;$NniR;10|
        ((|p| $) (|n| |NonNegativeInteger|)
         ($ |Record| (|:| |quotient| $) (|:| |remainder| $)))
        (SPROG
         ((|highp| (|Rep|)) (#1=#:G794 NIL) (|lowp| (|Rep|)) (#2=#:G802 NIL)
          (|t| (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))))
         (SEQ
          (COND ((ZEROP |n|) (CONS |p| (|spadConstant| $ 16)))
                ('T
                 (SEQ (LETT |lowp| |p| . #3=(|SUP;karatsubaDivide;$NniR;10|))
                      (LETT |highp| NIL . #3#)
                      (SEQ
                       (EXIT
                        (SEQ G190 NIL
                             (SEQ
                              (COND
                               ((NULL |lowp|)
                                (PROGN
                                 (LETT #2# |$NoValue| . #3#)
                                 (GO #4=#:G797))))
                              (LETT |t| (|SPADfirst| |lowp|) . #3#)
                              (COND
                               ((< (QCAR |t|) |n|)
                                (PROGN (LETT #2# |$NoValue| . #3#) (GO #4#))))
                              (LETT |lowp| (CDR |lowp|) . #3#)
                              (EXIT
                               (LETT |highp|
                                     (CONS
                                      (CONS
                                       (PROG2
                                           (LETT #1#
                                                 (SPADCALL (QCAR |t|) |n|
                                                           (QREFELT $ 38))
                                                 . #3#)
                                           (QCDR #1#)
                                         (|check_union2| (QEQCAR #1# 0)
                                                         (|NonNegativeInteger|)
                                                         (|Union|
                                                          (|NonNegativeInteger|)
                                                          "failed")
                                                         #1#))
                                       (QCDR |t|))
                                      |highp|)
                                     . #3#)))
                             NIL (GO G190) G191 (EXIT NIL)))
                       #4# (EXIT #2#))
                      (EXIT (CONS (REVERSE |highp|) |lowp|)))))))) 

(SDEFUN |SUP;shiftRight;$Nni$;11| ((|p| $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG ((#1=#:G805 NIL) (#2=#:G810 NIL) (|t| NIL) (#3=#:G809 NIL))
               (SEQ
                (PROGN
                 (LETT #3# NIL . #4=(|SUP;shiftRight;$Nni$;11|))
                 (SEQ (LETT |t| NIL . #4#) (LETT #2# |p| . #4#) G190
                      (COND
                       ((OR (ATOM #2#) (PROGN (LETT |t| (CAR #2#) . #4#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #3#
                              (CONS
                               (CONS
                                (PROG2
                                    (LETT #1#
                                          (SPADCALL (QCAR |t|) |n|
                                                    (QREFELT $ 38))
                                          . #4#)
                                    (QCDR #1#)
                                  (|check_union2| (QEQCAR #1# 0)
                                                  (|NonNegativeInteger|)
                                                  (|Union|
                                                   (|NonNegativeInteger|)
                                                   "failed")
                                                  #1#))
                                (QCDR |t|))
                               #3#)
                              . #4#)))
                      (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                      (EXIT (NREVERSE #3#))))))) 

(SDEFUN |SUP;shiftLeft;$Nni$;12| ((|p| $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG ((#1=#:G815 NIL) (|t| NIL) (#2=#:G814 NIL))
               (SEQ
                (PROGN
                 (LETT #2# NIL . #3=(|SUP;shiftLeft;$Nni$;12|))
                 (SEQ (LETT |t| NIL . #3#) (LETT #1# |p| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2#
                              (CONS (CONS (+ (QCAR |t|) |n|) (QCDR |t|)) #2#)
                              . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))))) 

(PUT '|SUP;univariate;2$;13| '|SPADreplace| '(XLAM (|p|) |p|)) 

(SDEFUN |SUP;univariate;2$;13| ((|p| $) ($ |SparseUnivariatePolynomial| R)) |p|) 

(PUT '|SUP;multivariate;$Saos$;14| '|SPADreplace| '(XLAM (|sup| |v|) |sup|)) 

(SDEFUN |SUP;multivariate;$Saos$;14|
        ((|sup| |SparseUnivariatePolynomial| R) (|v| |SingletonAsOrderedSet|)
         ($ $))
        |sup|) 

(SDEFUN |SUP;univariate;$SaosSup;15|
        ((|p| $) (|v| |SingletonAsOrderedSet|)
         ($ |SparseUnivariatePolynomial| $))
        (COND ((SPADCALL |p| (QREFELT $ 27)) (|spadConstant| $ 47))
              ('T
               (SPADCALL
                (SPADCALL
                 (SPADCALL (SPADCALL |p| (QREFELT $ 48)) (QREFELT $ 49))
                 (SPADCALL |p| (QREFELT $ 50)) (QREFELT $ 51))
                (SPADCALL (SPADCALL |p| (QREFELT $ 52)) |v| (QREFELT $ 54))
                (QREFELT $ 55))))) 

(SDEFUN |SUP;multivariate;SupSaos$;16|
        ((|supp| |SparseUnivariatePolynomial| $) (|v| |SingletonAsOrderedSet|)
         ($ $))
        (SPROG ((|lc| ($)))
               (SEQ
                (COND ((SPADCALL |supp| (QREFELT $ 56)) (|spadConstant| $ 16))
                      (#1='T
                       (SEQ
                        (LETT |lc| (SPADCALL |supp| (QREFELT $ 57))
                              |SUP;multivariate;SupSaos$;16|)
                        (EXIT
                         (COND
                          ((SPADCALL (SPADCALL |lc| (QREFELT $ 50)) 0
                                     (QREFELT $ 24))
                           (|error| "bad form polynomial"))
                          (#1#
                           (SPADCALL
                            (SPADCALL (SPADCALL |lc| (QREFELT $ 48))
                                      (SPADCALL |supp| (QREFELT $ 58))
                                      (QREFELT $ 59))
                            (SPADCALL (SPADCALL |supp| (QREFELT $ 60)) |v|
                                      (QREFELT $ 61))
                            (QREFELT $ 62))))))))))) 

(SDEFUN |SUP;squareFreePolynomial;SupF;17|
        ((|pp| . #1=(|SparseUnivariatePolynomial| $)) ($ |Factored| #1#))
        (SPADCALL |pp| (QREFELT $ 65))) 

(SDEFUN |SUP;factorPolynomial;SupF;18|
        ((|pp| . #1=(|SparseUnivariatePolynomial| $)) ($ |Factored| #1#))
        (SPADCALL |pp| (QREFELT $ 71))) 

(SDEFUN |SUP;factorSquareFreePolynomial;SupF;19|
        ((|pp| . #1=(|SparseUnivariatePolynomial| $)) ($ |Factored| #1#))
        (SPADCALL |pp| (QREFELT $ 71))) 

(SDEFUN |SUP;factor;$F;20| ((|p| $) ($ |Factored| $))
        (SPADCALL |p| (QREFELT $ 76))) 

(SDEFUN |SUP;solveLinearPolynomialEquation;LSupU;21|
        ((|lpp| . #1=(|List| #2=(|SparseUnivariatePolynomial| $))) (|pp| . #2#)
         ($ |Union| #1# "failed"))
        (SPADCALL |lpp| |pp| (QREFELT $ 82))) 

(SDEFUN |SUP;init_one| (($ |Void|))
        (SEQ
         (COND ((QREFELT $ 88) "done")
               ('T
                (SEQ (QREFELT $ 86)
                     (COND
                      ((|HasCategory| (QREFELT $ 6) '(|Ring|))
                       (SETELT $ 86
                               (SPADCALL (|spadConstant| $ 28)
                                         (QREFELT $ 89)))))
                     (QREFELT $ 87)
                     (COND
                      ((|HasCategory| (QREFELT $ 6) '(|Monoid|))
                       (SETELT $ 87 (|spadConstant| $ 28))))
                     (EXIT (SETELT $ 88 'T))))))) 

(SDEFUN |SUP;toutput|
        ((|t1| |Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| R))
         (|v| . #1=(|OutputForm|)) ($ |OutputForm|))
        (SPROG ((|mon| #1#))
               (SEQ (COND ((NULL (QREFELT $ 88)) (|SUP;init_one| $)))
                    (EXIT
                     (COND
                      ((EQL (QCAR |t1|) 0)
                       (SPADCALL (QCDR |t1|) (QREFELT $ 91)))
                      (#2='T
                       (SEQ
                        (COND
                         ((EQL (QCAR |t1|) 1)
                          (LETT |mon| |v| . #3=(|SUP;toutput|)))
                         (#2#
                          (LETT |mon|
                                (SPADCALL |v|
                                          (SPADCALL (QCAR |t1|) (QREFELT $ 92))
                                          (QREFELT $ 93))
                                . #3#)))
                        (EXIT
                         (COND
                          ((SPADCALL (QCDR |t1|) (|spadConstant| $ 37)
                                     (QREFELT $ 29))
                           (SPADCALL (QREFELT $ 94)))
                          ((SPADCALL (QCDR |t1|) (QREFELT $ 87) (QREFELT $ 29))
                           |mon|)
                          (#2#
                           (SEQ
                            (COND
                             ((SPADCALL (QCDR |t1|) (QREFELT $ 86)
                                        (QREFELT $ 29))
                              (COND
                               ((SPADCALL (SPADCALL (QCDR |t1|) (QREFELT $ 91))
                                          (SPADCALL -1 (QREFELT $ 95))
                                          (QREFELT $ 96))
                                (EXIT (SPADCALL |mon| (QREFELT $ 97)))))))
                            (EXIT
                             (SPADCALL (SPADCALL (QCDR |t1|) (QREFELT $ 91))
                                       |mon| (QREFELT $ 98)))))))))))))) 

(SDEFUN |SUP;outputForm;$2Of;24| ((|p| $) (|v| |OutputForm|) ($ |OutputForm|))
        (SPROG
         ((|l| (|List| (|OutputForm|))) (#1=#:G874 NIL) (|t| NIL)
          (#2=#:G873 NIL))
         (SEQ
          (LETT |l|
                (PROGN
                 (LETT #2# NIL . #3=(|SUP;outputForm;$2Of;24|))
                 (SEQ (LETT |t| NIL . #3#) (LETT #1# |p| . #3#) G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |t| (CAR #1#) . #3#) NIL))
                        (GO G191)))
                      (SEQ
                       (EXIT
                        (LETT #2# (CONS (|SUP;toutput| |t| |v| $) #2#) . #3#)))
                      (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                . #3#)
          (EXIT
           (COND ((NULL |l|) (SPADCALL 0 (QREFELT $ 95)))
                 ('T (SPADCALL (ELT $ 99) |l| (QREFELT $ 102)))))))) 

(SDEFUN |SUP;coerce;$Of;25| ((|p| $) ($ |OutputForm|))
        (SPADCALL |p| (SPADCALL "?" (QREFELT $ 105)) (QREFELT $ 103))) 

(SDEFUN |SUP;elt;$2R;26| ((|p| $) (|val| R) ($ R))
        (SPROG
         ((#1=#:G880 NIL) (|co| (R)) (#2=#:G877 NIL)
          (|n| (|NonNegativeInteger|)) (#3=#:G884 NIL) (|tm| NIL))
         (SEQ
          (COND ((NULL |p|) (|spadConstant| $ 37))
                (#4='T
                 (SEQ
                  (LETT |co| (QCDR (|SPADfirst| |p|)) . #5=(|SUP;elt;$2R;26|))
                  (LETT |n| (QCAR (|SPADfirst| |p|)) . #5#)
                  (SEQ (LETT |tm| NIL . #5#) (LETT #3# (CDR |p|) . #5#) G190
                       (COND
                        ((OR (ATOM #3#)
                             (PROGN (LETT |tm| (CAR #3#) . #5#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |co|
                               (SPADCALL
                                (SPADCALL |co|
                                          (SPADCALL |val|
                                                    (PROG1
                                                        (LETT #2#
                                                              (- |n|
                                                                 (LETT |n|
                                                                       (QCAR
                                                                        |tm|)
                                                                       . #5#))
                                                              . #5#)
                                                      (|check_subtype2|
                                                       (> #2# 0)
                                                       '(|PositiveInteger|)
                                                       '(|Integer|) #2#))
                                                    (QREFELT $ 107))
                                          (QREFELT $ 108))
                                (QCDR |tm|) (QREFELT $ 109))
                               . #5#)))
                       (LETT #3# (CDR #3#) . #5#) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND ((EQL |n| 0) |co|)
                         (#4#
                          (SPADCALL |co|
                                    (SPADCALL |val|
                                              (PROG1 (LETT #1# |n| . #5#)
                                                (|check_subtype2| (> #1# 0)
                                                                  '(|PositiveInteger|)
                                                                  '(|NonNegativeInteger|)
                                                                  #1#))
                                              (QREFELT $ 107))
                                    (QREFELT $ 108))))))))))) 

(SDEFUN |SUP;elt;3$;27| ((|p| $) (|val| $) ($ $))
        (SPROG
         ((#1=#:G889 NIL) (|coef| ($)) (#2=#:G886 NIL)
          (|n| (|NonNegativeInteger|)) (#3=#:G893 NIL) (|tm| NIL))
         (SEQ
          (COND ((NULL |p|) (|spadConstant| $ 16))
                (#4='T
                 (SEQ
                  (LETT |coef|
                        (SPADCALL (QCDR (|SPADfirst| |p|)) (QREFELT $ 49))
                        . #5=(|SUP;elt;3$;27|))
                  (LETT |n| (QCAR (|SPADfirst| |p|)) . #5#)
                  (SEQ (LETT |tm| NIL . #5#) (LETT #3# (CDR |p|) . #5#) G190
                       (COND
                        ((OR (ATOM #3#)
                             (PROGN (LETT |tm| (CAR #3#) . #5#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |coef|
                               (SPADCALL
                                (SPADCALL |coef|
                                          (SPADCALL |val|
                                                    (PROG1
                                                        (LETT #2#
                                                              (- |n|
                                                                 (LETT |n|
                                                                       (QCAR
                                                                        |tm|)
                                                                       . #5#))
                                                              . #5#)
                                                      (|check_subtype2|
                                                       (> #2# 0)
                                                       '(|PositiveInteger|)
                                                       '(|Integer|) #2#))
                                                    (QREFELT $ 14))
                                          (QREFELT $ 23))
                                (SPADCALL (QCDR |tm|) (QREFELT $ 49))
                                (QREFELT $ 62))
                               . #5#)))
                       (LETT #3# (CDR #3#) . #5#) (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND ((EQL |n| 0) |coef|)
                         (#4#
                          (SPADCALL |coef|
                                    (SPADCALL |val|
                                              (PROG1 (LETT #1# |n| . #5#)
                                                (|check_subtype2| (> #1# 0)
                                                                  '(|PositiveInteger|)
                                                                  '(|NonNegativeInteger|)
                                                                  #1#))
                                              (QREFELT $ 14))
                                    (QREFELT $ 23))))))))))) 

(SDEFUN |SUP;monicDivide;2$R;28|
        ((|p1| $) (|p2| $) ($ |Record| (|:| |quotient| $) (|:| |remainder| $)))
        (SPROG
         ((|rout| (|Rep|)) (#1=#:G909 NIL)
          (|u| (|Union| (|NonNegativeInteger|) "failed"))
          (|n| (|NonNegativeInteger|)))
         (SEQ
          (COND ((NULL |p2|) (|error| "monicDivide: division by 0"))
                ((SPADCALL (SPADCALL |p2| (QREFELT $ 48)) (|spadConstant| $ 28)
                           (QREFELT $ 112))
                 (|error| "Divisor Not Monic"))
                ((SPADCALL |p2| (|spadConstant| $ 15) (QREFELT $ 113))
                 (CONS |p1| (|spadConstant| $ 16)))
                (#2='T
                 (COND
                  ((NULL |p1|)
                   (CONS (|spadConstant| $ 16) (|spadConstant| $ 16)))
                  ((< (SPADCALL |p1| (QREFELT $ 50))
                      (LETT |n| (SPADCALL |p2| (QREFELT $ 50))
                            . #3=(|SUP;monicDivide;2$R;28|)))
                   (CONS (|spadConstant| $ 16) |p1|))
                  (#2#
                   (SEQ (LETT |rout| NIL . #3#) (LETT |p2| (CDR |p2|) . #3#)
                        (SEQ
                         (EXIT
                          (SEQ G190
                               (COND ((NULL (NULL (NULL |p1|))) (GO G191)))
                               (SEQ
                                (LETT |u|
                                      (SPADCALL (QCAR (|SPADfirst| |p1|)) |n|
                                                (QREFELT $ 38))
                                      . #3#)
                                (EXIT
                                 (COND
                                  ((QEQCAR |u| 1)
                                   (PROGN
                                    (LETT #1# |$NoValue| . #3#)
                                    (GO #4=#:G902)))
                                  ('T
                                   (SEQ
                                    (LETT |rout|
                                          (CONS
                                           (CONS (QCDR |u|)
                                                 (QCDR (|SPADfirst| |p1|)))
                                           |rout|)
                                          . #3#)
                                    (EXIT
                                     (LETT |p1|
                                           (SPADCALL (CDR |p1|)
                                                     (QCAR
                                                      (|SPADfirst| |rout|))
                                                     (QCDR
                                                      (|SPADfirst| |rout|))
                                                     |p2| (QREFELT $ 114))
                                           . #3#)))))))
                               NIL (GO G190) G191 (EXIT NIL)))
                         #4# (EXIT #1#))
                        (EXIT (CONS (NREVERSE |rout|) |p1|)))))))))) 

(SDEFUN |SUP;discriminant;$R;29| ((|p| $) ($ R)) (SPADCALL |p| (QREFELT $ 117))) 

(SDEFUN |SUP;subResultantGcd;3$;30| ((|p1| $) (|p2| $) ($ $))
        (SPADCALL |p1| |p2| (QREFELT $ 119))) 

(SDEFUN |SUP;resultant;2$R;31| ((|p1| $) (|p2| $) ($ R))
        (SPADCALL |p1| |p2| (QREFELT $ 121))) 

(SDEFUN |SUP;content;$R;32| ((|p| $) ($ R))
        (SPROG
         ((#1=#:G915 NIL) (#2=#:G914 (R)) (#3=#:G916 (R)) (#4=#:G919 NIL)
          (|tm| NIL))
         (SEQ
          (COND ((NULL |p|) (|spadConstant| $ 37))
                (#5='T
                 (PROGN
                  (LETT #1# NIL . #6=(|SUP;content;$R;32|))
                  (SEQ (LETT |tm| NIL . #6#) (LETT #4# |p| . #6#) G190
                       (COND
                        ((OR (ATOM #4#)
                             (PROGN (LETT |tm| (CAR #4#) . #6#) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (PROGN
                          (LETT #3# (QCDR |tm|) . #6#)
                          (COND
                           (#1#
                            (LETT #2# (SPADCALL #2# #3# (QREFELT $ 123))
                                  . #6#))
                           ('T
                            (PROGN
                             (LETT #2# #3# . #6#)
                             (LETT #1# 'T . #6#)))))))
                       (LETT #4# (CDR #4#) . #6#) (GO G190) G191 (EXIT NIL))
                  (COND (#1# #2#) (#5# (|spadConstant| $ 37))))))))) 

(SDEFUN |SUP;primitivePart;2$;33| ((|p| $) ($ $))
        (SPROG ((#1=#:G922 NIL) (|ct| (R)))
               (SEQ
                (COND ((NULL |p|) |p|)
                      ('T
                       (SEQ
                        (LETT |ct| (SPADCALL |p| (QREFELT $ 124))
                              . #2=(|SUP;primitivePart;2$;33|))
                        (EXIT
                         (SPADCALL
                          (PROG2
                              (LETT #1# (SPADCALL |p| |ct| (QREFELT $ 125))
                                    . #2#)
                              (QCDR #1#)
                            (|check_union2| (QEQCAR #1# 0) $
                                            (|Union| $ "failed") #1#))
                          (QREFELT $ 126))))))))) 

(SDEFUN |SUP;gcd;3$;34| ((|p1| $) (|p2| $) ($ $))
        (SPADCALL |p1| |p2| (QREFELT $ 128))) 

(SDEFUN |SUP;divide;2$R;35|
        ((|p1| $) (|p2| $) ($ |Record| (|:| |quotient| $) (|:| |remainder| $)))
        (SPROG
         ((|rout| ($)) (#1=#:G944 NIL)
          (|u| (|Union| (|NonNegativeInteger|) "failed"))
          (|n| (|NonNegativeInteger|)) (|ct| (R)))
         (SEQ
          (COND ((SPADCALL |p2| (QREFELT $ 27)) (|error| "Division by 0"))
                ((SPADCALL |p2| (|spadConstant| $ 15) (QREFELT $ 113))
                 (CONS |p1| (|spadConstant| $ 16)))
                ('T
                 (SEQ
                  (LETT |ct|
                        (SPADCALL (QCDR (|SPADfirst| |p2|)) (QREFELT $ 130))
                        . #2=(|SUP;divide;2$R;35|))
                  (LETT |n| (QCAR (|SPADfirst| |p2|)) . #2#)
                  (LETT |p2| (CDR |p2|) . #2#) (LETT |rout| NIL . #2#)
                  (SEQ
                   (EXIT
                    (SEQ G190
                         (COND
                          ((NULL
                            (SPADCALL |p1| (|spadConstant| $ 16)
                                      (QREFELT $ 131)))
                           (GO G191)))
                         (SEQ
                          (LETT |u|
                                (SPADCALL (QCAR (|SPADfirst| |p1|)) |n|
                                          (QREFELT $ 38))
                                . #2#)
                          (EXIT
                           (COND
                            ((QEQCAR |u| 1)
                             (PROGN
                              (LETT #1# |$NoValue| . #2#)
                              (GO #3=#:G940)))
                            ('T
                             (SEQ
                              (LETT |rout|
                                    (CONS
                                     (CONS (QCDR |u|)
                                           (SPADCALL |ct|
                                                     (QCDR (|SPADfirst| |p1|))
                                                     (QREFELT $ 108)))
                                     |rout|)
                                    . #2#)
                              (EXIT
                               (LETT |p1|
                                     (SPADCALL (CDR |p1|)
                                               (QCAR (|SPADfirst| |rout|))
                                               (QCDR (|SPADfirst| |rout|)) |p2|
                                               (QREFELT $ 114))
                                     . #2#)))))))
                         NIL (GO G190) G191 (EXIT NIL)))
                   #3# (EXIT #1#))
                  (EXIT (CONS (NREVERSE |rout|) |p1|)))))))) 

(SDEFUN |SUP;/;$R$;36| ((|p| $) (|co| R) ($ $))
        (SPADCALL (SPADCALL |co| (QREFELT $ 130)) |p| (QREFELT $ 133))) 

(DECLAIM (NOTINLINE |SparseUnivariatePolynomial;|)) 

(DEFUN |SparseUnivariatePolynomial| (#1=#:G1000)
  (SPROG NIL
         (PROG (#2=#:G1001)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (LIST (|devaluate| #1#))
                                               (HGET |$ConstructorCache|
                                                     '|SparseUnivariatePolynomial|)
                                               '|domainEqualList|)
                    . #3=(|SparseUnivariatePolynomial|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (|SparseUnivariatePolynomial;| #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SparseUnivariatePolynomial|)))))))))) 

(DEFUN |SparseUnivariatePolynomial;| (|#1|)
  (SPROG
   ((#1=#:G999 NIL) (|pv$| NIL) (#2=#:G991 NIL) (#3=#:G992 NIL) (#4=#:G993 NIL)
    (#5=#:G994 NIL) (#6=#:G995 NIL) (#7=#:G996 NIL) (#8=#:G997 NIL)
    (#9=#:G998 NIL) ($ NIL) (|dv$| NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #10=(|SparseUnivariatePolynomial|))
    (LETT |dv$| (LIST '|SparseUnivariatePolynomial| DV$1) . #10#)
    (LETT $ (GETREFV 178) . #10#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| |#1|
                                                       '(|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (|HasCategory| |#1| '(|Ring|))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Fraction|
                                                          (|Integer|))))
                                        (|HasCategory| |#1|
                                                       '(|RetractableTo|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|canonicalUnitNormal|))
                                        (|HasCategory| |#1| '(|Comparable|))
                                        (|HasCategory| |#1|
                                                       '(|LinearlyExplicitOver|
                                                         (|Integer|)))
                                        (|HasCategory| |#1|
                                                       '(|PolynomialFactorizationExplicit|))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|ConvertibleTo|
                                                          (|InputForm|)))
                                         (|HasCategory|
                                          (|SingletonAsOrderedSet|)
                                          '(|ConvertibleTo| (|InputForm|))))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (|HasCategory| |#1| '(|Field|))
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (|HasCategory| |#1| '(|EntireRing|))
                                        (LETT #9#
                                              (|HasCategory| |#1|
                                                             '(|GcdDomain|))
                                              . #10#)
                                        (OR (|HasCategory| |#1| '(|Field|)) #9#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         #9#)
                                        (LETT #8#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              . #10#)
                                        (OR (|HasCategory| |#1| '(|Field|)) #9#
                                            #8#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (|HasCategory| |#1| '(|StepThrough|))
                                        (|HasCategory| |#1|
                                                       '(|PartialDifferentialRing|
                                                         (|Symbol|)))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|RetractableTo|
                                                          (|Fraction|
                                                           (|Integer|)))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (LETT #7#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|PatternMatchable|
                                                                (|Float|)))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
                                                '(|PatternMatchable|
                                                  (|Float|))))
                                              . #10#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          #9#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          #8#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Float|)))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Float|))))
                                         #7#)
                                        (LETT #6#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|PatternMatchable|
                                                                (|Integer|)))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
                                                '(|PatternMatchable|
                                                  (|Integer|))))
                                              . #10#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          #9#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          #8#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PatternMatchable|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|PatternMatchable| (|Integer|))))
                                         #6#)
                                        (LETT #5#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Float|))))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
                                                '(|ConvertibleTo|
                                                  (|Pattern| (|Float|)))))
                                              . #10#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          #9#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          #8#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Float|))))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Float|)))))
                                         #5#)
                                        (LETT #4#
                                              (AND
                                               (|HasCategory| |#1|
                                                              '(|ConvertibleTo|
                                                                (|Pattern|
                                                                 (|Integer|))))
                                               (|HasCategory| |#1| '(|Ring|))
                                               (|HasCategory|
                                                (|SingletonAsOrderedSet|)
                                                '(|ConvertibleTo|
                                                  (|Pattern| (|Integer|)))))
                                              . #10#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|LinearlyExplicitOver|
                                                           (|Integer|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicZero|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1| '(|Field|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          #9#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          #8#
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|ConvertibleTo|
                                                           (|Pattern|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|PolynomialFactorizationExplicit|))
                                          (|HasCategory|
                                           (|SingletonAsOrderedSet|)
                                           '(|ConvertibleTo|
                                             (|Pattern| (|Integer|)))))
                                         #4#)
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              . #10#)
                                        (OR #3# (|HasCategory| |#1| '(|Field|))
                                            #9# #8#
                                            (|HasCategory| |#1|
                                                           '(|PolynomialFactorizationExplicit|)))
                                        (OR #3# #9# #8#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|LinearlyExplicitOver|
                                                          (|Integer|)))
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #3#
                                         (|HasCategory| |#1| '(|EntireRing|))
                                         (|HasCategory| |#1| '(|Field|)) #9#
                                         #8#
                                         (|HasCategory| |#1|
                                                        '(|PolynomialFactorizationExplicit|))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasCategory| |#1| '(|Ring|)))
                                        (|HasCategory| |#1| '(|AbelianMonoid|))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|CancellationAbelianMonoid|))
                                              . #10#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianMonoid|)))
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
                                         #2#)
                                        (OR
                                         (|HasCategory| |#1| '(|AbelianGroup|))
                                         #2#)))
                    . #10#))
    (|haddProp| |$ConstructorCache| '|SparseUnivariatePolynomial| (LIST DV$1)
                (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (AND (|HasCategory| $ '(|CommutativeRing|))
         (|augmentPredVector| $ 2199023255552))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|PolynomialFactorizationExplicit|))
                (|HasCategory| $ '(|CharacteristicNonZero|)))
           . #10#)
     (|augmentPredVector| $ 4398046511104))
    (AND (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#)
         (|augmentPredVector| $ 8796093022208))
    (AND
     (OR (|HasCategory| |#1| '(|EntireRing|))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 17592186044416))
    (AND
     (OR (AND #3# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))) #9#
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 35184372088832))
    (AND
     (OR (|HasCategory| |#1| '(|RetractableTo| (|Integer|)))
         (AND #3# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| $ 70368744177664))
    (AND
     (OR (AND #3# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|SemiRing|)))
     (|augmentPredVector| $ 140737488355328))
    (AND
     (OR (AND #3# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|Ring|)))
     (|augmentPredVector| $ 281474976710656))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianMonoid|))
         (AND #3# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianMonoid|)))
     (|augmentPredVector| $ 562949953421312))
    (AND
     (OR #2# (AND #3# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|)))
     (|augmentPredVector| $ 1125899906842624))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianGroup|))
         (AND #3# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|)))
     (|augmentPredVector| $ 2251799813685248))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 7
              (|List|
               (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| |#1|))))
    (COND
     ((|HasCategory| |#1| '(|FieldOfPrimeCharacteristic|))
      (PROGN
       (QSETREFV $ 14 (CONS (|dispatchFunction| |SUP;^;$Pi$;3|) $))
       (QSETREFV $ 12 (CONS (|dispatchFunction| |SUP;^;$Nni$;4|) $)))))
    (COND
     ((|testBitVector| |pv$| 12)
      (QSETREFV $ 30 (CONS (|dispatchFunction| |SUP;one?;$B;6|) $))))
    (COND
     ((|HasCategory| |#1| '(|FiniteFieldCategory|))
      (COND
       ((|testBitVector| |pv$| 10)
        (PROGN
         (QSETREFV $ 67
                   (CONS
                    (|dispatchFunction| |SUP;squareFreePolynomial;SupF;17|) $))
         (QSETREFV $ 72
                   (CONS (|dispatchFunction| |SUP;factorPolynomial;SupF;18|)
                         $))
         (QSETREFV $ 73
                   (CONS
                    (|dispatchFunction|
                     |SUP;factorSquareFreePolynomial;SupF;19|)
                    $))
         (QSETREFV $ 78 (CONS (|dispatchFunction| |SUP;factor;$F;20|) $))
         (QSETREFV $ 85
                   (CONS
                    (|dispatchFunction|
                     |SUP;solveLinearPolynomialEquation;LSupU;21|)
                    $)))))))
    (QSETREFV $ 86 (|spadConstant| $ 37))
    (QSETREFV $ 87 (|spadConstant| $ 37))
    (QSETREFV $ 88 NIL)
    (COND
     ((|testBitVector| |pv$| 4)
      (QSETREFV $ 115 (CONS (|dispatchFunction| |SUP;monicDivide;2$R;28|) $))))
    (COND
     ((|testBitVector| |pv$| 19)
      (PROGN
       (QSETREFV $ 118 (CONS (|dispatchFunction| |SUP;discriminant;$R;29|) $))
       (QSETREFV $ 120
                 (CONS (|dispatchFunction| |SUP;subResultantGcd;3$;30|) $))
       (QSETREFV $ 122 (CONS (|dispatchFunction| |SUP;resultant;2$R;31|) $)))))
    (COND
     ((|testBitVector| |pv$| 16)
      (PROGN
       (QSETREFV $ 124 (CONS (|dispatchFunction| |SUP;content;$R;32|) $))
       (QSETREFV $ 127 (CONS (|dispatchFunction| |SUP;primitivePart;2$;33|) $))
       (QSETREFV $ 129 (CONS (|dispatchFunction| |SUP;gcd;3$;34|) $)))))
    (COND
     ((|testBitVector| |pv$| 13)
      (PROGN
       (QSETREFV $ 132 (CONS (|dispatchFunction| |SUP;divide;2$R;35|) $))
       (QSETREFV $ 134 (CONS (|dispatchFunction| |SUP;/;$R$;36|) $)))))
    $))) 

(MAKEPROP '|SparseUnivariatePolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|PolynomialRing| 6 11) (|local| |#1|) '|Rep|
              (|SparseUnivariatePolynomial| 6) |SUP;makeSUP;2$;1|
              |SUP;unmakeSUP;2$;2| (|NonNegativeInteger|) (0 . ^)
              (|PositiveInteger|) (6 . ^) (12 . |One|) (16 . |Zero|) (20 . ^)
              (|Boolean|) (26 . |zero?|) (31 . |characteristic|)
              (|RepeatedSquaring| $$) (35 . |expt|) (41 . *) (47 . >)
              (53 . |binomThmExpt|) (60 . |primeFrobenius|) |SUP;zero?;$B;5|
              (65 . |One|) (69 . =) (75 . |one?|) |SUP;ground?;$B;7|
              |SUP;multiplyExponents;$Nni$;8| (|Union| $ '"failed") (|Integer|)
              (80 . |exquo|) |SUP;divideExponents;$NniU;9| (86 . |Zero|)
              (90 . |subtractIfCan|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              |SUP;karatsubaDivide;$NniR;10| |SUP;shiftRight;$Nni$;11|
              |SUP;shiftLeft;$Nni$;12| |SUP;univariate;2$;13|
              (|SingletonAsOrderedSet|) |SUP;multivariate;$Saos$;14|
              (|SparseUnivariatePolynomial| $$) (96 . |Zero|)
              (100 . |leadingCoefficient|) (105 . |coerce|) (110 . |degree|)
              (115 . |monomial|) (121 . |reductum|)
              (|SparseUnivariatePolynomial| $) |SUP;univariate;$SaosSup;15|
              (126 . +) (132 . |zero?|) (137 . |leadingCoefficient|)
              (142 . |degree|) (147 . |monomial|) (153 . |reductum|)
              |SUP;multivariate;SupSaos$;16| (158 . +) (|Factored| 46)
              (|UnivariatePolynomialSquareFree| $$ 46) (164 . |squareFree|)
              (|Factored| 53) (169 . |squareFreePolynomial|) (|Factored| 69)
              (|SparseUnivariatePolynomial| 8) (|TwoFactorize| 6)
              (174 . |generalTwoFactor|) (179 . |factorPolynomial|)
              (184 . |factorSquareFreePolynomial|) (|Factored| $$)
              (|DistinctDegreeFactorize| 6 $$) (189 . |factor|) (|Factored| $)
              (194 . |factor|) (|Union| 80 '"failed") (|List| 46)
              (|FiniteFieldSolveLinearPolynomialEquation| 6 $$ 46)
              (199 . |solveLinearPolynomialEquation|) (|Union| 84 '#1="failed")
              (|List| 53) (205 . |solveLinearPolynomialEquation|) '|mm_one|
              '|m_one| '|one_inited| (211 . -) (|OutputForm|) (216 . |coerce|)
              (221 . |coerce|) (226 . ^) (232 . |empty|) (236 . |coerce|)
              (241 . =) (247 . -) (252 . *) (258 . +) (|Mapping| 90 90 90)
              (|List| 90) (264 . |reduce|) |SUP;outputForm;$2Of;24| (|String|)
              (270 . |message|) |SUP;coerce;$Of;25| (275 . ^) (281 . *)
              (287 . +) |SUP;elt;$2R;26| |SUP;elt;3$;27| (293 . ~=) (299 . =)
              (305 . |fmecg|) (313 . |monicDivide|)
              (|PseudoRemainderSequence| 6 $$) (319 . |discriminant|)
              (324 . |discriminant|) (329 . |subResultantGcd|)
              (335 . |subResultantGcd|) (341 . |resultant|) (347 . |resultant|)
              (353 . |gcd|) (359 . |content|) (364 . |exquo|)
              (370 . |unitCanonical|) (375 . |primitivePart|)
              (380 . |gcdPolynomial|) (386 . |gcd|) (392 . |inv|) (397 . ~=)
              (403 . |divide|) (409 . *) (415 . /) (|Union| 141 '#1#)
              (|Matrix| $) (|InputForm|) (|Pattern| (|Float|)) (|Pattern| 34)
              (|Record| (|:| |mat| 142) (|:| |vec| (|Vector| 34))) (|Vector| $)
              (|Matrix| 34) (|List| 145) (|List| 11) (|Symbol|)
              (|PatternMatchResult| (|Float|) $) (|PatternMatchResult| 34 $)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|Fraction| 34) (|Union| 151 '"failed") (|List| $)
              (|Record| (|:| |coef| 151) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 154 '"failed") (|Fraction| $)
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |primePart| $) (|:| |commonPart| $))
              (|Record| (|:| |coef| 6) (|:| |quotient| $) (|:| |remainder| $))
              (|Union| 156 '"failed") (|Union| 149 '#2="failed")
              (|Union| 34 '#2#) (|Mapping| 6 6) (|List| 44) (|Matrix| 6)
              (|Record| (|:| |mat| 165) (|:| |vec| 172)) (|Union| 44 '#2#)
              (|List| 169) (|Equation| $)
              (|Record| (|:| |var| 44) (|:| |exponent| 11))
              (|Union| 170 '"failed") (|Vector| 6) (|List| 6) (|Mapping| 11 11)
              (|Union| 6 '#2#) (|HashState|) (|SingleInteger|))
           '#(~= 421 |zero?| 427 |unmakeSUP| 432 |univariate| 437
              |unitCanonical| 448 |subResultantGcd| 453 |squareFreePolynomial|
              459 |solveLinearPolynomialEquation| 464 |shiftRight| 470
              |shiftLeft| 476 |resultant| 482 |reductum| 488 |primitivePart|
              493 |outputForm| 498 |one?| 504 |multivariate| 509
              |multiplyExponents| 521 |monomial| 527 |monicDivide| 533
              |makeSUP| 539 |leadingCoefficient| 544 |karatsubaDivide| 549
              |ground?| 555 |gcd| 560 |fmecg| 566 |factorSquareFreePolynomial|
              574 |factorPolynomial| 579 |factor| 584 |exquo| 589 |elt| 595
              |divideExponents| 607 |divide| 613 |discriminant| 619 |degree|
              624 |content| 629 |coerce| 634 |binomThmExpt| 644 ^ 651 |Zero|
              663 |One| 667 = 671 / 677 + 683 * 689)
           'NIL
           (CONS
            (|makeByteWordVec2| 41
                                '(0 0 0 10 13 0 10 13 0 17 20 4 34 16 4 1 2 3
                                  34 4 9 4 35 18 22 4 36 12 36 0 1 34 35 0 0 1
                                  4 0 0 0 0 1 1 36 14 41 12 12 0 0 40 12 0 0 8
                                  26 28 21 0 0 12 0 0 0 0 0 0 0 0 4 5 6 7 30 32
                                  11 12 12 13 35 15 19))
            (CONS
             '#(|UnivariatePolynomialCategory&| |PolynomialCategory&|
                |MaybeSkewPolynomialCategory&|
                |PolynomialFactorizationExplicit&| |EuclideanDomain&|
                |FiniteAbelianMonoidRing&| |UniqueFactorizationDomain&| NIL
                |AbelianMonoidRing&| |GcdDomain&| NIL
                |FullyLinearlyExplicitOver&| NIL NIL |DifferentialExtension&|
                |Algebra&| NIL NIL |Algebra&| NIL NIL
                |PartialDifferentialRing&| |Algebra&| |EntireRing&|
                |PartialDifferentialRing&| |DifferentialRing&| NIL NIL |Rng&|
                NIL |Module&| |Module&| |Module&| NIL NIL NIL
                |NonAssociativeRing&| NIL NIL NIL NIL NIL NIL
                |NonAssociativeRng&| |AbelianGroup&| NIL NIL NIL
                |NonAssociativeSemiRng&| NIL |AbelianMonoid&| |MagmaWithUnit&|
                |Magma&| |AbelianSemiGroup&| NIL NIL NIL NIL
                |FullyRetractableTo&| |SetCategory&| |Evalable&| NIL NIL NIL
                |InnerEvalable&| |InnerEvalable&| |RetractableTo&| |BasicType&|
                NIL NIL |RetractableTo&| |RetractableTo&| NIL NIL NIL NIL
                |InnerEvalable&| |RetractableTo&| NIL NIL NIL NIL)
             (CONS
              '#((|UnivariatePolynomialCategory| 6)
                 (|PolynomialCategory| 6 11 44)
                 (|MaybeSkewPolynomialCategory| 6 11 44)
                 (|PolynomialFactorizationExplicit|) (|EuclideanDomain|)
                 (|FiniteAbelianMonoidRing| 6 11) (|UniqueFactorizationDomain|)
                 (|PrincipalIdealDomain|) (|AbelianMonoidRing| 6 11)
                 (|GcdDomain|) (|IntegralDomain|)
                 (|FullyLinearlyExplicitOver| 6) (|CommutativeRing|)
                 (|LeftOreRing|) (|DifferentialExtension| 6) (|Algebra| 149)
                 (|CharacteristicNonZero|) (|CharacteristicZero|) (|Algebra| 6)
                 (|LinearlyExplicitOver| 6) (|LinearlyExplicitOver| 34)
                 (|PartialDifferentialRing| 44) (|Algebra| $$) (|EntireRing|)
                 (|PartialDifferentialRing| 145) (|DifferentialRing|) (|Ring|)
                 (|SemiRing|) (|Rng|) (|SemiRng|) (|Module| 149) (|Module| 6)
                 (|Module| $$) (|BiModule| 6 6) (|BiModule| $$ $$)
                 (|BiModule| 149 149) (|NonAssociativeRing|) (|LeftModule| 6)
                 (|RightModule| 6) (|RightModule| $$) (|LeftModule| $$)
                 (|LeftModule| 149) (|RightModule| 149) (|NonAssociativeRng|)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|)
                 (|NonAssociativeSemiRng|) (|SemiGroup|) (|AbelianMonoid|)
                 (|MagmaWithUnit|) (|Magma|) (|AbelianSemiGroup|)
                 (|Comparable|) (|PatternMatchable| (|Float|))
                 (|PatternMatchable| 34) (|StepThrough|)
                 (|FullyRetractableTo| 6) (|SetCategory|) (|Evalable| $$)
                 (|Eltable| $$ $$) (|Eltable| 6 6)
                 (|VariablesCommuteWithCoefficients|) (|InnerEvalable| 44 $$)
                 (|InnerEvalable| 44 6) (|RetractableTo| 6) (|BasicType|)
                 (|CoercibleTo| 90) (|unitsKnown|) (|RetractableTo| 149)
                 (|RetractableTo| 34) (|canonicalUnitNormal|)
                 (|ConvertibleTo| 138) (|ConvertibleTo| 139)
                 (|ConvertibleTo| 137) (|InnerEvalable| $$ $$)
                 (|RetractableTo| 44) (|additiveValuation|) (|CommutativeStar|)
                 (|noZeroDivisors|)
                 (|Eltable| (|Fraction| $$) (|Fraction| $$)))
              (|makeByteWordVec2| 134
                                  '(2 0 0 0 11 12 2 0 0 0 13 14 0 0 0 15 0 0 0
                                    16 2 6 0 0 11 17 1 6 18 0 19 0 6 11 20 2 21
                                    2 2 13 22 2 0 0 0 0 23 2 11 18 0 0 24 3 0 0
                                    0 0 11 25 1 6 0 0 26 0 6 0 28 2 6 18 0 0 29
                                    1 0 18 0 30 2 34 33 0 0 35 0 6 0 37 2 11 33
                                    0 0 38 0 46 0 47 1 0 6 0 48 1 0 0 6 49 1 0
                                    11 0 50 2 46 0 2 11 51 1 0 0 0 52 2 46 0 0
                                    0 55 1 46 18 0 56 1 46 2 0 57 1 46 11 0 58
                                    2 0 0 6 11 59 1 46 0 0 60 2 0 0 0 0 62 1 64
                                    63 46 65 1 0 66 53 67 1 70 68 69 71 1 0 66
                                    53 72 1 0 66 53 73 1 75 74 2 76 1 0 77 0 78
                                    2 81 79 80 46 82 2 0 83 84 53 85 1 6 0 0 89
                                    1 6 90 0 91 1 11 90 0 92 2 90 0 0 0 93 0 90
                                    0 94 1 34 90 0 95 2 90 18 0 0 96 1 90 0 0
                                    97 2 90 0 0 0 98 2 90 0 0 0 99 2 101 90 100
                                    0 102 1 90 0 104 105 2 6 0 0 13 107 2 6 0 0
                                    0 108 2 6 0 0 0 109 2 6 18 0 0 112 2 0 18 0
                                    0 113 4 0 0 0 11 6 0 114 2 0 39 0 0 115 1
                                    116 6 2 117 1 0 6 0 118 2 116 2 2 2 119 2 0
                                    0 0 0 120 2 116 6 2 2 121 2 0 6 0 0 122 2 6
                                    0 0 0 123 1 0 6 0 124 2 0 33 0 6 125 1 0 0
                                    0 126 1 0 0 0 127 2 6 53 53 53 128 2 0 0 0
                                    0 129 1 6 0 0 130 2 0 18 0 0 131 2 0 39 0 0
                                    132 2 0 0 6 0 133 2 0 0 0 6 134 2 0 18 0 0
                                    131 1 50 18 0 27 1 0 0 8 10 1 0 8 0 43 2 0
                                    53 0 44 54 1 45 0 0 126 2 19 0 0 0 120 1 10
                                    66 53 67 2 10 83 84 53 85 2 4 0 0 11 41 2 0
                                    0 0 11 42 2 33 6 0 0 122 1 0 0 0 52 1 16 0
                                    0 127 2 0 90 0 90 103 1 48 18 0 30 2 0 0 8
                                    44 45 2 0 0 53 44 61 2 0 0 0 11 32 2 0 0 6
                                    11 59 2 4 39 0 0 115 1 0 8 0 9 1 0 6 0 48 2
                                    4 39 0 11 40 1 0 18 0 31 2 16 0 0 0 129 4 4
                                    0 0 11 6 0 114 1 10 66 53 73 1 10 66 53 72
                                    1 10 77 0 78 2 15 33 0 6 125 2 0 0 0 0 111
                                    2 0 6 0 6 110 2 0 33 0 11 36 2 13 39 0 0
                                    132 1 33 6 0 118 1 0 11 0 50 1 16 6 0 124 1
                                    0 0 6 49 1 0 90 0 106 3 42 0 0 0 11 25 2 48
                                    0 0 11 12 2 0 0 0 13 14 0 50 0 16 0 48 0 15
                                    2 0 18 0 0 113 2 13 0 0 6 134 2 0 0 0 0 62
                                    2 0 0 6 0 133 2 0 0 0 0 23)))))
           '|lookupIncomplete|)) 
