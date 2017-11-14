
(DEFPARAMETER |HopfAlgebra;CAT| 'NIL) 

(DECLAIM (NOTINLINE |HopfAlgebra;|)) 

(DEFPARAMETER |HopfAlgebra;AL| 'NIL) 

(DEFUN |HopfAlgebra| (&REST #1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluateList| #1#) |HopfAlgebra;AL|)) (CDR #2#))
     (T
      (SETQ |HopfAlgebra;AL|
              (|cons5| (CONS #3# (SETQ #2# (APPLY #'|HopfAlgebra;| #1#)))
                       |HopfAlgebra;AL|))
      #2#)))) 

(DEFUN |HopfAlgebra;| (|t#1| |t#2|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2|)
                          (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)))
                    (COND (|HopfAlgebra;CAT|)
                          ('T
                           (LETT |HopfAlgebra;CAT|
                                 (|Join| (|Bialgebra| '|t#1| '|t#2|)
                                         (|mkCategory|
                                          '(((|antipode| ($ $)) T)) NIL 'NIL
                                          NIL))
                                 . #2=(|HopfAlgebra|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|HopfAlgebra| (|devaluate| |t#1|)
                         (|devaluate| |t#2|)))))) 
