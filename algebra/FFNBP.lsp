
(SDEFUN |FFNBP;coerce;GF$;1| ((|v| GF) ($ $))
        (MAKEARR1 (QREFELT $ 17) (SPADCALL |v| (QREFELT $ 47) (QREFELT $ 52)))) 

(PUT '|FFNBP;represents;V$;2| '|SPADreplace| '(XLAM (|v|) |v|)) 

(SDEFUN |FFNBP;represents;V$;2| ((|v| |Vector| GF) ($ $)) |v|) 

(SDEFUN |FFNBP;degree;$Pi;3| ((|a| $) ($ |PositiveInteger|))
        (SPROG ((|d| (|PositiveInteger|)) (|b| ($)))
               (SEQ (LETT |d| 1 . #1=(|FFNBP;degree;$Pi;3|))
                    (LETT |b| (SPADCALL |a| 1 (QREFELT $ 55)) . #1#)
                    (SEQ G190
                         (COND
                          ((NULL (SPADCALL |b| |a| (QREFELT $ 57))) (GO G191)))
                         (SEQ (LETT |b| (SPADCALL |b| 1 (QREFELT $ 55)) . #1#)
                              (EXIT (LETT |d| (+ |d| 1) . #1#)))
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
                 (|spadConstant| $ 21) (QREFELT $ 61))
                . #1=(|FFNBP;linearAssociatedExp;$Sup$;4|))
          (LETT |r|
                (SPADCALL
                 (SPADCALL |f| (SPADCALL |x| (QREFELT $ 62)) (QREFELT $ 63))
                 |xm| (QREFELT $ 64))
                . #1#)
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
                       (|spadConstant| $ 21) (QREFELT $ 61))
                      |FFNBP;linearAssociatedOrder;$Sup;6|)
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
          (#1=#:G750 NIL)
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
                         (|spadConstant| $ 21) (QREFELT $ 61))
                        . #4=(|FFNBP;linearAssociatedLog;2$U;7|))
                  (LETT |e|
                        (SPADCALL (SPADCALL |b| (QREFELT $ 62)) |xm|
                                  (SPADCALL |x| (QREFELT $ 62)) (QREFELT $ 74))
                        . #4#)
                  (EXIT
                   (COND
                    ((SPADCALL |e| (CONS 1 "failed") (QREFELT $ 77))
                     (CONS 1 "failed"))
                    (#3#
                     (SEQ
                      (LETT |e1|
                            (PROG2 (LETT #1# |e| . #4#)
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
                                              #1#))
                            . #4#)
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
        (SPROG ((#1=#:G776 NIL) (|i| NIL) (#2=#:G775 NIL))
               (SEQ
                (COND
                 ((SPADCALL (REM (QREFELT $ 17) |n|) 0 (QREFELT $ 94))
                  (|error| "argument must divide extension degree"))
                 ('T
                  (PROGN
                   (LETT #2# (GETREFV |n|) . #3=(|FFNBP;basis;PiV;14|))
                   (SEQ (LETT |i| 0 . #3#) (LETT #1# (- |n| 1) . #3#) G190
                        (COND ((|greater_SI| |i| #1#) (GO G191)))
                        (SEQ
                         (EXIT
                          (SETELT #2# |i|
                                  (SPADCALL
                                   (SPADCALL (SPADCALL (QREFELT $ 95)) |n|
                                             (QREFELT $ 87))
                                   |i| (QREFELT $ 96)))))
                        (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                        (EXIT NIL))
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
          (|mon| (|OutputForm|)) (#1=#:G802 NIL) (|i| NIL) (#2=#:G803 NIL)
          (|b| NIL) (|n| (|PositiveInteger|)))
         (SEQ (LETT |l| NIL . #3=(|FFNBP;coerce;$Of;22|))
              (LETT |n| (QREFELT $ 17) . #3#)
              (EXIT
               (COND
                ((EQL |n| 1)
                 (SPADCALL (SPADCALL |x| 1 (QREFELT $ 106)) (QREFELT $ 110)))
                (#4='T
                 (SEQ
                  (SEQ (LETT |b| NIL . #3#) (LETT #2# (QREFELT $ 43) . #3#)
                       (LETT |i| 1 . #3#) (LETT #1# |n| . #3#) G190
                       (COND
                        ((OR (|greater_SI| |i| #1#) (ATOM #2#)
                             (PROGN (LETT |b| (CAR #2#) . #3#) NIL))
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
                                     |b| (QREFELT $ 113))))
                                  . #3#)
                            (EXIT (LETT |l| (CONS |mon| |l|) . #3#)))))))
                       (LETT |i|
                             (PROG1 (|inc_SI| |i|) (LETT #2# (CDR #2#) . #3#))
                             . #3#)
                       (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (COND
                    ((NULL |l|)
                     (SPADCALL (|spadConstant| $ 19) (QREFELT $ 114)))
                    (#4#
                     (SEQ
                      (LETT |r| (SPADCALL (ELT $ 115) |l| (QREFELT $ 117))
                            . #3#)
                      (EXIT |r|)))))))))))) 

(SDEFUN |FFNBP;initializeElt| (($ |Void|))
        (SEQ
         (SETELT $ 44
                 (SPADCALL
                  (SPADCALL
                   (-
                    (SPADCALL (SPADCALL (QREFELT $ 119)) (QREFELT $ 17)
                              (QREFELT $ 120))
                    1)
                   (QREFELT $ 122))
                  (QREFELT $ 126)))
         (SETELT $ 48 (SPADCALL (SPADCALL (QREFELT $ 127)) (QREFELT $ 128)))
         (SETELT $ 15 NIL) (EXIT (SPADCALL (QREFELT $ 129))))) 

(SDEFUN |FFNBP;initializeMult| (($ |Void|))
        (SEQ (SETELT $ 23 (SPADCALL (QREFELT $ 20) (QREFELT $ 130)))
             (SPADCALL (QREFELT $ 23) (QREFELT $ 47) (QREFELT $ 34))
             (SETELT $ 16 NIL) (EXIT (SPADCALL (QREFELT $ 129))))) 

(SDEFUN |FFNBP;initializeLog| (($ |Void|))
        (SPROG
         ((#1=#:G825 NIL) (|a| ($)) (#2=#:G831 NIL) (#3=#:G819 NIL) (|i| NIL)
          (|tbl| (|Table| (|PositiveInteger|) (|NonNegativeInteger|)))
          (|n| (|Integer|)) (|d| (|Integer|)) (|l| (|Integer|)) (|base| ($))
          (|fac| (|Integer|)) (#4=#:G830 NIL) (|f| NIL) (|limit| (|Integer|)))
         (SEQ (COND ((QREFELT $ 15) (|FFNBP;initializeElt| $)))
              (LETT |limit| 30 . #5=(|FFNBP;initializeLog|))
              (SEQ (LETT |f| NIL . #5#) (LETT #4# (QREFELT $ 44) . #5#) G190
                   (COND
                    ((OR (ATOM #4#) (PROGN (LETT |f| (CAR #4#) . #5#) NIL))
                     (GO G191)))
                   (SEQ (LETT |fac| (QCAR |f|) . #5#)
                        (LETT |base|
                              (SPADCALL
                               (SPADCALL (QREFELT $ 48) (QREFELT $ 131))
                               (QUOTIENT2
                                (-
                                 (SPADCALL (SPADCALL (QREFELT $ 119))
                                           (QREFELT $ 17) (QREFELT $ 120))
                                 1)
                                |fac|)
                               (QREFELT $ 132))
                              . #5#)
                        (LETT |l| (INTEGER-LENGTH |fac|) . #5#)
                        (LETT |n| 0 . #5#)
                        (COND
                         ((ODDP |l|)
                          (LETT |n| (ASH |fac| (- (QUOTIENT2 |l| 2))) . #5#))
                         ('T (LETT |n| (ASH 1 (QUOTIENT2 |l| 2)) . #5#)))
                        (COND
                         ((< |n| |limit|)
                          (SEQ
                           (LETT |d| (+ (QUOTIENT2 (- |fac| 1) |limit|) 1)
                                 . #5#)
                           (EXIT
                            (LETT |n| (+ (QUOTIENT2 (- |fac| 1) |d|) 1)
                                  . #5#)))))
                        (LETT |tbl| (SPADCALL (QREFELT $ 134)) . #5#)
                        (LETT |a| (|spadConstant| $ 22) . #5#)
                        (SEQ (LETT |i| 0 . #5#)
                             (LETT #2#
                                   (PROG1 (LETT #3# (- |n| 1) . #5#)
                                     (|check_subtype2| (>= #3# 0)
                                                       '(|NonNegativeInteger|)
                                                       '(|Integer|) #3#))
                                   . #5#)
                             G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
                             (SEQ
                              (SPADCALL
                               (CONS (SPADCALL |a| (QREFELT $ 128)) |i|) |tbl|
                               (QREFELT $ 136))
                              (EXIT
                               (LETT |a| (SPADCALL |a| |base| (QREFELT $ 137))
                                     . #5#)))
                             (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                             (EXIT NIL))
                        (EXIT
                         (SPADCALL
                          (CONS
                           (PROG1 (LETT #1# |fac| . #5#)
                             (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                               '(|Integer|) #1#))
                           (SPADCALL |tbl| (QREFELT $ 138)))
                          (QREFELT $ 51) (QREFELT $ 140))))
                   (LETT #4# (CDR #4#) . #5#) (GO G190) G191 (EXIT NIL))
              (SETELT $ 14 NIL) (EXIT (SPADCALL (QREFELT $ 129)))))) 

(SDEFUN |FFNBP;tableForDiscreteLogarithm;IT;26|
        ((|fac| |Integer|)
         ($ |Table| (|PositiveInteger|) (|NonNegativeInteger|)))
        (SPROG
         ((|tbl|
           (|Union| (|Table| (|PositiveInteger|) (|NonNegativeInteger|))
                    "failed"))
          (#1=#:G833 NIL))
         (SEQ (COND ((QREFELT $ 14) (|FFNBP;initializeLog| $)))
              (LETT |tbl|
                    (SPADCALL
                     (PROG1
                         (LETT #1# |fac|
                               . #2=(|FFNBP;tableForDiscreteLogarithm;IT;26|))
                       (|check_subtype2| (> #1# 0) '(|PositiveInteger|)
                                         '(|Integer|) #1#))
                     (QREFELT $ 51) (QREFELT $ 142))
                    . #2#)
              (EXIT
               (COND
                ((QEQCAR |tbl| 1)
                 (|error|
                  "tableForDiscreteLogarithm: argument must be prime divisor of the order of the multiplicative group"))
                ('T (QCDR |tbl|))))))) 

(SDEFUN |FFNBP;primitiveElement;$;27| (($ $))
        (SEQ (COND ((QREFELT $ 15) (|FFNBP;initializeElt| $)))
             (EXIT (SPADCALL (QREFELT $ 48) (QREFELT $ 131))))) 

(SDEFUN |FFNBP;factorsOfCyclicGroupSize;L;28|
        (($ |List|
          (|Record| (|:| |factor| #1=(|Integer|)) (|:| |exponent| #1#))))
        (SEQ (COND ((NULL (QREFELT $ 44)) (|FFNBP;initializeElt| $)))
             (EXIT (QREFELT $ 44)))) 

(SDEFUN |FFNBP;extensionDegree;Pi;29| (($ |PositiveInteger|)) (QREFELT $ 17)) 

(SDEFUN |FFNBP;definingPolynomial;Sup;30| (($ |SparseUnivariatePolynomial| GF))
        (QREFELT $ 20)) 

(SDEFUN |FFNBP;trace;$Pi$;31| ((|a| $) (|d| |PositiveInteger|) ($ $))
        (SPROG ((|erg| ($)) (#1=#:G849 NIL) (|i| NIL) (|v| ($)))
               (SEQ
                (LETT |v| (SPADCALL |a| |d| (QREFELT $ 148))
                      . #2=(|FFNBP;trace;$Pi$;31|))
                (LETT |erg| |v| . #2#)
                (SEQ (LETT |i| 2 . #2#)
                     (LETT #1# (QUOTIENT2 (QREFELT $ 17) |d|) . #2#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |erg| (SPADCALL |erg| |v| (QREFELT $ 149))
                             . #2#)))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |erg|)))) 

(SDEFUN |FFNBP;characteristic;Nni;32| (($ |NonNegativeInteger|))
        (SPADCALL (QREFELT $ 150))) 

(SDEFUN |FFNBP;random;$;33| (($ $)) (SPADCALL (QREFELT $ 17) (QREFELT $ 152))) 

(SDEFUN |FFNBP;*;3$;34| ((|x| $) (|y| $) ($ $))
        (SEQ (COND ((QREFELT $ 16) (|FFNBP;initializeMult| $)))
             (SPADCALL (QREFELT $ 23) (QREFELT $ 47) (QREFELT $ 34))
             (EXIT (SPADCALL |x| |y| (QREFELT $ 154))))) 

(SDEFUN |FFNBP;One;$;35| (($ $))
        (MAKEARR1 (QREFELT $ 17) (SPADCALL (QREFELT $ 47) (QREFELT $ 155)))) 

(SDEFUN |FFNBP;Zero;$;36| (($ $)) (SPADCALL (QREFELT $ 17) (QREFELT $ 156))) 

(SDEFUN |FFNBP;size;Nni;37| (($ |NonNegativeInteger|))
        (SPADCALL (SPADCALL (QREFELT $ 119)) (QREFELT $ 17) (QREFELT $ 120))) 

(SDEFUN |FFNBP;index;Pi$;38| ((|n| |PositiveInteger|) ($ $))
        (SPADCALL (QREFELT $ 17) |n| (QREFELT $ 158))) 

(SDEFUN |FFNBP;lookup;$Pi;39| ((|x| $) ($ |PositiveInteger|))
        (SPADCALL |x| (QREFELT $ 159))) 

(SDEFUN |FFNBP;basis;V;40| (($ |Vector| $))
        (SPROG
         ((#1=#:G863 NIL) (|e| NIL) (#2=#:G862 NIL)
          (|a| (|Vector| (|Vector| GF))))
         (SEQ
          (LETT |a| (SPADCALL (QREFELT $ 17) (QREFELT $ 161))
                . #3=(|FFNBP;basis;V;40|))
          (EXIT
           (SPADCALL
            (PROGN
             (LETT #2# NIL . #3#)
             (SEQ (LETT |e| NIL . #3#)
                  (LETT #1# (SPADCALL |a| (QREFELT $ 163)) . #3#) G190
                  (COND
                   ((OR (ATOM #1#) (PROGN (LETT |e| (CAR #1#) . #3#) NIL))
                    (GO G191)))
                  (SEQ (EXIT (LETT #2# (CONS |e| #2#) . #3#)))
                  (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                  (EXIT (NREVERSE #2#))))
            (QREFELT $ 166)))))) 

(SDEFUN |FFNBP;^;$I$;41| ((|x| $) (|e| |Integer|) ($ $))
        (SEQ (COND ((QREFELT $ 16) (|FFNBP;initializeMult| $)))
             (SPADCALL (QREFELT $ 23) (QREFELT $ 47) (QREFELT $ 34))
             (EXIT (SPADCALL |x| |e| (QREFELT $ 168))))) 

(SDEFUN |FFNBP;normal?;$B;42| ((|x| $) ($ |Boolean|))
        (SPADCALL |x| (QREFELT $ 169))) 

(SDEFUN |FFNBP;-;2$;43| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 171))) 

(SDEFUN |FFNBP;+;3$;44| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 173))) 

(SDEFUN |FFNBP;-;3$;45| ((|x| $) (|y| $) ($ $))
        (SPADCALL |x| |y| (QREFELT $ 175))) 

(SDEFUN |FFNBP;=;2$B;46| ((|x| $) (|y| $) ($ |Boolean|))
        (SPADCALL |x| |y| (QREFELT $ 177))) 

(SDEFUN |FFNBP;*;I2$;47| ((|n| |Integer|) (|x| $) ($ $))
        (SPADCALL |x| (SPADCALL |n| (QREFELT $ 179)) (QREFELT $ 180))) 

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
        (SPROG ((#1=#:G889 NIL) (|erg| (|Boolean|)) (#2=#:G890 NIL) (|i| NIL))
               (SEQ (LETT |erg| 'T . #3=(|FFNBP;inGroundField?;$B;50|))
                    (SEQ
                     (EXIT
                      (SEQ (LETT |i| 2 . #3#) (LETT #2# (QREFELT $ 17) . #3#)
                           G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
                           (SEQ
                            (EXIT
                             (COND
                              ((NULL
                                (SPADCALL (SPADCALL |x| |i| (QREFELT $ 106))
                                          (SPADCALL |x| 1 (QREFELT $ 106))
                                          (QREFELT $ 112)))
                               (PROGN
                                (LETT #1# (LETT |erg| NIL . #3#) . #3#)
                                (GO #4=#:G886))))))
                           (LETT |i| (|inc_SI| |i|) . #3#) (GO G190) G191
                           (EXIT NIL)))
                     #4# (EXIT #1#))
                    (EXIT |erg|)))) 

(SDEFUN |FFNBP;/;3$;51| ((|x| $) (|y| $) ($ $))
        (SEQ (COND ((QREFELT $ 16) (|FFNBP;initializeMult| $)))
             (SPADCALL (QREFELT $ 23) (QREFELT $ 47) (QREFELT $ 34))
             (EXIT (SPADCALL |x| |y| (QREFELT $ 185))))) 

(SDEFUN |FFNBP;inv;2$;52| ((|a| $) ($ $))
        (SEQ (COND ((QREFELT $ 16) (|FFNBP;initializeMult| $)))
             (SPADCALL (QREFELT $ 23) (QREFELT $ 47) (QREFELT $ 34))
             (EXIT (SPADCALL |a| (QREFELT $ 186))))) 

(SDEFUN |FFNBP;norm;$Pi$;53| ((|a| $) (|d| |PositiveInteger|) ($ $))
        (SEQ (COND ((QREFELT $ 16) (|FFNBP;initializeMult| $)))
             (SPADCALL (QREFELT $ 23) (QREFELT $ 47) (QREFELT $ 34))
             (EXIT (SPADCALL |a| |d| (QREFELT $ 188))))) 

(SDEFUN |FFNBP;normalElement;$;54| (($ $))
        (SPADCALL (QREFELT $ 17) (QREFELT $ 92))) 

(DECLAIM (NOTINLINE |FiniteFieldNormalBasisExtensionByPolynomial;|)) 

(DEFUN |FiniteFieldNormalBasisExtensionByPolynomial| (&REST #1=#:G922)
  (SPROG NIL
         (PROG (#2=#:G923)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FiniteFieldNormalBasisExtensionByPolynomial|)
                                               '|domainEqualList|)
                    . #3=(|FiniteFieldNormalBasisExtensionByPolynomial|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY
                       (|function|
                        |FiniteFieldNormalBasisExtensionByPolynomial;|)
                       #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|FiniteFieldNormalBasisExtensionByPolynomial|)))))))))) 

(DEFUN |FiniteFieldNormalBasisExtensionByPolynomial;| (|#1| |#2|)
  (SPROG
   ((#1=#:G729 NIL) (#2=#:G921 NIL) (|i| NIL) (#3=#:G920 NIL) (|qs| NIL)
    (|pv$| NIL) (#4=#:G919 NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
   (SEQ
    (PROGN
     (LETT DV$1 (|devaluate| |#1|)
           . #5=(|FiniteFieldNormalBasisExtensionByPolynomial|))
     (LETT DV$2 (|devaluate| |#2|) . #5#)
     (LETT |dv$|
           (LIST '|FiniteFieldNormalBasisExtensionByPolynomial| DV$1 DV$2)
           . #5#)
     (LETT $ (GETREFV 211) . #5#)
     (QSETREFV $ 0 |dv$|)
     (QSETREFV $ 3
               (LETT |pv$|
                     (|buildPredVector| 0 0
                                        (LIST
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (LETT #4#
                                               (|HasCategory| |#1| '(|Finite|))
                                               . #5#)
                                         (OR
                                          (|HasCategory| |#1|
                                                         '(|CharacteristicNonZero|))
                                          #4#)))
                     . #5#))
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
               (SEQ (LETT |qs| (SPADCALL '|q| (QREFELT $ 12)) . #5#)
                    (EXIT
                     (SPADCALL
                      (LIST (QREFELT $ 13)
                            (SPADCALL (QREFELT $ 13) |qs| (QREFELT $ 39)))
                      (PROGN
                       (LETT #3# NIL . #5#)
                       (SEQ (LETT |i| 2 . #5#)
                            (LETT #2# (- (QREFELT $ 17) 1) . #5#) G190
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
                                     #3#)
                                    . #5#)))
                            (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                            (EXIT (NREVERSE #3#))))
                      (QREFELT $ 42)))))
     (QSETREFV $ 44 NIL)
     (QSETREFV $ 47
               (SPADCALL
                (SPADCALL (QREFELT $ 20)
                          (PROG1
                              (LETT #1#
                                    (- (SPADCALL (QREFELT $ 20) (QREFELT $ 38))
                                       1)
                                    . #5#)
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
              (|Void|) (|Record| (|:| |value| 6) (|:| |index| 209))
              (|Vector| (|List| 31)) (|InnerNormalBasisFieldFunctions| 6)
              (32 . |setFieldInfo|) (|Vector| 6) (38 . |minimalPolynomial|)
              (|NonNegativeInteger|) (43 . |degree|) (48 . ^) (54 . |coerce|)
              (|List| 11) (59 . |append|) '|basisOutput| '|facOfGroupSize|
              (65 . |coefficient|) (71 . -) '|traceAlpha| '|primitiveElt|
              (|Table| 58 133) (76 . |table|) '|discLogTable| (80 . /)
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
              (241 . |size|) (245 . ^) (|Factored| $) (251 . |factor|)
              (|Record| (|:| |factor| 28) (|:| |exponent| 28)) (|List| 123)
              (|Factored| 28) (256 . |factors|)
              (261 . |createPrimitiveElement|) |FFNBP;lookup;$Pi;39|
              (265 . |void|) (269 . |createMultiplicationTable|)
              |FFNBP;index;Pi$;38| |FFNBP;^;$I$;41| (|Table| 58 37)
              (274 . |table|) (|Record| (|:| |key| 58) (|:| |entry| 37))
              (278 . |insert!|) |FFNBP;*;3$;34| (284 . |copy|)
              (|Record| (|:| |key| 58) (|:| |entry| 133)) (289 . |insert!|)
              (|Union| 133 '"failed") (295 . |search|)
              |FFNBP;tableForDiscreteLogarithm;IT;26|
              |FFNBP;primitiveElement;$;27|
              |FFNBP;factorsOfCyclicGroupSize;L;28|
              |FFNBP;extensionDegree;Pi;29| |FFNBP;definingPolynomial;Sup;30|
              (301 . |trace|) (307 . |concat|) (313 . |characteristic|)
              |FFNBP;characteristic;Nni;32| (317 . |random|)
              |FFNBP;random;$;33| (322 . *) (328 . |inv|) (333 . |zero|)
              |FFNBP;size;Nni;37| (338 . |index|) (344 . |lookup|)
              (|Vector| 35) (349 . |basis|) (|List| 35) (354 . |entries|)
              (|List| $$) (|Vector| $$) (359 . |vector|) |FFNBP;basis;V;40|
              (364 . ^) (370 . |normal?|) |FFNBP;normal?;$B;42| (375 . -)
              |FFNBP;-;2$;43| (380 . +) |FFNBP;+;3$;44| (386 . -)
              |FFNBP;-;3$;45| (392 . =) |FFNBP;=;2$B;46| (398 . |coerce|)
              (403 . *) |FFNBP;*;I2$;47|
              (|Union| '"prime" '"polynomial" '"normal" '"cyclic")
              |FFNBP;representationType;U;48| |FFNBP;minimalPolynomial;$Sup;49|
              (409 . /) (415 . |inv|) |FFNBP;inv;2$;52| (420 . |norm|)
              (|Union| 97 '#2="failed") (|Matrix| $) (|Union| $ '"failed")
              (|Union| 37 '"failed") (|OnePointCompletion| 58) (|List| $)
              (|InputForm|) (|Union| 197 '#2#) (|List| 198)
              (|SparseUnivariatePolynomial| $) (|Factored| 198)
              (|CardinalNumber|) (|Fraction| 28) (|Union| 194 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef| 194) (|:| |generator| $))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|String|) (|SingleInteger|) (|HashState|))
           '#(~= 426 |zero?| 432 |unitNormal| 437 |unitCanonical| 442 |unit?|
              447 |transcendent?| 452 |transcendenceDegree| 457 |trace| 461
              |tableForDiscreteLogarithm| 472 |subtractIfCan| 477
              |squareFreePolynomial| 483 |squareFreePart| 488 |squareFree| 493
              |solveLinearPolynomialEquation| 498 |smaller?| 504
              |sizeMultiplication| 510 |sizeLess?| 514 |size| 520 |sample| 524
              |rightRecip| 528 |rightPower| 533 |retractIfCan| 545 |retract|
              550 |represents| 555 |representationType| 560 |rem| 564 |recip|
              570 |random| 575 |quo| 579 |principalIdeal| 585
              |primitiveElement| 590 |primitive?| 594 |primeFrobenius| 599
              |prime?| 610 |order| 615 |opposite?| 625 |one?| 631
              |normalElement| 636 |normal?| 640 |norm| 645 |nextItem| 656
              |multiEuclidean| 661 |minimalPolynomial| 667 |lookup| 678
              |linearAssociatedOrder| 683 |linearAssociatedLog| 688
              |linearAssociatedExp| 699 |leftRecip| 705 |leftPower| 710
              |lcmCoef| 722 |lcm| 728 |latex| 739 |inv| 744 |init| 749 |index|
              753 |inGroundField?| 758 |hashUpdate!| 763 |hash| 769
              |getMultiplicationTable| 774 |getMultiplicationMatrix| 778
              |generator| 782 |gcdPolynomial| 786 |gcd| 792
              |factorsOfCyclicGroupSize| 803 |factorSquareFreePolynomial| 807
              |factorPolynomial| 812 |factor| 817 |extensionDegree| 822
              |extendedEuclidean| 830 |exquo| 843 |expressIdealMember| 849
              |euclideanSize| 855 |enumerate| 860 |divide| 864 |discreteLog|
              870 |dimension| 881 |differentiate| 885 |degree| 896
              |definingPolynomial| 906 |createPrimitiveElement| 910
              |createNormalElement| 914 |coordinates| 918 |convert| 928
              |conditionP| 933 |commutator| 938 |coerce| 944 |charthRoot| 969
              |characteristic| 979 |basis| 983 |associator| 992 |associates?|
              999 |antiCommutator| 1005 |annihilate?| 1011 |algebraic?| 1017 ^
              1022 |Zero| 1040 |One| 1044 |Frobenius| 1048 D 1059 = 1070 / 1076
              - 1088 + 1099 * 1105)
           'NIL
           (CONS
            (|makeByteWordVec2| 3
                                '(0 0 2 3 0 0 2 0 0 0 0 0 0 0 0 0 0 3 1 2 0 0 0
                                  0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
                                  0 2 0 0 2 2 0 0 0 0 0 0 0 0 0 2))
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
                |SetCategory&| |RetractableTo&| NIL NIL NIL NIL NIL
                |BasicType&| NIL NIL)
             (CONS
              '#((|FiniteAlgebraicExtensionField| 6) (|ExtensionField| 6)
                 (|FiniteFieldCategory|) (|FieldOfPrimeCharacteristic|)
                 (|Field|) (|EuclideanDomain|)
                 (|PolynomialFactorizationExplicit|) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|GcdDomain|) (|IntegralDomain|)
                 (|DivisionRing|) (|CommutativeRing|) (|LeftOreRing|)
                 (|Algebra| 201) (|EntireRing|) (|Algebra| $$)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|DifferentialRing|) (|Ring|) (|VectorSpace| 6) (|Rng|)
                 (|SemiRing|) (|Module| 6) (|Module| 201) (|Module| $$)
                 (|SemiRng|) (|BiModule| 6 6) (|BiModule| 201 201)
                 (|BiModule| $$ $$) (|NonAssociativeRing|) (|RightModule| 6)
                 (|LeftModule| 6) (|RightModule| 201) (|LeftModule| 201)
                 (|LeftModule| $$) (|NonAssociativeRng|) (|RightModule| $$)
                 (|AbelianGroup|) (|Monoid|) (|NonAssociativeSemiRing|)
                 (|CancellationAbelianMonoid|) (|SemiGroup|) (|MagmaWithUnit|)
                 (|NonAssociativeSemiRng|) (|AbelianMonoid|) (|Finite|)
                 (|Magma|) (|AbelianSemiGroup|) (|Comparable|) (|StepThrough|)
                 (|SetCategory|) (|RetractableTo| 6) (|canonicalsClosed|)
                 (|canonicalUnitNormal|) (|noZeroDivisors|) (|CommutativeStar|)
                 (|unitsKnown|) (|BasicType|) (|CoercibleTo| 11)
                 (|ConvertibleTo| 195))
              (|makeByteWordVec2| 210
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
                                    6 37 119 2 37 0 0 58 120 1 28 121 0 122 1
                                    125 124 0 126 0 0 0 127 0 30 0 129 1 82 32
                                    18 130 0 133 0 134 2 133 0 135 0 136 1 133
                                    0 0 138 2 49 0 139 0 140 2 49 141 58 0 142
                                    2 33 35 35 58 148 2 8 0 0 0 149 0 6 37 150
                                    1 33 35 58 152 2 33 35 35 35 154 1 6 0 0
                                    155 1 8 0 37 156 2 33 35 58 58 158 1 33 58
                                    35 159 1 33 160 58 161 1 160 162 0 163 1
                                    165 0 164 166 2 33 35 35 28 168 1 33 56 35
                                    169 1 8 0 0 171 2 8 0 0 0 173 2 8 0 0 0 175
                                    2 8 56 0 0 177 1 6 0 28 179 2 8 0 0 6 180 2
                                    33 35 35 35 185 1 33 35 35 186 2 33 35 35
                                    58 188 2 0 56 0 0 57 1 0 56 0 71 1 0 207 0
                                    1 1 0 0 0 1 1 0 56 0 1 1 0 56 0 1 0 0 37 1
                                    2 2 0 0 58 87 1 0 6 0 89 1 2 133 28 143 2 0
                                    191 0 0 1 1 2 199 198 1 1 0 0 0 1 1 0 121 0
                                    1 2 2 196 197 198 1 2 2 56 0 0 1 0 0 37 86
                                    2 0 56 0 0 1 0 2 37 157 0 0 0 1 1 0 191 0 1
                                    2 0 0 0 37 1 2 0 0 0 58 1 1 0 108 0 109 1 0
                                    6 0 88 1 0 0 35 54 0 2 182 183 2 0 0 0 0 1
                                    1 0 191 0 1 0 2 0 153 2 0 0 0 0 1 1 0 205
                                    194 1 0 2 0 144 1 2 56 0 1 2 3 0 0 37 1 1 3
                                    0 0 1 1 0 56 0 1 1 3 193 0 1 1 2 58 0 1 2 0
                                    56 0 0 1 1 0 56 0 1 0 2 0 95 1 2 56 0 170 2
                                    2 0 0 58 90 1 0 6 0 91 1 2 191 0 1 2 0 202
                                    194 0 1 2 2 198 0 58 1 1 0 18 0 184 1 2 58
                                    0 128 1 2 18 0 70 2 2 78 0 0 79 1 2 18 0 67
                                    2 2 0 0 18 66 1 0 191 0 1 2 0 0 0 37 1 2 0
                                    0 0 58 1 2 0 206 0 0 1 2 0 0 0 0 1 1 0 0
                                    194 1 1 0 208 0 1 1 0 0 0 187 0 2 0 1 1 2 0
                                    58 131 1 0 56 0 105 2 0 210 210 0 1 1 0 209
                                    0 1 0 0 32 80 0 0 81 84 0 2 0 93 2 0 198
                                    198 198 1 2 0 0 0 0 1 1 0 0 194 1 0 2 124
                                    145 1 2 199 198 1 1 2 199 198 1 1 0 121 0 1
                                    0 0 58 146 0 0 193 1 3 0 73 0 0 0 1 2 0 203
                                    0 0 1 2 0 191 0 0 1 2 0 202 194 0 1 1 0 37
                                    0 1 0 2 194 1 2 0 204 0 0 1 2 3 192 0 0 1 1
                                    2 37 0 1 0 0 200 1 2 2 0 0 37 1 1 2 0 0 1 1
                                    0 58 0 59 1 0 193 0 1 0 0 18 147 0 2 0 127
                                    0 2 0 1 1 0 35 0 103 1 0 81 97 1 1 2 195 0
                                    1 1 4 189 190 1 2 0 0 0 0 1 1 0 0 6 53 1 0
                                    0 201 1 1 0 0 0 1 1 0 0 28 1 1 0 11 0 118 1
                                    3 191 0 1 1 2 0 0 1 0 0 37 151 0 0 97 167 1
                                    0 97 58 98 3 0 0 0 0 0 1 2 0 56 0 0 1 2 0 0
                                    0 0 1 2 0 56 0 0 1 1 0 56 0 1 2 0 0 0 28
                                    132 2 0 0 0 37 1 2 0 0 0 58 1 0 0 0 24 0 0
                                    0 22 2 2 0 0 37 96 1 2 0 0 104 2 2 0 0 37 1
                                    1 2 0 0 1 2 0 56 0 0 178 2 0 0 0 6 102 2 0
                                    0 0 0 101 2 0 0 0 0 176 1 0 0 0 172 2 0 0 0
                                    0 174 2 0 0 6 0 100 2 0 0 0 6 1 2 0 0 201 0
                                    1 2 0 0 0 201 1 2 0 0 37 0 1 2 0 0 28 0 181
                                    2 0 0 0 0 137 2 0 0 58 0 1)))))
           '|lookupComplete|)) 
