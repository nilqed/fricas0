
(DEFPARAMETER |UnivariatePuiseuxSeriesCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |UnivariatePuiseuxSeriesCategory;|)) 

(DEFPARAMETER |UnivariatePuiseuxSeriesCategory;AL| 'NIL) 

(DEFUN |UnivariatePuiseuxSeriesCategory| (|t#1|)
  (LET (#1=#:G380 (#2=#:G381 (|devaluate| |t#1|)))
    (COND
     ((SETQ #1# (|assoc| #2# |UnivariatePuiseuxSeriesCategory;AL|)) (CDR #1#))
     (T
      (SETQ |UnivariatePuiseuxSeriesCategory;AL|
              (|cons5|
               (CONS #2# (SETQ #1# (|UnivariatePuiseuxSeriesCategory;| #2#)))
               |UnivariatePuiseuxSeriesCategory;AL|))
      #1#)))) 

(DEFUN |UnivariatePuiseuxSeriesCategory;| (|t#1|)
  (SPROG ((#1=#:G379 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (MAKE_PAIRS '(|t#1|) (LIST |t#1|))
                              (|sublisV|
                               (MAKE_PAIRS '(#2=#:G378)
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
                                         NIL NIL))))))))
           (SETELT #1# 0 (LIST '|UnivariatePuiseuxSeriesCategory| |t#1|))))) 
