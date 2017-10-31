
(DEFPARAMETER |Bialgebra;CAT| 'NIL) 

(DECLAIM (NOTINLINE |Bialgebra;|)) 

(DEFPARAMETER |Bialgebra;AL| 'NIL) 

(DEFUN |Bialgebra| (&REST #1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluateList| #1#) |Bialgebra;AL|)) (CDR #2#))
     (T
      (SETQ |Bialgebra;AL|
              (|cons5| (CONS #3# (SETQ #2# (APPLY #'|Bialgebra;| #1#)))
                       |Bialgebra;AL|))
      #2#)))) 

(DEFUN |Bialgebra;| (|t#1| |t#2|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2|)
                          (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)))
                    (COND (|Bialgebra;CAT|)
                          ('T
                           (LETT |Bialgebra;CAT|
                                 (|Join| (|Algebra| '|t#1|)
                                         (|Coalgebra| '|t#1| '|t#2|))
                                 . #2=(|Bialgebra|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|Bialgebra| (|devaluate| |t#1|)
                         (|devaluate| |t#2|)))))) 
