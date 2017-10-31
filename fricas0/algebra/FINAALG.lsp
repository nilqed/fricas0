
(DEFPARAMETER |FiniteRankNonAssociativeAlgebra;CAT| 'NIL) 

(DECLAIM (NOTINLINE |FiniteRankNonAssociativeAlgebra;|)) 

(DEFPARAMETER |FiniteRankNonAssociativeAlgebra;AL| 'NIL) 

(DEFUN |FiniteRankNonAssociativeAlgebra| (#1=#:G712)
  (LET (#2=#:G713)
    (COND
     ((SETQ #2#
              (|assoc| #3=(|devaluate| #1#)
                       |FiniteRankNonAssociativeAlgebra;AL|))
      (CDR #2#))
     (T
      (SETQ |FiniteRankNonAssociativeAlgebra;AL|
              (|cons5|
               (CONS #3# (SETQ #2# (|FiniteRankNonAssociativeAlgebra;| #1#)))
               |FiniteRankNonAssociativeAlgebra;AL|))
      #2#)))) 

(DEFUN |FiniteRankNonAssociativeAlgebra;| (|t#1|)
  (SPROG ((#1=#:G711 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|FiniteRankNonAssociativeAlgebra;CAT|)
                                    ('T
                                     (LETT
                                      |FiniteRankNonAssociativeAlgebra;CAT|
                                      (|Join| (|NonAssociativeAlgebra| '|t#1|)
                                              (|mkCategory|
                                               '(((|someBasis| ((|Vector| $)))
                                                  T)
                                                 ((|rank|
                                                   ((|PositiveInteger|)))
                                                  T)
                                                 ((|conditionsForIdempotents|
                                                   ((|List|
                                                     (|Polynomial| |t#1|))
                                                    (|Vector| $)))
                                                  T)
                                                 ((|structuralConstants|
                                                   ((|Vector| (|Matrix| |t#1|))
                                                    (|Vector| $)))
                                                  T)
                                                 ((|leftRegularRepresentation|
                                                   ((|Matrix| |t#1|) $
                                                    (|Vector| $)))
                                                  T)
                                                 ((|rightRegularRepresentation|
                                                   ((|Matrix| |t#1|) $
                                                    (|Vector| $)))
                                                  T)
                                                 ((|leftTrace| (|t#1| $)) T)
                                                 ((|rightTrace| (|t#1| $)) T)
                                                 ((|leftNorm| (|t#1| $)) T)
                                                 ((|rightNorm| (|t#1| $)) T)
                                                 ((|coordinates|
                                                   ((|Vector| |t#1|) $
                                                    (|Vector| $)))
                                                  T)
                                                 ((|coordinates|
                                                   ((|Matrix| |t#1|)
                                                    (|Vector| $) (|Vector| $)))
                                                  T)
                                                 ((|represents|
                                                   ($ (|Vector| |t#1|)
                                                    (|Vector| $)))
                                                  T)
                                                 ((|leftDiscriminant|
                                                   (|t#1| (|Vector| $)))
                                                  T)
                                                 ((|rightDiscriminant|
                                                   (|t#1| (|Vector| $)))
                                                  T)
                                                 ((|leftTraceMatrix|
                                                   ((|Matrix| |t#1|)
                                                    (|Vector| $)))
                                                  T)
                                                 ((|rightTraceMatrix|
                                                   ((|Matrix| |t#1|)
                                                    (|Vector| $)))
                                                  T)
                                                 ((|leftCharacteristicPolynomial|
                                                   ((|SparseUnivariatePolynomial|
                                                     |t#1|)
                                                    $))
                                                  T)
                                                 ((|rightCharacteristicPolynomial|
                                                   ((|SparseUnivariatePolynomial|
                                                     |t#1|)
                                                    $))
                                                  T)
                                                 ((|commutative?|
                                                   ((|Boolean|)))
                                                  T)
                                                 ((|antiCommutative?|
                                                   ((|Boolean|)))
                                                  T)
                                                 ((|associative?|
                                                   ((|Boolean|)))
                                                  T)
                                                 ((|antiAssociative?|
                                                   ((|Boolean|)))
                                                  T)
                                                 ((|leftAlternative?|
                                                   ((|Boolean|)))
                                                  T)
                                                 ((|rightAlternative?|
                                                   ((|Boolean|)))
                                                  T)
                                                 ((|flexible?| ((|Boolean|)))
                                                  T)
                                                 ((|alternative?|
                                                   ((|Boolean|)))
                                                  T)
                                                 ((|powerAssociative?|
                                                   ((|Boolean|)))
                                                  T)
                                                 ((|jacobiIdentity?|
                                                   ((|Boolean|)))
                                                  T)
                                                 ((|lieAdmissible?|
                                                   ((|Boolean|)))
                                                  T)
                                                 ((|jordanAdmissible?|
                                                   ((|Boolean|)))
                                                  T)
                                                 ((|noncommutativeJordanAlgebra?|
                                                   ((|Boolean|)))
                                                  T)
                                                 ((|jordanAlgebra?|
                                                   ((|Boolean|)))
                                                  T)
                                                 ((|lieAlgebra?| ((|Boolean|)))
                                                  T)
                                                 ((|recip|
                                                   ((|Union| $ "failed") $))
                                                  (|has| |t#1|
                                                         (|IntegralDomain|)))
                                                 ((|leftRecip|
                                                   ((|Union| $ "failed") $))
                                                  (|has| |t#1|
                                                         (|IntegralDomain|)))
                                                 ((|rightRecip|
                                                   ((|Union| $ "failed") $))
                                                  (|has| |t#1|
                                                         (|IntegralDomain|)))
                                                 ((|associatorDependence|
                                                   ((|List| (|Vector| |t#1|))))
                                                  (|has| |t#1|
                                                         (|IntegralDomain|)))
                                                 ((|leftMinimalPolynomial|
                                                   ((|SparseUnivariatePolynomial|
                                                     |t#1|)
                                                    $))
                                                  (|has| |t#1|
                                                         (|IntegralDomain|)))
                                                 ((|rightMinimalPolynomial|
                                                   ((|SparseUnivariatePolynomial|
                                                     |t#1|)
                                                    $))
                                                  (|has| |t#1|
                                                         (|IntegralDomain|)))
                                                 ((|leftUnits|
                                                   ((|Union|
                                                     (|Record|
                                                      (|:| |particular| $)
                                                      (|:| |basis| (|List| $)))
                                                     "failed")))
                                                  (|has| |t#1|
                                                         (|IntegralDomain|)))
                                                 ((|rightUnits|
                                                   ((|Union|
                                                     (|Record|
                                                      (|:| |particular| $)
                                                      (|:| |basis| (|List| $)))
                                                     "failed")))
                                                  (|has| |t#1|
                                                         (|IntegralDomain|)))
                                                 ((|leftUnit|
                                                   ((|Union| $ "failed")))
                                                  (|has| |t#1|
                                                         (|IntegralDomain|)))
                                                 ((|rightUnit|
                                                   ((|Union| $ "failed")))
                                                  (|has| |t#1|
                                                         (|IntegralDomain|)))
                                                 ((|unit|
                                                   ((|Union| $ "failed")))
                                                  (|has| |t#1|
                                                         (|IntegralDomain|))))
                                               '(((|unitsKnown|)
                                                  (|has| |t#1|
                                                         (|IntegralDomain|))))
                                               '((|SparseUnivariatePolynomial|
                                                  |t#1|)
                                                 (|List| (|Vector| |t#1|))
                                                 (|Boolean|) (|Matrix| |t#1|)
                                                 (|Vector| $) (|Vector| |t#1|)
                                                 (|Vector| (|Matrix| |t#1|))
                                                 (|List| (|Polynomial| |t#1|))
                                                 (|PositiveInteger|))
                                               NIL))
                                      . #2=(|FiniteRankNonAssociativeAlgebra|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|FiniteRankNonAssociativeAlgebra|
                         (|devaluate| |t#1|)))))) 
