
(DEFPARAMETER |FunctionSpace;CAT| 'NIL) 

(DECLAIM (NOTINLINE |FunctionSpace;|)) 

(DEFPARAMETER |FunctionSpace;AL| 'NIL) 

(DEFUN |FunctionSpace| (|t#1|)
  (LET (#1=#:G2 (#2=#:G3 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |FunctionSpace;AL|)) (CDR #1#))
          (T
           (SETQ |FunctionSpace;AL|
                   (|cons5| (CONS #2# (SETQ #1# (|FunctionSpace;| #2#)))
                            |FunctionSpace;AL|))
           #1#)))) 

(DEFUN |FunctionSpace;| (|t#1|)
  (SPROG ((#1=#:G1 NIL))
         (PROG1
             (LETT #1#
                   (|subst_in_cat| '(|t#1|) (LIST |t#1|)
                                   (|subst_in_cat| '(#2=#:G0)
                                                   (LIST '(|Kernel| %))
                                                   (COND (|FunctionSpace;CAT|)
                                                         ('T
                                                          (LETT
                                                           |FunctionSpace;CAT|
                                                           (|Join|
                                                            (|FunctionSpace2|
                                                             '|t#1| '#2#)
                                                            (|ExpressionSpace|))))))))
           (SETELT #1# 0 (LIST '|FunctionSpace| |t#1|))))) 
