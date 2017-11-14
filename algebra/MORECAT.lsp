
(DEFPARAMETER |MultivariateSkewPolynomialCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |MultivariateSkewPolynomialCategory;|)) 

(DEFPARAMETER |MultivariateSkewPolynomialCategory;AL| 'NIL) 

(DEFUN |MultivariateSkewPolynomialCategory| (&REST #1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2#
              (|assoc| #3=(|devaluateList| #1#)
                       |MultivariateSkewPolynomialCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |MultivariateSkewPolynomialCategory;AL|
              (|cons5|
               (CONS #3#
                     (SETQ #2#
                             (APPLY #'|MultivariateSkewPolynomialCategory;|
                                    #1#)))
               |MultivariateSkewPolynomialCategory;AL|))
      #2#)))) 

(DEFUN |MultivariateSkewPolynomialCategory;| (|t#1| |t#2| |t#3|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2| |t#3|)
                          (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)
                                (|devaluate| |t#3|)))
                    (COND (|MultivariateSkewPolynomialCategory;CAT|)
                          ('T
                           (LETT |MultivariateSkewPolynomialCategory;CAT|
                                 (|Join|
                                  (|MaybeSkewPolynomialCategory| '|t#1| '|t#2|
                                                                 '|t#3|))
                                 . #2=(|MultivariateSkewPolynomialCategory|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|MultivariateSkewPolynomialCategory|
                         (|devaluate| |t#1|) (|devaluate| |t#2|)
                         (|devaluate| |t#3|)))))) 
