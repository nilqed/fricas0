
(DEFPARAMETER |LeftAlgebra;CAT| 'NIL) 

(DECLAIM (NOTINLINE |LeftAlgebra;|)) 

(DEFPARAMETER |LeftAlgebra;AL| 'NIL) 

(DEFUN |LeftAlgebra| (#1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |LeftAlgebra;AL|)) (CDR #2#))
     (T
      (SETQ |LeftAlgebra;AL|
              (|cons5| (CONS #3# (SETQ #2# (|LeftAlgebra;| #1#)))
                       |LeftAlgebra;AL|))
      #2#)))) 

(DEFUN |LeftAlgebra;| (|t#1|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|LeftAlgebra;CAT|)
                                    ('T
                                     (LETT |LeftAlgebra;CAT|
                                           (|Join| (|Ring|)
                                                   (|LeftModule| '|t#1|)
                                                   (|mkCategory|
                                                    '(((|coerce| ($ |t#1|)) T))
                                                    NIL 'NIL NIL))
                                           . #2=(|LeftAlgebra|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|LeftAlgebra| (|devaluate| |t#1|)))))) 
