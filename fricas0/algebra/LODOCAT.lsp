
(DEFPARAMETER |LinearOrdinaryDifferentialOperatorCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |LinearOrdinaryDifferentialOperatorCategory;|)) 

(DEFPARAMETER |LinearOrdinaryDifferentialOperatorCategory;AL| 'NIL) 

(DEFUN |LinearOrdinaryDifferentialOperatorCategory| (#1=#:G692)
  (LET (#2=#:G693)
    (COND
     ((SETQ #2#
              (|assoc| #3=(|devaluate| #1#)
                       |LinearOrdinaryDifferentialOperatorCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |LinearOrdinaryDifferentialOperatorCategory;AL|
              (|cons5|
               (CONS #3#
                     (SETQ #2#
                             (|LinearOrdinaryDifferentialOperatorCategory;|
                              #1#)))
               |LinearOrdinaryDifferentialOperatorCategory;AL|))
      #2#)))) 

(DEFUN |LinearOrdinaryDifferentialOperatorCategory;| (|t#1|)
  (SPROG ((#1=#:G691 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND
                               (|LinearOrdinaryDifferentialOperatorCategory;CAT|)
                               ('T
                                (LETT
                                 |LinearOrdinaryDifferentialOperatorCategory;CAT|
                                 (|Join|
                                  (|UnivariateSkewPolynomialCategory| '|t#1|)
                                  (|Eltable| '|t#1| '|t#1|)
                                  (|mkCategory|
                                   '(((D ($)) T) ((|adjoint| ($ $)) T)
                                     ((|symmetricProduct| ($ $ $))
                                      (|has| |t#1| (|Field|)))
                                     ((|symmetricPower|
                                       ($ $ (|NonNegativeInteger|)))
                                      (|has| |t#1| (|Field|)))
                                     ((|symmetricSquare| ($ $))
                                      (|has| |t#1| (|Field|)))
                                     ((|directSum| ($ $ $))
                                      (|has| |t#1| (|Field|))))
                                   NIL '((|NonNegativeInteger|)) NIL))
                                 . #2=(|LinearOrdinaryDifferentialOperatorCategory|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|LinearOrdinaryDifferentialOperatorCategory|
                         (|devaluate| |t#1|)))))) 
