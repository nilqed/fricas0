
(DEFPARAMETER |PatternMatchable;CAT| 'NIL) 

(DECLAIM (NOTINLINE |PatternMatchable;|)) 

(DEFPARAMETER |PatternMatchable;AL| 'NIL) 

(DEFUN |PatternMatchable| (#1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |PatternMatchable;AL|))
      (CDR #2#))
     (T
      (SETQ |PatternMatchable;AL|
              (|cons5| (CONS #3# (SETQ #2# (|PatternMatchable;| #1#)))
                       |PatternMatchable;AL|))
      #2#)))) 

(DEFUN |PatternMatchable;| (|t#1|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|PatternMatchable;CAT|)
                                    ('T
                                     (LETT |PatternMatchable;CAT|
                                           (|Join| (|SetCategory|)
                                                   (|mkCategory|
                                                    '(((|patternMatch|
                                                        ((|PatternMatchResult|
                                                          |t#1| $)
                                                         $ (|Pattern| |t#1|)
                                                         (|PatternMatchResult|
                                                          |t#1| $)))
                                                       T))
                                                    NIL
                                                    '((|PatternMatchResult|
                                                       |t#1| $)
                                                      (|Pattern| |t#1|))
                                                    NIL))
                                           . #2=(|PatternMatchable|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|PatternMatchable| (|devaluate| |t#1|)))))) 
