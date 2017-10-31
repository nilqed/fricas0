
(DEFPARAMETER |XPolynomialsCat;CAT| 'NIL) 

(DECLAIM (NOTINLINE |XPolynomialsCat;|)) 

(DEFPARAMETER |XPolynomialsCat;AL| 'NIL) 

(DEFUN |XPolynomialsCat| (&REST #1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluateList| #1#) |XPolynomialsCat;AL|))
      (CDR #2#))
     (T
      (SETQ |XPolynomialsCat;AL|
              (|cons5| (CONS #3# (SETQ #2# (APPLY #'|XPolynomialsCat;| #1#)))
                       |XPolynomialsCat;AL|))
      #2#)))) 

(DEFUN |XPolynomialsCat;| (|t#1| |t#2|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2|)
                          (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)))
                    (COND (|XPolynomialsCat;CAT|)
                          ('T
                           (LETT |XPolynomialsCat;CAT|
                                 (|Join| (|XFreeAlgebra| '|t#1| '|t#2|)
                                         (|mkCategory|
                                          '(((|maxdeg|
                                              ((|FreeMonoid| |t#1|) $))
                                             T)
                                            ((|degree|
                                              ((|NonNegativeInteger|) $))
                                             T)
                                            ((|trunc|
                                              ($ $ (|NonNegativeInteger|)))
                                             T))
                                          NIL
                                          '((|NonNegativeInteger|)
                                            (|FreeMonoid| |t#1|))
                                          NIL))
                                 . #2=(|XPolynomialsCat|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|XPolynomialsCat| (|devaluate| |t#1|)
                         (|devaluate| |t#2|)))))) 
