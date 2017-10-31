
(DEFPARAMETER |PowerSeriesCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |PowerSeriesCategory;|)) 

(DEFPARAMETER |PowerSeriesCategory;AL| 'NIL) 

(DEFUN |PowerSeriesCategory| (&REST #1=#:G696)
  (LET (#2=#:G697)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluateList| #1#) |PowerSeriesCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |PowerSeriesCategory;AL|
              (|cons5|
               (CONS #3# (SETQ #2# (APPLY #'|PowerSeriesCategory;| #1#)))
               |PowerSeriesCategory;AL|))
      #2#)))) 

(DEFUN |PowerSeriesCategory;| (|t#1| |t#2| |t#3|)
  (SPROG ((#1=#:G695 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2| |t#3|)
                          (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)
                                (|devaluate| |t#3|)))
                    (COND (|PowerSeriesCategory;CAT|)
                          ('T
                           (LETT |PowerSeriesCategory;CAT|
                                 (|Join| (|AbelianMonoidRing| '|t#1| '|t#2|)
                                         (|VariablesCommuteWithCoefficients|)
                                         (|mkCategory|
                                          '(((|monomial| ($ $ |t#3| |t#2|)) T)
                                            ((|monomial|
                                              ($ $ (|List| |t#3|)
                                               (|List| |t#2|)))
                                             T)
                                            ((|leadingMonomial| ($ $)) T)
                                            ((|leadingCoefficient| (|t#1| $))
                                             T)
                                            ((|degree| (|t#2| $)) T)
                                            ((|variables| ((|List| |t#3|) $))
                                             T)
                                            ((|pole?| ((|Boolean|) $)) T)
                                            ((|complete| ($ $)) T))
                                          NIL
                                          '((|Boolean|) (|List| |t#3|)
                                            (|List| |t#2|))
                                          NIL))
                                 . #2=(|PowerSeriesCategory|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|PowerSeriesCategory| (|devaluate| |t#1|)
                         (|devaluate| |t#2|) (|devaluate| |t#3|)))))) 
