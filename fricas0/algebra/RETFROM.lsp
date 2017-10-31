
(DECLAIM (NOTINLINE |RetractableFrom;|)) 

(DEFPARAMETER |RetractableFrom;AL| 'NIL) 

(DEFUN |RetractableFrom| (#1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |RetractableFrom;AL|)) (CDR #2#))
     (T
      (SETQ |RetractableFrom;AL|
              (|cons5| (CONS #3# (SETQ #2# (|RetractableFrom;| #1#)))
                       |RetractableFrom;AL|))
      #2#)))) 

(DEFUN |RetractableFrom;| (|t#1|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (|Join|
                               (|mkCategory|
                                '(((|coerce| (|t#1| $)) T)
                                  ((|retractIfCan|
                                    ((|Union| $ "failed") |t#1|))
                                   T)
                                  ((|retract| ($ |t#1|)) T))
                                NIL 'NIL NIL)))
                   |RetractableFrom|)
           (SETELT #1# 0 (LIST '|RetractableFrom| (|devaluate| |t#1|)))))) 
