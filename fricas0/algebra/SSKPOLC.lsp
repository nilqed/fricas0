
(DEFPARAMETER |SolvableSkewPolynomialCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |SolvableSkewPolynomialCategory;|)) 

(DEFPARAMETER |SolvableSkewPolynomialCategory;AL| 'NIL) 

(DEFUN |SolvableSkewPolynomialCategory| (&REST #1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2#
              (|assoc| #3=(|devaluateList| #1#)
                       |SolvableSkewPolynomialCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |SolvableSkewPolynomialCategory;AL|
              (|cons5|
               (CONS #3#
                     (SETQ #2#
                             (APPLY #'|SolvableSkewPolynomialCategory;| #1#)))
               |SolvableSkewPolynomialCategory;AL|))
      #2#)))) 

(DEFUN |SolvableSkewPolynomialCategory;| (|t#1| |t#2| |t#3|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2| |t#3|)
                          (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)
                                (|devaluate| |t#3|)))
                    (COND (|SolvableSkewPolynomialCategory;CAT|)
                          ('T
                           (LETT |SolvableSkewPolynomialCategory;CAT|
                                 (|Join| (|Ring|) (|LeftModule| '|t#1|)
                                         (|mkCategory|
                                          '(((|leadingCoefficient| (|t#1| $))
                                             T)
                                            ((|leadingMonomial| ($ $)) T)
                                            ((|degree| (|t#2| $)) T)
                                            ((|reductum| ($ $)) T)
                                            ((|monomial| ($ |t#1| |t#2|)) T))
                                          NIL 'NIL NIL))
                                 . #2=(|SolvableSkewPolynomialCategory|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|SolvableSkewPolynomialCategory| (|devaluate| |t#1|)
                         (|devaluate| |t#2|) (|devaluate| |t#3|)))))) 
