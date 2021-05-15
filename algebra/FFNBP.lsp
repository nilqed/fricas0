
(SDEFUN |FFNBP;coerce;GF$;1| ((|v| GF) ($ $))
        (MAKEARR1 (QREFELT $ 17) (SPADCALL |v| (QREFELT $ 47) (QREFELT $ 52)))) 

(PUT '|FFNBP;represents;V$;2| '|SPADreplace| '(XLAM (|v|) |v|)) 

(SDEFUN |FFNBP;represents;V$;2| ((|v| |Vector| GF) ($ $)) |v|) 

(SDEFUN |FFNBP;degree;$Pi;3| ((|a| $) ($ |PositiveInteger|))
        (SPROG ((|d| (|PositiveInteger|)) (|b| ($)))
               (SEQ (LETT |d| 1) (LETT |b| (SPADCALL |a| 1 (QREFELT $ 55)))
                    (SEQ G190
                         (COND
                          ((NULL (SPADCALL |b| |a| (QREFELT $ 57))) (GO G191)))
                         (SEQ (LETT |b| (SPADCALL |b| 1 (QREFELT $ 55)))
                              (EXIT (LETT |d| (+ |d| 1))))
                         NIL (GO G190) G191 (EXIT NIL))
                    (EXIT |d|)))) 

(SDEFUN |FFNBP;linearAssociatedExp;$Sup$;4|
        ((|x| $) (|f| |SparseUnivariatePolynomial| GF) ($ $))
        (SPROG
         ((|r| (|SparseUnivariatePolynomial| GF))
          (|xm| (|SparseUnivariatePolynomial| GF)))
         (SEQ
          (LETT |xm|
                (SPADCALL
                 (SPADCALL (|spadConstant| $ 27) (QREFELT $ 17) (QREFELT $ 60))
                 (|spadConstant| $ 21) (QREFELT $ 61)))
          (LETT |r|
                (SPADCALL
                 (SPADCALL |f| (SPADCALL |x| (QREFELT $ 62)) (QREFELT $ 63))
                 |xm| (QREFELT $ 64)))
          (EXIT (SPADCALL |r| (QREFELT $ 17) (QREFELT $ 65)))))) 

(SDEFUN |FFNBP;linearAssociatedLog;$Sup;5|
        ((|x| $) ($ |SparseUnivariatePolynomial| GF))
        (SPADCALL |x| (QREFELT $ 62))) 

(SDEFUN |FFNBP;linearAssociatedOrder;$Sup;6|
        ((|x| $) ($ |SparseUnivariatePolynomial| GF))
        (SPROG ((|xm| (|SparseUnivariatePolynomial| GF)))
               (SEQ
                (LETT |xm|
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 27) (QREFELT $ 17)
                                 (QREFELT $ 60))
                       (|spadConstant| $ 21) (QREFELT $ 61)))
                (EXIT
                 (SPADCALL |xm|
                           (SPADCALL |xm| (SPADCALL |x| (QREFELT $ 62))
                                     (QREFELT $ 68))
                           (QREFELT $ 69)))))) 

