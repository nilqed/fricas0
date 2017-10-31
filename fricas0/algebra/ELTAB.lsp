
(DECLAIM (NOTINLINE |Eltable;|)) 

(DEFPARAMETER |Eltable;AL| 'NIL) 

(DEFUN |Eltable| (&REST #1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluateList| #1#) |Eltable;AL|)) (CDR #2#))
     (T
      (SETQ |Eltable;AL|
              (|cons5| (CONS #3# (SETQ #2# (APPLY #'|Eltable;| #1#)))
                       |Eltable;AL|))
      #2#)))) 

(DEFUN |Eltable;| (|t#1| |t#2|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2|)
                          (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)))
                    (|Join|
                     (|mkCategory| '(((|elt| (|t#2| $ |t#1|)) T)) NIL 'NIL
                                   NIL)))
                   |Eltable|)
           (SETELT #1# 0
                   (LIST '|Eltable| (|devaluate| |t#1|) (|devaluate| |t#2|)))))) 
