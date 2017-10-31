
(DEFPARAMETER |Module;CAT| 'NIL) 

(DECLAIM (NOTINLINE |Module;|)) 

(DEFPARAMETER |Module;AL| 'NIL) 

(DEFUN |Module| (#1=#:G691)
  (LET (#2=#:G692)
    (COND ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |Module;AL|)) (CDR #2#))
          (T
           (SETQ |Module;AL|
                   (|cons5| (CONS #3# (SETQ #2# (|Module;| #1#))) |Module;AL|))
           #2#)))) 

(DEFUN |Module;| (|t#1|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|Module;CAT|)
                                    ('T
                                     (LETT |Module;CAT|
                                           (|Join| (|BiModule| '|t#1| '|t#1|))
                                           . #2=(|Module|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|Module| (|devaluate| |t#1|)))))) 
