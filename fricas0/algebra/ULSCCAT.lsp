
(DEFPARAMETER |UnivariateLaurentSeriesConstructorCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |UnivariateLaurentSeriesConstructorCategory;|)) 

(DEFPARAMETER |UnivariateLaurentSeriesConstructorCategory;AL| 'NIL) 

(DEFUN |UnivariateLaurentSeriesConstructorCategory| (&REST #1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2#
              (|assoc| #3=(|devaluateList| #1#)
                       |UnivariateLaurentSeriesConstructorCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |UnivariateLaurentSeriesConstructorCategory;AL|
              (|cons5|
               (CONS #3#
                     (SETQ #2#
                             (APPLY
                              #'|UnivariateLaurentSeriesConstructorCategory;|
                              #1#)))
               |UnivariateLaurentSeriesConstructorCategory;AL|))
      #2#)))) 

(DEFUN |UnivariateLaurentSeriesConstructorCategory;| (|t#1| |t#2|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2|)
                          (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)))
                    (COND (|UnivariateLaurentSeriesConstructorCategory;CAT|)
                          ('T
                           (LETT
                            |UnivariateLaurentSeriesConstructorCategory;CAT|
                            (|Join| (|UnivariateLaurentSeriesCategory| '|t#1|)
                                    (|RetractableTo| '|t#2|)
                                    (|mkCategory|
                                     '(((|laurent| ($ (|Integer|) |t#2|)) T)
                                       ((|degree| ((|Integer|) $)) T)
                                       ((|taylorRep| (|t#2| $)) T)
                                       ((|removeZeroes| ($ $)) T)
                                       ((|removeZeroes| ($ (|Integer|) $)) T)
                                       ((|coerce| ($ |t#2|)) T)
                                       ((|taylor| (|t#2| $)) T)
                                       ((|taylorIfCan|
                                         ((|Union| |t#2| "failed") $))
                                        T))
                                     '(((|QuotientFieldCategory| |t#2|)
                                        (|has| |t#1| (|Field|))))
                                     '((|Integer|)) NIL))
                            . #2=(|UnivariateLaurentSeriesConstructorCategory|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|UnivariateLaurentSeriesConstructorCategory|
                         (|devaluate| |t#1|) (|devaluate| |t#2|)))))) 
