
(DEFPARAMETER |GradedAlgebra;CAT| 'NIL) 

(DECLAIM (NOTINLINE |GradedAlgebra;|)) 

(DEFPARAMETER |GradedAlgebra;AL| 'NIL) 

(DEFUN |GradedAlgebra| (&REST #1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluateList| #1#) |GradedAlgebra;AL|))
      (CDR #2#))
     (T
      (SETQ |GradedAlgebra;AL|
              (|cons5| (CONS #3# (SETQ #2# (APPLY #'|GradedAlgebra;| #1#)))
                       |GradedAlgebra;AL|))
      #2#)))) 

(DEFUN |GradedAlgebra;| (|t#1| |t#2|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2|)
                          (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)))
                    (COND (|GradedAlgebra;CAT|)
                          ('T
                           (LETT |GradedAlgebra;CAT|
                                 (|Join| (|GradedModule| '|t#1| '|t#2|)
                                         (|RetractableTo| '|t#1|)
                                         (|mkCategory|
                                          '(((|One| ($) |constant|) T)
                                            ((|product| ($ $ $)) T))
                                          NIL 'NIL NIL))
                                 . #2=(|GradedAlgebra|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|GradedAlgebra| (|devaluate| |t#1|)
                         (|devaluate| |t#2|)))))) 
