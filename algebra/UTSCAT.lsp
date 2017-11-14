
(DEFPARAMETER |UnivariateTaylorSeriesCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |UnivariateTaylorSeriesCategory;|)) 

(DEFPARAMETER |UnivariateTaylorSeriesCategory;AL| 'NIL) 

(DEFUN |UnivariateTaylorSeriesCategory| (#1=#:G713)
  (LET (#2=#:G714)
    (COND
     ((SETQ #2#
              (|assoc| #3=(|devaluate| #1#)
                       |UnivariateTaylorSeriesCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |UnivariateTaylorSeriesCategory;AL|
              (|cons5|
               (CONS #3# (SETQ #2# (|UnivariateTaylorSeriesCategory;| #1#)))
               |UnivariateTaylorSeriesCategory;AL|))
      #2#)))) 

(DEFUN |UnivariateTaylorSeriesCategory;| (|t#1|)
  (SPROG ((#1=#:G712 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (|sublisV|
                               (PAIR '(#2=#:G711)
                                     (LIST '(|NonNegativeInteger|)))
                               (COND (|UnivariateTaylorSeriesCategory;CAT|)
                                     ('T
                                      (LETT
                                       |UnivariateTaylorSeriesCategory;CAT|
                                       (|Join|
                                        (|UnivariatePowerSeriesCategory| '|t#1|
                                                                         '#2#)
                                        (|mkCategory|
                                         '(((|series|
                                             ($
                                              (|Stream|
                                               (|Record|
                                                (|:| |k|
                                                     (|NonNegativeInteger|))
                                                (|:| |c| |t#1|)))))
                                            T)
                                           ((|coefficients|
                                             ((|Stream| |t#1|) $))
                                            T)
                                           ((|series| ($ (|Stream| |t#1|))) T)
                                           ((|quoByVar| ($ $)) T)
                                           ((|multiplyCoefficients|
                                             ($ (|Mapping| |t#1| (|Integer|))
                                              $))
                                            T)
                                           ((|polynomial|
                                             ((|Polynomial| |t#1|) $
                                              (|NonNegativeInteger|)))
                                            T)
                                           ((|polynomial|
                                             ((|Polynomial| |t#1|) $
                                              (|NonNegativeInteger|)
                                              (|NonNegativeInteger|)))
                                            T)
                                           ((^ ($ $ |t#1|))
                                            (|has| |t#1| (|Field|)))
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
                                                    (|Fraction|
                                                     (|Integer|))))))
                                         '((|Symbol|) (|Polynomial| |t#1|)
                                           (|NonNegativeInteger|)
                                           (|Stream| |t#1|)
                                           (|Stream|
                                            (|Record|
                                             (|:| |k| (|NonNegativeInteger|))
                                             (|:| |c| |t#1|))))
                                         NIL))
                                       . #3=(|UnivariateTaylorSeriesCategory|))))))
                   . #3#)
           (SETELT #1# 0
                   (LIST '|UnivariateTaylorSeriesCategory|
                         (|devaluate| |t#1|)))))) 
