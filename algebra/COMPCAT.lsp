
(DEFPARAMETER |ComplexCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |ComplexCategory;|)) 

(DEFPARAMETER |ComplexCategory;AL| 'NIL) 

(DEFUN |ComplexCategory| (#1=#:G736)
  (LET (#2=#:G737)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |ComplexCategory;AL|)) (CDR #2#))
     (T
      (SETQ |ComplexCategory;AL|
              (|cons5| (CONS #3# (SETQ #2# (|ComplexCategory;| #1#)))
                       |ComplexCategory;AL|))
      #2#)))) 

(DEFUN |ComplexCategory;| (|t#1|)
  (SPROG ((#1=#:G735 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (|sublisV|
                               (PAIR '(#2=#:G734)
                                     (LIST
                                      '(|SparseUnivariatePolynomial| |t#1|)))
                               (COND (|ComplexCategory;CAT|)
                                     ('T
                                      (LETT |ComplexCategory;CAT|
                                            (|Join|
                                             (|MonogenicAlgebra| '|t#1| '#2#)
                                             (|FullyRetractableTo| '|t#1|)
                                             (|DifferentialExtension| '|t#1|)
                                             (|FullyEvalableOver| '|t#1|)
                                             (|FullyPatternMatchable| '|t#1|)
                                             (|Patternable| '|t#1|)
                                             (|FullyLinearlyExplicitOver|
                                              '|t#1|)
                                             (|CommutativeRing|)
                                             (|mkCategory|
                                              '(((|imaginary| ($)) T)
                                                ((|conjugate| ($ $)) T)
                                                ((|complex| ($ |t#1| |t#1|)) T)
                                                ((|imag| (|t#1| $)) T)
                                                ((|real| (|t#1| $)) T)
                                                ((|norm| (|t#1| $)) T)
                                                ((|exquo|
                                                  ((|Union| $ "failed") $
                                                   |t#1|))
                                                 (|has| |t#1|
                                                        (|IntegralDomain|)))
                                                ((|abs| ($ $))
                                                 (|has| |t#1|
                                                        (|RealNumberSystem|)))
                                                ((|argument| (|t#1| $))
                                                 (|has| |t#1|
                                                        (|TranscendentalFunctionCategory|)))
                                                ((|polarCoordinates|
                                                  ((|Record| (|:| |r| |t#1|)
                                                             (|:| |phi| |t#1|))
                                                   $))
                                                 (AND
                                                  (|has| |t#1|
                                                         (|RealNumberSystem|))
                                                  (|has| |t#1|
                                                         (|TranscendentalFunctionCategory|))))
                                                ((|rational?| ((|Boolean|) $))
                                                 (|has| |t#1|
                                                        (|IntegerNumberSystem|)))
                                                ((|rational|
                                                  ((|Fraction| (|Integer|)) $))
                                                 (|has| |t#1|
                                                        (|IntegerNumberSystem|)))
                                                ((|rationalIfCan|
                                                  ((|Union|
                                                    (|Fraction| (|Integer|))
                                                    "failed")
                                                   $))
                                                 (|has| |t#1|
                                                        (|IntegerNumberSystem|))))
                                              '(((|Comparable|)
                                                 (|has| |t#1| (|Comparable|)))
                                                ((|IntegralDomain|)
                                                 (|has| |t#1|
                                                        (|IntegralDomain|)))
                                                ((|EuclideanDomain|)
                                                 (|has| |t#1|
                                                        (|EuclideanDomain|)))
                                                ((|multiplicativeValuation|)
                                                 (|has| |t#1|
                                                        (|multiplicativeValuation|)))
                                                ((|additiveValuation|)
                                                 (|has| |t#1|
                                                        (|additiveValuation|)))
                                                ((|Field|)
                                                 (|has| |t#1| (|Field|)))
                                                ((|ConvertibleTo|
                                                  (|InputForm|))
                                                 (|has| |t#1|
                                                        (|ConvertibleTo|
                                                         (|InputForm|))))
                                                ((|CharacteristicZero|)
                                                 (|has| |t#1|
                                                        (|CharacteristicZero|)))
                                                ((|CharacteristicNonZero|)
                                                 (|has| |t#1|
                                                        (|CharacteristicNonZero|)))
                                                ((|ConvertibleTo|
                                                  (|Complex| (|DoubleFloat|)))
                                                 (|has| |t#1|
                                                        (|RealConstant|)))
                                                ((|ConvertibleTo|
                                                  (|Complex| (|Float|)))
                                                 (|has| |t#1|
                                                        (|RealConstant|)))
                                                ((|arbitraryPrecision|)
                                                 (|has| |t#1|
                                                        (|arbitraryPrecision|)))
                                                ((|TranscendentalFunctionCategory|)
                                                 (|has| |t#1|
                                                        (|TranscendentalFunctionCategory|)))
                                                ((|RadicalCategory|)
                                                 (AND
                                                  (|has| |t#1|
                                                         (|RadicalCategory|))
                                                  (|has| |t#1|
                                                         (|TranscendentalFunctionCategory|))))
                                                ((|UniqueFactorizationDomain|)
                                                 (|has| |t#1|
                                                        (|IntegerNumberSystem|)))
                                                ((|PolynomialFactorizationExplicit|)
                                                 (AND
                                                  (|has| |t#1|
                                                         (|EuclideanDomain|))
                                                  (|has| |t#1|
                                                         (|PolynomialFactorizationExplicit|)))))
                                              '((|Fraction| (|Integer|))
                                                (|Boolean|))
                                              NIL))
                                            . #3=(|ComplexCategory|))))))
                   . #3#)
           (SETELT #1# 0 (LIST '|ComplexCategory| (|devaluate| |t#1|)))))) 
