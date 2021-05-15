
(DEFPARAMETER |FullyLinearlyExplicitOver;CAT| 'NIL) 

(DECLAIM (NOTINLINE |FullyLinearlyExplicitOver;|)) 

(DEFPARAMETER |FullyLinearlyExplicitOver;AL| 'NIL) 

(DEFUN |FullyLinearlyExplicitOver| (|t#1|)
  (LET (#1=#:G379 (#2=#:G380 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |FullyLinearlyExplicitOver;AL|)) (CDR #1#))
          (T
           (SETQ |FullyLinearlyExplicitOver;AL|
                   (|cons5|
                    (CONS #2# (SETQ #1# (|FullyLinearlyExplicitOver;| #2#)))
                    |FullyLinearlyExplicitOver;AL|))
           #1#)))) 

(DEFUN |FullyLinearlyExplicitOver;| (|t#1|)
  (SPROG ((#1=#:G378 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (MAKE_PAIRS '(|t#1|) (LIST |t#1|))
                              (COND (|FullyLinearlyExplicitOver;CAT|)
                                    ('T
                                     (LETT |FullyLinearlyExplicitOver;CAT|
                                           (|Join|
                                            (|LinearlyExplicitOver| '|t#1|)
                                            (|mkCategory| NIL
                                                          '(((|LinearlyExplicitOver|
                                                              (|Integer|))
                                                             (|has| |t#1|
                                                                    (|LinearlyExplicitOver|
                                                                     (|Integer|)))))
                                                          NIL NIL)))))))
           (SETELT #1# 0 (LIST '|FullyLinearlyExplicitOver| |t#1|))))) 
