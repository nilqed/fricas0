
(SDEFUN |FPARFRAC;construct;L$;1|
        ((|l| |List|
          (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |center| UP)
                    (|:| |num| UP)))
         ($ $))
        (CONS (|spadConstant| $ 13) |l|)) 

(SDEFUN |FPARFRAC;D;2$;2| ((|r| $) ($ $)) (SPADCALL |r| (QREFELT $ 32))) 

(SDEFUN |FPARFRAC;D;$Nni$;3| ((|r| $) (|n| |NonNegativeInteger|) ($ $))
        (SPADCALL |r| |n| (QREFELT $ 34))) 

(PUT '|FPARFRAC;polyPart;$UP;4| '|SPADreplace| 'QCAR) 

(SDEFUN |FPARFRAC;polyPart;$UP;4| ((|f| $) ($ UP)) (QCAR |f|)) 

(PUT '|FPARFRAC;fracPart;$L;5| '|SPADreplace| 'QCDR) 

(SDEFUN |FPARFRAC;fracPart;$L;5|
        ((|f| $)
         ($ |List|
          (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |center| UP)
                    (|:| |num| UP))))
        (QCDR |f|)) 

(SDEFUN |FPARFRAC;+;UP2$;6| ((|p| UP) (|f| $) ($ $))
        (CONS (SPADCALL |p| (SPADCALL |f| (QREFELT $ 36)) (QREFELT $ 38))
              (SPADCALL |f| (QREFELT $ 37)))) 

(SDEFUN |FPARFRAC;differentiate;2$;7| ((|f| $) ($ $))
        (SPROG ((#1=#:G736 NIL) (|rec| NIL) (#2=#:G735 NIL))
               (SEQ
                (SPADCALL
                 (SPADCALL (SPADCALL |f| (QREFELT $ 36)) (QREFELT $ 40))
                 (SPADCALL
                  (PROGN
                   (LETT #2# NIL . #3=(|FPARFRAC;differentiate;2$;7|))
                   (SEQ (LETT |rec| NIL . #3#)
                        (LETT #1# (SPADCALL |f| (QREFELT $ 37)) . #3#) G190
                        (COND
                         ((OR (ATOM #1#)
                              (PROGN (LETT |rec| (CAR #1#) . #3#) NIL))
                          (GO G191)))
                        (SEQ
                         (EXIT
                          (LETT #2# (CONS (|FPARFRAC;diffrec| |rec| $) #2#)
                                . #3#)))
                        (LETT #1# (CDR #1#) . #3#) (GO G190) G191
                        (EXIT (NREVERSE #2#))))
                  (QREFELT $ 31))
                 (QREFELT $ 39))))) 

(SDEFUN |FPARFRAC;differentiate;$Nni$;8|
        ((|r| $) (|n| |NonNegativeInteger|) ($ $))
        (SPROG ((#1=#:G740 NIL) (|i| NIL))
               (SEQ
                (SEQ (LETT |i| 1 . #2=(|FPARFRAC;differentiate;$Nni$;8|))
                     (LETT #1# |n| . #2#) G190
                     (COND ((|greater_SI| |i| #1#) (GO G191)))
                     (SEQ
                      (EXIT (LETT |r| (SPADCALL |r| (QREFELT $ 32)) . #2#)))
                     (LETT |i| (|inc_SI| |i|) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |r|)))) 

(SDEFUN |FPARFRAC;diffrec|
        ((|rec| |Record| (|:| |exponent| (|NonNegativeInteger|))
          (|:| |center| UP) (|:| |num| UP))
         ($ |Record| (|:| |exponent| #1=(|NonNegativeInteger|))
          (|:| |center| UP) (|:| |num| UP)))
        (SPROG ((|e| #1#))
               (SEQ (LETT |e| (QVELT |rec| 0) |FPARFRAC;diffrec|)
                    (EXIT
                     (VECTOR (+ |e| 1) (QVELT |rec| 1)
                             (SPADCALL
                              (SPADCALL |e| (QVELT |rec| 2) (QREFELT $ 41))
                              (QREFELT $ 42))))))) 

(SDEFUN |FPARFRAC;convert;$F;10| ((|f| $) ($ |Fraction| UP))
        (SPROG ((|ans| (|Fraction| UP)) (#1=#:G748 NIL) (|rec| NIL))
               (SEQ
                (LETT |ans|
                      (SPADCALL (SPADCALL |f| (QREFELT $ 36)) (QREFELT $ 44))
                      . #2=(|FPARFRAC;convert;$F;10|))
                (SEQ (LETT |rec| NIL . #2#)
                     (LETT #1# (SPADCALL |f| (QREFELT $ 37)) . #2#) G190
                     (COND
                      ((OR (ATOM #1#) (PROGN (LETT |rec| (CAR #1#) . #2#) NIL))
                       (GO G191)))
                     (SEQ
                      (EXIT
                       (LETT |ans|
                             (SPADCALL |ans|
                                       (|FPARFRAC;REC2RF| (QVELT |rec| 1)
                                        (QVELT |rec| 2) (QVELT |rec| 0) $)
                                       (QREFELT $ 45))
                             . #2#)))
                     (LETT #1# (CDR #1#) . #2#) (GO G190) G191 (EXIT NIL))
                (EXIT |ans|)))) 

(SDEFUN |FPARFRAC;UP2SUP|
        ((|p| UP) ($ |SparseUnivariatePolynomial| (|Fraction| UP)))
        (SPADCALL (CONS #'|FPARFRAC;UP2SUP!0| $) |p| (QREFELT $ 51))) 

(SDEFUN |FPARFRAC;UP2SUP!0| ((|z1| NIL) ($ NIL))
        (SPADCALL (SPADCALL |z1| (QREFELT $ 47)) (QREFELT $ 44))) 

(SDEFUN |FPARFRAC;REC2RF|
        ((|d| UP) (|h| UP) (|n| |NonNegativeInteger|) ($ |Fraction| UP))
        (SPROG
         ((|ans| (|Fraction| UP))
          (|t| #1=(|SparseUnivariatePolynomial| (|Fraction| UP)))
          (#2=#:G764 NIL) (|i| NIL)
          (|rec|
           (|Record| (|:| |coef1| #1#)
                     (|:| |coef2|
                          (|SparseUnivariatePolynomial| (|Fraction| UP)))))
          (#3=#:G757 NIL) (|p| (|SparseUnivariatePolynomial| (|Fraction| UP)))
          (|aa| (|SparseUnivariatePolynomial| (|Fraction| UP)))
          (|hh| #4=(|SparseUnivariatePolynomial| (|Fraction| UP))) (|dd| #4#)
          (|a| (F)) (|m| (|NonNegativeInteger|)))
         (SEQ (LETT |m| (SPADCALL |d| (QREFELT $ 52)) . #5=(|FPARFRAC;REC2RF|))
              (EXIT
               (COND
                ((EQL |m| 1)
                 (SEQ
                  (LETT |a|
                        (SPADCALL
                         (SPADCALL
                          (SPADCALL (SPADCALL |d| (QREFELT $ 53))
                                    (QREFELT $ 54))
                          (SPADCALL |d| (QREFELT $ 54)) (QREFELT $ 55))
                         (QREFELT $ 56))
                        . #5#)
                  (EXIT
                   (SPADCALL
                    (SPADCALL (SPADCALL |h| |a| (QREFELT $ 57)) (QREFELT $ 47))
                    (SPADCALL
                     (SPADCALL (QREFELT $ 24) (SPADCALL |a| (QREFELT $ 47))
                               (QREFELT $ 58))
                     |n| (QREFELT $ 59))
                    (QREFELT $ 60)))))
                ('T
                 (SEQ (LETT |dd| (|FPARFRAC;UP2SUP| |d| $) . #5#)
                      (LETT |hh| (|FPARFRAC;UP2SUP| |h| $) . #5#)
                      (LETT |aa|
                            (SPADCALL (|spadConstant| $ 61) 1 (QREFELT $ 62))
                            . #5#)
                      (LETT |p|
                            (SPADCALL
                             (SPADCALL
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL (QREFELT $ 24) (QREFELT $ 44))
                                (QREFELT $ 63))
                               |aa| (QREFELT $ 64))
                              |n| (QREFELT $ 65))
                             |dd| (QREFELT $ 66))
                            . #5#)
                      (LETT |rec|
                            (PROG2
                                (LETT #3#
                                      (SPADCALL |p| |dd| |hh| (QREFELT $ 69))
                                      . #5#)
                                (QCDR #3#)
                              (|check_union2| (QEQCAR #3# 0)
                                              (|Record|
                                               (|:| |coef1|
                                                    (|SparseUnivariatePolynomial|
                                                     (|Fraction|
                                                      (QREFELT $ 7))))
                                               (|:| |coef2|
                                                    (|SparseUnivariatePolynomial|
                                                     (|Fraction|
                                                      (QREFELT $ 7)))))
                                              (|Union|
                                               (|Record|
                                                (|:| |coef1|
                                                     (|SparseUnivariatePolynomial|
                                                      (|Fraction|
                                                       (QREFELT $ 7))))
                                                (|:| |coef2|
                                                     (|SparseUnivariatePolynomial|
                                                      (|Fraction|
                                                       (QREFELT $ 7)))))
                                               "failed")
                                              #3#))
                            . #5#)
                      (LETT |t| (QCAR |rec|) . #5#)
                      (LETT |ans| (SPADCALL |t| 0 (QREFELT $ 70)) . #5#)
                      (SEQ (LETT |i| 1 . #5#)
                           (LETT #2# (- (SPADCALL |d| (QREFELT $ 52)) 1) . #5#)
                           G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
                           (SEQ
                            (LETT |t|
                                  (SPADCALL (SPADCALL |t| |aa| (QREFELT $ 71))
                                            |dd| (QREFELT $ 66))
                                  . #5#)
                            (EXIT
                             (LETT |ans|
                                   (SPADCALL |ans|
                                             (SPADCALL |t| |i| (QREFELT $ 70))
                                             (QREFELT $ 45))
                                   . #5#)))
                           (LETT |i| (|inc_SI| |i|) . #5#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT |ans|)))))))) 

(SDEFUN |FPARFRAC;fullPartialFraction;F$;13| ((|f| |Fraction| UP) ($ $))
        (SPROG
         ((#1=#:G777 NIL) (#2=#:G790 NIL) (|rec| NIL) (#3=#:G789 NIL)
          (|qr| (|Record| (|:| |quotient| UP) (|:| |remainder| UP)))
          (|d| (UP)))
         (SEQ
          (LETT |qr|
                (SPADCALL (SPADCALL |f| (QREFELT $ 72))
                          (LETT |d| (SPADCALL |f| (QREFELT $ 73))
                                . #4=(|FPARFRAC;fullPartialFraction;F$;13|))
                          (QREFELT $ 75))
                . #4#)
          (EXIT
           (SPADCALL (QCAR |qr|)
                     (SPADCALL
                      (SPADCALL
                       (PROGN
                        (LETT #3# NIL . #4#)
                        (SEQ (LETT |rec| NIL . #4#)
                             (LETT #2#
                                   (SPADCALL
                                    (SPADCALL (SPADCALL |f| (QREFELT $ 73))
                                              (QREFELT $ 77))
                                    (QREFELT $ 81))
                                   . #4#)
                             G190
                             (COND
                              ((OR (ATOM #2#)
                                   (PROGN (LETT |rec| (CAR #2#) . #4#) NIL))
                               (GO G191)))
                             (SEQ
                              (EXIT
                               (LETT #3#
                                     (CONS
                                      (|FPARFRAC;fullParFrac| (QCDR |qr|) |d|
                                       (QCAR |rec|)
                                       (PROG1 (LETT #1# (QCDR |rec|) . #4#)
                                         (|check_subtype2| (>= #1# 0)
                                                           '(|NonNegativeInteger|)
                                                           '(|Integer|) #1#))
                                       $)
                                      #3#)
                                     . #4#)))
                             (LETT #2# (CDR #2#) . #4#) (GO G190) G191
                             (EXIT (NREVERSE #3#))))
                       (QREFELT $ 83))
                      (QREFELT $ 31))
                     (QREFELT $ 39)))))) 

(SDEFUN |FPARFRAC;fullParFrac|
        ((|a| UP) (|d| UP) (|q| UP) (|n| |NonNegativeInteger|)
         ($ |List|
          (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |center| UP)
                    (|:| |num| UP))))
        (SPROG
         ((|bm| (UP)) (|em| (UP)) (|um| (|OrderlyDifferentialPolynomial| UP))
          (|cm| (UP))
          (|ans|
           (|List|
            (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |center| UP)
                      (|:| |num| UP))))
          (#1=#:G799 NIL) (|qq| (UP)) (|lval| (|List| UP))
          (|lvar| (|List| (|OrderlyDifferentialVariable| (|Symbol|))))
          (|h| (|Fraction| (|OrderlyDifferentialPolynomial| UP))) (|pp| (UP))
          (|p| (|OrderlyDifferentialPolynomial| UP)) (#2=#:G805 NIL) (|m| NIL)
          (|cn| (UP)) (|c| (UP))
          (|rec| (|Record| (|:| |coef1| UP) (|:| |coef2| UP))) (#3=#:G794 NIL)
          (|q1| (UP)) (|q0| (UP)) (|un| (|OrderlyDifferentialPolynomial| UP))
          (|u1| (|OrderlyDifferentialPolynomial| UP)) (|b| (UP)) (|e| (UP)))
         (SEQ (LETT |ans| NIL . #4=(|FPARFRAC;fullParFrac|))
              (LETT |em|
                    (LETT |e|
                          (SPADCALL |d| (SPADCALL |q| |n| (QREFELT $ 59))
                                    (QREFELT $ 85))
                          . #4#)
                    . #4#)
              (LETT |rec|
                    (PROG2
                        (LETT #3#
                              (SPADCALL |e| |q| (|spadConstant| $ 22)
                                        (QREFELT $ 86))
                              . #4#)
                        (QCDR #3#)
                      (|check_union2| (QEQCAR #3# 0)
                                      (|Record| (|:| |coef1| (QREFELT $ 7))
                                                (|:| |coef2| (QREFELT $ 7)))
                                      (|Union|
                                       (|Record| (|:| |coef1| (QREFELT $ 7))
                                                 (|:| |coef2| (QREFELT $ 7)))
                                       #5="failed")
                                      #3#))
                    . #4#)
              (LETT |bm| (LETT |b| (QCAR |rec|) . #4#) . #4#)
              (LETT |lvar| (LIST (QREFELT $ 17)) . #4#)
              (LETT |um| (|spadConstant| $ 88) . #4#)
              (LETT |un|
                    (SPADCALL
                     (LETT |u1| (SPADCALL (QREFELT $ 17) (QREFELT $ 89)) . #4#)
                     |n| (QREFELT $ 90))
                    . #4#)
              (LETT |lval|
                    (LIST
                     (LETT |q1|
                           (LETT |q|
                                 (SPADCALL (LETT |q0| |q| . #4#)
                                           (QREFELT $ 40))
                                 . #4#)
                           . #4#))
                    . #4#)
              (LETT |h|
                    (SPADCALL (SPADCALL |a| (QREFELT $ 91))
                              (SPADCALL |e| |un| (QREFELT $ 92))
                              (QREFELT $ 94))
                    . #4#)
              (LETT |rec|
                    (PROG2
                        (LETT #3#
                              (SPADCALL |q1| |q0| (|spadConstant| $ 22)
                                        (QREFELT $ 86))
                              . #4#)
                        (QCDR #3#)
                      (|check_union2| (QEQCAR #3# 0)
                                      (|Record| (|:| |coef1| (QREFELT $ 7))
                                                (|:| |coef2| (QREFELT $ 7)))
                                      (|Union|
                                       (|Record| (|:| |coef1| (QREFELT $ 7))
                                                 (|:| |coef2| (QREFELT $ 7)))
                                       #5#)
                                      #3#))
                    . #4#)
              (LETT |c| (QCAR |rec|) . #4#)
              (LETT |cm| (|spadConstant| $ 22) . #4#)
              (LETT |cn|
                    (SPADCALL (SPADCALL |c| |n| (QREFELT $ 59)) |q0|
                              (QREFELT $ 95))
                    . #4#)
              (SEQ (LETT |m| 1 . #4#) (LETT #2# |n| . #4#) G190
                   (COND ((|greater_SI| |m| #2#) (GO G191)))
                   (SEQ
                    (LETT |p|
                          (SPADCALL
                           (SPADCALL
                            (SPADCALL (SPADCALL |em| |un| (QREFELT $ 92)) |um|
                                      (QREFELT $ 96))
                            |h| (QREFELT $ 97))
                           (QREFELT $ 98))
                          . #4#)
                    (LETT |pp|
                          (SPADCALL
                           (SPADCALL |p| |lvar| |lval| (QREFELT $ 101))
                           (QREFELT $ 102))
                          . #4#)
                    (LETT |h|
                          (SPADCALL
                           (SPADCALL (SPADCALL |m| (QREFELT $ 105))
                                     (QREFELT $ 106))
                           (SPADCALL |h| (QREFELT $ 107)) (QREFELT $ 108))
                          . #4#)
                    (LETT |q| (SPADCALL |q| (QREFELT $ 40)) . #4#)
                    (LETT |lvar|
                          (CONS (SPADCALL (QREFELT $ 11) |m| (QREFELT $ 16))
                                |lvar|)
                          . #4#)
                    (LETT |lval|
                          (CONS
                           (SPADCALL
                            (SPADCALL (SPADCALL (+ |m| 1) (QREFELT $ 109))
                                      (QREFELT $ 110))
                            |q| (QREFELT $ 111))
                           |lval|)
                          . #4#)
                    (LETT |qq|
                          (SPADCALL |q0| (SPADCALL |pp| |q0| (QREFELT $ 112))
                                    (QREFELT $ 85))
                          . #4#)
                    (COND
                     ((SPADCALL (SPADCALL |qq| (QREFELT $ 52)) 0
                                (QREFELT $ 114))
                      (LETT |ans|
                            (CONS
                             (VECTOR
                              (PROG1 (LETT #1# (- (+ |n| 1) |m|) . #4#)
                                (|check_subtype2| (>= #1# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #1#))
                              |qq|
                              (SPADCALL
                               (SPADCALL
                                (SPADCALL (SPADCALL |pp| |bm| (QREFELT $ 115))
                                          |cn| (QREFELT $ 115))
                                |cm| (QREFELT $ 115))
                               |qq| (QREFELT $ 95)))
                             |ans|)
                            . #4#)))
                    (LETT |cm|
                          (SPADCALL (SPADCALL |c| |cm| (QREFELT $ 115)) |q0|
                                    (QREFELT $ 95))
                          . #4#)
                    (LETT |um| (SPADCALL |u1| |um| (QREFELT $ 96)) . #4#)
                    (LETT |em| (SPADCALL |e| |em| (QREFELT $ 115)) . #4#)
                    (EXIT
                     (LETT |bm|
                           (SPADCALL (SPADCALL |b| |bm| (QREFELT $ 115)) |q0|
                                     (QREFELT $ 95))
                           . #4#)))
                   (LETT |m| (|inc_SI| |m|) . #4#) (GO G190) G191 (EXIT NIL))
              (EXIT |ans|)))) 

(SDEFUN |FPARFRAC;coerce;$Of;15| ((|f| $) ($ |OutputForm|))
        (SPROG
         ((|p| (UP)) (|ans| (|OutputForm|))
          (|l|
           (|List|
            (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |center| UP)
                      (|:| |num| UP)))))
         (SEQ
          (LETT |ans|
                (|FPARFRAC;FP2O|
                 (LETT |l| (SPADCALL |f| (QREFELT $ 37))
                       . #1=(|FPARFRAC;coerce;$Of;15|))
                 $)
                . #1#)
          (EXIT
           (COND
            ((SPADCALL (LETT |p| (SPADCALL |f| (QREFELT $ 36)) . #1#)
                       (QREFELT $ 116))
             (COND ((NULL |l|) (SPADCALL 0 (QREFELT $ 27))) (#2='T |ans|)))
            ((NULL |l|) (SPADCALL |p| (QREFELT $ 25)))
            (#2#
             (SPADCALL (SPADCALL |p| (QREFELT $ 25)) |ans|
                       (QREFELT $ 117)))))))) 

(SDEFUN |FPARFRAC;FP2O|
        ((|l| |List|
          (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |center| UP)
                    (|:| |num| UP)))
         ($ |OutputForm|))
        (SPROG
         ((|ans| (|OutputForm|)) (#1=#:G816 NIL)
          (|rec|
           (|Record| (|:| |exponent| (|NonNegativeInteger|)) (|:| |center| UP)
                     (|:| |num| UP))))
         (SEQ
          (COND ((NULL |l|) (SPADCALL (QREFELT $ 119)))
                ('T
                 (SEQ (LETT |rec| (|SPADfirst| |l|) . #2=(|FPARFRAC;FP2O|))
                      (LETT |ans|
                            (|FPARFRAC;output| (QVELT |rec| 0) (QVELT |rec| 1)
                             (QVELT |rec| 2) $)
                            . #2#)
                      (SEQ (LETT |rec| NIL . #2#) (LETT #1# (CDR |l|) . #2#)
                           G190
                           (COND
                            ((OR (ATOM #1#)
                                 (PROGN (LETT |rec| (CAR #1#) . #2#) NIL))
                             (GO G191)))
                           (SEQ
                            (EXIT
                             (LETT |ans|
                                   (SPADCALL |ans|
                                             (|FPARFRAC;output| (QVELT |rec| 0)
                                              (QVELT |rec| 1) (QVELT |rec| 2)
                                              $)
                                             (QREFELT $ 117))
                                   . #2#)))
                           (LETT #1# (CDR #1#) . #2#) (GO G190) G191
                           (EXIT NIL))
                      (EXIT |ans|))))))) 

(SDEFUN |FPARFRAC;output|
        ((|n| |NonNegativeInteger|) (|d| UP) (|h| UP) ($ |OutputForm|))
        (SPROG ((|a| (F)))
               (SEQ
                (COND
                 ((EQL (SPADCALL |d| (QREFELT $ 52)) 1)
                  (SEQ
                   (LETT |a|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (SPADCALL |d| (QREFELT $ 53))
                                     (QREFELT $ 54))
                           (SPADCALL |d| (QREFELT $ 54)) (QREFELT $ 55))
                          (QREFELT $ 56))
                         |FPARFRAC;output|)
                   (EXIT
                    (SPADCALL
                     (SPADCALL (SPADCALL |h| |a| (QREFELT $ 57))
                               (QREFELT $ 120))
                     (|FPARFRAC;outputexp|
                      (SPADCALL
                       (SPADCALL (QREFELT $ 24) (SPADCALL |a| (QREFELT $ 47))
                                 (QREFELT $ 58))
                       (QREFELT $ 25))
                      |n| $)
                     (QREFELT $ 121)))))
                 ('T
                  (SPADCALL
                   (SPADCALL
                    (SPADCALL (SPADCALL |h| (QREFELT $ 123)) (QREFELT $ 20)
                              (QREFELT $ 124))
                    (|FPARFRAC;outputexp|
                     (SPADCALL (QREFELT $ 26) (QREFELT $ 20) (QREFELT $ 125))
                     |n| $)
                    (QREFELT $ 121))
                   (SPADCALL
                    (SPADCALL (SPADCALL |d| (QREFELT $ 123)) (QREFELT $ 20)
                              (QREFELT $ 124))
                    (QREFELT $ 28) (QREFELT $ 126))
                   (QREFELT $ 127))))))) 

(SDEFUN |FPARFRAC;outputexp|
        ((|f| |OutputForm|) (|n| |NonNegativeInteger|) ($ |OutputForm|))
        (COND ((EQL |n| 1) |f|)
              ('T
               (SPADCALL |f| (SPADCALL |n| (QREFELT $ 27)) (QREFELT $ 128))))) 

(DECLAIM (NOTINLINE |FullPartialFractionExpansion;|)) 

(DEFUN |FullPartialFractionExpansion| (&REST #1=#:G822)
  (SPROG NIL
         (PROG (#2=#:G823)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|FullPartialFractionExpansion|)
                                               '|domainEqualList|)
                    . #3=(|FullPartialFractionExpansion|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |FullPartialFractionExpansion;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|FullPartialFractionExpansion|)))))))))) 

(DEFUN |FullPartialFractionExpansion;| (|#1| |#2|)
  (SPROG ((|pv$| NIL) ($ NIL) (|dv$| NIL) (DV$2 NIL) (DV$1 NIL))
         (PROGN
          (LETT DV$1 (|devaluate| |#1|) . #1=(|FullPartialFractionExpansion|))
          (LETT DV$2 (|devaluate| |#2|) . #1#)
          (LETT |dv$| (LIST '|FullPartialFractionExpansion| DV$1 DV$2) . #1#)
          (LETT $ (GETREFV 132) . #1#)
          (QSETREFV $ 0 |dv$|)
          (QSETREFV $ 3 (LETT |pv$| (|buildPredVector| 0 0 NIL) . #1#))
          (|haddProp| |$ConstructorCache| '|FullPartialFractionExpansion|
                      (LIST DV$1 DV$2) (CONS 1 $))
          (|stuffDomainSlots| $)
          (QSETREFV $ 6 |#1|)
          (QSETREFV $ 7 |#2|)
          (SETF |pv$| (QREFELT $ 3))
          (QSETREFV $ 8
                    (|Record| (|:| |polyPart| |#2|)
                              (|:| |fracPart|
                                   (|List|
                                    (|Record|
                                     (|:| |exponent| (|NonNegativeInteger|))
                                     (|:| |center| |#2|) (|:| |num| |#2|))))))
          (QSETREFV $ 11 (SPADCALL (QREFELT $ 10)))
          (QSETREFV $ 17 (SPADCALL (QREFELT $ 11) 0 (QREFELT $ 16)))
          (QSETREFV $ 20 (SPADCALL (QREFELT $ 11) (QREFELT $ 19)))
          (QSETREFV $ 24 (SPADCALL (|spadConstant| $ 21) 1 (QREFELT $ 23)))
          (QSETREFV $ 26 (SPADCALL (QREFELT $ 24) (QREFELT $ 25)))
          (QSETREFV $ 28 (SPADCALL 0 (QREFELT $ 27)))
          $))) 

(MAKEPROP '|FullPartialFractionExpansion| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL NIL (|local| |#1|) (|local| |#2|) '|Rep|
              (|Symbol|) (0 . |new|) '|u| (4 . |Zero|) (8 . |Zero|)
              (|NonNegativeInteger|) (|OrderlyDifferentialVariable| 9)
              (12 . |makeVariable|) '|u0| (|OutputForm|) (18 . |coerce|)
              '|alpha| (23 . |One|) (27 . |One|) (31 . |monomial|) '|x|
              (37 . |coerce|) '|xx| (42 . |coerce|) '|zr|
              (|Record| (|:| |exponent| 14) (|:| |center| 7) (|:| |num| 7))
              (|List| 29) |FPARFRAC;construct;L$;1|
              |FPARFRAC;differentiate;2$;7| |FPARFRAC;D;2$;2|
              |FPARFRAC;differentiate;$Nni$;8| |FPARFRAC;D;$Nni$;3|
              |FPARFRAC;polyPart;$UP;4| |FPARFRAC;fracPart;$L;5| (47 . +)
              |FPARFRAC;+;UP2$;6| (53 . |differentiate|) (58 . *) (64 . -)
              (|Fraction| 7) (69 . |coerce|) (74 . +) |FPARFRAC;convert;$F;10|
              (80 . |coerce|) (|SparseUnivariatePolynomial| 43)
              (|Mapping| 43 6)
              (|UnivariatePolynomialCategoryFunctions2| 6 7 43 48) (85 . |map|)
              (91 . |degree|) (96 . |reductum|) (101 . |leadingCoefficient|)
              (106 . /) (112 . -) (117 . |elt|) (123 . -) (129 . ^) (135 . /)
              (141 . |One|) (145 . |monomial|) (151 . |coerce|) (156 . -)
              (162 . ^) (168 . |rem|)
              (|Record| (|:| |coef1| $) (|:| |coef2| $)) (|Union| 67 '"failed")
              (174 . |extendedEuclidean|) (181 . |coefficient|) (187 . *)
              (193 . |numer|) (198 . |denom|)
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (203 . |divide|) (|Factored| $) (209 . |squareFree|)
              (|Record| (|:| |factor| 7) (|:| |exponent| 103)) (|List| 78)
              (|Factored| 7) (214 . |factors|) (|List| $) (219 . |concat|)
              |FPARFRAC;fullPartialFraction;F$;13| (224 . |quo|)
              (230 . |extendedEuclidean|) (|OrderlyDifferentialPolynomial| 7)
              (237 . |One|) (241 . |coerce|) (246 . ^) (252 . |coerce|)
              (257 . *) (|Fraction| 87) (263 . /) (269 . |rem|) (275 . *)
              (281 . *) (287 . |retract|) (|List| 15) (|List| 7) (292 . |eval|)
              (299 . |retract|) (|Integer|) (|Fraction| 103) (304 . |coerce|)
              (309 . |inv|) (314 . |differentiate|) (319 . *) (325 . |coerce|)
              (330 . |inv|) (335 . *) (341 . |gcd|) (|Boolean|) (347 . >)
              (353 . *) (359 . |zero?|) (364 . +) |FPARFRAC;coerce;$Of;15|
              (370 . |empty|) (374 . |coerce|) (379 . /)
              (|SparseUnivariatePolynomial| 6) (385 . |makeSUP|)
              (390 . |outputForm|) (396 . -) (402 . =) (408 . |sum|) (414 . ^)
              (|HashState|) (|String|) (|SingleInteger|))
           '#(~= 420 |polyPart| 426 |latex| 431 |hashUpdate!| 436 |hash| 442
              |fullPartialFraction| 447 |fracPart| 452 |differentiate| 457
              |convert| 468 |construct| 473 |coerce| 478 D 483 = 494 + 500)
           'NIL
           (CONS (|makeByteWordVec2| 1 '(0 0 0 0))
                 (CONS '#(|SetCategory&| |BasicType&| NIL NIL)
                       (CONS
                        '#((|SetCategory|) (|BasicType|)
                           (|ConvertibleTo| (|Fraction| 7)) (|CoercibleTo| 18))
                        (|makeByteWordVec2| 131
                                            '(0 9 0 10 0 6 0 12 0 7 0 13 2 15 0
                                              9 14 16 1 9 18 0 19 0 6 0 21 0 7
                                              0 22 2 7 0 6 14 23 1 7 18 0 25 1
                                              14 18 0 27 2 7 0 0 0 38 1 7 0 0
                                              40 2 7 0 14 0 41 1 7 0 0 42 1 43
                                              0 7 44 2 43 0 0 0 45 1 7 0 6 47 2
                                              50 48 49 7 51 1 7 14 0 52 1 7 0 0
                                              53 1 7 6 0 54 2 6 0 0 0 55 1 6 0
                                              0 56 2 7 6 0 6 57 2 7 0 0 0 58 2
                                              7 0 0 14 59 2 43 0 7 7 60 0 43 0
                                              61 2 48 0 43 14 62 1 48 0 43 63 2
                                              48 0 0 0 64 2 48 0 0 14 65 2 48 0
                                              0 0 66 3 48 68 0 0 0 69 2 48 43 0
                                              14 70 2 48 0 0 0 71 1 43 7 0 72 1
                                              43 7 0 73 2 7 74 0 0 75 1 7 76 0
                                              77 1 80 79 0 81 1 30 0 82 83 2 7
                                              0 0 0 85 3 7 68 0 0 0 86 0 87 0
                                              88 1 87 0 15 89 2 87 0 0 14 90 1
                                              87 0 7 91 2 87 0 7 0 92 2 93 0 87
                                              87 94 2 7 0 0 0 95 2 87 0 0 0 96
                                              2 93 0 87 0 97 1 93 87 0 98 3 87
                                              0 0 99 100 101 1 87 7 0 102 1 104
                                              0 103 105 1 104 0 0 106 1 93 0 0
                                              107 2 93 0 104 0 108 1 6 0 103
                                              109 1 6 0 0 110 2 7 0 6 0 111 2 7
                                              0 0 0 112 2 14 113 0 0 114 2 7 0
                                              0 0 115 1 7 113 0 116 2 18 0 0 0
                                              117 0 18 0 119 1 6 18 0 120 2 18
                                              0 0 0 121 1 7 122 0 123 2 122 18
                                              0 18 124 2 18 0 0 0 125 2 18 0 0
                                              0 126 2 18 0 0 0 127 2 18 0 0 0
                                              128 2 0 113 0 0 1 1 0 7 0 36 1 0
                                              130 0 1 2 0 129 129 0 1 1 0 131 0
                                              1 1 0 0 43 84 1 0 30 0 37 2 0 0 0
                                              14 34 1 0 0 0 32 1 0 43 0 46 1 0
                                              0 30 31 1 0 18 0 118 2 0 0 0 14
                                              35 1 0 0 0 33 2 0 113 0 0 1 2 0 0
                                              7 0 39)))))
           '|lookupComplete|)) 
