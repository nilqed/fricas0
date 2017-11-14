
(DEFPARAMETER |FiniteDivisorCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |FiniteDivisorCategory;|)) 

(DEFPARAMETER |FiniteDivisorCategory;AL| 'NIL) 

(DEFUN |FiniteDivisorCategory| (&REST #1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluateList| #1#) |FiniteDivisorCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |FiniteDivisorCategory;AL|
              (|cons5|
               (CONS #3# (SETQ #2# (APPLY #'|FiniteDivisorCategory;| #1#)))
               |FiniteDivisorCategory;AL|))
      #2#)))) 

(DEFUN |FiniteDivisorCategory;| (|t#1| |t#2| |t#3| |t#4|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2| |t#3| |t#4|)
                          (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)
                                (|devaluate| |t#3|) (|devaluate| |t#4|)))
                    (COND (|FiniteDivisorCategory;CAT|)
                          ('T
                           (LETT |FiniteDivisorCategory;CAT|
                                 (|Join| (|AbelianGroup|)
                                         (|mkCategory|
                                          '(((|ideal|
                                              ((|FractionalIdeal| |t#2|
                                                                  (|Fraction|
                                                                   |t#2|)
                                                                  |t#3| |t#4|)
                                               $))
                                             T)
                                            ((|divisor|
                                              ($
                                               (|FractionalIdeal| |t#2|
                                                                  (|Fraction|
                                                                   |t#2|)
                                                                  |t#3|
                                                                  |t#4|)))
                                             T)
                                            ((|divisor| ($ |t#4|)) T)
                                            ((|divisor| ($ |t#1| |t#1|)) T)
                                            ((|divisor|
                                              ($ |t#1| |t#1| (|Integer|)))
                                             T)
                                            ((|decompose|
                                              ((|Record|
                                                (|:| |id|
                                                     (|FractionalIdeal| |t#2|
                                                                        (|Fraction|
                                                                         |t#2|)
                                                                        |t#3|
                                                                        |t#4|))
                                                (|:| |principalPart| |t#4|))
                                               $))
                                             T)
                                            ((|reduce| ($ $)) T)
                                            ((|principal?| ((|Boolean|) $)) T)
                                            ((|generator|
                                              ((|Union| |t#4| "failed") $))
                                             T)
                                            ((|divisor|
                                              ($ |t#4| |t#2| |t#2| |t#2|
                                               |t#1|))
                                             T))
                                          NIL
                                          '((|Boolean|) (|Integer|)
                                            (|FractionalIdeal| |t#2|
                                                               (|Fraction|
                                                                |t#2|)
                                                               |t#3| |t#4|))
                                          NIL))
                                 . #2=(|FiniteDivisorCategory|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|FiniteDivisorCategory| (|devaluate| |t#1|)
                         (|devaluate| |t#2|) (|devaluate| |t#3|)
                         (|devaluate| |t#4|)))))) 
