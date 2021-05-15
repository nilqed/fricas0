
(DEFPARAMETER |IntervalCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |IntervalCategory;|)) 

(DEFPARAMETER |IntervalCategory;AL| 'NIL) 

(DEFUN |IntervalCategory| (|t#1|)
  (LET (#1=#:G380 (#2=#:G381 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |IntervalCategory;AL|)) (CDR #1#))
          (T
           (SETQ |IntervalCategory;AL|
                   (|cons5| (CONS #2# (SETQ #1# (|IntervalCategory;| #2#)))
                            |IntervalCategory;AL|))
           #1#)))) 

(DEFUN |IntervalCategory;| (|t#1|)
  (SPROG ((#1=#:G379 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (MAKE_PAIRS '(|t#1|) (LIST |t#1|))
                              (|sublisV|
                               (MAKE_PAIRS '(#2=#:G378) (LIST '(|Integer|)))
                               (COND (|IntervalCategory;CAT|)
                                     ('T
                                      (LETT |IntervalCategory;CAT|
                                            (|Join| (|GcdDomain|)
                                                    (|OrderedSet|)
                                                    (|TranscendentalFunctionCategory|)
                                                    (|RadicalCategory|)
                                                    (|RetractableTo| '#2#)
                                                    (|Approximate|)
                                                    (|mkCategory|
                                                     '(((|interval|
                                                         ($ |t#1| |t#1|))
                                                        T)
                                                       ((|qinterval|
                                                         ($ |t#1| |t#1|))
                                                        T)
                                                       ((|interval| ($ |t#1|))
                                                        T)
                                                       ((|interval|
                                                         ($
                                                          (|Fraction|
                                                           (|Integer|))))
                                                        T)
                                                       ((|inf| (|t#1| $)) T)
                                                       ((|sup| (|t#1| $)) T)
                                                       ((|width| (|t#1| $)) T)
                                                       ((|positive?|
                                                         ((|Boolean|) $))
                                                        T)
                                                       ((|negative?|
                                                         ((|Boolean|) $))
                                                        T)
                                                       ((|contains?|
                                                         ((|Boolean|) $ |t#1|))
                                                        T))
                                                     NIL NIL NIL))))))))
           (SETELT #1# 0 (LIST '|IntervalCategory| |t#1|))))) 
