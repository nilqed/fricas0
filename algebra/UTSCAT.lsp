
(DEFPARAMETER |UnivariateTaylorSeriesCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |UnivariateTaylorSeriesCategory;|)) 

(DEFPARAMETER |UnivariateTaylorSeriesCategory;AL| 'NIL) 

(DEFUN |UnivariateTaylorSeriesCategory| (|t#1|)
  (LET (#1=#:G400 (#2=#:G401 (|devaluate| |t#1|)))
    (COND
     ((SETQ #1# (|assoc| #2# |UnivariateTaylorSeriesCategory;AL|)) (CDR #1#))
     (T
      (SETQ |UnivariateTaylorSeriesCategory;AL|
              (|cons5|
               (CONS #2# (SETQ #1# (|UnivariateTaylorSeriesCategory;| #2#)))
               |UnivariateTaylorSeriesCategory;AL|))
      #1#)))) 

(DEFUN |UnivariateTaylorSeriesCategory;| (|t#1|)
  (SPROG ((#1=#:G399 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (MAKE_PAIRS '(|t#1|) (LIST |t#1|))
                              (|sublisV|
                               (MAKE_PAIRS '(#2=#:G398)
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
                                         NIL NIL))))))))
           (SETELT #1# 0 (LIST '|UnivariateTaylorSeriesCategory| |t#1|))))) 
