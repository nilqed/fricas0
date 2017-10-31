
(DEFPARAMETER |UnivariatePuiseuxSeriesCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |UnivariatePuiseuxSeriesCategory;|)) 

(DEFPARAMETER |UnivariatePuiseuxSeriesCategory;AL| 'NIL) 

(DEFUN |UnivariatePuiseuxSeriesCategory| (#1=#:G697)
  (LET (#2=#:G698)
    (COND
     ((SETQ #2#
              (|assoc| #3=(|devaluate| #1#)
                       |UnivariatePuiseuxSeriesCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |UnivariatePuiseuxSeriesCategory;AL|
              (|cons5|
               (CONS #3# (SETQ #2# (|UnivariatePuiseuxSeriesCategory;| #1#)))
               |UnivariatePuiseuxSeriesCategory;AL|))
      #2#)))) 

(DEFUN |UnivariatePuiseuxSeriesCategory;| (|t#1|)
  (SPROG ((#1=#:G696 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (|sublisV|
                               (PAIR '(#2=#:G695)
                                     (LIST '(|Fraction| (|Integer|))))
                               (COND (|UnivariatePuiseuxSeriesCategory;CAT|)
                                     ('T
                                      (LETT
                                       |UnivariatePuiseuxSeriesCategory;CAT|
                                       (|Join|
                                        (|UnivariatePowerSeriesCategory| '|t#1|
                                                                         '#2#)
                                        (|mkCategory|
                                         '(((|series|
                                             ($ (|NonNegativeInteger|)
                                              (|Stream|
                                               (|Record|
                                                (|:| |k|
                                                     (|Fraction| (|Integer|)))
                                                (|:| |c| |t#1|)))))
                                            T)
                                           ((|multiplyExponents|
                                             ($ $ (|Fraction| (|Integer|))))
                                            T)
                                           ((|integrate| ($ $))
                                            (|has| |t#1|
                                                   (|Algebra|
                                                    (|Fraction| (|Integer|)))))
                                           ((|integrate| ($ $ (|Symbol|)))
                                            (AND
                                             (|has| |t#1|
                                                    (SIGNATURE |variables|
                                                     ((|List| (|Symbol|))
                                                      |t#1|)))
                                             (|has| |t#1|
                                                    (SIGNATURE |integrate|
                                                     (|t#1| |t#1| (|Symbol|))))
                                             (|has| |t#1|
                                                    (|Algebra|
                                                     (|Fraction|
                                                      (|Integer|))))))
                                           ((|integrate| ($ $ (|Symbol|)))
                                            (AND
                                             (|has| |t#1|
                                                    (|AlgebraicallyClosedFunctionSpace|
                                                     (|Integer|)))
                                             (|has| |t#1|
                                                    (|PrimitiveFunctionCategory|))
                                             (|has| |t#1|
                                                    (|TranscendentalFunctionCategory|))
                                             (|has| |t#1|
                                                    (|Algebra|
                                                     (|Fraction|
                                                      (|Integer|)))))))
                                         '(((|RadicalCategory|)
                                            (|has| |t#1|
                                                   (|Algebra|
                                                    (|Fraction| (|Integer|)))))
                                           ((|TranscendentalFunctionCategory|)
                                            (|has| |t#1|
                                                   (|Algebra|
                                                    (|Fraction| (|Integer|)))))
                                           ((|Field|) (|has| |t#1| (|Field|))))
                                         '((|Symbol|) (|Fraction| (|Integer|))
                                           (|NonNegativeInteger|)
                                           (|Stream|
                                            (|Record|
                                             (|:| |k| (|Fraction| (|Integer|)))
                                             (|:| |c| |t#1|))))
                                         NIL))
                                       . #3=(|UnivariatePuiseuxSeriesCategory|))))))
                   . #3#)
           (SETELT #1# 0
                   (LIST '|UnivariatePuiseuxSeriesCategory|
                         (|devaluate| |t#1|)))))) 
