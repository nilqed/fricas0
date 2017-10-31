
(SDEFUN |SULS;variable;$S;1| ((|x| $) ($ |Symbol|)) (QREFELT $ 7)) 

(SDEFUN |SULS;center;$Coef;2| ((|x| $) ($ |Coef|)) (QREFELT $ 8)) 

(SDEFUN |SULS;coerce;V$;3| ((|v| |Variable| |var|) ($ $))
        (COND
         ((SPADCALL (QREFELT $ 8) (QREFELT $ 14))
          (SPADCALL (|spadConstant| $ 15) 1 (QREFELT $ 18)))
         ('T
          (SPADCALL (SPADCALL (|spadConstant| $ 15) 1 (QREFELT $ 18))
                    (SPADCALL (QREFELT $ 8) 0 (QREFELT $ 18)) (QREFELT $ 21))))) 

(SDEFUN |SULS;pole?;$B;4| ((|x| $) ($ |Boolean|))
        (MINUSP (SPADCALL |x| 0 (QREFELT $ 24)))) 

(PUT '|SULS;coerce;Suts$;5| '|SPADreplace| '(XLAM (|uts|) |uts|)) 

(SDEFUN |SULS;coerce;Suts$;5|
        ((|uts| |SparseUnivariateTaylorSeries| |Coef| |var| |cen|) ($ $)) |uts|) 

(SDEFUN |SULS;taylorIfCan;$U;6|
        ((|uls| $)
         ($ |Union| (|SparseUnivariateTaylorSeries| |Coef| |var| |cen|)
          "failed"))
        (COND ((SPADCALL |uls| (QREFELT $ 25)) (CONS 1 "failed"))
              ('T (CONS 0 |uls|)))) 

(SDEFUN |SULS;taylor;$Suts;7|
        ((|uls| $) ($ |SparseUnivariateTaylorSeries| |Coef| |var| |cen|))
        (SPROG
         ((|uts|
           (|Union| (|SparseUnivariateTaylorSeries| |Coef| |var| |cen|)
                    "failed")))
         (SEQ
          (LETT |uts| (SPADCALL |uls| (QREFELT $ 29)) |SULS;taylor;$Suts;7|)
          (EXIT
           (COND
            ((QEQCAR |uts| 1) (|error| "taylor: Laurent series has a pole"))
            ('T (QCDR |uts|))))))) 

(SDEFUN |SULS;retractIfCan;$U;8|
        ((|x| $)
         ($ |Union| (|SparseUnivariateTaylorSeries| |Coef| |var| |cen|)
          "failed"))
        (SPADCALL |x| (QREFELT $ 29))) 

(SDEFUN |SULS;laurent;ISuts$;9|
        ((|n| |Integer|)
         (|uts| |SparseUnivariateTaylorSeries| |Coef| |var| |cen|) ($ $))
        (SPADCALL (SPADCALL (|spadConstant| $ 15) |n| (QREFELT $ 18))
                  (SPADCALL |uts| (QREFELT $ 27)) (QREFELT $ 32))) 

(PUT '|SULS;removeZeroes;2$;10| '|SPADreplace| '(XLAM (|uls|) |uls|)) 

(SDEFUN |SULS;removeZeroes;2$;10| ((|uls| $) ($ $)) |uls|) 

(PUT '|SULS;removeZeroes;I2$;11| '|SPADreplace| '(XLAM (|n| |uls|) |uls|)) 

(SDEFUN |SULS;removeZeroes;I2$;11| ((|n| |Integer|) (|uls| $) ($ $)) |uls|) 

(SDEFUN |SULS;taylorRep;$Suts;12|
        ((|uls| $) ($ |SparseUnivariateTaylorSeries| |Coef| |var| |cen|))
        (SPADCALL
         (SPADCALL
          (SPADCALL (|spadConstant| $ 15) (- (SPADCALL |uls| 0 (QREFELT $ 24)))
                    (QREFELT $ 18))
          |uls| (QREFELT $ 32))
         (QREFELT $ 30))) 

(SDEFUN |SULS;degree;$I;13| ((|uls| $) ($ |Integer|))
        (SPADCALL |uls| 0 (QREFELT $ 24))) 

(SDEFUN |SULS;numer;$Suts;14|
        ((|uls| $) ($ |SparseUnivariateTaylorSeries| |Coef| |var| |cen|))
        (SPADCALL |uls| (QREFELT $ 36))) 

(SDEFUN |SULS;denom;$Suts;15|
        ((|uls| $) ($ |SparseUnivariateTaylorSeries| |Coef| |var| |cen|))
        (SPROG ((#1=#:G733 NIL))
               (SPADCALL (|spadConstant| $ 15)
                         (PROG1
                             (LETT #1# (- (SPADCALL |uls| 0 (QREFELT $ 24)))
                                   |SULS;denom;$Suts;15|)
                           (|check_subtype2| (>= #1# 0) '(|NonNegativeInteger|)
                                             '(|Integer|) #1#))
                         (QREFELT $ 40)))) 

(SDEFUN |SULS;*;Suts2$;16|
        ((|uts| |SparseUnivariateTaylorSeries| |Coef| |var| |cen|) (|uls| $)
         ($ $))
        (SPADCALL (SPADCALL |uts| (QREFELT $ 27)) |uls| (QREFELT $ 32))) 

(SDEFUN |SULS;*;$Suts$;17|
        ((|uls| $) (|uts| |SparseUnivariateTaylorSeries| |Coef| |var| |cen|)
         ($ $))
        (SPADCALL |uls| (SPADCALL |uts| (QREFELT $ 27)) (QREFELT $ 32))) 

(SDEFUN |SULS;/;2Suts$;18|
        ((|uts1| . #1=(|SparseUnivariateTaylorSeries| |Coef| |var| |cen|))
         (|uts2| . #1#) ($ $))
        (SPADCALL (SPADCALL |uts1| (QREFELT $ 27))
                  (SPADCALL |uts2| (QREFELT $ 27)) (QREFELT $ 44))) 

(SDEFUN |SULS;recip;$U;19| ((|uls| $) ($ |Union| $ "failed"))
        (SPADCALL (|spadConstant| $ 16) |uls| NIL (QREFELT $ 47))) 

(SDEFUN |SULS;exquo;2$U;20| ((|uls1| $) (|uls2| $) ($ |Union| $ "failed"))
        (SPADCALL |uls1| |uls2| NIL (QREFELT $ 47))) 

(SDEFUN |SULS;/;3$;21| ((|uls1| $) (|uls2| $) ($ $))
        (SPROG ((|q| (|Union| $ "failed")))
               (SEQ
                (LETT |q| (SPADCALL |uls1| |uls2| (QREFELT $ 49))
                      |SULS;/;3$;21|)
                (EXIT
                 (COND ((QEQCAR |q| 1) (|error| "quotient cannot be computed"))
                       ('T (QCDR |q|))))))) 

(SDEFUN |SULS;differentiate;$V$;22| ((|uls| $) (|v| |Variable| |var|) ($ $))
        (SPADCALL |uls| (QREFELT $ 50))) 

(SDEFUN |SULS;elt;3$;23| ((|uls1| $) (|uls2| $) ($ $))
        (SPROG
         ((#1=#:G763 NIL) (|uls3| ($)) (|recipr| (|Union| $ "failed"))
          (|ord| (|Integer|)))
         (SEQ
          (COND
           ((< (SPADCALL |uls2| 1 (QREFELT $ 24)) 1)
            (|error| "elt: second argument must have positive order"))
           ((MINUSP
             (LETT |ord| (SPADCALL |uls1| 0 (QREFELT $ 24))
                   . #2=(|SULS;elt;3$;23|)))
            (SEQ (LETT |recipr| (SPADCALL |uls2| (QREFELT $ 48)) . #2#)
                 (EXIT
                  (COND
                   ((QEQCAR |recipr| 1)
                    (|error| "elt: second argument not invertible"))
                   (#3='T
                    (SEQ
                     (LETT |uls3|
                           (SPADCALL |uls1|
                                     (SPADCALL (|spadConstant| $ 15) (- |ord|)
                                               (QREFELT $ 18))
                                     (QREFELT $ 32))
                           . #2#)
                     (EXIT
                      (SPADCALL (SPADCALL |uls3| |uls2| (QREFELT $ 52))
                                (SPADCALL (QCDR |recipr|)
                                          (PROG1 (LETT #1# (- |ord|) . #2#)
                                            (|check_subtype2| (>= #1# 0)
                                                              '(|NonNegativeInteger|)
                                                              '(|Integer|)
                                                              #1#))
                                          (QREFELT $ 53))
                                (QREFELT $ 32)))))))))
           (#3# (SPADCALL |uls1| |uls2| (QREFELT $ 52))))))) 

(SDEFUN |SULS;rationalFunction;$IF;24|
        ((|uls| $) (|n| |Integer|) ($ |Fraction| (|Polynomial| |Coef|)))
        (SPROG
         ((#1=#:G777 NIL) (|c| (|Fraction| (|Polynomial| |Coef|)))
          (|v| (|Fraction| (|Polynomial| |Coef|)))
          (|poly| (|Fraction| (|Polynomial| |Coef|))) (#2=#:G776 NIL)
          (|m| (|Integer|)) (#3=#:G773 NIL) (|e| (|Integer|)))
         (SEQ
          (COND
           ((ZEROP
             (LETT |e| (SPADCALL |uls| 0 (QREFELT $ 24))
                   . #4=(|SULS;rationalFunction;$IF;24|)))
            (COND ((MINUSP |n|) (|spadConstant| $ 56))
                  (#5='T
                   (SPADCALL
                    (SPADCALL (SPADCALL |uls| (QREFELT $ 30))
                              (PROG1 (LETT #3# |n| . #4#)
                                (|check_subtype2| (>= #3# 0)
                                                  '(|NonNegativeInteger|)
                                                  '(|Integer|) #3#))
                              (QREFELT $ 58))
                    (QREFELT $ 59)))))
           ((MINUSP (LETT |m| (- |n| |e|) . #4#)) (|spadConstant| $ 56))
           (#5#
            (SEQ
             (LETT |poly|
                   (SPADCALL
                    (SPADCALL
                     (SPADCALL
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 15) (- |e|) (QREFELT $ 18))
                       |uls| (QREFELT $ 32))
                      (QREFELT $ 30))
                     (PROG1 (LETT #2# |m| . #4#)
                       (|check_subtype2| (>= #2# 0) '(|NonNegativeInteger|)
                                         '(|Integer|) #2#))
                     (QREFELT $ 58))
                    (QREFELT $ 59))
                   . #4#)
             (LETT |v|
                   (SPADCALL (SPADCALL |uls| (QREFELT $ 11)) (QREFELT $ 60))
                   . #4#)
             (LETT |c|
                   (SPADCALL
                    (SPADCALL (SPADCALL |uls| (QREFELT $ 12)) (QREFELT $ 61))
                    (QREFELT $ 59))
                   . #4#)
             (EXIT
              (SPADCALL |poly|
                        (SPADCALL (SPADCALL |v| |c| (QREFELT $ 62))
                                  (PROG1 (LETT #1# (- |e|) . #4#)
                                    (|check_subtype2| (>= #1# 0)
                                                      '(|NonNegativeInteger|)
                                                      '(|Integer|) #1#))
                                  (QREFELT $ 63))
                        (QREFELT $ 64))))))))) 

(SDEFUN |SULS;rationalFunction;$2IF;25|
        ((|uls| $) (|n1| . #1=(|Integer|)) (|n2| . #1#)
         ($ |Fraction| (|Polynomial| |Coef|)))
        (SPADCALL (SPADCALL |uls| |n1| |n2| (QREFELT $ 66)) |n2|
                  (QREFELT $ 65))) 

(SDEFUN |SULS;integrate;2$;26| ((|uls| $) ($ $))
        (COND
         ((SPADCALL (SPADCALL |uls| -1 (QREFELT $ 68)) (QREFELT $ 14))
          (|error| "integrate: series has term of order -1"))
         ('T (SPADCALL |uls| (QREFELT $ 69))))) 

(SDEFUN |SULS;integrate;$V$;27| ((|uls| $) (|v| |Variable| |var|) ($ $))
        (SPADCALL |uls| (QREFELT $ 70))) 

(SDEFUN |SULS;^;3$;28| ((|uls1| $) (|uls2| $) ($ $))
        (SPADCALL
         (SPADCALL (SPADCALL |uls1| (QREFELT $ 72)) |uls2| (QREFELT $ 32))
         (QREFELT $ 73))) 

(SDEFUN |SULS;exp;2$;29| ((|uls| $) ($ $)) (SPADCALL |uls| (QREFELT $ 76))) 

(SDEFUN |SULS;log;2$;30| ((|uls| $) ($ $)) (SPADCALL |uls| (QREFELT $ 77))) 

(SDEFUN |SULS;sin;2$;31| ((|uls| $) ($ $)) (SPADCALL |uls| (QREFELT $ 78))) 

(SDEFUN |SULS;cos;2$;32| ((|uls| $) ($ $)) (SPADCALL |uls| (QREFELT $ 80))) 

(SDEFUN |SULS;tan;2$;33| ((|uls| $) ($ $)) (SPADCALL |uls| (QREFELT $ 82))) 

(SDEFUN |SULS;cot;2$;34| ((|uls| $) ($ $)) (SPADCALL |uls| (QREFELT $ 84))) 

(SDEFUN |SULS;sec;2$;35| ((|uls| $) ($ $)) (SPADCALL |uls| (QREFELT $ 86))) 

(SDEFUN |SULS;csc;2$;36| ((|uls| $) ($ $)) (SPADCALL |uls| (QREFELT $ 88))) 

(SDEFUN |SULS;asin;2$;37| ((|uls| $) ($ $)) (SPADCALL |uls| (QREFELT $ 90))) 

(SDEFUN |SULS;acos;2$;38| ((|uls| $) ($ $)) (SPADCALL |uls| (QREFELT $ 92))) 

(SDEFUN |SULS;atan;2$;39| ((|uls| $) ($ $)) (SPADCALL |uls| (QREFELT $ 94))) 

(SDEFUN |SULS;acot;2$;40| ((|uls| $) ($ $)) (SPADCALL |uls| (QREFELT $ 96))) 

(SDEFUN |SULS;asec;2$;41| ((|uls| $) ($ $)) (SPADCALL |uls| (QREFELT $ 98))) 

(SDEFUN |SULS;acsc;2$;42| ((|uls| $) ($ $)) (SPADCALL |uls| (QREFELT $ 100))) 

(SDEFUN |SULS;sinh;2$;43| ((|uls| $) ($ $)) (SPADCALL |uls| (QREFELT $ 102))) 

(SDEFUN |SULS;cosh;2$;44| ((|uls| $) ($ $)) (SPADCALL |uls| (QREFELT $ 104))) 

(SDEFUN |SULS;tanh;2$;45| ((|uls| $) ($ $)) (SPADCALL |uls| (QREFELT $ 106))) 

(SDEFUN |SULS;coth;2$;46| ((|uls| $) ($ $)) (SPADCALL |uls| (QREFELT $ 108))) 

(SDEFUN |SULS;sech;2$;47| ((|uls| $) ($ $)) (SPADCALL |uls| (QREFELT $ 110))) 

(SDEFUN |SULS;csch;2$;48| ((|uls| $) ($ $)) (SPADCALL |uls| (QREFELT $ 112))) 

(SDEFUN |SULS;asinh;2$;49| ((|uls| $) ($ $)) (SPADCALL |uls| (QREFELT $ 114))) 

(SDEFUN |SULS;acosh;2$;50| ((|uls| $) ($ $)) (SPADCALL |uls| (QREFELT $ 116))) 

(SDEFUN |SULS;atanh;2$;51| ((|uls| $) ($ $)) (SPADCALL |uls| (QREFELT $ 118))) 

(SDEFUN |SULS;acoth;2$;52| ((|uls| $) ($ $)) (SPADCALL |uls| (QREFELT $ 120))) 

(SDEFUN |SULS;asech;2$;53| ((|uls| $) ($ $)) (SPADCALL |uls| (QREFELT $ 122))) 

(SDEFUN |SULS;acsch;2$;54| ((|uls| $) ($ $)) (SPADCALL |uls| (QREFELT $ 124))) 

(SDEFUN |SULS;^;$F$;55| ((|uls| $) (|r| |Fraction| (|Integer|)) ($ $))
        (SPADCALL |uls| |r| (QREFELT $ 127))) 

(SDEFUN |SULS;^;$F$;56| ((|uls| $) (|r| |Fraction| (|Integer|)) ($ $))
        (SPROG
         ((|uts| (|SparseUnivariateTaylorSeries| |Coef| |var| |cen|))
          (|utsPow| ($)) (|n| (|Union| (|Integer|) "failed"))
          (|order| #1=(|Integer|)) (|ord0| #1#))
         (SEQ
          (COND
           ((MINUSP
             (LETT |ord0| (SPADCALL |uls| 0 (QREFELT $ 24))
                   . #2=(|SULS;^;$F$;56|)))
            (SEQ (LETT |order| |ord0| . #2#)
                 (LETT |n|
                       (SPADCALL |order| (SPADCALL |r| (QREFELT $ 129))
                                 (QREFELT $ 130))
                       . #2#)
                 (EXIT
                  (COND
                   ((QEQCAR |n| 1)
                    (|error| "^: rational power does not exist"))
                   (#3='T
                    (SEQ
                     (LETT |uts|
                           (SPADCALL
                            (SPADCALL |uls|
                                      (SPADCALL (|spadConstant| $ 15)
                                                (- |order|) (QREFELT $ 18))
                                      (QREFELT $ 32))
                            (QREFELT $ 131))
                           . #2#)
                     (LETT |utsPow|
                           (SPADCALL (SPADCALL |uts| |r| (QREFELT $ 132))
                                     (QREFELT $ 27))
                           . #2#)
                     (EXIT
                      (SPADCALL
                       (SPADCALL (|spadConstant| $ 15)
                                 (* (QCDR |n|) (SPADCALL |r| (QREFELT $ 133)))
                                 (QREFELT $ 18))
                       |utsPow| (QREFELT $ 32)))))))))
           (#3#
            (SEQ (LETT |uts| (SPADCALL |uls| (QREFELT $ 131)) . #2#)
                 (EXIT
                  (SPADCALL (SPADCALL |uts| |r| (QREFELT $ 132))
                            (QREFELT $ 27))))))))) 

(SDEFUN |SULS;coerce;$Of;57| ((|uls| $) ($ |OutputForm|))
        (SPROG
         ((|degr| (|Integer|)) (#1=#:G823 NIL) (|count| (|NonNegativeInteger|))
          (|nx| (|Union| (|Integer|) "failed"))
          (|st| (|Stream| (|Record| (|:| |k| (|Integer|)) (|:| |c| |Coef|)))))
         (SEQ
          (LETT |st| (SPADCALL |uls| (QREFELT $ 136))
                . #2=(|SULS;coerce;$Of;57|))
          (COND
           ((NULL (SPADCALL |st| (QREFELT $ 137)))
            (COND
             ((NULL (SPADCALL |st| (QREFELT $ 138)))
              (COND
               ((QEQCAR
                 (LETT |nx|
                       (SPADCALL
                        (SPADCALL (SPADCALL |uls| (QREFELT $ 140))
                                  (QREFELT $ 142))
                        (QREFELT $ 144))
                       . #2#)
                 0)
                (SEQ (LETT |count| |$streamCount| . #2#)
                     (LETT |degr|
                           (MIN |count|
                                (+
                                 (+
                                  (PROG2 (LETT #1# |nx| . #2#)
                                      (QCDR #1#)
                                    (|check_union2| (QEQCAR #1# 0) (|Integer|)
                                                    (|Union| (|Integer|)
                                                             "failed")
                                                    #1#))
                                  |count|)
                                 1))
                           . #2#)
                     (EXIT (SPADCALL |uls| |degr| (QREFELT $ 145))))))))))
          (EXIT
           (SPADCALL |st| (SPADCALL |uls| (QREFELT $ 140))
                     (SPADCALL |uls| (QREFELT $ 11))
                     (SPADCALL |uls| (QREFELT $ 12)) (|spadConstant| $ 146)
                     (QREFELT $ 148)))))) 

(DECLAIM (NOTINLINE |SparseUnivariateLaurentSeries;|)) 

(DEFUN |SparseUnivariateLaurentSeries| (&REST #1=#:G892)
  (SPROG NIL
         (PROG (#2=#:G893)
           (RETURN
            (COND
             ((LETT #2#
                    (|lassocShiftWithFunction| (|devaluateList| #1#)
                                               (HGET |$ConstructorCache|
                                                     '|SparseUnivariateLaurentSeries|)
                                               '|domainEqualList|)
                    . #3=(|SparseUnivariateLaurentSeries|))
              (|CDRwithIncrement| #2#))
             ('T
              (UNWIND-PROTECT
                  (PROG1
                      (APPLY (|function| |SparseUnivariateLaurentSeries;|) #1#)
                    (LETT #2# T . #3#))
                (COND
                 ((NOT #2#)
                  (HREM |$ConstructorCache|
                        '|SparseUnivariateLaurentSeries|)))))))))) 

(DEFUN |SparseUnivariateLaurentSeries;| (|#1| |#2| |#3|)
  (SPROG
   ((#1=#:G891 NIL) (|pv$| NIL) (#2=#:G881 NIL) (#3=#:G882 NIL) (#4=#:G884 NIL)
    (#5=#:G885 NIL) (#6=#:G886 NIL) (#7=#:G887 NIL) (#8=#:G889 NIL)
    (#9=#:G890 NIL) ($ NIL) (|dv$| NIL) (DV$3 NIL) (DV$2 NIL) (DV$1 NIL))
   (PROGN
    (LETT DV$1 (|devaluate| |#1|) . #10=(|SparseUnivariateLaurentSeries|))
    (LETT DV$2 (|devaluate| |#2|) . #10#)
    (LETT DV$3 (|devaluate| |#3|) . #10#)
    (LETT |dv$| (LIST '|SparseUnivariateLaurentSeries| DV$1 DV$2 DV$3) . #10#)
    (LETT $ (GETREFV 196) . #10#)
    (QSETREFV $ 0 |dv$|)
    (QSETREFV $ 3
              (LETT |pv$|
                    (|buildPredVector| 0 0
                                       (LIST
                                        (|HasCategory| (|Integer|)
                                                       '(|SemiGroup|))
                                        (|HasCategory| |#1| '(|Field|))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|RetractableTo| (|Symbol|))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|ConvertibleTo|
                                                (|InputForm|))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|RealConstant|)))
                                        (LETT #9#
                                              (AND
                                               (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory|
                                                (|SparseUnivariateTaylorSeries|
                                                 |#1| |#2| |#3|)
                                                '(|OrderedIntegralDomain|)))
                                              . #10#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicZero|))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|SparseUnivariateTaylorSeries|
                                                |#1| |#2| |#3|)
                                               '(|CharacteristicZero|)))
                                         #9#)
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|RetractableTo| (|Integer|))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|StepThrough|)))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              (LIST '|InnerEvalable|
                                                    '(|Symbol|)
                                                    (LIST
                                                     '|SparseUnivariateTaylorSeries|
                                                     (|devaluate| |#1|)
                                                     (|devaluate| |#2|)
                                                     (|devaluate| |#3|)))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              (LIST '|Evalable|
                                                    (LIST
                                                     '|SparseUnivariateTaylorSeries|
                                                     (|devaluate| |#1|)
                                                     (|devaluate| |#2|)
                                                     (|devaluate| |#3|)))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              (LIST '|Eltable|
                                                    (LIST
                                                     '|SparseUnivariateTaylorSeries|
                                                     (|devaluate| |#1|)
                                                     (|devaluate| |#2|)
                                                     (|devaluate| |#3|))
                                                    (LIST
                                                     '|SparseUnivariateTaylorSeries|
                                                     (|devaluate| |#1|)
                                                     (|devaluate| |#2|)
                                                     (|devaluate| |#3|)))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|LinearlyExplicitOver|
                                                (|Integer|))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|ConvertibleTo|
                                                (|Pattern| (|Float|)))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|ConvertibleTo|
                                                (|Pattern| (|Integer|)))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|PatternMatchable| (|Float|))))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|PatternMatchable|
                                                (|Integer|))))
                                        (LETT #8#
                                              (|HasCategory| |#1|
                                                             '(|CommutativeRing|))
                                              . #10#)
                                        (OR #8#
                                            (|HasCategory| |#1| '(|Field|)))
                                        (|HasSignature| |#1|
                                                        (LIST '^
                                                              (LIST
                                                               (|devaluate|
                                                                |#1|)
                                                               (|devaluate|
                                                                |#1|)
                                                               '(|Integer|))))
                                        (AND
                                         (|HasSignature| |#1|
                                                         (LIST '^
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Integer|))))
                                         (|HasSignature| |#1|
                                                         (LIST '|coerce|
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Symbol|)))))
                                        (LETT #7#
                                              (|HasCategory| |#1|
                                                             '(|IntegralDomain|))
                                              . #10#)
                                        (OR #8# (|HasCategory| |#1| '(|Field|))
                                            #7#)
                                        (OR (|HasCategory| |#1| '(|Field|))
                                            #7#)
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|Comparable|)))
                                        (LETT #6#
                                              (AND
                                               (|HasCategory| |#1| '(|Field|))
                                               (|HasCategory|
                                                (|SparseUnivariateTaylorSeries|
                                                 |#1| |#2| |#3|)
                                                '(|OrderedSet|)))
                                              . #10#)
                                        (OR #9# #6#)
                                        (OR
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|SparseUnivariateTaylorSeries|
                                                |#1| |#2| |#3|)
                                               '(|Comparable|)))
                                         #9# #6#)
                                        (|HasCategory| |#1|
                                                       '(|CharacteristicNonZero|))
                                        (LETT #5#
                                              (|HasCategory|
                                               (|SparseUnivariateTaylorSeries|
                                                |#1| |#2| |#3|)
                                               '(|PolynomialFactorizationExplicit|))
                                              . #10#)
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             #5#)
                                        (LETT #4#
                                              (|HasCategory|
                                               (|SparseUnivariateTaylorSeries|
                                                |#1| |#2| |#3|)
                                               '(|CharacteristicNonZero|))
                                              . #10#)
                                        (OR
                                         (|HasCategory| |#1|
                                                        '(|CharacteristicNonZero|))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              #4#))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|IntegerNumberSystem|)))
                                        (AND (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|EuclideanDomain|)))
                                        (|HasCategory| |#1| '(|SemiRing|))
                                        (|HasSignature| |#1|
                                                        (LIST '*
                                                              (LIST
                                                               (|devaluate|
                                                                |#1|)
                                                               '(|Integer|)
                                                               (|devaluate|
                                                                |#1|))))
                                        (OR (|HasCategory| |#1| '(|SemiRing|))
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Integer|)
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR
                                         (AND
                                          (|HasCategory| |#1|
                                                         '(|PartialDifferentialRing|
                                                           (|Symbol|)))
                                          (|HasSignature| |#1|
                                                          (LIST '*
                                                                (LIST
                                                                 (|devaluate|
                                                                  |#1|)
                                                                 '(|Integer|)
                                                                 (|devaluate|
                                                                  |#1|)))))
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|SparseUnivariateTaylorSeries|
                                                |#1| |#2| |#3|)
                                               '(|PartialDifferentialRing|
                                                 (|Symbol|)))))
                                        (OR
                                         (AND (|HasCategory| |#1| '(|Field|))
                                              (|HasCategory|
                                               (|SparseUnivariateTaylorSeries|
                                                |#1| |#2| |#3|)
                                               '(|DifferentialRing|)))
                                         (|HasSignature| |#1|
                                                         (LIST '*
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Integer|)
                                                                (|devaluate|
                                                                 |#1|)))))
                                        (LETT #3#
                                              (|HasCategory| |#1| '(|Ring|))
                                              . #10#)
                                        (OR #8# (|HasCategory| |#1| '(|Field|))
                                            #7# #3#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Integer|)
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR #3#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Integer|)
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (|HasCategory| |#1| '(|AbelianGroup|))
                                        (|HasCategory| |#1|
                                                       '(|CancellationAbelianMonoid|))
                                        (|HasCategory| |#1| '(|AbelianMonoid|))
                                        (LETT #2#
                                              (|HasCategory| |#1|
                                                             '(|Algebra|
                                                               (|Fraction|
                                                                (|Integer|))))
                                              . #10#)
                                        (OR #2#
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|ConvertibleTo|
                                                (|Pattern| (|Float|)))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|ConvertibleTo|
                                                (|Pattern| (|Integer|)))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|ConvertibleTo|
                                                (|InputForm|))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              (LIST '|Eltable|
                                                    (LIST
                                                     '|SparseUnivariateTaylorSeries|
                                                     (|devaluate| |#1|)
                                                     (|devaluate| |#2|)
                                                     (|devaluate| |#3|))
                                                    (LIST
                                                     '|SparseUnivariateTaylorSeries|
                                                     (|devaluate| |#1|)
                                                     (|devaluate| |#2|)
                                                     (|devaluate| |#3|)))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              (LIST '|Evalable|
                                                    (LIST
                                                     '|SparseUnivariateTaylorSeries|
                                                     (|devaluate| |#1|)
                                                     (|devaluate| |#2|)
                                                     (|devaluate| |#3|)))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              (LIST '|InnerEvalable|
                                                    '(|Symbol|)
                                                    (LIST
                                                     '|SparseUnivariateTaylorSeries|
                                                     (|devaluate| |#1|)
                                                     (|devaluate| |#2|)
                                                     (|devaluate| |#3|)))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|LinearlyExplicitOver|
                                                (|Integer|))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|PatternMatchable| (|Float|))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|PatternMatchable|
                                                (|Integer|))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|RetractableTo| (|Integer|))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|RetractableTo| (|Symbol|))))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|Comparable|)))
                                            #9# #6#
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             #5#)
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|RealConstant|)))
                                            (AND
                                             (|HasCategory| |#1| '(|Field|))
                                             (|HasCategory|
                                              (|SparseUnivariateTaylorSeries|
                                               |#1| |#2| |#3|)
                                              '(|StepThrough|))))
                                        (OR #2#
                                            (|HasCategory| |#1|
                                                           '(|AbelianGroup|))
                                            (|HasCategory| |#1|
                                                           '(|AbelianMonoid|))
                                            (|HasCategory| |#1|
                                                           '(|CancellationAbelianMonoid|))
                                            (|HasCategory| |#1|
                                                           '(|CharacteristicNonZero|))
                                            (|HasCategory| |#1|
                                                           '(|CharacteristicZero|))
                                            #8# (|HasCategory| |#1| '(|Field|))
                                            #7# #3#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Integer|)
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR #2#
                                            (|HasCategory| |#1|
                                                           '(|AbelianGroup|))
                                            (|HasCategory| |#1|
                                                           '(|CancellationAbelianMonoid|))
                                            (|HasCategory| |#1|
                                                           '(|CharacteristicNonZero|))
                                            (|HasCategory| |#1|
                                                           '(|CharacteristicZero|))
                                            #8# (|HasCategory| |#1| '(|Field|))
                                            #7# #3#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Integer|)
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR #2#
                                            (|HasCategory| |#1|
                                                           '(|AbelianGroup|))
                                            (|HasCategory| |#1|
                                                           '(|CharacteristicNonZero|))
                                            (|HasCategory| |#1|
                                                           '(|CharacteristicZero|))
                                            #8# (|HasCategory| |#1| '(|Field|))
                                            #7# #3#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Integer|)
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR #2#
                                            (|HasCategory| |#1|
                                                           '(|CharacteristicNonZero|))
                                            (|HasCategory| |#1|
                                                           '(|CharacteristicZero|))
                                            #8# (|HasCategory| |#1| '(|Field|))
                                            #7# #3#
                                            (|HasSignature| |#1|
                                                            (LIST '*
                                                                  (LIST
                                                                   (|devaluate|
                                                                    |#1|)
                                                                   '(|Integer|)
                                                                   (|devaluate|
                                                                    |#1|)))))
                                        (OR
                                         (AND #2#
                                              (|HasCategory| |#1|
                                                             '(|AlgebraicallyClosedFunctionSpace|
                                                               (|Integer|)))
                                              (|HasCategory| |#1|
                                                             '(|PrimitiveFunctionCategory|))
                                              (|HasCategory| |#1|
                                                             '(|TranscendentalFunctionCategory|)))
                                         (AND #2#
                                              (|HasSignature| |#1|
                                                              (LIST
                                                               '|integrate|
                                                               (LIST
                                                                (|devaluate|
                                                                 |#1|)
                                                                (|devaluate|
                                                                 |#1|)
                                                                '(|Symbol|))))
                                              (|HasSignature| |#1|
                                                              (LIST
                                                               '|variables|
                                                               (LIST
                                                                '(|List|
                                                                  (|Symbol|))
                                                                (|devaluate|
                                                                 |#1|))))))))
                    . #10#))
    (|haddProp| |$ConstructorCache| '|SparseUnivariateLaurentSeries|
                (LIST DV$1 DV$2 DV$3) (CONS 1 $))
    (|stuffDomainSlots| $)
    (QSETREFV $ 6 |#1|)
    (QSETREFV $ 7 |#2|)
    (QSETREFV $ 8 |#3|)
    (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))
         (|augmentPredVector| $ 9007199254740992))
    (AND
     (LETT #1#
           (AND (|HasCategory| |#1| '(|Field|))
                (|HasCategory| $ '(|CharacteristicNonZero|))
                (|HasCategory| (|SparseUnivariateTaylorSeries| |#1| |#2| |#3|)
                               '(|PolynomialFactorizationExplicit|)))
           . #10#)
     (|augmentPredVector| $ 18014398509481984))
    (AND
     (OR (|HasCategory| |#1| '(|CharacteristicNonZero|)) #1#
         (AND (|HasCategory| |#1| '(|Field|)) #4#))
     (|augmentPredVector| $ 36028797018963968))
    (AND
     (OR (|HasCategory| |#1| '(|Field|))
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))))
     (|augmentPredVector| $ 72057594037927936))
    (AND
     (OR (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasCategory| |#1| '(|SemiRing|))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 144115188075855872))
    (AND
     (OR (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|))) #3#
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 288230376151711744))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianGroup|))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 576460752303423488))
    (AND
     (OR (|HasCategory| |#1| '(|CancellationAbelianMonoid|))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 1152921504606846976))
    (AND
     (OR (|HasCategory| |#1| '(|AbelianMonoid|))
         (AND #8# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (AND #7# (|HasCategory| $ '(|VariablesCommuteWithCoefficients|)))
         (|HasSignature| |#1|
                         (LIST '*
                               (LIST (|devaluate| |#1|) '(|Integer|)
                                     (|devaluate| |#1|)))))
     (|augmentPredVector| $ 2305843009213693952))
    (SETF |pv$| (QREFELT $ 3))
    (QSETREFV $ 9 (|InnerSparseUnivariatePowerSeries| |#1|))
    (COND
     ((|testBitVector| |pv$| 2)
      (QSETREFV $ 45 (CONS (|dispatchFunction| |SULS;/;2Suts$;18|) $))))
    (COND
     ((|testBitVector| |pv$| 22)
      (QSETREFV $ 49 (CONS (|dispatchFunction| |SULS;exquo;2$U;20|) $))))
    (COND
     ((|testBitVector| |pv$| 2)
      (QSETREFV $ 44 (CONS (|dispatchFunction| |SULS;/;3$;21|) $))))
    (COND
     ((|testBitVector| |pv$| 22)
      (PROGN
       (QSETREFV $ 65
                 (CONS (|dispatchFunction| |SULS;rationalFunction;$IF;24|) $))
       (QSETREFV $ 67
                 (CONS (|dispatchFunction| |SULS;rationalFunction;$2IF;25|)
                       $)))))
    (COND
     ((|testBitVector| |pv$| 47)
      (PROGN
       (QSETREFV $ 70 (CONS (|dispatchFunction| |SULS;integrate;2$;26|) $))
       (QSETREFV $ 71 (CONS (|dispatchFunction| |SULS;integrate;$V$;27|) $))
       (QSETREFV $ 74 (CONS (|dispatchFunction| |SULS;^;3$;28|) $))
       (QSETREFV $ 73 (CONS (|dispatchFunction| |SULS;exp;2$;29|) $))
       (QSETREFV $ 72 (CONS (|dispatchFunction| |SULS;log;2$;30|) $))
       (QSETREFV $ 79 (CONS (|dispatchFunction| |SULS;sin;2$;31|) $))
       (QSETREFV $ 81 (CONS (|dispatchFunction| |SULS;cos;2$;32|) $))
       (QSETREFV $ 83 (CONS (|dispatchFunction| |SULS;tan;2$;33|) $))
       (QSETREFV $ 85 (CONS (|dispatchFunction| |SULS;cot;2$;34|) $))
       (QSETREFV $ 87 (CONS (|dispatchFunction| |SULS;sec;2$;35|) $))
       (QSETREFV $ 89 (CONS (|dispatchFunction| |SULS;csc;2$;36|) $))
       (QSETREFV $ 91 (CONS (|dispatchFunction| |SULS;asin;2$;37|) $))
       (QSETREFV $ 93 (CONS (|dispatchFunction| |SULS;acos;2$;38|) $))
       (QSETREFV $ 95 (CONS (|dispatchFunction| |SULS;atan;2$;39|) $))
       (QSETREFV $ 97 (CONS (|dispatchFunction| |SULS;acot;2$;40|) $))
       (QSETREFV $ 99 (CONS (|dispatchFunction| |SULS;asec;2$;41|) $))
       (QSETREFV $ 101 (CONS (|dispatchFunction| |SULS;acsc;2$;42|) $))
       (QSETREFV $ 103 (CONS (|dispatchFunction| |SULS;sinh;2$;43|) $))
       (QSETREFV $ 105 (CONS (|dispatchFunction| |SULS;cosh;2$;44|) $))
       (QSETREFV $ 107 (CONS (|dispatchFunction| |SULS;tanh;2$;45|) $))
       (QSETREFV $ 109 (CONS (|dispatchFunction| |SULS;coth;2$;46|) $))
       (QSETREFV $ 111 (CONS (|dispatchFunction| |SULS;sech;2$;47|) $))
       (QSETREFV $ 113 (CONS (|dispatchFunction| |SULS;csch;2$;48|) $))
       (QSETREFV $ 115 (CONS (|dispatchFunction| |SULS;asinh;2$;49|) $))
       (QSETREFV $ 117 (CONS (|dispatchFunction| |SULS;acosh;2$;50|) $))
       (QSETREFV $ 119 (CONS (|dispatchFunction| |SULS;atanh;2$;51|) $))
       (QSETREFV $ 121 (CONS (|dispatchFunction| |SULS;acoth;2$;52|) $))
       (QSETREFV $ 123 (CONS (|dispatchFunction| |SULS;asech;2$;53|) $))
       (QSETREFV $ 125 (CONS (|dispatchFunction| |SULS;acsch;2$;54|) $))
       (COND
        ((|testBitVector| |pv$| 18)
         (QSETREFV $ 128 (CONS (|dispatchFunction| |SULS;^;$F$;55|) $)))
        ('T (QSETREFV $ 128 (CONS (|dispatchFunction| |SULS;^;$F$;56|) $)))))))
    $))) 

(MAKEPROP '|SparseUnivariateLaurentSeries| '|infovec|
          (LIST
           '#(NIL NIL NIL NIL NIL (|InnerSparseUnivariatePowerSeries| 6)
              (|local| |#1|) (|local| |#2|) (|local| |#3|) '|Rep| (|Symbol|)
              |SULS;variable;$S;1| |SULS;center;$Coef;2| (|Boolean|)
              (0 . |zero?|) (5 . |One|) (9 . |One|) (|Integer|)
              (13 . |monomial|) (19 . |Zero|) (23 . |Zero|) (27 . +)
              (|Variable| 7) |SULS;coerce;V$;3| (33 . |order|)
              |SULS;pole?;$B;4| (|SparseUnivariateTaylorSeries| 6 7 8)
              |SULS;coerce;Suts$;5| (|Union| 26 '"failed")
              |SULS;taylorIfCan;$U;6| |SULS;taylor;$Suts;7|
              |SULS;retractIfCan;$U;8| (39 . *) |SULS;laurent;ISuts$;9|
              |SULS;removeZeroes;2$;10| |SULS;removeZeroes;I2$;11|
              |SULS;taylorRep;$Suts;12| |SULS;degree;$I;13|
              |SULS;numer;$Suts;14| (|NonNegativeInteger|) (45 . |monomial|)
              |SULS;denom;$Suts;15| |SULS;*;Suts2$;16| |SULS;*;$Suts$;17|
              (51 . /) (57 . /) (|Union| $ '"failed") (63 . |iExquo|)
              |SULS;recip;$U;19| (70 . |exquo|) (76 . |differentiate|)
              |SULS;differentiate;$V$;22| (81 . |iCompose|) (87 . ^)
              |SULS;elt;3$;23| (|Fraction| 57) (93 . |Zero|) (|Polynomial| 6)
              (97 . |polynomial|) (103 . |coerce|) (108 . |coerce|)
              (113 . |coerce|) (118 . -) (124 . ^) (130 . /)
              (136 . |rationalFunction|) (142 . |truncate|)
              (149 . |rationalFunction|) (156 . |coefficient|)
              (162 . |integrate|) (167 . |integrate|) (172 . |integrate|)
              (178 . |log|) (183 . |exp|) (188 . ^)
              (|ElementaryFunctionsUnivariateLaurentSeries| 6 26 $$)
              (194 . |exp|) (199 . |log|) (204 . |sin|) (209 . |sin|)
              (214 . |cos|) (219 . |cos|) (224 . |tan|) (229 . |tan|)
              (234 . |cot|) (239 . |cot|) (244 . |sec|) (249 . |sec|)
              (254 . |csc|) (259 . |csc|) (264 . |asin|) (269 . |asin|)
              (274 . |acos|) (279 . |acos|) (284 . |atan|) (289 . |atan|)
              (294 . |acot|) (299 . |acot|) (304 . |asec|) (309 . |asec|)
              (314 . |acsc|) (319 . |acsc|) (324 . |sinh|) (329 . |sinh|)
              (334 . |cosh|) (339 . |cosh|) (344 . |tanh|) (349 . |tanh|)
              (354 . |coth|) (359 . |coth|) (364 . |sech|) (369 . |sech|)
              (374 . |csch|) (379 . |csch|) (384 . |asinh|) (389 . |asinh|)
              (394 . |acosh|) (399 . |acosh|) (404 . |atanh|) (409 . |atanh|)
              (414 . |acoth|) (419 . |acoth|) (424 . |asech|) (429 . |asech|)
              (434 . |acsch|) (439 . |acsch|) (|Fraction| 17)
              (444 . |cRationalPower|) (450 . ^) (456 . |denom|)
              (461 . |exquo|) (467 . |retract|) (472 . ^) (478 . |numer|)
              (|Record| (|:| |k| 17) (|:| |c| 6)) (|Stream| 134)
              (483 . |getStream|) (488 . |explicitlyEmpty?|)
              (493 . |explicitEntries?|) (|Reference| 141) (498 . |getRef|)
              (|OrderedCompletion| 17) (503 . |elt|) (|Union| 17 '"failed")
              (508 . |retractIfCan|) (513 . |extend|) (519 . |One|)
              (|OutputForm|) (523 . |seriesToOutputForm|) |SULS;coerce;$Of;57|
              (|Union| 161 '#1="failed") (|Matrix| $) (|InputForm|)
              (|Pattern| 168) (|Pattern| 17) (|List| 26) (|List| 157)
              (|Equation| 26) (|List| 10) (|Matrix| 17)
              (|Record| (|:| |mat| 159) (|:| |vec| (|Vector| 17))) (|Vector| $)
              (|PatternMatchResult| 168 $) (|PatternMatchResult| 17 $)
              (|Factored| 165) (|SparseUnivariatePolynomial| $)
              (|Union| 167 '#1#) (|List| 165) (|Float|) (|DoubleFloat|)
              (|Union| 126 '#2="failed") (|Union| 10 '#2#)
              (|Record| (|:| |unit| $) (|:| |canonical| $) (|:| |associate| $))
              (|List| 39) (|Mapping| 26 26) (|Matrix| 26)
              (|Record| (|:| |mat| 175) (|:| |vec| (|Vector| 26)))
              (|Record| (|:| |llcm_res| $) (|:| |coeff1| $) (|:| |coeff2| $))
              (|List| $) (|Record| (|:| |coef| 178) (|:| |generator| $))
              (|Union| 178 '"failed")
              (|Record| (|:| |quotient| $) (|:| |remainder| $))
              (|Record| (|:| |coef1| $) (|:| |coef2| $))
              (|Union| 182 '"failed")
              (|Record| (|:| |coef1| $) (|:| |coef2| $) (|:| |generator| $))
              (|Factored| $) (|Stream| 6) (|Mapping| 6 17) (|PositiveInteger|)
              (|List| 191) (|List| 17) (|SingletonAsOrderedSet|)
              (|Mapping| 6 6) (|HashState|) (|String|) (|SingleInteger|))
           '#(~= 532 |zero?| 538 |wholePart| 543 |variables| 548 |variable| 553
              |unitNormal| 558 |unitCanonical| 563 |unit?| 568 |truncate| 573
              |terms| 586 |taylorRep| 591 |taylorIfCan| 596 |taylor| 601 |tanh|
              606 |tan| 611 |subtractIfCan| 616 |squareFreePolynomial| 622
              |squareFreePart| 627 |squareFree| 632 |sqrt| 637
              |solveLinearPolynomialEquation| 642 |smaller?| 648 |sizeLess?|
              654 |sinh| 660 |sin| 665 |sign| 670 |series| 675 |sech| 680 |sec|
              685 |sample| 690 |retractIfCan| 694 |retract| 714 |removeZeroes|
              734 |rem| 745 |reductum| 751 |reducedSystem| 756 |recip| 778
              |rationalFunction| 783 |quo| 796 |principalIdeal| 802 |prime?|
              807 |positive?| 812 |pole?| 817 |pi| 822 |patternMatch| 826
              |order| 840 |opposite?| 851 |one?| 857 |numerator| 862 |numer|
              867 |nthRoot| 872 |nextItem| 878 |negative?| 883
              |multiplyExponents| 888 |multiplyCoefficients| 894
              |multiEuclidean| 900 |monomial?| 906 |monomial| 911 |min| 931
              |max| 937 |map| 943 |log| 955 |leadingMonomial| 960
              |leadingCoefficient| 965 |lcmCoef| 970 |lcm| 976 |laurent| 987
              |latex| 999 |inv| 1004 |integrate| 1009 |init| 1026 |hashUpdate!|
              1030 |hash| 1036 |gcdPolynomial| 1041 |gcd| 1047 |fractionPart|
              1058 |floor| 1063 |factorSquareFreePolynomial| 1068
              |factorPolynomial| 1073 |factor| 1078 |extendedEuclidean| 1083
              |extend| 1096 |exquo| 1102 |expressIdealMember| 1108 |exp| 1114
              |eval| 1119 |euclideanSize| 1165 |elt| 1170 |divide| 1188
              |differentiate| 1194 |denominator| 1250 |denom| 1255 |degree|
              1260 |csch| 1265 |csc| 1270 |coth| 1275 |cot| 1280 |cosh| 1285
              |cos| 1290 |convert| 1295 |conditionP| 1320 |complete| 1325
              |coerce| 1330 |coefficient| 1370 |charthRoot| 1376
              |characteristic| 1381 |center| 1385 |ceiling| 1390 |atanh| 1395
              |atan| 1400 |associates?| 1405 |asinh| 1411 |asin| 1416 |asech|
              1421 |asec| 1426 |approximate| 1431 |annihilate?| 1437 |acsch|
              1443 |acsc| 1448 |acoth| 1453 |acot| 1458 |acosh| 1463 |acos|
              1468 |abs| 1473 ^ 1478 |Zero| 1508 |One| 1512 D 1516 >= 1566 >
              1572 = 1578 <= 1584 < 1590 / 1596 - 1614 + 1625 * 1631)
           'NIL
           (CONS
            (|makeByteWordVec2| 52
                                '(0 0 2 2 0 2 31 0 2 2 0 2 6 2 24 19 24 2 48 6
                                  2 2 2 19 24 24 48 33 7 23 2 39 40 2 13 0 23
                                  48 6 2 52 0 0 23 42 48 48 6 2 2 52 6 51 38 6
                                  50 0 38 27 49 2 0 0 28 9 2 16 17 0 48 5 11 2
                                  0 0 0 0 1 23 24 2 2 48 48 48 48 48 48 43 3 4
                                  5 5 27 8 8 10 11 12 14 15 2))
            (CONS
             '#(|UnivariateLaurentSeriesConstructorCategory&|
                |UnivariateLaurentSeriesCategory&| |QuotientFieldCategory&|
                |Field&| |UnivariatePowerSeriesCategory&| |EuclideanDomain&|
                |PolynomialFactorizationExplicit&| |PowerSeriesCategory&| NIL
                |UniqueFactorizationDomain&| |AbelianMonoidRing&| |GcdDomain&|
                NIL |DivisionRing&| NIL |Algebra&| |Algebra&| NIL |Algebra&|
                |OrderedRing&| |Algebra&| |DifferentialExtension&|
                |FullyLinearlyExplicitOver&| |Module&| |Module&| |EntireRing&|
                |Module&| NIL NIL NIL |Module&| |PartialDifferentialRing&|
                |DifferentialRing&| NIL NIL NIL NIL NIL NIL NIL |Ring&| NIL NIL
                NIL NIL NIL NIL NIL NIL NIL |Rng&| NIL |AbelianGroup&| NIL NIL
                NIL NIL |Monoid&| |OrderedSet&| |AbelianMonoid&| NIL
                |AbelianSemiGroup&| |SemiGroup&| NIL NIL |FullyEvalableOver&|
                NIL NIL |SetCategory&| |TranscendentalFunctionCategory&| NIL
                |Evalable&| NIL |RetractableTo&| NIL |BasicType&| NIL NIL NIL
                NIL NIL NIL |TrigonometricFunctionCategory&|
                |ArcTrigonometricFunctionCategory&|
                |HyperbolicFunctionCategory&| NIL |ElementaryFunctionCategory&|
                |RadicalCategory&| NIL |RetractableTo&| NIL NIL NIL
                |PartialOrder&| |RetractableTo&| |RetractableTo&|
                |InnerEvalable&| |InnerEvalable&| NIL NIL NIL NIL)
             (CONS
              '#((|UnivariateLaurentSeriesConstructorCategory| 6
                                                               (|SparseUnivariateTaylorSeries|
                                                                6 7 8))
                 (|UnivariateLaurentSeriesCategory| 6)
                 (|QuotientFieldCategory|
                  (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|Field|) (|UnivariatePowerSeriesCategory| 6 17)
                 (|EuclideanDomain|) (|PolynomialFactorizationExplicit|)
                 (|PowerSeriesCategory| 6 17 191) (|PrincipalIdealDomain|)
                 (|UniqueFactorizationDomain|) (|AbelianMonoidRing| 6 17)
                 (|GcdDomain|) (|OrderedIntegralDomain|) (|DivisionRing|)
                 (|IntegralDomain|) (|Algebra| 6) (|Algebra| $$)
                 (|LeftOreRing|) (|Algebra| 126) (|OrderedRing|)
                 (|Algebra| (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|DifferentialExtension|
                  (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|FullyLinearlyExplicitOver|
                  (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|Module| 6) (|Module| $$) (|EntireRing|) (|Module| 126)
                 (|CharacteristicNonZero|) (|CharacteristicZero|)
                 (|CommutativeRing|)
                 (|Module| (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|PartialDifferentialRing| 10) (|DifferentialRing|)
                 (|LinearlyExplicitOver|
                  (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|LinearlyExplicitOver| 17) (|BiModule| 6 6)
                 (|BiModule| $$ $$) (|BiModule| 126 126)
                 (|OrderedAbelianGroup|)
                 (|BiModule| (|SparseUnivariateTaylorSeries| 6 7 8)
                             (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|Ring|) (|LeftModule| 6) (|RightModule| 6) (|RightModule| $$)
                 (|LeftModule| $$) (|LeftModule| 126) (|RightModule| 126)
                 (|OrderedCancellationAbelianMonoid|)
                 (|LeftModule| (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|RightModule| (|SparseUnivariateTaylorSeries| 6 7 8)) (|Rng|)
                 (|OrderedAbelianMonoid|) (|AbelianGroup|) (|SemiRing|)
                 (|OrderedAbelianSemiGroup|) (|CancellationAbelianMonoid|)
                 (|SemiRng|) (|Monoid|) (|OrderedSet|) (|AbelianMonoid|)
                 (|FullyPatternMatchable|
                  (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|AbelianSemiGroup|) (|SemiGroup|) (|Comparable|)
                 (|StepThrough|)
                 (|FullyEvalableOver| (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|PatternMatchable| 168) (|PatternMatchable| 17)
                 (|SetCategory|) (|TranscendentalFunctionCategory|)
                 (|RealConstant|)
                 (|Evalable| (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|Patternable| (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|RetractableTo| (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|VariablesCommuteWithCoefficients|) (|BasicType|)
                 (|CoercibleTo| 147) (|Eltable| $$ $$) (|CommutativeStar|)
                 (|noZeroDivisors|) (|canonicalUnitNormal|)
                 (|canonicalsClosed|) (|TrigonometricFunctionCategory|)
                 (|ArcTrigonometricFunctionCategory|)
                 (|HyperbolicFunctionCategory|)
                 (|ArcHyperbolicFunctionCategory|)
                 (|ElementaryFunctionCategory|) (|RadicalCategory|)
                 (|unitsKnown|) (|RetractableTo| 10) (|ConvertibleTo| 152)
                 (|ConvertibleTo| 169) (|ConvertibleTo| 168) (|PartialOrder|)
                 (|RetractableTo| 126) (|RetractableTo| 17)
                 (|InnerEvalable| 10 (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|InnerEvalable| (|SparseUnivariateTaylorSeries| 6 7 8)
                                  (|SparseUnivariateTaylorSeries| 6 7 8))
                 (|Eltable| (|SparseUnivariateTaylorSeries| 6 7 8) $$)
                 (|ConvertibleTo| 153) (|ConvertibleTo| 154) (|Type|))
              (|makeByteWordVec2| 195
                                  '(1 6 13 0 14 0 6 0 15 0 0 0 16 2 0 0 6 17 18
                                    0 6 0 19 0 0 0 20 2 0 0 0 0 21 2 0 17 0 17
                                    24 2 0 0 0 0 32 2 26 0 6 39 40 2 0 0 0 0 44
                                    2 0 0 26 26 45 3 9 46 0 0 13 47 2 0 46 0 0
                                    49 1 0 0 0 50 2 9 0 0 0 52 2 0 0 0 39 53 0
                                    55 0 56 2 26 57 0 39 58 1 55 0 57 59 1 55 0
                                    10 60 1 57 0 6 61 2 55 0 0 0 62 2 55 0 0 17
                                    63 2 55 0 0 0 64 2 0 55 0 17 65 3 0 0 0 17
                                    17 66 3 0 55 0 17 17 67 2 0 6 0 17 68 1 9 0
                                    0 69 1 0 0 0 70 2 0 0 0 22 71 1 0 0 0 72 1
                                    0 0 0 73 2 0 0 0 0 74 1 75 2 2 76 1 75 2 2
                                    77 1 75 2 2 78 1 0 0 0 79 1 75 2 2 80 1 0 0
                                    0 81 1 75 2 2 82 1 0 0 0 83 1 75 2 2 84 1 0
                                    0 0 85 1 75 2 2 86 1 0 0 0 87 1 75 2 2 88 1
                                    0 0 0 89 1 75 2 2 90 1 0 0 0 91 1 75 2 2 92
                                    1 0 0 0 93 1 75 2 2 94 1 0 0 0 95 1 75 2 2
                                    96 1 0 0 0 97 1 75 2 2 98 1 0 0 0 99 1 75 2
                                    2 100 1 0 0 0 101 1 75 2 2 102 1 0 0 0 103
                                    1 75 2 2 104 1 0 0 0 105 1 75 2 2 106 1 0 0
                                    0 107 1 75 2 2 108 1 0 0 0 109 1 75 2 2 110
                                    1 0 0 0 111 1 75 2 2 112 1 0 0 0 113 1 75 2
                                    2 114 1 0 0 0 115 1 75 2 2 116 1 0 0 0 117
                                    1 75 2 2 118 1 0 0 0 119 1 75 2 2 120 1 0 0
                                    0 121 1 75 2 2 122 1 0 0 0 123 1 75 2 2 124
                                    1 0 0 0 125 2 9 0 0 126 127 2 0 0 0 126 128
                                    1 126 17 0 129 2 17 46 0 0 130 1 0 26 0 131
                                    2 26 0 0 126 132 1 126 17 0 133 1 9 135 0
                                    136 1 135 13 0 137 1 135 13 0 138 1 9 139 0
                                    140 1 139 141 0 142 1 141 143 0 144 2 0 0 0
                                    17 145 0 126 0 146 5 9 147 135 139 10 6 126
                                    148 2 0 13 0 0 1 1 62 13 0 1 1 35 26 0 1 1
                                    0 189 0 1 1 0 10 0 11 1 57 172 0 1 1 57 0 0
                                    1 1 57 13 0 1 2 0 0 0 17 1 3 0 0 0 17 17 66
                                    1 0 135 0 1 1 0 26 0 36 1 0 28 0 29 1 0 26
                                    0 30 1 47 0 0 107 1 47 0 0 83 2 61 46 0 0 1
                                    1 31 164 165 1 1 2 0 0 1 1 2 185 0 1 1 47 0
                                    0 1 2 31 166 167 165 1 2 25 13 0 0 1 2 2 13
                                    0 0 1 1 47 0 0 103 1 47 0 0 79 1 6 17 0 1 1
                                    0 0 135 1 1 47 0 0 111 1 47 0 0 87 0 62 0 1
                                    1 8 170 0 1 1 8 143 0 1 1 3 171 0 1 1 0 28
                                    0 31 1 8 126 0 1 1 8 17 0 1 1 3 10 0 1 1 0
                                    26 0 131 2 0 0 17 0 35 1 0 0 0 34 2 2 0 0 0
                                    1 1 0 0 0 1 1 13 159 151 1 2 13 160 151 161
                                    1 1 2 175 151 1 2 2 176 151 161 1 1 58 46 0
                                    48 3 22 55 0 17 17 67 2 22 55 0 17 65 2 2 0
                                    0 0 1 1 2 179 178 1 1 2 13 0 1 1 6 13 0 1 1
                                    0 13 0 25 0 47 0 1 3 16 162 0 153 162 1 3
                                    17 163 0 154 163 1 2 0 17 0 17 24 1 0 17 0
                                    1 2 62 13 0 0 1 1 58 13 0 1 1 2 0 0 1 1 2
                                    26 0 38 2 47 0 0 17 1 1 9 46 0 1 1 6 13 0 1
                                    2 0 0 0 188 1 2 0 0 187 0 1 2 2 180 178 0 1
                                    1 0 13 0 1 3 0 0 0 189 190 1 3 0 0 0 191 17
                                    1 2 0 0 6 17 18 2 26 0 0 0 1 2 26 0 0 0 1 2
                                    2 0 174 0 1 2 0 0 192 0 1 1 47 0 0 72 1 0 0
                                    0 1 1 0 6 0 1 2 2 177 0 0 1 2 2 0 0 0 1 1 2
                                    0 178 1 2 0 0 17 26 33 2 0 0 17 186 1 1 0
                                    194 0 1 1 2 0 0 1 2 53 0 0 10 1 2 47 0 0 22
                                    71 1 47 0 0 70 0 9 0 1 2 0 193 193 0 1 1 0
                                    195 0 1 2 2 165 165 165 1 2 2 0 0 0 1 1 2 0
                                    178 1 1 35 0 0 1 1 34 26 0 1 1 31 164 165 1
                                    1 31 164 165 1 1 2 185 0 1 3 2 183 0 0 0 1
                                    2 2 184 0 0 1 2 0 0 0 17 145 2 57 46 0 0 49
                                    2 2 180 178 0 1 1 47 0 0 73 3 11 0 0 155
                                    155 1 3 11 0 0 26 26 1 2 11 0 0 156 1 2 11
                                    0 0 157 1 3 10 0 0 10 26 1 3 10 0 0 158 155
                                    1 2 20 186 0 6 1 1 2 39 0 1 2 12 0 0 26 1 2
                                    1 0 0 0 54 2 0 6 0 17 1 2 2 181 0 0 1 1 40
                                    0 0 50 2 40 0 0 39 1 2 39 0 0 10 1 3 39 0 0
                                    10 39 1 2 39 0 0 158 1 3 39 0 0 158 173 1 3
                                    2 0 0 174 39 1 2 2 0 0 174 1 2 0 0 0 22 51
                                    1 2 0 0 1 1 2 26 0 41 1 0 17 0 37 1 47 0 0
                                    113 1 47 0 0 89 1 47 0 0 109 1 47 0 0 85 1
                                    47 0 0 105 1 47 0 0 81 1 4 152 0 1 1 14 153
                                    0 1 1 15 154 0 1 1 5 168 0 1 1 5 169 0 1 1
                                    55 150 151 1 1 0 0 0 1 1 54 0 6 1 1 3 0 10
                                    1 1 59 0 17 1 1 57 0 0 1 1 47 0 126 1 1 0 0
                                    22 23 1 0 0 26 27 1 0 147 0 149 2 0 6 0 17
                                    68 1 56 46 0 1 0 59 39 1 1 0 6 0 12 1 34 26
                                    0 1 1 47 0 0 119 1 47 0 0 95 2 57 13 0 0 1
                                    1 47 0 0 115 1 47 0 0 91 1 47 0 0 123 1 47
                                    0 0 99 2 21 6 0 17 1 2 59 13 0 0 1 1 47 0 0
                                    125 1 47 0 0 101 1 47 0 0 121 1 47 0 0 97 1
                                    47 0 0 117 1 47 0 0 93 1 6 0 0 1 2 58 0 0
                                    39 53 2 47 0 0 126 128 2 47 0 0 0 74 2 2 0
                                    0 17 1 2 0 0 0 188 1 0 62 0 20 0 58 0 16 1
                                    40 0 0 1 2 40 0 0 39 1 2 39 0 0 158 1 2 39
                                    0 0 10 1 3 39 0 0 158 173 1 3 39 0 0 10 39
                                    1 2 2 0 0 174 1 3 2 0 0 174 39 1 2 26 13 0
                                    0 1 2 26 13 0 0 1 2 0 13 0 0 1 2 26 13 0 0
                                    1 2 26 13 0 0 1 2 2 0 26 26 45 2 2 0 0 0 44
                                    2 2 0 0 6 1 2 60 0 0 0 1 1 60 0 0 1 2 0 0 0
                                    0 21 2 60 0 17 0 1 2 62 0 39 0 1 2 47 0 0
                                    126 1 2 47 0 126 0 1 2 2 0 26 0 42 2 2 0 0
                                    26 43 2 0 0 6 0 1 2 0 0 0 0 32 2 0 0 0 6 1
                                    2 0 0 188 0 1)))))
           '|lookupComplete|)) 
