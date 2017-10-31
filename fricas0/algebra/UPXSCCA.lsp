
(DEFPARAMETER |UnivariatePuiseuxSeriesConstructorCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |UnivariatePuiseuxSeriesConstructorCategory;|)) 

(DEFPARAMETER |UnivariatePuiseuxSeriesConstructorCategory;AL| 'NIL) 

(DEFUN |UnivariatePuiseuxSeriesConstructorCategory| (&REST #1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2#
              (|assoc| #3=(|devaluateList| #1#)
                       |UnivariatePuiseuxSeriesConstructorCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |UnivariatePuiseuxSeriesConstructorCategory;AL|
              (|cons5|
               (CONS #3#
                     (SETQ #2#
                             (APPLY
                              #'|UnivariatePuiseuxSeriesConstructorCategory;|
                              #1#)))
               |UnivariatePuiseuxSeriesConstructorCategory;AL|))
      #2#)))) 

(DEFUN |UnivariatePuiseuxSeriesConstructorCategory;| (|t#1| |t#2|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2|)
                          (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)))
                    (COND (|UnivariatePuiseuxSeriesConstructorCategory;CAT|)
                          ('T
                           (LETT
                            |UnivariatePuiseuxSeriesConstructorCategory;CAT|
                            (|Join| (|UnivariatePuiseuxSeriesCategory| '|t#1|)
                                    (|RetractableTo| '|t#2|)
                                    (|mkCategory|
                                     '(((|puiseux|
                                         ($ (|Fraction| (|Integer|)) |t#2|))
                                        T)
                                       ((|rationalPower|
                                         ((|Fraction| (|Integer|)) $))
                                        T)
                                       ((|laurentRep| (|t#2| $)) T)
                                       ((|degree| ((|Fraction| (|Integer|)) $))
                                        T)
                                       ((|coerce| ($ |t#2|)) T)
                                       ((|laurent| (|t#2| $)) T)
                                       ((|laurentIfCan|
                                         ((|Union| |t#2| "failed") $))
                                        T))
                                     NIL '((|Fraction| (|Integer|))) NIL))
                            . #2=(|UnivariatePuiseuxSeriesConstructorCategory|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|UnivariatePuiseuxSeriesConstructorCategory|
                         (|devaluate| |t#1|) (|devaluate| |t#2|)))))) 
