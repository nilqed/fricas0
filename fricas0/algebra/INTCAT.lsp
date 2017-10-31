
(DEFPARAMETER |IntervalCategory;CAT| 'NIL) 

(DECLAIM (NOTINLINE |IntervalCategory;|)) 

(DEFPARAMETER |IntervalCategory;AL| 'NIL) 

(DEFUN |IntervalCategory| (#1=#:G694)
  (LET (#2=#:G695)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |IntervalCategory;AL|))
      (CDR #2#))
     (T
      (SETQ |IntervalCategory;AL|
              (|cons5| (CONS #3# (SETQ #2# (|IntervalCategory;| #1#)))
                       |IntervalCategory;AL|))
      #2#)))) 

(DEFUN |IntervalCategory;| (|t#1|)
  (SPROG ((#1=#:G693 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (|sublisV|
                               (PAIR '(#2=#:G692) (LIST '(|Integer|)))
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
                                                     NIL
                                                     '((|Boolean|)
                                                       (|Fraction|
                                                        (|Integer|)))
                                                     NIL))
                                            . #3=(|IntervalCategory|))))))
                   . #3#)
           (SETELT #1# 0 (LIST '|IntervalCategory| (|devaluate| |t#1|)))))) 
