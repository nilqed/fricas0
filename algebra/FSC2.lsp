
(DEFPARAMETER |FunctionSpace2;CAT| 'NIL) 

(DECLAIM (NOTINLINE |FunctionSpace2;|)) 

(DEFPARAMETER |FunctionSpace2;AL| 'NIL) 

(DEFUN |FunctionSpace2| (|t#1| |t#2|)
  (LET (#1=#:G46 (#2=#:G47 (LIST (|devaluate| |t#1|) (|devaluate| |t#2|))))
    (COND ((SETQ #1# (|assoc| #2# |FunctionSpace2;AL|)) (CDR #1#))
          (T
           (SETQ |FunctionSpace2;AL|
                   (|cons5|
                    (CONS #2# (SETQ #1# (APPLY #'|FunctionSpace2;| #2#)))
                    |FunctionSpace2;AL|))
           #1#)))) 

(DEFUN |FunctionSpace2;| (|t#1| |t#2|)
  (SPROG ((#1=#:G45 NIL))
         (PROG1
             (LETT #1#
                   (|subst_in_cat| '(|t#1| |t#2|) (LIST |t#1| |t#2|)
                                   (|subst_in_cat| '(#2=#:G44)
                                                   (LIST '(|Symbol|))
                                                   (COND (|FunctionSpace2;CAT|)
                                                         ('T
                                                          (LETT
                                                           |FunctionSpace2;CAT|
                                                           (|Join|
                                                            (|ExpressionSpace2|
                                                             '|t#2|)
                                                            (|RetractableTo|
                                                             '#2#)
                                                            (|Patternable|
                                                             '|t#1|)
                                                            (|FullyPatternMatchable|
                                                             '|t#1|)
                                                            (|FullyRetractableTo|
                                                             '|t#1|)
                                                            (|mkCategory|
                                                             '(((|ground?|
                                                                 ((|Boolean|)
                                                                  %))
                                                                T)
                                                               ((|ground|
                                                                 (|t#1| %))
                                                                T)
                                                               ((|variables|
                                                                 ((|List|
                                                                   (|Symbol|))
                                                                  %))
                                                                T)
                                                               ((|variables|
                                                                 ((|List|
                                                                   (|Symbol|))
                                                                  (|List| %)))
                                                                T)
                                                               ((|applyQuote|
                                                                 (% (|Symbol|)
                                                                  %))
                                                                T)
                                                               ((|applyQuote|
                                                                 (% (|Symbol|)
                                                                  % %))
                                                                T)
                                                               ((|applyQuote|
                                                                 (% (|Symbol|)
                                                                  % % %))
                                                                T)
                                                               ((|applyQuote|
                                                                 (% (|Symbol|)
                                                                  % % % %))
                                                                T)
                                                               ((|applyQuote|
                                                                 (% (|Symbol|)
                                                                  (|List| %)))
                                                                T)
                                                               ((|eval|
                                                                 (% %
                                                                  (|BasicOperator|)
                                                                  %
                                                                  (|Symbol|)))
                                                                (|has| |t#1|
                                                                       (|ConvertibleTo|
                                                                        (|InputForm|))))
                                                               ((|eval|
                                                                 (% %
                                                                  (|List|
                                                                   (|BasicOperator|))
                                                                  (|List| %)
                                                                  (|Symbol|)))
                                                                (|has| |t#1|
                                                                       (|ConvertibleTo|
                                                                        (|InputForm|))))
                                                               ((|isTimes|
                                                                 ((|Union|
                                                                   (|List| %)
                                                                   "failed")
                                                                  %))
                                                                (|has| |t#1|
                                                                       (|SemiGroup|)))
                                                               ((|isExpt|
                                                                 ((|Union|
                                                                   (|Record|
                                                                    (|:| |var|
                                                                         |t#2|)
                                                                    (|:|
                                                                     |exponent|
                                                                     (|Integer|)))
                                                                   "failed")
                                                                  %))
                                                                (|has| |t#1|
                                                                       (|SemiGroup|)))
                                                               ((|isPlus|
                                                                 ((|Union|
                                                                   (|List| %)
                                                                   "failed")
                                                                  %))
                                                                (|has| |t#1|
                                                                       (|AbelianSemiGroup|)))
                                                               ((|isMult|
                                                                 ((|Union|
                                                                   (|Record|
                                                                    (|:| |coef|
                                                                         (|Integer|))
                                                                    (|:| |var|
                                                                         |t#2|))
                                                                   "failed")
                                                                  %))
                                                                (|has| |t#1|
                                                                       (|AbelianSemiGroup|)))
                                                               ((|coerce|
                                                                 (%
                                                                  (|SparseMultivariatePolynomial|
                                                                   |t#1|
                                                                   |t#2|)))
                                                                (|has| |t#1|
                                                                       (|Ring|)))
                                                               ((|numer|
                                                                 ((|SparseMultivariatePolynomial|
                                                                   |t#1| |t#2|)
                                                                  %))
                                                                (|has| |t#1|
                                                                       (|Ring|)))
                                                               ((|numerator|
                                                                 (% %))
                                                                (|has| |t#1|
                                                                       (|Ring|)))
                                                               ((|isExpt|
                                                                 ((|Union|
                                                                   (|Record|
                                                                    (|:| |var|
                                                                         |t#2|)
                                                                    (|:|
                                                                     |exponent|
                                                                     (|Integer|)))
                                                                   "failed")
                                                                  %
                                                                  (|BasicOperator|)))
                                                                (|has| |t#1|
                                                                       (|Ring|)))
                                                               ((|isExpt|
                                                                 ((|Union|
                                                                   (|Record|
                                                                    (|:| |var|
                                                                         |t#2|)
                                                                    (|:|
                                                                     |exponent|
                                                                     (|Integer|)))
                                                                   "failed")
                                                                  %
                                                                  (|Symbol|)))
                                                                (|has| |t#1|
                                                                       (|Ring|)))
                                                               ((|isPower|
                                                                 ((|Union|
                                                                   (|Record|
                                                                    (|:| |val|
                                                                         %)
                                                                    (|:|
                                                                     |exponent|
                                                                     (|Integer|)))
                                                                   "failed")
                                                                  %))
                                                                (|has| |t#1|
                                                                       (|Ring|)))
                                                               ((|eval|
                                                                 (% %
                                                                  (|List|
                                                                   (|Symbol|))
                                                                  (|List|
                                                                   (|NonNegativeInteger|))
                                                                  (|List|
                                                                   (|Mapping| %
                                                                              %))))
                                                                (|has| |t#1|
                                                                       (|Ring|)))
                                                               ((|eval|
                                                                 (% %
                                                                  (|List|
                                                                   (|Symbol|))
                                                                  (|List|
                                                                   (|NonNegativeInteger|))
                                                                  (|List|
                                                                   (|Mapping| %
                                                                              (|List|
                                                                               %)))))
                                                                (|has| |t#1|
                                                                       (|Ring|)))
                                                               ((|eval|
                                                                 (% %
                                                                  (|Symbol|)
                                                                  (|NonNegativeInteger|)
                                                                  (|Mapping| %
                                                                             (|List|
                                                                              %))))
                                                                (|has| |t#1|
                                                                       (|Ring|)))
                                                               ((|eval|
                                                                 (% %
                                                                  (|Symbol|)
                                                                  (|NonNegativeInteger|)
                                                                  (|Mapping| %
                                                                             %)))
                                                                (|has| |t#1|
                                                                       (|Ring|)))
                                                               ((|algtower|
                                                                 ((|List|
                                                                   |t#2|)
                                                                  %))
                                                                (|has| |t#1|
                                                                       (|IntegralDomain|)))
                                                               ((|algtower|
                                                                 ((|List|
                                                                   |t#2|)
                                                                  (|List| %)))
                                                                (|has| |t#1|
                                                                       (|IntegralDomain|)))
                                                               ((|convert|
                                                                 (%
                                                                  (|Factored|
                                                                   %)))
                                                                (|has| |t#1|
                                                                       (|IntegralDomain|)))
                                                               ((|denom|
                                                                 ((|SparseMultivariatePolynomial|
                                                                   |t#1| |t#2|)
                                                                  %))
                                                                (|has| |t#1|
                                                                       (|IntegralDomain|)))
                                                               ((|denominator|
                                                                 (% %))
                                                                (|has| |t#1|
                                                                       (|IntegralDomain|)))
                                                               ((/
                                                                 (%
                                                                  (|SparseMultivariatePolynomial|
                                                                   |t#1| |t#2|)
                                                                  (|SparseMultivariatePolynomial|
                                                                   |t#1|
                                                                   |t#2|)))
                                                                (|has| |t#1|
                                                                       (|IntegralDomain|)))
                                                               ((|coerce|
                                                                 (%
                                                                  (|Fraction|
                                                                   |t#1|)))
                                                                (|has| |t#1|
                                                                       (|IntegralDomain|)))
                                                               ((|coerce|
                                                                 (%
                                                                  (|Polynomial|
                                                                   (|Fraction|
                                                                    |t#1|))))
                                                                (|has| |t#1|
                                                                       (|IntegralDomain|)))
                                                               ((|coerce|
                                                                 (%
                                                                  (|Fraction|
                                                                   (|Polynomial|
                                                                    (|Fraction|
                                                                     |t#1|)))))
                                                                (|has| |t#1|
                                                                       (|IntegralDomain|)))
                                                               ((|univariate|
                                                                 ((|Fraction|
                                                                   (|SparseUnivariatePolynomial|
                                                                    %))
                                                                  % |t#2|))
                                                                (|has| |t#1|
                                                                       (|IntegralDomain|))))
                                                             '(((|ConvertibleTo|
                                                                 (|InputForm|))
                                                                (|has| |t#1|
                                                                       (|ConvertibleTo|
                                                                        (|InputForm|))))
                                                               ((|Monoid|)
                                                                (|has| |t#1|
                                                                       (|SemiGroup|)))
                                                               ((|Group|)
                                                                (|has| |t#1|
                                                                       (|Group|)))
                                                               ((|AbelianMonoid|)
                                                                (|has| |t#1|
                                                                       (|AbelianSemiGroup|)))
                                                               ((|AbelianGroup|)
                                                                (|has| |t#1|
                                                                       (|AbelianGroup|)))
                                                               ((|Ring|)
                                                                (|has| |t#1|
                                                                       (|Ring|)))
                                                               ((|RetractableTo|
                                                                 (|Polynomial|
                                                                  |t#1|))
                                                                (|has| |t#1|
                                                                       (|Ring|)))
                                                               ((|PartialDifferentialRing|
                                                                 (|Symbol|))
                                                                (|has| |t#1|
                                                                       (|Ring|)))
                                                               ((|FullyLinearlyExplicitOver|
                                                                 |t#1|)
                                                                (|has| |t#1|
                                                                       (|Ring|)))
                                                               ((|CharacteristicZero|)
                                                                (|has| |t#1|
                                                                       (|CharacteristicZero|)))
                                                               ((|CharacteristicNonZero|)
                                                                (|has| |t#1|
                                                                       (|CharacteristicNonZero|)))
                                                               ((|Algebra|
                                                                 |t#1|)
                                                                (|has| |t#1|
                                                                       (|CommutativeRing|)))
                                                               ((|Field|)
                                                                (|has| |t#1|
                                                                       (|IntegralDomain|)))
                                                               ((|RetractableTo|
                                                                 (|Fraction|
                                                                  (|Polynomial|
                                                                   |t#1|)))
                                                                (|has| |t#1|
                                                                       (|IntegralDomain|)))
                                                               ((|RetractableTo|
                                                                 (|Fraction|
                                                                  (|Integer|)))
                                                                (AND
                                                                 (|has| |t#1|
                                                                        (|RetractableTo|
                                                                         (|Integer|)))
                                                                 (|has| |t#1|
                                                                        (|IntegralDomain|)))))
                                                             NIL NIL))))))))
           (SETELT #1# 0 (LIST '|FunctionSpace2| |t#1| |t#2|))))) 
