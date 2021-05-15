
(DEFPARAMETER |UnivariateLaurentSeriesCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |UnivariateLaurentSeriesCategory;|)) 

(DEFPARAMETER |UnivariateLaurentSeriesCategory;AL| 'NIL) 

(DEFUN |UnivariateLaurentSeriesCategory| (|t#1|)
  (LET (#1=#:G382 (#2=#:G383 (|devaluate| |t#1|)))
    (COND
     ((SETQ #1# (|assoc| #2# |UnivariateLaurentSeriesCategory;AL|)) (CDR #1#))
     (T
      (SETQ |UnivariateLaurentSeriesCategory;AL|
              (|cons5|
               (CONS #2# (SETQ #1# (|UnivariateLaurentSeriesCategory;| #2#)))
               |UnivariateLaurentSeriesCategory;AL|))
      #1#)))) 

(DEFUN |UnivariateLaurentSeriesCategory;| (|t#1|)
  (SPROG ((#1=#:G381 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (MAKE_PAIRS '(|t#1|) (LIST |t#1|))
                              (|sublisV|
                               (MAKE_PAIRS '(#2=#:G380) (LIST '(|Integer|)))
                               (COND (|UnivariateLaurentSeriesCategory;CAT|)
                                     ('T
                                      (LETT
                                       |UnivariateLaurentSeriesCategory;CAT|
                                       (|Join|
                                        (|UnivariatePowerSeriesCategory| '|t#1|
                                                                         '#2#)
                                        (|mkCategory|
                                         '(((|series|
                                             ($
                                              (|Stream|
                                               (|Record| (|:| |k| (|Integer|))
                                                         (|:| |c| |t#1|)))))
                                            T)
                                           ((|laurent|
                                             ($ (|Integer|) (|Stream| |t#1|)))
                                            T)
                                           ((|multiplyCoefficients|
                                             ($ (|Mapping| |t#1| (|Integer|))
                                              $))
                                            T)
                                           ((|rationalFunction|
                                             ((|Fraction| (|Polynomial| |t#1|))
                                              $ (|Integer|)))
                                            (|has| |t#1| (|IntegralDomain|)))
                                           ((|rationalFunction|
                                             ((|Fraction| (|Polynomial| |t#1|))
                                              $ (|Integer|) (|Integer|)))
                                            (|has| |t#1| (|IntegralDomain|)))
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
           (SETELT #1# 0 (LIST '|UnivariateLaurentSeriesCategory| |t#1|))))) 
