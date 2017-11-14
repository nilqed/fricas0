
(DECLAIM (NOTINLINE |TensorProductProperty;|)) 

(DEFPARAMETER |TensorProductProperty;AL| 'NIL) 

(DEFUN |TensorProductProperty| (&REST #1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluateList| #1#) |TensorProductProperty;AL|))
      (CDR #2#))
     (T
      (SETQ |TensorProductProperty;AL|
              (|cons5|
               (CONS #3# (SETQ #2# (APPLY #'|TensorProductProperty;| #1#)))
               |TensorProductProperty;AL|))
      #2#)))) 

(DEFUN |TensorProductProperty;| (|t#1| |t#2| |t#3| |t#4| |t#5|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2| |t#3| |t#4| |t#5|)
                          (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)
                                (|devaluate| |t#3|) (|devaluate| |t#4|)
                                (|devaluate| |t#5|)))
                    (|Join|
                     (|mkCategory|
                      '(((|eval| (|t#5| |t#4| (|Mapping| |t#5| |t#2| |t#3|)))
                         T))
                      NIL 'NIL NIL)))
                   |TensorProductProperty|)
           (SETELT #1# 0
                   (LIST '|TensorProductProperty| (|devaluate| |t#1|)
                         (|devaluate| |t#2|) (|devaluate| |t#3|)
                         (|devaluate| |t#4|) (|devaluate| |t#5|)))))) 
