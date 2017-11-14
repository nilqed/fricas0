
(DEFPARAMETER |Coalgebra;CAT| 'NIL) 

(DECLAIM (NOTINLINE |Coalgebra;|)) 

(DEFPARAMETER |Coalgebra;AL| 'NIL) 

(DEFUN |Coalgebra| (&REST #1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluateList| #1#) |Coalgebra;AL|)) (CDR #2#))
     (T
      (SETQ |Coalgebra;AL|
              (|cons5| (CONS #3# (SETQ #2# (APPLY #'|Coalgebra;| #1#)))
                       |Coalgebra;AL|))
      #2#)))) 

(DEFUN |Coalgebra;| (|t#1| |t#2|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2|)
                          (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)))
                    (COND (|Coalgebra;CAT|)
                          ('T
                           (LETT |Coalgebra;CAT|
                                 (|Join| (|Module| '|t#1|)
                                         (|mkCategory|
                                          '(((|coproduct| (|t#2| $)) T)
                                            ((|counit| (|t#1| $)) T))
                                          NIL 'NIL NIL))
                                 . #2=(|Coalgebra|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|Coalgebra| (|devaluate| |t#1|)
                         (|devaluate| |t#2|)))))) 
