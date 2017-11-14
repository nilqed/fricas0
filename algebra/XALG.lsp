
(DEFPARAMETER |XAlgebra;CAT| 'NIL) 

(DECLAIM (NOTINLINE |XAlgebra;|)) 

(DEFPARAMETER |XAlgebra;AL| 'NIL) 

(DEFUN |XAlgebra| (#1=#:G691)
  (LET (#2=#:G692)
    (COND ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |XAlgebra;AL|)) (CDR #2#))
          (T
           (SETQ |XAlgebra;AL|
                   (|cons5| (CONS #3# (SETQ #2# (|XAlgebra;| #1#)))
                            |XAlgebra;AL|))
           #2#)))) 

(DEFUN |XAlgebra;| (|t#1|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|XAlgebra;CAT|)
                                    ('T
                                     (LETT |XAlgebra;CAT|
                                           (|Join| (|Ring|)
                                                   (|BiModule| '|t#1| '|t#1|)
                                                   (|mkCategory|
                                                    '(((|coerce| ($ |t#1|)) T))
                                                    '(((|Algebra| |t#1|)
                                                       (|has| |t#1|
                                                              (|CommutativeRing|))))
                                                    'NIL NIL))
                                           . #2=(|XAlgebra|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|XAlgebra| (|devaluate| |t#1|)))))) 
