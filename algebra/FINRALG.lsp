
(DEFPARAMETER |FiniteRankAlgebra;CAT| 'NIL) 

(DECLAIM (NOTINLINE |FiniteRankAlgebra;|)) 

(DEFPARAMETER |FiniteRankAlgebra;AL| 'NIL) 

(DEFUN |FiniteRankAlgebra| (&REST #1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluateList| #1#) |FiniteRankAlgebra;AL|))
      (CDR #2#))
     (T
      (SETQ |FiniteRankAlgebra;AL|
              (|cons5| (CONS #3# (SETQ #2# (APPLY #'|FiniteRankAlgebra;| #1#)))
                       |FiniteRankAlgebra;AL|))
      #2#)))) 

(DEFUN |FiniteRankAlgebra;| (|t#1| |t#2|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2|)
                          (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)))
                    (COND (|FiniteRankAlgebra;CAT|)
                          ('T
                           (LETT |FiniteRankAlgebra;CAT|
                                 (|Join| (|Algebra| '|t#1|)
                                         (|mkCategory|
                                          '(((|rank| ((|PositiveInteger|))) T)
                                            ((|regularRepresentation|
                                              ((|Matrix| |t#1|) $
                                               (|Vector| $)))
                                             T)
                                            ((|trace| (|t#1| $)) T)
                                            ((|norm| (|t#1| $)) T)
                                            ((|coordinates|
                                              ((|Vector| |t#1|) $
                                               (|Vector| $)))
                                             T)
                                            ((|coordinates|
                                              ((|Matrix| |t#1|) (|Vector| $)
                                               (|Vector| $)))
                                             T)
                                            ((|represents|
                                              ($ (|Vector| |t#1|)
                                               (|Vector| $)))
                                             T)
                                            ((|discriminant|
                                              (|t#1| (|Vector| $)))
                                             T)
                                            ((|traceMatrix|
                                              ((|Matrix| |t#1|) (|Vector| $)))
                                             T)
                                            ((|characteristicPolynomial|
                                              (|t#2| $))
                                             T)
                                            ((|minimalPolynomial| (|t#2| $))
                                             (|has| |t#1| (|Field|))))
                                          '(((|CharacteristicZero|)
                                             (|has| |t#1|
                                                    (|CharacteristicZero|)))
                                            ((|CharacteristicNonZero|)
                                             (|has| |t#1|
                                                    (|CharacteristicNonZero|))))
                                          '((|Matrix| |t#1|) (|Vector| $)
                                            (|Vector| |t#1|)
                                            (|PositiveInteger|))
                                          NIL))
                                 . #2=(|FiniteRankAlgebra|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|FiniteRankAlgebra| (|devaluate| |t#1|)
                         (|devaluate| |t#2|)))))) 
