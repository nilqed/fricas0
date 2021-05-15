
(DEFPARAMETER |HopfAlgebra;CAT| 'NIL) 

(DECLAIM (NOTINLINE |HopfAlgebra;|)) 

(DEFPARAMETER |HopfAlgebra;AL| 'NIL) 

(DEFUN |HopfAlgebra| (|t#1| |t#2|)
  (LET (#1=#:G379 (#2=#:G380 (LIST (|devaluate| |t#1|) (|devaluate| |t#2|))))
    (COND ((SETQ #1# (|assoc| #2# |HopfAlgebra;AL|)) (CDR #1#))
          (T
           (SETQ |HopfAlgebra;AL|
                   (|cons5| (CONS #2# (SETQ #1# (APPLY #'|HopfAlgebra;| #2#)))
                            |HopfAlgebra;AL|))
           #1#)))) 

(DEFUN |HopfAlgebra;| (|t#1| |t#2|)
  (SPROG ((#1=#:G378 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (MAKE_PAIRS '(|t#1| |t#2|) (LIST |t#1| |t#2|))
                              (COND (|HopfAlgebra;CAT|)
                                    ('T
                                     (LETT |HopfAlgebra;CAT|
                                           (|Join| (|Bialgebra| '|t#1| '|t#2|)
                                                   (|mkCategory|
                                                    '(((|antipode| ($ $)) T))
                                                    NIL NIL NIL)))))))
           (SETELT #1# 0 (LIST '|HopfAlgebra| |t#1| |t#2|))))) 
