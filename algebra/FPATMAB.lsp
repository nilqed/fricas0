
(DEFPARAMETER |FullyPatternMatchable;CAT| 'NIL) 

(DECLAIM (NOTINLINE |FullyPatternMatchable;|)) 

(DEFPARAMETER |FullyPatternMatchable;AL| 'NIL) 

(DEFUN |FullyPatternMatchable| (#1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |FullyPatternMatchable;AL|))
      (CDR #2#))
     (T
      (SETQ |FullyPatternMatchable;AL|
              (|cons5| (CONS #3# (SETQ #2# (|FullyPatternMatchable;| #1#)))
                       |FullyPatternMatchable;AL|))
      #2#)))) 

(DEFUN |FullyPatternMatchable;| (|t#1|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|FullyPatternMatchable;CAT|)
                                    ('T
                                     (LETT |FullyPatternMatchable;CAT|
                                           (|Join| (|Type|)
                                                   (|mkCategory| NIL
                                                                 '(((|PatternMatchable|
                                                                     (|Integer|))
                                                                    (|has|
                                                                     |t#1|
                                                                     (|PatternMatchable|
                                                                      (|Integer|))))
                                                                   ((|PatternMatchable|
                                                                     (|Float|))
                                                                    (|has|
                                                                     |t#1|
                                                                     (|PatternMatchable|
                                                                      (|Float|)))))
                                                                 'NIL NIL))
                                           . #2=(|FullyPatternMatchable|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|FullyPatternMatchable| (|devaluate| |t#1|)))))) 
