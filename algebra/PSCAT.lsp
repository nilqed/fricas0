
(DEFPARAMETER |PowerSeriesCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |PowerSeriesCategory;|)) 

(DEFPARAMETER |PowerSeriesCategory;AL| 'NIL) 

(DEFUN |PowerSeriesCategory| (|t#1| |t#2| |t#3|)
  (LET (#1=#:G384
        (#2=#:G385
         (LIST (|devaluate| |t#1|) (|devaluate| |t#2|) (|devaluate| |t#3|))))
    (COND ((SETQ #1# (|assoc| #2# |PowerSeriesCategory;AL|)) (CDR #1#))
          (T
           (SETQ |PowerSeriesCategory;AL|
                   (|cons5|
                    (CONS #2# (SETQ #1# (APPLY #'|PowerSeriesCategory;| #2#)))
                    |PowerSeriesCategory;AL|))
           #1#)))) 

(DEFUN |PowerSeriesCategory;| (|t#1| |t#2| |t#3|)
  (SPROG ((#1=#:G383 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (MAKE_PAIRS '(|t#1| |t#2| |t#3|) (LIST |t#1| |t#2| |t#3|))
                    (COND (|PowerSeriesCategory;CAT|)
                          ('T
                           (LETT |PowerSeriesCategory;CAT|
                                 (|Join| (|AbelianMonoidRing| '|t#1| '|t#2|)
                                         (|VariablesCommuteWithCoefficients|)
                                         (|mkCategory|
                                          '(((|leadingMonomial| ($ $)) T)
                                            ((|leadingCoefficient| (|t#1| $))
                                             T)
                                            ((|degree| (|t#2| $)) T)
                                            ((|pole?| ((|Boolean|) $)) T)
                                            ((|complete| ($ $)) T))
                                          NIL NIL NIL)))))))
           (SETELT #1# 0 (LIST '|PowerSeriesCategory| |t#1| |t#2| |t#3|))))) 
