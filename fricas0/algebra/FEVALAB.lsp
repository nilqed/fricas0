
(DECLAIM (NOTINLINE |FullyEvalableOver;|)) 

(DEFPARAMETER |FullyEvalableOver;AL| 'NIL) 

(DEFUN |FullyEvalableOver| (#1=#:G691)
  (LET (#2=#:G692)
    (COND
     ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |FullyEvalableOver;AL|))
      (CDR #2#))
     (T
      (SETQ |FullyEvalableOver;AL|
              (|cons5| (CONS #3# (SETQ #2# (|FullyEvalableOver;| #1#)))
                       |FullyEvalableOver;AL|))
      #2#)))) 

(DEFUN |FullyEvalableOver;| (|t#1|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (|Join|
                               (|mkCategory|
                                '(((|map| ($ (|Mapping| |t#1| |t#1|) $)) T))
                                '(((|Eltable| |t#1| $)
                                   (|has| |t#1| (|Eltable| |t#1| |t#1|)))
                                  ((|Evalable| |t#1|)
                                   (|has| |t#1| (|Evalable| |t#1|)))
                                  ((|InnerEvalable| (|Symbol|) |t#1|)
                                   (|has| |t#1|
                                          (|InnerEvalable| (|Symbol|) |t#1|))))
                                'NIL NIL)))
                   |FullyEvalableOver|)
           (SETELT #1# 0 (LIST '|FullyEvalableOver| (|devaluate| |t#1|)))))) 
