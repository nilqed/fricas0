
(PUT '|UTS;stream| '|SPADreplace| '(XLAM (|x|) |x|)) 

(SDEFUN |UTS;stream| ((|x| $) ($ |Stream| |Coef|)) |x|) 

(SDEFUN |UTS;coerce;V$;2| ((|v| |Variable| |var|) ($ $))
        (COND
         ((SPADCALL (QREFELT $ 8) (QREFELT $ 11))
          (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 15)))
         ('T
          (SPADCALL (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 15))
                    (SPADCALL (QREFELT $ 8) 0 (QREFELT $ 15)) (QREFELT $ 18))))) 

(SDEFUN |UTS;coerce;I$;3| ((|n| |Integer|) ($ $))
        (SPADCALL (SPADCALL |n| (QREFELT $ 22)) (QREFELT $ 23))) 

(SDEFUN |UTS;coerce;Coef$;4| ((|r| |Coef|) ($ $)) (SPADCALL |r| (QREFELT $ 27))) 

(SDEFUN |UTS;monomial;CoefNni$;5|
        ((|c| |Coef|) (|n| |NonNegativeInteger|) ($ $))
        (SPADCALL |c| |n| (QREFELT $ 28))) 

(PUT '|UTS;getExpon| '|SPADreplace| 'QCAR) 

(SDEFUN |UTS;getExpon|
        ((|term| |Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| |Coef|))
         ($ |NonNegativeInteger|))
        (QCAR |term|)) 

(PUT '|UTS;getCoef| '|SPADreplace| 'QCDR) 

(SDEFUN |UTS;getCoef|
        ((|term| |Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| |Coef|))
         ($ |Coef|))
        (QCDR |term|)) 

(PUT '|UTS;rec| '|SPADreplace| 'CONS) 

(SDEFUN |UTS;rec|
        ((|expon| |NonNegativeInteger|) (|coef| |Coef|)
         ($ |Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| |Coef|)))
        (CONS |expon| |coef|)) 

(SDEFUN |UTS;recs|
        ((|st| |Stream| |Coef|) (|n| |NonNegativeInteger|)
         ($ |Stream|
          (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| |Coef|))))
        (SPROG NIL
               (SPADCALL (CONS #'|UTS;recs!0| (VECTOR |n| $ |st|))
                         (QREFELT $ 41)))) 

(SDEFUN |UTS;recs!0| (($$ NIL))
        (PROG (|st| $ |n|)
          (LETT |st| (QREFELT $$ 2) . #1=(|UTS;recs|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |n| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|coef| NIL))
                   (COND
                    ((SPADCALL |st| (QREFELT $ 29)) (SPADCALL (QREFELT $ 38)))
                    ((SPADCALL (LETT |coef| (SPADCALL |st| (QREFELT $ 31)) NIL)
                               (QREFELT $ 11))
                     (|UTS;recs| (SPADCALL |st| (QREFELT $ 32))
                      (SPADCALL |n| (|spadConstant| $ 33) (QREFELT $ 34)) $))
                    ('T
                     (SPADCALL (|UTS;rec| |n| |coef| $)
                               (|UTS;recs| (SPADCALL |st| (QREFELT $ 32))
                                (SPADCALL |n| (|spadConstant| $ 33)
                                          (QREFELT $ 34))
                                $)
                               (QREFELT $ 39))))))))) 

(SDEFUN |UTS;terms;$S;10|
        ((|x| $)
         ($ |Stream|
          (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| |Coef|))))
        (|UTS;recs| (|UTS;stream| |x| $) 0 $)) 

(SDEFUN |UTS;recsToCoefs|
        ((|st| |Stream|
          (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| |Coef|)))
         (|n| |NonNegativeInteger|) ($ |Stream| |Coef|))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|UTS;recsToCoefs!0| (VECTOR |n| $ |st|))
                          (QREFELT $ 50))))) 

(SDEFUN |UTS;recsToCoefs!0| (($$ NIL))
        (PROG (|st| $ |n|)
          (LETT |st| (QREFELT $$ 2) . #1=(|UTS;recsToCoefs|))
          (LETT $ (QREFELT $$ 1) . #1#)
          (LETT |n| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|term| NIL) (|expon| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL |st| (QREFELT $ 43)) (SPADCALL (QREFELT $ 48)))
                     ('T
                      (SEQ (LETT |term| (SPADCALL |st| (QREFELT $ 44)) NIL)
                           (LETT |expon| (|UTS;getExpon| |term| $) NIL)
                           (EXIT
                            (COND
                             ((SPADCALL |n| |expon| (QREFELT $ 45))
                              (SPADCALL (|UTS;getCoef| |term| $)
                                        (|UTS;recsToCoefs|
                                         (SPADCALL |st| (QREFELT $ 46))
                                         (SPADCALL |n| (|spadConstant| $ 33)
                                                   (QREFELT $ 34))
                                         $)
                                        (QREFELT $ 49)))
                             ('T
                              (SPADCALL (|spadConstant| $ 16)
                                        (|UTS;recsToCoefs| |st|
                                         (SPADCALL |n| (|spadConstant| $ 33)
                                                   (QREFELT $ 34))
                                         $)
                                        (QREFELT $ 49)))))))))))))) 

(SDEFUN |UTS;series;S$;12|
        ((|st| |Stream|
          (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| |Coef|)))
         ($ $))
        (|UTS;recsToCoefs| |st| 0 $)) 

(SDEFUN |UTS;stToPoly|
        ((|st| |Stream| |Coef|) (|term| |Polynomial| |Coef|)
         (|n| |NonNegativeInteger|) (|n0| |NonNegativeInteger|)
         ($ |Polynomial| |Coef|))
        (COND
         ((OR (SPADCALL |n| |n0| (QREFELT $ 52))
              (SPADCALL |st| (QREFELT $ 29)))
          (|spadConstant| $ 54))
         ('T
          (SPADCALL
           (SPADCALL (SPADCALL |st| (QREFELT $ 31))
                     (SPADCALL |term| |n| (QREFELT $ 55)) (QREFELT $ 56))
           (|UTS;stToPoly| (SPADCALL |st| (QREFELT $ 32)) |term| (+ |n| 1) |n0|
            $)
           (QREFELT $ 57))))) 

(SDEFUN |UTS;polynomial;$NniP;14|
        ((|x| $) (|n| |NonNegativeInteger|) ($ |Polynomial| |Coef|))
        (|UTS;stToPoly| (|UTS;stream| |x| $)
         (SPADCALL (SPADCALL (QREFELT $ 7) (QREFELT $ 59))
                   (SPADCALL (QREFELT $ 8) (QREFELT $ 60)) (QREFELT $ 61))
         0 |n| $)) 

