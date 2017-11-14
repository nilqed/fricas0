
(DEFPARAMETER |BiModule;CAT| 'NIL) 

(DECLAIM (NOTINLINE |BiModule;|)) 

(DEFPARAMETER |BiModule;AL| 'NIL) 

(DEFUN |BiModule| (&REST #1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluateList| #1#) |BiModule;AL|)) (CDR #2#))
     (T
      (SETQ |BiModule;AL|
              (|cons5| (CONS #3# (SETQ #2# (APPLY #'|BiModule;| #1#)))
                       |BiModule;AL|))
      #2#)))) 

(DEFUN |BiModule;| (|t#1| |t#2|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV|
                    (PAIR '(|t#1| |t#2|)
                          (LIST (|devaluate| |t#1|) (|devaluate| |t#2|)))
                    (COND (|BiModule;CAT|)
                          ('T
                           (LETT |BiModule;CAT|
                                 (|Join| (|LeftModule| '|t#1|)
                                         (|RightModule| '|t#2|))
                                 . #2=(|BiModule|)))))
                   . #2#)
           (SETELT #1# 0
                   (LIST '|BiModule| (|devaluate| |t#1|)
                         (|devaluate| |t#2|)))))) 
