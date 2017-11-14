
(DEFPARAMETER |DistributionCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |DistributionCategory;|)) 

(DEFPARAMETER |DistributionCategory;AL| 'NIL) 

(DEFUN |DistributionCategory| (#1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |DistributionCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |DistributionCategory;AL|
              (|cons5| (CONS #3# (SETQ #2# (|DistributionCategory;| #1#)))
                       |DistributionCategory;AL|))
      #2#)))) 

(DEFUN |DistributionCategory;| (|t#1|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|DistributionCategory;CAT|)
                                    ('T
                                     (LETT |DistributionCategory;CAT|
                                           (|Join| (|SetCategory|)
                                                   (|mkCategory|
                                                    '(((|Zero| ($) |constant|)
                                                       T)
                                                      ((|moment|
                                                        (|t#1| $
                                                         (|NonNegativeInteger|)))
                                                       T)
                                                      ((|classicalCumulant|
                                                        (|t#1| $
                                                         (|PositiveInteger|)))
                                                       T)
                                                      ((|freeCumulant|
                                                        (|t#1| $
                                                         (|PositiveInteger|)))
                                                       T)
                                                      ((|booleanCumulant|
                                                        (|t#1| $
                                                         (|PositiveInteger|)))
                                                       T)
                                                      ((|moments|
                                                        ((|Sequence| |t#1|) $))
                                                       T)
                                                      ((|classicalCumulants|
                                                        ((|Sequence| |t#1|) $))
                                                       T)
                                                      ((|freeCumulants|
                                                        ((|Sequence| |t#1|) $))
                                                       T)
                                                      ((|booleanCumulants|
                                                        ((|Sequence| |t#1|) $))
                                                       T)
                                                      ((|hankelDeterminants|
                                                        ((|Stream| |t#1|) $))
                                                       T)
                                                      ((|monotoneCumulants|
                                                        ((|Sequence| |t#1|) $))
                                                       (|has| |t#1|
                                                              (|Algebra|
                                                               (|Fraction|
                                                                (|Integer|)))))
                                                      ((|jacobiParameters|
                                                        ((|Record|
                                                          (|:| |an|
                                                               (|Stream|
                                                                |t#1|))
                                                          (|:| |bn|
                                                               (|Stream|
                                                                |t#1|)))
                                                         $))
                                                       (|has| |t#1| (|Field|)))
                                                      ((|orthogonalPolynomials|
                                                        ((|Stream|
                                                          (|SparseUnivariatePolynomial|
                                                           |t#1|))
                                                         $))
                                                       (|has| |t#1| (|Field|)))
                                                      ((|jacobiParameters|
                                                        ((|Record|
                                                          (|:| |an|
                                                               (|Stream|
                                                                (|Fraction|
                                                                 |t#1|)))
                                                          (|:| |bn|
                                                               (|Stream|
                                                                (|Fraction|
                                                                 |t#1|))))
                                                         $))
                                                       (AND
                                                        (|has| |t#1|
                                                               (|IntegralDomain|))
                                                        (|not|
                                                         (|has| |t#1|
                                                                (|Field|)))))
                                                      ((|orthogonalPolynomials|
                                                        ((|Stream|
                                                          (|SparseUnivariatePolynomial|
                                                           (|Fraction| |t#1|)))
                                                         $))
                                                       (AND
                                                        (|has| |t#1|
                                                               (|IntegralDomain|))
                                                        (|not|
                                                         (|has| |t#1|
                                                                (|Field|)))))
                                                      ((|classicalConvolution|
                                                        ($ $ $))
                                                       T)
                                                      ((|freeConvolution|
                                                        ($ $ $))
                                                       T)
                                                      ((|booleanConvolution|
                                                        ($ $ $))
                                                       T)
                                                      ((|monotoneConvolution|
                                                        ($ $ $))
                                                       T)
                                                      ((^
                                                        ($ $
                                                         (|PositiveInteger|)))
                                                       T))
                                                    NIL
                                                    '((|PositiveInteger|)
                                                      (|Stream|
                                                       (|SparseUnivariatePolynomial|
                                                        (|Fraction| |t#1|)))
                                                      (|Stream|
                                                       (|SparseUnivariatePolynomial|
                                                        |t#1|))
                                                      (|Sequence| |t#1|)
                                                      (|Stream| |t#1|)
                                                      (|NonNegativeInteger|))
                                                    NIL))
                                           . #2=(|DistributionCategory|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|DistributionCategory| (|devaluate| |t#1|)))))) 
