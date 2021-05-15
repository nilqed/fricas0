
(DEFPARAMETER |SolvableSkewPolynomialCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |SolvableSkewPolynomialCategory;|)) 

(DEFPARAMETER |SolvableSkewPolynomialCategory;AL| 'NIL) 

(DEFUN |SolvableSkewPolynomialCategory| (|t#1| |t#2|)
  (LET (#1=#:G379 (#2=#:G380 (LIST (|devaluate| |t#1|) (|devaluate| |t#2|))))
    (COND
     ((SETQ #1# (|assoc| #2# |SolvableSkewPolynomialCategory;AL|)) (CDR #1#))
     (T
      (SETQ |SolvableSkewPolynomialCategory;AL|
              (|cons5|
               (CONS #2#
                     (SETQ #1#
                             (APPLY #'|SolvableSkewPolynomialCategory;| #2#)))
               |SolvableSkewPolynomialCategory;AL|))
      #1#)))) 

(DEFUN |SolvableSkewPolynomialCategory;| (|t#1| |t#2|)
  (SPROG ((#1=#:G378 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (MAKE_PAIRS '(|t#1| |t#2|) (LIST |t#1| |t#2|))
                              (COND (|SolvableSkewPolynomialCategory;CAT|)
                                    ('T
                                     (LETT |SolvableSkewPolynomialCategory;CAT|
                                           (|Join| (|Ring|)
                                                   (|LeftModule| '|t#1|)
                                                   (|mkCategory|
                                                    '(((|leadingCoefficient|
                                                        (|t#1| $))
                                                       T)
                                                      ((|leadingMonomial|
                                                        ($ $))
                                                       T)
                                                      ((|degree| (|t#2| $)) T)
                                                      ((|reductum| ($ $)) T)
                                                      ((|monomial|
                                                        ($ |t#1| |t#2|))
                                                       T))
                                                    NIL NIL NIL)))))))
           (SETELT #1# 0
                   (LIST '|SolvableSkewPolynomialCategory| |t#1| |t#2|))))) 
