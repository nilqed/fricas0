
(DEFPARAMETER |Evalable;CAT| 'NIL) 

(DECLAIM (NOTINLINE |Evalable;|)) 

(DEFPARAMETER |Evalable;AL| 'NIL) 

(DEFUN |Evalable| (#1=#:G691)
  (LET (#2=#:G692)
    (COND ((SETQ #2# (|assoc| #3=(|devaluate| #1#) |Evalable;AL|)) (CDR #2#))
          (T
           (SETQ |Evalable;AL|
                   (|cons5| (CONS #3# (SETQ #2# (|Evalable;| #1#)))
                            |Evalable;AL|))
           #2#)))) 

(DEFUN |Evalable;| (|t#1|)
  (SPROG ((#1=#:G690 NIL))
         (PROG1
             (LETT #1#
                   (|sublisV| (PAIR '(|t#1|) (LIST (|devaluate| |t#1|)))
                              (COND (|Evalable;CAT|)
                                    ('T
                                     (LETT |Evalable;CAT|
                                           (|Join|
                                            (|InnerEvalable| '|t#1| '|t#1|)
                                            (|mkCategory|
                                             '(((|eval|
                                                 ($ $ (|Equation| |t#1|)))
                                                T)
                                               ((|eval|
                                                 ($ $
                                                  (|List| (|Equation| |t#1|))))
                                                T))
                                             NIL
                                             '((|List| (|Equation| |t#1|))
                                               (|Equation| |t#1|))
                                             NIL))
                                           . #2=(|Evalable|)))))
                   . #2#)
           (SETELT #1# 0 (LIST '|Evalable| (|devaluate| |t#1|)))))) 
