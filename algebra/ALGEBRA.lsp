
(DEFPARAMETER |Algebra;CAT| 'NIL) 

(DECLAIM (NOTINLINE |Algebra;|)) 

(DEFPARAMETER |Algebra;AL| 'NIL) 

(DEFUN |Algebra| (|t#1|)
  (LET (#1=#:G379 (#2=#:G380 (|devaluate| |t#1|)))
    (COND ((SETQ #1# (|assoc| #2# |Algebra;AL|)) (CDR #1#))
          (T
           (SETQ |Algebra;AL|
                   (|cons5| (CONS #2# (SETQ #1# (|Algebra;| #2#)))
                            |Algebra;AL|))
           #1#)))) 

(DEFUN |Algebra;| (|t#1|)
  (SPROG ((#1=#:G378 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (MAKE_PAIRS '(|t#1|) (LIST |t#1|))
                              (COND (|Algebra;CAT|)
                                    ('T
                                     (LETT |Algebra;CAT|
                                           (|Join| (|Ring|) (|Module| '|t#1|)
                                                   (|mkCategory|
                                                    '(((|coerce| ($ |t#1|)) T))
                                                    NIL NIL NIL)))))))
           (SETELT #1# 0 (LIST '|Algebra| |t#1|))))) 
