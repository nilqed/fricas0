
(DEFPARAMETER |FullyPatternMatchable;CAT| 'NIL) 

(DECLAIM (NOTINLINE |FullyPatternMatchable;|)) 

(DEFPARAMETER |FullyPatternMatchable;AL| 'NIL) 

(DEFUN |FullyPatternMatchable| (|t#1|)
  (LET (#1=#:G379 (#2=#:G380 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |FullyPatternMatchable;AL|)) (CDR #1#))
          (T
           (SETQ |FullyPatternMatchable;AL|
                   (|cons5|
                    (CONS #2# (SETQ #1# (|FullyPatternMatchable;| #2#)))
                    |FullyPatternMatchable;AL|))
           #1#)))) 

(DEFUN |FullyPatternMatchable;| (|t#1|)
  (SPROG ((#1=#:G378 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (MAKE_PAIRS '(|t#1|) (LIST |t#1|))
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
                                                                 NIL NIL)))))))
           (SETELT #1# 0 (LIST '|FullyPatternMatchable| |t#1|))))) 
