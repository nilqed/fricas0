
(DEFPARAMETER |UnivariatePolynomialCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |UnivariatePolynomialCategory;|)) 

(DEFPARAMETER |UnivariatePolynomialCategory;AL| 'NIL) 

(DEFUN |UnivariatePolynomialCategory| (#1=#:G737)
  (LET (#2=#:G738)
    (COND
     ((SETQ #2#
              (|assoc| #3=(|devaluate| #1#) |UnivariatePolynomialCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |UnivariatePolynomialCategory;AL|
              (|cons5|
               (CONS #3# (SETQ #2# (|UnivariatePolynomialCategory;| #1#)))
               |UnivariatePolynomialCategory;AL|))
      #2#)))) 

(DEFUN |UnivariatePolynomialCategory;| (|t#1|)
  (SPROG ((#1=#:G736 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (|sublisV|
                               (PAIR '(#2=#:G734 #3=#:G735)
                                     (LIST '(|NonNegativeInteger|)
                                           '(|SingletonAsOrderedSet|)))
                               (COND (|UnivariatePolynomialCategory;CAT|)
                                     ('T
                                      (LETT |UnivariatePolynomialCategory;CAT|
                                            (|Join|
                                             (|PolynomialCategory| '|t#1| '#2#
                                                                   '#3#)
                                             (|Eltable| '|t#1| '|t#1|)
                                             (|Eltable| '$ '$)
                                             (|mkCategory|
                                              '(((|vectorise|
                                                  ((|Vector| |t#1|) $
                                                   (|NonNegativeInteger|)))
                                                 T)
                                                ((|unvectorise|
                                                  ($ (|Vector| |t#1|)))
                                                 T)
                                                ((|makeSUP|
                                                  ((|SparseUnivariatePolynomial|
                                                    |t#1|)
                                                   $))
                                                 T)
                                                ((|unmakeSUP|
                                                  ($
                                                   (|SparseUnivariatePolynomial|
                                                    |t#1|)))
                                                 T)
                                                ((|multiplyExponents|
                                                  ($ $ (|NonNegativeInteger|)))
                                                 T)
                                                ((|divideExponents|
                                                  ((|Union| $ "failed") $
                                                   (|NonNegativeInteger|)))
                                                 T)
                                                ((|shiftLeft|
                                                  ($ $ (|NonNegativeInteger|)))
                                                 T)
                                                ((|monicDivide|
                                                  ((|Record| (|:| |quotient| $)
                                                             (|:| |remainder|
                                                                  $))
                                                   $ $))
                                                 (|has| |t#1| (|Ring|)))
                                                ((|karatsubaDivide|
                                                  ((|Record| (|:| |quotient| $)
                                                             (|:| |remainder|
                                                                  $))
                                                   $ (|NonNegativeInteger|)))
                                                 (|has| |t#1| (|Ring|)))
                                                ((|shiftRight|
                                                  ($ $ (|NonNegativeInteger|)))
                                                 (|has| |t#1| (|Ring|)))
                                                ((|pseudoRemainder| ($ $ $))
                                                 (|has| |t#1| (|Ring|)))
                                                ((|differentiate|
                                                  ($ $ (|Mapping| |t#1| |t#1|)
                                                   $))
                                                 (|has| |t#1| (|Ring|)))
                                                ((|discriminant| (|t#1| $))
                                                 (|has| |t#1|
                                                        (|CommutativeRing|)))
                                                ((|resultant| (|t#1| $ $))
                                                 (|has| |t#1|
                                                        (|CommutativeRing|)))
                                                ((|elt|
                                                  ((|Fraction| $)
                                                   (|Fraction| $)
                                                   (|Fraction| $)))
                                                 (|has| |t#1|
                                                        (|IntegralDomain|)))
                                                ((|order|
                                                  ((|NonNegativeInteger|) $ $))
                                                 (|has| |t#1|
                                                        (|IntegralDomain|)))
                                                ((|subResultantGcd| ($ $ $))
                                                 (|has| |t#1|
                                                        (|IntegralDomain|)))
                                                ((|composite|
                                                  ((|Union| $ "failed") $ $))
                                                 (|has| |t#1|
                                                        (|IntegralDomain|)))
                                                ((|composite|
                                                  ((|Union| (|Fraction| $)
                                                            "failed")
                                                   (|Fraction| $) $))
                                                 (|has| |t#1|
                                                        (|IntegralDomain|)))
                                                ((|pseudoQuotient| ($ $ $))
                                                 (|has| |t#1|
                                                        (|IntegralDomain|)))
                                                ((|pseudoDivide|
                                                  ((|Record| (|:| |coef| |t#1|)
                                                             (|:| |quotient| $)
                                                             (|:| |remainder|
                                                                  $))
                                                   $ $))
                                                 (|has| |t#1|
                                                        (|IntegralDomain|)))
                                                ((|separate|
                                                  ((|Record|
                                                    (|:| |primePart| $)
                                                    (|:| |commonPart| $))
                                                   $ $))
                                                 (|has| |t#1| (|GcdDomain|)))
                                                ((|elt|
                                                  (|t#1| (|Fraction| $) |t#1|))
                                                 (|has| |t#1| (|Field|)))
                                                ((|integrate| ($ $))
                                                 (|has| |t#1|
                                                        (|Algebra|
                                                         (|Fraction|
                                                          (|Integer|))))))
                                              '(((|DifferentialRing|)
                                                 (|has| |t#1| (|Ring|)))
                                                ((|DifferentialExtension|
                                                  |t#1|)
                                                 (|has| |t#1| (|Ring|)))
                                                ((|StepThrough|)
                                                 (|has| |t#1| (|StepThrough|)))
                                                ((|Eltable| (|Fraction| $)
                                                            (|Fraction| $))
                                                 (|has| |t#1|
                                                        (|IntegralDomain|)))
                                                ((|EuclideanDomain|)
                                                 (|has| |t#1| (|Field|)))
                                                ((|additiveValuation|)
                                                 (|has| |t#1| (|Field|))))
                                              '((|Fraction| $)
                                                (|NonNegativeInteger|)
                                                (|SparseUnivariatePolynomial|
                                                 |t#1|)
                                                (|Vector| |t#1|))
                                              NIL))
                                            . #4=(|UnivariatePolynomialCategory|))))))
                   . #4#)
           (SETELT #1# 0
                   (LIST '|UnivariatePolynomialCategory|
                         (|devaluate| |t#1|)))))) 
