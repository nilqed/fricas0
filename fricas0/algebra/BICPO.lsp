
(DEFPARAMETER |BiCPO;CAT| 'NIL) 

(DECLAIM (NOTINLINE |BiCPO;|)) 

(DEFPARAMETER |BiCPO;AL| 'NIL) 

(DEFUN |BiCPO| (#1=#:G691)
  (LET (#2=#:G692)
    (COND ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |BiCPO;AL|)) (CDR #2#))
          (T
           (SETQ |BiCPO;AL|
                   (|cons5| (CONS #3# (SETQ #2# (|BiCPO;| #1#))) |BiCPO;AL|))
           #2#)))) 

(DEFUN |BiCPO;| (|t#1|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|BiCPO;CAT|)
                                    ('T
                                     (LETT |BiCPO;CAT|
                                           (|Join| (|Dcpo| '|t#1|)
                                                   (|CoDcpo| '|t#1|))
                                           . #2=(|BiCPO|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|BiCPO| (|devaluate| |t#1|)))))) 
