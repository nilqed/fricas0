
(DEFPARAMETER |PAdicIntegerCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |PAdicIntegerCategory;|)) 

(DEFPARAMETER |PAdicIntegerCategory;AL| 'NIL) 

(DEFUN |PAdicIntegerCategory| (#1=#:G693)
  (LET (#2=#:G694)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |PAdicIntegerCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |PAdicIntegerCategory;AL|
              (|cons5| (CONS #3# (SETQ #2# (|PAdicIntegerCategory;| #1#)))
                       |PAdicIntegerCategory;AL|))
      #2#)))) 

(DEFUN |PAdicIntegerCategory;| (|t#1|)
  (SPROG ((#1=#:G692 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|PAdicIntegerCategory;CAT|)
                                    ('T
                                     (LETT |PAdicIntegerCategory;CAT|
                                           (|Join| (|EuclideanDomain|)
                                                   (|CharacteristicZero|)
                                                   (|mkCategory|
                                                    '(((|digits|
                                                        ((|Stream| (|Integer|))
                                                         $))
                                                       T)
                                                      ((|order|
                                                        ((|NonNegativeInteger|)
                                                         $))
                                                       T)
                                                      ((|extend|
                                                        ($ $ (|Integer|)))
                                                       T)
                                                      ((|complete| ($ $)) T)
                                                      ((|modulus|
                                                        ((|Integer|)))
                                                       T)
                                                      ((|moduloP|
                                                        ((|Integer|) $))
                                                       T)
                                                      ((|quotientByP| ($ $)) T)
                                                      ((|approximate|
                                                        ((|Integer|) $
                                                         (|Integer|)))
                                                       T)
                                                      ((|sqrt|
                                                        ($ $ (|Integer|)))
                                                       T)
                                                      ((|root|
                                                        ($
                                                         (|SparseUnivariatePolynomial|
                                                          (|Integer|))
                                                         (|Integer|)))
                                                       T))
                                                    NIL
                                                    '((|SparseUnivariatePolynomial|
                                                       (|Integer|))
                                                      (|Integer|)
                                                      (|NonNegativeInteger|)
                                                      (|Stream| (|Integer|)))
                                                    NIL))
                                           . #2=(|PAdicIntegerCategory|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|PAdicIntegerCategory| (|devaluate| |t#1|)))))) 
