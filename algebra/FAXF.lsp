
(DEFPARAMETER |FiniteAlgebraicExtensionField;CAT| 'NIL) 

(DECLAIM (NOTINLINE |FiniteAlgebraicExtensionField;|)) 

(DEFPARAMETER |FiniteAlgebraicExtensionField;AL| 'NIL) 

(DEFUN |FiniteAlgebraicExtensionField| (#1=#:G698)
  (LET (#2=#:G699)
    (COND
     ((SETQ #2#
              (|assoc| #3=(|devaluate| #1#)
                       |FiniteAlgebraicExtensionField;AL|))
      (CDR #2#))
     (T
      (SETQ |FiniteAlgebraicExtensionField;AL|
              (|cons5|
               (CONS #3# (SETQ #2# (|FiniteAlgebraicExtensionField;| #1#)))
               |FiniteAlgebraicExtensionField;AL|))
      #2#)))) 

(DEFUN |FiniteAlgebraicExtensionField;| (|t#1|)
  (SPROG ((#1=#:G697 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|FiniteAlgebraicExtensionField;CAT|)
                                    ('T
                                     (LETT |FiniteAlgebraicExtensionField;CAT|
                                           (|Join| (|ExtensionField| '|t#1|)
                                                   (|RetractableTo| '|t#1|)
                                                   (|mkCategory|
                                                    '(((|basis| ((|Vector| $)))
                                                       T)
                                                      ((|basis|
                                                        ((|Vector| $)
                                                         (|PositiveInteger|)))
                                                       T)
                                                      ((|coordinates|
                                                        ((|Vector| |t#1|) $))
                                                       T)
                                                      ((|coordinates|
                                                        ((|Matrix| |t#1|)
                                                         (|Vector| $)))
                                                       T)
                                                      ((|represents|
                                                        ($ (|Vector| |t#1|)))
                                                       T)
                                                      ((|minimalPolynomial|
                                                        ((|SparseUnivariatePolynomial|
                                                          |t#1|)
                                                         $))
                                                       T)
                                                      ((|definingPolynomial|
                                                        ((|SparseUnivariatePolynomial|
                                                          |t#1|)))
                                                       T)
                                                      ((|extensionDegree|
                                                        ((|PositiveInteger|)))
                                                       T)
                                                      ((|degree|
                                                        ((|PositiveInteger|)
                                                         $))
                                                       T)
                                                      ((|norm| (|t#1| $)) T)
                                                      ((|trace| (|t#1| $)) T)
                                                      ((|minimalPolynomial|
                                                        ((|SparseUnivariatePolynomial|
                                                          $)
                                                         $
                                                         (|PositiveInteger|)))
                                                       (|has| |t#1|
                                                              (|Finite|)))
                                                      ((|norm|
                                                        ($ $
                                                         (|PositiveInteger|)))
                                                       (|has| |t#1|
                                                              (|Finite|)))
                                                      ((|trace|
                                                        ($ $
                                                         (|PositiveInteger|)))
                                                       (|has| |t#1|
                                                              (|Finite|)))
                                                      ((|createNormalElement|
                                                        ($))
                                                       (|has| |t#1|
                                                              (|Finite|)))
                                                      ((|normalElement| ($))
                                                       (|has| |t#1|
                                                              (|Finite|)))
                                                      ((|normal?|
                                                        ((|Boolean|) $))
                                                       (|has| |t#1|
                                                              (|Finite|)))
                                                      ((|generator| ($))
                                                       (|has| |t#1|
                                                              (|Finite|)))
                                                      ((|linearAssociatedExp|
                                                        ($ $
                                                         (|SparseUnivariatePolynomial|
                                                          |t#1|)))
                                                       (|has| |t#1|
                                                              (|Finite|)))
                                                      ((|linearAssociatedOrder|
                                                        ((|SparseUnivariatePolynomial|
                                                          |t#1|)
                                                         $))
                                                       (|has| |t#1|
                                                              (|Finite|)))
                                                      ((|linearAssociatedLog|
                                                        ((|SparseUnivariatePolynomial|
                                                          |t#1|)
                                                         $))
                                                       (|has| |t#1|
                                                              (|Finite|)))
                                                      ((|linearAssociatedLog|
                                                        ((|Union|
                                                          (|SparseUnivariatePolynomial|
                                                           |t#1|)
                                                          "failed")
                                                         $ $))
                                                       (|has| |t#1|
                                                              (|Finite|))))
                                                    '(((|FiniteFieldCategory|)
                                                       (|has| |t#1|
                                                              (|Finite|))))
                                                    '((|SparseUnivariatePolynomial|
                                                       |t#1|)
                                                      (|Boolean|)
                                                      (|PositiveInteger|)
                                                      (|SparseUnivariatePolynomial|
                                                       $)
                                                      (|Vector| |t#1|)
                                                      (|Matrix| |t#1|)
                                                      (|Vector| $))
                                                    NIL))
                                           . #2=(|FiniteAlgebraicExtensionField|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|FiniteAlgebraicExtensionField|
                         (|devaluate| |t#1|)))))) 
