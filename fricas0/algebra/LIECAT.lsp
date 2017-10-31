
(DEFPARAMETER |LieAlgebra;CAT| 'NIL) 

(DECLAIM (NOTINLINE |LieAlgebra;|)) 

(DEFPARAMETER |LieAlgebra;AL| 'NIL) 

(DEFUN |LieAlgebra| (#1=#:G691)
  (LET (#2=#:G692)
    (COND ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |LieAlgebra;AL|)) (CDR #2#))
          (T
           (SETQ |LieAlgebra;AL|
                   (|cons5| (CONS #3# (SETQ #2# (|LieAlgebra;| #1#)))
                            |LieAlgebra;AL|))
           #2#)))) 

(DEFUN |LieAlgebra;| (|t#1|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|LieAlgebra;CAT|)
                                    ('T
                                     (LETT |LieAlgebra;CAT|
                                           (|Join| (|Module| '|t#1|)
                                                   (|mkCategory|
                                                    '(((|construct| ($ $ $)) T)
                                                      ((/ ($ $ |t#1|))
                                                       (|has| |t#1|
                                                              (|Field|))))
                                                    NIL 'NIL NIL))
                                           . #2=(|LieAlgebra|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|LieAlgebra| (|devaluate| |t#1|)))))) 