(SDEFUN |UTS;polynomial;$2NniP;15|
        ((|x| $) (|n1| . #1=(|NonNegativeInteger|)) (|n2| . #1#)
         ($ |Polynomial| |Coef|))
        (SPROG ((|#G31| #1#) (|#G30| #1#))
               (SEQ
                (COND
                 ((SPADCALL |n1| |n2| (QREFELT $ 52))
                  (PROGN
                   (LETT |#G30| |n2| . #2=(|UTS;polynomial;$2NniP;15|))
                   (LETT |#G31| |n1| . #2#)
                   (LETT |n1| |#G30| . #2#)
                   (LETT |n2| |#G31| . #2#))))
                (EXIT
                 (|UTS;stToPoly|
                  (SPADCALL (|UTS;stream| |x| $) |n1| (QREFELT $ 63))
                  (SPADCALL (SPADCALL (QREFELT $ 7) (QREFELT $ 59))
                            (SPADCALL (QREFELT $ 8) (QREFELT $ 60))
                            (QREFELT $ 61))
                  |n1| |n2| $))))) 

(SDEFUN |UTS;univariatePolynomial;$NniUp;16|
        ((|x| $) (|n| |NonNegativeInteger|)
         ($ |UnivariatePolynomial| |var| |Coef|))
        (SPROG
         ((|st| ($)) (|term| (|UnivariatePolynomial| |var| |Coef|))
          (|ress| (|UnivariatePolynomial| |var| |Coef|)) (#1=#:G773 NIL)
          (#2=#:G775 NIL) (|k| NIL)
          (|t1| (|UnivariatePolynomial| |var| |Coef|)) (#3=#:G774 NIL))
         (SEQ
          (EXIT
           (SEQ
            (LETT |ress| (|spadConstant| $ 66)
                  . #4=(|UTS;univariatePolynomial;$NniUp;16|))
            (LETT |st| (|UTS;stream| |x| $) . #4#)
            (EXIT
             (COND
              ((SPADCALL (QREFELT $ 8) (|spadConstant| $ 16) (QREFELT $ 67))
               (SEQ
                (SEQ (LETT |k| 0 . #4#) (LETT #3# |n| . #4#) G190
                     (COND ((|greater_SI| |k| #3#) (GO G191)))
                     (SEQ
                      (EXIT
                       (COND
                        ((SPADCALL |st| (QREFELT $ 29))
                         (PROGN (LETT #1# |ress| . #4#) (GO #5=#:G772)))
                        ('T
                         (SEQ
                          (LETT |term|
                                (SPADCALL (SPADCALL |st| (QREFELT $ 31)) |k|
                                          (QREFELT $ 68))
                                . #4#)
                          (LETT |ress| (SPADCALL |term| |ress| (QREFELT $ 69))
                                . #4#)
                          (EXIT
                           (LETT |st| (SPADCALL |st| (QREFELT $ 35))
                                 . #4#)))))))
                     (LETT |k| (|inc_SI| |k|) . #4#) (GO G190) G191 (EXIT NIL))
                (EXIT |ress|)))
              ('T
               (SEQ |ress|
                    (LETT |t1|
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 12) 1 (QREFELT $ 68))
                           (SPADCALL (QREFELT $ 8) 0 (QREFELT $ 68))
                           (QREFELT $ 70))
                          . #4#)
                    (LETT |term| (|spadConstant| $ 71) . #4#)
                    (SEQ (LETT |k| 1 . #4#) (LETT #2# |n| . #4#) G190
                         (COND ((|greater_SI| |k| #2#) (GO G191)))
                         (SEQ
                          (EXIT
                           (COND
                            ((SPADCALL |st| (QREFELT $ 29))
                             (PROGN (LETT #1# |ress| . #4#) (GO #5#)))
                            ('T
                             (SEQ
                              (LETT |ress|
                                    (SPADCALL
                                     (SPADCALL (SPADCALL |st| (QREFELT $ 31))
                                               |term| (QREFELT $ 72))
                                     |ress| (QREFELT $ 69))
                                    . #4#)
                              (LETT |term|
                                    (SPADCALL |term| |t1| (QREFELT $ 73))
                                    . #4#)
                              (EXIT
                               (LETT |st| (SPADCALL |st| (QREFELT $ 35))
                                     . #4#)))))))
                         (LETT |k| (|inc_SI| |k|) . #4#) (GO G190) G191
                         (EXIT NIL))
                    (EXIT |ress|)))))))
          #5# (EXIT #1#)))) 

(SDEFUN |UTS;coerce;Up$;17| ((|p| |UnivariatePolynomial| |var| |Coef|) ($ $))
        (SPROG
         ((|st| (|Stream| |Coef|)) (#1=#:G787 NIL) (|i| NIL)
          (|oldDeg| (|NonNegativeInteger|)) (#2=#:G786 NIL)
          (|delta| (|NonNegativeInteger|)) (#3=#:G778 NIL)
          (|deg| (|NonNegativeInteger|)))
         (SEQ
          (COND ((SPADCALL |p| (QREFELT $ 75)) (|spadConstant| $ 17))
                ('T
                 (SEQ
                  (COND
                   ((NULL (SPADCALL (QREFELT $ 8) (QREFELT $ 11)))
                    (LETT |p|
                          (SPADCALL |p|
                                    (SPADCALL
                                     (SPADCALL (|spadConstant| $ 12) 1
                                               (QREFELT $ 68))
                                     (SPADCALL (QREFELT $ 8) 0 (QREFELT $ 68))
                                     (QREFELT $ 69))
                                    (QREFELT $ 76))
                          . #4=(|UTS;coerce;Up$;17|))))
                  (LETT |st| (SPADCALL (QREFELT $ 48)) . #4#)
                  (LETT |oldDeg| (+ (SPADCALL |p| (QREFELT $ 77)) 1) . #4#)
                  (SEQ G190
                       (COND
                        ((NULL (NULL (SPADCALL |p| (QREFELT $ 75))))
                         (GO G191)))
                       (SEQ (LETT |deg| (SPADCALL |p| (QREFELT $ 77)) . #4#)
                            (LETT |delta|
                                  (PROG1
                                      (LETT #3# (- (- |oldDeg| |deg|) 1) . #4#)
                                    (|check_subtype2| (>= #3# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #3#))
                                  . #4#)
                            (SEQ (LETT |i| 1 . #4#) (LETT #2# |delta| . #4#)
                                 G190 (COND ((|greater_SI| |i| #2#) (GO G191)))
                                 (SEQ
                                  (EXIT
                                   (LETT |st|
                                         (SPADCALL (|spadConstant| $ 16) |st|
                                                   (QREFELT $ 49))
                                         . #4#)))
                                 (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                                 (EXIT NIL))
                            (LETT |st|
                                  (SPADCALL (SPADCALL |p| (QREFELT $ 78)) |st|
                                            (QREFELT $ 49))
                                  . #4#)
                            (LETT |oldDeg| |deg| . #4#)
                            (EXIT
                             (LETT |p| (SPADCALL |p| (QREFELT $ 79)) . #4#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (SEQ (LETT |i| 1 . #4#) (LETT #1# |oldDeg| . #4#) G190
                       (COND ((|greater_SI| |i| #1#) (GO G191)))
                       (SEQ
                        (EXIT
                         (LETT |st|
                               (SPADCALL (|spadConstant| $ 16) |st|
                                         (QREFELT $ 49))
                               . #4#)))
                       (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191
                       (EXIT NIL))
                  (EXIT |st|))))))) 

(SDEFUN |UTS;stToCoef|
        ((|st| |Stream| |Coef|) (|term| |Coef|) (|n| |NonNegativeInteger|)
         (|n0| |NonNegativeInteger|) ($ |Coef|))
        (COND
         ((OR (SPADCALL |n| |n0| (QREFELT $ 52))
              (SPADCALL |st| (QREFELT $ 29)))
          (|spadConstant| $ 16))
         ('T
          (SPADCALL
           (SPADCALL (SPADCALL |st| (QREFELT $ 31))
                     (SPADCALL |term| |n| (QREFELT $ 81)) (QREFELT $ 82))
           (|UTS;stToCoef| (SPADCALL |st| (QREFELT $ 32)) |term| (+ |n| 1) |n0|
            $)
           (QREFELT $ 83))))) 

(SDEFUN |UTS;approximate;$NniCoef;19|
        ((|x| $) (|n| |NonNegativeInteger|) ($ |Coef|))
        (|UTS;stToCoef| (|UTS;stream| |x| $)
         (SPADCALL (SPADCALL (QREFELT $ 7) (QREFELT $ 84)) (QREFELT $ 8)
                   (QREFELT $ 85))
         0 |n| $)) 

(SDEFUN |UTS;variable;$S;20| ((|x| $) ($ |Symbol|)) (QREFELT $ 7)) 

(SDEFUN |UTS;center;$Coef;21| ((|s| $) ($ |Coef|)) (QREFELT $ 8)) 

(SDEFUN |UTS;coefficient;$NniCoef;22|
        ((|x| $) (|n| |NonNegativeInteger|) ($ |Coef|))
        (SPROG ((#1=#:G796 NIL) (|u| ($)))
               (SEQ
                (LETT |u| (|UTS;stream| |x| $)
                      . #2=(|UTS;coefficient;$NniCoef;22|))
                (SEQ G190
                     (COND
                      ((NULL
                        (COND ((SPADCALL |u| (QREFELT $ 29)) NIL)
                              ('T (SPADCALL |n| 0 (QREFELT $ 52)))))
                       (GO G191)))
                     (SEQ (LETT |u| (SPADCALL |u| (QREFELT $ 35)) . #2#)
                          (EXIT
                           (LETT |n|
                                 (PROG1 (LETT #1# (- |n| 1) . #2#)
                                   (|check_subtype2| (>= #1# 0)
                                                     '(|NonNegativeInteger|)
                                                     '(|Integer|) #1#))
                                 . #2#)))
                     NIL (GO G190) G191 (EXIT NIL))
                (COND
                 ((OR (SPADCALL |u| (QREFELT $ 29))
                      (SPADCALL |n| 0 (QREFELT $ 89)))
                  (EXIT (|spadConstant| $ 16))))
                (EXIT (SPADCALL |u| (QREFELT $ 31)))))) 

(SDEFUN |UTS;elt;$NniCoef;23| ((|x| $) (|n| |NonNegativeInteger|) ($ |Coef|))
        (SPADCALL |x| |n| (QREFELT $ 90))) 

(SDEFUN |UTS;map;M2$;24| ((|f| |Mapping| |Coef| |Coef|) (|x| $) ($ $))
        (SPADCALL |f| |x| (QREFELT $ 93))) 

(SDEFUN |UTS;eval;$CoefS;25| ((|x| $) (|r| |Coef|) ($ |Stream| |Coef|))
        (SPADCALL (|UTS;stream| |x| $)
                  (SPADCALL |r| (QREFELT $ 8) (QREFELT $ 85)) (QREFELT $ 95))) 

(SDEFUN |UTS;differentiate;2$;26| ((|x| $) ($ $))
        (SPADCALL (|UTS;stream| |x| $) (QREFELT $ 97))) 

(SDEFUN |UTS;differentiate;$V$;27| ((|x| $) (|v| |Variable| |var|) ($ $))
        (SPADCALL |x| (QREFELT $ 98))) 

(SDEFUN |UTS;differentiate;$S$;28| ((|x| $) (|s| |Symbol|) ($ $))
        (SPROG NIL
               (COND
                ((EQUAL |s| (SPADCALL |x| (QREFELT $ 87)))
                 (SPADCALL |x| (QREFELT $ 98)))
                ('T
                 (SPADCALL
                  (SPADCALL
                   (CONS #'|UTS;differentiate;$S$;28!0| (VECTOR $ |s|)) |x|
                   (QREFELT $ 94))
                  (SPADCALL
                   (SPADCALL (SPADCALL |x| (QREFELT $ 88)) |s| (QREFELT $ 100))
                   (SPADCALL |x| (QREFELT $ 98)) (QREFELT $ 101))
                  (QREFELT $ 102)))))) 

(SDEFUN |UTS;differentiate;$S$;28!0| ((|y| NIL) ($$ NIL))
        (PROG (|s| $)
          (LETT |s| (QREFELT $$ 1) . #1=(|UTS;differentiate;$S$;28|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |y| |s| (QREFELT $ 100)))))) 

(SDEFUN |UTS;multiplyCoefficients;M2$;29|
        ((|f| |Mapping| |Coef| (|Integer|)) (|x| $) ($ $))
        (SPADCALL |f| (|UTS;stream| |x| $) (QREFELT $ 105))) 

(SDEFUN |UTS;lagrange;2$;30| ((|x| $) ($ $))
        (SPADCALL (|UTS;stream| |x| $) (QREFELT $ 107))) 

(SDEFUN |UTS;lambert;2$;31| ((|x| $) ($ $))
        (SPADCALL (|UTS;stream| |x| $) (QREFELT $ 109))) 

(SDEFUN |UTS;oddlambert;2$;32| ((|x| $) ($ $))
        (SPADCALL (|UTS;stream| |x| $) (QREFELT $ 111))) 

(SDEFUN |UTS;evenlambert;2$;33| ((|x| $) ($ $))
        (SPADCALL (|UTS;stream| |x| $) (QREFELT $ 113))) 

(SDEFUN |UTS;generalLambert;$2I$;34|
        ((|x| $) (|a| |Integer|) (|d| |Integer|) ($ $))
        (SPADCALL (|UTS;stream| |x| $) |a| |d| (QREFELT $ 115))) 

(SDEFUN |UTS;extend;$Nni$;35| ((|x| $) (|n| |NonNegativeInteger|) ($ $))
        (SPADCALL |x| (+ |n| 1) (QREFELT $ 117))) 

(SDEFUN |UTS;complete;2$;36| ((|x| $) ($ $)) (SPADCALL |x| (QREFELT $ 119))) 

(SDEFUN |UTS;truncate;$Nni$;37| ((|x| $) (|n| |NonNegativeInteger|) ($ $))
        (SPADCALL (|UTS;stream| |x| $) (+ |n| 1) (QREFELT $ 121))) 

(SDEFUN |UTS;truncate;$2Nni$;38|
        ((|x| $) (|n1| . #1=(|NonNegativeInteger|)) (|n2| . #1#) ($ $))
        (SPROG
         ((|st| ($)) (#2=#:G839 NIL) (|i| NIL) (|m| (|NonNegativeInteger|))
          (#3=#:G835 NIL) (|#G84| #1#) (|#G83| #1#))
         (SEQ
          (COND
           ((< |n2| |n1|)
            (PROGN
             (LETT |#G83| |n2| . #4=(|UTS;truncate;$2Nni$;38|))
             (LETT |#G84| |n1| . #4#)
             (LETT |n1| |#G83| . #4#)
             (LETT |n2| |#G84| . #4#))))
          (LETT |m|
                (PROG1 (LETT #3# (- |n2| |n1|) . #4#)
                  (|check_subtype2| (>= #3# 0) '(|NonNegativeInteger|)
                                    '(|Integer|) #3#))
                . #4#)
          (LETT |st|
                (SPADCALL (SPADCALL (|UTS;stream| |x| $) |n1| (QREFELT $ 123))
                          (+ |m| 1) (QREFELT $ 121))
                . #4#)
          (SEQ (LETT |i| 1 . #4#) (LETT #2# |n1| . #4#) G190
               (COND ((|greater_SI| |i| #2#) (GO G191)))
               (SEQ
                (EXIT
                 (LETT |st|
                       (SPADCALL (|spadConstant| $ 16) |st| (QREFELT $ 47))
                       . #4#)))
               (LETT |i| (|inc_SI| |i|) . #4#) (GO G190) G191 (EXIT NIL))
          (EXIT |st|)))) 

(SDEFUN |UTS;elt;3$;39| ((|x| $) (|y| $) ($ $))
        (SPADCALL (|UTS;stream| |x| $) (|UTS;stream| |y| $) (QREFELT $ 125))) 

(SDEFUN |UTS;revert;2$;40| ((|x| $) ($ $))
        (SPADCALL (|UTS;stream| |x| $) (QREFELT $ 127))) 

(SDEFUN |UTS;multisect;2I2$;41| ((|a| |Integer|) (|b| |Integer|) (|x| $) ($ $))
        (SPADCALL |a| |b| (|UTS;stream| |x| $) (QREFELT $ 129))) 

(SDEFUN |UTS;invmultisect;2I2$;42|
        ((|a| |Integer|) (|b| |Integer|) (|x| $) ($ $))
        (SPADCALL |a| |b| (|UTS;stream| |x| $) (QREFELT $ 131))) 

(SDEFUN |UTS;multiplyExponents;$Pi$;43| ((|x| $) (|n| |PositiveInteger|) ($ $))
        (SPADCALL |n| 0 |x| (QREFELT $ 132))) 

(SDEFUN |UTS;quoByVar;2$;44| ((|x| $) ($ $))
        (COND ((SPADCALL |x| (QREFELT $ 29)) (|spadConstant| $ 17))
              ('T (SPADCALL |x| (QREFELT $ 35))))) 

(SDEFUN |UTS;unit?;$B;45| ((|x| $) ($ |Boolean|))
        (SPADCALL (SPADCALL |x| 0 (QREFELT $ 90)) (QREFELT $ 136))) 

(SDEFUN |UTS;^;$Coef$;46| ((|x| $) (|s| |Coef|) ($ $))
        (SPADCALL |s| (|UTS;stream| |x| $) (QREFELT $ 139))) 

(SDEFUN |UTS;^;$Coef$;47| ((|x| $) (|s| |Coef|) ($ $))
        (SPADCALL |s| (|UTS;stream| |x| $) (QREFELT $ 141))) 

(SDEFUN |UTS;coerce;F$;48| ((|r| |Fraction| (|Integer|)) ($ $))
        (SPADCALL (SPADCALL |r| (QREFELT $ 142)) (QREFELT $ 23))) 

(SDEFUN |UTS;integrate;2$;49| ((|x| $) ($ $))
        (SPADCALL (|spadConstant| $ 16) (|UTS;stream| |x| $) (QREFELT $ 144))) 

(SDEFUN |UTS;integrate;$V$;50| ((|x| $) (|v| |Variable| |var|) ($ $))
        (SPADCALL |x| (QREFELT $ 145))) 

(SDEFUN |UTS;integrate;$S$;51| ((|x| $) (|s| |Symbol|) ($ $))
        (SPROG NIL
               (COND
                ((EQUAL |s| (SPADCALL |x| (QREFELT $ 87)))
                 (SPADCALL |x| (QREFELT $ 145)))
                ((NULL
                  (SPADCALL |s|
                            (SPADCALL (SPADCALL |x| (QREFELT $ 88))
                                      (QREFELT $ 148))
                            (QREFELT $ 149)))
                 (SPADCALL (CONS #'|UTS;integrate;$S$;51!0| (VECTOR $ |s|)) |x|
                           (QREFELT $ 94)))
                ('T
                 (|error|
                  "integrate: center is a function of variable of integration"))))) 

(SDEFUN |UTS;integrate;$S$;51!0| ((|y| NIL) ($$ NIL))
        (PROG (|s| $)
          (LETT |s| (QREFELT $$ 1) . #1=(|UTS;integrate;$S$;51|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (SPADCALL |y| |s| (QREFELT $ 150)))))) 

(SDEFUN |UTS;integrateWithOneAnswer| ((|f| |Coef|) (|s| |Symbol|) ($ |Coef|))
        (SPROG ((|res| (|Union| |Coef| (|List| |Coef|))))
               (SEQ
                (LETT |res| (SPADCALL |f| |s| (QREFELT $ 154))
                      |UTS;integrateWithOneAnswer|)
                (EXIT
                 (COND ((QEQCAR |res| 0) (QCDR |res|))
                       ('T (|SPADfirst| (QCDR |res|)))))))) 

(SDEFUN |UTS;integrate;$S$;53| ((|x| $) (|s| |Symbol|) ($ $))
        (SPROG NIL
               (COND
                ((EQUAL |s| (SPADCALL |x| (QREFELT $ 87)))
                 (SPADCALL |x| (QREFELT $ 145)))
                ((NULL
                  (SPADCALL |s|
                            (SPADCALL (SPADCALL |x| (QREFELT $ 88))
                                      (QREFELT $ 148))
                            (QREFELT $ 149)))
                 (SPADCALL (CONS #'|UTS;integrate;$S$;53!0| (VECTOR $ |s|)) |x|
                           (QREFELT $ 94)))
                ('T
                 (|error|
                  "integrate: center is a function of variable of integration"))))) 

(SDEFUN |UTS;integrate;$S$;53!0| ((|y| NIL) ($$ NIL))
        (PROG (|s| $)
          (LETT |s| (QREFELT $$ 1) . #1=(|UTS;integrate;$S$;53|))
          (LETT $ (QREFELT $$ 0) . #1#)
          (RETURN (PROGN (|UTS;integrateWithOneAnswer| |y| |s| $))))) 

(DECLAIM (NOTINLINE |UnivariateTaylorSeries;|)) 

(DEFUN |UnivariateTaylorSeries| (&REST #1=#:G878)
  (SPROG NIL
         (PROG (#2=#:G879)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|UnivariateTaylorSeries|)
                                               '|domainEqualList|)
                    . #3=(|UnivariateTaylorSeries|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1 (APPLY (|function| |UnivariateTaylorSeries;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache| '|UnivariateTaylorSeries|)))))))))) 

(DEFUN |UnivariateTaylorSeries;| (|#1| |#2| |#3|)
  (SPROG
   ((|pv$| NIL) (#1=#:G872 NIL) (#2=#:G873 NIL) (#3=#:G874 NIL) (#4=#:G877 NIL)
    ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #5=(|UnivariateTaylorSeries|))
    (LETT DV$2 (|devaluate| |#2|) . #5#)
    (LETT DV$3 (|devaluate| |#3|) . #5#)
    (LETT |dv$| (LIST '|UnivariateTaylorSeries| DV$1 DV$2 DV$3) . #5#)
    (LETT $ (GETREFV 164) . #5#)
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
                                                       '(|IntegralDomain|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicZero|))
                                        (LETT #4#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              . #5#)
                                        (OR #4#
                                            (|HasCategory| |#1|
                                                           '(|IntegralDomain|)))
                                        (|HasSignature| |#1|
                                                        (LIST '*
                                                              (LIST
                                                               (|devaluate|
                                                                |#1|)
                                                               '(|NonNegativeInteger|)
                                                               (|devaluate|
                                                                |#1|))))
                                        (AND
                                         (|HasCategory| |#1|
                                                        '(|PartialDifferentialRing|
                                                          (|Symbol|)))
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|NonNegativeInteger|)
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (|HasCategory| (|NonNegativeInteger|)
                                                       '(|SemiGroup|))
                                        (|HasSignature| |#1|
                                                        (LIST '^
                                                              (LIST
                                                               (|devaluate|
                                                                |#1|)
                                                               (|devaluate|
                                                                |#1|)
                                                               '(|NonNegativeInteger|))))
                                        (AND
                                         (|HasSignature| |#1|
                                                         (LIST '^
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|NonNegativeInteger|))))
                                         (|HasSignature| |#1|
                                                         (LIST '|coerce|
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Symbol|)))))
                                        (LETT #3#
                                              (|HasCategory| |#1|
                                                             '(|SemiRing|))
                                              . #5#)
                                        (OR #3#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|NonNegativeInteger|)
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (LETT #2#
                                              (|HasCategory| |#1| '(|Ring|))
                                              . #5#)
                                        (OR #2#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|NonNegativeInteger|)
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|Algebra|
                                                          (|Fraction|
                                                           (|Integer|))))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         #4#
                                         (|HasCategory| |#1|
                                                        '(|IntegralDomain|))
                                         #2#
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|NonNegativeInteger|)
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (|HasCategory| |#1| '(|AbelianMonoid|))
                                        (|HasCategory| |#1|
                                                       '(|CancellationAbelianMonoid|))
                                        (LETT #1#
                                              (|HasCategory| |#1|
                                                             '(|AbelianGroup|))
                                              . #5#)
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory|
                                           (|Fraction| (|Integer|))
                                           '(|AbelianMonoid|)))
                                         #1#
                                         (|HasCategory| |#1|
                                                        '(|AbelianMonoid|))
                                         (|HasCategory| |#1|
                                                        '(|CancellationAbelianMonoid|))
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|NonNegativeInteger|)
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (OR #1#
                                            (|HasCategory| |#1|
                                                           '(|CancellationAbelianMonoid|))
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|NonNegativeInteger|)
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR #1#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|NonNegativeInteger|)
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (|HasCategory| |#1| '(|Field|))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasCategory| |#1|
                                                         '(|AlgebraicallyClosedFunctionSpace|
                                                           (|Integer|)))
                                          (|HasCategory| |#1|
                                                         '(|PrimitiveFunctionCategory|))
                                          (|HasCategory| |#1|
                                                         '(|TranscendentalFunctionCategory|)))
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|Algebra|
                                                           (|Fraction|
                                                            (|Integer|))))
                                          (|HasSignature| |#1|
                                                          (LIST '|integrate|
                                                                (LIST
                                                                 (|devaluate|
                                                                  |#1|)
                                                                 (|devaluate|
                                                                  |#1|)
                                                                 '(|Symbol|))))
                                          (|HasSignature| |#1|
                                                          (LIST '|variables|
                                                                (LIST
                                                                 '(|List|
                                                                   (|Symbol|))
                                                                 (|devaluate|
                                                                  |#1|))))))))
                    . #5#))
    (|haddProp| |$ConstructorCache| '|UnivariateTaylorSeries|
                (LIST DV$1 DV$2 DV$3) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (AND (|HasCategory| |#1| '(|IntegralDomain|))
         (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| $ 16777216))
    (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| $ 33554432))
    (AND
     (OR (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 67108864))
    (AND
     (OR (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         #3#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|NonNegativeInteger|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 134217728))
    (AND
     (OR (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         #2#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|NonNegativeInteger|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 268435456))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianMonoid|))
         (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianMonoid|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|NonNegativeInteger|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 536870912))
    (AND
     (OR (|HasCategory| |#1| '(|CancellationAbelianMonoid|))
         (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|NonNegativeInteger|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 1073741824))
    (AND
     (OR #1# (AND #4# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND (|HasCategory| |#1| '(|IntegralDomain|))
              (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| $ '(|AbelianGroup|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|NonNegativeInteger|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 2147483648))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 9 (|Stream| |#1|))
    (COND
     ((|HasSignature| |#1|
                      (LIST '|coerce| (LIST (|devaluate| |#1|) '(|Symbol|))))
      (COND
       ((|testBitVector| |pv$| 10)
        (PROGN
         (QSETREFV $ 86
                   (CONS (|dispatchFunction| |UTS;approximate;$NniCoef;19|)
                         $)))))))
    (COND
     ((|HasCategory| |#1| '(|PartialDifferentialRing| (|Symbol|)))
      (QSETREFV $ 103
                (CONS (|dispatchFunction| |UTS;differentiate;$S$;28|) $))))
    (COND
     ((|testBitVector| |pv$| 2)
      (QSETREFV $ 137 (CONS (|dispatchFunction| |UTS;unit?;$B;45|) $))))
    (COND
     ((|testBitVector| |pv$| 23)
      (COND
       ((|domainEqual| |#1| (|Fraction| (|Integer|)))
        (QSETREFV $ 140 (CONS (|dispatchFunction| |UTS;^;$Coef$;46|) $)))
       ('T (QSETREFV $ 140 (CONS (|dispatchFunction| |UTS;^;$Coef$;47|) $))))))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV $ 143 (CONS (|dispatchFunction| |UTS;coerce;F$;48|) $))
       (QSETREFV $ 145 (CONS (|dispatchFunction| |UTS;integrate;2$;49|) $))
       (QSETREFV $ 146 (CONS (|dispatchFunction| |UTS;integrate;$V$;50|) $))
       (COND
        ((|HasSignature| |#1|
                         (LIST '|integrate|
                               (LIST (|devaluate| |#1|) (|devaluate| |#1|)
                                     '(|Symbol|))))
         (COND
          ((|HasSignature| |#1|
                           (LIST '|variables|
                                 (LIST '(|List| (|Symbol|))
                                       (|devaluate| |#1|))))
           (QSETREFV $ 151
                     (CONS (|dispatchFunction| |UTS;integrate;$S$;51|) $))))))
       (COND
        ((|HasCategory| |#1| '(|TranscendentalFunctionCategory|))
         (COND
          ((|HasCategory| |#1| '(|PrimitiveFunctionCategory|))
           (COND
            ((|HasCategory| |#1|
                            '(|AlgebraicallyClosedFunctionSpace| (|Integer|)))
             (PROGN
              (QSETREFV $ 151
                        (CONS (|dispatchFunction| |UTS;integrate;$S$;53|)
                              $))))))))))))
    $))) 

(MAKEPROP '|UnivariateTaylorSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|InnerTaylorSeries| 6) (|local| |#1|)
              (|local| |#2|) (|local| |#3|) '|Rep| (|Boolean|) (0 . |zero?|)
              (5 . |One|) (9 . |One|) (|NonNegativeInteger|)
              |UTS;monomial;CoefNni$;5| (13 . |Zero|) (17 . |Zero|) (21 . +)
              (|Variable| (NRTEVAL (QREFELT $ 7))) |UTS;coerce;V$;2|
              (|Integer|) (27 . |coerce|) |UTS;coerce;Coef$;4|
              |UTS;coerce;I$;3| (|Stream| 6) (|StreamTaylorSeriesOperations| 6)
              (32 . |coerce|) (37 . |monom|) (43 . |empty?|) (48 . |empty|)
              (52 . |frst|) (57 . |rst|) (62 . |One|) (66 . +) (72 . |rst|)
              (|Record| (|:| |k| 14) (|:| |c| 6)) (|Stream| 36) (77 . |empty|)
              (81 . |concat|) (|Mapping| $) (87 . |delay|) |UTS;terms;$S;10|
              (92 . |empty?|) (97 . |frst|) (102 . =) (108 . |rst|)
              (113 . |concat|) (119 . |empty|) (123 . |concat|) (129 . |delay|)
              |UTS;series;S$;12| (134 . >) (|Polynomial| 6) (140 . |Zero|)
              (144 . ^) (150 . *) (156 . +) (|Symbol|) (162 . |coerce|)
              (167 . |coerce|) (172 . -) |UTS;polynomial;$NniP;14|
              (178 . |rest|) |UTS;polynomial;$2NniP;15|
              (|UnivariatePolynomial| (NRTEVAL (QREFELT $ 7)) 6) (184 . |Zero|)
              (188 . =) (194 . |monomial|) (200 . +) (206 . -) (212 . |One|)
              (216 . *) (222 . *) |UTS;univariatePolynomial;$NniUp;16|
              (228 . |zero?|) (233 . |elt|) (239 . |degree|)
              (244 . |leadingCoefficient|) (249 . |reductum|)
              |UTS;coerce;Up$;17| (254 . ^) (260 . *) (266 . +)
              (272 . |coerce|) (277 . -) (283 . |approximate|)
              |UTS;variable;$S;20| |UTS;center;$Coef;21| (289 . ~=)
              |UTS;coefficient;$NniCoef;22| |UTS;elt;$NniCoef;23|
              (|Mapping| 6 6) (295 . |map|) |UTS;map;M2$;24| (301 . |eval|)
              |UTS;eval;$CoefS;25| (307 . |deriv|) |UTS;differentiate;2$;26|
              |UTS;differentiate;$V$;27| (312 . |differentiate|) (318 . *)
              (324 . -) (330 . |differentiate|) (|Mapping| 6 21)
              (336 . |gderiv|) |UTS;multiplyCoefficients;M2$;29|
              (342 . |lagrange|) |UTS;lagrange;2$;30| (347 . |lambert|)
              |UTS;lambert;2$;31| (352 . |oddlambert|) |UTS;oddlambert;2$;32|
              (357 . |evenlambert|) |UTS;evenlambert;2$;33|
              (362 . |generalLambert|) |UTS;generalLambert;$2I$;34|
              (369 . |extend|) |UTS;extend;$Nni$;35| (375 . |complete|)
              |UTS;complete;2$;36| (380 . |first|) |UTS;truncate;$Nni$;37|
              (386 . |rest|) |UTS;truncate;$2Nni$;38| (392 . |compose|)
              |UTS;elt;3$;39| (398 . |revert|) |UTS;revert;2$;40|
              (403 . |multisect|) |UTS;multisect;2I2$;41|
              (410 . |invmultisect|) |UTS;invmultisect;2I2$;42|
              (|PositiveInteger|) |UTS;multiplyExponents;$Pi$;43|
              |UTS;quoByVar;2$;44| (417 . |unit?|) (422 . |unit?|)
              (|Fraction| 21) (427 . |powern|) (433 . ^) (439 . |power|)
              (445 . |coerce|) (450 . |coerce|) (455 . |integrate|)
              (461 . |integrate|) (466 . |integrate|) (|List| 58)
              (472 . |variables|) (477 . |entry?|) (483 . |integrate|)
              (489 . |integrate|) (|Union| 6 (|List| 6))
              (|FunctionSpaceIntegration| 21 6) (495 . |integrate|)
              (|Union| $ '"failed")
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|List| 14) (|List| 159) (|SingletonAsOrderedSet|) (|String|)
              (|SingleInteger|) (|HashState|) (|OutputForm|))
           '#(~= 501 |zero?| 507 |variables| 512 |variable| 517
              |univariatePolynomial| 522 |unitNormal| 528 |unitCanonical| 533
              |unit?| 538 |truncate| 543 |terms| 556 |tanh| 561 |tan| 566
              |subtractIfCan| 571 |sqrt| 577 |sinh| 582 |sin| 587 |series| 592
              |sech| 602 |sec| 607 |sample| 612 |rightRecip| 616 |rightPower|
              621 |revert| 633 |reductum| 638 |recip| 643 |quoByVar| 648
              |polynomial| 653 |pole?| 666 |pi| 671 |order| 675 |opposite?| 686
              |one?| 692 |oddlambert| 697 |nthRoot| 702 |multisect| 708
              |multiplyExponents| 715 |multiplyCoefficients| 721 |monomial?|
              727 |monomial| 732 |map| 752 |log| 758 |leftRecip| 763
              |leftPower| 768 |leadingMonomial| 780 |leadingCoefficient| 785
              |latex| 790 |lambert| 795 |lagrange| 800 |invmultisect| 805
              |integrate| 812 |hashUpdate!| 829 |hash| 835 |generalLambert| 840
              |extend| 847 |exquo| 853 |exp| 859 |evenlambert| 864 |eval| 869
              |elt| 875 |differentiate| 887 |degree| 930 |csch| 935 |csc| 940
              |coth| 945 |cot| 950 |cosh| 955 |cos| 960 |complete| 965
              |commutator| 970 |coerce| 976 |coefficients| 1011 |coefficient|
              1016 |charthRoot| 1022 |characteristic| 1027 |center| 1031
              |atanh| 1036 |atan| 1041 |associator| 1046 |associates?| 1053
              |asinh| 1059 |asin| 1064 |asech| 1069 |asec| 1074 |approximate|
              1079 |antiCommutator| 1085 |annihilate?| 1091 |acsch| 1097 |acsc|
              1102 |acoth| 1107 |acot| 1112 |acosh| 1117 |acos| 1122 ^ 1127
              |Zero| 1157 |One| 1161 D 1165 = 1202 / 1208 - 1214 + 1225 * 1231)
           'NIL
           (CONS
            (|makeByteWordVec2| 22
                                '(0 0 0 0 2 6 1 6 2 3 4 5 8 7 16 13 16 0 1 6 5
                                  0 0 1 15 0 0 0 0 1 1 16 22 21 13 13 0 0 20 13
                                  0 0 0 1 0 0 0 6 2 15 9 1 1 1 1 1 1))
            (CONS
             '#(|UnivariateTaylorSeriesCategory&|
                |UnivariatePowerSeriesCategory&| |PowerSeriesCategory&|
                |AbelianMonoidRing&| NIL NIL |Algebra&| |Algebra&|
                |EntireRing&| NIL NIL |Algebra&| |PartialDifferentialRing&|
                |DifferentialRing&| NIL NIL |Rng&| NIL |Module&| |Module&|
                |Module&| NIL NIL NIL |NonAssociativeRing&| NIL NIL NIL NIL NIL
                NIL |NonAssociativeRng&| |AbelianGroup&| NIL NIL NIL
                |NonAssociativeSemiRng&| NIL |AbelianMonoid&| |MagmaWithUnit&|
                |Magma&| |AbelianSemiGroup&| |SetCategory&|
                |TranscendentalFunctionCategory&| NIL |BasicType&| NIL NIL NIL
                NIL NIL |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                |RadicalCategory&|)
             (CONS
              '#((|UnivariateTaylorSeriesCategory| 6)
                 (|UnivariatePowerSeriesCategory| 6 14)
                 (|PowerSeriesCategory| 6 14 159) (|AbelianMonoidRing| 6 14)
                 (|IntegralDomain|) (|CommutativeRing|) (|Algebra| 138)
                 (|Algebra| $$) (|EntireRing|) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|Algebra| 6)
                 (|PartialDifferentialRing| 58) (|DifferentialRing|) (|Ring|)
                 (|SemiRing|) (|Rng|) (|SemiRng|) (|Module| 138) (|Module| $$)
                 (|Module| 6) (|BiModule| 6 6) (|BiModule| $$ $$)
                 (|BiModule| 138 138) (|NonAssociativeRing|) (|LeftModule| 6)
                 (|RightModule| 6) (|RightModule| $$) (|LeftModule| $$)
                 (|LeftModule| 138) (|RightModule| 138) (|NonAssociativeRng|)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|)
                 (|NonAssociativeSemiRng|) (|SemiGroup|) (|AbelianMonoid|)
                 (|MagmaWithUnit|) (|Magma|) (|AbelianSemiGroup|)
                 (|SetCategory|) (|TranscendentalFunctionCategory|)
                 (|VariablesCommuteWithCoefficients|) (|BasicType|)
                 (|CoercibleTo| 163) (|CommutativeStar|) (|noZeroDivisors|)
                 (|unitsKnown|) (|Eltable| $$ $$)
                 (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|RadicalCategory|))
              (|makeByteWordVec2| 163
                                  '(1 6 10 0 11 0 6 0 12 0 0 0 13 0 6 0 16 0 0
                                    0 17 2 0 0 0 0 18 1 6 0 21 22 1 26 25 6 27
                                    2 26 25 6 21 28 1 9 10 0 29 0 9 0 30 1 9 6
                                    0 31 1 25 0 0 32 0 14 0 33 2 14 0 0 0 34 1
                                    9 0 0 35 0 37 0 38 2 37 0 36 0 39 1 37 0 40
                                    41 1 37 10 0 43 1 37 36 0 44 2 14 10 0 0 45
                                    1 37 0 0 46 2 9 0 6 0 47 0 25 0 48 2 25 0 6
                                    0 49 1 25 0 40 50 2 14 10 0 0 52 0 53 0 54
                                    2 53 0 0 14 55 2 53 0 6 0 56 2 53 0 0 0 57
                                    1 53 0 58 59 1 53 0 6 60 2 53 0 0 0 61 2 25
                                    0 0 14 63 0 65 0 66 2 6 10 0 0 67 2 65 0 6
                                    14 68 2 65 0 0 0 69 2 65 0 0 0 70 0 65 0 71
                                    2 65 0 6 0 72 2 65 0 0 0 73 1 65 10 0 75 2
                                    65 0 0 0 76 1 65 14 0 77 1 65 6 0 78 1 65 0
                                    0 79 2 6 0 0 14 81 2 6 0 0 0 82 2 6 0 0 0
                                    83 1 6 0 58 84 2 6 0 0 0 85 2 0 6 0 14 86 2
                                    14 10 0 0 89 2 9 0 92 0 93 2 26 25 25 6 95
                                    1 26 25 25 97 2 6 0 0 58 100 2 0 0 6 0 101
                                    2 0 0 0 0 102 2 0 0 0 58 103 2 26 25 104 25
                                    105 1 26 25 25 107 1 26 25 25 109 1 26 25
                                    25 111 1 26 25 25 113 3 26 25 25 21 21 115
                                    2 9 0 0 21 117 1 9 0 0 119 2 9 0 0 14 121 2
                                    9 0 0 14 123 2 26 25 25 25 125 1 26 25 25
                                    127 3 26 25 21 21 25 129 3 26 25 21 21 25
                                    131 1 6 10 0 136 1 0 10 0 137 2 26 25 138
                                    25 139 2 0 0 0 6 140 2 26 25 6 25 141 1 6 0
                                    138 142 1 0 0 138 143 2 26 25 6 25 144 1 0
                                    0 0 145 2 0 0 0 19 146 1 6 147 0 148 2 147
                                    10 58 0 149 2 6 0 0 58 150 2 0 0 0 58 151 2
                                    153 152 6 58 154 2 0 10 0 0 1 1 30 10 0 1 1
                                    0 158 0 1 1 0 58 0 87 2 0 65 0 14 74 1 25
                                    156 0 1 1 25 0 0 1 1 25 10 0 137 3 0 0 0 14
                                    14 124 2 0 0 0 14 122 1 0 37 0 42 1 1 0 0 1
                                    1 1 0 0 1 2 31 155 0 0 1 1 1 0 0 1 1 1 0 0
                                    1 1 1 0 0 1 1 0 0 25 1 1 0 0 37 51 1 1 0 0
                                    1 1 1 0 0 1 0 30 0 1 1 28 155 0 1 2 28 0 0
                                    14 1 2 0 0 0 133 1 1 0 0 0 128 1 0 0 0 1 1
                                    28 155 0 1 1 0 0 0 135 2 0 53 0 14 62 3 0
                                    53 0 14 14 64 1 0 10 0 1 0 1 0 1 1 0 14 0 1
                                    2 0 14 0 14 1 2 30 10 0 0 1 1 28 10 0 1 1 0
                                    0 0 112 2 1 0 0 21 1 3 0 0 21 21 0 130 2 0
                                    0 0 133 134 2 0 0 104 0 106 1 0 10 0 1 3 0
                                    0 0 158 157 1 3 0 0 0 159 14 1 2 0 0 6 14
                                    15 2 0 0 92 0 94 1 1 0 0 1 1 28 155 0 1 2
                                    28 0 0 14 1 2 0 0 0 133 1 1 0 0 0 1 1 0 6 0
                                    1 1 0 160 0 1 1 0 0 0 110 1 0 0 0 108 3 0 0
                                    21 21 0 132 2 24 0 0 58 151 2 1 0 0 19 146
                                    1 1 0 0 145 2 0 162 162 0 1 1 0 161 0 1 3 0
                                    0 0 21 21 116 2 0 0 0 14 118 2 25 155 0 0 1
                                    1 1 0 0 1 1 0 0 0 114 2 10 25 0 6 96 2 9 0
                                    0 0 126 2 0 6 0 14 91 2 8 0 0 58 103 3 8 0
                                    0 58 14 1 2 8 0 0 147 1 3 8 0 0 147 157 1 1
                                    7 0 0 98 2 7 0 0 14 1 2 0 0 0 19 99 1 0 14
                                    0 1 1 1 0 0 1 1 1 0 0 1 1 1 0 0 1 1 1 0 0 1
                                    1 1 0 0 1 1 1 0 0 1 1 0 0 0 120 2 29 0 0 0
                                    1 1 26 0 6 23 1 29 0 21 24 1 27 0 0 1 1 1 0
                                    138 143 1 0 0 19 20 1 0 0 65 80 1 0 163 0 1
                                    1 0 25 0 1 2 0 6 0 14 90 1 3 155 0 1 0 29
                                    14 1 1 0 6 0 88 1 1 0 0 1 1 1 0 0 1 3 29 0
                                    0 0 0 1 2 25 10 0 0 1 1 1 0 0 1 1 1 0 0 1 1
                                    1 0 0 1 1 1 0 0 1 2 11 6 0 14 86 2 0 0 0 0
                                    1 2 29 10 0 0 1 1 1 0 0 1 1 1 0 0 1 1 1 0 0
                                    1 1 1 0 0 1 1 1 0 0 1 1 1 0 0 1 2 28 0 0 14
                                    1 2 1 0 0 138 1 2 1 0 0 0 1 2 23 0 0 6 140
                                    2 0 0 0 133 1 0 30 0 17 0 28 0 13 2 8 0 0
                                    147 1 2 8 0 0 58 1 3 8 0 0 147 157 1 3 8 0
                                    0 58 14 1 1 7 0 0 1 2 7 0 0 14 1 2 0 10 0 0
                                    1 2 23 0 0 6 1 1 32 0 0 1 2 32 0 0 0 102 2
                                    0 0 0 0 18 2 32 0 21 0 1 2 30 0 14 0 1 2 1
                                    0 138 0 1 2 1 0 0 138 1 2 0 0 6 0 101 2 0 0
                                    0 6 1 2 0 0 0 0 1 2 0 0 133 0 1)))))
           '|lookupComplete|)) 
