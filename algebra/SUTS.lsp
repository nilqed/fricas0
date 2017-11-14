
(PUT '|SUTS;makeTerm| '|SPADreplace| 'CONS) 

(SDEFUN |SUTS;makeTerm|
        ((|exp| |Integer|) (|coef| |Coef|)
         ($ |Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))
        (CONS |exp| |coef|)) 

(PUT '|SUTS;getCoef| '|SPADreplace| 'QCDR) 

(SDEFUN |SUTS;getCoef|
        ((|term| |Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)) ($ |Coef|))
        (QCDR |term|)) 

(PUT '|SUTS;getExpon| '|SPADreplace| 'QCAR) 

(SDEFUN |SUTS;getExpon|
        ((|term| |Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))
         ($ |Integer|))
        (QCAR |term|)) 

(SDEFUN |SUTS;monomial;CoefNni$;4|
        ((|coef| |Coef|) (|expon| |NonNegativeInteger|) ($ $))
        (SPADCALL |coef| |expon| (QREFELT $ 11))) 

(SDEFUN |SUTS;extend;$Nni$;5| ((|x| $) (|n| |NonNegativeInteger|) ($ $))
        (SPADCALL |x| |n| (QREFELT $ 14))) 

(SDEFUN |SUTS;Zero;$;6| (($ $))
        (SPADCALL (|spadConstant| $ 16) 0 (QREFELT $ 11))) 

(SDEFUN |SUTS;One;$;7| (($ $))
        (SPADCALL (|spadConstant| $ 18) 0 (QREFELT $ 11))) 

(SDEFUN |SUTS;recip;$U;8| ((|uts| $) ($ |Union| $ "failed"))
        (SPADCALL (|spadConstant| $ 19) |uts| 'T (QREFELT $ 22))) 

(SDEFUN |SUTS;exquo;2$U;9| ((|uts1| $) (|uts2| $) ($ |Union| $ "failed"))
        (SPADCALL |uts1| |uts2| 'T (QREFELT $ 22))) 

(SDEFUN |SUTS;quoByVar;2$;10| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 25))) 

(SDEFUN |SUTS;differentiate;$V$;11| ((|x| $) (|v| |Variable| |var|) ($ $))
        (SPADCALL |x| (QREFELT $ 27))) 

(SDEFUN |SUTS;coerce;V$;12| ((|v| |Variable| |var|) ($ $))
        (COND
         ((SPADCALL (QREFELT $ 8) (QREFELT $ 30))
          (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 13)))
         ('T
          (SPADCALL (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 13))
                    (SPADCALL (QREFELT $ 8) 0 (QREFELT $ 13)) (QREFELT $ 31))))) 

(SDEFUN |SUTS;coerce;Up$;13| ((|p| |UnivariatePolynomial| |var| |Coef|) ($ $))
        (SPROG
         ((|st| (|Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))))
         (SEQ
          (COND ((SPADCALL |p| (QREFELT $ 34)) (|spadConstant| $ 17))
                ('T
                 (SEQ
                  (COND
                   ((NULL (SPADCALL (QREFELT $ 8) (QREFELT $ 30)))
                    (LETT |p|
                          (SPADCALL |p|
                                    (SPADCALL
                                     (SPADCALL (|spadConstant| $ 18) 1
                                               (QREFELT $ 35))
                                     (SPADCALL (QREFELT $ 8) 0 (QREFELT $ 35))
                                     (QREFELT $ 36))
                                    (QREFELT $ 37))
                          . #1=(|SUTS;coerce;Up$;13|))))
                  (LETT |st| (SPADCALL (QREFELT $ 40)) . #1#)
                  (SEQ G190
                       (COND
                        ((NULL (NULL (SPADCALL |p| (QREFELT $ 34))))
                         (GO G191)))
                       (SEQ
                        (LETT |st|
                              (SPADCALL
                               (|SUTS;makeTerm| (SPADCALL |p| (QREFELT $ 41))
                                (SPADCALL |p| (QREFELT $ 42)) $)
                               |st| (QREFELT $ 43))
                              . #1#)
                        (EXIT (LETT |p| (SPADCALL |p| (QREFELT $ 44)) . #1#)))
                       NIL (GO G190) G191 (EXIT NIL))
                  (EXIT
                   (SPADCALL
                    (SPADCALL (SPADCALL (QREFELT $ 46)) (QREFELT $ 48)) |st|
                    (QREFELT $ 49))))))))) 

(SDEFUN |SUTS;univariatePolynomial;$NniUp;14|
        ((|x| $) (|n| |NonNegativeInteger|)
         ($ |UnivariatePolynomial| |var| |Coef|))
        (SPROG
         ((|st| (|Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
          (|ans| (|UnivariatePolynomial| |var| |Coef|))
          (|monPow| (|UnivariatePolynomial| |var| |Coef|))
          (|oldDeg| (|Integer|)) (|pow| (|NonNegativeInteger|)) (#1=#:G767 NIL)
          (#2=#:G777 NIL) (|xExpon| (|Integer|))
          (|xTerm| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))
          (|mon| (|UnivariatePolynomial| |var| |Coef|)))
         (SEQ
          (EXIT
           (SEQ (SPADCALL |x| |n| (QREFELT $ 15))
                (LETT |st| (SPADCALL |x| (QREFELT $ 51))
                      . #3=(|SUTS;univariatePolynomial;$NniUp;14|))
                (LETT |ans| (|spadConstant| $ 52) . #3#)
                (LETT |oldDeg| 0 . #3#)
                (LETT |mon|
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 35))
                       (SPADCALL (SPADCALL |x| (QREFELT $ 53)) 0
                                 (QREFELT $ 35))
                       (QREFELT $ 54))
                      . #3#)
                (LETT |monPow| (|spadConstant| $ 55) . #3#)
                (SEQ G190
                     (COND ((NULL (SPADCALL |st| (QREFELT $ 56))) (GO G191)))
                     (SEQ
                      (LETT |xExpon|
                            (|SUTS;getExpon|
                             (LETT |xTerm| (SPADCALL |st| (QREFELT $ 57))
                                   . #3#)
                             $)
                            . #3#)
                      (EXIT
                       (COND
                        ((SPADCALL |xExpon| |n| (QREFELT $ 58))
                         (PROGN (LETT #2# |ans| . #3#) (GO #4=#:G776)))
                        ('T
                         (SEQ
                          (LETT |pow|
                                (PROG1 (LETT #1# (- |xExpon| |oldDeg|) . #3#)
                                  (|check_subtype2| (>= #1# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #1#))
                                . #3#)
                          (LETT |oldDeg| |xExpon| . #3#)
                          (LETT |monPow|
                                (SPADCALL |monPow|
                                          (SPADCALL |mon| |pow| (QREFELT $ 59))
                                          (QREFELT $ 60))
                                . #3#)
                          (LETT |ans|
                                (SPADCALL |ans|
                                          (SPADCALL (|SUTS;getCoef| |xTerm| $)
                                                    |monPow| (QREFELT $ 61))
                                          (QREFELT $ 36))
                                . #3#)
                          (EXIT
                           (LETT |st| (SPADCALL |st| (QREFELT $ 62))
                                 . #3#)))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT |ans|)))
          #4# (EXIT #2#)))) 

(SDEFUN |SUTS;polynomial;$NniP;15|
        ((|x| $) (|n| |NonNegativeInteger|) ($ |Polynomial| |Coef|))
        (SPROG
         ((|st| (|Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
          (|ans| (|Polynomial| |Coef|)) (|monPow| (|Polynomial| |Coef|))
          (|oldDeg| (|Integer|)) (|pow| (|NonNegativeInteger|)) (#1=#:G782 NIL)
          (#2=#:G788 NIL) (|xExpon| (|Integer|))
          (|xTerm| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))
          (|mon| (|Polynomial| |Coef|)))
         (SEQ
          (EXIT
           (SEQ (SPADCALL |x| |n| (QREFELT $ 15))
                (LETT |st| (SPADCALL |x| (QREFELT $ 51))
                      . #3=(|SUTS;polynomial;$NniP;15|))
                (LETT |ans| (|spadConstant| $ 65) . #3#)
                (LETT |oldDeg| 0 . #3#)
                (LETT |mon|
                      (SPADCALL (SPADCALL (QREFELT $ 7) (QREFELT $ 67))
                                (SPADCALL (SPADCALL |x| (QREFELT $ 53))
                                          (QREFELT $ 68))
                                (QREFELT $ 69))
                      . #3#)
                (LETT |monPow| (|spadConstant| $ 70) . #3#)
                (SEQ G190
                     (COND ((NULL (SPADCALL |st| (QREFELT $ 56))) (GO G191)))
                     (SEQ
                      (LETT |xExpon|
                            (|SUTS;getExpon|
                             (LETT |xTerm| (SPADCALL |st| (QREFELT $ 57))
                                   . #3#)
                             $)
                            . #3#)
                      (EXIT
                       (COND
                        ((SPADCALL |xExpon| |n| (QREFELT $ 58))
                         (PROGN (LETT #2# |ans| . #3#) (GO #4=#:G787)))
                        ('T
                         (SEQ
                          (LETT |pow|
                                (PROG1 (LETT #1# (- |xExpon| |oldDeg|) . #3#)
                                  (|check_subtype2| (>= #1# 0)
                                                    '(|NonNegativeInteger|)
                                                    '(|Integer|) #1#))
                                . #3#)
                          (LETT |oldDeg| |xExpon| . #3#)
                          (LETT |monPow|
                                (SPADCALL |monPow|
                                          (SPADCALL |mon| |pow| (QREFELT $ 71))
                                          (QREFELT $ 72))
                                . #3#)
                          (LETT |ans|
                                (SPADCALL |ans|
                                          (SPADCALL (|SUTS;getCoef| |xTerm| $)
                                                    |monPow| (QREFELT $ 73))
                                          (QREFELT $ 74))
                                . #3#)
                          (EXIT
                           (LETT |st| (SPADCALL |st| (QREFELT $ 62))
                                 . #3#)))))))
                     NIL (GO G190) G191 (EXIT NIL))
                (EXIT |ans|)))
          #4# (EXIT #2#)))) 

(SDEFUN |SUTS;polynomial;$2NniP;16|
        ((|x| $) (|n1| . #1=(|NonNegativeInteger|)) (|n2| . #1#)
         ($ |Polynomial| |Coef|))
        (SPADCALL (SPADCALL |x| |n1| |n2| (QREFELT $ 76)) |n2| (QREFELT $ 75))) 

(SDEFUN |SUTS;truncate;$Nni$;17| ((|x| $) (|n| |NonNegativeInteger|) ($ $))
        (SPADCALL |x| |n| (QREFELT $ 78))) 

(SDEFUN |SUTS;truncate;$2Nni$;18|
        ((|x| $) (|n1| . #1=(|NonNegativeInteger|)) (|n2| . #1#) ($ $))
        (SPADCALL |x| |n1| |n2| (QREFELT $ 80))) 

(SDEFUN |SUTS;iCoefficients|
        ((|x| |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))
         (|refer| |Reference| (|OrderedCompletion| (|Integer|)))
         (|n| |Integer|) ($ |Stream| |Coef|))
        (SPROG NIL
               (SEQ
                (SPADCALL
                 (CONS #'|SUTS;iCoefficients!0| (VECTOR |refer| |n| $ |x|))
                 (QREFELT $ 93))))) 

(SDEFUN |SUTS;iCoefficients!0| (($$ NIL))
        (PROG (|x| $ |n| |refer|)
          (LETT |x| (QREFELT $$ 3) . #1=(|SUTS;iCoefficients|))
          (LETT $ (QREFELT $$ 2) . #1#)
          (LETT |n| (QREFELT $$ 1) . #1#)
          (LETT |refer| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG
             ((|nn| NIL) (|nx| NIL) (|xTerm| NIL) (|xCoef| NIL) (|xExpon| NIL))
             (SEQ
              (COND ((SPADCALL |x| (QREFELT $ 81)) (SPADCALL (QREFELT $ 83)))
                    ('T
                     (SEQ (LETT |nn| (SPADCALL |n| (QREFELT $ 84)) NIL)
                          (SEQ G190
                               (COND
                                ((NULL
                                  (SPADCALL
                                   (LETT |nx| (SPADCALL |refer| (QREFELT $ 85))
                                         NIL)
                                   |nn| (QREFELT $ 86)))
                                 (GO G191)))
                               (SEQ (EXIT (SPADCALL |x| (QREFELT $ 87)))) NIL
                               (GO G190) G191 (EXIT NIL))
                          (EXIT
                           (COND
                            ((SPADCALL |x| (QREFELT $ 56))
                             (SEQ
                              (LETT |xCoef|
                                    (|SUTS;getCoef|
                                     (LETT |xTerm|
                                           (SPADCALL |x| (QREFELT $ 57)) NIL)
                                     $)
                                    NIL)
                              (LETT |xExpon| (|SUTS;getExpon| |xTerm| $) NIL)
                              (EXIT
                               (COND
                                ((SPADCALL |xExpon| |n| (QREFELT $ 88))
                                 (SPADCALL |xCoef|
                                           (|SUTS;iCoefficients|
                                            (SPADCALL |x| (QREFELT $ 62))
                                            |refer|
                                            (SPADCALL |n| (|spadConstant| $ 89)
                                                      (QREFELT $ 90))
                                            $)
                                           (QREFELT $ 91)))
                                ('T
                                 (SPADCALL (|spadConstant| $ 16)
                                           (|SUTS;iCoefficients| |x| |refer|
                                            (SPADCALL |n| (|spadConstant| $ 89)
                                                      (QREFELT $ 90))
                                            $)
                                           (QREFELT $ 91)))))))
                            ('T
                             (SPADCALL (|spadConstant| $ 16)
                                       (|SUTS;iCoefficients| |x| |refer|
                                        (SPADCALL |n| (|spadConstant| $ 89)
                                                  (QREFELT $ 90))
                                        $)
                                       (QREFELT $ 91)))))))))))))) 

(SDEFUN |SUTS;coefficients;$S;20| ((|uts| $) ($ |Stream| |Coef|))
        (SPROG
         ((|x| (|Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
          (|refer| (|Reference| (|OrderedCompletion| (|Integer|)))))
         (SEQ
          (LETT |refer| (SPADCALL |uts| (QREFELT $ 94))
                . #1=(|SUTS;coefficients;$S;20|))
          (LETT |x| (SPADCALL |uts| (QREFELT $ 51)) . #1#)
          (EXIT (|SUTS;iCoefficients| |x| |refer| 0 $))))) 

(SDEFUN |SUTS;terms;$S;21|
        ((|uts| $)
         ($ |Stream|
          (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| |Coef|))))
        (SPADCALL |uts| (QREFELT $ 96))) 

(SDEFUN |SUTS;iSeries|
        ((|st| |Stream| |Coef|) (|n| |Integer|)
         (|refer| |Reference| (|OrderedCompletion| (|Integer|)))
         ($ |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
        (SPROG NIL
               (SEQ
                (SPADCALL (CONS #'|SUTS;iSeries!0| (VECTOR |n| |refer| $ |st|))
                          (QREFELT $ 104))))) 

(SDEFUN |SUTS;iSeries!0| (($$ NIL))
        (PROG (|st| $ |refer| |n|)
          (LETT |st| (QREFELT $$ 3) . #1=(|SUTS;iSeries|))
          (LETT $ (QREFELT $$ 2) . #1#)
          (LETT |refer| (QREFELT $$ 1) . #1#)
          (LETT |n| (QREFELT $$ 0) . #1#)
          (RETURN
           (PROGN
            (SPROG ((|coef| NIL))
                   (SEQ
                    (COND
                     ((SPADCALL |st| (QREFELT $ 100))
                      (SEQ
                       (SPADCALL |refer| (SPADCALL (QREFELT $ 46))
                                 (QREFELT $ 101))
                       (EXIT (SPADCALL (QREFELT $ 40)))))
                     ('T
                      (SEQ
                       (SPADCALL |refer| (SPADCALL |n| (QREFELT $ 84))
                                 (QREFELT $ 101))
                       (EXIT
                        (COND
                         ((SPADCALL
                           (LETT |coef| (SPADCALL |st| (QREFELT $ 102)) NIL)
                           (QREFELT $ 30))
                          (|SUTS;iSeries| (SPADCALL |st| (QREFELT $ 103))
                           (SPADCALL |n| (|spadConstant| $ 89) (QREFELT $ 90))
                           |refer| $))
                         ('T
                          (SPADCALL (|SUTS;makeTerm| |n| |coef| $)
                                    (|SUTS;iSeries|
                                     (SPADCALL |st| (QREFELT $ 103))
                                     (SPADCALL |n| (|spadConstant| $ 89)
                                               (QREFELT $ 90))
                                     |refer| $)
                                    (QREFELT $ 43)))))))))))))) 

(SDEFUN |SUTS;series;S$;23| ((|st| |Stream| |Coef|) ($ $))
        (SPROG ((|refer| (|Reference| (|OrderedCompletion| (|Integer|)))))
               (SEQ
                (LETT |refer|
                      (SPADCALL (SPADCALL -1 (QREFELT $ 84)) (QREFELT $ 48))
                      |SUTS;series;S$;23|)
                (EXIT
                 (SPADCALL |refer| (|SUTS;iSeries| |st| 0 |refer| $)
                           (QREFELT $ 49)))))) 

(SDEFUN |SUTS;nniToI|
        ((|st| |Stream|
          (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| |Coef|)))
         ($ |Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
        (SPROG ((|term| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|))))
               (SEQ
                (COND
                 ((SPADCALL |st| (QREFELT $ 106)) (SPADCALL (QREFELT $ 40)))
                 ('T
                  (SEQ
                   (LETT |term|
                         (CONS (QCAR (SPADCALL |st| (QREFELT $ 107)))
                               (QCDR (SPADCALL |st| (QREFELT $ 107))))
                         |SUTS;nniToI|)
                   (EXIT
                    (SPADCALL |term|
                              (|SUTS;nniToI| (SPADCALL |st| (QREFELT $ 108)) $)
                              (QREFELT $ 43))))))))) 

(SDEFUN |SUTS;series;S$;25|
        ((|st| |Stream|
          (|Record| (|:| |k| (|NonNegativeInteger|)) (|:| |c| |Coef|)))
         ($ $))
        (SPADCALL (|SUTS;nniToI| |st| $) (QREFELT $ 109))) 

(SDEFUN |SUTS;variable;$S;26| ((|x| $) ($ |Symbol|)) (QREFELT $ 7)) 

(SDEFUN |SUTS;center;$Coef;27| ((|x| $) ($ |Coef|)) (QREFELT $ 8)) 

(SDEFUN |SUTS;coefficient;$NniCoef;28|
        ((|x| $) (|n| |NonNegativeInteger|) ($ |Coef|))
        (SPADCALL |x| |n| (QREFELT $ 112))) 

(SDEFUN |SUTS;elt;$NniCoef;29| ((|x| $) (|n| |NonNegativeInteger|) ($ |Coef|))
        (SPADCALL |x| |n| (QREFELT $ 113))) 

(PUT '|SUTS;pole?;$B;30| '|SPADreplace| '(XLAM (|x|) NIL)) 

(SDEFUN |SUTS;pole?;$B;30| ((|x| $) ($ |Boolean|)) NIL) 

(SDEFUN |SUTS;order;$Nni;31| ((|x| $) ($ |NonNegativeInteger|))
        (SPROG ((#1=#:G837 NIL))
               (PROG1
                   (LETT #1# (SPADCALL |x| (QREFELT $ 116))
                         |SUTS;order;$Nni;31|)
                 (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                   '(|Integer|) #1#)))) 

(SDEFUN |SUTS;order;$2Nni;32|
        ((|x| $) (|n| . #1=(|NonNegativeInteger|)) ($ . #1#))
        (SPROG ((#2=#:G839 NIL))
               (PROG1
                   (LETT #2# (SPADCALL |x| |n| (QREFELT $ 118))
                         |SUTS;order;$2Nni;32|)
                 (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                   '(|Integer|) #2#)))) 

(SDEFUN |SUTS;elt;3$;33| ((|uts1| $) (|uts2| $) ($ $))
        (COND
         ((SPADCALL |uts2| (QREFELT $ 120))
          (SPADCALL (SPADCALL |uts1| 0 (QREFELT $ 113)) (QREFELT $ 121)))
         ((NULL (SPADCALL (SPADCALL |uts2| 0 (QREFELT $ 113)) (QREFELT $ 30)))
          (|error| "elt: second argument must have positive order"))
         ('T (SPADCALL |uts1| |uts2| (QREFELT $ 122))))) 

(SDEFUN |SUTS;integrate;$V$;34| ((|x| $) (|v| |Variable| |var|) ($ $))
        (SPADCALL |x| (QREFELT $ 124))) 

(SDEFUN |SUTS;^;3$;35| ((|uts1| $) (|uts2| $) ($ $))
        (SPADCALL
         (SPADCALL (SPADCALL |uts1| (QREFELT $ 126)) |uts2| (QREFELT $ 127))
         (QREFELT $ 128))) 

(SDEFUN |SUTS;^;$F$;36| ((|uts| $) (|r| |Fraction| (|Integer|)) ($ $))
        (SPADCALL |uts| |r| (QREFELT $ 131))) 

(SDEFUN |SUTS;exp;2$;37| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 133))) 

(SDEFUN |SUTS;log;2$;38| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 134))) 

(SDEFUN |SUTS;sin;2$;39| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 135))) 

(SDEFUN |SUTS;cos;2$;40| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 137))) 

(SDEFUN |SUTS;tan;2$;41| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 139))) 

(SDEFUN |SUTS;cot;2$;42| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 141))) 

(SDEFUN |SUTS;sec;2$;43| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 143))) 

(SDEFUN |SUTS;csc;2$;44| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 145))) 

(SDEFUN |SUTS;asin;2$;45| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 147))) 

(SDEFUN |SUTS;acos;2$;46| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 149))) 

(SDEFUN |SUTS;atan;2$;47| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 151))) 

(SDEFUN |SUTS;acot;2$;48| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 153))) 

(SDEFUN |SUTS;asec;2$;49| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 155))) 

(SDEFUN |SUTS;acsc;2$;50| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 157))) 

(SDEFUN |SUTS;sinh;2$;51| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 159))) 

(SDEFUN |SUTS;cosh;2$;52| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 161))) 

(SDEFUN |SUTS;tanh;2$;53| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 163))) 

(SDEFUN |SUTS;coth;2$;54| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 165))) 

(SDEFUN |SUTS;sech;2$;55| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 167))) 

(SDEFUN |SUTS;csch;2$;56| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 169))) 

(SDEFUN |SUTS;asinh;2$;57| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 171))) 

(SDEFUN |SUTS;acosh;2$;58| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 173))) 

(SDEFUN |SUTS;atanh;2$;59| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 175))) 

(SDEFUN |SUTS;acoth;2$;60| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 177))) 

(SDEFUN |SUTS;asech;2$;61| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 179))) 

(SDEFUN |SUTS;acsch;2$;62| ((|uts| $) ($ $)) (SPADCALL |uts| (QREFELT $ 181))) 

(SDEFUN |SUTS;^;$F$;63| ((|uts| $) (|r| |Fraction| (|Integer|)) ($ $))
        (SPROG ((|ratPow| ($)) (|onePlusX| ($)))
               (SEQ
                (COND
                 ((NULL
                   (SPADCALL (SPADCALL |uts| 0 (QREFELT $ 113))
                             (|spadConstant| $ 18) (QREFELT $ 186)))
                  (|error| "^: constant coefficient must be one"))
                 ('T
                  (SEQ
                   (LETT |onePlusX|
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 18) 0 (QREFELT $ 13))
                          (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 13))
                          (QREFELT $ 31))
                         . #1=(|SUTS;^;$F$;63|))
                   (LETT |ratPow|
                         (SPADCALL |uts| (SPADCALL |r| (QREFELT $ 187))
                                   (QREFELT $ 188))
                         . #1#)
                   (EXIT
                    (SPADCALL |ratPow|
                              (SPADCALL |uts| (|spadConstant| $ 19)
                                        (QREFELT $ 189))
                              (QREFELT $ 122))))))))) 

(SDEFUN |SUTS;exp;2$;64| ((|uts| $) ($ $))
        (SPROG ((|expx| ($)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |uts| 0 (QREFELT $ 113)) (QREFELT $ 30))
                  (SEQ
                   (LETT |expx|
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 13))
                          (QREFELT $ 133))
                         |SUTS;exp;2$;64|)
                   (EXIT (SPADCALL |expx| |uts| (QREFELT $ 122)))))
                 ('T (|error| (STRCONC "exp: " (QREFELT $ 183)))))))) 

(SDEFUN |SUTS;log;2$;65| ((|uts| $) ($ $))
        (SPROG ((|log1PlusX| ($)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |uts| 0 (QREFELT $ 113))
                            (|spadConstant| $ 18) (QREFELT $ 186))
                  (SEQ
                   (LETT |log1PlusX|
                         (SPADCALL
                          (SPADCALL
                           (SPADCALL (|spadConstant| $ 18) 0 (QREFELT $ 13))
                           (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 13))
                           (QREFELT $ 31))
                          (QREFELT $ 134))
                         |SUTS;log;2$;65|)
                   (EXIT
                    (SPADCALL |log1PlusX|
                              (SPADCALL |uts| (|spadConstant| $ 19)
                                        (QREFELT $ 189))
                              (QREFELT $ 122)))))
                 ('T (|error| (STRCONC "log: " (QREFELT $ 184)))))))) 

(SDEFUN |SUTS;sin;2$;66| ((|uts| $) ($ $))
        (SPROG ((|sinx| ($)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |uts| 0 (QREFELT $ 113)) (QREFELT $ 30))
                  (SEQ
                   (LETT |sinx|
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 13))
                          (QREFELT $ 135))
                         |SUTS;sin;2$;66|)
                   (EXIT (SPADCALL |sinx| |uts| (QREFELT $ 122)))))
                 ('T (|error| (STRCONC "sin: " (QREFELT $ 183)))))))) 

(SDEFUN |SUTS;cos;2$;67| ((|uts| $) ($ $))
        (SPROG ((|cosx| ($)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |uts| 0 (QREFELT $ 113)) (QREFELT $ 30))
                  (SEQ
                   (LETT |cosx|
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 13))
                          (QREFELT $ 137))
                         |SUTS;cos;2$;67|)
                   (EXIT (SPADCALL |cosx| |uts| (QREFELT $ 122)))))
                 ('T (|error| (STRCONC "cos: " (QREFELT $ 183)))))))) 

(SDEFUN |SUTS;tan;2$;68| ((|uts| $) ($ $))
        (SPROG ((|tanx| ($)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |uts| 0 (QREFELT $ 113)) (QREFELT $ 30))
                  (SEQ
                   (LETT |tanx|
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 13))
                          (QREFELT $ 139))
                         |SUTS;tan;2$;68|)
                   (EXIT (SPADCALL |tanx| |uts| (QREFELT $ 122)))))
                 ('T (|error| (STRCONC "tan: " (QREFELT $ 183)))))))) 

(SDEFUN |SUTS;cot;2$;69| ((|uts| $) ($ $))
        (COND
         ((SPADCALL |uts| (QREFELT $ 120))
          (|error| "cot: cot(0) is undefined"))
         ((SPADCALL (SPADCALL |uts| 0 (QREFELT $ 113)) (QREFELT $ 30))
          (|error| (STRCONC "cot: " (QREFELT $ 185))))
         ('T (|error| (STRCONC "cot: " (QREFELT $ 183)))))) 

(SDEFUN |SUTS;sec;2$;70| ((|uts| $) ($ $))
        (SPROG ((|secx| ($)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |uts| 0 (QREFELT $ 113)) (QREFELT $ 30))
                  (SEQ
                   (LETT |secx|
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 13))
                          (QREFELT $ 143))
                         |SUTS;sec;2$;70|)
                   (EXIT (SPADCALL |secx| |uts| (QREFELT $ 122)))))
                 ('T (|error| (STRCONC "sec: " (QREFELT $ 183)))))))) 

(SDEFUN |SUTS;csc;2$;71| ((|uts| $) ($ $))
        (COND
         ((SPADCALL |uts| (QREFELT $ 120))
          (|error| "csc: csc(0) is undefined"))
         ((SPADCALL (SPADCALL |uts| 0 (QREFELT $ 113)) (QREFELT $ 30))
          (|error| (STRCONC "csc: " (QREFELT $ 185))))
         ('T (|error| (STRCONC "csc: " (QREFELT $ 183)))))) 

(SDEFUN |SUTS;asin;2$;72| ((|uts| $) ($ $))
        (SPROG ((|asinx| ($)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |uts| 0 (QREFELT $ 113)) (QREFELT $ 30))
                  (SEQ
                   (LETT |asinx|
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 13))
                          (QREFELT $ 147))
                         |SUTS;asin;2$;72|)
                   (EXIT (SPADCALL |asinx| |uts| (QREFELT $ 122)))))
                 ('T (|error| (STRCONC "asin: " (QREFELT $ 183)))))))) 

(SDEFUN |SUTS;atan;2$;73| ((|uts| $) ($ $))
        (SPROG ((|atanx| ($)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |uts| 0 (QREFELT $ 113)) (QREFELT $ 30))
                  (SEQ
                   (LETT |atanx|
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 13))
                          (QREFELT $ 151))
                         |SUTS;atan;2$;73|)
                   (EXIT (SPADCALL |atanx| |uts| (QREFELT $ 122)))))
                 ('T (|error| (STRCONC "atan: " (QREFELT $ 183)))))))) 

(PUT '|SUTS;acos;2$;74| '|SPADreplace|
     '(XLAM (|z|) (|error| "acos: acos undefined on this coefficient domain"))) 

(SDEFUN |SUTS;acos;2$;74| ((|z| $) ($ $))
        (|error| "acos: acos undefined on this coefficient domain")) 

(PUT '|SUTS;acot;2$;75| '|SPADreplace|
     '(XLAM (|z|) (|error| "acot: acot undefined on this coefficient domain"))) 

(SDEFUN |SUTS;acot;2$;75| ((|z| $) ($ $))
        (|error| "acot: acot undefined on this coefficient domain")) 

(PUT '|SUTS;asec;2$;76| '|SPADreplace|
     '(XLAM (|z|) (|error| "asec: asec undefined on this coefficient domain"))) 

(SDEFUN |SUTS;asec;2$;76| ((|z| $) ($ $))
        (|error| "asec: asec undefined on this coefficient domain")) 

(PUT '|SUTS;acsc;2$;77| '|SPADreplace|
     '(XLAM (|z|) (|error| "acsc: acsc undefined on this coefficient domain"))) 

(SDEFUN |SUTS;acsc;2$;77| ((|z| $) ($ $))
        (|error| "acsc: acsc undefined on this coefficient domain")) 

(SDEFUN |SUTS;sinh;2$;78| ((|uts| $) ($ $))
        (SPROG ((|sinhx| ($)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |uts| 0 (QREFELT $ 113)) (QREFELT $ 30))
                  (SEQ
                   (LETT |sinhx|
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 13))
                          (QREFELT $ 159))
                         |SUTS;sinh;2$;78|)
                   (EXIT (SPADCALL |sinhx| |uts| (QREFELT $ 122)))))
                 ('T (|error| (STRCONC "sinh: " (QREFELT $ 183)))))))) 

(SDEFUN |SUTS;cosh;2$;79| ((|uts| $) ($ $))
        (SPROG ((|coshx| ($)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |uts| 0 (QREFELT $ 113)) (QREFELT $ 30))
                  (SEQ
                   (LETT |coshx|
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 13))
                          (QREFELT $ 161))
                         |SUTS;cosh;2$;79|)
                   (EXIT (SPADCALL |coshx| |uts| (QREFELT $ 122)))))
                 ('T (|error| (STRCONC "cosh: " (QREFELT $ 183)))))))) 

(SDEFUN |SUTS;tanh;2$;80| ((|uts| $) ($ $))
        (SPROG ((|tanhx| ($)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |uts| 0 (QREFELT $ 113)) (QREFELT $ 30))
                  (SEQ
                   (LETT |tanhx|
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 13))
                          (QREFELT $ 163))
                         |SUTS;tanh;2$;80|)
                   (EXIT (SPADCALL |tanhx| |uts| (QREFELT $ 122)))))
                 ('T (|error| (STRCONC "tanh: " (QREFELT $ 183)))))))) 

(SDEFUN |SUTS;coth;2$;81| ((|uts| $) ($ $))
        (COND
         ((SPADCALL |uts| (QREFELT $ 120))
          (|error| "coth: coth(0) is undefined"))
         ((SPADCALL (SPADCALL |uts| 0 (QREFELT $ 113)) (QREFELT $ 30))
          (|error| (STRCONC "coth: " (QREFELT $ 185))))
         ('T (|error| (STRCONC "coth: " (QREFELT $ 183)))))) 

(SDEFUN |SUTS;sech;2$;82| ((|uts| $) ($ $))
        (SPROG ((|sechx| ($)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |uts| 0 (QREFELT $ 113)) (QREFELT $ 30))
                  (SEQ
                   (LETT |sechx|
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 13))
                          (QREFELT $ 167))
                         |SUTS;sech;2$;82|)
                   (EXIT (SPADCALL |sechx| |uts| (QREFELT $ 122)))))
                 ('T (|error| (STRCONC "sech: " (QREFELT $ 183)))))))) 

(SDEFUN |SUTS;csch;2$;83| ((|uts| $) ($ $))
        (COND
         ((SPADCALL |uts| (QREFELT $ 120))
          (|error| "csch: csch(0) is undefined"))
         ((SPADCALL (SPADCALL |uts| 0 (QREFELT $ 113)) (QREFELT $ 30))
          (|error| (STRCONC "csch: " (QREFELT $ 185))))
         ('T (|error| (STRCONC "csch: " (QREFELT $ 183)))))) 

(SDEFUN |SUTS;asinh;2$;84| ((|uts| $) ($ $))
        (SPROG ((|asinhx| ($)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |uts| 0 (QREFELT $ 113)) (QREFELT $ 30))
                  (SEQ
                   (LETT |asinhx|
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 13))
                          (QREFELT $ 171))
                         |SUTS;asinh;2$;84|)
                   (EXIT (SPADCALL |asinhx| |uts| (QREFELT $ 122)))))
                 ('T (|error| (STRCONC "asinh: " (QREFELT $ 183)))))))) 

(SDEFUN |SUTS;atanh;2$;85| ((|uts| $) ($ $))
        (SPROG ((|atanhx| ($)))
               (SEQ
                (COND
                 ((SPADCALL (SPADCALL |uts| 0 (QREFELT $ 113)) (QREFELT $ 30))
                  (SEQ
                   (LETT |atanhx|
                         (SPADCALL
                          (SPADCALL (|spadConstant| $ 18) 1 (QREFELT $ 13))
                          (QREFELT $ 175))
                         |SUTS;atanh;2$;85|)
                   (EXIT (SPADCALL |atanhx| |uts| (QREFELT $ 122)))))
                 ('T (|error| (STRCONC "atanh: " (QREFELT $ 183)))))))) 

(PUT '|SUTS;acosh;2$;86| '|SPADreplace|
     '(XLAM (|uts|)
       (|error| "acosh: acosh undefined on this coefficient domain"))) 

(SDEFUN |SUTS;acosh;2$;86| ((|uts| $) ($ $))
        (|error| "acosh: acosh undefined on this coefficient domain")) 

(PUT '|SUTS;acoth;2$;87| '|SPADreplace|
     '(XLAM (|uts|)
       (|error| "acoth: acoth undefined on this coefficient domain"))) 

(SDEFUN |SUTS;acoth;2$;87| ((|uts| $) ($ $))
        (|error| "acoth: acoth undefined on this coefficient domain")) 

(PUT '|SUTS;asech;2$;88| '|SPADreplace|
     '(XLAM (|uts|)
       (|error| "asech: asech undefined on this coefficient domain"))) 

(SDEFUN |SUTS;asech;2$;88| ((|uts| $) ($ $))
        (|error| "asech: asech undefined on this coefficient domain")) 

(PUT '|SUTS;acsch;2$;89| '|SPADreplace|
     '(XLAM (|uts|)
       (|error| "acsch: acsch undefined on this coefficient domain"))) 

(SDEFUN |SUTS;acsch;2$;89| ((|uts| $) ($ $))
        (|error| "acsch: acsch undefined on this coefficient domain")) 

(SDEFUN |SUTS;^;$Coef$;90| ((|uts| $) (|r| |Coef|) ($ $))
        (COND
         ((NULL
           (SPADCALL (SPADCALL |uts| 1 (QREFELT $ 113)) (|spadConstant| $ 18)
                     (QREFELT $ 186)))
          (|error| "^: constant coefficient should be 1"))
         ('T (SPADCALL |uts| |r| (QREFELT $ 188))))) 

(SDEFUN |SUTS;coerce;$Of;91| ((|x| $) ($ |OutputForm|))
        (SPROG ((|count| (|NonNegativeInteger|)))
               (SEQ (LETT |count| |$streamCount| |SUTS;coerce;$Of;91|)
                    (SPADCALL |x| |count| (QREFELT $ 15))
                    (EXIT
                     (SPADCALL (SPADCALL |x| (QREFELT $ 51))
                               (SPADCALL |x| (QREFELT $ 94))
                               (SPADCALL |x| (QREFELT $ 111))
                               (SPADCALL |x| (QREFELT $ 53))
                               (|spadConstant| $ 191) (QREFELT $ 193)))))) 

(DECLAIM (NOTINLINE |SparseUnivariateTaylorSeries;|)) 

(DEFUN |SparseUnivariateTaylorSeries| (&REST #1=#:G960)
  (SPROG NIL
         (PROG (#2=#:G961)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SparseUnivariateTaylorSeries|)
                                               '|domainEqualList|)
                    . #3=(|SparseUnivariateTaylorSeries|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |SparseUnivariateTaylorSeries;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SparseUnivariateTaylorSeries|)))))))))) 

(DEFUN |SparseUnivariateTaylorSeries;| (|#1| |#2| |#3|)
  (SPROG
   ((|pv$| NIL) (#1=#:G954 NIL) (#2=#:G955 NIL) (#3=#:G956 NIL) (#4=#:G959 NIL)
    ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #5=(|SparseUnivariateTaylorSeries|))
    (LETT DV$2 (|devaluate| |#2|) . #5#)
    (LETT DV$3 (|devaluate| |#3|) . #5#)
    (LETT |dv$| (LIST '|SparseUnivariateTaylorSeries| DV$1 DV$2 DV$3) . #5#)
    (LETT $ (GETREFV 206) . #5#)
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
    (|haddProp| |$ConstructorCache| '|SparseUnivariateTaylorSeries|
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
    (QSETREFV $ 9 (|InnerSparseUnivariatePowerSeries| |#1|))
    (COND
     ((|testBitVector| |pv$| 2)
      (QSETREFV $ 24 (CONS (|dispatchFunction| |SUTS;exquo;2$U;9|) $))))
    (COND
     ((|testBitVector| |pv$| 1)
      (PROGN
       (QSETREFV $ 125 (CONS (|dispatchFunction| |SUTS;integrate;$V$;34|) $))
       (QSETREFV $ 129 (CONS (|dispatchFunction| |SUTS;^;3$;35|) $))
       (COND
        ((|testBitVector| |pv$| 5)
         (PROGN
          (QSETREFV $ 132 (CONS (|dispatchFunction| |SUTS;^;$F$;36|) $))
          (QSETREFV $ 128 (CONS (|dispatchFunction| |SUTS;exp;2$;37|) $))
          (QSETREFV $ 126 (CONS (|dispatchFunction| |SUTS;log;2$;38|) $))
          (QSETREFV $ 136 (CONS (|dispatchFunction| |SUTS;sin;2$;39|) $))
          (QSETREFV $ 138 (CONS (|dispatchFunction| |SUTS;cos;2$;40|) $))
          (QSETREFV $ 140 (CONS (|dispatchFunction| |SUTS;tan;2$;41|) $))
          (QSETREFV $ 142 (CONS (|dispatchFunction| |SUTS;cot;2$;42|) $))
          (QSETREFV $ 144 (CONS (|dispatchFunction| |SUTS;sec;2$;43|) $))
          (QSETREFV $ 146 (CONS (|dispatchFunction| |SUTS;csc;2$;44|) $))
          (QSETREFV $ 148 (CONS (|dispatchFunction| |SUTS;asin;2$;45|) $))
          (QSETREFV $ 150 (CONS (|dispatchFunction| |SUTS;acos;2$;46|) $))
          (QSETREFV $ 152 (CONS (|dispatchFunction| |SUTS;atan;2$;47|) $))
          (QSETREFV $ 154 (CONS (|dispatchFunction| |SUTS;acot;2$;48|) $))
          (QSETREFV $ 156 (CONS (|dispatchFunction| |SUTS;asec;2$;49|) $))
          (QSETREFV $ 158 (CONS (|dispatchFunction| |SUTS;acsc;2$;50|) $))
          (QSETREFV $ 160 (CONS (|dispatchFunction| |SUTS;sinh;2$;51|) $))
          (QSETREFV $ 162 (CONS (|dispatchFunction| |SUTS;cosh;2$;52|) $))
          (QSETREFV $ 164 (CONS (|dispatchFunction| |SUTS;tanh;2$;53|) $))
          (QSETREFV $ 166 (CONS (|dispatchFunction| |SUTS;coth;2$;54|) $))
          (QSETREFV $ 168 (CONS (|dispatchFunction| |SUTS;sech;2$;55|) $))
          (QSETREFV $ 170 (CONS (|dispatchFunction| |SUTS;csch;2$;56|) $))
          (QSETREFV $ 172 (CONS (|dispatchFunction| |SUTS;asinh;2$;57|) $))
          (QSETREFV $ 174 (CONS (|dispatchFunction| |SUTS;acosh;2$;58|) $))
          (QSETREFV $ 176 (CONS (|dispatchFunction| |SUTS;atanh;2$;59|) $))
          (QSETREFV $ 178 (CONS (|dispatchFunction| |SUTS;acoth;2$;60|) $))
          (QSETREFV $ 180 (CONS (|dispatchFunction| |SUTS;asech;2$;61|) $))
          (QSETREFV $ 182 (CONS (|dispatchFunction| |SUTS;acsch;2$;62|) $))))
        ('T
         (PROGN
          (QSETREFV $ 183 "series must have constant coefficient zero")
          (QSETREFV $ 184 "series must have constant coefficient one")
          (QSETREFV $ 185 "series expansion has terms of negative degree")
          (QSETREFV $ 132 (CONS (|dispatchFunction| |SUTS;^;$F$;63|) $))
          (QSETREFV $ 128 (CONS (|dispatchFunction| |SUTS;exp;2$;64|) $))
          (QSETREFV $ 126 (CONS (|dispatchFunction| |SUTS;log;2$;65|) $))
          (QSETREFV $ 136 (CONS (|dispatchFunction| |SUTS;sin;2$;66|) $))
          (QSETREFV $ 138 (CONS (|dispatchFunction| |SUTS;cos;2$;67|) $))
          (QSETREFV $ 140 (CONS (|dispatchFunction| |SUTS;tan;2$;68|) $))
          (QSETREFV $ 142 (CONS (|dispatchFunction| |SUTS;cot;2$;69|) $))
          (QSETREFV $ 144 (CONS (|dispatchFunction| |SUTS;sec;2$;70|) $))
          (QSETREFV $ 146 (CONS (|dispatchFunction| |SUTS;csc;2$;71|) $))
          (QSETREFV $ 148 (CONS (|dispatchFunction| |SUTS;asin;2$;72|) $))
          (QSETREFV $ 152 (CONS (|dispatchFunction| |SUTS;atan;2$;73|) $))
          (QSETREFV $ 150 (CONS (|dispatchFunction| |SUTS;acos;2$;74|) $))
          (QSETREFV $ 154 (CONS (|dispatchFunction| |SUTS;acot;2$;75|) $))
          (QSETREFV $ 156 (CONS (|dispatchFunction| |SUTS;asec;2$;76|) $))
          (QSETREFV $ 158 (CONS (|dispatchFunction| |SUTS;acsc;2$;77|) $))
          (QSETREFV $ 160 (CONS (|dispatchFunction| |SUTS;sinh;2$;78|) $))
          (QSETREFV $ 162 (CONS (|dispatchFunction| |SUTS;cosh;2$;79|) $))
          (QSETREFV $ 164 (CONS (|dispatchFunction| |SUTS;tanh;2$;80|) $))
          (QSETREFV $ 166 (CONS (|dispatchFunction| |SUTS;coth;2$;81|) $))
          (QSETREFV $ 168 (CONS (|dispatchFunction| |SUTS;sech;2$;82|) $))
          (QSETREFV $ 170 (CONS (|dispatchFunction| |SUTS;csch;2$;83|) $))
          (QSETREFV $ 172 (CONS (|dispatchFunction| |SUTS;asinh;2$;84|) $))
          (QSETREFV $ 176 (CONS (|dispatchFunction| |SUTS;atanh;2$;85|) $))
          (QSETREFV $ 174 (CONS (|dispatchFunction| |SUTS;acosh;2$;86|) $))
          (QSETREFV $ 178 (CONS (|dispatchFunction| |SUTS;acoth;2$;87|) $))
          (QSETREFV $ 180 (CONS (|dispatchFunction| |SUTS;asech;2$;88|) $))
          (QSETREFV $ 182
                    (CONS (|dispatchFunction| |SUTS;acsch;2$;89|) $))))))))
    (COND
     ((|testBitVector| |pv$| 23)
      (COND
       ((|testBitVector| |pv$| 1)
        (QSETREFV $ 190 (CONS (|dispatchFunction| |SUTS;^;$Coef$;90|) $))))))
    $))) 

(MAKEPROP '|SparseUnivariateTaylorSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|InnerSparseUnivariatePowerSeries| 6)
              (|local| |#1|) (|local| |#2|) (|local| |#3|) '|Rep| (|Integer|)
              (0 . |monomial|) (|NonNegativeInteger|)
              |SUTS;monomial;CoefNni$;4| (6 . |extend|) |SUTS;extend;$Nni$;5|
              (12 . |Zero|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |SUTS;Zero;$;6|) $))
              (16 . |One|)
              (CONS IDENTITY (FUNCALL (|dispatchFunction| |SUTS;One;$;7|) $))
              (|Union| $ '"failed") (|Boolean|) (20 . |iExquo|)
              |SUTS;recip;$U;8| (27 . |exquo|) (33 . |taylorQuoByVar|)
              |SUTS;quoByVar;2$;10| (38 . |differentiate|)
              (|Variable| (NRTEVAL (QREFELT $ 7))) |SUTS;differentiate;$V$;11|
              (43 . |zero?|) (48 . +) |SUTS;coerce;V$;12|
              (|UnivariatePolynomial| (NRTEVAL (QREFELT $ 7)) 6) (54 . |zero?|)
              (59 . |monomial|) (65 . +) (71 . |elt|)
              (|Record| (|:| |k| 10) (|:| |c| 6)) (|Stream| 38) (77 . |empty|)
              (81 . |degree|) (86 . |leadingCoefficient|) (91 . |concat|)
              (97 . |reductum|) (|OrderedCompletion| 10) (102 . |plusInfinity|)
              (|Reference| 45) (106 . |ref|) (111 . |makeSeries|)
              |SUTS;coerce;Up$;13| (117 . |getStream|) (122 . |Zero|)
              |SUTS;center;$Coef;27| (126 . -) (132 . |One|)
              (136 . |explicitEntries?|) (141 . |frst|) (146 . >) (152 . ^)
              (158 . *) (164 . *) (170 . |rst|)
              |SUTS;univariatePolynomial;$NniUp;14| (|Polynomial| 6)
              (175 . |Zero|) (|Symbol|) (179 . |coerce|) (184 . |coerce|)
              (189 . -) (195 . |One|) (199 . ^) (205 . *) (211 . *) (217 . +)
              |SUTS;polynomial;$NniP;15| |SUTS;truncate;$2Nni$;18|
              |SUTS;polynomial;$2NniP;16| (223 . |truncate|)
              |SUTS;truncate;$Nni$;17| (229 . |truncate|)
              (236 . |explicitlyEmpty?|) (|Stream| 6) (241 . |empty|)
              (245 . |coerce|) (250 . |elt|) (255 . <) (261 . |lazyEvaluate|)
              (266 . =) (272 . |One|) (276 . +) (282 . |concat|) (|Mapping| $)
              (288 . |delay|) (293 . |getRef|) |SUTS;coefficients;$S;20|
              (298 . |terms|) (|Record| (|:| |k| 12) (|:| |c| 6)) (|Stream| 97)
              |SUTS;terms;$S;21| (303 . |empty?|) (308 . |setelt!|)
              (314 . |frst|) (319 . |rst|) (324 . |delay|) |SUTS;series;S$;23|
              (329 . |empty?|) (334 . |frst|) (339 . |rst|) (344 . |series|)
              |SUTS;series;S$;25| |SUTS;variable;$S;26| (349 . |coefficient|)
              |SUTS;coefficient;$NniCoef;28| |SUTS;elt;$NniCoef;29|
              |SUTS;pole?;$B;30| (355 . |order|) |SUTS;order;$Nni;31|
              (360 . |order|) |SUTS;order;$2Nni;32| (366 . |zero?|)
              (371 . |coerce|) (376 . |iCompose|) |SUTS;elt;3$;33|
              (382 . |integrate|) (387 . |integrate|) (393 . |log|) (398 . *)
              (404 . |exp|) (409 . ^) (|Fraction| 10) (415 . |cRationalPower|)
              (421 . ^) (427 . |cExp|) (432 . |cLog|) (437 . |cSin|)
              (442 . |sin|) (447 . |cCos|) (452 . |cos|) (457 . |cTan|)
              (462 . |tan|) (467 . |cCot|) (472 . |cot|) (477 . |cSec|)
              (482 . |sec|) (487 . |cCsc|) (492 . |csc|) (497 . |cAsin|)
              (502 . |asin|) (507 . |cAcos|) (512 . |acos|) (517 . |cAtan|)
              (522 . |atan|) (527 . |cAcot|) (532 . |acot|) (537 . |cAsec|)
              (542 . |asec|) (547 . |cAcsc|) (552 . |acsc|) (557 . |cSinh|)
              (562 . |sinh|) (567 . |cCosh|) (572 . |cosh|) (577 . |cTanh|)
              (582 . |tanh|) (587 . |cCoth|) (592 . |coth|) (597 . |cSech|)
              (602 . |sech|) (607 . |cCsch|) (612 . |csch|) (617 . |cAsinh|)
              (622 . |asinh|) (627 . |cAcosh|) (632 . |acosh|) (637 . |cAtanh|)
              (642 . |atanh|) (647 . |cAcoth|) (652 . |acoth|) (657 . |cAsech|)
              (662 . |asech|) (667 . |cAcsch|) (672 . |acsch|) 'ZERO 'ONE
              'NPOWERS (677 . =) (683 . |coerce|) (688 . |cPower|) (694 . -)
              (700 . ^) (706 . |One|) (|OutputForm|)
              (710 . |seriesToOutputForm|) |SUTS;coerce;$Of;91|
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|List| 66) (|List| 12) (|Mapping| 6 10) (|PositiveInteger|)
              (|List| 201) (|SingletonAsOrderedSet|) (|Mapping| 6 6) (|String|)
              (|SingleInteger|) (|HashState|))
           '#(~= 719 |zero?| 725 |variables| 730 |variable| 735
              |univariatePolynomial| 740 |unitNormal| 746 |unitCanonical| 751
              |unit?| 756 |truncate| 761 |terms| 774 |tanh| 779 |tan| 784
              |subtractIfCan| 789 |sqrt| 795 |sinh| 800 |sin| 805 |series| 810
              |sech| 820 |sec| 825 |sample| 830 |rightRecip| 834 |rightPower|
              839 |reductum| 851 |recip| 856 |quoByVar| 861 |polynomial| 866
              |pole?| 879 |pi| 884 |order| 888 |opposite?| 899 |one?| 905
              |nthRoot| 910 |multiplyExponents| 916 |multiplyCoefficients| 922
              |monomial?| 928 |monomial| 933 |map| 953 |log| 959 |leftRecip|
              964 |leftPower| 969 |leadingMonomial| 981 |leadingCoefficient|
              986 |latex| 991 |integrate| 996 |hashUpdate!| 1013 |hash| 1019
              |extend| 1024 |exquo| 1030 |exp| 1036 |eval| 1041 |elt| 1047
              |differentiate| 1059 |degree| 1102 |csch| 1107 |csc| 1112 |coth|
              1117 |cot| 1122 |cosh| 1127 |cos| 1132 |complete| 1137
              |commutator| 1142 |coerce| 1148 |coefficients| 1183 |coefficient|
              1188 |charthRoot| 1194 |characteristic| 1199 |center| 1203
              |atanh| 1208 |atan| 1213 |associator| 1218 |associates?| 1225
              |asinh| 1231 |asin| 1236 |asech| 1241 |asec| 1246 |approximate|
              1251 |antiCommutator| 1257 |annihilate?| 1263 |acsch| 1269 |acsc|
              1274 |acoth| 1279 |acot| 1284 |acosh| 1289 |acos| 1294 ^ 1299
              |Zero| 1329 |One| 1333 D 1337 = 1374 / 1380 - 1386 + 1397 * 1403)
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
                 (|UnivariatePowerSeriesCategory| 6 12)
                 (|PowerSeriesCategory| 6 12 201) (|AbelianMonoidRing| 6 12)
                 (|IntegralDomain|) (|CommutativeRing|) (|Algebra| 130)
                 (|Algebra| $$) (|EntireRing|) (|CharacteristicNonZero|)
                 (|CharacteristicZero|) (|Algebra| 6)
                 (|PartialDifferentialRing| 66) (|DifferentialRing|) (|Ring|)
                 (|SemiRing|) (|Rng|) (|SemiRng|) (|Module| 130) (|Module| $$)
                 (|Module| 6) (|BiModule| 6 6) (|BiModule| $$ $$)
                 (|BiModule| 130 130) (|NonAssociativeRing|) (|LeftModule| 6)
                 (|RightModule| 6) (|RightModule| $$) (|LeftModule| $$)
                 (|LeftModule| 130) (|RightModule| 130) (|NonAssociativeRng|)
                 (|AbelianGroup|) (|CancellationAbelianMonoid|)
                 (|NonAssociativeSemiRing|) (|Monoid|)
                 (|NonAssociativeSemiRng|) (|SemiGroup|) (|AbelianMonoid|)
                 (|MagmaWithUnit|) (|Magma|) (|AbelianSemiGroup|)
                 (|SetCategory|) (|TranscendentalFunctionCategory|)
                 (|VariablesCommuteWithCoefficients|) (|BasicType|)
                 (|CoercibleTo| 192) (|CommutativeStar|) (|noZeroDivisors|)
                 (|unitsKnown|) (|Eltable| $$ $$)
                 (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|RadicalCategory|))
              (|makeByteWordVec2| 205
                                  '(2 9 0 6 10 11 2 9 0 0 10 14 0 6 0 16 0 6 0
                                    18 3 9 20 0 0 21 22 2 0 20 0 0 24 1 9 0 0
                                    25 1 0 0 0 27 1 6 21 0 30 2 0 0 0 0 31 1 33
                                    21 0 34 2 33 0 6 12 35 2 33 0 0 0 36 2 33 0
                                    0 0 37 0 39 0 40 1 33 12 0 41 1 33 6 0 42 2
                                    39 0 38 0 43 1 33 0 0 44 0 45 0 46 1 47 0
                                    45 48 2 9 0 47 39 49 1 9 39 0 51 0 33 0 52
                                    2 33 0 0 0 54 0 33 0 55 1 39 21 0 56 1 39
                                    38 0 57 2 10 21 0 0 58 2 33 0 0 12 59 2 33
                                    0 0 0 60 2 33 0 6 0 61 1 39 0 0 62 0 64 0
                                    65 1 64 0 66 67 1 64 0 6 68 2 64 0 0 0 69 0
                                    64 0 70 2 64 0 0 12 71 2 64 0 0 0 72 2 64 0
                                    6 0 73 2 64 0 0 0 74 2 9 0 0 10 78 3 9 0 0
                                    10 10 80 1 39 21 0 81 0 82 0 83 1 45 0 10
                                    84 1 47 45 0 85 2 45 21 0 0 86 1 39 0 0 87
                                    2 10 21 0 0 88 0 10 0 89 2 10 0 0 0 90 2 82
                                    0 6 0 91 1 82 0 92 93 1 9 47 0 94 1 9 39 0
                                    96 1 82 21 0 100 2 47 45 0 45 101 1 82 6 0
                                    102 1 82 0 0 103 1 39 0 92 104 1 98 21 0
                                    106 1 98 97 0 107 1 98 0 0 108 1 9 0 39 109
                                    2 9 6 0 10 112 1 9 10 0 116 2 9 10 0 10 118
                                    1 0 21 0 120 1 0 0 6 121 2 9 0 0 0 122 1 0
                                    0 0 124 2 0 0 0 28 125 1 0 0 0 126 2 0 0 0
                                    0 127 1 0 0 0 128 2 0 0 0 0 129 2 9 0 0 130
                                    131 2 0 0 0 130 132 1 9 0 0 133 1 9 0 0 134
                                    1 9 0 0 135 1 0 0 0 136 1 9 0 0 137 1 0 0 0
                                    138 1 9 0 0 139 1 0 0 0 140 1 9 0 0 141 1 0
                                    0 0 142 1 9 0 0 143 1 0 0 0 144 1 9 0 0 145
                                    1 0 0 0 146 1 9 0 0 147 1 0 0 0 148 1 9 0 0
                                    149 1 0 0 0 150 1 9 0 0 151 1 0 0 0 152 1 9
                                    0 0 153 1 0 0 0 154 1 9 0 0 155 1 0 0 0 156
                                    1 9 0 0 157 1 0 0 0 158 1 9 0 0 159 1 0 0 0
                                    160 1 9 0 0 161 1 0 0 0 162 1 9 0 0 163 1 0
                                    0 0 164 1 9 0 0 165 1 0 0 0 166 1 9 0 0 167
                                    1 0 0 0 168 1 9 0 0 169 1 0 0 0 170 1 9 0 0
                                    171 1 0 0 0 172 1 9 0 0 173 1 0 0 0 174 1 9
                                    0 0 175 1 0 0 0 176 1 9 0 0 177 1 0 0 0 178
                                    1 9 0 0 179 1 0 0 0 180 1 9 0 0 181 1 0 0 0
                                    182 2 6 21 0 0 186 1 6 0 130 187 2 9 0 0 6
                                    188 2 0 0 0 0 189 2 0 0 0 6 190 0 130 0 191
                                    5 9 192 39 47 66 6 130 193 2 0 21 0 0 1 1
                                    30 21 0 120 1 0 200 0 1 1 0 66 0 111 2 0 33
                                    0 12 63 1 25 195 0 1 1 25 0 0 1 1 25 21 0 1
                                    2 0 0 0 12 79 3 0 0 0 12 12 76 1 0 98 0 99
                                    1 1 0 0 164 1 1 0 0 140 2 31 20 0 0 1 1 1 0
                                    0 1 1 1 0 0 160 1 1 0 0 136 1 0 0 82 105 1
                                    0 0 98 110 1 1 0 0 168 1 1 0 0 144 0 30 0 1
                                    1 28 20 0 1 2 28 0 0 12 1 2 0 0 0 199 1 1 0
                                    0 0 1 1 28 20 0 23 1 0 0 0 26 2 0 64 0 12
                                    75 3 0 64 0 12 12 77 1 0 21 0 115 0 1 0 1 1
                                    0 12 0 117 2 0 12 0 12 119 2 30 21 0 0 1 1
                                    28 21 0 1 2 1 0 0 10 1 2 0 0 0 199 1 2 0 0
                                    198 0 1 1 0 21 0 1 3 0 0 0 200 197 1 3 0 0
                                    0 201 12 1 2 0 0 6 12 13 2 0 0 202 0 1 1 1
                                    0 0 126 1 28 20 0 1 2 28 0 0 12 1 2 0 0 0
                                    199 1 1 0 0 0 1 1 0 6 0 1 1 0 203 0 1 2 24
                                    0 0 66 1 2 1 0 0 28 125 1 1 0 0 124 2 0 205
                                    205 0 1 1 0 204 0 1 2 0 0 0 12 15 2 25 20 0
                                    0 24 1 1 0 0 128 2 10 82 0 6 1 2 9 0 0 0
                                    123 2 0 6 0 12 114 2 8 0 0 66 1 3 8 0 0 66
                                    12 1 2 8 0 0 196 1 3 8 0 0 196 197 1 1 7 0
                                    0 27 2 7 0 0 12 1 2 0 0 0 28 29 1 0 12 0 1
                                    1 1 0 0 170 1 1 0 0 146 1 1 0 0 166 1 1 0 0
                                    142 1 1 0 0 162 1 1 0 0 138 1 0 0 0 1 2 29
                                    0 0 0 1 1 26 0 6 121 1 29 0 10 1 1 27 0 0 1
                                    1 1 0 130 1 1 0 0 28 32 1 0 0 33 50 1 0 192
                                    0 194 1 0 82 0 95 2 0 6 0 12 113 1 3 20 0 1
                                    0 29 12 1 1 0 6 0 53 1 1 0 0 176 1 1 0 0
                                    152 3 29 0 0 0 0 1 2 25 21 0 0 1 1 1 0 0
                                    172 1 1 0 0 148 1 1 0 0 180 1 1 0 0 156 2
                                    11 6 0 12 1 2 0 0 0 0 1 2 29 21 0 0 1 1 1 0
                                    0 182 1 1 0 0 158 1 1 0 0 178 1 1 0 0 154 1
                                    1 0 0 174 1 1 0 0 150 2 28 0 0 12 1 2 1 0 0
                                    130 132 2 1 0 0 0 129 2 23 0 0 6 190 2 0 0
                                    0 199 1 0 30 0 17 0 28 0 19 2 8 0 0 66 1 3
                                    8 0 0 66 12 1 2 8 0 0 196 1 3 8 0 0 196 197
                                    1 1 7 0 0 1 2 7 0 0 12 1 2 0 21 0 0 1 2 23
                                    0 0 6 1 2 32 0 0 0 189 1 32 0 0 1 2 0 0 0 0
                                    31 2 32 0 10 0 1 2 30 0 12 0 1 2 1 0 0 130
                                    1 2 1 0 130 0 1 2 0 0 0 6 1 2 0 0 6 0 1 2 0
                                    0 0 0 127 2 0 0 199 0 1)))))
           '|lookupComplete|)) 