(SDEFUN |FFNBP;linearAssociatedLog;2$U;7|
        ((|b| $) (|x| $)
         ($ |Union| (|SparseUnivariatePolynomial| GF) "failed"))
        (SPROG
         ((|e1|
           (|Record| (|:| |coef1| (|SparseUnivariatePolynomial| GF))
                     (|:| |coef2| (|SparseUnivariatePolynomial| GF))))
          (#1=#:G413 NIL)
          (|e|
           (|Union|
            (|Record| (|:| |coef1| (|SparseUnivariatePolynomial| GF))
                      (|:| |coef2| (|SparseUnivariatePolynomial| GF)))
            #2="failed"))
          (|xm| (|SparseUnivariatePolynomial| GF)))
         (SEQ
          (COND ((SPADCALL |x| (QREFELT $ 71)) (CONS 0 (|spadConstant| $ 19)))
                (#3='T
                 (SEQ
                  (LETT |xm|
                        (SPADCALL
                         (SPADCALL (|spadConstant| $ 27) (QREFELT $ 17)
                                   (QREFELT $ 60))
                         (|spadConstant| $ 21) (QREFELT $ 61)))
                  (LETT |e|
                        (SPADCALL (SPADCALL |b| (QREFELT $ 62)) |xm|
                                  (SPADCALL |x| (QREFELT $ 62))
                                  (QREFELT $ 74)))
                  (EXIT
                   (COND
                    ((SPADCALL |e| (CONS 1 "failed") (QREFELT $ 77))
                     (CONS 1 "failed"))
                    (#3#
                     (SEQ
                      (LETT |e1|
                            (PROG2 (LETT #1# |e|)
                                (QCDR #1#)
                              (|check_union2| (QEQCAR #1# 0)
                                              (|Record|
                                               (|:| |coef1|
                                                    (|SparseUnivariatePolynomial|
                                                     (QREFELT $ 6)))
                                               (|:| |coef2|
                                                    (|SparseUnivariatePolynomial|
                                                     (QREFELT $ 6))))
                                              (|Union|
                                               (|Record|
                                                (|:| |coef1|
                                                     (|SparseUnivariatePolynomial|
                                                      (QREFELT $ 6)))
                                                (|:| |coef2|
                                                     (|SparseUnivariatePolynomial|
                                                      (QREFELT $ 6))))
                                               #2#)
                                              #1#)))
                      (EXIT (CONS 0 (QCAR |e1|))))))))))))) 

(SDEFUN |FFNBP;getMultiplicationTable;V;8|
        (($ |Vector|
          (|List|
           (|Record| (|:| |value| GF) (|:| |index| (|SingleInteger|))))))
        (SEQ (COND ((QREFELT $ 16) (|FFNBP;initializeMult| $)))
             (EXIT (QREFELT $ 23)))) 

(SDEFUN |FFNBP;getMultiplicationMatrix;M;9| (($ |Matrix| GF))
        (SEQ (COND ((QREFELT $ 16) (|FFNBP;initializeMult| $)))
             (EXIT (SPADCALL (QREFELT $ 23) (QREFELT $ 83))))) 

(SDEFUN |FFNBP;sizeMultiplication;Nni;10| (($ |NonNegativeInteger|))
        (SEQ (COND ((QREFELT $ 16) (|FFNBP;initializeMult| $)))
             (EXIT (SPADCALL (QREFELT $ 23) (QREFELT $ 85))))) 

(SDEFUN |FFNBP;trace;$GF;11| ((|a| $) ($ GF))
        (SPADCALL (SPADCALL |a| 1 (QREFELT $ 87)) (QREFELT $ 88))) 

(SDEFUN |FFNBP;norm;$GF;12| ((|a| $) ($ GF))
        (SPADCALL (SPADCALL |a| 1 (QREFELT $ 90)) (QREFELT $ 88))) 

(SDEFUN |FFNBP;generator;$;13| (($ $)) (SPADCALL (QREFELT $ 17) (QREFELT $ 92))) 

(SDEFUN |FFNBP;basis;PiV;14| ((|n| |PositiveInteger|) ($ |Vector| $))
        (SPROG ((#1=#:G438 NIL) (|i| NIL) (#2=#:G437 NIL))
               (SEQ
                (COND
                 ((SPADCALL (REM (QREFELT $ 17) |n|) 0 (QREFELT $ 94))
                  (|error| "argument must divide extension degree"))
                 ('T
                  (PROGN
                   (LETT #2# (GETREFV |n|))
                   (SEQ (LETT |i| 0) (LETT #1# (- |n| 1)) G190
                        (COND ((|greater_SI| |i| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SETELT #2# |i|
                                  (SPADCALL
                                   (SPADCALL (SPADCALL (QREFELT $ 95)) |n|
                                             (QREFELT $ 87))
                                   |i| (QREFELT $ 96)))))
                        (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                   #2#)))))) 

(SDEFUN |FFNBP;*;GF2$;15| ((|a| GF) (|x| $) ($ $))
        (SPADCALL |a| |x| (QREFELT $ 99))) 

(SDEFUN |FFNBP;/;$GF$;16| ((|x| $) (|a| GF) ($ $))
        (SPADCALL |x| (SPADCALL |a| (QREFELT $ 53)) (QREFELT $ 101))) 

(PUT '|FFNBP;coordinates;$V;17| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |FFNBP;coordinates;$V;17| ((|x| $) ($ |Vector| GF)) |x|) 

(SDEFUN |FFNBP;Frobenius;2$;18| ((|e| $) ($ $)) (SPADCALL |e| 1 (QREFELT $ 55))) 

(SDEFUN |FFNBP;Frobenius;$Nni$;19| ((|e| $) (|n| |NonNegativeInteger|) ($ $))
        (SPADCALL |e| |n| (QREFELT $ 55))) 

(SDEFUN |FFNBP;retractIfCan;$U;20| ((|x| $) ($ |Union| GF "failed"))
        (COND
         ((SPADCALL |x| (QREFELT $ 105))
          (CONS 0
                (SPADCALL (SPADCALL |x| 1 (QREFELT $ 106)) (QREFELT $ 47)
                          (QREFELT $ 107))))
         ('T (CONS 1 "failed")))) 

(SDEFUN |FFNBP;retract;$GF;21| ((|x| $) ($ GF))
        (COND
         ((SPADCALL |x| (QREFELT $ 105))
          (SPADCALL (SPADCALL |x| 1 (QREFELT $ 106)) (QREFELT $ 47)
                    (QREFELT $ 107)))
         ('T (|error| "element not in ground field")))) 

(SDEFUN |FFNBP;coerce;$Of;22| ((|x| $) ($ |OutputForm|))
        (SPROG
         ((|r| (|OutputForm|)) (|l| (|List| (|OutputForm|)))
          (|mon| (|OutputForm|)) (#1=#:G464 NIL) (|i| NIL) (#2=#:G465 NIL)
          (|b| NIL) (|n| (|PositiveInteger|)))
         (SEQ (LETT |l| NIL) (LETT |n| (QREFELT $ 17))
              (EXIT
               (COND
                ((EQL |n| 1)
                 (SPADCALL (SPADCALL |x| 1 (QREFELT $ 106)) (QREFELT $ 110)))
                (#3='T
                 (SEQ
                  (SEQ (LETT |b| NIL) (LETT #2# (QREFELT $ 43)) (LETT |i| 1)
                       (LETT #1# |n|) G190
                       (COND
                        ((OR (|greater_SI| |i| #1#) (ATOM #2#)
                             (PROGN (LETT |b| (CAR #2#)) NIL))
                         (GO G191)))
                       (SEQ
                        (EXIT
                         (COND
                          ((NULL
                            (SPADCALL (SPADCALL |x| |i| (QREFELT $ 106))
                                      (QREFELT $ 111)))
                           (SEQ
                            (LETT |mon|
                                  (COND
                                   ((SPADCALL
                                     (SPADCALL |x| |i| (QREFELT $ 106))
                                     (|spadConstant| $ 27) (QREFELT $ 112))
                                    |b|)
                                   ('T
                                    (SPADCALL
                                     (SPADCALL
                                      (SPADCALL |x| |i| (QREFELT $ 106))
                                      (QREFELT $ 110))
                                     |b| (QREFELT $ 113)))))
                            (EXIT (LETT |l| (CONS |mon| |l|))))))))
                       (LETT |i| (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#))))
                       (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND
                    ((NULL |l|)
                     (SPADCALL (|spadConstant| $ 19) (QREFELT $ 114)))
                    (#3#
                     (SEQ (LETT |r| (SPADCALL (ELT $ 115) |l| (QREFELT $ 117)))
                          (EXIT |r|)))))))))))) 

(SDEFUN |FFNBP;initializeElt| (($ |Void|))
        (SEQ
         (SETELT $ 44
                 (SPADCALL
                  (SPADCALL
                   (- (EXPT (SPADCALL (QREFELT $ 119)) (QREFELT $ 17)) 1)
                   (QREFELT $ 121))
                  (QREFELT $ 125)))
         (SETELT $ 48 (SPADCALL (SPADCALL (QREFELT $ 126)) (QREFELT $ 127)))
         (SETELT $ 15 NIL) (EXIT (SPADCALL (QREFELT $ 128))))) 

(SDEFUN |FFNBP;initializeMult| (($ |Void|))
        (SEQ (SETELT $ 23 (SPADCALL (QREFELT $ 20) (QREFELT $ 129)))
             (SPADCALL (QREFELT $ 23) (QREFELT $ 47) (QREFELT $ 34))
             (SETELT $ 16 NIL) (EXIT (SPADCALL (QREFELT $ 128))))) 

(SDEFUN |FFNBP;initializeLog| (($ |Void|))
        (SPROG
         ((#1=#:G478 NIL) (|a| ($)) (#2=#:G484 NIL) (#3=#:G472 NIL) (|i| NIL)
          (|tbl| (|Table| (|PositiveInteger|) (|NonNegativeInteger|)))
          (|n| (|Integer|)) (|d| (|Integer|)) (|l| (|Integer|)) (|base| ($))
          (|fac| (|Integer|)) (#4=#:G483 NIL) (|f| NIL) (|limit| (|Integer|)))
         (SEQ (COND ((QREFELT $ 15) (|FFNBP;initializeElt| $)))
              (LETT |limit| 30)
              (SEQ (LETT |f| NIL) (LETT #4# (QREFELT $ 44)) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |f| (CAR #4#)) NIL))
                     (GO G191)))
                   (SEQ (LETT |fac| (QCAR |f|))
                        (LETT |base|
                              (SPADCALL
                               (SPADCALL (QREFELT $ 48) (QREFELT $ 130))
                               (QUOTIENT2
                                (-
                                 (EXPT (SPADCALL (QREFELT $ 119))
                                       (QREFELT $ 17))
                                 1)
                                |fac|)
                               (QREFELT $ 131)))
                        (LETT |l| (INTEGER-LENGTH |fac|)) (LETT |n| 0)
                        (COND
                         ((ODDP |l|)
                          (LETT |n| (ASH |fac| (- (QUOTIENT2 |l| 2)))))
                         ('T (LETT |n| (ASH 1 (QUOTIENT2 |l| 2)))))
                        (COND
                         ((< |n| |limit|)
                          (SEQ (LETT |d| (+ (QUOTIENT2 (- |fac| 1) |limit|) 1))
                               (EXIT
                                (LETT |n|
                                      (+ (QUOTIENT2 (- |fac| 1) |d|) 1))))))
                        (LETT |tbl| (SPADCALL (QREFELT $ 133)))
                        (LETT |a| (|spadConstant| $ 22))
                        (SEQ (LETT |i| 0)
                             (LETT #2#
                                   (PROG1 (LETT #3# (- |n| 1))
                                     (|check_subtype2| (>= #3# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #3#)))
                             G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
                             (SEQ
                              (SPADCALL
                               (CONS (SPADCALL |a| (QREFELT $ 127)) |i|) |tbl|
                               (QREFELT $ 135))
                              (EXIT
                               (LETT |a|
                                     (SPADCALL |a| |base| (QREFELT $ 136)))))
                             (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (SPADCALL
                          (CONS
                           (PROG1 (LETT #1# |fac|)
                             (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                               '(|Integer|) #1#))
                           (SPADCALL |tbl| (QREFELT $ 137)))
                          (QREFELT $ 51) (QREFELT $ 139))))
                   (LETT #4# (CDR #4#)) (GO G190) G191 (EXIT NIL))
              (SETELT $ 14 NIL) (EXIT (SPADCALL (QREFELT $ 128)))))) 

(SDEFUN |FFNBP;tableForDiscreteLogarithm;IT;26|
        ((|fac| |Integer|)
         ($ |Table| (|PositiveInteger|) (|NonNegativeInteger|)))
        (SPROG
         ((|tbl|
           (|Union| (|Table| (|PositiveInteger|) (|NonNegativeInteger|))
                    "failed"))
          (#1=#:G486 NIL))
         (SEQ (COND ((QREFELT $ 14) (|FFNBP;initializeLog| $)))
              (LETT |tbl|
                    (SPADCALL
                     (PROG1 (LETT #1# |fac|)
                       (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                         '(|Integer|) #1#))
                     (QREFELT $ 51) (QREFELT $ 141)))
              (EXIT
               (COND
                ((QEQCAR |tbl| 1)
                 (|error|
                  "tableForDiscreteLogarithm: argument must be prime divisor of the order of the multiplicative group"))
                ('T (QCDR |tbl|))))))) 

(SDEFUN |FFNBP;primitiveElement;$;27| (($ $))
        (SEQ (COND ((QREFELT $ 15) (|FFNBP;initializeElt| $)))
             (EXIT (SPADCALL (QREFELT $ 48) (QREFELT $ 130))))) 

(SDEFUN |FFNBP;factorsOfCyclicGroupSize;L;28|
        (($ |List|
          (|Record| (|:| |factor| (|Integer|))
                    (|:| |exponent| (|NonNegativeInteger|)))))
        (SEQ (COND ((NULL (QREFELT $ 44)) (|FFNBP;initializeElt| $)))
             (EXIT (QREFELT $ 44)))) 

(SDEFUN |FFNBP;extensionDegree;Pi;29| (($ |PositiveInteger|)) (QREFELT $ 17)) 

(SDEFUN |FFNBP;definingPolynomial;Sup;30| (($ |SparseUnivariatePolynomial| GF))
        (QREFELT $ 20)) 

(SDEFUN |FFNBP;trace;$Pi$;31| ((|a| $) (|d| |PositiveInteger|) ($ $))
        (SPROG ((|erg| ($)) (#1=#:G502 NIL) (|i| NIL) (|v| ($)))
               (SEQ (LETT |v| (SPADCALL |a| |d| (QREFELT $ 147)))
                    (LETT |erg| |v|)
                    (SEQ (LETT |i| 2) (LETT #1# (QUOTIENT2 (QREFELT $ 17) |d|))
                         G190 (COND ((|greater_SI| |i| #1#) (GO G191)))
                         (SEQ
                          (EXIT
                           (LETT |erg| (SPADCALL |erg| |v| (QREFELT $ 148)))))
                         (LETT |i| (|inc_SI| |i|)) (GO G190) G191 (EXIT NIL))
                    (EXIT |erg|)))) 

(SDEFUN |FFNBP;characteristic;Nni;32| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 149))) 

(SDEFUN |FFNBP;random;$;33| (($ $)) (SPADCALL (QREFELT $ 17) (QREFELT $ 151))) 

(SDEFUN |FFNBP;*;3$;34| ((|x| $) (|y| $) ($ $))
        (SEQ (COND ((QREFELT $ 16) (|FFNBP;initializeMult| $)))
             (SPADCALL (QREFELT $ 23) (QREFELT $ 47) (QREFELT $ 34))
             (EXIT (SPADCALL |x| |y| (QREFELT $ 153))))) 

(SDEFUN |FFNBP;One;$;35| (($ $))
        (MAKEARR1 (QREFELT $ 17) (SPADCALL (QREFELT $ 47) (QREFELT $ 154)))) 

(SDEFUN |FFNBP;Zero;$;36| (($ $)) (SPADCALL (QREFELT $ 17) (QREFELT $ 155))) 

(SDEFUN |FFNBP;size;Nni;37| (($ |NonNegativeInteger|))
        (EXPT (SPADCALL (QREFELT $ 119)) (QREFELT $ 17))) 

(SDEFUN |FFNBP;index;Pi$;38| ((|n| |PositiveInteger|) ($ $))
        (SPADCALL (QREFELT $ 17) |n| (QREFELT $ 157))) 

(SDEFUN |FFNBP;lookup;$Pi;39| ((|x| $) ($ |PositiveInteger|))
        (SPADCALL |x| (QREFELT $ 158))) 

(SDEFUN |FFNBP;basis;V;40| (($ |Vector| $))
        (SPROG
         ((#1=#:G516 NIL) (|e| NIL) (#2=#:G515 NIL)
          (|a| (|Vector| (|Vector| GF))))
         (SEQ (LETT |a| (SPADCALL (QREFELT $ 17) (QREFELT $ 160)))
              (EXIT
               (SPADCALL
                (PROGN
                 (LETT #2# NIL)
                 (SEQ (LETT |e| NIL) (LETT #1# (SPADCALL |a| (QREFELT $ 162)))
                      G190
                      (COND
                       ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#)) NIL))
                        (GO G191)))
                      (SEQ (EXIT (LETT #2# (CONS |e| #2#))))
                      (LETT #1# (CDR #1#)) (GO G190) G191
                      (EXIT (NREVERSE #2#))))
                (QREFELT $ 165)))))) 

(SDEFUN |FFNBP;^;$I$;41| ((|x| $) (|e| |Integer|) ($ $))
        (SEQ (COND ((QREFELT $ 16) (|FFNBP;initializeMult| $)))
             (SPADCALL (QREFELT $ 23) (QREFELT $ 47) (QREFELT $ 34))
             (EXIT (SPADCALL |x| |e| (QREFELT $ 167))))) 

(SDEFUN |FFNBP;normal?;$B;42| ((|x| $) ($ |Boolean|))
        (SPADCALL |x| (QREFELT $ 168))) 

(SDEFUN |FFNBP;-;2$;43| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 170))) 

(SDEFUN |FFNBP;+;3$;44| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 172))) 

(SDEFUN |FFNBP;-;3$;45| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 174))) 

(SDEFUN |FFNBP;=;2$B;46| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 176))) 

(SDEFUN |FFNBP;*;I2$;47| ((|n| |Integer|) (|x| $) ($ $))
        (SPADCALL |x| (SPADCALL |n| (QREFELT $ 178)) (QREFELT $ 179))) 

(PUT '|FFNBP;representationType;U;48| '|SPADreplace|
     '(XLAM NIL (CONS 2 "normal"))) 

(SDEFUN |FFNBP;representationType;U;48|
        (($ |Union| "prime" "polynomial" "normal" "cyclic")) (CONS 2 "normal")) 

(SDEFUN |FFNBP;minimalPolynomial;$Sup;49|
        ((|a| $) ($ |SparseUnivariatePolynomial| GF))
        (SEQ (COND ((QREFELT $ 16) (|FFNBP;initializeMult| $)))
             (SPADCALL (QREFELT $ 23) (QREFELT $ 47) (QREFELT $ 34))
             (EXIT (SPADCALL |a| (QREFELT $ 36))))) 

(SDEFUN |FFNBP;inGroundField?;$B;50| ((|x| $) ($ |Boolean|))
        (SPROG ((#1=#:G542 NIL) (|erg| (|Boolean|)) (#2=#:G543 NIL) (|i| NIL))
               (SEQ (LETT |erg| 'T)
                    (SEQ
                     (EXIT
                      (SEQ (LETT |i| 2) (LETT #2# (QREFELT $ 17)) G190
                           (COND ((|greater_SI| |i| #2#) (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((NULL
                                (SPADCALL (SPADCALL |x| |i| (QREFELT $ 106))
                                          (SPADCALL |x| 1 (QREFELT $ 106))
                                          (QREFELT $ 112)))
                               (PROGN
                                (LETT #1# (LETT |erg| NIL))
                                (GO #3=#:G539))))))
                           (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                           (EXIT NIL)))
                     #3# (EXIT #1#))
                    (EXIT |erg|)))) 

(SDEFUN |FFNBP;/;3$;51| ((|x| $) (|y| $) ($ $))
        (SEQ (COND ((QREFELT $ 16) (|FFNBP;initializeMult| $)))
             (SPADCALL (QREFELT $ 23) (QREFELT $ 47) (QREFELT $ 34))
             (EXIT (SPADCALL |x| |y| (QREFELT $ 184))))) 

(SDEFUN |FFNBP;inv;2$;52| ((|a| $) ($ $))
        (SEQ (COND ((QREFELT $ 16) (|FFNBP;initializeMult| $)))
             (SPADCALL (QREFELT $ 23) (QREFELT $ 47) (QREFELT $ 34))
             (EXIT (SPADCALL |a| (QREFELT $ 185))))) 

(SDEFUN |FFNBP;norm;$Pi$;53| ((|a| $) (|d| |PositiveInteger|) ($ $))
        (SEQ (COND ((QREFELT $ 16) (|FFNBP;initializeMult| $)))
             (SPADCALL (QREFELT $ 23) (QREFELT $ 47) (QREFELT $ 34))
             (EXIT (SPADCALL |a| |d| (QREFELT $ 187))))) 

(SDEFUN |FFNBP;normalElement;$;54| (($ $))
        (SPADCALL (QREFELT $ 17) (QREFELT $ 92))) 

(DECLAIM (NOTINLINE |FiniteFieldNormalBasisExtensionByPolynomial;|)) 

(DEFUN |FiniteFieldNormalBasisExtensionByPolynomial| (&REST #1=#:G574)
  (SPROG NIL
         (PROG (#2=#:G575)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FiniteFieldNormalBasisExtensionByPolynomial|)
                                               '|domainEqualList|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function|
                        |FiniteFieldNormalBasisExtensionByPolynomial;|)
                       #1#)
                    (LETT #2# T))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|FiniteFieldNormalBasisExtensionByPolynomial|)))))))))) 

(DEFUN |FiniteFieldNormalBasisExtensionByPolynomial;| (|#1| |#2|)
  (SPROG
   ((#1=#:G396 NIL) (#2=#:G573 NIL) (|i| NIL) (#3=#:G572 NIL) (|qs| NIL)
    (|pv$| NIL) (#4=#:G571 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (SEQ
    (PROGN
     (LETT DV$1 (|devaluate| |#1|))
     (LETT DV$2 (|devaluate| |#2|))
     (LETT |dv$|
           (LIST '|FiniteFieldNormalBasisExtensionByPolynomial| DV$1 DV$2))
     (LETT $ (GETREFV 210))
     (QSETREFV $ 0 |dv$|)
     (QSETREFV $ 3
               (LETT |pv$|
                     (|buildPredVector| 0 0
                                        (LIST
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (LETT #4#
                                               (|HasCategory| |#1|
                                                              '(|Finite|)))
                                         (OR
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          #4#)))))
     (|haddProp| |$ConstructorCache|
                 '|FiniteFieldNormalBasisExtensionByPolynomial|
                 (LIST DV$1 DV$2) (CONS 1 $))
     (|stuffDomainSlots| $)
     (QSETREFV $ 6 |#1|)
     (QSETREFV $ 7 |#2|)
     (AND #4# (|HasCategory| $ '(|CharacteristicNonZero|))
          (|augmentPredVector| $ 8))
     (SETF |pv$| (QREFELT $ 3))
     (QSETREFV $ 8 (|Vector| |#1|))
     (QSETREFV $ 13 (SPADCALL (SPADCALL (QREFELT $ 10)) (QREFELT $ 12)))
     (QSETREFV $ 14 'T)
     (QSETREFV $ 15 'T)
     (QSETREFV $ 16 'T)
     (QSETREFV $ 17 1)
     (QSETREFV $ 20 (|spadConstant| $ 19))
     (QSETREFV $ 23 (MAKEARR1 1 NIL))
     (COND
      ((QEQCAR |#2| 1)
       (PROGN
        (SETELT $ 23 (QCDR |#2|))
        (SETELT $ 17 (QVSIZE (QREFELT $ 23)))
        (QSETREFV $ 26 (MAKEARR1 (QREFELT $ 17) (|spadConstant| $ 25)))
        (SPADCALL (QREFELT $ 26) 1 (|spadConstant| $ 27) (QREFELT $ 29))
        (SPADCALL (QREFELT $ 23) (|spadConstant| $ 27) (QREFELT $ 34))
        (SETELT $ 20 (SPADCALL (QREFELT $ 26) (QREFELT $ 36)))
        (SETELT $ 16 NIL)))
      ('T
       (PROGN
        (SETELT $ 20 (QCDR |#2|))
        (SETELT $ 17 (SPADCALL (QREFELT $ 20) (QREFELT $ 38)))
        (SETELT $ 23 (MAKEARR1 (QREFELT $ 17) NIL)))))
     (QSETREFV $ 43
               (SEQ (LETT |qs| (SPADCALL '|q| (QREFELT $ 12)))
                    (EXIT
                     (SPADCALL
                      (LIST (QREFELT $ 13)
                            (SPADCALL (QREFELT $ 13) |qs| (QREFELT $ 39)))
                      (PROGN
                       (LETT #3# NIL)
                       (SEQ (LETT |i| 2) (LETT #2# (- (QREFELT $ 17) 1)) G190
                            (COND ((|greater_SI| |i| #2#) (GO G191)))
                            (SEQ
                             (EXIT
                              (LETT #3#
                                    (CONS
                                     (SPADCALL (QREFELT $ 13)
                                               (SPADCALL |qs|
                                                         (SPADCALL |i|
                                                                   (QREFELT $
                                                                            40))
                                                         (QREFELT $ 39))
                                               (QREFELT $ 39))
                                     #3#))))
                            (LETT |i| (|inc_SI| |i|)) (GO G190) G191
                            (EXIT (NREVERSE #3#))))
                      (QREFELT $ 42)))))
     (QSETREFV $ 44 NIL)
     (QSETREFV $ 47
               (SPADCALL
                (SPADCALL (QREFELT $ 20)
                          (PROG1
                              (LETT #1#
                                    (- (SPADCALL (QREFELT $ 20) (QREFELT $ 38))
                                       1))
                            (|check_subtype2| (>= #1# 0)
                                              '(|NonNegativeInteger|)
                                              '(|Integer|) #1#))
                          (QREFELT $ 45))
                (QREFELT $ 46)))
     (QSETREFV $ 48 1)
     (QSETREFV $ 51 (SPADCALL (QREFELT $ 50)))
     $)))) 

(MAKEPROP '|FiniteFieldNormalBasisExtensionByPolynomial| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (|Symbol|) (0 . |new|) (|OutputForm|) (4 . |coerce|) '|alpha|
              '|initlog?| '|initelt?| '|initmult?| '|extdeg|
              (|SparseUnivariatePolynomial| 6) (9 . |Zero|) '|defpol|
              (13 . |One|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |FFNBP;One;$;35|) $))
              '|multTable|
              (CONS IDENTITY
                    (FUNCALL (|dispatchFunction| |FFNBP;Zero;$;36|) $))
              (17 . |Zero|) '|vv| (21 . |One|) (|Integer|) (25 . |setelt!|)
              (|Void|) (|Record| (|:| |value| 6) (|:| |index| 208))
              (|Vector| (|List| 31)) (|InnerNormalBasisFieldFunctions| 6)
              (32 . |setFieldInfo|) (|Vector| 6) (38 . |minimalPolynomial|)
              (|NonNegativeInteger|) (43 . |degree|) (48 . ^) (54 . |coerce|)
              (|List| 11) (59 . |append|) '|basisOutput| '|facOfGroupSize|
              (65 . |coefficient|) (71 . -) '|traceAlpha| '|primitiveElt|
              (|Table| 58 132) (76 . |table|) '|discLogTable| (80 . /)
              |FFNBP;coerce;GF$;1| |FFNBP;represents;V$;2| (86 . |qPot|)
              (|Boolean|) (92 . ~=) (|PositiveInteger|) |FFNBP;degree;$Pi;3|
              (98 . |monomial|) (104 . -) (110 . |pol|) (115 . *) (121 . |rem|)
              (127 . |vectorise|) |FFNBP;linearAssociatedExp;$Sup$;4|
              |FFNBP;linearAssociatedLog;$Sup;5| (133 . |gcd|) (139 . |quo|)
              |FFNBP;linearAssociatedOrder;$Sup;6| (145 . |zero?|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 72 '#1="failed") (150 . |extendedEuclidean|)
              (|Record| (|:| |coef1| 18) (|:| |coef2| 18)) (|Union| 75 '#1#)
              (157 . =) (|Union| 18 '"failed")
              |FFNBP;linearAssociatedLog;2$U;7|
              |FFNBP;getMultiplicationTable;V;8| (|Matrix| 6)
              (|FiniteFieldFunctions| 6) (163 . |createMultiplicationMatrix|)
              |FFNBP;getMultiplicationMatrix;M;9| (168 . |sizeMultiplication|)
              |FFNBP;sizeMultiplication;Nni;10| |FFNBP;trace;$Pi$;31|
              |FFNBP;retract;$GF;21| |FFNBP;trace;$GF;11| |FFNBP;norm;$Pi$;53|
              |FFNBP;norm;$GF;12| (173 . |normalElement|)
              |FFNBP;generator;$;13| (178 . ~=) |FFNBP;normalElement;$;54|
              |FFNBP;Frobenius;$Nni$;19| (|Vector| $) |FFNBP;basis;PiV;14|
              (184 . *) |FFNBP;*;GF2$;15| |FFNBP;/;3$;51| |FFNBP;/;$GF$;16|
              |FFNBP;coordinates;$V;17| |FFNBP;Frobenius;2$;18|
              |FFNBP;inGroundField?;$B;50| (190 . |elt|) (196 . *)
              (|Union| 6 '"failed") |FFNBP;retractIfCan;$U;20| (202 . |coerce|)
              (207 . |zero?|) (212 . =) (218 . *) (224 . |coerce|) (229 . +)
              (|Mapping| 11 11 11) (235 . |reduce|) |FFNBP;coerce;$Of;22|
              (241 . |size|) (|Factored| $) (245 . |factor|)
              (|Record| (|:| |factor| 28) (|:| |exponent| 37)) (|List| 122)
              (|Factored| 28) (250 . |factors|)
              (255 . |createPrimitiveElement|) |FFNBP;lookup;$Pi;39|
              (259 . |void|) (263 . |createMultiplicationTable|)
              |FFNBP;index;Pi$;38| |FFNBP;^;$I$;41| (|Table| 58 37)
              (268 . |table|) (|Record| (|:| |key| 58) (|:| |entry| 37))
              (272 . |insert!|) |FFNBP;*;3$;34| (278 . |copy|)
              (|Record| (|:| |key| 58) (|:| |entry| 132)) (283 . |insert!|)
              (|Union| 132 '"failed") (289 . |search|)
              |FFNBP;tableForDiscreteLogarithm;IT;26|
              |FFNBP;primitiveElement;$;27|
              |FFNBP;factorsOfCyclicGroupSize;L;28|
              |FFNBP;extensionDegree;Pi;29| |FFNBP;definingPolynomial;Sup;30|
              (295 . |trace|) (301 . |concat|) (307 . |characteristic|)
              |FFNBP;characteristic;Nni;32| (311 . |random|)
              |FFNBP;random;$;33| (316 . *) (322 . |inv|) (327 . |zero|)
              |FFNBP;size;Nni;37| (332 . |index|) (338 . |lookup|)
              (|Vector| 35) (343 . |basis|) (|List| 35) (348 . |entries|)
              (|List| $$) (|Vector| $$) (353 . |vector|) |FFNBP;basis;V;40|
              (358 . ^) (364 . |normal?|) |FFNBP;normal?;$B;42| (369 . -)
              |FFNBP;-;2$;43| (374 . +) |FFNBP;+;3$;44| (380 . -)
              |FFNBP;-;3$;45| (386 . =) |FFNBP;=;2$B;46| (392 . |coerce|)
              (397 . *) |FFNBP;*;I2$;47|
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              |FFNBP;representationType;U;48| |FFNBP;minimalPolynomial;$Sup;49|
              (403 . /) (409 . |inv|) |FFNBP;inv;2$;52| (414 . |norm|)
              (|Union| 97 '#2="failed") (|Matrix| $) (|Union| $ '"failed")
              (|Union| 37 '"failed") (|OnePointCompletion| 58) (|List| $)
              (|InputForm|) (|Union| 196 '#2#) (|List| 197)
              (|SparseUnivariatePolynomial| $) (|Factored| 197)
              (|CardinalNumber|) (|Fraction| 28) (|Union| 193 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef| 193) (|:| |generator| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 420 |zero?| 426 |unitNormal| 431 |unitCanonical| 436 |unit?|
              441 |transcendent?| 446 |transcendenceDegree| 451 |trace| 455
              |tableForDiscreteLogarithm| 466 |subtractIfCan| 471
              |squareFreePolynomial| 477 |squareFreePart| 482 |squareFree| 487
              |solveLinearPolynomialEquation| 492 |smaller?| 498
              |sizeMultiplication| 504 |sizeLess?| 508 |size| 514 |sample| 518
              |rightRecip| 522 |rightPower| 527 |retractIfCan| 539 |retract|
              544 |represents| 549 |representationType| 554 |rem| 558 |recip|
              564 |random| 569 |quo| 573 |principalIdeal| 579
              |primitiveElement| 584 |primitive?| 588 |primeFrobenius| 593
              |prime?| 604 |order| 609 |opposite?| 619 |one?| 625
              |normalElement| 630 |normal?| 634 |norm| 639 |nextItem| 650
              |multiEuclidean| 655 |minimalPolynomial| 661 |lookup| 672
              |linearAssociatedOrder| 677 |linearAssociatedLog| 682
              |linearAssociatedExp| 693 |leftRecip| 699 |leftPower| 704
              |lcmCoef| 716 |lcm| 722 |latex| 733 |inv| 738 |init| 743 |index|
              747 |inGroundField?| 752 |hashUpdate!| 757 |hash| 763
              |getMultiplicationTable| 768 |getMultiplicationMatrix| 772
              |generator| 776 |gcdPolynomial| 780 |gcd| 786
              |factorsOfCyclicGroupSize| 797 |factorSquareFreePolynomial| 801
              |factorPolynomial| 806 |factor| 811 |extensionDegree| 816
              |extendedEuclidean| 824 |exquo| 837 |expressIdealMember| 843
              |euclideanSize| 849 |enumerate| 854 |divide| 858 |discreteLog|
              864 |dimension| 875 |differentiate| 879 |degree| 890
              |definingPolynomial| 900 |createPrimitiveElement| 904
              |createNormalElement| 908 |coordinates| 912 |convert| 922
              |conditionP| 927 |commutator| 932 |coerce| 938 |charthRoot| 963
              |characteristic| 973 |basis| 977 |associator| 986 |associates?|
              993 |antiCommutator| 999 |annihilate?| 1005 |algebraic?| 1011 ^
              1016 |Zero| 1034 |One| 1038 |Frobenius| 1042 D 1053 = 1064 / 1070
              - 1082 + 1093 * 1099)
           'NIL
           (CONS
            (|makeByteWordVec2| 3
                                '(0 0 2 3 0 0 2 0 0 0 0 0 0 0 0 0 0 3 1 2 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 2 0 0 2 2 0 0 0 0 0 0 0 0 0 0 2))
            (CONS
             '#(|FiniteAlgebraicExtensionField&| |ExtensionField&|
                |FiniteFieldCategory&| |FieldOfPrimeCharacteristic&| |Field&|
                |EuclideanDomain&| |PolynomialFactorizationExplicit&| NIL
                |UniqueFactorizationDomain&| |GcdDomain&| NIL |DivisionRing&|
                NIL NIL |Algebra&| |EntireRing&| |Algebra&| NIL NIL
                |DifferentialRing&| NIL |VectorSpace&| |Rng&| NIL |Module&|
                |Module&| |Module&| NIL NIL NIL NIL |NonAssociativeRing&| NIL
                NIL NIL NIL NIL |NonAssociativeRng&| NIL |AbelianGroup&| NIL
                NIL NIL NIL |MagmaWithUnit&| |NonAssociativeSemiRng&|
                |AbelianMonoid&| |Finite&| |Magma&| |AbelianSemiGroup&| NIL NIL
                NIL |SetCategory&| |RetractableTo&| NIL NIL NIL NIL NIL
                |BasicType&| NIL NIL)
             (CONS
              '#((|FiniteAlgebraicExtensionField| 6) (|ExtensionField| 6)
                 (|FiniteFieldCategory|) (|FieldOfPrimeCharacteristic|)
                 (|Field|) (|EuclideanDomain|)
                 (|PolynomialFactorizationExplicit|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|DivisionRing|) (|CommutativeRing|) (|LeftOreRing|)
                 (|Algebra| 200) (|EntireRing|) (|Algebra| $$)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|DifferentialRing|) (|Ring|) (|VectorSpace| 6) (|Rng|)
                 (|SemiRing|) (|Module| 6) (|Module| 200) (|Module| $$)
                 (|SemiRng|) (|BiModule| 6 6) (|BiModule| 200 200)
                 (|BiModule| $$ $$) (|NonAssociativeRing|) (|RightModule| 6)
                 (|LeftModule| 6) (|RightModule| 200) (|LeftModule| 200)
                 (|LeftModule| $$) (|NonAssociativeRng|) (|RightModule| $$)
                 (|AbelianGroup|) (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|) (|Finite|)
                 (|Magma|) (|AbelianSemiGroup|) (|Comparable|) (|StepThrough|)
                 (|CommutativeStar|) (|SetCategory|) (|RetractableTo| 6)
                 (|canonicalsClosed|) (|canonicalUnitNormal|)
                 (|noZeroDivisors|) (|TwoSidedRecip|) (|unitsKnown|)
                 (|BasicType|) (|CoercibleTo| 11) (|ConvertibleTo| 194))
              (|makeByteWordVec2| 209
                                  '(0 9 0 10 1 9 11 0 12 0 18 0 19 0 18 0 21 0
                                    6 0 25 0 6 0 27 3 8 6 0 28 6 29 2 33 30 32
                                    6 34 1 33 18 35 36 1 18 37 0 38 2 11 0 0 0
                                    39 1 37 11 0 40 2 41 0 0 0 42 2 18 6 0 37
                                    45 1 6 0 0 46 0 49 0 50 2 6 0 0 0 52 2 33
                                    35 35 28 55 2 0 56 0 0 57 2 18 0 6 37 60 2
                                    18 0 0 0 61 1 33 18 35 62 2 18 0 0 0 63 2
                                    18 0 0 0 64 2 18 35 0 37 65 2 18 0 0 0 68 2
                                    18 0 0 0 69 1 0 56 0 71 3 18 73 0 0 0 74 2
                                    76 56 0 0 77 1 82 81 32 83 1 82 37 32 85 1
                                    33 35 58 92 2 37 56 0 0 94 2 8 0 6 0 99 2 8
                                    6 0 28 106 2 6 0 0 0 107 1 6 11 0 110 1 6
                                    56 0 111 2 6 56 0 0 112 2 11 0 0 0 113 1 18
                                    11 0 114 2 11 0 0 0 115 2 41 11 116 0 117 0
                                    6 37 119 1 28 120 0 121 1 124 123 0 125 0 0
                                    0 126 0 30 0 128 1 82 32 18 129 0 132 0 133
                                    2 132 0 134 0 135 1 132 0 0 137 2 49 0 138
                                    0 139 2 49 140 58 0 141 2 33 35 35 58 147 2
                                    8 0 0 0 148 0 6 37 149 1 33 35 58 151 2 33
                                    35 35 35 153 1 6 0 0 154 1 8 0 37 155 2 33
                                    35 58 58 157 1 33 58 35 158 1 33 159 58 160
                                    1 159 161 0 162 1 164 0 163 165 2 33 35 35
                                    28 167 1 33 56 35 168 1 8 0 0 170 2 8 0 0 0
                                    172 2 8 0 0 0 174 2 8 56 0 0 176 1 6 0 28
                                    178 2 8 0 0 6 179 2 33 35 35 35 184 1 33 35
                                    35 185 2 33 35 35 58 187 2 0 56 0 0 57 1 0
                                    56 0 71 1 0 206 0 1 1 0 0 0 1 1 0 56 0 1 1
                                    0 56 0 1 0 0 37 1 2 2 0 0 58 87 1 0 6 0 89
                                    1 2 132 28 142 2 0 190 0 0 1 1 2 198 197 1
                                    1 0 0 0 1 1 0 120 0 1 2 2 195 196 197 1 2 2
                                    56 0 0 1 0 0 37 86 2 0 56 0 0 1 0 2 37 156
                                    0 0 0 1 1 0 190 0 1 2 0 0 0 37 1 2 0 0 0 58
                                    1 1 0 108 0 109 1 0 6 0 88 1 0 0 35 54 0 2
                                    181 182 2 0 0 0 0 1 1 0 190 0 1 0 2 0 152 2
                                    0 0 0 0 1 1 0 204 193 1 0 2 0 143 1 2 56 0
                                    1 2 3 0 0 37 1 1 3 0 0 1 1 0 56 0 1 1 3 192
                                    0 1 1 2 58 0 1 2 0 56 0 0 1 1 0 56 0 1 0 2
                                    0 95 1 2 56 0 169 2 2 0 0 58 90 1 0 6 0 91
                                    1 2 190 0 1 2 0 201 193 0 1 2 2 197 0 58 1
                                    1 0 18 0 183 1 2 58 0 127 1 2 18 0 70 2 2
                                    78 0 0 79 1 2 18 0 67 2 2 0 0 18 66 1 0 190
                                    0 1 2 0 0 0 37 1 2 0 0 0 58 1 2 0 205 0 0 1
                                    2 0 0 0 0 1 1 0 0 193 1 1 0 207 0 1 1 0 0 0
                                    186 0 2 0 1 1 2 0 58 130 1 0 56 0 105 2 0
                                    209 209 0 1 1 0 208 0 1 0 0 32 80 0 0 81 84
                                    0 2 0 93 2 0 197 197 197 1 2 0 0 0 0 1 1 0
                                    0 193 1 0 2 123 144 1 2 198 197 1 1 2 198
                                    197 1 1 0 120 0 1 0 0 58 145 0 0 192 1 3 0
                                    73 0 0 0 1 2 0 202 0 0 1 2 0 190 0 0 1 2 0
                                    201 193 0 1 1 0 37 0 1 0 2 193 1 2 0 203 0
                                    0 1 2 3 191 0 0 1 1 2 37 0 1 0 0 199 1 2 2
                                    0 0 37 1 1 2 0 0 1 1 0 58 0 59 1 0 192 0 1
                                    0 0 18 146 0 2 0 126 0 2 0 1 1 0 35 0 103 1
                                    0 81 97 1 1 2 194 0 1 1 4 188 189 1 2 0 0 0
                                    0 1 1 0 0 6 53 1 0 0 200 1 1 0 0 0 1 1 0 0
                                    28 1 1 0 11 0 118 1 3 190 0 1 1 2 0 0 1 0 0
                                    37 150 0 0 97 166 1 0 97 58 98 3 0 0 0 0 0
                                    1 2 0 56 0 0 1 2 0 0 0 0 1 2 0 56 0 0 1 1 0
                                    56 0 1 2 0 0 0 28 131 2 0 0 0 37 1 2 0 0 0
                                    58 1 0 0 0 24 0 0 0 22 2 2 0 0 37 96 1 2 0
                                    0 104 2 2 0 0 37 1 1 2 0 0 1 2 0 56 0 0 177
                                    2 0 0 0 6 102 2 0 0 0 0 101 2 0 0 0 0 175 1
                                    0 0 0 171 2 0 0 0 0 173 2 0 0 6 0 100 2 0 0
                                    0 6 1 2 0 0 200 0 1 2 0 0 0 200 1 2 0 0 37
                                    0 1 2 0 0 28 0 180 2 0 0 0 0 136 2 0 0 58 0
                                    1)))))
           '|lookupComplete|)) 
